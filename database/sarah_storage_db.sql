-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: 192.168.0.135    Database: sarah_storage_db
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
-- Table structure for table `sarah_ipfs_files_01`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_01`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_01` (
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
-- Dumping data for table `sarah_ipfs_files_01`
--

LOCK TABLES `sarah_ipfs_files_01` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_01` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_01` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_02`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_02`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_02` (
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
-- Dumping data for table `sarah_ipfs_files_02`
--

LOCK TABLES `sarah_ipfs_files_02` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_02` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_02` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_03`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_03`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_03` (
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
-- Dumping data for table `sarah_ipfs_files_03`
--

LOCK TABLES `sarah_ipfs_files_03` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_03` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_03` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_04`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_04`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_04` (
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
-- Dumping data for table `sarah_ipfs_files_04`
--

LOCK TABLES `sarah_ipfs_files_04` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_04` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_04` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_05`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_05`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_05` (
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
-- Dumping data for table `sarah_ipfs_files_05`
--

LOCK TABLES `sarah_ipfs_files_05` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_05` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_05` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_06`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_06`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_06` (
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
-- Dumping data for table `sarah_ipfs_files_06`
--

LOCK TABLES `sarah_ipfs_files_06` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_06` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_06` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_07`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_07`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_07` (
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
-- Dumping data for table `sarah_ipfs_files_07`
--

LOCK TABLES `sarah_ipfs_files_07` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_07` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_07` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_08`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_08`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_08` (
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
-- Dumping data for table `sarah_ipfs_files_08`
--

LOCK TABLES `sarah_ipfs_files_08` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_08` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_08` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_09`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_09`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_09` (
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
-- Dumping data for table `sarah_ipfs_files_09`
--

LOCK TABLES `sarah_ipfs_files_09` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_09` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_09` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_10`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_10`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_10` (
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
-- Dumping data for table `sarah_ipfs_files_10`
--

LOCK TABLES `sarah_ipfs_files_10` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_10` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_10` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_11`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_11`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_11` (
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
-- Dumping data for table `sarah_ipfs_files_11`
--

LOCK TABLES `sarah_ipfs_files_11` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_11` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_11` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_12`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_12`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_12` (
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
-- Dumping data for table `sarah_ipfs_files_12`
--

LOCK TABLES `sarah_ipfs_files_12` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_12` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_12` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_13`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_13`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_13` (
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
-- Dumping data for table `sarah_ipfs_files_13`
--

LOCK TABLES `sarah_ipfs_files_13` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_13` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_13` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_14`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_14`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_14` (
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
-- Dumping data for table `sarah_ipfs_files_14`
--

LOCK TABLES `sarah_ipfs_files_14` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_14` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_14` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_15`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_15`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_15` (
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
-- Dumping data for table `sarah_ipfs_files_15`
--

LOCK TABLES `sarah_ipfs_files_15` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_15` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_15` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_16`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_16`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_16` (
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
-- Dumping data for table `sarah_ipfs_files_16`
--

LOCK TABLES `sarah_ipfs_files_16` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_16` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_16` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_17`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_17`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_17` (
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
-- Dumping data for table `sarah_ipfs_files_17`
--

LOCK TABLES `sarah_ipfs_files_17` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_17` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_17` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_18`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_18`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_18` (
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
-- Dumping data for table `sarah_ipfs_files_18`
--

LOCK TABLES `sarah_ipfs_files_18` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_18` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_18` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_19`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_19`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_19` (
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
-- Dumping data for table `sarah_ipfs_files_19`
--

LOCK TABLES `sarah_ipfs_files_19` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_19` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_19` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_20`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_20`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_20` (
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
-- Dumping data for table `sarah_ipfs_files_20`
--

LOCK TABLES `sarah_ipfs_files_20` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_20` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_20` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_21`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_21`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_21` (
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
-- Dumping data for table `sarah_ipfs_files_21`
--

LOCK TABLES `sarah_ipfs_files_21` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_21` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_21` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_22`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_22`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_22` (
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
-- Dumping data for table `sarah_ipfs_files_22`
--

LOCK TABLES `sarah_ipfs_files_22` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_22` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_22` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_23`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_23`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_23` (
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
-- Dumping data for table `sarah_ipfs_files_23`
--

LOCK TABLES `sarah_ipfs_files_23` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_23` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_23` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_24`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_24`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_24` (
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
-- Dumping data for table `sarah_ipfs_files_24`
--

LOCK TABLES `sarah_ipfs_files_24` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_24` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_24` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_25`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_25`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_25` (
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
-- Dumping data for table `sarah_ipfs_files_25`
--

LOCK TABLES `sarah_ipfs_files_25` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_25` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_25` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_26`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_26`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_26` (
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
-- Dumping data for table `sarah_ipfs_files_26`
--

LOCK TABLES `sarah_ipfs_files_26` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_26` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_26` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_27`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_27`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_27` (
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
-- Dumping data for table `sarah_ipfs_files_27`
--

LOCK TABLES `sarah_ipfs_files_27` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_27` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_27` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_28`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_28`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_28` (
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
-- Dumping data for table `sarah_ipfs_files_28`
--

LOCK TABLES `sarah_ipfs_files_28` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_28` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_28` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_29`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_29`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_29` (
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
-- Dumping data for table `sarah_ipfs_files_29`
--

LOCK TABLES `sarah_ipfs_files_29` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_29` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_29` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_30`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_30`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_30` (
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
-- Dumping data for table `sarah_ipfs_files_30`
--

LOCK TABLES `sarah_ipfs_files_30` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_30` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_30` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_31`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_31`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_31` (
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
-- Dumping data for table `sarah_ipfs_files_31`
--

LOCK TABLES `sarah_ipfs_files_31` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_31` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_31` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_32`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_32`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_32` (
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
-- Dumping data for table `sarah_ipfs_files_32`
--

LOCK TABLES `sarah_ipfs_files_32` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_32` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_32` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_33`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_33`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_33` (
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
-- Dumping data for table `sarah_ipfs_files_33`
--

LOCK TABLES `sarah_ipfs_files_33` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_33` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_33` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_34`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_34`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_34` (
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
-- Dumping data for table `sarah_ipfs_files_34`
--

LOCK TABLES `sarah_ipfs_files_34` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_34` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_34` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_35`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_35`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_35` (
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
-- Dumping data for table `sarah_ipfs_files_35`
--

LOCK TABLES `sarah_ipfs_files_35` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_35` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_35` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_36`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_36`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_36` (
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
-- Dumping data for table `sarah_ipfs_files_36`
--

LOCK TABLES `sarah_ipfs_files_36` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_36` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_36` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_37`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_37`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_37` (
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
-- Dumping data for table `sarah_ipfs_files_37`
--

LOCK TABLES `sarah_ipfs_files_37` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_37` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_37` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_38`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_38`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_38` (
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
-- Dumping data for table `sarah_ipfs_files_38`
--

LOCK TABLES `sarah_ipfs_files_38` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_38` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_38` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_39`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_39`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_39` (
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
-- Dumping data for table `sarah_ipfs_files_39`
--

LOCK TABLES `sarah_ipfs_files_39` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_39` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_39` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_40`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_40`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_40` (
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
-- Dumping data for table `sarah_ipfs_files_40`
--

LOCK TABLES `sarah_ipfs_files_40` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_40` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_40` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_41`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_41`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_41` (
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
-- Dumping data for table `sarah_ipfs_files_41`
--

LOCK TABLES `sarah_ipfs_files_41` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_41` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_41` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_42`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_42`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_42` (
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
-- Dumping data for table `sarah_ipfs_files_42`
--

LOCK TABLES `sarah_ipfs_files_42` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_42` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_42` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_43`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_43`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_43` (
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
-- Dumping data for table `sarah_ipfs_files_43`
--

LOCK TABLES `sarah_ipfs_files_43` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_43` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_43` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_44`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_44`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_44` (
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
-- Dumping data for table `sarah_ipfs_files_44`
--

LOCK TABLES `sarah_ipfs_files_44` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_44` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_44` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_45`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_45`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_45` (
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
-- Dumping data for table `sarah_ipfs_files_45`
--

LOCK TABLES `sarah_ipfs_files_45` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_45` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_45` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_46`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_46`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_46` (
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
-- Dumping data for table `sarah_ipfs_files_46`
--

LOCK TABLES `sarah_ipfs_files_46` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_46` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_46` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_47`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_47`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_47` (
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
-- Dumping data for table `sarah_ipfs_files_47`
--

LOCK TABLES `sarah_ipfs_files_47` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_47` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_47` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_48`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_48`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_48` (
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
-- Dumping data for table `sarah_ipfs_files_48`
--

LOCK TABLES `sarah_ipfs_files_48` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_48` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_48` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_49`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_49`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_49` (
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
-- Dumping data for table `sarah_ipfs_files_49`
--

LOCK TABLES `sarah_ipfs_files_49` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_49` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_49` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_50`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_50`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_50` (
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
-- Dumping data for table `sarah_ipfs_files_50`
--

LOCK TABLES `sarah_ipfs_files_50` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_50` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_50` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_51`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_51`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_51` (
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
-- Dumping data for table `sarah_ipfs_files_51`
--

LOCK TABLES `sarah_ipfs_files_51` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_51` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_51` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_52`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_52`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_52` (
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
-- Dumping data for table `sarah_ipfs_files_52`
--

LOCK TABLES `sarah_ipfs_files_52` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_52` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_52` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_53`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_53`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_53` (
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
-- Dumping data for table `sarah_ipfs_files_53`
--

LOCK TABLES `sarah_ipfs_files_53` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_53` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_53` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_54`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_54`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_54` (
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
-- Dumping data for table `sarah_ipfs_files_54`
--

LOCK TABLES `sarah_ipfs_files_54` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_54` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_54` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_55`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_55`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_55` (
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
-- Dumping data for table `sarah_ipfs_files_55`
--

LOCK TABLES `sarah_ipfs_files_55` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_55` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_55` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_56`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_56`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_56` (
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
-- Dumping data for table `sarah_ipfs_files_56`
--

LOCK TABLES `sarah_ipfs_files_56` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_56` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_56` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_57`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_57`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_57` (
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
-- Dumping data for table `sarah_ipfs_files_57`
--

LOCK TABLES `sarah_ipfs_files_57` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_57` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_57` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_58`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_58`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_58` (
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
-- Dumping data for table `sarah_ipfs_files_58`
--

LOCK TABLES `sarah_ipfs_files_58` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_58` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_58` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_59`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_59`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_59` (
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
-- Dumping data for table `sarah_ipfs_files_59`
--

LOCK TABLES `sarah_ipfs_files_59` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_59` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_59` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_60`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_60`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_60` (
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
-- Dumping data for table `sarah_ipfs_files_60`
--

LOCK TABLES `sarah_ipfs_files_60` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_60` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_60` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_61`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_61`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_61` (
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
-- Dumping data for table `sarah_ipfs_files_61`
--

LOCK TABLES `sarah_ipfs_files_61` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_61` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_61` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_62`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_62`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_62` (
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
-- Dumping data for table `sarah_ipfs_files_62`
--

LOCK TABLES `sarah_ipfs_files_62` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_62` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_62` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_63`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_63`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_63` (
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
-- Dumping data for table `sarah_ipfs_files_63`
--

LOCK TABLES `sarah_ipfs_files_63` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_63` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_63` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_64`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_64`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_64` (
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
-- Dumping data for table `sarah_ipfs_files_64`
--

LOCK TABLES `sarah_ipfs_files_64` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_64` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_64` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_65`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_65`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_65` (
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
-- Dumping data for table `sarah_ipfs_files_65`
--

LOCK TABLES `sarah_ipfs_files_65` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_65` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_65` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_66`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_66`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_66` (
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
-- Dumping data for table `sarah_ipfs_files_66`
--

LOCK TABLES `sarah_ipfs_files_66` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_66` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_66` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_67`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_67`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_67` (
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
-- Dumping data for table `sarah_ipfs_files_67`
--

LOCK TABLES `sarah_ipfs_files_67` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_67` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_67` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_68`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_68`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_68` (
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
-- Dumping data for table `sarah_ipfs_files_68`
--

LOCK TABLES `sarah_ipfs_files_68` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_68` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_68` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_69`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_69`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_69` (
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
-- Dumping data for table `sarah_ipfs_files_69`
--

LOCK TABLES `sarah_ipfs_files_69` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_69` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_69` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_70`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_70`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_70` (
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
-- Dumping data for table `sarah_ipfs_files_70`
--

LOCK TABLES `sarah_ipfs_files_70` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_70` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_70` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_71`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_71`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_71` (
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
-- Dumping data for table `sarah_ipfs_files_71`
--

LOCK TABLES `sarah_ipfs_files_71` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_71` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_71` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_72`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_72`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_72` (
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
-- Dumping data for table `sarah_ipfs_files_72`
--

LOCK TABLES `sarah_ipfs_files_72` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_72` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_72` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_73`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_73`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_73` (
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
-- Dumping data for table `sarah_ipfs_files_73`
--

LOCK TABLES `sarah_ipfs_files_73` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_73` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_73` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_74`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_74`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_74` (
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
-- Dumping data for table `sarah_ipfs_files_74`
--

LOCK TABLES `sarah_ipfs_files_74` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_74` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_74` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_75`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_75`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_75` (
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
-- Dumping data for table `sarah_ipfs_files_75`
--

LOCK TABLES `sarah_ipfs_files_75` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_75` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_75` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_76`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_76`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_76` (
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
-- Dumping data for table `sarah_ipfs_files_76`
--

LOCK TABLES `sarah_ipfs_files_76` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_76` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_76` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_77`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_77`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_77` (
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
-- Dumping data for table `sarah_ipfs_files_77`
--

LOCK TABLES `sarah_ipfs_files_77` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_77` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_77` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_78`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_78`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_78` (
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
-- Dumping data for table `sarah_ipfs_files_78`
--

LOCK TABLES `sarah_ipfs_files_78` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_78` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_78` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_79`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_79`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_79` (
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
-- Dumping data for table `sarah_ipfs_files_79`
--

LOCK TABLES `sarah_ipfs_files_79` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_79` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_79` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_80`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_80`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_80` (
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
-- Dumping data for table `sarah_ipfs_files_80`
--

LOCK TABLES `sarah_ipfs_files_80` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_80` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_80` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_81`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_81`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_81` (
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
-- Dumping data for table `sarah_ipfs_files_81`
--

LOCK TABLES `sarah_ipfs_files_81` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_81` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_81` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_82`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_82`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_82` (
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
-- Dumping data for table `sarah_ipfs_files_82`
--

LOCK TABLES `sarah_ipfs_files_82` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_82` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_82` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_83`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_83`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_83` (
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
-- Dumping data for table `sarah_ipfs_files_83`
--

LOCK TABLES `sarah_ipfs_files_83` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_83` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_83` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_84`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_84`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_84` (
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
-- Dumping data for table `sarah_ipfs_files_84`
--

LOCK TABLES `sarah_ipfs_files_84` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_84` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_84` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_85`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_85`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_85` (
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
-- Dumping data for table `sarah_ipfs_files_85`
--

LOCK TABLES `sarah_ipfs_files_85` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_85` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_85` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_86`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_86`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_86` (
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
-- Dumping data for table `sarah_ipfs_files_86`
--

LOCK TABLES `sarah_ipfs_files_86` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_86` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_86` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_87`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_87`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_87` (
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
-- Dumping data for table `sarah_ipfs_files_87`
--

LOCK TABLES `sarah_ipfs_files_87` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_87` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_87` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_88`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_88`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_88` (
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
-- Dumping data for table `sarah_ipfs_files_88`
--

LOCK TABLES `sarah_ipfs_files_88` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_88` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_88` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_89`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_89`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_89` (
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
-- Dumping data for table `sarah_ipfs_files_89`
--

LOCK TABLES `sarah_ipfs_files_89` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_89` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_89` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_90`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_90`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_90` (
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
-- Dumping data for table `sarah_ipfs_files_90`
--

LOCK TABLES `sarah_ipfs_files_90` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_90` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_90` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_91`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_91`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_91` (
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
-- Dumping data for table `sarah_ipfs_files_91`
--

LOCK TABLES `sarah_ipfs_files_91` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_91` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_91` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_92`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_92`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_92` (
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
-- Dumping data for table `sarah_ipfs_files_92`
--

LOCK TABLES `sarah_ipfs_files_92` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_92` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_92` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_93`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_93`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_93` (
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
-- Dumping data for table `sarah_ipfs_files_93`
--

LOCK TABLES `sarah_ipfs_files_93` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_93` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_93` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_94`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_94`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_94` (
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
-- Dumping data for table `sarah_ipfs_files_94`
--

LOCK TABLES `sarah_ipfs_files_94` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_94` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_94` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_95`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_95`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_95` (
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
-- Dumping data for table `sarah_ipfs_files_95`
--

LOCK TABLES `sarah_ipfs_files_95` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_95` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_95` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_96`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_96`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_96` (
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
-- Dumping data for table `sarah_ipfs_files_96`
--

LOCK TABLES `sarah_ipfs_files_96` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_96` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_96` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_97`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_97`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_97` (
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
-- Dumping data for table `sarah_ipfs_files_97`
--

LOCK TABLES `sarah_ipfs_files_97` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_97` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_97` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_98`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_98`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_98` (
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
-- Dumping data for table `sarah_ipfs_files_98`
--

LOCK TABLES `sarah_ipfs_files_98` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_98` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_98` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sarah_ipfs_files_99`
--

DROP TABLE IF EXISTS `sarah_ipfs_files_99`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sarah_ipfs_files_99` (
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
-- Dumping data for table `sarah_ipfs_files_99`
--

LOCK TABLES `sarah_ipfs_files_99` WRITE;
/*!40000 ALTER TABLE `sarah_ipfs_files_99` DISABLE KEYS */;
/*!40000 ALTER TABLE `sarah_ipfs_files_99` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-05-28 18:23:13
