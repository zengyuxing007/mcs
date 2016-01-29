----------------------------------------
--$Id: gamemgr.lua 4082 2014-05-19 02:44:03Z zork $
----------------------------------------
--[[
-- 游戏管理菜单下面的子菜单处理逻辑
--
--]]
--激活码长度
local CDKEY_NUM = 10

--cd key生成页面
function KeyGenShow(self)
	local Options = GetQueryArgs()
	local ActivityMap = CDKeyActivityData:GetActivityMap()
	local Platforms = CommonFunc.GetPlatformList()
	local KeyTypes = CommonData.KeyTypes
	local ActivityList = CDKeyActivityData:Get({ID = Options.ActivityID})
	local Titles = {"生成时间", "活动名称", "平台", "使用类型", "生成数量", "有效期", "奖励列表", }
	if Options.Submit ~= "导出" then
		table.insert(Titles, "激活码")
	end
	local TitleTips = {}
	TitleTips[5] = "总数(有效/无效)"
	local TableData = {}
	for _, ActivityData in ipairs(ActivityList) do
		local Data = {}
		table.insert(Data, ActivityData.SubmitTime)
		table.insert(Data, ActivityData.Name)
		table.insert(Data, Platforms[ActivityData.PlatformID] or "全部")
		table.insert(Data, KeyTypes[ActivityData.KeyType])
		local ValidNum, UnValidNum = self:GetKeyNumInfo(ActivityData.ID)
		local NumStr = ""
		if Options.Submit ~= "导出" then
			NumStr = ActivityData.KeyNum .. "(<font color='green'>" .. ValidNum 
				.. "</font>/<font color='red'>" .. UnValidNum .. "</font>)"
		else
			NumStr = ActivityData.KeyNum .. "(" .. ValidNum .. "/" .. UnValidNum .. ")"
		end
		table.insert(Data, NumStr)
		table.insert(Data, ActivityData.StartTime .. "至" .. ActivityData.EndTime)
		local RewardStr = self:GetKeyReward(ActivityData.Rewards)
		table.insert(Data, RewardStr)
		if Options.Submit ~= "导出" then
			local Url = '<a href="/gamemgr/keyexport?Name=' .. ActivityData.Name .. '&ID='..ActivityData.ID..'">导出</a>'
			Url = Url .. '&nbsp&nbsp<a href="#" onclick="AbortKey(\''..ActivityData.ID .. "','" .. ActivityData.Name .. '\')">全部失效</a>'
			table.insert(Data, Url)
		end
		table.insert(TableData, Data)
	end
	if Options.Submit == "导出" then
		local ExcelStr = CommonFunc.ExportExcel("CDKey活动列表.xls", Titles, TableData)
		ngx.say(ExcelStr)
		return
	end
	local DataTable = {
		["ID"] = "logTable",
		["DisplayLength"] = 50,
	}
	local Params = {
		Options = Options,
		Platforms = Platforms,
		Servers = Servers,
		Filters = Filters,
		TableData = TableData,
		Titles = Titles,
		DataTable = DataTable,
		ActivityMap = ActivityMap,
		TitleTips = TitleTips,
	}
	Viewer:View("template/game/keyGenShow.html", Params)
end

--cd key生成界面提交
function DoKeygen(self)
	local Results = {}
	local ActivityID = nil
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		local User = UserData:GetUserById(GetSession("UserId"))
		Args.Operator = User and User["account"] or ""
		--序列号奖励信息
		Args.Rewards = self:SerializeRewards(Args)
		ActivityID = CDKeyActivityData:Insert(Args) --将激活码活动信息记录入库
		if ActivityID then
			--生成激活码
			local KeyMap = self:GenerateKeys(ActivityID, Args.KeyNum)
			for CDKey, _ in pairs(KeyMap) do
				CDKeyData:Insert({ActivityID=ActivityID,CDKey=CDKey})
			end
		end
		self:KeyGenShow(ActivityID)
	else
		local Platforms = CommonFunc.GetPlatformList()
		--使用类型
		local KeyTypes = CommonData.KeyTypes
		local ItemStrList = {}
		for ItemID, ItemName in pairs(ItemDataMap or {}) do
			table.insert(ItemStrList, "'" .. ItemName .. "_" .. ItemID .. "'")
		end
		local Params = {
			Platforms = Platforms,
			KeyTypes = KeyTypes,
			ItemStrList = ItemStrList,
		}
		Viewer:View("template/game/keyGenerate.html", Params)
	end
	
end

--序列化奖励消息
function SerializeRewards(self, Args)
	local Gold = tonumber(Args.Gold) or 0
