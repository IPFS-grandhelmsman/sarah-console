-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 192.168.0.135    Database: sarah_computing_db
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
-- Table structure for table `sarah_application_node_01`
--

DROP TABLE IF EXISTS `sarah_application_node_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_01` (
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
-- Dumping data for table `sarah_application_node_01`
--

LOCK TABLES `sarah_application_node_01` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_02`
--

DROP TABLE IF EXISTS `sarah_application_node_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_02` (
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
-- Dumping data for table `sarah_application_node_02`
--

LOCK TABLES `sarah_application_node_02` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_03`
--

DROP TABLE IF EXISTS `sarah_application_node_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_03` (
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
-- Dumping data for table `sarah_application_node_03`
--

LOCK TABLES `sarah_application_node_03` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_04`
--

DROP TABLE IF EXISTS `sarah_application_node_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_04` (
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
-- Dumping data for table `sarah_application_node_04`
--

LOCK TABLES `sarah_application_node_04` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_04` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_05`
--

DROP TABLE IF EXISTS `sarah_application_node_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_05` (
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
-- Dumping data for table `sarah_application_node_05`
--

LOCK TABLES `sarah_application_node_05` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_05` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_06`
--

DROP TABLE IF EXISTS `sarah_application_node_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_06` (
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
-- Dumping data for table `sarah_application_node_06`
--

LOCK TABLES `sarah_application_node_06` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_06` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_07`
--

DROP TABLE IF EXISTS `sarah_application_node_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_07` (
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
-- Dumping data for table `sarah_application_node_07`
--

LOCK TABLES `sarah_application_node_07` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_07` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_08`
--

DROP TABLE IF EXISTS `sarah_application_node_08`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_08` (
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
-- Dumping data for table `sarah_application_node_08`
--

LOCK TABLES `sarah_application_node_08` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_08` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_08` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_09`
--

DROP TABLE IF EXISTS `sarah_application_node_09`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_09` (
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
-- Dumping data for table `sarah_application_node_09`
--

LOCK TABLES `sarah_application_node_09` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_09` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_09` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_10`
--

DROP TABLE IF EXISTS `sarah_application_node_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_10` (
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
-- Dumping data for table `sarah_application_node_10`
--

LOCK TABLES `sarah_application_node_10` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_10` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_11`
--

DROP TABLE IF EXISTS `sarah_application_node_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_11` (
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
-- Dumping data for table `sarah_application_node_11`
--

LOCK TABLES `sarah_application_node_11` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_11` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_12`
--

DROP TABLE IF EXISTS `sarah_application_node_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_12` (
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
-- Dumping data for table `sarah_application_node_12`
--

LOCK TABLES `sarah_application_node_12` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_12` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_node_13`
--

DROP TABLE IF EXISTS `sarah_application_node_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_node_13` (
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
-- Dumping data for table `sarah_application_node_13`
--

LOCK TABLES `sarah_application_node_13` WRITE;
/*!40000 ALTER TABLE `sarah_application_node_13` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_node_13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_task_01`
--

DROP TABLE IF EXISTS `sarah_application_task_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_task_01` (
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
-- Dumping data for table `sarah_application_task_01`
--

LOCK TABLES `sarah_application_task_01` WRITE;
/*!40000 ALTER TABLE `sarah_application_task_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_task_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_task_02`
--

DROP TABLE IF EXISTS `sarah_application_task_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_task_02` (
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
-- Dumping data for table `sarah_application_task_02`
--

LOCK TABLES `sarah_application_task_02` WRITE;
/*!40000 ALTER TABLE `sarah_application_task_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_task_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_task_03`
--

DROP TABLE IF EXISTS `sarah_application_task_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_task_03` (
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
-- Dumping data for table `sarah_application_task_03`
--

LOCK TABLES `sarah_application_task_03` WRITE;
/*!40000 ALTER TABLE `sarah_application_task_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_task_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_task_04`
--

DROP TABLE IF EXISTS `sarah_application_task_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_task_04` (
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
-- Dumping data for table `sarah_application_task_04`
--

LOCK TABLES `sarah_application_task_04` WRITE;
/*!40000 ALTER TABLE `sarah_application_task_04` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_task_04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_task_05`
--

DROP TABLE IF EXISTS `sarah_application_task_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_task_05` (
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
-- Dumping data for table `sarah_application_task_05`
--

LOCK TABLES `sarah_application_task_05` WRITE;
/*!40000 ALTER TABLE `sarah_application_task_05` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_task_05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_task_06`
--

DROP TABLE IF EXISTS `sarah_application_task_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_task_06` (
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
-- Dumping data for table `sarah_application_task_06`
--

LOCK TABLES `sarah_application_task_06` WRITE;
/*!40000 ALTER TABLE `sarah_application_task_06` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_task_06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_application_task_07`
--

DROP TABLE IF EXISTS `sarah_application_task_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_application_task_07` (
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
-- Dumping data for table `sarah_application_task_07`
--

LOCK TABLES `sarah_application_task_07` WRITE;
/*!40000 ALTER TABLE `sarah_application_task_07` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_application_task_07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_01`
--

DROP TABLE IF EXISTS `sarah_computing_task_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_01` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_01`
--

LOCK TABLES `sarah_computing_task_01` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_02`
--

DROP TABLE IF EXISTS `sarah_computing_task_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_02` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_02`
--

LOCK TABLES `sarah_computing_task_02` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_03`
--

DROP TABLE IF EXISTS `sarah_computing_task_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_03` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_03`
--

LOCK TABLES `sarah_computing_task_03` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_04`
--

DROP TABLE IF EXISTS `sarah_computing_task_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_04` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_04`
--

LOCK TABLES `sarah_computing_task_04` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_04` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_05`
--

DROP TABLE IF EXISTS `sarah_computing_task_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_05` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_05`
--

LOCK TABLES `sarah_computing_task_05` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_05` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_06`
--

DROP TABLE IF EXISTS `sarah_computing_task_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_06` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_06`
--

LOCK TABLES `sarah_computing_task_06` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_06` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_07`
--

DROP TABLE IF EXISTS `sarah_computing_task_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_07` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_07`
--

LOCK TABLES `sarah_computing_task_07` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_07` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_08`
--

DROP TABLE IF EXISTS `sarah_computing_task_08`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_08` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_08`
--

LOCK TABLES `sarah_computing_task_08` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_08` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_08` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_09`
--

DROP TABLE IF EXISTS `sarah_computing_task_09`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_09` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_09`
--

LOCK TABLES `sarah_computing_task_09` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_09` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_09` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_10`
--

DROP TABLE IF EXISTS `sarah_computing_task_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_10` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_10`
--

LOCK TABLES `sarah_computing_task_10` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_10` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_11`
--

DROP TABLE IF EXISTS `sarah_computing_task_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_11` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_11`
--

LOCK TABLES `sarah_computing_task_11` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_11` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_12`
--

DROP TABLE IF EXISTS `sarah_computing_task_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_12` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_12`
--

LOCK TABLES `sarah_computing_task_12` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_12` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_13`
--

DROP TABLE IF EXISTS `sarah_computing_task_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_13` (
  `Id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '唯一主键(Syrian生成)',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属用户Id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务名称',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT '任务介绍',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '任务状态(0-就绪，1-运行中，2-已完成)',
  `dist_type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '节点分发类型(1-全部，2-列表选择，3-jnode的topx)',
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
-- Dumping data for table `sarah_computing_task_13`
--

LOCK TABLES `sarah_computing_task_13` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_13` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_01`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_01` (
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
-- Dumping data for table `sarah_computing_task_dist_01`
--

LOCK TABLES `sarah_computing_task_dist_01` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_02`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_02` (
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
-- Dumping data for table `sarah_computing_task_dist_02`
--

LOCK TABLES `sarah_computing_task_dist_02` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_03`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_03` (
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
-- Dumping data for table `sarah_computing_task_dist_03`
--

LOCK TABLES `sarah_computing_task_dist_03` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_04`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_04` (
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
-- Dumping data for table `sarah_computing_task_dist_04`
--

LOCK TABLES `sarah_computing_task_dist_04` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_04` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_05`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_05` (
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
-- Dumping data for table `sarah_computing_task_dist_05`
--

LOCK TABLES `sarah_computing_task_dist_05` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_05` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_06`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_06` (
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
-- Dumping data for table `sarah_computing_task_dist_06`
--

LOCK TABLES `sarah_computing_task_dist_06` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_06` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_07`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_07` (
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
-- Dumping data for table `sarah_computing_task_dist_07`
--

LOCK TABLES `sarah_computing_task_dist_07` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_07` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_08`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_08`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_08` (
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
-- Dumping data for table `sarah_computing_task_dist_08`
--

LOCK TABLES `sarah_computing_task_dist_08` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_08` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_08` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_09`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_09`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_09` (
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
-- Dumping data for table `sarah_computing_task_dist_09`
--

LOCK TABLES `sarah_computing_task_dist_09` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_09` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_09` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_10`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_10` (
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
-- Dumping data for table `sarah_computing_task_dist_10`
--

LOCK TABLES `sarah_computing_task_dist_10` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_10` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_11`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_11` (
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
-- Dumping data for table `sarah_computing_task_dist_11`
--

LOCK TABLES `sarah_computing_task_dist_11` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_11` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_12`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_12` (
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
-- Dumping data for table `sarah_computing_task_dist_12`
--

LOCK TABLES `sarah_computing_task_dist_12` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_12` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_13`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_13` (
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
-- Dumping data for table `sarah_computing_task_dist_13`
--

LOCK TABLES `sarah_computing_task_dist_13` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_13` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_14`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_14` (
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
-- Dumping data for table `sarah_computing_task_dist_14`
--

LOCK TABLES `sarah_computing_task_dist_14` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_14` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_14` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_15`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_15` (
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
-- Dumping data for table `sarah_computing_task_dist_15`
--

LOCK TABLES `sarah_computing_task_dist_15` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_15` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_15` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_16`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_16` (
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
-- Dumping data for table `sarah_computing_task_dist_16`
--

LOCK TABLES `sarah_computing_task_dist_16` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_16` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_16` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_17`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_17` (
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
-- Dumping data for table `sarah_computing_task_dist_17`
--

LOCK TABLES `sarah_computing_task_dist_17` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_17` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_17` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_18`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_18` (
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
-- Dumping data for table `sarah_computing_task_dist_18`
--

LOCK TABLES `sarah_computing_task_dist_18` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_18` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_18` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_19`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_19` (
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
-- Dumping data for table `sarah_computing_task_dist_19`
--

LOCK TABLES `sarah_computing_task_dist_19` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_19` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_19` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_20`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_20` (
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
-- Dumping data for table `sarah_computing_task_dist_20`
--

LOCK TABLES `sarah_computing_task_dist_20` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_20` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_21`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_21` (
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
-- Dumping data for table `sarah_computing_task_dist_21`
--

LOCK TABLES `sarah_computing_task_dist_21` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_21` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_21` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_22`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_22` (
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
-- Dumping data for table `sarah_computing_task_dist_22`
--

LOCK TABLES `sarah_computing_task_dist_22` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_22` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_22` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_23`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_23` (
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
-- Dumping data for table `sarah_computing_task_dist_23`
--

LOCK TABLES `sarah_computing_task_dist_23` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_23` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_23` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_24`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_24` (
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
-- Dumping data for table `sarah_computing_task_dist_24`
--

LOCK TABLES `sarah_computing_task_dist_24` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_24` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_24` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_25`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_25` (
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
-- Dumping data for table `sarah_computing_task_dist_25`
--

LOCK TABLES `sarah_computing_task_dist_25` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_25` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_25` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_26`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_26` (
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
-- Dumping data for table `sarah_computing_task_dist_26`
--

LOCK TABLES `sarah_computing_task_dist_26` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_26` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_26` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_27`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_27` (
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
-- Dumping data for table `sarah_computing_task_dist_27`
--

LOCK TABLES `sarah_computing_task_dist_27` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_27` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_27` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_28`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_28` (
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
-- Dumping data for table `sarah_computing_task_dist_28`
--

LOCK TABLES `sarah_computing_task_dist_28` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_28` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_28` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_computing_task_dist_29`
--

DROP TABLE IF EXISTS `sarah_computing_task_dist_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_computing_task_dist_29` (
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
-- Dumping data for table `sarah_computing_task_dist_29`
--

LOCK TABLES `sarah_computing_task_dist_29` WRITE;
/*!40000 ALTER TABLE `sarah_computing_task_dist_29` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_computing_task_dist_29` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_01`
--

DROP TABLE IF EXISTS `sarah_node_cmd_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_01` (
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
-- Dumping data for table `sarah_node_cmd_01`
--

LOCK TABLES `sarah_node_cmd_01` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_02`
--

DROP TABLE IF EXISTS `sarah_node_cmd_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_02` (
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
-- Dumping data for table `sarah_node_cmd_02`
--

LOCK TABLES `sarah_node_cmd_02` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_03`
--

DROP TABLE IF EXISTS `sarah_node_cmd_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_03` (
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
-- Dumping data for table `sarah_node_cmd_03`
--

LOCK TABLES `sarah_node_cmd_03` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_04`
--

DROP TABLE IF EXISTS `sarah_node_cmd_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_04` (
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
-- Dumping data for table `sarah_node_cmd_04`
--

LOCK TABLES `sarah_node_cmd_04` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_04` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_05`
--

DROP TABLE IF EXISTS `sarah_node_cmd_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_05` (
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
-- Dumping data for table `sarah_node_cmd_05`
--

LOCK TABLES `sarah_node_cmd_05` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_05` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_06`
--

DROP TABLE IF EXISTS `sarah_node_cmd_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_06` (
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
-- Dumping data for table `sarah_node_cmd_06`
--

LOCK TABLES `sarah_node_cmd_06` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_06` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_07`
--

DROP TABLE IF EXISTS `sarah_node_cmd_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_07` (
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
-- Dumping data for table `sarah_node_cmd_07`
--

LOCK TABLES `sarah_node_cmd_07` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_07` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_08`
--

DROP TABLE IF EXISTS `sarah_node_cmd_08`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_08` (
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
-- Dumping data for table `sarah_node_cmd_08`
--

LOCK TABLES `sarah_node_cmd_08` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_08` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_08` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_09`
--

DROP TABLE IF EXISTS `sarah_node_cmd_09`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_09` (
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
-- Dumping data for table `sarah_node_cmd_09`
--

LOCK TABLES `sarah_node_cmd_09` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_09` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_09` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_10`
--

DROP TABLE IF EXISTS `sarah_node_cmd_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_10` (
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
-- Dumping data for table `sarah_node_cmd_10`
--

LOCK TABLES `sarah_node_cmd_10` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_10` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_11`
--

DROP TABLE IF EXISTS `sarah_node_cmd_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_11` (
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
-- Dumping data for table `sarah_node_cmd_11`
--

LOCK TABLES `sarah_node_cmd_11` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_11` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_12`
--

DROP TABLE IF EXISTS `sarah_node_cmd_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_12` (
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
-- Dumping data for table `sarah_node_cmd_12`
--

LOCK TABLES `sarah_node_cmd_12` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_12` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_13`
--

DROP TABLE IF EXISTS `sarah_node_cmd_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_13` (
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
-- Dumping data for table `sarah_node_cmd_13`
--

LOCK TABLES `sarah_node_cmd_13` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_13` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_14`
--

DROP TABLE IF EXISTS `sarah_node_cmd_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_14` (
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
-- Dumping data for table `sarah_node_cmd_14`
--

LOCK TABLES `sarah_node_cmd_14` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_14` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_14` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_15`
--

DROP TABLE IF EXISTS `sarah_node_cmd_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_15` (
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
-- Dumping data for table `sarah_node_cmd_15`
--

LOCK TABLES `sarah_node_cmd_15` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_15` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_15` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_16`
--

DROP TABLE IF EXISTS `sarah_node_cmd_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_16` (
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
-- Dumping data for table `sarah_node_cmd_16`
--

LOCK TABLES `sarah_node_cmd_16` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_16` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_16` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_17`
--

DROP TABLE IF EXISTS `sarah_node_cmd_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_17` (
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
-- Dumping data for table `sarah_node_cmd_17`
--

LOCK TABLES `sarah_node_cmd_17` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_17` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_17` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_18`
--

DROP TABLE IF EXISTS `sarah_node_cmd_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_18` (
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
-- Dumping data for table `sarah_node_cmd_18`
--

LOCK TABLES `sarah_node_cmd_18` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_18` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_18` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_19`
--

DROP TABLE IF EXISTS `sarah_node_cmd_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_19` (
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
-- Dumping data for table `sarah_node_cmd_19`
--

LOCK TABLES `sarah_node_cmd_19` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_19` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_19` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_20`
--

DROP TABLE IF EXISTS `sarah_node_cmd_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_20` (
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
-- Dumping data for table `sarah_node_cmd_20`
--

LOCK TABLES `sarah_node_cmd_20` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_20` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_21`
--

DROP TABLE IF EXISTS `sarah_node_cmd_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_21` (
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
-- Dumping data for table `sarah_node_cmd_21`
--

LOCK TABLES `sarah_node_cmd_21` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_21` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_21` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_22`
--

DROP TABLE IF EXISTS `sarah_node_cmd_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_22` (
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
-- Dumping data for table `sarah_node_cmd_22`
--

LOCK TABLES `sarah_node_cmd_22` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_22` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_22` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_23`
--

DROP TABLE IF EXISTS `sarah_node_cmd_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_23` (
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
-- Dumping data for table `sarah_node_cmd_23`
--

LOCK TABLES `sarah_node_cmd_23` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_23` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_23` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_24`
--

DROP TABLE IF EXISTS `sarah_node_cmd_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_24` (
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
-- Dumping data for table `sarah_node_cmd_24`
--

LOCK TABLES `sarah_node_cmd_24` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_24` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_24` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_25`
--

DROP TABLE IF EXISTS `sarah_node_cmd_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_25` (
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
-- Dumping data for table `sarah_node_cmd_25`
--

LOCK TABLES `sarah_node_cmd_25` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_25` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_25` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_26`
--

DROP TABLE IF EXISTS `sarah_node_cmd_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_26` (
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
-- Dumping data for table `sarah_node_cmd_26`
--

LOCK TABLES `sarah_node_cmd_26` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_26` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_26` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_27`
--

DROP TABLE IF EXISTS `sarah_node_cmd_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_27` (
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
-- Dumping data for table `sarah_node_cmd_27`
--

LOCK TABLES `sarah_node_cmd_27` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_27` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_27` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_28`
--

DROP TABLE IF EXISTS `sarah_node_cmd_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_28` (
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
-- Dumping data for table `sarah_node_cmd_28`
--

LOCK TABLES `sarah_node_cmd_28` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_28` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_28` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_cmd_29`
--

DROP TABLE IF EXISTS `sarah_node_cmd_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_cmd_29` (
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
-- Dumping data for table `sarah_node_cmd_29`
--

LOCK TABLES `sarah_node_cmd_29` WRITE;
/*!40000 ALTER TABLE `sarah_node_cmd_29` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_cmd_29` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-28 18:23:00
