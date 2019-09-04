-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 192.168.0.135    Database: sarah_core_db
-- ------------------------------------------------------
-- Server version	5.7.26-0ubuntu0.18.04.1

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
-- Table structure for table `sarah_alert_01`
--

DROP TABLE IF EXISTS `sarah_alert_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_alert_01` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '报警的节点Id',
  `alert_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '警报的类型（1-负载，2-RAM，3-DISK，4-上传带宽，5-下载带宽）',
  `alert_value_json` varchar(255) NOT NULL DEFAULT '0' COMMENT '警报类型值json数据包',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `readed_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '标记为阅读时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `node_id` (`node_id`,`created_at`,`alert_type`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='节点警报数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_alert_01`
--

LOCK TABLES `sarah_alert_01` WRITE;
/*!40000 ALTER TABLE `sarah_alert_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_alert_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_alert_02`
--

DROP TABLE IF EXISTS `sarah_alert_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_alert_02` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '报警的节点Id',
  `alert_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '警报的类型（1-负载，2-RAM，3-DISK，4-上传带宽，5-下载带宽）',
  `alert_value_json` varchar(255) NOT NULL DEFAULT '0' COMMENT '警报类型值json数据包',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `readed_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '标记为阅读时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `node_id` (`node_id`,`created_at`,`alert_type`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='节点警报数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_alert_02`
--