--	local CreditGold = tonumber(Args.CreditGold) or 0
	local Money = tonumber(Args.Money) or 0
	--获得道具
	local Items = Args.Item
	local Numbers = Args.Numbers
	--拼接成字符串
	local ItemList = {}
	if type(Items) == "table" then
		for Idx, ItemID in ipairs(Items) do
			ItemID = self:GetItemID(ItemID)
			if ItemID ~= "" and tonumber(ItemID) then
				ItemID = tonumber(ItemID)
				local Number = tonumber(Numbers[Idx]) or 1
				table.insert(ItemList, ItemID)
				table.insert(ItemList, Number)
			end
		end
	else
		local Items = self:GetItemID(Items)
		table.insert(ItemList, Items)
		table.insert(ItemList, tonumber(Numbers) or 1)
	end
	local ItemStr = table.concat(ItemList, ",")
	local Rewards = {
		Gold = Gold,
--		CreditGold = CreditGold,
		Money = Money,
		Item = ItemStr,
	}
	return Serialize(Rewards)
end

--获得ItemID
function GetItemID(self, ItemStr)
	local Array = string.split(ItemStr, "_")
	if #Array >= 2 then
		return Array[2]
	else
		return Array[1]
	end
end

--生成数量为KeyNum的激活码
function GenerateKeys(self, ActivityID, KeyNum)
	--先根据ActivityID生成激活码的前2位
	local ActivityID = tonumber(ActivityID)
	
	local NewKeyMap = {}
	local X = 1
	local Pre2Key = self:GetPre2Key(ActivityID)	
	while X <= tonumber(KeyNum) do
		local Key = self:GenerateKey()
		Key = Pre2Key .. Key
		--不能与之前的重复，同时也不能与这一批生成的重复
		if not NewKeyMap[Key] then
			NewKeyMap[Key] = true
			X = X + 1
		end
	end
	return NewKeyMap
end

local Chars = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D',
	'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L','M', 'N', 'O',
	'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y','Z'}

--生成激活码的前2位
function GetPre2Key(self, ActivityID)
	local ActivityID = tonumber(ActivityID)
	local Len = #Chars
	local Floor1 = math.floor(ActivityID/Len)
	local Pre1 = Chars[Floor1+1] --十位上的值
	local Prefix = ActivityID%Len
	local Pre2 = Chars[Prefix+1]
	return Pre1 .. Pre2
end

--生成激活码
function GenerateKey(self)
	local Len = #Chars
	local Key = ""
	for X = 1, CDKEY_NUM-2 do
		local Index = math.random(1, Len)
		Key = Key .. Chars[Index]
	end
	return Key
end

--获得奖励名称列表
function GetKeyReward(self, RewardStr)
	--反序列化奖励内容
	local Rewards = UnSerialize(RewardStr)
	local NewRewards = {}
	for Type, RewardInfo in pairs(Rewards or {}) do
		local TypeName = CommonData.RewardMap[Type]
		if Type == "Item" then --如果是物品还需要把物品ID转换为物品名称
			NewRewards[TypeName] = {}
			RewardInfo = string.split(RewardInfo, ",")
			local Len = #RewardInfo
			local X = 1
			while X < Len do
				local ItemID = RewardInfo[X]
				local Num = RewardInfo[X+1] or 1
				local ItemName = ItemDataMap[tonumber(ItemID)]
				if ItemName then
					NewRewards[TypeName][ItemName] = Num
				end
				X = X + 2
			end
		else
			NewRewards[TypeName] = RewardInfo --其他类型的直接赋值即可
		end
	end
	return Serialize(NewRewards)
end

--获得激活码数量详细信息(有效：M个，无效:N个)
function GetKeyNumInfo(self, ActivityID)
	local CDKeyList = CDKeyData:Get({ActivityID = ActivityID})
	--还要判断有效时间是否已经失效
	local ActivityInfo = CDKeyActivityData:Get({ID = ActivityID})
	if ActivityInfo and ActivityInfo[1] then
		local NowTime = ngx.time()
		if GetTimeStamp(ActivityInfo[1].EndTime) < NowTime or GetTimeStamp(ActivityInfo[1].StartTime) > NowTime then
			--已经过期
			return 0, #CDKeyList
		end
	end
	local ValidNum = 0
	local UnValidNum = 0
	for _, CDKEYInfo in ipairs(CDKeyList) do
		if CDKEYInfo.IsValid == 1 then --未兑换，有效
			ValidNum = ValidNum + 1
		else
			UnValidNum = UnValidNum + 1
		end
	end
	return ValidNum, UnValidNum
end

