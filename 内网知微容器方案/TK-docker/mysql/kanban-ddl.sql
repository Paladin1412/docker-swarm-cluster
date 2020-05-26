-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: kanban
-- ------------------------------------------------------
-- Server version	5.7.29

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
-- Table structure for table `STATIC_UNITTABLE_D`
--

DROP TABLE IF EXISTS `STATIC_UNITTABLE_D`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATIC_UNITTABLE_D` (
  `TIME` int(11) NOT NULL,
  KEY `TIME` (`TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STATIC_UNITTABLE_M`
--

DROP TABLE IF EXISTS `STATIC_UNITTABLE_M`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATIC_UNITTABLE_M` (
  `TIME` int(11) NOT NULL,
  KEY `TIME` (`TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `STATIC_UNITTABLE_W`
--

DROP TABLE IF EXISTS `STATIC_UNITTABLE_W`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STATIC_UNITTABLE_W` (
  `TIME` int(11) NOT NULL,
  KEY `TIME` (`TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bot_message`
--

DROP TABLE IF EXISTS `bot_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bot_message` (
  `id` varchar(32) NOT NULL DEFAULT '',
  `msg_type` varchar(10) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `bot_message_user`
--

DROP TABLE IF EXISTS `bot_message_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bot_message_user` (
  `username` varchar(255) NOT NULL DEFAULT '',
  `org_id` varchar(62) DEFAULT NULL,
  `is_read` int(4) NOT NULL DEFAULT '0',
  `member_id` varchar(32) NOT NULL DEFAULT '',
  `message_id` varchar(32) DEFAULT NULL,
  `id` varchar(32) NOT NULL,
  `created` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `calendar`
--

DROP TABLE IF EXISTS `calendar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendar` (
  `id` int(11) NOT NULL,
  `db_date` date NOT NULL,
  `year` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `yearmonth` varchar(7) NOT NULL,
  `day` int(11) NOT NULL,
  `quarter` int(11) NOT NULL,
  `week` int(11) NOT NULL,
  `dayofweek` int(11) NOT NULL,
  `weekday` int(11) NOT NULL,
  `day_name` varchar(9) NOT NULL,
  `month_name` varchar(9) NOT NULL,
  `lastdayofmonth_flag` char(1) DEFAULT 'f',
  `holiday_flag` char(1) DEFAULT 'f',
  `weekend_flag` char(1) DEFAULT 'f',
  `event` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `td_ymd_idx` (`year`,`month`,`day`),
  UNIQUE KEY `td_dbdate_idx` (`db_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `org_id` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vu_id` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'id',
  `comment_type` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_type` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `origin_text` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` datetime(3) DEFAULT NULL,
  `updated_at` datetime(3) DEFAULT NULL,
  `oss_type` char(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usernames` longtext COLLATE utf8mb4_unicode_ci,
  `related_vus` longtext COLLATE utf8mb4_unicode_ci COMMENT '#json',
  `recalled` tinyint(1) DEFAULT '0' COMMENT '01/',
  `recalled_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`v_id`),
  KEY `comment_type` (`comment_type`) USING BTREE,
  KEY `vu_id` (`vu_id`) USING BTREE,
  KEY `org_id` (`org_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `parent_id` (`parent_id`),
  KEY `id` (`id`),
  KEY `user` (`user`),
  KEY `user_vu` (`vu_id`,`user`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=806828 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment_at_user`
--

DROP TABLE IF EXISTS `comment_at_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_at_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `org_id` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vu_id` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `from_user` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_user_id` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `to_user` char(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `to_user_id` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  `replied_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comment_id` (`comment_id`),
  KEY `to_user` (`to_user`),
  KEY `idx_vuid_touser` (`vu_id`,`to_user`)
) ENGINE=InnoDB AUTO_INCREMENT=149817 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment_related_vu`
--

DROP TABLE IF EXISTS `comment_related_vu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment_related_vu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `org_id` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vu_id` char(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_id` char(36) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11555 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb_event`
--

DROP TABLE IF EXISTS `kb_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb_event` (
  `id` char(36) DEFAULT NULL,
  `board_id` char(36) DEFAULT NULL,
  `stream_id` char(36) DEFAULT NULL,
  `unit_id` char(36) DEFAULT NULL,
  `service_id` char(36) DEFAULT NULL,
  `step_id` char(36) DEFAULT NULL,
  `from_status_id` char(36) DEFAULT NULL,
  `to_status_id` char(36) DEFAULT NULL,
  `event_type` smallint(6) DEFAULT NULL,
  `event_dttm` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `canceled` tinyint(1) DEFAULT '0',
  `abandon` tinyint(1) DEFAULT '0',
  KEY `board_stream_unit_index` (`board_id`,`stream_id`,`unit_id`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb_event_bak`
--

DROP TABLE IF EXISTS `kb_event_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb_event_bak` (
  `event_id` char(36) DEFAULT NULL,
  `kb_id` char(36) DEFAULT NULL,
  `unit_id` char(36) DEFAULT NULL,
  `step_id` char(36) DEFAULT NULL,
  `status_id` char(36) DEFAULT NULL,
  `event_type` smallint(6) DEFAULT NULL,
  `event_dttm` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb_res_event`
--

DROP TABLE IF EXISTS `kb_res_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb_res_event` (
  `id` char(36) DEFAULT NULL,
  `board_id` char(36) DEFAULT NULL,
  `stream_id` char(36) DEFAULT NULL,
  `unit_id` char(36) DEFAULT NULL,
  `service_id` char(36) DEFAULT NULL,
  `step_id` char(36) DEFAULT NULL,
  `status_id` char(36) DEFAULT NULL,
  `resource` varchar(200) DEFAULT NULL,
  `event_type` smallint(6) DEFAULT NULL,
  `event_dttm` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `canceled` tinyint(1) DEFAULT '0',
  `abandon` tinyint(1) DEFAULT '0',
  KEY `board_stream_unit_index` (`board_id`,`stream_id`,`unit_id`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb_unit`
--

DROP TABLE IF EXISTS `kb_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb_unit` (
  `board_id` char(36) DEFAULT NULL,
  `stream_id` char(36) DEFAULT NULL,
  `unit_id` char(36) DEFAULT NULL,
  `service_id` char(36) DEFAULT NULL,
  `lead_time` smallint(6) DEFAULT NULL,
  `create_dttm` timestamp NULL DEFAULT NULL,
  `start_dttm` timestamp NULL DEFAULT NULL,
  `end_dttm` timestamp NULL DEFAULT NULL,
  KEY `board_stream_unit_index` (`board_id`,`stream_id`,`unit_id`) USING HASH,
  KEY `board_stream_lead_index` (`board_id`,`stream_id`,`lead_time`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb_unit_bak`
--

DROP TABLE IF EXISTS `kb_unit_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb_unit_bak` (
  `kb_id` char(36) DEFAULT NULL,
  `unit_id` char(36) DEFAULT NULL,
  `lead_time` smallint(6) DEFAULT NULL,
  `start_dttm` timestamp NULL DEFAULT NULL,
  `end_dttm` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `kb_work`
--

DROP TABLE IF EXISTS `kb_work`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kb_work` (
  `board_id` char(36) DEFAULT NULL,
  `stream_id` char(36) DEFAULT NULL,
  `unit_id` char(36) DEFAULT NULL,
  `service_id` char(36) DEFAULT NULL,
  `step_id` char(36) DEFAULT NULL,
  `status_id` char(36) DEFAULT NULL,
  `resource` varchar(200) DEFAULT NULL,
  `work_date` date DEFAULT NULL,
  `start_dttm` timestamp NULL DEFAULT NULL,
  `end_dttm` timestamp NULL DEFAULT NULL,
  `canceled` tinyint(1) DEFAULT '0',
  `abandon` tinyint(1) DEFAULT '0',
  KEY `board_stream_unit_index` (`board_id`,`stream_id`,`unit_id`) USING HASH,
  KEY `board_stream_unit_resouce_index` (`board_id`,`stream_id`,`unit_id`,`resource`) USING HASH
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `operation_history`
--

DROP TABLE IF EXISTS `operation_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operation_history` (
  `id` varchar(64) CHARACTER SET utf8mb4 NOT NULL COMMENT '主键',
  `tag` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '代表类型，代码层面的',
  `username` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '如：test@agilean.cn',
  `created_at` datetime(3) DEFAULT NULL,
  `source_id` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '操作对象id，操作卡是卡id，操作视图是视图id',
  `scope` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL,
  `org_id` varchar(64) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '组织id',
  `detail` longtext CHARACTER SET utf8mb4,
  `detail_for_zh` longtext CHARACTER SET utf8mb4,
  `type` varchar(32) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT '操作类型，枚举值',
  `body` longtext CHARACTER SET utf8mb4 COMMENT '额外字段，存json',
  `vid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '虚拟的主键',
  `source_name` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'id',
  PRIMARY KEY (`vid`) USING BTREE,
  KEY `scope` (`scope`) USING HASH,
  KEY `source_id` (`source_id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1244488 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_biz_metrics`
--

DROP TABLE IF EXISTS `st_biz_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_biz_metrics` (
  `id` varchar(32) NOT NULL,
  `dttm` datetime DEFAULT NULL,
  `metrics_id` varchar(62) DEFAULT NULL,
  `number_val1` double DEFAULT NULL,
  `number_val10` double DEFAULT NULL,
  `number_val11` double DEFAULT NULL,
  `number_val12` double DEFAULT NULL,
  `number_val13` double DEFAULT NULL,
  `number_val14` double DEFAULT NULL,
  `number_val15` double DEFAULT NULL,
  `number_val16` double DEFAULT NULL,
  `number_val17` double DEFAULT NULL,
  `number_val18` double DEFAULT NULL,
  `number_val19` double DEFAULT NULL,
  `number_val2` double DEFAULT NULL,
  `number_val20` double DEFAULT NULL,
  `number_val3` double DEFAULT NULL,
  `number_val4` double DEFAULT NULL,
  `number_val5` double DEFAULT NULL,
  `number_val6` double DEFAULT NULL,
  `number_val7` double DEFAULT NULL,
  `number_val8` double DEFAULT NULL,
  `number_val9` double DEFAULT NULL,
  `org_id` varchar(62) DEFAULT NULL,
  `str_val1` varchar(255) DEFAULT NULL,
  `str_val10` varchar(255) DEFAULT NULL,
  `str_val11` varchar(255) DEFAULT NULL,
  `str_val12` varchar(255) DEFAULT NULL,
  `str_val13` varchar(255) DEFAULT NULL,
  `str_val14` varchar(255) DEFAULT NULL,
  `str_val15` varchar(255) DEFAULT NULL,
  `str_val16` varchar(255) DEFAULT NULL,
  `str_val17` varchar(255) DEFAULT NULL,
  `str_val18` varchar(255) DEFAULT NULL,
  `str_val19` varchar(255) DEFAULT NULL,
  `str_val2` varchar(255) DEFAULT NULL,
  `str_val20` varchar(255) DEFAULT NULL,
  `str_val3` varchar(255) DEFAULT NULL,
  `str_val4` varchar(255) DEFAULT NULL,
  `str_val5` varchar(255) DEFAULT NULL,
  `str_val6` varchar(255) DEFAULT NULL,
  `str_val7` varchar(255) DEFAULT NULL,
  `str_val8` varchar(255) DEFAULT NULL,
  `str_val9` varchar(255) DEFAULT NULL,
  `text1` text,
  `text2` text,
  `deleted` tinyint(1) DEFAULT '0' COMMENT '01',
  PRIMARY KEY (`id`),
  KEY `date_idx` (`dttm`) USING BTREE,
  KEY `metrics_idx` (`metrics_id`,`org_id`,`deleted`) USING BTREE,
  KEY `plus_idx` (`dttm`,`metrics_id`,`org_id`,`deleted`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_hollow_metrics`
--

DROP TABLE IF EXISTS `st_hollow_metrics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_hollow_metrics` (
  `id` varchar(32) NOT NULL,
  `before_point` bigint(20) DEFAULT NULL,
  `after_point` bigint(20) DEFAULT NULL,
  `count_val` int(11) DEFAULT NULL,
  `version_point` bigint(20) DEFAULT NULL,
  `kind` varchar(32) DEFAULT NULL,
  `dttm` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kind_index` (`kind`) USING BTREE,
  KEY `dttm_index` (`dttm`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_raw_event`
--

DROP TABLE IF EXISTS `st_raw_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_raw_event` (
  `event_id` char(40) DEFAULT NULL,
  `raw_str` text,
  `raw_dttm` timestamp NULL DEFAULT NULL,
  `event_dttm` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_user_behavior_event`
--

DROP TABLE IF EXISTS `st_user_behavior_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_user_behavior_event` (
  `org_id` varchar(50) DEFAULT NULL,
  `behavior_type` varchar(60) DEFAULT NULL,
  `raw_str` text,
  `raw_dttm` varchar(32) DEFAULT NULL,
  `event_dttm` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `st_vu_status_change`
--

DROP TABLE IF EXISTS `st_vu_status_change`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `st_vu_status_change` (
  `event_id` char(40) DEFAULT NULL,
  `board_id` char(60) DEFAULT NULL,
  `stream_id` char(40) DEFAULT NULL,
  `unit_id` char(40) DEFAULT NULL,
  `step_id` char(40) DEFAULT NULL,
  `status_id` char(40) DEFAULT NULL,
  `status_type` tinyint(1) DEFAULT '0',
  `event_dttm` timestamp NULL DEFAULT NULL,
  `event_date` date DEFAULT NULL,
  `is_entry` tinyint(1) DEFAULT '1',
  `is_canceled` tinyint(1) DEFAULT '0',
  KEY `event_id` (`event_id`),
  KEY `vu_ss_enty_idx` (`unit_id`,`stream_id`,`status_id`,`is_entry`),
  KEY `index_name` (`event_dttm`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `static_unittable_d`
--

DROP TABLE IF EXISTS `static_unittable_d`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_unittable_d` (
  `time` int(11) NOT NULL,
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `static_unittable_m`
--

DROP TABLE IF EXISTS `static_unittable_m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_unittable_m` (
  `time` int(11) NOT NULL,
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `static_unittable_w`
--

DROP TABLE IF EXISTS `static_unittable_w`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `static_unittable_w` (
  `time` int(11) NOT NULL,
  KEY `time` (`time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_card_id`
--

DROP TABLE IF EXISTS `sync_card_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_card_id` (
  `card_id` varchar(64) NOT NULL,
  `board_id` varchar(64) DEFAULT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_last_modified` datetime DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_id_mapping`
--

DROP TABLE IF EXISTS `sync_id_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_id_mapping` (
  `id` varchar(64) NOT NULL,
  `board_id` varchar(64) DEFAULT NULL,
  `card_id` varchar(64) DEFAULT NULL,
  `card_status_id` varchar(255) DEFAULT NULL,
  `card_step` varchar(255) DEFAULT NULL,
  `id1` varchar(64) DEFAULT NULL,
  `id2` varchar(64) DEFAULT NULL,
  `id3` varchar(64) DEFAULT NULL,
  `id4` varchar(64) DEFAULT NULL,
  `id5` varchar(64) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `id6` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ipnonfetdmqhbffnceqmftlm` (`card_id`),
  UNIQUE KEY `UK_jijgkhitqttnsrn8wqk8i5h6l` (`id1`),
  UNIQUE KEY `UK_npiwut8o9nelknutvo61rcehl` (`id2`),
  UNIQUE KEY `UK_a8fv0665ohrh0p2cnu2rfnpgu` (`id3`),
  UNIQUE KEY `UK_cviql95n6pvwuqkba6rkktwfy` (`id4`),
  UNIQUE KEY `UK_924sieha74tqca05a3ucbuw5o` (`id5`),
  UNIQUE KEY `UK_o8rr2mwohdimfcuanauyie42x` (`id6`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_third_id`
--

DROP TABLE IF EXISTS `sync_third_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_third_id` (
  `uuid` varchar(64) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `date_last_modified` datetime DEFAULT NULL,
  `flag` varchar(9) DEFAULT NULL,
  `hash` varchar(255) DEFAULT NULL,
  `id1` varchar(64) DEFAULT NULL,
  `id2` varchar(64) DEFAULT NULL,
  `id3` varchar(64) DEFAULT NULL,
  `id4` varchar(64) DEFAULT NULL,
  `module` varchar(64) NOT NULL,
  `card_id` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  UNIQUE KEY `UK4s31ny587jgwcy0xuwgn3iayj` (`module`,`id1`),
  UNIQUE KEY `UKfwgsb6d3chbur624mob0wt8jv` (`module`,`id2`),
  UNIQUE KEY `UKira7i1i28wjtj5y28bexhyhb0` (`module`,`id3`),
  UNIQUE KEY `UKh7cfli45s2dcg9inu2hdr1er2` (`module`,`id4`),
  KEY `FKkapyfdj86ntell8plq3cmidi4` (`card_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_transaction_exchange`
--

DROP TABLE IF EXISTS `sync_transaction_exchange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_transaction_exchange` (
  `uuid` varchar(64) NOT NULL,
  `event_type` varchar(255) DEFAULT NULL,
  `exchange` longtext,
  `log_id` varchar(64) DEFAULT NULL,
  `ex_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `FK3t3q9bpjj0v2kt9ly0jms9d8v` (`log_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sync_transaction_log`
--

DROP TABLE IF EXISTS `sync_transaction_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sync_transaction_log` (
  `id` varchar(64) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `payload` longtext,
  `result` varchar(255) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `adaptor` varchar(255) DEFAULT NULL,
  `cause` longtext,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_read_card`
--

DROP TABLE IF EXISTS `user_read_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_read_card` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vu_id` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'id',
  `org_id` char(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'id',
  `last_read_time` datetime(3) DEFAULT NULL,
  `unread_comment_count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_vuid` (`vu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=90419 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `work_load_data`
--

DROP TABLE IF EXISTS `work_load_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `work_load_data` (
  `id` varchar(255) NOT NULL,
  `card_id` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `person_id` varchar(255) DEFAULT NULL,
  `work_load` double DEFAULT NULL,
  `work_load_type` varchar(255) DEFAULT NULL,
  `remark` text CHARACTER SET utf8,
  PRIMARY KEY (`id`),
  KEY `type_index` (`work_load_type`) USING BTREE,
  KEY `date_index` (`date`) USING HASH,
  KEY `card_index` (`card_id`,`person_id`,`work_load_type`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `working_status_change_event`
--

DROP TABLE IF EXISTS `working_status_change_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `working_status_change_event` (
  `id` varchar(255) NOT NULL COMMENT 'ID',
  `raw_event_id` varchar(255) DEFAULT NULL COMMENT '原始事件ID',
  `raw_dttm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `event_dttm` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `org_id` varchar(255) DEFAULT NULL COMMENT '组织ID',
  `user_id` varchar(255) DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(255) DEFAULT NULL COMMENT '用户名',
  `vu_id` varchar(255) DEFAULT NULL COMMENT '卡ID',
  `vut_id` varchar(255) DEFAULT NULL COMMENT '卡类型ID, 现在没用',
  `status` varchar(30) DEFAULT NULL COMMENT 'Pause: 暂停, Starting: 开始',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='工作状态变更事件表';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-07  7:52:18