LOCK TABLES `sarah_alert_02` WRITE;
/*!40000 ALTER TABLE `sarah_alert_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_alert_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_alert_03`
--

DROP TABLE IF EXISTS `sarah_alert_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_alert_03` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '报警的节点Id',
  `alert_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '警报的类型（1-负载，2-RAM，3-DISK，4-上传带宽，5-下载带宽）',
  `alert_value_json` varchar(255) NOT NULL DEFAULT '0' COMMENT '警报类型值json数据包',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `readed_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '标记为阅读时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `node_id` (`node_id`,`created_at`,`alert_type`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='节点警报数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_alert_03`
--

LOCK TABLES `sarah_alert_03` WRITE;
/*!40000 ALTER TABLE `sarah_alert_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_alert_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_alert_04`
--

DROP TABLE IF EXISTS `sarah_alert_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_alert_04` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '报警的节点Id',
  `alert_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '警报的类型（1-负载，2-RAM，3-DISK，4-上传带宽，5-下载带宽）',
  `alert_value_json` varchar(255) NOT NULL DEFAULT '0' COMMENT '警报类型值json数据包',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `readed_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '标记为阅读时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `node_id` (`node_id`,`created_at`,`alert_type`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='节点警报数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_alert_04`
--

LOCK TABLES `sarah_alert_04` WRITE;
/*!40000 ALTER TABLE `sarah_alert_04` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_alert_04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_alert_05`
--

DROP TABLE IF EXISTS `sarah_alert_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_alert_05` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '报警的节点Id',
  `alert_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '警报的类型（1-负载，2-RAM，3-DISK，4-上传带宽，5-下载带宽）',
  `alert_value_json` varchar(255) NOT NULL DEFAULT '0' COMMENT '警报类型值json数据包',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `readed_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '标记为阅读时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `node_id` (`node_id`,`created_at`,`alert_type`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='节点警报数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_alert_05`
--

LOCK TABLES `sarah_alert_05` WRITE;
/*!40000 ALTER TABLE `sarah_alert_05` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_alert_05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_alert_06`
--

DROP TABLE IF EXISTS `sarah_alert_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_alert_06` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '报警的节点Id',
  `alert_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '警报的类型（1-负载，2-RAM，3-DISK，4-上传带宽，5-下载带宽）',
  `alert_value_json` varchar(255) NOT NULL DEFAULT '0' COMMENT '警报类型值json数据包',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `readed_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '标记为阅读时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `node_id` (`node_id`,`created_at`,`alert_type`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='节点警报数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_alert_06`
--

LOCK TABLES `sarah_alert_06` WRITE;
/*!40000 ALTER TABLE `sarah_alert_06` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_alert_06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_alert_07`
--

DROP TABLE IF EXISTS `sarah_alert_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_alert_07` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '报警的节点Id',
  `alert_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '警报的类型（1-负载，2-RAM，3-DISK，4-上传带宽，5-下载带宽）',
  `alert_value_json` varchar(255) NOT NULL DEFAULT '0' COMMENT '警报类型值json数据包',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `readed_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '标记为阅读时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `node_id` (`node_id`,`created_at`,`alert_type`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='节点警报数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_alert_07`
--

LOCK TABLES `sarah_alert_07` WRITE;
/*!40000 ALTER TABLE `sarah_alert_07` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_alert_07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_alert_receiver`
--

DROP TABLE IF EXISTS `sarah_alert_receiver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_alert_receiver` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(12) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '接收者姓名',
  `mobile` char(15) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '接收者手机号码(带国际区号)',
  `email` varchar(48) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '接收者电子邮件',
  `wx_openid` varchar(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '接收者公号的openid',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_alert_receiver`
--

LOCK TABLES `sarah_alert_receiver` WRITE;
/*!40000 ALTER TABLE `sarah_alert_receiver` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_alert_receiver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_alert_sample`
--

DROP TABLE IF EXISTS `sarah_alert_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_alert_sample` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '主键',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '报警的节点Id',
  `alert_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '警报的类型（1-负载，2-RAM，3-DISK，4-上传带宽，5-下载带宽,6-故障）',
  `alert_value_json` varchar(255) NOT NULL DEFAULT '0' COMMENT '警报类型值json数据包',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `readed_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '标记为阅读时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `node_id` (`node_id`,`created_at`,`alert_type`) USING BTREE,
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='节点警报数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_alert_sample`
--

LOCK TABLES `sarah_alert_sample` WRITE;
/*!40000 ALTER TABLE `sarah_alert_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_alert_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_alert_setting`
--

DROP TABLE IF EXISTS `sarah_alert_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_alert_setting` (
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `open_alert` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '是否开启报警（0-关闭，1-开启）',
  `alert_mask` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '警报通知方式掩码(1<<0-短信，1<<1-邮件，1<<2-微信公号)',
  `alert_interval` int(11) unsigned NOT NULL DEFAULT '30' COMMENT '警报间隔(单位分钟，默认30)',
  `alert_item_config` varchar(255) DEFAULT NULL COMMENT '警报项目设置(loadavg:0.4, ram_percent:0.6, disk_percent: 0.8, incoming_bd: 1204, outgoing_bd:1024)',
  `alert_text_tpl` varchar(255) DEFAULT NULL COMMENT '警报内容文字模板',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  UNIQUE KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='节点警报数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_alert_setting`
--

LOCK TABLES `sarah_alert_setting` WRITE;
/*!40000 ALTER TABLE `sarah_alert_setting` DISABLE KEYS */;
INSERT INTO `sarah_alert_setting` VALUES (1,0,13,0,'{\"loadavg\":\"0.8\",\"ram_percent\":\"0.8\",\"disk_percent\":\"0.8\",\"incoming_bd\":\"40960\",\"outgoing_bd\":\"4096000\"}','',1555494969);
/*!40000 ALTER TABLE `sarah_alert_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application`
--

DROP TABLE IF EXISTS `sarah_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '应用的名称',
  `intro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '应用的简介',
  `icon_url` varchar(255) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '应用的桌面图标',
  `install_engine` char(4) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '安装脚本引擎',
  `install_script` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '程序安装脚本逻辑',
  `startup_engine` char(4) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '启动脚本引擎',
  `startup_script` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '程序启动命令',
  `stop_engine` char(4) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '停止脚本引擎',
  `stop_script` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '停止脚本',
  `uninstall_engine` char(4) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '卸载脚本引擎',
  `uninstall_script` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '程序卸载脚本逻辑',
  `config_json` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '应用配置json{autostart:bool, monitor:bool, post_dynamic:bool,install_dir:string,log_file:string,data_dir:string,version:string,eg..}',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='应用程序数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_application`
--

LOCK TABLES `sarah_application` WRITE;
/*!40000 ALTER TABLE `sarah_application` DISABLE KEYS */;
INSERT INTO `sarah_application` VALUES (6664818919214945861,'Go-IPFS','星际文件系统IPFS（Inter-Planetary File System）是一个面向全球的、点对点的分布式版本文件系统，目标是为了补充（甚至是取代）目前统治互联网的超文本传输协议（HTTP），将所有具有相同文件系统的计算设备连接在一起。原理用基于内容的地址替代基于域名的地址，也就是用户寻找的不是某个地址而是储存在某个地方的内容，不需要验证发送者的身份，而只需要验证内容的哈希，通过这样可以让网页的速度更快、更安全、更健壮、更持久。该应用程序经由正舵者技术团队优化和编译，便于sarahos用户直接批量安装，启动和运行监测。通过这样可以让网页的速度更快、更安全、更健壮、更持久。','/static/image/desktop/icon-ipfs.png','lua','local appm = import(\'app.install\');\r\nlocal app = appm.new(executor, argv);\r\nif ( app:check_argv() == false ) then\r\n    return false;\r\nend\r\nlocal lock = app:getLock();\r\nif ( lock:lock() == false ) then\r\n    return false;\r\nend\r\nif ( app:init() == false ) then\r\n    lock:unlock();\r\n    return false;\r\nend\r\nlocal src_url  = \"http://linux.mirrors.grandhelmsman.com/go-ipfs-v1.0\";\r\nlocal status = app:install(src_url);\r\nlock:unlock();\r\nreturn status;','lua','local appm = import(\'app.boot\');\r\nlocal app = appm.new(executor, argv);\r\nif ( app:check_argv() == false ) then\r\n    return false;\r\nend\r\nlocal lock = app:getLock();\r\nif ( lock:lock() == false ) then\r\n    return false;\r\nend\r\napp:tryStop();\r\nif ( app:init() == false ) then\r\n    lock:unlock();\r\n    return false;\r\nend\r\nif ( app:bootup() == false ) then\r\n    lock:unlock();\r\n    return false;\r\nend\r\nlock:unlock();\r\napp:monitor();','lua','local appm = import(\'app.stop\');\r\nlocal app = appm.new(executor, argv);\r\nif ( app:check_argv() == false ) then\r\n    return false;\r\nend\r\nlocal lock = app:getLock();\r\nif ( lock:lock() == false ) then\r\n    return false;\r\nend\r\nlocal status = app:stop();\r\nlock:unlock();\r\nreturn status;','lua','local appm = import(\'app.uninstall\');\r\nlocal app = appm.new(executor, argv);\r\nif ( app:check_argv() == false ) then\r\n    return false;\r\nend\r\nlocal lock = app:getLock();\r\nif ( lock:lock() == false ) then\r\n    return false;\r\nend\r\nif ( app:init() == false ) then\r\n    lock:unlock();\r\n    return false;\r\nend\r\nlocal status = app:uninstall();\r\nlock:unlock();\r\nreturn status;','{\"exe_file\":{\"value\":\"go-ipfs\",\"desc\":\"\\u53ef\\u6267\\u884c\\u7a0b\\u5e8f\\u540d\\u79f0\"},\"bootup\":{\"value\":true,\"desc\":\"\\u5f00\\u673a\\u542f\\u52a8\"},\"monitor\":{\"value\":true,\"desc\":\"\\u8fdb\\u7a0b\\u76d1\\u6d4b\"},\"dynamic\":{\"value\":false,\"desc\":\"\\u63a8\\u9001\\u8fdb\\u7a0b\\u52a8\\u6001\"},\"base_dir\":{\"value\":\"\\/opt\\/Go-IPFS\",\"desc\":\"\\u5e94\\u7528\\u6839\\u76ee\\u5f55\"},\"log_dir\":{\"value\":\"\\/data\\/Go-IPFS\\/log\",\"desc\":\"\\u65e5\\u5fd7\\u76ee\\u5f55\"},\"data_dir\":{\"value\":\"\\/data\\/Go-IPFS\\/data\",\"desc\":\"\\u6570\\u636e\\u76ee\\u5f55\"},\"uninstall_rm_file\":{\"value\":true,\"desc\":\"\\u5378\\u8f7d\\u65f6\\u5220\\u9664\\u5b89\\u88c5\\u6587\\u4ef6\"},\"uninstall_rm_log\":{\"value\":false,\"desc\":\"\\u5378\\u8f7d\\u65f6\\u662f\\u5426\\u5220\\u9664\\u65e5\\u5fd7\"},\"uninstall_rm_data\":{\"value\":false,\"desc\":\"\\u5378\\u8f7d\\u65f6\\u662f\\u5426\\u5220\\u9664\\u6570\\u636e(\\u8c28\\u614e)\"},\"app_init_cmd\":{\"value\":\"${base_dir}\\/${exe_file} init\",\"desc\":\"\\u5e94\\u7528\\u521d\\u59cb\\u5316\\u547d\\u4ee4\"},\"app_boot_cmd\":{\"value\":\"${base_dir}\\/${exe_file} daemon\",\"desc\":\"\\u5e94\\u7528\\u542f\\u52a8\\u547d\\u4ee4\"},\"_env_IPFS_PATH\":{\"value\":\"${data_dir}\",\"desc\":\"IPFS_PATH\\u73af\\u5883\\u53d8\\u91cf\"}}',1552878431,0),(6664482342454433349,'Go-Filecoin','Filecoin是一个去中心化存储网络，也叫做Filecoin的区块链，Filecoin进行了ICO，代币名称为FIL。Filecoin与IPFS是两个项目，IPFS是底层协议，并没有ICO。FIlecoin区块链中的矿工可以通过为客户提供存储来获取FIL。相反的，客户可以通过花费FIL雇佣矿工来存储或分发数据。Go-Filecoin是filecoin的golang实现版本，该应用程序经由正舵者技术团队优化和编译，便于sarahos用户直接批量安装，启动并且监测运行情况。更多详情请访问Filecoin官网：http://filecoin.io/','/static/image/desktop/icon-filecoin.png','lua','local appm = import(\'app.install\');\r\nlocal app = appm.new(executor, argv);\r\nif ( app:check_argv() == false ) then\r\n    return false;\r\nend\r\nlocal lock = app:getLock();\r\nif ( lock:lock() == false ) then\r\n    return false;\r\nend\r\nif ( app:init() == false ) then\r\n    lock:unlock();\r\n    return false;\r\nend\r\nlocal src_url  = \"http://linux.mirrors.grandhelmsman.com/go-filecoin-v1.0\";\r\nlocal status = app:install(src_url);\r\nlock:unlock();\r\nreturn status;','lua','local appm = import(\'app.boot\');\r\nlocal app = appm.new(executor, argv);\r\nif ( app:check_argv() == false ) then\r\n    return false;\r\nend\r\nlocal lock = app:getLock();\r\nif ( lock:lock() == false ) then\r\n    return false;\r\nend\r\napp:tryStop();\r\nif ( app:init() == false ) then\r\n    lock:unlock();\r\n    return false;\r\nend\r\nif ( app:bootup() == false ) then\r\n    lock:unlock();\r\n    return false;\r\nend\r\nlock:unlock();\r\napp:monitor();','lua','local appm = import(\'app.stop\');\r\nlocal app = appm.new(executor, argv);\r\nif ( app:check_argv() == false ) then\r\n    return false;\r\nend\r\nlocal lock = app:getLock();\r\nif ( lock:lock() == false ) then\r\n    return false;\r\nend\r\nlocal status = app:stop();\r\nlock:unlock();\r\nreturn status;','lua','local appm = import(\'app.uninstall\');\r\nlocal app = appm.new(executor, argv);\r\nif ( app:check_argv() == false ) then\r\n    return false;\r\nend\r\nlocal lock = app:getLock();\r\nif ( lock:lock() == false ) then\r\n    return false;\r\nend\r\nif ( app:init() == false ) then\r\n    lock:unlock();\r\n    return false;\r\nend\r\nlocal status = app:uninstall();\r\nlock:unlock();\r\nreturn status;','{\"exe_file\":{\"value\":\"go-filecoin\",\"desc\":\"\\u53ef\\u6267\\u884c\\u7a0b\\u5e8f\\u540d\\u79f0\"},\"bootup\":{\"value\":true,\"desc\":\"\\u5f00\\u673a\\u542f\\u52a8\"},\"monitor\":{\"value\":true,\"desc\":\"\\u8fdb\\u7a0b\\u76d1\\u6d4b\"},\"dynamic\":{\"value\":false,\"desc\":\"\\u63a8\\u9001\\u8fdb\\u7a0b\\u52a8\\u6001\"},\"base_dir\":{\"value\":\"\\/opt\\/Go-Filecoin\",\"desc\":\"\\u5e94\\u7528\\u6839\\u76ee\\u5f55\"},\"log_dir\":{\"value\":\"\\/data\\/Go-Filecoin\\/log\",\"desc\":\"\\u65e5\\u5fd7\\u76ee\\u5f55\"},\"data_dir\":{\"value\":\"\\/data\\/Go-Filecoin\\/data\",\"desc\":\"\\u6570\\u636e\\u76ee\\u5f55\"},\"uninstall_rm_file\":{\"value\":true,\"desc\":\"\\u5378\\u8f7d\\u65f6\\u5220\\u9664\\u5b89\\u88c5\\u6587\\u4ef6\"},\"uninstall_rm_log\":{\"value\":false,\"desc\":\"\\u5378\\u8f7d\\u65f6\\u662f\\u5426\\u5220\\u9664\\u65e5\\u5fd7\"},\"uninstall_rm_data\":{\"value\":false,\"desc\":\"\\u5378\\u8f7d\\u65f6\\u662f\\u5426\\u5220\\u9664\\u6570\\u636e(\\u8c28\\u614e)\"},\"app_init_cmd\":{\"value\":\"${base_dir}\\/${exe_file} init --devnet-user --genesisfile=http:\\/\\/user.kittyhawk.wtf:8020\\/genesis.car --repodir=${data_dir}\",\"desc\":\"\\u5e94\\u7528\\u521d\\u59cb\\u5316\\u547d\\u4ee4\"},\"app_boot_cmd\":{\"value\":\"${base_dir}\\/${exe_file} daemon --repodir=${data_dir}\",\"desc\":\"\\u5e94\\u7528\\u542f\\u52a8\\u547d\\u4ee4\"}}',1552878423,0);
/*!40000 ALTER TABLE `sarah_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_sample`
--

DROP TABLE IF EXISTS `sarah_application_node_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_sample` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `app_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '应用Id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属的节点Id',
  `config_json` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '节点应用配置（继承自用户应用配置）',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '应用当前状态（0-未安装，1-安装中，2-未启动，3-启动中，4-运行中，5-停止中，6-卸载中，7-已卸载）',
  `cmd_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分发的指令Id',
  `opt_status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次操作的status（1-安装中，2-安装失败，3-安装成功，4-启动中，5-启动失败，6-启动成功，7-停止中，8-停止失败，9-停止成功，10-卸载中，11-卸载成功，12-卸载失败）',
  `progress` float(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '操作进度',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '应用进程id',
  `stat_json` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '应用运行的统计信息(CPU，内存等)',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `started_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '任务开始时间',
  `finished_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '任务完成时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近一次更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `app_id_2` (`app_id`,`node_id`),
  KEY `app_id` (`app_id`,`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='应用的节点安装分布数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_application_node_sample`
--

LOCK TABLES `sarah_application_node_sample` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_task_sample`
--

DROP TABLE IF EXISTS `sarah_application_task_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_task_sample` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `app_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属应用Id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `opt_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '操作类型（1-安装，2-启动，3-停止，4-卸载）',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍或者备注',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部节点，2-自定义节点，3-最佳的十个节点，4-全部非故障节点，5-随机一个非故障节点，6-第一个非故障节点，7-最新一个非故障节点，8-全部未xx的非故障节点)',
  `distribute_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分发的计算节点数',
  `completed_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已完成计算的节点数',
  `dist_node_id_set` longtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT '分发的节点id集合，使用,隔开，非全部分发时用',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '任务创建时间',
  `started_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '任务启动时间',
  `done_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '任务完成时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `app_id` (`app_id`,`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='应用管理任务数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_application_task_sample`
--

LOCK TABLES `sarah_application_task_sample` WRITE;
/*!40000 ALTER TABLE `sarah_application_task_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_task_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_sample`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_sample` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `task_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属任务Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分发的节点Id',
  `cmd_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '计算对应的命令Id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '指令运行状态(同cmd的status)',
  `progress` float(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '指令运行的进度(0-1，同cmd的progress)',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `task_id` (`task_id`,`node_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='分布式计算任务的分发记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_computing_task_dist_sample`
--

LOCK TABLES `sarah_computing_task_dist_sample` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_sample`
--

DROP TABLE IF EXISTS `sarah_computing_task_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_sample` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部节点，2-自定义节点，3-最佳的十个节点，4-全部非故障节点，5-随机一个非故障节点，6-第一个非故障节点，7-最新一个非故障节点)',
  `distribute_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '分发的计算节点数',
  `completed_num` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已完成计算的节点数',
  `engine` char(4) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '脚本引擎',
  `logic_code` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '脚本逻辑代码',
  `sarah_sign` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT 'sarah-script生成的16位签名',
  `dist_node_id_set` longtext CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT '分发的节点id集合，使用,隔开，非全部分发时用',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '任务创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  `started_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '任务启动时间',
  `done_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '任务完成时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='分布式计算任务数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_computing_task_sample`
--

LOCK TABLES `sarah_computing_task_sample` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_demo`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_demo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_demo` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `pid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属的父类的Id（默认为0）',
  `file` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '文件名称或者路径',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小(字节)',
  `hash` char(46) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '文件的hash地址',
  `mimetype` varchar(48) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '文件的统一mime类型',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间',
  PRIMARY KEY (`Id`),
  KEY `user_id` (`user_id`,`pid`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='IPFS存储记录数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_ipfs_files_demo`
--

LOCK TABLES `sarah_ipfs_files_demo` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_demo` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_demo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_01`
--

DROP TABLE IF EXISTS `sarah_node_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_01` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '节点名称',
  `d_sign` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '动态信息的md5签名(version+interval+cpu_cores+ram_kb+disk_kb+ip_addr)',
  `sarah_ver` float(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'sarah collector的版本号',
  `sarah_interval` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'sarah collector的收集间隔(s)',
  `cpu_cores` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'CPU核数',
  `ram_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内存的kb数',
  `disk_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '磁盘的kb数',
  `ip_addr` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'v4的网络地址',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `s_updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id_2` (`user_id`,`node_uid`),
  KEY `user_id` (`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_01`
--

LOCK TABLES `sarah_node_01` WRITE;
/*!40000 ALTER TABLE `sarah_node_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_02`
--

DROP TABLE IF EXISTS `sarah_node_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_02` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '节点名称',
  `d_sign` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '动态信息的md5签名(version+interval+cpu_cores+ram_kb+disk_kb+ip_addr)',
  `sarah_ver` float(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'sarah collector的版本号',
  `sarah_interval` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'sarah collector的收集间隔(s)',
  `cpu_cores` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'CPU核数',
  `ram_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内存的kb数',
  `disk_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '磁盘的kb数',
  `ip_addr` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'v4的网络地址',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `s_updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id_2` (`user_id`,`node_uid`),
  KEY `user_id` (`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_02`
--

LOCK TABLES `sarah_node_02` WRITE;
/*!40000 ALTER TABLE `sarah_node_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_03`
--

DROP TABLE IF EXISTS `sarah_node_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_03` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '节点名称',
  `d_sign` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '动态信息的md5签名(version+interval+cpu_cores+ram_kb+disk_kb+ip_addr)',
  `sarah_ver` float(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'sarah collector的版本号',
  `sarah_interval` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'sarah collector的收集间隔(s)',
  `cpu_cores` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'CPU核数',
  `ram_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内存的kb数',
  `disk_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '磁盘的kb数',
  `ip_addr` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'v4的网络地址',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `s_updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id_2` (`user_id`,`node_uid`),
  KEY `user_id` (`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_03`
--

LOCK TABLES `sarah_node_03` WRITE;
/*!40000 ALTER TABLE `sarah_node_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_04`
--

DROP TABLE IF EXISTS `sarah_node_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_04` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '节点名称',
  `d_sign` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '动态信息的md5签名(version+interval+cpu_cores+ram_kb+disk_kb+ip_addr)',
  `sarah_ver` float(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'sarah collector的版本号',
  `sarah_interval` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'sarah collector的收集间隔(s)',
  `cpu_cores` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'CPU核数',
  `ram_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内存的kb数',
  `disk_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '磁盘的kb数',
  `ip_addr` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'v4的网络地址',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `s_updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id_2` (`user_id`,`node_uid`),
  KEY `user_id` (`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_04`
--

LOCK TABLES `sarah_node_04` WRITE;
/*!40000 ALTER TABLE `sarah_node_04` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_05`
--

DROP TABLE IF EXISTS `sarah_node_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_05` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '节点名称',
  `d_sign` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '动态信息的md5签名(version+interval+cpu_cores+ram_kb+disk_kb+ip_addr)',
  `sarah_ver` float(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'sarah collector的版本号',
  `sarah_interval` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'sarah collector的收集间隔(s)',
  `cpu_cores` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'CPU核数',
  `ram_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内存的kb数',
  `disk_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '磁盘的kb数',
  `ip_addr` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'v4的网络地址',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `s_updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id_2` (`user_id`,`node_uid`),
  KEY `user_id` (`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_05`
--

LOCK TABLES `sarah_node_05` WRITE;
/*!40000 ALTER TABLE `sarah_node_05` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_06`
--

DROP TABLE IF EXISTS `sarah_node_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_06` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '节点名称',
  `d_sign` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '动态信息的md5签名(version+interval+cpu_cores+ram_kb+disk_kb+ip_addr)',
  `sarah_ver` float(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'sarah collector的版本号',
  `sarah_interval` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'sarah collector的收集间隔(s)',
  `cpu_cores` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'CPU核数',
  `ram_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内存的kb数',
  `disk_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '磁盘的kb数',
  `ip_addr` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'v4的网络地址',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `s_updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id_2` (`user_id`,`node_uid`),
  KEY `user_id` (`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_06`
--

LOCK TABLES `sarah_node_06` WRITE;
/*!40000 ALTER TABLE `sarah_node_06` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_07`
--

DROP TABLE IF EXISTS `sarah_node_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_07` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '节点名称',
  `d_sign` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '动态信息的md5签名(version+interval+cpu_cores+ram_kb+disk_kb+ip_addr)',
  `sarah_ver` float(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'sarah collector的版本号',
  `sarah_interval` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'sarah collector的收集间隔(s)',
  `cpu_cores` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'CPU核数',
  `ram_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内存的kb数',
  `disk_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '磁盘的kb数',
  `ip_addr` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'v4的网络地址',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `s_updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id_2` (`user_id`,`node_uid`),
  KEY `user_id` (`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_07`
--

LOCK TABLES `sarah_node_07` WRITE;
/*!40000 ALTER TABLE `sarah_node_07` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_sample`
--

DROP TABLE IF EXISTS `sarah_node_cmd_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_sample` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '节点注册Id',
  `t_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务的类型(0-终端命令，1-computing, 2-application)',
  `task_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属task的Id(默认为0表示不属于任何任务)',
  `sync_mask` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '状态同步汇报控制mask',
  `status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '命令状态（0-待执行，1-执行中，2-执行完成，`-1`-执行失败）',
  `progress` float(3,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '任务的执行进度(0~1)',
  `cmd_argv` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '命令参数',
  `cmd_text` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '命令内容(shell指令或者engine逻辑代码块)',
  `res_data` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '命令执行结果数据',
  `res_error` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '执行错误信息',
  `engine` char(4) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '执行引擎名称(bash|lua)',
  `sign` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '命令md5签名值',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送时间(时间戳)',
  `pull_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '命令被拉取的时间戳',
  `exec_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '命令开始执行的时间戳',
  `done_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '命令执行完成的时间戳',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `node_id` (`node_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='节点远程命令数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_cmd_sample`
--

LOCK TABLES `sarah_node_cmd_sample` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_disk_dynamic_sample`
--

DROP TABLE IF EXISTS `sarah_node_disk_dynamic_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_disk_dynamic_sample` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `device` varchar(128) NOT NULL DEFAULT '0' COMMENT '磁盘设备名称',
  `action` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '动作(1-新增，2-拔出，3-损坏)',
  `disk_info` text CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL COMMENT '磁盘信息json(inode,iused,size,used)',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`Id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='节点磁盘动态数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_disk_dynamic_sample`
--

LOCK TABLES `sarah_node_disk_dynamic_sample` WRITE;
/*!40000 ALTER TABLE `sarah_node_disk_dynamic_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_disk_dynamic_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_sample`
--

DROP TABLE IF EXISTS `sarah_node_post_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_sample` (
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '节点注册Id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `load_avg` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '1分钟内的loadavg值',
  `ram_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '内存使用率',
  `disk_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '磁盘使用率',
  `incoming_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载带宽(Bytes)',
  `outgoing_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传带宽(Bytes)',
  `stat_json` longtext CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '原始统计的json数据',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '统计时间',
  UNIQUE KEY `node_id` (`node_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='节点统计数据提交数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_post_sample`
--

LOCK TABLES `sarah_node_post_sample` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_sample`
--

DROP TABLE IF EXISTS `sarah_node_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_sample` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `name` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '节点名称',
  `d_sign` char(32) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '动态信息的md5签名(version+interval+cpu_cores+ram_kb+disk_kb+ip_addr)',
  `sarah_ver` float(6,2) unsigned NOT NULL DEFAULT '0.00' COMMENT 'sarah collector的版本号',
  `sarah_interval` mediumint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'sarah collector的收集间隔(s)',
  `cpu_cores` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'CPU核数',
  `ram_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '内存的kb数',
  `disk_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '磁盘的kb数',
  `ip_addr` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'v4的网络地址',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `s_updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id_2` (`user_id`,`node_uid`),
  KEY `user_id` (`user_id`,`created_at`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_sample`
--

LOCK TABLES `sarah_node_sample` WRITE;
/*!40000 ALTER TABLE `sarah_node_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_statistics_01`
--

DROP TABLE IF EXISTS `sarah_node_statistics_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_statistics_01` (
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '节点注册Id',
  `_node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点状态(0-down, 1-running, 2-rebooting)',
  `load_avg` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '1分钟内的loadavg值',
  `ram_used_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已用内用kb数',
  `ram_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '内存使用率',
  `disk_used_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '已用磁盘kb数',
  `disk_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '磁盘使用率',
  `incoming_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载带宽(Bytes)',
  `outgoing_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传带宽(Bytes)',
  `stat_json` text CHARACTER SET latin1 COLLATE latin1_general_ci COMMENT '最近一次的统计json数据',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近统计时间',
  PRIMARY KEY (`node_id`),
  KEY `user_id` (`_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点统计数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_statistics_01`
--

LOCK TABLES `sarah_node_statistics_01` WRITE;
/*!40000 ALTER TABLE `sarah_node_statistics_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_statistics_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_statistics_02`
--

DROP TABLE IF EXISTS `sarah_node_statistics_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_statistics_02` (
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '节点注册Id',
  `_node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点状态(0-down, 1-running, 2-rebooting)',
  `load_avg` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '1分钟内的loadavg值',
  `ram_used_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已用内用kb数',
  `ram_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '内存使用率',
  `disk_used_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '已用磁盘kb数',
  `disk_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '磁盘使用率',
  `incoming_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载带宽(Bytes)',
  `outgoing_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传带宽(Bytes)',
  `stat_json` text CHARACTER SET latin1 COLLATE latin1_general_ci COMMENT '最近一次的统计json数据',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近统计时间',
  PRIMARY KEY (`node_id`),
  KEY `user_id` (`_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点统计数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_statistics_02`
--

LOCK TABLES `sarah_node_statistics_02` WRITE;
/*!40000 ALTER TABLE `sarah_node_statistics_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_statistics_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_statistics_03`
--

DROP TABLE IF EXISTS `sarah_node_statistics_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_statistics_03` (
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '节点注册Id',
  `_node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点状态(0-down, 1-running, 2-rebooting)',
  `load_avg` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '1分钟内的loadavg值',
  `ram_used_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已用内用kb数',
  `ram_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '内存使用率',
  `disk_used_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '已用磁盘kb数',
  `disk_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '磁盘使用率',
  `incoming_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载带宽(Bytes)',
  `outgoing_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传带宽(Bytes)',
  `stat_json` text CHARACTER SET latin1 COLLATE latin1_general_ci COMMENT '最近一次的统计json数据',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近统计时间',
  PRIMARY KEY (`node_id`),
  KEY `user_id` (`_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点统计数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_statistics_03`
--

LOCK TABLES `sarah_node_statistics_03` WRITE;
/*!40000 ALTER TABLE `sarah_node_statistics_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_statistics_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_statistics_04`
--

DROP TABLE IF EXISTS `sarah_node_statistics_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_statistics_04` (
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '节点注册Id',
  `_node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点状态(0-down, 1-running, 2-rebooting)',
  `load_avg` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '1分钟内的loadavg值',
  `ram_used_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已用内用kb数',
  `ram_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '内存使用率',
  `disk_used_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '已用磁盘kb数',
  `disk_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '磁盘使用率',
  `incoming_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载带宽(Bytes)',
  `outgoing_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传带宽(Bytes)',
  `stat_json` text CHARACTER SET latin1 COLLATE latin1_general_ci COMMENT '最近一次的统计json数据',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近统计时间',
  PRIMARY KEY (`node_id`),
  KEY `user_id` (`_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点统计数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_statistics_04`
--

LOCK TABLES `sarah_node_statistics_04` WRITE;
/*!40000 ALTER TABLE `sarah_node_statistics_04` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_statistics_04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_statistics_05`
--

DROP TABLE IF EXISTS `sarah_node_statistics_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_statistics_05` (
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '节点注册Id',
  `_node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点状态(0-down, 1-running, 2-rebooting)',
  `load_avg` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '1分钟内的loadavg值',
  `ram_used_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已用内用kb数',
  `ram_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '内存使用率',
  `disk_used_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '已用磁盘kb数',
  `disk_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '磁盘使用率',
  `incoming_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载带宽(Bytes)',
  `outgoing_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传带宽(Bytes)',
  `stat_json` text CHARACTER SET latin1 COLLATE latin1_general_ci COMMENT '最近一次的统计json数据',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近统计时间',
  PRIMARY KEY (`node_id`),
  KEY `user_id` (`_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点统计数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_statistics_05`
--

LOCK TABLES `sarah_node_statistics_05` WRITE;
/*!40000 ALTER TABLE `sarah_node_statistics_05` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_statistics_05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_statistics_06`
--

DROP TABLE IF EXISTS `sarah_node_statistics_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_statistics_06` (
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '节点注册Id',
  `_node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点状态(0-down, 1-running, 2-rebooting)',
  `load_avg` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '1分钟内的loadavg值',
  `ram_used_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已用内用kb数',
  `ram_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '内存使用率',
  `disk_used_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '已用磁盘kb数',
  `disk_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '磁盘使用率',
  `incoming_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载带宽(Bytes)',
  `outgoing_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传带宽(Bytes)',
  `stat_json` text CHARACTER SET latin1 COLLATE latin1_general_ci COMMENT '最近一次的统计json数据',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近统计时间',
  PRIMARY KEY (`node_id`),
  KEY `user_id` (`_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点统计数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_statistics_06`
--

LOCK TABLES `sarah_node_statistics_06` WRITE;
/*!40000 ALTER TABLE `sarah_node_statistics_06` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_statistics_06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_statistics_07`
--

DROP TABLE IF EXISTS `sarah_node_statistics_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_statistics_07` (
  `node_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '节点注册Id',
  `_node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点状态(0-down, 1-running, 2-rebooting)',
  `load_avg` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '1分钟内的loadavg值',
  `ram_used_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已用内用kb数',
  `ram_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '内存使用率',
  `disk_used_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '已用磁盘kb数',
  `disk_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '磁盘使用率',
  `incoming_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载带宽(Bytes)',
  `outgoing_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传带宽(Bytes)',
  `stat_json` text CHARACTER SET latin1 COLLATE latin1_general_ci COMMENT '最近一次的统计json数据',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近统计时间',
  PRIMARY KEY (`node_id`),
  KEY `user_id` (`_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点统计数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_statistics_07`
--

LOCK TABLES `sarah_node_statistics_07` WRITE;
/*!40000 ALTER TABLE `sarah_node_statistics_07` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_statistics_07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_statistics_sample`
--

DROP TABLE IF EXISTS `sarah_node_statistics_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_statistics_sample` (
  `node_id` bigint(11) unsigned NOT NULL DEFAULT '0' COMMENT '节点注册Id',
  `_node_uid` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '节点uid',
  `_user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点状态(0-down, 1-running, 2-rebooting)',
  `load_avg` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '1分钟内的loadavg值',
  `ram_used_kb` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '已用内用kb数',
  `ram_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '内存使用率',
  `disk_used_kb` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '已用磁盘kb数',
  `disk_utilization` float(7,3) unsigned NOT NULL DEFAULT '0.000' COMMENT '磁盘使用率',
  `incoming_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载带宽(Bytes)',
  `outgoing_bd` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传带宽(Bytes)',
  `stat_json` text CHARACTER SET latin1 COLLATE latin1_general_ci COMMENT '最近一次的统计json数据',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最近统计时间',
  PRIMARY KEY (`node_id`),
  KEY `user_id` (`_user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='主机节点统计数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_node_statistics_sample`
--

LOCK TABLES `sarah_node_statistics_sample` WRITE;
/*!40000 ALTER TABLE `sarah_node_statistics_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_statistics_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_user`
--

DROP TABLE IF EXISTS `sarah_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_user` (
  `Id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `username` varchar(20) COLLATE latin1_general_cs NOT NULL DEFAULT '0' COMMENT '用户名',
  `passwd` char(40) COLLATE latin1_general_cs NOT NULL DEFAULT '0' COMMENT '用户密码sha1加密',
  `pass_salt` char(6) COLLATE latin1_general_cs NOT NULL DEFAULT '0' COMMENT '用户密码盐值',
  `service_passwd` char(40) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '服务密码(sha1加密)',
  `service_psalt` char(6) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '服务密码盐值',
  `llogin_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `llogin_ip` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录ip',
  `created_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后修改时间！',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs COMMENT='用户数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_user`
--

LOCK TABLES `sarah_user` WRITE;
/*!40000 ALTER TABLE `sarah_user` DISABLE KEYS */;
INSERT INTO `sarah_user` VALUES (1,'sarah','d95ad42fe06a3dca3721818840b4ecbb8aa71cdb','On22VH','3eda606097db7a27eeb425d71c749b377017c692','ONbPxx',1558086208,3232235643,1544431241,1557473788);
/*!40000 ALTER TABLE `sarah_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_user_application_01`
--

DROP TABLE IF EXISTS `sarah_user_application_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_user_application_01` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `app_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属应用Id',
  `config_json` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '应用配置（继承app的）',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '应用安装时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`,`created_at`),
  UNIQUE KEY `user_id_2` (`user_id`,`app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='用户应用信息数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_user_application_01`
--

LOCK TABLES `sarah_user_application_01` WRITE;
/*!40000 ALTER TABLE `sarah_user_application_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_user_application_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_user_application_02`
--

DROP TABLE IF EXISTS `sarah_user_application_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_user_application_02` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `app_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属应用Id',
  `config_json` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '应用配置（继承app的）',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '应用安装时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`,`created_at`),
  UNIQUE KEY `user_id_2` (`user_id`,`app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='用户应用信息数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_user_application_02`
--

LOCK TABLES `sarah_user_application_02` WRITE;
/*!40000 ALTER TABLE `sarah_user_application_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_user_application_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_user_application_03`
--

DROP TABLE IF EXISTS `sarah_user_application_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_user_application_03` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `app_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属应用Id',
  `config_json` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '应用配置（继承app的）',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '应用安装时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`,`created_at`),
  UNIQUE KEY `user_id_2` (`user_id`,`app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='用户应用信息数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_user_application_03`
--

LOCK TABLES `sarah_user_application_03` WRITE;
/*!40000 ALTER TABLE `sarah_user_application_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_user_application_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_user_application_sample`
--

DROP TABLE IF EXISTS `sarah_user_application_sample`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_user_application_sample` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `app_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '所属应用Id',
  `config_json` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '应用配置（继承app的）',
  `created_at` int(11) NOT NULL DEFAULT '0' COMMENT '应用安装时间',
  `updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`Id`),
  UNIQUE KEY `user_id` (`user_id`,`created_at`),
  UNIQUE KEY `user_id_2` (`user_id`,`app_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='用户应用信息数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_user_application_sample`
--

LOCK TABLES `sarah_user_application_sample` WRITE;
/*!40000 ALTER TABLE `sarah_user_application_sample` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_user_application_sample` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_user_profile`
--

DROP TABLE IF EXISTS `sarah_user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_user_profile` (
  `user_id` int(11) unsigned NOT NULL COMMENT '唯一主键',
  `app_key` char(48) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '应用授权key',
  `skin_name` varchar(15) CHARACTER SET latin1 COLLATE latin1_general_ci NOT NULL DEFAULT '0' COMMENT '当前使用的UI皮肤名称',
  `product_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '产品名称',
  `_updated_at` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='用户配置信息数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sarah_user_profile`
--

LOCK TABLES `sarah_user_profile` WRITE;
/*!40000 ALTER TABLE `sarah_user_profile` DISABLE KEYS */;
INSERT INTO `sarah_user_profile` VALUES (1,'d13a24676a6370bf58b7d74546f30bf0000000015c0e2689','embed','未命名项目',1555311601);
/*!40000 ALTER TABLE `sarah_user_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-28 18:22:43