--导出激活码
function KeyExport(self)
	local ActivityID = GetQueryArg("ID")
	local ActivityName = GetQueryArg("Name")
	local Titles = {"激活码", "状态"}
	local TableData = {}
	if ActivityID and ActivityID ~= "" then
		--还要判断有效时间是否已经过期
		local ActivityInfo = CDKeyActivityData:Get({ID = ActivityID})
		local ExpireFlag = false
		if ActivityInfo and ActivityInfo[1] then
			local NowTime = ngx.time()
			if GetTimeStamp(ActivityInfo[1].EndTime) < NowTime or GetTimeStamp(ActivityInfo[1].StartTime) > NowTime then
				--已经过期
				ExpireFlag = true
			end
		end
		local CDKeyList = CDKeyData:Get({ActivityID = ActivityID})
		if CDKeyList and #CDKeyList > 0 then
			for _, CDKey in ipairs(CDKeyList) do
				local Data = {}
				table.insert(Data, CDKey.CDKey)
				local Status = "无效"
				if not ExpireFlag and CDKey.IsValid == 1 then
					Status = "有效"
				end
				table.insert(Data, Status)
				table.insert(TableData, Data)
			end
		end
	end
	local ExcelStr = CommonFunc.ExportExcel(ActivityName .. "激活码.xls", Titles, TableData)
	ngx.say(ExcelStr)
end

--废除激活码
function AbortKey(self)
	if ngx.var.request_method == "POST" then
		local Args = GetPostArgs()
		CDKeyData:AbortKey(Args)
		ngx.say("1")
		return 
	else
		ngx.say("0")
	end
end

--cd key查询
function KeySelect(self)
	local Options = GetQueryArgs()
	local Platforms = CommonFunc.GetPlatformList()
	--展示数据
	local Titles = {"CDKEY", "状态", "所属活动", "有效时间", "奖励内容", "兑换人角色ID", "兑换人账号", 
			"兑换人所在平台", "兑换人所在服", "兑换时间"}
	local TableData = {}
	if self:IsnotEmpty(Options.CDKey) or self:IsnotEmpty(Options.Uid) then
		local Platforms = CommonFunc.GetPlatformList()
		local ServerPlatformMap = ServerData:GetServerPlatformMap()
		local ServerList = ServerData:GetAllServers()
		local NewServers = {}
		for _, Server in ipairs(ServerList) do
			NewServers[Server.hostid] = Server.name
		end
		local CDKeyInfos = CDKeyData:GetKeyInfo(Options.CDKey, Options.Uid)
		for _, CDKeyInfo in ipairs(CDKeyInfos or {}) do
			--获得活动名称
			local ActivityInfo = CDKeyActivityData:Get({ID = CDKeyInfo.ActivityID})
			if ActivityInfo and ActivityInfo[1] then
			   local NowTime = ngx.time()
			    if GetTimeStamp(ActivityInfo[1].EndTime) < NowTime or GetTimeStamp(ActivityInfo[1].StartTime) > NowTime then
			            CDKeyInfo.IsValid = 0
			    end
			    ActivityInfo = ActivityInfo[1]
			end
			local Data = {}
			table.insert(Data, CDKeyInfo.CDKey)
			table.insert(Data, CDKeyInfo.IsValid and CDKeyInfo.IsValid == 1 and "可用" or "不可用")
			table.insert(Data, ActivityInfo.Name or "")
			table.insert(Data, ActivityInfo.StartTime .. "至" .. ActivityInfo.EndTime)
			table.insert(Data, self:GetKeyReward(ActivityInfo.Rewards))
			table.insert(Data, CDKeyInfo.Uid or "")
			table.insert(Data, CDKeyInfo.Urs or "")
			local HostName = ""
			local PlatformName = ""
			if CDKeyInfo.HostID and CDKeyInfo.HostID ~= 0 then
				local PlatformID = ServerPlatformMap[CDKeyInfo.HostID]
				PlatformName = Platforms[PlatformID] or ""
				HostName = NewServers[CDKeyInfo.HostID]
			end
			table.insert(Data, PlatformName)
			table.insert(Data, HostName)
			table.insert(Data, CDKeyInfo.ExchangeTime or "")
			table.insert(TableData, Data)
		end
	end
	local DataTable = {
		["ID"] = "logTable",
		["NoDivPage"] = true,
	}
	local Params = {
		Options = Options,
		Platforms = Platforms,
		Titles = Titles,
		TableData = TableData,
		DataTable = DataTable,
	}
	Viewer:View("template/game/keySelect.html", Params)
end

function IsnotEmpty(self, Arg)
	if Arg and Arg ~= "" then
		return true
	else
		return false
	end
end

DoRequest()