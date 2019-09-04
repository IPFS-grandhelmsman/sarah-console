-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 192.168.0.135    Database: sarah_opmt_record_db
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
-- Table structure for table `sarah_node_post_01`
--

DROP TABLE IF EXISTS `sarah_node_post_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_01` (
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
-- Dumping data for table `sarah_node_post_01`
--

LOCK TABLES `sarah_node_post_01` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_02`
--

DROP TABLE IF EXISTS `sarah_node_post_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_02` (
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
-- Dumping data for table `sarah_node_post_02`
--

LOCK TABLES `sarah_node_post_02` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_03`
--

DROP TABLE IF EXISTS `sarah_node_post_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_03` (
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
-- Dumping data for table `sarah_node_post_03`
--

LOCK TABLES `sarah_node_post_03` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_04`
--

DROP TABLE IF EXISTS `sarah_node_post_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_04` (
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
-- Dumping data for table `sarah_node_post_04`
--

LOCK TABLES `sarah_node_post_04` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_04` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_05`
--

DROP TABLE IF EXISTS `sarah_node_post_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_05` (
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
-- Dumping data for table `sarah_node_post_05`
--

LOCK TABLES `sarah_node_post_05` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_05` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_06`
--

DROP TABLE IF EXISTS `sarah_node_post_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_06` (
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
-- Dumping data for table `sarah_node_post_06`
--

LOCK TABLES `sarah_node_post_06` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_06` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_07`
--

DROP TABLE IF EXISTS `sarah_node_post_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_07` (
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
-- Dumping data for table `sarah_node_post_07`
--

LOCK TABLES `sarah_node_post_07` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_07` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_08`
--

DROP TABLE IF EXISTS `sarah_node_post_08`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_08` (
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
-- Dumping data for table `sarah_node_post_08`
--

LOCK TABLES `sarah_node_post_08` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_08` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_08` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_09`
--

DROP TABLE IF EXISTS `sarah_node_post_09`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_09` (
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
-- Dumping data for table `sarah_node_post_09`
--

LOCK TABLES `sarah_node_post_09` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_09` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_09` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_10`
--

DROP TABLE IF EXISTS `sarah_node_post_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_10` (
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
-- Dumping data for table `sarah_node_post_10`
--

LOCK TABLES `sarah_node_post_10` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_10` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_11`
--

DROP TABLE IF EXISTS `sarah_node_post_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_11` (
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
-- Dumping data for table `sarah_node_post_11`
--

LOCK TABLES `sarah_node_post_11` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_11` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_12`
--

DROP TABLE IF EXISTS `sarah_node_post_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_12` (
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
-- Dumping data for table `sarah_node_post_12`
--

LOCK TABLES `sarah_node_post_12` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_12` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_13`
--

DROP TABLE IF EXISTS `sarah_node_post_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_13` (
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
-- Dumping data for table `sarah_node_post_13`
--

LOCK TABLES `sarah_node_post_13` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_13` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_14`
--

DROP TABLE IF EXISTS `sarah_node_post_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_14` (
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
-- Dumping data for table `sarah_node_post_14`
--

LOCK TABLES `sarah_node_post_14` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_14` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_14` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_15`
--

DROP TABLE IF EXISTS `sarah_node_post_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_15` (
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
-- Dumping data for table `sarah_node_post_15`
--

LOCK TABLES `sarah_node_post_15` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_15` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_15` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_16`
--

DROP TABLE IF EXISTS `sarah_node_post_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_16` (
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
-- Dumping data for table `sarah_node_post_16`
--

LOCK TABLES `sarah_node_post_16` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_16` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_16` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_17`
--

DROP TABLE IF EXISTS `sarah_node_post_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_17` (
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
-- Dumping data for table `sarah_node_post_17`
--

LOCK TABLES `sarah_node_post_17` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_17` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_17` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_18`
--

DROP TABLE IF EXISTS `sarah_node_post_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_18` (
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
-- Dumping data for table `sarah_node_post_18`
--

LOCK TABLES `sarah_node_post_18` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_18` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_18` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_19`
--

DROP TABLE IF EXISTS `sarah_node_post_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_19` (
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
-- Dumping data for table `sarah_node_post_19`
--

LOCK TABLES `sarah_node_post_19` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_19` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_19` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_20`
--

DROP TABLE IF EXISTS `sarah_node_post_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_20` (
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
-- Dumping data for table `sarah_node_post_20`
--

LOCK TABLES `sarah_node_post_20` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_20` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_21`
--

DROP TABLE IF EXISTS `sarah_node_post_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_21` (
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
-- Dumping data for table `sarah_node_post_21`
--

LOCK TABLES `sarah_node_post_21` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_21` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_21` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_22`
--

DROP TABLE IF EXISTS `sarah_node_post_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_22` (
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
-- Dumping data for table `sarah_node_post_22`
--

LOCK TABLES `sarah_node_post_22` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_22` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_22` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_23`
--

DROP TABLE IF EXISTS `sarah_node_post_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_23` (
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
-- Dumping data for table `sarah_node_post_23`
--

LOCK TABLES `sarah_node_post_23` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_23` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_23` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_24`
--

DROP TABLE IF EXISTS `sarah_node_post_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_24` (
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
-- Dumping data for table `sarah_node_post_24`
--

LOCK TABLES `sarah_node_post_24` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_24` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_24` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_25`
--

DROP TABLE IF EXISTS `sarah_node_post_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_25` (
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
-- Dumping data for table `sarah_node_post_25`
--

LOCK TABLES `sarah_node_post_25` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_25` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_25` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_26`
--

DROP TABLE IF EXISTS `sarah_node_post_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_26` (
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
-- Dumping data for table `sarah_node_post_26`
--

LOCK TABLES `sarah_node_post_26` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_26` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_26` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_27`
--

DROP TABLE IF EXISTS `sarah_node_post_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_27` (
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
-- Dumping data for table `sarah_node_post_27`
--

LOCK TABLES `sarah_node_post_27` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_27` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_27` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_28`
--

DROP TABLE IF EXISTS `sarah_node_post_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_28` (
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
-- Dumping data for table `sarah_node_post_28`
--

LOCK TABLES `sarah_node_post_28` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_28` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_28` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_29`
--

DROP TABLE IF EXISTS `sarah_node_post_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_29` (
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
-- Dumping data for table `sarah_node_post_29`
--

LOCK TABLES `sarah_node_post_29` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_29` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_29` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_30`
--

DROP TABLE IF EXISTS `sarah_node_post_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_30` (
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
-- Dumping data for table `sarah_node_post_30`
--

LOCK TABLES `sarah_node_post_30` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_30` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_31`
--

DROP TABLE IF EXISTS `sarah_node_post_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_31` (
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
-- Dumping data for table `sarah_node_post_31`
--

LOCK TABLES `sarah_node_post_31` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_31` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_31` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_32`
--

DROP TABLE IF EXISTS `sarah_node_post_32`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_32` (
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
-- Dumping data for table `sarah_node_post_32`
--

LOCK TABLES `sarah_node_post_32` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_32` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_32` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_33`
--

DROP TABLE IF EXISTS `sarah_node_post_33`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_33` (
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
-- Dumping data for table `sarah_node_post_33`
--

LOCK TABLES `sarah_node_post_33` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_33` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_33` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_34`
--

DROP TABLE IF EXISTS `sarah_node_post_34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_34` (
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
-- Dumping data for table `sarah_node_post_34`
--

LOCK TABLES `sarah_node_post_34` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_34` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_34` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_35`
--

DROP TABLE IF EXISTS `sarah_node_post_35`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_35` (
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
-- Dumping data for table `sarah_node_post_35`
--

LOCK TABLES `sarah_node_post_35` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_35` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_35` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_36`
--

DROP TABLE IF EXISTS `sarah_node_post_36`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_36` (
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
-- Dumping data for table `sarah_node_post_36`
--

LOCK TABLES `sarah_node_post_36` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_36` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_36` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_37`
--

DROP TABLE IF EXISTS `sarah_node_post_37`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_37` (
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
-- Dumping data for table `sarah_node_post_37`
--

LOCK TABLES `sarah_node_post_37` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_37` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_37` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_38`
--

DROP TABLE IF EXISTS `sarah_node_post_38`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_38` (
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
-- Dumping data for table `sarah_node_post_38`
--

LOCK TABLES `sarah_node_post_38` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_38` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_38` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_39`
--

DROP TABLE IF EXISTS `sarah_node_post_39`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_39` (
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
-- Dumping data for table `sarah_node_post_39`
--

LOCK TABLES `sarah_node_post_39` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_39` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_39` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_40`
--

DROP TABLE IF EXISTS `sarah_node_post_40`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_40` (
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
-- Dumping data for table `sarah_node_post_40`
--

LOCK TABLES `sarah_node_post_40` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_40` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_40` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_41`
--

DROP TABLE IF EXISTS `sarah_node_post_41`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_41` (
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
-- Dumping data for table `sarah_node_post_41`
--

LOCK TABLES `sarah_node_post_41` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_41` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_41` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_42`
--

DROP TABLE IF EXISTS `sarah_node_post_42`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_42` (
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
-- Dumping data for table `sarah_node_post_42`
--

LOCK TABLES `sarah_node_post_42` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_42` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_42` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_43`
--

DROP TABLE IF EXISTS `sarah_node_post_43`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_43` (
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
-- Dumping data for table `sarah_node_post_43`
--

LOCK TABLES `sarah_node_post_43` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_43` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_43` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_44`
--

DROP TABLE IF EXISTS `sarah_node_post_44`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_44` (
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
-- Dumping data for table `sarah_node_post_44`
--

LOCK TABLES `sarah_node_post_44` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_44` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_44` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_45`
--

DROP TABLE IF EXISTS `sarah_node_post_45`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_45` (
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
-- Dumping data for table `sarah_node_post_45`
--

LOCK TABLES `sarah_node_post_45` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_45` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_45` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_46`
--

DROP TABLE IF EXISTS `sarah_node_post_46`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_46` (
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
-- Dumping data for table `sarah_node_post_46`
--

LOCK TABLES `sarah_node_post_46` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_46` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_46` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_47`
--

DROP TABLE IF EXISTS `sarah_node_post_47`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_47` (
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
-- Dumping data for table `sarah_node_post_47`
--

LOCK TABLES `sarah_node_post_47` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_47` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_47` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_48`
--

DROP TABLE IF EXISTS `sarah_node_post_48`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_48` (
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
-- Dumping data for table `sarah_node_post_48`
--

LOCK TABLES `sarah_node_post_48` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_48` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_48` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_49`
--

DROP TABLE IF EXISTS `sarah_node_post_49`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_49` (
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
-- Dumping data for table `sarah_node_post_49`
--

LOCK TABLES `sarah_node_post_49` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_49` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_49` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_50`
--

DROP TABLE IF EXISTS `sarah_node_post_50`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_50` (
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
-- Dumping data for table `sarah_node_post_50`
--

LOCK TABLES `sarah_node_post_50` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_50` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_50` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_51`
--

DROP TABLE IF EXISTS `sarah_node_post_51`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_51` (
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
-- Dumping data for table `sarah_node_post_51`
--

LOCK TABLES `sarah_node_post_51` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_51` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_51` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_52`
--

DROP TABLE IF EXISTS `sarah_node_post_52`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_52` (
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
-- Dumping data for table `sarah_node_post_52`
--

LOCK TABLES `sarah_node_post_52` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_52` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_52` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_53`
--

DROP TABLE IF EXISTS `sarah_node_post_53`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_53` (
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
-- Dumping data for table `sarah_node_post_53`
--

LOCK TABLES `sarah_node_post_53` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_53` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_53` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_54`
--

DROP TABLE IF EXISTS `sarah_node_post_54`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_54` (
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
-- Dumping data for table `sarah_node_post_54`
--

LOCK TABLES `sarah_node_post_54` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_54` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_54` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_55`
--

DROP TABLE IF EXISTS `sarah_node_post_55`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_55` (
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
-- Dumping data for table `sarah_node_post_55`
--

LOCK TABLES `sarah_node_post_55` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_55` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_55` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_56`
--

DROP TABLE IF EXISTS `sarah_node_post_56`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_56` (
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
-- Dumping data for table `sarah_node_post_56`
--

LOCK TABLES `sarah_node_post_56` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_56` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_56` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_57`
--

DROP TABLE IF EXISTS `sarah_node_post_57`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_57` (
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
-- Dumping data for table `sarah_node_post_57`
--

LOCK TABLES `sarah_node_post_57` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_57` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_57` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_58`
--

DROP TABLE IF EXISTS `sarah_node_post_58`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_58` (
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
-- Dumping data for table `sarah_node_post_58`
--

LOCK TABLES `sarah_node_post_58` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_58` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_58` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_59`
--

DROP TABLE IF EXISTS `sarah_node_post_59`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_59` (
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
-- Dumping data for table `sarah_node_post_59`
--

LOCK TABLES `sarah_node_post_59` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_59` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_59` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_60`
--

DROP TABLE IF EXISTS `sarah_node_post_60`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_60` (
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
-- Dumping data for table `sarah_node_post_60`
--

LOCK TABLES `sarah_node_post_60` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_60` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_60` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_61`
--

DROP TABLE IF EXISTS `sarah_node_post_61`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_61` (
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
-- Dumping data for table `sarah_node_post_61`
--

LOCK TABLES `sarah_node_post_61` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_61` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_61` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_62`
--

DROP TABLE IF EXISTS `sarah_node_post_62`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_62` (
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
-- Dumping data for table `sarah_node_post_62`
--

LOCK TABLES `sarah_node_post_62` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_62` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_62` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_63`
--

DROP TABLE IF EXISTS `sarah_node_post_63`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_63` (
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
-- Dumping data for table `sarah_node_post_63`
--

LOCK TABLES `sarah_node_post_63` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_63` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_63` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_64`
--

DROP TABLE IF EXISTS `sarah_node_post_64`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_64` (
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
-- Dumping data for table `sarah_node_post_64`
--

LOCK TABLES `sarah_node_post_64` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_64` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_64` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_65`
--

DROP TABLE IF EXISTS `sarah_node_post_65`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_65` (
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
-- Dumping data for table `sarah_node_post_65`
--

LOCK TABLES `sarah_node_post_65` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_65` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_65` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_66`
--

DROP TABLE IF EXISTS `sarah_node_post_66`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_66` (
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
-- Dumping data for table `sarah_node_post_66`
--

LOCK TABLES `sarah_node_post_66` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_66` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_66` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_67`
--

DROP TABLE IF EXISTS `sarah_node_post_67`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_67` (
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
-- Dumping data for table `sarah_node_post_67`
--

LOCK TABLES `sarah_node_post_67` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_67` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_67` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_68`
--

DROP TABLE IF EXISTS `sarah_node_post_68`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_68` (
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
-- Dumping data for table `sarah_node_post_68`
--

LOCK TABLES `sarah_node_post_68` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_68` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_68` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_69`
--

DROP TABLE IF EXISTS `sarah_node_post_69`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_69` (
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
-- Dumping data for table `sarah_node_post_69`
--

LOCK TABLES `sarah_node_post_69` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_69` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_69` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_70`
--

DROP TABLE IF EXISTS `sarah_node_post_70`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_70` (
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
-- Dumping data for table `sarah_node_post_70`
--

LOCK TABLES `sarah_node_post_70` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_70` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_70` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_71`
--

DROP TABLE IF EXISTS `sarah_node_post_71`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_71` (
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
-- Dumping data for table `sarah_node_post_71`
--

LOCK TABLES `sarah_node_post_71` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_71` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_71` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_72`
--

DROP TABLE IF EXISTS `sarah_node_post_72`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_72` (
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
-- Dumping data for table `sarah_node_post_72`
--

LOCK TABLES `sarah_node_post_72` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_72` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_72` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_73`
--

DROP TABLE IF EXISTS `sarah_node_post_73`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_73` (
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
-- Dumping data for table `sarah_node_post_73`
--

LOCK TABLES `sarah_node_post_73` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_73` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_73` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_74`
--

DROP TABLE IF EXISTS `sarah_node_post_74`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_74` (
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
-- Dumping data for table `sarah_node_post_74`
--

LOCK TABLES `sarah_node_post_74` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_74` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_74` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_75`
--

DROP TABLE IF EXISTS `sarah_node_post_75`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_75` (
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
-- Dumping data for table `sarah_node_post_75`
--

LOCK TABLES `sarah_node_post_75` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_75` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_75` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_76`
--

DROP TABLE IF EXISTS `sarah_node_post_76`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_76` (
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
-- Dumping data for table `sarah_node_post_76`
--

LOCK TABLES `sarah_node_post_76` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_76` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_76` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_77`
--

DROP TABLE IF EXISTS `sarah_node_post_77`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_77` (
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
-- Dumping data for table `sarah_node_post_77`
--

LOCK TABLES `sarah_node_post_77` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_77` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_77` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_78`
--

DROP TABLE IF EXISTS `sarah_node_post_78`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_78` (
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
-- Dumping data for table `sarah_node_post_78`
--

LOCK TABLES `sarah_node_post_78` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_78` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_78` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_79`
--

DROP TABLE IF EXISTS `sarah_node_post_79`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_79` (
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
-- Dumping data for table `sarah_node_post_79`
--

LOCK TABLES `sarah_node_post_79` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_79` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_79` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_80`
--

DROP TABLE IF EXISTS `sarah_node_post_80`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_80` (
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
-- Dumping data for table `sarah_node_post_80`
--

LOCK TABLES `sarah_node_post_80` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_80` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_80` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_81`
--

DROP TABLE IF EXISTS `sarah_node_post_81`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_81` (
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
-- Dumping data for table `sarah_node_post_81`
--

LOCK TABLES `sarah_node_post_81` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_81` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_81` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_82`
--

DROP TABLE IF EXISTS `sarah_node_post_82`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_82` (
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
-- Dumping data for table `sarah_node_post_82`
--

LOCK TABLES `sarah_node_post_82` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_82` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_82` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_83`
--

DROP TABLE IF EXISTS `sarah_node_post_83`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_83` (
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
-- Dumping data for table `sarah_node_post_83`
--

LOCK TABLES `sarah_node_post_83` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_83` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_83` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_84`
--

DROP TABLE IF EXISTS `sarah_node_post_84`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_84` (
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
-- Dumping data for table `sarah_node_post_84`
--

LOCK TABLES `sarah_node_post_84` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_84` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_84` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_85`
--

DROP TABLE IF EXISTS `sarah_node_post_85`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_85` (
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
-- Dumping data for table `sarah_node_post_85`
--

LOCK TABLES `sarah_node_post_85` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_85` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_85` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_86`
--

DROP TABLE IF EXISTS `sarah_node_post_86`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_86` (
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
-- Dumping data for table `sarah_node_post_86`
--

LOCK TABLES `sarah_node_post_86` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_86` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_86` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_87`
--

DROP TABLE IF EXISTS `sarah_node_post_87`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_87` (
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
-- Dumping data for table `sarah_node_post_87`
--

LOCK TABLES `sarah_node_post_87` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_87` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_87` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_88`
--

DROP TABLE IF EXISTS `sarah_node_post_88`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_88` (
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
-- Dumping data for table `sarah_node_post_88`
--

LOCK TABLES `sarah_node_post_88` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_88` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_88` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_89`
--

DROP TABLE IF EXISTS `sarah_node_post_89`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_89` (
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
-- Dumping data for table `sarah_node_post_89`
--

LOCK TABLES `sarah_node_post_89` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_89` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_89` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_90`
--

DROP TABLE IF EXISTS `sarah_node_post_90`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_90` (
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
-- Dumping data for table `sarah_node_post_90`
--

LOCK TABLES `sarah_node_post_90` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_90` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_90` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_91`
--

DROP TABLE IF EXISTS `sarah_node_post_91`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_91` (
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
-- Dumping data for table `sarah_node_post_91`
--

LOCK TABLES `sarah_node_post_91` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_91` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_91` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_92`
--

DROP TABLE IF EXISTS `sarah_node_post_92`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_92` (
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
-- Dumping data for table `sarah_node_post_92`
--

LOCK TABLES `sarah_node_post_92` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_92` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_92` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_93`
--

DROP TABLE IF EXISTS `sarah_node_post_93`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_93` (
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
-- Dumping data for table `sarah_node_post_93`
--

LOCK TABLES `sarah_node_post_93` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_93` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_93` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_94`
--

DROP TABLE IF EXISTS `sarah_node_post_94`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_94` (
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
-- Dumping data for table `sarah_node_post_94`
--

LOCK TABLES `sarah_node_post_94` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_94` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_94` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_95`
--

DROP TABLE IF EXISTS `sarah_node_post_95`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_95` (
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
-- Dumping data for table `sarah_node_post_95`
--

LOCK TABLES `sarah_node_post_95` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_95` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_95` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_96`
--

DROP TABLE IF EXISTS `sarah_node_post_96`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_96` (
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
-- Dumping data for table `sarah_node_post_96`
--

LOCK TABLES `sarah_node_post_96` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_96` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_96` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_node_post_97`
--

DROP TABLE IF EXISTS `sarah_node_post_97`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_node_post_97` (
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
-- Dumping data for table `sarah_node_post_97`
--

LOCK TABLES `sarah_node_post_97` WRITE;
/*!40000 ALTER TABLE `sarah_node_post_97` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_node_post_97` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-28 18:23:45
