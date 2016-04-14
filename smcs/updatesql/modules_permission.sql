-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: smcs
-- ------------------------------------------------------
-- Server version	5.1.73

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `modules` (
  `name` varchar(20) NOT NULL,
  `uri` varchar(30) DEFAULT NULL,
  `module` varchar(255) DEFAULT NULL,
  `procfunc` varchar(30) DEFAULT NULL,
  `parent` varchar(20) DEFAULT NULL,
  `isshow` varchar(10) DEFAULT NULL,
  `descinfo` varchar(120) DEFAULT NULL,
  `IsLog` int(11) DEFAULT '0' COMMENT 'æ˜¯å¦è®°å½•log',
  `system` varchar(64) DEFAULT '' COMMENT 'é€‚ç”¨ç³»ç»Ÿ',
  `sortID` int(11) DEFAULT '1' COMMENT 'æŽ’åºID',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
INSERT INTO `modules` VALUES ('CDKEY导出','gamemgr/keyexport','modules/game/keymgr.lua','KeyExport','游戏管理','false','',0,'oss',1),('CDKEY查询','gamemgr/keyselect','modules/game/keymgr.lua','KeySelect','游戏管理','true','',0,'oss',2),('CDKEY生成','gamemgr/keygen','modules/game/keymgr.lua','KeyGenShow','游戏管理','true','',0,'oss',1),('CDKEY生成提交','gamemgr/dokeygen','modules/game/keymgr.lua','DoKeygen','游戏管理','false','',1,'oss',1),('GM接口功能','','','','','true','供游戏或其它工具使用的接口',0,'',8),('GM操作','playermgr/gmexecuteshow','modules/player/gmmgr.lua','GMShow','玩家管理','true','',0,'oss',2),('GM操作列表','gmmgr/operationlist','modules/gm/gmmgr.lua','GMOperationList','GM接口功能','true','GM操作列表',0,'',1),('GM操作删除','gmmgr/operationdelete','modules/gm/gmmgr.lua','GMOperationDelete','GM接口功能','false','GM操作删除',0,'',1),('GM操作提交','gmmgr/operationpost','modules/gm/gmmgr.lua','GMOperationPost','GM接口功能','false','GM操作提交',0,'',1),('GM操作结果','gmmgr/operationresult','modules/gm/gmmgr.lua','GMOperationResult','GM接口功能','false','GM操作结果',0,'',1),('GM操作编辑','gmmgr/operationedit','modules/gm/gmmgr.lua','GMOperationEdit','GM接口功能','false','GM操作编辑',0,'',1),('GM规则列表','gmmgr/rulelist','modules/gm/gmmgr.lua','ReqRuleList','GM接口功能','true','GM规则列表',0,'',1),('GM规则删除','gmmgr/ruledelete','modules/gm/gmmgr.lua','RuleDelete','GM接口功能','false','GM规则删除',0,'',1),('GM规则编辑','gmmgr/ruleedit','modules/gm/gmmgr.lua','RuleEdit','GM接口功能','false','GM规则编辑',0,'',1),('GM运营操作提交','playermgr/gmexecute','modules/player/gmmgr.lua','DoGM','玩家管理','false','',1,'oss',1),('GM预览提交','gmmgr/previewpost','modules/gm/gmmgr.lua','GMPreviewPost','GM接口功能','false','GM预览提交',0,'',1),('json格式服务器列表','servermgr/jsonserverlist','modules/server/servermgr.lua','GetJsonServer','服务器及分区管理','false','json格式服务器列表',0,'oss',1),('VIP用户统计','ossmgr/vipstatics','modules/oss/oss_pay_mgr.lua','VipStatics','运营数据','true','',0,'oss',8),('修改分区','servermgr/domodgroup','modules/server/servermgr.lua','DoModifyGroup','服务器及分区管理','false','修改分区名字和顺序',0,'',1),('修改区分类信息','servermgr/domodifygrpcls','modules/server/servermgr.lua','DoModifyGrpCls','服务器及分区管理','false','',0,'',1),('修改服务器信息','servermgr/domodserver','modules/server/servermgr.lua','DoModifyServer','服务器及分区管理','false','修改服务器信息',0,'',1),('修改服务器标签','servermgr/domodservertag','modules/server/servermgr.lua','ModSvr2Tag','服务器及分区管理','false','服务器从标签中添加或移除',0,'',1),('修改模块','admin/modulemod','admin/funcmgr.lua','DoAdminModify','模块管理','false','修改模块操作',0,'',1),('修改账号','usermgr/reqmod','admin/usermgr.lua','ReqModifyUser','角色权限管理','false','修改账号',0,'oss',1),('修改账号_执行','usermgr/domod','admin/usermgr.lua','DoModifyUser','角色权限管理','false','执行修改账号操作',0,'oss',1),('修改账号角色','admin/adduserrole','admin/permissionmgr.lua','AddUserToGroups','角色权限管理','false','修改账号对应角色数据',0,'oss',1),('充值对账','ossmgr/payverify','modules/oss/oss_pay_mgr.lua','PayVerify','运营数据','true','',0,'oss',7),('充值数据','ossmgr/paydata','modules/oss/oss_pay_mgr.lua','PayData','运营数据','true','',0,'oss',2),('公告删除','gamemgr/broadcastdelete','modules/game/broadcastmgr.lua','BroadcastDelete','游戏管理','false','',1,'oss',1),('公告定时操作','cron/cron_broadcast','modules/cron/cron_broadcast_mgr.lua','CronExecute','','false','',0,'',1),('公告管理','gamemgr/broadcastshow','modules/game/broadcastmgr.lua','BroadcastShow','游戏管理','true','',0,'oss',3),('公告结果展示','gamemgr/broadcastresult','modules/game/broadcastmgr.lua','BroadcastResult','游戏管理','false','',0,'oss',1),('公告编辑','gamemgr/broadcastedit','modules/game/broadcastmgr.lua','BroadcastEdit','游戏管理','false','',0,'oss',1),('分区信息管理','servermgr/grouplist','modules/server/servermgr.lua','ReqGroupList','服务器及分区管理','true','分区配置管理',0,'',1),('分区服务器管理','servermgr/groupserverlist','modules/server/servermgr.lua','ReqServerGroupInfo','服务器及分区管理','true','显示分区服务器信息',0,'',1),('删除分区','servermgr/dodelgroup','modules/server/servermgr.lua','DoDelGroup','服务器及分区管理','false','删除分区',0,'',1),('删除平台','platformmgr/delete','modules/platform/platformmgr.lua','DoDelPlatform','服务器及分区管理','false','删除平台',0,'',1),('删除服务器','servermgr/dodelserver','modules/server/servermgr.lua','DoDelServer','服务器及分区管理','false','删除服务器',0,'',1),('删除服务器操作','serviceopermgr/delete','modules/server/serveroperationmgr.lua','Delete','服务器及分区管理','false','删除服务器操作',1,'',1),('删除模块','admin/moduledel','admin/funcmgr.lua','DoAdminDel','模块管理','false','删除模块',0,'',1),('删除角色','admin/delrole','admin/permissionmgr.lua','DoDelGroup','角色权限管理','false','删除角色',0,'oss',1),('删除账号','usermgr/dodel','admin/usermgr.lua','DoDelUser','角色权限管理','false','删除账号',0,'oss',1),('删除跨服配置','croservermgr/delete','modules/server/croservermgr.lua','DeleteCroServer','服务器及分区管理','false','删除跨服配置',0,'',1),('功能模块','admin/modulelist','admin/funcmgr.lua','ReqAdminList','模块管理','true','',0,'',1),('历史在线','ossmgr/onlinehistory','modules/oss/ossmgr.lua','OnlineHistroy','运营数据','true','',0,'oss',13),('历史注册','ossmgr/reghistory','modules/oss/ossmgr.lua','RegHistory','运营数据','true','',0,'oss',14),('发布标签修改','servermgr/domodgrpcls','modules/server/servermgr.lua','DoModGrpCls','服务器及分区管理','false','修改发布标签信息',0,'',1),('发布标签删除','servermgr/dodelgrpcls','modules/server/servermgr.lua','DoDelGrpCls','服务器及分区管理','false','',0,'',1),('发布标签管理','servermgr/doshowgrpclslist','modules/server/servermgr.lua','DoShowGrpClsList','服务器及分区管理','true','发布标签分组信息',0,'',1),('发布版本_删除_执行','publishmgr/dodelversion','modules/publish/publishmgr.lua','DoDelVersion','版本发布管理','false','删除已发布版本记录',1,'',1),('发布版本_添加','publishmgr/reqaddversion','modules/publish/publishmgr.lua','ReqAddVersion','版本发布管理','false','添加发布版本界面',0,'',1),('发布版本_添加_执行','publishmgr/doaddversion','modules/publish/publishmgr.lua','DoAddVersion','版本发布管理','false','执行添加发布版本',1,'',1),('在线时长','ossmgr/onlinetime','modules/oss/ossmgr.lua','OnlineTime','运营数据','true','',0,'oss',1),('失效CDKEY','gamemgr/keyabort','modules/game/keymgr.lua','AbortKey','游戏管理','false','',1,'oss',1),('实时充值','datamgr/pay','modules/data/datamgr.lua','PayStatics','实时数据','true','',0,'oss',1),('实时在线','datamgr/online','modules/data/datamgr.lua','OnlineStatics','实时数据','true','',0,'oss',1),('实时数据','','','','','true','',0,'oss',1),('实时注册','datamgr/register','modules/data/datamgr.lua','RegStatics','实时数据','true','',0,'oss',1),('导出分区','croservermgr/exportzone','modules/server/croservermgr.lua','ExportZone','服务器及分区管理','false','导出分区',0,'',1),('平台管理','platformmgr/platformlist','modules/platform/platformmgr.lua','ReqPlatformList','服务器及分区管理','true','平台列表',0,'',1),('平台编辑','platformmgr/edit','modules/platform/platformmgr.lua','DoUpdatePlatform','服务器及分区管理','false','',0,'',1),('数据总览','datamgr/index','modules/data/datamgr.lua','Index','实时数据','true','',0,'oss',0),('数据统计定时执行','cron/cron_statics','modules/cron/cron_statics_mgr.lua','CronExecute','','false','',0,'',1),('日志定时轮询获取','cron/cron_log_statics','modules/cron/cron_log_statics_mgr.lua','CronExecute','','false','',0,'',999),('更新gservice白名单','servermgr/updateiplist','modules/server/servermgr.lua','UpdateIPList','','false','更新gservice白名单',1,'',1),('更新分区','croservermgr/updatezone','modules/server/croservermgr.lua','UpdateZone','服务器及分区管理','false','更新分区,修改目标服务器',0,'',1),('服务器及分区管理','','','','','true','服务器列表，分区管理，服务器和分区关系管理',0,'',9),('服务器操作定时更新','cron/serviceoperation','modules/cron/gm_send/cronoperationmgr.lua','ServerOperation','','false','',0,'',1),('服务器操作管理','serviceopermgr/operationlist','modules/server/serveroperationmgr.lua','OperationList','服务器及分区管理','true','服务器操作管理',0,'',1),('服务器操作编辑','serviceopermgr/edit','modules/server/serveroperationmgr.lua','Edit','服务器及分区管理','false','服务器操作编辑',0,'',1),('服务器操作编辑提交','serviceopermgr/editpost','modules/server/serveroperationmgr.lua','EditPost','服务器及分区管理','false','服务器操作编辑提交',1,'',1),('服务器标签管理','servermgr/reqservertagmgr','modules/server/servermgr.lua','ShowSvrTagList','服务器及分区管理','true','服务器标签管理，用于发布脚本',0,'',1),('服务器管理','servermgr/serverlist','modules/server/servermgr.lua','ReqServerList','服务器及分区管理','true','显示和管理服务器列表',0,'',1),('机器管理','publishmgr/reqmachinelist','modules/publish/publishmgr.lua','ReqMachineList','版本发布管理','true','',0,'',1),('机器管理_修改_执行','publishmgr/domodmachine','modules/publish/publishmgr.lua','DoModifyMachine','版本发布管理','false','',1,'',1),('机器管理_初始化_完毕','publishmgr/doinitmachinedone','modules/publish/publishmgr.lua','DoInitMachineDone','版本发布管理','false','',0,'',1),('机器管理_初始化_执行','publishmgr/doinitmachine','modules/publish/publishmgr.lua','DoInitMachine','版本发布管理','false','',0,'',1),('机器管理_删除_执行','publishmgr/dodelmachine','modules/publish/publishmgr.lua','DoDelMachine','版本发布管理','false','',1,'',1),('查看服务器操作日志','serviceopermgr/showlog','modules/server/serveroperationmgr.lua','ShowLog','服务器及分区管理','false','查看服务器操作日志',0,'',1),('查看跨服分区','croservermgr/zoneshow','modules/server/croservermgr.lua','ZoneShow','服务器及分区管理','false','查看跨服分区',0,'',1),('检查执行进度','publishmgr/docheckprogress','modules/publish/publishmgr.lua','DoCheckProgress','版本发布管理','false','',0,'',1),('模块日志','admin/loglist','admin/logmgr.lua','LogList','模块管理','true','记录对应模块的操作日志',0,'',1),('模块管理','','','','','true','模块管理方法',0,'',10),('活动删除','gamemgr/activitydelete','modules/game/activitymgr.lua','ActivityDelete','游戏管理','false','',1,'oss',1),('活动发布','gamemgr/activitypublish','modules/game/activitymgr.lua','ActivityPbulish','游戏管理','false','',1,'oss',1),('活动管理','gamemgr/activityshow','modules/game/activitymgr.lua','ActivityShow','游戏管理','true','',0,'oss',4),('活动编辑','gamemgr/activityedit','modules/game/activitymgr.lua','ActivityEdit','游戏管理','false','',0,'oss',1),('添加分区','servermgr/doaddgroup','modules/server/servermgr.lua','DoAddGroup','服务器及分区管理','false','加新分区',0,'',1),('添加区分类','servermgr/doshowaddgrpcls','modules/server/servermgr.lua','DoShowAddGrpCls','服务器及分区管理','false','',0,'',1),('添加区分类1','servermgr/doaddgrpcls','modules/server/servermgr.lua','DoAddGrpCls','服务器及分区管理','false','',0,'',1),('添加服务器','servermgr/doshowservlist','modules/server/servermgr.lua','DoShowServlist','服务器及分区管理','false','添加服务器',0,'',1),('添加服务器1','servermgr/doaddserver','modules/server/servermgr.lua','DoAddServer','服务器及分区管理','false','添加服务器信息',0,'',1),('添加模块','admin/moduleadd','admin/funcmgr.lua','DoAdminAdd','模块管理','false','添加功能模块',0,'',1),('添加角色','admin/addrole','admin/permissionmgr.lua','DoAddGroup','角色权限管理','false','添加角色',0,'oss',1),('添加账号','usermgr/doadd','admin/usermgr.lua','DoAddUser','角色权限管理','false','添加账号',0,'oss',1),('游戏管理','','','','','true','',0,'oss',3),('版本发布管理','','','','','true','版本发布相关操作',0,'',10),('玩家GM显示设置','gamemgr/player_gm_show','modules/game/super_player_mgr.lua','PlayerGMShow','游戏管理','true','',0,'oss',8),('玩家GM设置','gamemgr/player_gm_edit','modules/game/super_player_mgr.lua','PlayerGMEdit','游戏管理','false','',0,'oss',1),('玩家GM设置删除','gamemgr/player_gm_delete','modules/game/super_player_mgr.lua','PlayerGMDelete','游戏管理','false','',0,'oss',1),('玩家GM设置发布','gamemgr/player_gm_publish','modules/game/super_player_mgr.lua','PlayerGMPublish','游戏管理','false','',1,'oss',1),('玩家查询','playermgr/playerinfo','modules/player/playermgr.lua','PlayerInfo','玩家管理','true','',0,'oss',1),('玩家等级统计','ossmgr/levelstatics','modules/oss/ossmgr.lua','LevelStatics','运营数据','true','',0,'oss',15),('玩家管理','','','','','true','',0,'oss',2),('生成服务器列表','servermgr/createservlist','modules/server/servermgr.lua','CreateServList','服务器及分区管理','false','',0,'',1),('生成端口','servermgr/createport','modules/server/servermgr.lua','CreatePort','服务器及分区管理','false','生成对应的端口号',0,'',1),('生成跨服文件','croservermgr/genfile','modules/server/croservermgr.lua','GenerateCroFile','服务器及分区管理','false','生成跨服文件',0,'',1),('用户留存','ossmgr/retention','modules/oss/ossmgr.lua','Retention','运营数据','true','',0,'oss',0),('登记发布版本','publishmgr/reqversionlist','modules/publish/publishmgr.lua','ReqVersionList','版本发布管理','true','版本登记',0,'oss',1),('登陆过程分析','ossmgr/loginstatics','modules/oss/ossmgr.lua','LoginStatics','运营数据','true','',0,'oss',12),('禁言封号','playermgr/forbidden','modules/player/banmgr.lua','ForbiddenShow','玩家管理','true','',0,'oss',3),('禁言封号提交','playermgr/doforbidden','modules/player/banmgr.lua','DoForbidden','玩家管理','false','',1,'oss',1),('移动分区服务器','servermgr/domodservergroup','modules/server/servermgr.lua','DoModifyServerGroupInfo','服务器及分区管理','false','服务器在分区之间移动',0,'',1),('编辑角色','admin/editgroup','admin/permissionmgr.lua','DoEditGroup','角色权限管理','false','编辑角色',0,'oss',1),('聊天管理','gamemgr/chat_show','modules/game/chatmgr.lua','ChatShow','游戏管理','true','',0,'oss',5),('获得跨服平台列表','croservermgr/get_platform','modules/server/croservermgr.lua','GetPlatformList','服务器及分区管理','false','',0,'',1),('角色充值排行','ossmgr/rolepayrank','modules/oss/oss_pay_mgr.lua','RolePayRank','运营数据','true','',0,'oss',4),('角色充值统计','ossmgr/rolepaystatics','modules/oss/oss_pay_mgr.lua','RolePayStatics','运营数据','true','',0,'oss',6),('角色战斗力排行','ossmgr/fightrank','modules/oss/ossmgr.lua','FightRank','运营数据','true','',0,'oss',11),('角色权限管理','','','','','true','角色是用于权限管理的，账号加入某角色后拥有改角色的权限',0,'oss',11),('角色管理','admin/rolelist','admin/permissionmgr.lua','ReqGroups','角色权限管理','true','角色数据管理',0,'oss',1),('设置服务器顺序','servermgr/domodserverindex','modules/server/servermgr.lua','DoModifyServerIndex','服务器及分区管理','false','设置服务器在分区中的位置',0,'',1),('设置权限','admin/listgroupperm','admin/permissionmgr.lua','ReqListGroupPermission','角色权限管理','false','显示所选分组的权限设置',0,'oss',1),('设置权限_执行','admin/dosetpermission','admin/permissionmgr.lua','DoSetGroupPermission','角色权限管理','false','设置角色权限',0,'oss',1),('账号管理','usermgr/list','admin/usermgr.lua','ListUsers','角色权限管理','true','账号管理目录',0,'oss',1),('账号角色管理','admin/userrolelist','admin/permissionmgr.lua','ReqListAccountGroups','角色权限管理','true','设置账号使用的角色',0,'oss',1),('超级会员区服删除','gamemgr/player_server_delete','modules/game/super_player_mgr.lua','PlayerServerDelete','游戏管理','false','',1,'oss',1),('超级会员区服发布','gamemgr/player_server_publish','modules/game/super_player_mgr.lua','PlayerServerPublish','游戏管理','false','',1,'oss',1),('超级会员区服编辑','gamemgr/player_server_edit','modules/game/super_player_mgr.lua','PlayerServerEdit','游戏管理','false','',0,'oss',1),('超级会员区服设置','gamemgr/player_server_show','modules/game/super_player_mgr.lua','PlayerServerShow','游戏管理','true','',0,'oss',6),('超级会员玩家删除','gamemgr/super_player_delete','modules/game/super_player_mgr.lua','PlayerManageDelete','游戏管理','false','',1,'oss',1),('超级会员玩家发布','gamemgr/super_player_publish','modules/game/super_player_mgr.lua','PlayerManagePublish','游戏管理','false','',1,'oss',1),('超级会员玩家管理','gamemgr/super_player_show','modules/game/super_player_mgr.lua','PlayerManageShow','游戏管理','true','',0,'oss',5),('超级会员玩家编辑','gamemgr/super_player_edit','modules/game/super_player_mgr.lua','PlayerManageEdit','游戏管理','false','',0,'oss',1),('跨服分区','croservermgr/croserverlist','modules/server/croservermgr.lua','CroServerList','服务器及分区管理','true','跨服分区',0,'',1),('跨服服务','croservermgr/croservicelist','modules/server/croservermgr.lua','CroServiceShow','服务器及分区管理','true','跨服服务',0,'',1),('跨服服务删除','croservermgr/servicedelete','modules/server/croservermgr.lua','CroServiceDelete','服务器及分区管理','false','跨服服务删除',0,'',1),('跨服服务编辑','croservermgr/serviceedit','modules/server/croservermgr.lua','CroServiceEdit','服务器及分区管理','false','跨服服务编辑',0,'',1),('跨服编辑','croservermgr/edit','modules/server/croservermgr.lua','DoEdit','服务器及分区管理','false','跨服编辑',0,'',1),('运营数据','','','','','true','',0,'oss',1),('运营数据列表','croservermgr/serverdata','modules/server/croservermgr.lua','GetServerData','服务器及分区管理','false','运营数据列表',0,'',1),('道具操作','playermgr/itemshow','modules/player/itemmgr.lua','ItemShow','玩家管理','true','',0,'oss',6),('道具操作提交','playermgr/doitem','modules/player/itemmgr.lua','DoItem','玩家管理','false','',1,'oss',1),('邮件发送','playermgr/emailshow','modules/player/emailmgr.lua','EmailShow','玩家管理','true','',0,'oss',5),('邮件发送提交','playermgr/dosendemail','modules/player/emailmgr.lua','DoSendEmail','玩家管理','false','',1,'oss',1),('钻石产出','ossmgr/goldgenerate','modules/oss/oss_pay_mgr.lua','GoldGenerate','运营数据','true','',0,'oss',10),('钻石消耗','ossmgr/goldconsume','modules/oss/oss_pay_mgr.lua','GoldConsume','运营数据','true','',0,'oss',9),('钻石金币操作','playermgr/goldoperationshow','modules/player/goldmgr.lua','GoldOperationShow','玩家管理','true','',0,'oss',4),('钻石金币操作提交','playermgr/dogoldoperation','modules/player/goldmgr.lua','DoGoldOperation','玩家管理','false','',1,'oss',1),('预览服务器列表','servermgr/previewservlist','modules/server/servermgr.lua','PreViewServList','服务器及分区管理','false','',0,'',1);
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `groupid` int(8) DEFAULT NULL,
  `module` varchar(20) DEFAULT NULL,
  KEY `userid` (`groupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (2,'角色权限管理'),(2,'删除账号'),(2,'接口功能'),(2,'模块管理'),(3,'角色权限管理'),(4,'服务器及分区管理'),(4,'服务器管理'),(4,'修改服务器信息'),(4,'模块管理'),(4,'分区服务器管理'),(4,'删除分区'),(4,'修改分区'),(4,'接口功能'),(4,'添加服务器'),(4,'设置服务器顺序'),(4,'删除服务器'),(4,'添加分区'),(4,'移动分区服务器'),(4,'分区信息管理'),(11,'编辑角色'),(11,'角色权限管理'),(11,'角色管理'),(11,'添加角色'),(11,'删除角色'),(9,'运营数据'),(9,'用户留存'),(9,'在线时长'),(9,'充值数据'),(9,'角色充值排行'),(9,'角色充值统计'),(9,'充值对账'),(9,'VIP用户统计'),(9,'钻石消耗'),(9,'钻石产出'),(9,'角色战斗力排行'),(9,'登陆过程分析'),(9,'历史在线'),(9,'历史注册'),(9,'玩家等级统计'),(9,'玩家管理'),(9,'玩家查询'),(9,'禁言封号提交'),(9,'道具操作提交'),(9,'邮件发送提交'),(9,'GM运营操作提交'),(9,'钻石金币操作提交'),(9,'GM操作'),(9,'禁言封号'),(9,'钻石金币操作'),(9,'邮件发送'),(9,'道具操作'),(9,'角色权限管理'),(9,'修改账号'),(9,'删除角色'),(9,'删除账号'),(9,'添加角色'),(9,'添加账号'),(9,'编辑角色'),(9,'角色管理'),(9,'设置权限'),(9,'账号管理'),(9,'修改账号角色'),(9,'账号角色管理'),(9,'修改账号_执行'),(9,'设置权限_执行'),(9,'游戏管理'),(9,'CDKEY生成'),(9,'公告删除'),(9,'公告编辑'),(9,'活动删除'),(9,'活动发布'),(9,'活动编辑'),(9,'玩家GM设置'),(9,'CDKEY生成提交'),(9,'公告结果展示'),(9,'玩家GM设置删除'),(9,'玩家GM设置发布'),(9,'超级会员区服删除'),(9,'超级会员区服发布'),(9,'超级会员区服编辑'),(9,'超级会员玩家删除'),(9,'超级会员玩家发布'),(9,'超级会员玩家编辑'),(9,'CDKEY查询'),(9,'公告管理'),(9,'活动管理'),(9,'聊天管理'),(9,'超级会员玩家管理'),(9,'超级会员区服设置'),(9,'玩家GM显示设置'),(9,'json格式服务器列表'),(9,'实时数据'),(9,'数据总览'),(9,'实时充值'),(9,'实时在线'),(9,'实时注册'),(1,'角色权限管理'),(1,'修改账号'),(1,'删除角色'),(1,'删除账号'),(1,'添加角色'),(1,'添加账号'),(1,'编辑角色'),(1,'角色管理'),(1,'设置权限'),(1,'账号管理'),(1,'修改账号角色'),(1,'账号角色管理'),(1,'修改账号_执行'),(1,'设置权限_执行'),(1,'游戏管理'),(1,'CDKEY导出'),(1,'CDKEY生成'),(1,'失效CDKEY'),(1,'公告删除'),(1,'公告编辑'),(1,'活动删除'),(1,'活动发布'),(1,'活动编辑'),(1,'玩家GM设置'),(1,'CDKEY生成提交'),(1,'公告结果展示'),(1,'玩家GM设置删除'),(1,'玩家GM设置发布'),(1,'超级会员区服删除'),(1,'超级会员区服发布'),(1,'超级会员区服编辑'),(1,'超级会员玩家删除'),(1,'超级会员玩家发布'),(1,'超级会员玩家编辑'),(1,'CDKEY查询'),(1,'公告管理'),(1,'活动管理'),(1,'聊天管理'),(1,'超级会员玩家管理'),(1,'超级会员区服设置'),(1,'玩家GM显示设置'),(1,'版本发布管理'),(1,'机器管理'),(1,'检查执行进度'),(1,'登记发布版本'),(1,'发布版本_添加'),(1,'发布版本_删除_执行'),(1,'发布版本_添加_执行'),(1,'机器管理_修改_执行'),(1,'机器管理_删除_执行'),(1,'机器管理_初始化_完毕'),(1,'机器管理_初始化_执行'),(1,'实时数据'),(1,'数据总览'),(1,'实时充值'),(1,'实时在线'),(1,'实时注册'),(1,'运营数据'),(1,'用户留存'),(1,'在线时长'),(1,'充值数据'),(1,'角色充值排行'),(1,'角色充值统计'),(1,'充值对账'),(1,'VIP用户统计'),(1,'钻石消耗'),(1,'钻石产出'),(1,'角色战斗力排行'),(1,'登陆过程分析'),(1,'历史在线'),(1,'历史注册'),(1,'玩家等级统计'),(1,'服务器及分区管理'),(1,'修改分区'),(1,'删除分区'),(1,'删除平台'),(1,'导出分区'),(1,'平台管理'),(1,'平台编辑'),(1,'更新分区'),(1,'添加分区'),(1,'生成端口'),(1,'跨服分区'),(1,'跨服服务'),(1,'跨服编辑'),(1,'删除服务器'),(1,'服务器管理'),(1,'添加区分类'),(1,'添加服务器'),(1,'添加区分类1'),(1,'添加服务器1'),(1,'分区信息管理'),(1,'删除跨服配置'),(1,'发布标签修改'),(1,'发布标签删除'),(1,'发布标签管理'),(1,'查看跨服分区'),(1,'生成跨服文件'),(1,'跨服服务删除'),(1,'跨服服务编辑'),(1,'运营数据列表'),(1,'修改区分类信息'),(1,'修改服务器信息'),(1,'修改服务器标签'),(1,'分区服务器管理'),(1,'删除服务器操作'),(1,'服务器操作管理'),(1,'服务器操作编辑'),(1,'服务器标签管理'),(1,'生成服务器列表'),(1,'移动分区服务器'),(1,'设置服务器顺序'),(1,'预览服务器列表'),(1,'获得跨服平台列表'),(1,'json格式服务器列表'),(1,'服务器操作编辑提交'),(1,'查看服务器操作日志'),(1,'玩家管理'),(1,'玩家查询'),(1,'禁言封号提交'),(1,'道具操作提交'),(1,'邮件发送提交'),(1,'GM运营操作提交'),(1,'钻石金币操作提交'),(1,'GM操作'),(1,'禁言封号'),(1,'钻石金币操作'),(1,'邮件发送'),(1,'道具操作'),(1,'GM接口功能'),(1,'GM操作列表'),(1,'GM操作删除'),(1,'GM操作提交'),(1,'GM操作结果'),(1,'GM操作编辑'),(1,'GM规则列表'),(1,'GM规则删除'),(1,'GM规则编辑'),(1,'GM预览提交'),(1,'模块管理'),(1,'修改模块'),(1,'删除模块'),(1,'功能模块'),(1,'模块日志'),(1,'添加模块'),(1,'更新gservice白名单');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-03-16 20:49:18