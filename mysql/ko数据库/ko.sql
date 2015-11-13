-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ko_open
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
-- Table structure for table `battle_game`
--

DROP TABLE IF EXISTS `battle_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game` (
  `openID` int(11) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL AUTO_INCREMENT,
  `appVersion` int(11) NOT NULL DEFAULT '0' COMMENT '应用APP的versionCode',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 未提交:0 待审核:1 已审核:2 审核拒绝:3 停运:4',
  `sdkType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '接入类型 0:对战 1:联运',
  `gameName` varchar(50) NOT NULL DEFAULT '',
  `gameNameEn` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(240) NOT NULL DEFAULT '',
  `descriptionEn` varchar(240) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型(FBA:5, PSP:6, GBA:4, APK:7, OPK:8)',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `bg` varchar(255) NOT NULL DEFAULT '' COMMENT '背景大图',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '标签A;标签B',
  `fileURL` varchar(255) NOT NULL DEFAULT '' COMMENT '下载链接',
  `fileSize` int(11) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `fileCID` varchar(40) NOT NULL DEFAULT '' COMMENT '文件CID',
  `controllers` int(11) NOT NULL DEFAULT '3' COMMENT '操控类型（Mask 手柄:1 手机助手:2）',
  `service` int(11) NOT NULL DEFAULT '0' COMMENT '提供的服务(Mask 对战:1 单机:2 比赛:4 介绍视频:8 排名:16)',
  `trailerURL` varchar(255) NOT NULL DEFAULT '' COMMENT '预告片链接',
  `trailerCover` varchar(255) NOT NULL DEFAULT '' COMMENT '预告片封面',
  `slide` text NOT NULL COMMENT '幻灯片A;幻灯片B;幻灯片C',
  `packageName` varchar(80) NOT NULL DEFAULT '',
  `debugSignature` varchar(32) NOT NULL DEFAULT '',
  `releaseSignature` varchar(32) NOT NULL DEFAULT '',
  `debugAppKey` varchar(120) NOT NULL DEFAULT '',
  `releaseAppKey` varchar(120) NOT NULL DEFAULT '',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `maxPlayer` int(4) unsigned NOT NULL DEFAULT '0',
  `gameType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '游戏玩法类型  0 PVP 1 state ',
  PRIMARY KEY (`gameID`),
  KEY `I_OpenID` (`openID`),
  KEY `I_type` (`type`),
  KEY `I_status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=102692 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_game_config`
--

DROP TABLE IF EXISTS `battle_game_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game_config` (
  `gameID` int(11) NOT NULL,
  `scoreA_mode` tinyint(4) NOT NULL DEFAULT '0',
  `scoreA_name` varchar(50) NOT NULL DEFAULT '',
  `scoreB_mode` tinyint(4) NOT NULL DEFAULT '0',
  `scoreB_name` varchar(50) NOT NULL DEFAULT '',
  `scoreC_mode` tinyint(4) NOT NULL DEFAULT '0',
  `scoreC_name` varchar(50) NOT NULL DEFAULT '',
  `extend_0_mode` tinyint(4) NOT NULL DEFAULT '0',
  `extend_1_mode` tinyint(4) NOT NULL DEFAULT '0',
  `extend_2_mode` tinyint(4) NOT NULL DEFAULT '0',
  `extend_3_mode` tinyint(4) NOT NULL DEFAULT '0',
  `extend_4_mode` tinyint(4) NOT NULL DEFAULT '0',
  `extend_5_mode` tinyint(4) NOT NULL DEFAULT '0',
  `extend_6_mode` tinyint(4) NOT NULL DEFAULT '0',
  `extend_7_mode` tinyint(4) NOT NULL DEFAULT '0',
  `extend_8_mode` tinyint(4) NOT NULL DEFAULT '0',
  `extend_9_mode` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`gameID`),
  UNIQUE KEY `gameID_UNIQUE` (`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_game_editable`
--

DROP TABLE IF EXISTS `battle_game_editable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game_editable` (
  `openID` int(11) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL AUTO_INCREMENT,
  `appVersion` int(11) NOT NULL DEFAULT '0' COMMENT '应用APP的versionCode',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 未提交:0 待审核:1 已审核:2 审核拒绝:3 停运:4',
  `sdkType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '接入类型 0:对战 1:联运',
  `gameName` varchar(50) NOT NULL DEFAULT '',
  `gameNameEn` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(240) NOT NULL DEFAULT '',
  `descriptionEn` varchar(240) NOT NULL DEFAULT '',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型(FBA:5, PSP:6, GBA:4, APK:7, OPK:8)',
  `icon` varchar(255) NOT NULL DEFAULT '',
  `bg` varchar(255) NOT NULL DEFAULT '' COMMENT '背景大图',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT '标签A;标签B',
  `fileURL` varchar(255) NOT NULL DEFAULT '' COMMENT '下载链接',
  `fileSize` int(11) NOT NULL DEFAULT '0' COMMENT '文件大小',
  `fileCID` varchar(40) NOT NULL DEFAULT '' COMMENT '文件CID',
  `controllers` int(11) NOT NULL DEFAULT '3' COMMENT '操控类型（Mask 手柄:1 手机助手:2）',
  `service` int(11) NOT NULL DEFAULT '0' COMMENT '提供的服务(Mask 对战:1 单机:2 比赛:4 介绍视频:8 排名:16)',
  `trailerURL` varchar(255) NOT NULL DEFAULT '' COMMENT '预告片链接',
  `trailerCover` varchar(255) NOT NULL DEFAULT '' COMMENT '预告片封面',
  `slide` text NOT NULL COMMENT '幻灯片A;幻灯片B;幻灯片C',
  `packageName` varchar(80) NOT NULL DEFAULT '',
  `debugSignature` varchar(32) NOT NULL DEFAULT '',
  `releaseSignature` varchar(32) NOT NULL DEFAULT '',
  `debugAppKey` varchar(120) NOT NULL DEFAULT '',
  `releaseAppKey` varchar(120) NOT NULL DEFAULT '',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `maxPlayer` int(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`gameID`),
  KEY `I_OpenID` (`openID`),
  KEY `I_type` (`type`),
  KEY `I_status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=1000029 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_game_field`
--

DROP TABLE IF EXISTS `battle_game_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game_field` (
  `fieldID` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0锁定 1启用 2关闭',
  `defaultForGame` tinyint(1) DEFAULT '0' COMMENT '是否为默认场，默认场可以和低版本的场兼容',
  `fieldName` varchar(19) NOT NULL DEFAULT '',
  `fieldCoverBig` varchar(250) NOT NULL DEFAULT '',
  `fieldCoverSmall` varchar(250) NOT NULL DEFAULT '',
  `timeStart` varchar(8) NOT NULL DEFAULT '',
  `timeEnd` varchar(8) NOT NULL DEFAULT '',
  `dateStart` varchar(10) NOT NULL DEFAULT '',
  `dateEnd` varchar(10) NOT NULL DEFAULT '',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`fieldID`),
  KEY `I_gameID` (`gameID`),
  KEY `I_timeStart` (`timeStart`),
  KEY `I_timeEnd` (`timeEnd`),
  KEY `I_dateStart` (`dateStart`),
  KEY `I_dateEnd` (`dateEnd`)
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_game_field_cost`
--

DROP TABLE IF EXISTS `battle_game_field_cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game_field_cost` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `fieldID` int(11) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(3) DEFAULT '0' COMMENT 'product type',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `commission` int(11) NOT NULL DEFAULT '0' COMMENT '佣金',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`seqid`),
  KEY `I_fieldID` (`fieldID`),
  KEY `I_gameID` (`gameID`),
  KEY `I_productID` (`productID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_game_field_threshold`
--

DROP TABLE IF EXISTS `battle_game_field_threshold`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game_field_threshold` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `fieldID` int(11) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0锁定 1启用 2关闭',
  `productID` int(11) NOT NULL DEFAULT '0',
  `minCount` int(11) NOT NULL DEFAULT '0',
  `maxCount` int(11) NOT NULL DEFAULT '0',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`seqid`),
  KEY `I_fieldID` (`fieldID`),
  KEY `I_gameID` (`gameID`),
  KEY `I_productID` (`productID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_game_lobby_config`
--

DROP TABLE IF EXISTS `battle_game_lobby_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game_lobby_config` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `templateID` int(11) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `url` varchar(250) NOT NULL DEFAULT '',
  `cid` varchar(40) NOT NULL DEFAULT '',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `un_key` (`templateID`,`gameID`),
  KEY `I_gameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_game_match`
--

DROP TABLE IF EXISTS `battle_game_match`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game_match` (
  `seqID` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0' COMMENT '游戏ID',
  `userMin` int(11) NOT NULL DEFAULT '1' COMMENT '最少用户数',
  `userMax` int(11) NOT NULL DEFAULT '1' COMMENT '最大用户数',
  `inputBy` varchar(64) NOT NULL DEFAULT '' COMMENT '谁插入',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '插入时间',
  `editBy` varchar(64) NOT NULL DEFAULT '' COMMENT '谁修改',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  PRIMARY KEY (`seqID`),
  KEY `IGame` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_game_top_config`
--

DROP TABLE IF EXISTS `battle_game_top_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game_top_config` (
  `topID` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 0每日 1历史',
  `factorA` varchar(20) NOT NULL DEFAULT '' COMMENT '排行字段，scoreA|scoreB|scoreC',
  `ruleA` varchar(10) NOT NULL DEFAULT '' COMMENT '排行字段规则，asc|desc',
  `factorB` varchar(20) NOT NULL DEFAULT '' COMMENT '排行字段，scoreA|scoreB|scoreC',
  `ruleB` varchar(10) NOT NULL DEFAULT '' COMMENT '排行字段规则，asc|desc',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`topID`),
  KEY `I_gameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_game_version`
--

DROP TABLE IF EXISTS `battle_game_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game_version` (
  `versionID` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0',
  `openID` int(11) NOT NULL DEFAULT '0',
  `versionCode` int(11) NOT NULL DEFAULT '0' COMMENT '对战版本号',
  `versionName` varchar(30) NOT NULL DEFAULT '对战版本名称',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`versionID`),
  UNIQUE KEY `un_key` (`gameID`,`versionCode`),
  KEY `I_gameID` (`gameID`),
  KEY `I_openID` (`openID`),
  KEY `I_versionCode` (`versionCode`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_game_version_field`
--

DROP TABLE IF EXISTS `battle_game_version_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_game_version_field` (
  `gameID` int(11) NOT NULL DEFAULT '0',
  `versionID` int(11) NOT NULL DEFAULT '0',
  `fieldID` int(11) NOT NULL DEFAULT '0',
  `versionCode` int(11) NOT NULL DEFAULT '0' COMMENT '冗余内容，versionID对应的versionCode',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  UNIQUE KEY `key_UNIQUE` (`gameID`,`versionID`,`fieldID`),
  KEY `I_fieldID` (`fieldID`),
  KEY `I_gameID` (`gameID`),
  KEY `I_versionID` (`versionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_lobby_template`
--

DROP TABLE IF EXISTS `battle_lobby_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_lobby_template` (
  `templateID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `versionCode` int(11) NOT NULL DEFAULT '0',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`templateID`),
  KEY `I_versionCode` (`versionCode`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_video`
--

DROP TABLE IF EXISTS `battle_video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_video` (
  `videoID` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0',
  `videoTitle` varchar(50) NOT NULL DEFAULT '' COMMENT '标题',
  `videoCover` varchar(250) NOT NULL DEFAULT '' COMMENT '封面',
  `videoURL` varchar(250) NOT NULL DEFAULT '' COMMENT '链接地址',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 优酷1 可扩展',
  `duration` int(11) NOT NULL DEFAULT '0' COMMENT '播放时长',
  `playTimes` int(11) NOT NULL DEFAULT '0' COMMENT '播放次数',
  `likes` int(11) NOT NULL DEFAULT '0' COMMENT '被赞数',
  `uploadUserID` int(11) NOT NULL DEFAULT '0' COMMENT '上传用户ID',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`videoID`),
  KEY `I_uploadUserID` (`uploadUserID`),
  KEY `I_gameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_video_tags`
--

DROP TABLE IF EXISTS `battle_video_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_video_tags` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `videoID` int(11) NOT NULL DEFAULT '0' COMMENT '视频ID',
  `tagID` int(11) NOT NULL DEFAULT '0' COMMENT '视频ID',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `key_UNIQUE` (`videoID`,`tagID`),
  KEY `I_videoID` (`videoID`),
  KEY `I_tagID` (`tagID`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `channel`
--

DROP TABLE IF EXISTS `channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `channel` (
  `channelID` bigint(20) NOT NULL AUTO_INCREMENT,
  `channelName` varchar(255) NOT NULL DEFAULT '' COMMENT '渠道名称',
  `channelKey` varchar(255) NOT NULL DEFAULT '' COMMENT '渠道使用key',
  PRIMARY KEY (`channelID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `developer` (
  `openID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '开发者状态 未激活:0 已激活:1 未认证:2 待认证:3 认证开发者:4',
  `password` varchar(32) NOT NULL DEFAULT '',
  `email` varchar(50) NOT NULL DEFAULT '',
  `mobile` varchar(20) NOT NULL DEFAULT '',
  `province` varchar(30) NOT NULL DEFAULT '',
  `city` varchar(30) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `groupID` int(11) NOT NULL DEFAULT '0',
  `remark` text NOT NULL,
  `registerIP` varchar(15) NOT NULL DEFAULT '',
  `registerTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastLoginIP` varchar(15) NOT NULL DEFAULT '',
  `lastLoginTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `session` varchar(50) NOT NULL DEFAULT '',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`openID`),
  UNIQUE KEY `key_UNIQUE` (`email`),
  KEY `I_password` (`password`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `developer_detail`
--

DROP TABLE IF EXISTS `developer_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `developer_detail` (
  `openID` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型 0个人 1企业',
  `corpName` varchar(50) NOT NULL DEFAULT '' COMMENT '企业全称',
  `legalREP` varchar(20) NOT NULL DEFAULT '' COMMENT '法定代表人',
  `orgCode` varchar(10) NOT NULL DEFAULT '' COMMENT '组织机构代码',
  `orgCodeCert` varchar(250) NOT NULL DEFAULT '' COMMENT '组织机构代码证',
  `registMark` varchar(20) NOT NULL DEFAULT '' COMMENT '工商营业执照注册号',
  `license` varchar(250) NOT NULL DEFAULT '' COMMENT '工商营业执照',
  `accountOwner` varchar(50) NOT NULL DEFAULT '' COMMENT '开户名称(公司/个人)',
  `bankProvince` varchar(30) NOT NULL DEFAULT '' COMMENT '开户行省份',
  `bankCity` varchar(30) NOT NULL DEFAULT '' COMMENT '开户行城市',
  `bankName` varchar(50) NOT NULL DEFAULT '' COMMENT '银行名称',
  `bankBranch` varchar(50) NOT NULL DEFAULT '' COMMENT '所在支行',
  `bankAccount` varchar(30) NOT NULL DEFAULT '' COMMENT '银行帐号',
  `operatorName` varchar(20) NOT NULL DEFAULT '' COMMENT '姓名',
  `operatorMobile` varchar(15) NOT NULL DEFAULT '' COMMENT '手机',
  `operatorPhone` varchar(15) NOT NULL DEFAULT '' COMMENT '座机',
  `operatorEmail` varchar(50) NOT NULL DEFAULT '' COMMENT '邮箱',
  `operatorIDNumber` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `operatorIDFront` varchar(250) NOT NULL DEFAULT '' COMMENT '身份证（正面）',
  `operatorIDBack` varchar(250) NOT NULL DEFAULT '' COMMENT '身份证（反面）',
  UNIQUE KEY `key_UNIQUE` (`openID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gp_mapping`
--

DROP TABLE IF EXISTS `gp_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gp_mapping` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `descriptor` varchar(48) NOT NULL DEFAULT '' COMMENT '设备描述符',
  `deviceName` varchar(50) NOT NULL DEFAULT '' COMMENT '设备名称',
  `nickName` varchar(50) NOT NULL DEFAULT '' COMMENT '名称，用于显示',
  `userUID` varchar(50) NOT NULL DEFAULT '' COMMENT '用户UID, 官方添加为KO',
  `brandID` varchar(50) NOT NULL DEFAULT '' COMMENT '品牌ID',
  `os` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-旧数据; 1-Android; 2-YunOS',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-不启用; 1-启用',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-UserInput; 1-OfficialInput',
  `buttonA` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 96',
  `buttonB` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 97',
  `buttonC` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 98',
  `buttonX` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 99',
  `buttonY` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 100',
  `buttonZ` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 101',
  `buttonL1` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 102',
  `buttonR1` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 103',
  `buttonL2` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 104',
  `buttonR2` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 105',
  `buttonTHUMBL` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 106',
  `buttonTHUMBR` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 107',
  `buttonSTART` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 108',
  `buttonSELECT` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 109',
  `buttonMode` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 110',
  `inputBy` int(11) NOT NULL DEFAULT '0',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `un_key` (`descriptor`,`deviceName`,`os`)
) ENGINE=MyISAM AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `gp_mapping_collection`
--

DROP TABLE IF EXISTS `gp_mapping_collection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gp_mapping_collection` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `descriptor` varchar(48) NOT NULL DEFAULT '' COMMENT '设备描述符',
  `deviceName` varchar(50) NOT NULL DEFAULT '' COMMENT '设备名称',
  `nickName` varchar(50) NOT NULL DEFAULT '' COMMENT '名称，用于显示',
  `userUID` varchar(50) NOT NULL DEFAULT '' COMMENT '用户UID',
  `os` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-旧数据; 1-Android; 2-YunOS',
  `buttonA` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 96',
  `buttonB` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 97',
  `buttonC` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 98',
  `buttonX` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 99',
  `buttonY` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 100',
  `buttonZ` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 101',
  `buttonL1` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 102',
  `buttonR1` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 103',
  `buttonL2` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 104',
  `buttonR2` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 105',
  `buttonTHUMBL` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 106',
  `buttonTHUMBR` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 107',
  `buttonSTART` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 108',
  `buttonSELECT` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 109',
  `buttonMode` smallint(6) NOT NULL DEFAULT '0' COMMENT 'value of this field will be translated to keycode 110',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `un_key` (`userUID`,`descriptor`,`deviceName`,`os`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `groupID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`groupID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `group_permission`
--

DROP TABLE IF EXISTS `group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group_permission` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `groupID` int(11) NOT NULL DEFAULT '0',
  `permitID` int(11) NOT NULL DEFAULT '0',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `key_UNIQUE` (`groupID`,`permitID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `permitID` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `key` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(50) NOT NULL DEFAULT '',
  `enabled` tinyint(4) NOT NULL DEFAULT '0',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`permitID`),
  UNIQUE KEY `key_UNIQUE` (`key`),
  KEY `I_url` (`url`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_notice`
--

DROP TABLE IF EXISTS `system_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_notice` (
  `seqID` int(11) NOT NULL AUTO_INCREMENT,
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `appVersion` int(11) NOT NULL DEFAULT '0' COMMENT '应用APP的versionCode',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 未审核:0 已审核:2 下线：4',
  `description` varchar(240) NOT NULL DEFAULT '文字',
  `descriptionEn` varchar(240) NOT NULL DEFAULT '英文文字',
  `imageUrl` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  PRIMARY KEY (`seqID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_tag`
--

DROP TABLE IF EXISTS `video_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_tag` (
  `tagID` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(50) NOT NULL DEFAULT '' COMMENT '名称',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inputBy` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `editBy` varchar(19) NOT NULL DEFAULT '',
  PRIMARY KEY (`tagID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `weixin_config`
--

DROP TABLE IF EXISTS `weixin_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weixin_config` (
  `configID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(250) NOT NULL DEFAULT '',
  `access_token` varchar(100) NOT NULL DEFAULT '',
  `ticket` varchar(100) NOT NULL DEFAULT '',
  `expires_in` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`configID`)
) ENGINE=MyISAM AUTO_INCREMENT=1025 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-13 15:11:40




















-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ko_user
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
-- Table structure for table `avatar_box`
--

DROP TABLE IF EXISTS `avatar_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `avatar_box` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '头像',
  PRIMARY KEY (`seqid`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `deter_attack_access`
--

DROP TABLE IF EXISTS `deter_attack_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deter_attack_access` (
  `accessIP` varchar(24) DEFAULT NULL,
  `accessTime` varchar(19) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `nick_name_box`
--

DROP TABLE IF EXISTS `nick_name_box`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nick_name_box` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `nickName` varchar(50) NOT NULL DEFAULT '' COMMENT '昵称',
  PRIMARY KEY (`seqid`)
) ENGINE=MyISAM AUTO_INCREMENT=3295054 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL COMMENT '新用户ID，服务器生成',
  `mac` varchar(20) NOT NULL DEFAULT '' COMMENT '用户设备MAC地址',
  `deviceID` varchar(80) NOT NULL DEFAULT '' COMMENT '即Android_ID',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未知; 1-男; 2-女;',
  `oldUserID` int(11) NOT NULL DEFAULT '0' COMMENT '旧系统用户ID',
  `createTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastLoginIP` varchar(15) NOT NULL DEFAULT '',
  `lastLoginTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-游客; 1-微信; 可继续扩展',
  `openID` varchar(45) NOT NULL DEFAULT '' COMMENT '第三方登录OpenID',
  `openBandTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '第三方登录首次时间',
  `openName` varchar(50) NOT NULL DEFAULT '',
  `openAvatar` varchar(255) NOT NULL DEFAULT '',
  `openRefreshToken` varchar(60) NOT NULL DEFAULT '',
  `openRefreshTokenExpireTime` varchar(45) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `I_UserID` (`userID`),
  KEY `I_Mac` (`mac`),
  KEY `I_Fingerprint` (`deviceID`),
  KEY `I_OldUserID` (`oldUserID`),
  KEY `I_Type` (`type`),
  KEY `I_OpenID` (`openID`)
) ENGINE=MyISAM AUTO_INCREMENT=6316 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_log`
--

DROP TABLE IF EXISTS `user_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `api` varchar(50) NOT NULL DEFAULT '' COMMENT '触发登录日志的API URI',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-游客; 1-微信; 2-百度; 同user.type',
  `userID` bigint(20) NOT NULL COMMENT '用户ID',
  `mac` varchar(20) NOT NULL DEFAULT '' COMMENT '用户设备MAC地址',
  `deviceID` varchar(80) NOT NULL DEFAULT '' COMMENT '即Android_ID',
  `gameID` int(11) NOT NULL DEFAULT '0' COMMENT '官方应用PID或者CP的游戏ID',
  `versionCode` int(11) NOT NULL DEFAULT '0' COMMENT '应用Android版本号',
  `versionName` varchar(30) NOT NULL DEFAULT '' COMMENT '应用Android版本名称',
  `channel` varchar(30) NOT NULL DEFAULT '' COMMENT '渠道',
  `loginIP` varchar(15) NOT NULL DEFAULT '',
  `loginTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`seqid`),
  KEY `I_api` (`api`),
  KEY `I_UserID` (`userID`),
  KEY `I_gameID` (`gameID`),
  KEY `I_versionCode` (`versionCode`),
  KEY `I_channel` (`channel`),
  KEY `I_Type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_log_201509`
--

DROP TABLE IF EXISTS `user_login_log_201509`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log_201509` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `api` varchar(50) NOT NULL DEFAULT '' COMMENT '触发登录日志的API URI',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-游客; 1-微信; 2-百度; 同user.type',
  `userID` bigint(20) NOT NULL COMMENT '用户ID',
  `mac` varchar(20) NOT NULL DEFAULT '' COMMENT '用户设备MAC地址',
  `deviceID` varchar(80) NOT NULL DEFAULT '' COMMENT '即Android_ID',
  `gameID` int(11) NOT NULL DEFAULT '0' COMMENT '官方应用PID或者CP的游戏ID',
  `versionCode` int(11) NOT NULL DEFAULT '0' COMMENT '应用Android版本号',
  `versionName` varchar(30) NOT NULL DEFAULT '' COMMENT '应用Android版本名称',
  `channel` varchar(30) NOT NULL DEFAULT '' COMMENT '渠道',
  `loginIP` varchar(15) NOT NULL DEFAULT '',
  `loginTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`seqid`),
  KEY `I_api` (`api`),
  KEY `I_UserID` (`userID`),
  KEY `I_gameID` (`gameID`),
  KEY `I_versionCode` (`versionCode`),
  KEY `I_channel` (`channel`),
  KEY `I_Type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=890 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_log_201510`
--

DROP TABLE IF EXISTS `user_login_log_201510`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log_201510` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `api` varchar(50) NOT NULL DEFAULT '' COMMENT '触发登录日志的API URI',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-游客; 1-微信; 2-百度; 同user.type',
  `userID` bigint(20) NOT NULL COMMENT '用户ID',
  `mac` varchar(20) NOT NULL DEFAULT '' COMMENT '用户设备MAC地址',
  `deviceID` varchar(80) NOT NULL DEFAULT '' COMMENT '即Android_ID',
  `gameID` int(11) NOT NULL DEFAULT '0' COMMENT '官方应用PID或者CP的游戏ID',
  `versionCode` int(11) NOT NULL DEFAULT '0' COMMENT '应用Android版本号',
  `versionName` varchar(30) NOT NULL DEFAULT '' COMMENT '应用Android版本名称',
  `channel` varchar(30) NOT NULL DEFAULT '' COMMENT '渠道',
  `loginIP` varchar(15) NOT NULL DEFAULT '',
  `loginTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`seqid`),
  KEY `I_api` (`api`),
  KEY `I_UserID` (`userID`),
  KEY `I_gameID` (`gameID`),
  KEY `I_versionCode` (`versionCode`),
  KEY `I_channel` (`channel`),
  KEY `I_Type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=5105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_login_log_201511`
--

DROP TABLE IF EXISTS `user_login_log_201511`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_login_log_201511` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `api` varchar(50) NOT NULL DEFAULT '' COMMENT '触发登录日志的API URI',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-游客; 1-微信; 2-百度; 同user.type',
  `userID` bigint(20) NOT NULL COMMENT '用户ID',
  `mac` varchar(20) NOT NULL DEFAULT '' COMMENT '用户设备MAC地址',
  `deviceID` varchar(80) NOT NULL DEFAULT '' COMMENT '即Android_ID',
  `gameID` int(11) NOT NULL DEFAULT '0' COMMENT '官方应用PID或者CP的游戏ID',
  `versionCode` int(11) NOT NULL DEFAULT '0' COMMENT '应用Android版本号',
  `versionName` varchar(30) NOT NULL DEFAULT '' COMMENT '应用Android版本名称',
  `channel` varchar(30) NOT NULL DEFAULT '' COMMENT '渠道',
  `loginIP` varchar(15) NOT NULL DEFAULT '',
  `loginTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`seqid`),
  KEY `I_api` (`api`),
  KEY `I_UserID` (`userID`),
  KEY `I_gameID` (`gameID`),
  KEY `I_versionCode` (`versionCode`),
  KEY `I_channel` (`channel`),
  KEY `I_Type` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_recycler`
--

DROP TABLE IF EXISTS `user_recycler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_recycler` (
  `seqid` int(11) NOT NULL,
  `userID` bigint(20) NOT NULL DEFAULT '0' COMMENT '新用户ID，服务器生成',
  `mac` varchar(20) NOT NULL DEFAULT '' COMMENT '用户设备MAC地址',
  `deviceID` varchar(80) NOT NULL DEFAULT '' COMMENT '即Android_ID',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `sex` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-未知; 1-男; 2-女;',
  `oldUserID` int(11) NOT NULL DEFAULT '0' COMMENT '旧系统用户ID',
  `createTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `lastLoginIP` varchar(15) NOT NULL DEFAULT '',
  `lastLoginTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-游客; 1-微信; 可继续扩展',
  `openID` varchar(45) NOT NULL DEFAULT '' COMMENT '第三方登录OpenID',
  `openBandTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '第三方登录首次时间',
  `openName` varchar(50) NOT NULL DEFAULT '',
  `openAvatar` varchar(255) NOT NULL DEFAULT '',
  `openRefreshToken` varchar(60) NOT NULL DEFAULT '',
  `openRefreshTokenExpireTime` varchar(45) NOT NULL DEFAULT '0000-00-00 00:00:00',
  UNIQUE KEY `seqid_UNIQUE` (`seqid`),
  KEY `I_Mac` (`mac`),
  KEY `I_Fingerprint` (`deviceID`),
  KEY `I_OldUserID` (`oldUserID`),
  KEY `I_Type` (`type`),
  KEY `I_OpenID` (`openID`),
  KEY `I_UserID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_session`
--

DROP TABLE IF EXISTS `user_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_session` (
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `session` varchar(45) NOT NULL DEFAULT '',
  `expireTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-13 15:11:40




















-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ko_battle
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
-- Table structure for table `RDS_battle_room`
--

DROP TABLE IF EXISTS `RDS_battle_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RDS_battle_room` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `roomID` int(11) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `gameVersion` int(11) NOT NULL DEFAULT '0',
  `sdkVersion` int(11) NOT NULL DEFAULT '0',
  `roomName` varchar(50) NOT NULL DEFAULT '',
  `maxPlayer` smallint(6) NOT NULL DEFAULT '0' COMMENT '总人数',
  `currPlayer` smallint(6) NOT NULL DEFAULT '0' COMMENT '当前人数',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - 等待; 1 - 准备中; 2 - 游戏中; 3 - 结算中;',
  `hostUserID` bigint(20) NOT NULL DEFAULT '0' COMMENT '房主UserID',
  `hostNickname` varchar(50) NOT NULL DEFAULT '',
  `hostAvatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`seqid`),
  KEY `fk_battle_room_battle_user1_idx` (`hostUserID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `RDS_battle_user`
--

DROP TABLE IF EXISTS `RDS_battle_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `RDS_battle_user` (
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `loginToken` varchar(45) NOT NULL DEFAULT '',
  `loginTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expireTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`userID`),
  KEY `fk_battle_user_user1_idx` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_champion`
--

DROP TABLE IF EXISTS `battle_champion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_champion` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `rankFirst` int(11) NOT NULL DEFAULT '0' COMMENT '冠军次数',
  `rankSecond` int(11) NOT NULL DEFAULT '0' COMMENT '亚军次数',
  `rankThird` int(11) NOT NULL DEFAULT '0' COMMENT '季军次数',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`gameID`,`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `I_userID` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_champion_log`
--

DROP TABLE IF EXISTS `battle_champion_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_champion_log` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rankDate` varchar(10) NOT NULL DEFAULT '0000-00-00',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `rank` tinyint(4) NOT NULL DEFAULT '0' COMMENT '名次',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`rankDate`,`gameID`,`rank`),
  KEY `I_date` (`rankDate`),
  KEY `I_GameID` (`gameID`),
  KEY `I_userID_ID` (`userID`),
  KEY `I_rank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_defeat`
--

DROP TABLE IF EXISTS `battle_defeat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_defeat` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `defeatCount` bigint(20) NOT NULL DEFAULT '0' COMMENT '击败对手总数',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`gameID`,`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `I_userID_ID` (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_defeat_log`
--

DROP TABLE IF EXISTS `battle_defeat_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_defeat_log` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `defeatID` bigint(20) NOT NULL DEFAULT '0' COMMENT '击败对手ID',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`gameID`,`userID`,`defeatID`),
  KEY `I_GameID` (`gameID`),
  KEY `I_userID_ID` (`userID`),
  KEY `I_defeatID_ID` (`defeatID`)
) ENGINE=MyISAM AUTO_INCREMENT=315 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_lobby_session`
--

DROP TABLE IF EXISTS `battle_lobby_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_lobby_session` (
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `lobbyToken` varchar(45) NOT NULL DEFAULT '',
  `expireTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `gameVersion` int(11) NOT NULL DEFAULT '0',
  `sdkVersion` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_login_log`
--

DROP TABLE IF EXISTS `battle_login_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_login_log` (
  `target` tinyint(4) NOT NULL DEFAULT '0' COMMENT '2-大厅; 3-房间;',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0-login; 1-logout;',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `time` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `roomID` int(11) NOT NULL DEFAULT '0',
  KEY `I_GameID` (`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_Target` (`target`),
  KEY `I_Type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_room_log`
--

DROP TABLE IF EXISTS `battle_room_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_room_log` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `roomID` int(11) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `gameVersion` int(11) NOT NULL DEFAULT '0',
  `sdkVersion` int(11) NOT NULL DEFAULT '0',
  `roomName` varchar(50) NOT NULL DEFAULT '',
  `maxPlayer` smallint(6) NOT NULL DEFAULT '0',
  `currPlayer` smallint(6) NOT NULL DEFAULT '0',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `hostUserID` bigint(20) NOT NULL DEFAULT '0',
  `inUserID` bigint(20) NOT NULL DEFAULT '0' COMMENT '进来的玩家',
  `outUserID` bigint(20) NOT NULL DEFAULT '0' COMMENT '退出的玩家',
  `outUserError` int(11) NOT NULL DEFAULT '0' COMMENT '退出玩家是否有错误码',
  `logTime` varchar(45) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`seqid`),
  KEY `fk_battle_room_log_RDS_battle_room1_idx` (`roomID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_room_session`
--

DROP TABLE IF EXISTS `battle_room_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_room_session` (
  `roomID` varchar(45) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `roomToken` varchar(45) NOT NULL DEFAULT '',
  `expireTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`userID`,`roomID`),
  UNIQUE KEY `UNIQUE` (`roomID`,`userID`),
  KEY `fk_battle_room_session_battle_user1_idx` (`userID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score`
--

DROP TABLE IF EXISTS `battle_score`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `totalRound` int(11) NOT NULL DEFAULT '0' COMMENT '总局数',
  `disconnectRound` int(11) NOT NULL DEFAULT '0' COMMENT '掉线局数',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  `extend_1` int(11) NOT NULL DEFAULT '0',
  `extend_2` int(11) NOT NULL DEFAULT '0',
  `extend_3` int(11) NOT NULL DEFAULT '0',
  `extend_4` int(11) NOT NULL DEFAULT '0',
  `extend_5` int(11) NOT NULL DEFAULT '0',
  `extend_6` int(11) NOT NULL DEFAULT '0',
  `extend_7` int(11) NOT NULL DEFAULT '0',
  `extend_8` int(11) NOT NULL DEFAULT '0',
  `extend_9` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=788 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150604`
--

DROP TABLE IF EXISTS `battle_score_20150604`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150604` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150605`
--

DROP TABLE IF EXISTS `battle_score_20150605`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150605` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150608`
--

DROP TABLE IF EXISTS `battle_score_20150608`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150608` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=72642 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150610`
--

DROP TABLE IF EXISTS `battle_score_20150610`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150610` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=72642 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150611`
--

DROP TABLE IF EXISTS `battle_score_20150611`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150611` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150612`
--

DROP TABLE IF EXISTS `battle_score_20150612`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150612` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150613`
--

DROP TABLE IF EXISTS `battle_score_20150613`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150613` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150614`
--

DROP TABLE IF EXISTS `battle_score_20150614`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150614` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150615`
--

DROP TABLE IF EXISTS `battle_score_20150615`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150615` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150616`
--

DROP TABLE IF EXISTS `battle_score_20150616`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150616` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150617`
--

DROP TABLE IF EXISTS `battle_score_20150617`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150617` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150618`
--

DROP TABLE IF EXISTS `battle_score_20150618`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150618` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150619`
--

DROP TABLE IF EXISTS `battle_score_20150619`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150619` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150620`
--

DROP TABLE IF EXISTS `battle_score_20150620`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150620` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150621`
--

DROP TABLE IF EXISTS `battle_score_20150621`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150621` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150622`
--

DROP TABLE IF EXISTS `battle_score_20150622`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150622` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150623`
--

DROP TABLE IF EXISTS `battle_score_20150623`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150623` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150624`
--

DROP TABLE IF EXISTS `battle_score_20150624`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150624` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150625`
--

DROP TABLE IF EXISTS `battle_score_20150625`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150625` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150626`
--

DROP TABLE IF EXISTS `battle_score_20150626`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150626` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150627`
--

DROP TABLE IF EXISTS `battle_score_20150627`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150627` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150628`
--

DROP TABLE IF EXISTS `battle_score_20150628`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150628` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150629`
--

DROP TABLE IF EXISTS `battle_score_20150629`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150629` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150630`
--

DROP TABLE IF EXISTS `battle_score_20150630`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150630` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150701`
--

DROP TABLE IF EXISTS `battle_score_20150701`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150701` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150703`
--

DROP TABLE IF EXISTS `battle_score_20150703`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150703` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150705`
--

DROP TABLE IF EXISTS `battle_score_20150705`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150705` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150706`
--

DROP TABLE IF EXISTS `battle_score_20150706`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150706` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150707`
--

DROP TABLE IF EXISTS `battle_score_20150707`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150707` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150708`
--

DROP TABLE IF EXISTS `battle_score_20150708`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150708` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150709`
--

DROP TABLE IF EXISTS `battle_score_20150709`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150709` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150710`
--

DROP TABLE IF EXISTS `battle_score_20150710`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150710` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150711`
--

DROP TABLE IF EXISTS `battle_score_20150711`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150711` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150712`
--

DROP TABLE IF EXISTS `battle_score_20150712`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150712` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150713`
--

DROP TABLE IF EXISTS `battle_score_20150713`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150713` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150714`
--

DROP TABLE IF EXISTS `battle_score_20150714`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150714` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150715`
--

DROP TABLE IF EXISTS `battle_score_20150715`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150715` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150716`
--

DROP TABLE IF EXISTS `battle_score_20150716`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150716` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150717`
--

DROP TABLE IF EXISTS `battle_score_20150717`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150717` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150718`
--

DROP TABLE IF EXISTS `battle_score_20150718`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150718` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150719`
--

DROP TABLE IF EXISTS `battle_score_20150719`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150719` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150720`
--

DROP TABLE IF EXISTS `battle_score_20150720`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150720` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150721`
--

DROP TABLE IF EXISTS `battle_score_20150721`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150721` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150722`
--

DROP TABLE IF EXISTS `battle_score_20150722`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150722` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150723`
--

DROP TABLE IF EXISTS `battle_score_20150723`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150723` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150724`
--

DROP TABLE IF EXISTS `battle_score_20150724`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150724` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150725`
--

DROP TABLE IF EXISTS `battle_score_20150725`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150725` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150726`
--

DROP TABLE IF EXISTS `battle_score_20150726`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150726` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150727`
--

DROP TABLE IF EXISTS `battle_score_20150727`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150727` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150812`
--

DROP TABLE IF EXISTS `battle_score_20150812`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150812` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150813`
--

DROP TABLE IF EXISTS `battle_score_20150813`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150813` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150814`
--

DROP TABLE IF EXISTS `battle_score_20150814`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150814` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150815`
--

DROP TABLE IF EXISTS `battle_score_20150815`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150815` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150817`
--

DROP TABLE IF EXISTS `battle_score_20150817`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150817` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150818`
--

DROP TABLE IF EXISTS `battle_score_20150818`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150818` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150819`
--

DROP TABLE IF EXISTS `battle_score_20150819`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150819` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150820`
--

DROP TABLE IF EXISTS `battle_score_20150820`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150820` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150821`
--

DROP TABLE IF EXISTS `battle_score_20150821`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150821` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150822`
--

DROP TABLE IF EXISTS `battle_score_20150822`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150822` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150823`
--

DROP TABLE IF EXISTS `battle_score_20150823`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150823` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150824`
--

DROP TABLE IF EXISTS `battle_score_20150824`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150824` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150825`
--

DROP TABLE IF EXISTS `battle_score_20150825`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150825` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150826`
--

DROP TABLE IF EXISTS `battle_score_20150826`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150826` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150827`
--

DROP TABLE IF EXISTS `battle_score_20150827`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150827` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150828`
--

DROP TABLE IF EXISTS `battle_score_20150828`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150828` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150829`
--

DROP TABLE IF EXISTS `battle_score_20150829`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150829` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150830`
--

DROP TABLE IF EXISTS `battle_score_20150830`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150830` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150831`
--

DROP TABLE IF EXISTS `battle_score_20150831`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150831` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150901`
--

DROP TABLE IF EXISTS `battle_score_20150901`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150901` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150902`
--

DROP TABLE IF EXISTS `battle_score_20150902`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150902` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150903`
--

DROP TABLE IF EXISTS `battle_score_20150903`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150903` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150904`
--

DROP TABLE IF EXISTS `battle_score_20150904`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150904` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150905`
--

DROP TABLE IF EXISTS `battle_score_20150905`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150905` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150906`
--

DROP TABLE IF EXISTS `battle_score_20150906`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150906` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150907`
--

DROP TABLE IF EXISTS `battle_score_20150907`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150907` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150908`
--

DROP TABLE IF EXISTS `battle_score_20150908`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150908` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150909`
--

DROP TABLE IF EXISTS `battle_score_20150909`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150909` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150910`
--

DROP TABLE IF EXISTS `battle_score_20150910`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150910` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150911`
--

DROP TABLE IF EXISTS `battle_score_20150911`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150911` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150912`
--

DROP TABLE IF EXISTS `battle_score_20150912`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150912` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150913`
--

DROP TABLE IF EXISTS `battle_score_20150913`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150913` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150914`
--

DROP TABLE IF EXISTS `battle_score_20150914`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150914` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150915`
--

DROP TABLE IF EXISTS `battle_score_20150915`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150915` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150916`
--

DROP TABLE IF EXISTS `battle_score_20150916`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150916` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150917`
--

DROP TABLE IF EXISTS `battle_score_20150917`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150917` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150918`
--

DROP TABLE IF EXISTS `battle_score_20150918`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150918` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150919`
--

DROP TABLE IF EXISTS `battle_score_20150919`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150919` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150920`
--

DROP TABLE IF EXISTS `battle_score_20150920`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150920` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150921`
--

DROP TABLE IF EXISTS `battle_score_20150921`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150921` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150922`
--

DROP TABLE IF EXISTS `battle_score_20150922`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150922` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150923`
--

DROP TABLE IF EXISTS `battle_score_20150923`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150923` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150924`
--

DROP TABLE IF EXISTS `battle_score_20150924`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150924` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150925`
--

DROP TABLE IF EXISTS `battle_score_20150925`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150925` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150926`
--

DROP TABLE IF EXISTS `battle_score_20150926`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150926` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150927`
--

DROP TABLE IF EXISTS `battle_score_20150927`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150927` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150928`
--

DROP TABLE IF EXISTS `battle_score_20150928`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150928` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150929`
--

DROP TABLE IF EXISTS `battle_score_20150929`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150929` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20150930`
--

DROP TABLE IF EXISTS `battle_score_20150930`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20150930` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151001`
--

DROP TABLE IF EXISTS `battle_score_20151001`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151001` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151002`
--

DROP TABLE IF EXISTS `battle_score_20151002`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151002` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151003`
--

DROP TABLE IF EXISTS `battle_score_20151003`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151003` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151004`
--

DROP TABLE IF EXISTS `battle_score_20151004`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151004` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151005`
--

DROP TABLE IF EXISTS `battle_score_20151005`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151005` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151006`
--

DROP TABLE IF EXISTS `battle_score_20151006`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151006` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151007`
--

DROP TABLE IF EXISTS `battle_score_20151007`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151007` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151008`
--

DROP TABLE IF EXISTS `battle_score_20151008`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151008` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151009`
--

DROP TABLE IF EXISTS `battle_score_20151009`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151009` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151010`
--

DROP TABLE IF EXISTS `battle_score_20151010`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151010` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151011`
--

DROP TABLE IF EXISTS `battle_score_20151011`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151011` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151012`
--

DROP TABLE IF EXISTS `battle_score_20151012`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151012` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151013`
--

DROP TABLE IF EXISTS `battle_score_20151013`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151013` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151014`
--

DROP TABLE IF EXISTS `battle_score_20151014`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151014` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151015`
--

DROP TABLE IF EXISTS `battle_score_20151015`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151015` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151016`
--

DROP TABLE IF EXISTS `battle_score_20151016`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151016` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151017`
--

DROP TABLE IF EXISTS `battle_score_20151017`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151017` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151018`
--

DROP TABLE IF EXISTS `battle_score_20151018`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151018` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151019`
--

DROP TABLE IF EXISTS `battle_score_20151019`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151019` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151020`
--

DROP TABLE IF EXISTS `battle_score_20151020`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151020` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151021`
--

DROP TABLE IF EXISTS `battle_score_20151021`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151021` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151022`
--

DROP TABLE IF EXISTS `battle_score_20151022`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151022` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151023`
--

DROP TABLE IF EXISTS `battle_score_20151023`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151023` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151024`
--

DROP TABLE IF EXISTS `battle_score_20151024`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151024` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151025`
--

DROP TABLE IF EXISTS `battle_score_20151025`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151025` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151026`
--

DROP TABLE IF EXISTS `battle_score_20151026`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151026` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151027`
--

DROP TABLE IF EXISTS `battle_score_20151027`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151027` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151028`
--

DROP TABLE IF EXISTS `battle_score_20151028`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151028` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151029`
--

DROP TABLE IF EXISTS `battle_score_20151029`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151029` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151030`
--

DROP TABLE IF EXISTS `battle_score_20151030`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151030` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151031`
--

DROP TABLE IF EXISTS `battle_score_20151031`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151031` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151101`
--

DROP TABLE IF EXISTS `battle_score_20151101`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151101` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151102`
--

DROP TABLE IF EXISTS `battle_score_20151102`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151102` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151103`
--

DROP TABLE IF EXISTS `battle_score_20151103`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151103` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151104`
--

DROP TABLE IF EXISTS `battle_score_20151104`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151104` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151105`
--

DROP TABLE IF EXISTS `battle_score_20151105`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151105` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151106`
--

DROP TABLE IF EXISTS `battle_score_20151106`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151106` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151107`
--

DROP TABLE IF EXISTS `battle_score_20151107`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151107` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151108`
--

DROP TABLE IF EXISTS `battle_score_20151108`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151108` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151109`
--

DROP TABLE IF EXISTS `battle_score_20151109`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151109` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151110`
--

DROP TABLE IF EXISTS `battle_score_20151110`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151110` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151111`
--

DROP TABLE IF EXISTS `battle_score_20151111`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151111` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151112`
--

DROP TABLE IF EXISTS `battle_score_20151112`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151112` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151113`
--

DROP TABLE IF EXISTS `battle_score_20151113`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151113` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_20151114`
--

DROP TABLE IF EXISTS `battle_score_20151114`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_20151114` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_YYYYMMDD`
--

DROP TABLE IF EXISTS `battle_score_YYYYMMDD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_YYYYMMDD` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL DEFAULT '0',
  `lastRank` int(11) NOT NULL DEFAULT '0',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `avatar` varchar(255) NOT NULL DEFAULT '',
  `editTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  UNIQUE KEY `UNIQUE` (`userID`,`gameID`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `iRank` (`rank`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_log`
--

DROP TABLE IF EXISTS `battle_score_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_log` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `roundID` bigint(20) NOT NULL DEFAULT '0' COMMENT '对战流水号',
  `userID` bigint(20) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `gameVersion` int(11) NOT NULL DEFAULT '0' COMMENT '游戏版本',
  `userList` varchar(100) NOT NULL DEFAULT '' COMMENT '参与玩家ID字符串,ID1-ID2,ID需要正向排序',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  `extend_0` int(11) NOT NULL DEFAULT '0',
  `extend_1` int(11) NOT NULL DEFAULT '0',
  `extend_2` int(11) NOT NULL DEFAULT '0',
  `extend_3` int(11) NOT NULL DEFAULT '0',
  `extend_4` int(11) NOT NULL DEFAULT '0',
  `extend_5` int(11) NOT NULL DEFAULT '0',
  `extend_6` int(11) NOT NULL DEFAULT '0',
  `extend_7` int(11) NOT NULL DEFAULT '0',
  `extend_8` int(11) NOT NULL DEFAULT '0',
  `extend_9` int(11) NOT NULL DEFAULT '0',
  `arbitrate` varchar(32) NOT NULL DEFAULT '',
  PRIMARY KEY (`seqid`),
  KEY `I_UserID` (`userID`),
  KEY `I_GameID` (`gameID`),
  KEY `I_RoundID` (`roundID`),
  KEY `I_UserList` (`userList`),
  KEY `I_Arbitrate` (`arbitrate`)
) ENGINE=MyISAM AUTO_INCREMENT=17356 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_progress`
--

DROP TABLE IF EXISTS `battle_score_progress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_progress` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `userList` varchar(100) NOT NULL DEFAULT '' COMMENT '参与玩家ID字符串,ID1-ID2,ID按P1..P4排列',
  `userCount` int(11) NOT NULL DEFAULT '0',
  `p1_ID` bigint(20) NOT NULL DEFAULT '0',
  `p2_ID` bigint(20) NOT NULL DEFAULT '0',
  `p3_ID` bigint(20) NOT NULL DEFAULT '0',
  `p4_ID` bigint(20) NOT NULL DEFAULT '0',
  `p1_name` varchar(50) NOT NULL DEFAULT '',
  `p2_name` varchar(50) NOT NULL DEFAULT '',
  `p3_name` varchar(50) NOT NULL DEFAULT '',
  `p4_name` varchar(50) NOT NULL DEFAULT '',
  `p1_avatar` varchar(255) NOT NULL DEFAULT '',
  `p2_avatar` varchar(255) NOT NULL DEFAULT '',
  `p3_avatar` varchar(255) NOT NULL DEFAULT '',
  `p4_avatar` varchar(255) NOT NULL DEFAULT '',
  `p1_extend_0` int(11) NOT NULL DEFAULT '0',
  `p2_extend_0` int(11) NOT NULL DEFAULT '0',
  `p3_extend_0` int(11) NOT NULL DEFAULT '0',
  `p4_extend_0` int(11) NOT NULL DEFAULT '0',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  KEY `I_GameID` (`gameID`),
  KEY `I_P1_ID` (`p1_ID`),
  KEY `I_P2_ID` (`p2_ID`),
  KEY `I_P3_ID` (`p3_ID`),
  KEY `I_P4_ID` (`p4_ID`),
  KEY `I_InputTime` (`inputTime`)
) ENGINE=MyISAM AUTO_INCREMENT=26146740 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `battle_score_progress_temp`
--

DROP TABLE IF EXISTS `battle_score_progress_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `battle_score_progress_temp` (
  `seqid` int(11) NOT NULL AUTO_INCREMENT,
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `userList` varchar(100) NOT NULL DEFAULT '' COMMENT '参与玩家ID字符串,ID1-ID2,ID按P1..P4排列',
  `userCount` int(11) NOT NULL DEFAULT '0',
  `p1_ID` bigint(20) NOT NULL DEFAULT '0',
  `p2_ID` bigint(20) NOT NULL DEFAULT '0',
  `p3_ID` bigint(20) NOT NULL DEFAULT '0',
  `p4_ID` bigint(20) NOT NULL DEFAULT '0',
  `p1_name` varchar(50) NOT NULL DEFAULT '',
  `p2_name` varchar(50) NOT NULL DEFAULT '',
  `p3_name` varchar(50) NOT NULL DEFAULT '',
  `p4_name` varchar(50) NOT NULL DEFAULT '',
  `p1_avatar` varchar(255) NOT NULL DEFAULT '',
  `p2_avatar` varchar(255) NOT NULL DEFAULT '',
  `p3_avatar` varchar(255) NOT NULL DEFAULT '',
  `p4_avatar` varchar(255) NOT NULL DEFAULT '',
  `p1_extend_0` int(11) NOT NULL DEFAULT '0',
  `p2_extend_0` int(11) NOT NULL DEFAULT '0',
  `p3_extend_0` int(11) NOT NULL DEFAULT '0',
  `p4_extend_0` int(11) NOT NULL DEFAULT '0',
  `scoreA` int(11) NOT NULL DEFAULT '0',
  `scoreB` int(11) NOT NULL DEFAULT '0',
  `scoreC` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqid`),
  KEY `I_GameID` (`gameID`),
  KEY `I_P1_ID` (`p1_ID`),
  KEY `I_P2_ID` (`p2_ID`),
  KEY `I_P3_ID` (`p3_ID`),
  KEY `I_P4_ID` (`p4_ID`),
  KEY `I_InputTime` (`inputTime`)
) ENGINE=MyISAM AUTO_INCREMENT=706 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-13 15:11:40




















-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ko_pay
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
-- Table structure for table `balance`
--

DROP TABLE IF EXISTS `balance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `balance` (
  `userid` int(11) NOT NULL,
  `balance` int(10) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `keypay`
--

DROP TABLE IF EXISTS `keypay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keypay` (
  `keycode` varchar(128) NOT NULL,
  `balance` int(10) NOT NULL,
  PRIMARY KEY (`keycode`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-13 15:11:40




















-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ko_product
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_info` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0' COMMENT '此field有值时表示此商品属于某游戏',
  `openID` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '商品类型，0 钻石 1 金币 2 兑换券 3 普通货币',
  `productName` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `buyTimeStart` varchar(19) NOT NULL DEFAULT '' COMMENT '商品开卖时间',
  `buyTimeEnd` varchar(19) NOT NULL DEFAULT '' COMMENT '商品结束售卖时间',
  `timeExpire` int(11) NOT NULL DEFAULT '0' COMMENT '过期时间长度，以秒为单位',
  `price` int(11) NOT NULL DEFAULT '0' COMMENT '一个单位等价的钻分，若为0则表示低于钻分，按照rate计算价值',
  `rate` int(11) NOT NULL DEFAULT '0' COMMENT '一个钻分可兑换的数量',
  `count` int(11) NOT NULL DEFAULT '0' COMMENT '存货数量',
  PRIMARY KEY (`productID`),
  UNIQUE KEY `productName` (`productName`,`gameID`),
  KEY `IGameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-13 15:11:41




















-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ko_sns
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `areaID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `areaName` varchar(512) NOT NULL DEFAULT '' COMMENT 'åœ°åŒº',
  PRIMARY KEY (`areaID`)
) ENGINE=MyISAM AUTO_INCREMENT=6152724 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arena_battle_game`
--

DROP TABLE IF EXISTS `arena_battle_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arena_battle_game` (
  `arenaGameID` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0',
  `minVersion` int(11) NOT NULL DEFAULT '0' COMMENT '最低版本号',
  `gameBgImg` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏Item的背景',
  `gameIcon` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏Item浮在上面的伪3D人物',
  `gameNameImg` varchar(255) NOT NULL DEFAULT '' COMMENT '游戏Item浮在上面的图标',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 待上线:0 上线:1 下线:2',
  `guideUrl` varchar(299) NOT NULL DEFAULT '' COMMENT '游戏指引',
  `innerPID` int(11) NOT NULL DEFAULT '13' COMMENT '内部产品ID',
  `listOrder` int(11) NOT NULL DEFAULT '0',
  `icon_url` varchar(255) NOT NULL DEFAULT '' COMMENT '手机端需要ICON_URL',
  `playType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '游戏玩法类型1：手柄游戏2：手机游戏3：遥控器游戏4：体感游戏5：飞鼠游戏',
  PRIMARY KEY (`arenaGameID`),
  KEY `I_gameID_PID` (`innerPID`,`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arena_battle_game_channel`
--

DROP TABLE IF EXISTS `arena_battle_game_channel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arena_battle_game_channel` (
  `seqID` bigint(20) NOT NULL AUTO_INCREMENT,
  `arenaGameID` int(11) NOT NULL DEFAULT '0',
  `channelIDShow` int(11) NOT NULL DEFAULT '0' COMMENT '只在该渠道显示',
  `channelIDNotShow` int(11) NOT NULL DEFAULT '0' COMMENT '不在该渠道显示',
  PRIMARY KEY (`seqID`),
  KEY `I_arenaGameID` (`arenaGameID`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arena_event`
--

DROP TABLE IF EXISTS `arena_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arena_event` (
  `eventID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `background` varchar(255) NOT NULL DEFAULT '' COMMENT '背景',
  `foreground` varchar(255) NOT NULL DEFAULT '' COMMENT '前景',
  `logo` varchar(255) NOT NULL DEFAULT '' COMMENT '前景',
  `text` varchar(100) NOT NULL DEFAULT '' COMMENT '文字',
  `minVersion` int(11) NOT NULL DEFAULT '0' COMMENT '最小版本',
  `startDate` varchar(10) NOT NULL DEFAULT '0000-00-00' COMMENT '开始时间',
  `endDate` varchar(10) NOT NULL DEFAULT '0000-00-00' COMMENT '结束时间',
  `startTime` varchar(8) NOT NULL DEFAULT '00:00:00' COMMENT '开始时间',
  `endTime` varchar(8) NOT NULL DEFAULT '00:00:00' COMMENT '结束时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0: 下架; 1: 进行中;',
  `commandType` tinyint(4) NOT NULL DEFAULT '0' COMMENT '指令编码;0无action，1有action',
  `commandName` varchar(255) NOT NULL DEFAULT '' COMMENT '指令Action',
  `commandParams` text NOT NULL COMMENT '指令参数',
  PRIMARY KEY (`eventID`),
  KEY `I_commandType` (`commandType`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `arena_game_access_rule`
--

DROP TABLE IF EXISTS `arena_game_access_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arena_game_access_rule` (
  `seqID` bigint(20) NOT NULL AUTO_INCREMENT,
  `arenaGameID` int(11) NOT NULL DEFAULT '0',
  `ruleID` tinyint(5) NOT NULL DEFAULT '0' COMMENT '规则类型ID（1为渠道，2为IP）',
  `controlType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1只在该渠道显示或0禁止在该渠道显示',
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '渠道名称',
  PRIMARY KEY (`seqID`),
  UNIQUE KEY `uq_key` (`arenaGameID`,`ruleID`,`controlType`),
  KEY `I_arenaGameID` (`arenaGameID`),
  KEY `I_ruleID` (`ruleID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `countryID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `countryName` varchar(256) NOT NULL DEFAULT '' COMMENT 'å›½å',
  PRIMARY KEY (`countryID`)
) ENGINE=MyISAM AUTO_INCREMENT=6152715 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_main_notice`
--

DROP TABLE IF EXISTS `game_main_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_main_notice` (
  `seqID` int(11) NOT NULL AUTO_INCREMENT,
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `appVersion` int(11) NOT NULL DEFAULT '0' COMMENT '应用APP的versionCode',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 未审核:0 已审核:2 下线：4',
  `description` varchar(240) NOT NULL DEFAULT '文字',
  `descriptionEn` varchar(240) NOT NULL DEFAULT '英文文字',
  `type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '类型 0 图片  1 视频',
  `position` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 左 1 中 2 右 3大图',
  `imageUrl` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  PRIMARY KEY (`seqID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `game_rank_post_config`
--

DROP TABLE IF EXISTS `game_rank_post_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `game_rank_post_config` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0' COMMENT '游戏ID',
  `rank` int(11) NOT NULL DEFAULT '0' COMMENT '排行，需要产生动态',
  UNIQUE KEY `UNIQUE` (`postID`,`gameID`,`rank`),
  KEY `I_GameID` (`gameID`),
  KEY `I_rank` (`rank`),
  KEY `I_postID` (`postID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip_address`
--

DROP TABLE IF EXISTS `ip_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_address` (
  `IP1` int(10) unsigned NOT NULL COMMENT 'èµ·å§‹IP',
  `IP2` int(10) unsigned NOT NULL COMMENT 'ç»“æŸIP',
  `countryID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'å›½å®¶ID',
  `areaID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'åœ°åŒºID',
  PRIMARY KEY (`IP1`,`IP2`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ip_ctrl`
--

DROP TABLE IF EXISTS `ip_ctrl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ip_ctrl` (
  `ctrlID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `programID` int(10) unsigned NOT NULL DEFAULT '0',
  `flag` int(11) NOT NULL DEFAULT '1' COMMENT '0: ä¸å¯ç”¨; 1: pass; 2: deter',
  `countryID` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'å›½å®¶ID',
  PRIMARY KEY (`ctrlID`,`programID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `post_template`
--

DROP TABLE IF EXISTS `post_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post_template` (
  `postID` int(11) NOT NULL AUTO_INCREMENT,
  `template` varchar(255) NOT NULL DEFAULT '' COMMENT '输出格式',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '输出格式说明',
  PRIMARY KEY (`postID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sns_packet`
--

DROP TABLE IF EXISTS `sns_packet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sns_packet` (
  `packetID` int(11) NOT NULL AUTO_INCREMENT,
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 未审核:0 已审核:2 下线：4',
  `descriptionTitle` varchar(240) NOT NULL DEFAULT '大文字',
  `description` varchar(240) NOT NULL DEFAULT '小文字',
  `imageUrl` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  PRIMARY KEY (`packetID`)
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sns_packet_product`
--

DROP TABLE IF EXISTS `sns_packet_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sns_packet_product` (
  `seqID` int(11) NOT NULL AUTO_INCREMENT,
  `packetID` int(11) NOT NULL DEFAULT '0',
  `productID` int(11) NOT NULL DEFAULT '0',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`seqID`),
  KEY `I_PacketProduct` (`packetID`,`productID`)
) ENGINE=MyISAM AUTO_INCREMENT=106 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sns_packet_rec`
--

DROP TABLE IF EXISTS `sns_packet_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sns_packet_rec` (
  `seqID` int(11) NOT NULL AUTO_INCREMENT,
  `packetID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `getTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '领取时间',
  PRIMARY KEY (`seqID`),
  KEY `I_PacketProduct` (`packetID`,`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=67 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system_notice`
--

DROP TABLE IF EXISTS `system_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_notice` (
  `seqID` int(11) NOT NULL AUTO_INCREMENT,
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00',
  `gameID` int(11) NOT NULL DEFAULT '0',
  `appVersion` int(11) NOT NULL DEFAULT '0' COMMENT '应用APP的versionCode',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 未审核:0 已审核:2 下线：4',
  `description` varchar(240) NOT NULL DEFAULT '文字',
  `descriptionEn` varchar(240) NOT NULL DEFAULT '英文文字',
  `imageUrl` varchar(255) NOT NULL DEFAULT '' COMMENT '图片链接',
  `innerID` tinyint(3) NOT NULL DEFAULT '13' COMMENT '内部平台ID 13 手机 14 TV',
  PRIMARY KEY (`seqID`),
  KEY `I_GameID` (`gameID`)
) ENGINE=MyISAM AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_post`
--

DROP TABLE IF EXISTS `user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_post` (
  `seqID` bigint(20) NOT NULL AUTO_INCREMENT,
  `gameID` int(11) NOT NULL DEFAULT '0',
  `userID` int(11) NOT NULL DEFAULT '0',
  `postID` int(11) NOT NULL DEFAULT '0' COMMENT 'post_template.postID',
  `postDate` varchar(10) NOT NULL DEFAULT '0000-00-00' COMMENT '动态时间',
  `inputTime` varchar(19) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '发生时间',
  `param` varchar(255) NOT NULL DEFAULT '' COMMENT '输出参数值',
  `userList` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`seqID`),
  KEY `I_gameID` (`gameID`),
  KEY `I_userID` (`userID`),
  KEY `I_postID` (`postID`)
) ENGINE=MyISAM AUTO_INCREMENT=2148 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `video_access_rule`
--

DROP TABLE IF EXISTS `video_access_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `video_access_rule` (
  `seqID` bigint(20) NOT NULL AUTO_INCREMENT,
  `ruleID` tinyint(5) NOT NULL DEFAULT '0' COMMENT '规则类型ID（0为渠道，1为IP）',
  `controlType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1只在该渠道显示或0禁止在该渠道显示',
  `rule` varchar(255) NOT NULL DEFAULT '' COMMENT '渠道名称',
  PRIMARY KEY (`seqID`),
  UNIQUE KEY `uq_key` (`ruleID`,`controlType`),
  KEY `I_ruleID` (`ruleID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-13 15:11:41




















-- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
--
-- Host: localhost    Database: ko_stat
-- ------------------------------------------------------
-- Server version	5.1.73-log

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-13 15:11:41




















