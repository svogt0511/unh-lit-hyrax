CREATE DATABASE  IF NOT EXISTS `hyrax` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `hyrax`;
-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: hyrax
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-04-22 04:42:03','2020-04-22 04:42:03');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmarks`
--

DROP TABLE IF EXISTS `bookmarks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmarks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `document_id` varchar(255) DEFAULT NULL,
  `document_type` varchar(255) DEFAULT NULL,
  `title` blob,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_bookmarks_on_user_id` (`user_id`),
  KEY `index_bookmarks_on_document_id` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmarks`
--

LOCK TABLES `bookmarks` WRITE;
/*!40000 ALTER TABLE `bookmarks` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmarks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checksum_audit_logs`
--

DROP TABLE IF EXISTS `checksum_audit_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `checksum_audit_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_set_id` varchar(255) DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `checked_uri` varchar(255) DEFAULT NULL,
  `expected_result` varchar(255) DEFAULT NULL,
  `actual_result` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `passed` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `by_file_set_id_and_file_id` (`file_set_id`,`file_id`),
  KEY `index_checksum_audit_logs_on_checked_uri` (`checked_uri`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checksum_audit_logs`
--

LOCK TABLES `checksum_audit_logs` WRITE;
/*!40000 ALTER TABLE `checksum_audit_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `checksum_audit_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_branding_infos`
--

DROP TABLE IF EXISTS `collection_branding_infos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_branding_infos` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `collection_id` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `local_path` varchar(255) DEFAULT NULL,
  `alt_text` varchar(255) DEFAULT NULL,
  `target_url` varchar(255) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_branding_infos`
--

LOCK TABLES `collection_branding_infos` WRITE;
/*!40000 ALTER TABLE `collection_branding_infos` DISABLE KEYS */;
/*!40000 ALTER TABLE `collection_branding_infos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `collection_type_participants`
--

DROP TABLE IF EXISTS `collection_type_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `collection_type_participants` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hyrax_collection_type_id` bigint(20) DEFAULT NULL,
  `agent_type` varchar(255) DEFAULT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `access` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hyrax_collection_type_id` (`hyrax_collection_type_id`),
  CONSTRAINT `fk_rails_2da4e10612` FOREIGN KEY (`hyrax_collection_type_id`) REFERENCES `hyrax_collection_types` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `collection_type_participants`
--

LOCK TABLES `collection_type_participants` WRITE;
/*!40000 ALTER TABLE `collection_type_participants` DISABLE KEYS */;
INSERT INTO `collection_type_participants` VALUES (1,1,'group','admin','manage','2020-04-22 22:18:01','2020-04-22 22:18:01'),(2,1,'group','admin','create','2020-04-22 22:18:01','2020-04-22 22:18:01');
/*!40000 ALTER TABLE `collection_type_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content_blocks`
--

DROP TABLE IF EXISTS `content_blocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `content_blocks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `value` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `external_key` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content_blocks`
--

LOCK TABLES `content_blocks` WRITE;
/*!40000 ALTER TABLE `content_blocks` DISABLE KEYS */;
INSERT INTO `content_blocks` VALUES (1,'featured_researcher',NULL,'2020-04-22 20:03:27','2020-04-22 20:03:27',NULL),(2,'marketing_text',NULL,'2020-04-22 20:03:27','2020-04-22 20:03:27',NULL),(3,'announcement_text',NULL,'2020-04-22 20:03:27','2020-04-22 20:03:27',NULL),(4,'header_background_color','#003591','2020-04-22 20:58:38','2020-04-22 20:58:38',NULL),(5,'header_text_color','#dcdcdc','2020-04-22 20:58:38','2020-04-22 20:58:38',NULL),(6,'link_color','#2e74b2','2020-04-22 20:58:38','2020-04-22 20:58:38',NULL),(7,'footer_link_color','#ffebcd','2020-04-22 20:58:38','2020-04-22 20:58:38',NULL),(8,'primary_button_background_color','#286090','2020-04-22 20:58:38','2020-04-22 20:58:38',NULL);
/*!40000 ALTER TABLE `content_blocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curation_concerns_operations`
--

DROP TABLE IF EXISTS `curation_concerns_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `curation_concerns_operations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `status` varchar(255) DEFAULT NULL,
  `operation_type` varchar(255) DEFAULT NULL,
  `job_class` varchar(255) DEFAULT NULL,
  `job_id` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `message` text,
  `user_id` bigint(20) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  `depth` int(11) NOT NULL DEFAULT '0',
  `children_count` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_curation_concerns_operations_on_user_id` (`user_id`),
  KEY `index_curation_concerns_operations_on_parent_id` (`parent_id`),
  KEY `index_curation_concerns_operations_on_lft` (`lft`),
  KEY `index_curation_concerns_operations_on_rgt` (`rgt`),
  CONSTRAINT `fk_rails_3c63b420e5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curation_concerns_operations`
--

LOCK TABLES `curation_concerns_operations` WRITE;
/*!40000 ALTER TABLE `curation_concerns_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `curation_concerns_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `featured_works`
--

DROP TABLE IF EXISTS `featured_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `featured_works` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order` int(11) DEFAULT '5',
  `work_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_featured_works_on_work_id` (`work_id`),
  KEY `index_featured_works_on_order` (`order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `featured_works`
--

LOCK TABLES `featured_works` WRITE;
/*!40000 ALTER TABLE `featured_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `featured_works` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_download_stats`
--

DROP TABLE IF EXISTS `file_download_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_download_stats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `downloads` int(11) DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_file_download_stats_on_file_id` (`file_id`),
  KEY `index_file_download_stats_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_download_stats`
--

LOCK TABLES `file_download_stats` WRITE;
/*!40000 ALTER TABLE `file_download_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_download_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file_view_stats`
--

DROP TABLE IF EXISTS `file_view_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file_view_stats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `file_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_file_view_stats_on_file_id` (`file_id`),
  KEY `index_file_view_stats_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file_view_stats`
--

LOCK TABLES `file_view_stats` WRITE;
/*!40000 ALTER TABLE `file_view_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `file_view_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hyrax_collection_types`
--

DROP TABLE IF EXISTS `hyrax_collection_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hyrax_collection_types` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `machine_id` varchar(255) DEFAULT NULL,
  `nestable` tinyint(1) NOT NULL DEFAULT '1',
  `discoverable` tinyint(1) NOT NULL DEFAULT '1',
  `sharable` tinyint(1) NOT NULL DEFAULT '1',
  `allow_multiple_membership` tinyint(1) NOT NULL DEFAULT '1',
  `require_membership` tinyint(1) NOT NULL DEFAULT '0',
  `assigns_workflow` tinyint(1) NOT NULL DEFAULT '0',
  `assigns_visibility` tinyint(1) NOT NULL DEFAULT '0',
  `share_applies_to_new_works` tinyint(1) NOT NULL DEFAULT '1',
  `brandable` tinyint(1) NOT NULL DEFAULT '1',
  `badge_color` varchar(255) DEFAULT '#663333',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_hyrax_collection_types_on_machine_id` (`machine_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hyrax_collection_types`
--

LOCK TABLES `hyrax_collection_types` WRITE;
/*!40000 ALTER TABLE `hyrax_collection_types` DISABLE KEYS */;
INSERT INTO `hyrax_collection_types` VALUES (1,'Admin Set','An aggregation of works that is intended to help with administrative control. Admin Sets provide a way of defining behaviors and policies around a set of works.','admin_set',0,0,1,0,1,1,1,1,0,'#405060');
/*!40000 ALTER TABLE `hyrax_collection_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hyrax_features`
--

DROP TABLE IF EXISTS `hyrax_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hyrax_features` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hyrax_features`
--

LOCK TABLES `hyrax_features` WRITE;
/*!40000 ALTER TABLE `hyrax_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `hyrax_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_io_wrappers`
--

DROP TABLE IF EXISTS `job_io_wrappers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_io_wrappers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `uploaded_file_id` bigint(20) DEFAULT NULL,
  `file_set_id` varchar(255) DEFAULT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `original_name` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `relation` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_job_io_wrappers_on_user_id` (`user_id`),
  KEY `index_job_io_wrappers_on_uploaded_file_id` (`uploaded_file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_io_wrappers`
--

LOCK TABLES `job_io_wrappers` WRITE;
/*!40000 ALTER TABLE `job_io_wrappers` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_io_wrappers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_conversation_opt_outs`
--

DROP TABLE IF EXISTS `mailboxer_conversation_opt_outs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mailboxer_conversation_opt_outs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `unsubscriber_type` varchar(255) DEFAULT NULL,
  `unsubscriber_id` int(11) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mailboxer_conversation_opt_outs_on_unsubscriber_id_type` (`unsubscriber_id`,`unsubscriber_type`),
  KEY `index_mailboxer_conversation_opt_outs_on_conversation_id` (`conversation_id`),
  CONSTRAINT `mb_opt_outs_on_conversations_id` FOREIGN KEY (`conversation_id`) REFERENCES `mailboxer_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_conversation_opt_outs`
--

LOCK TABLES `mailboxer_conversation_opt_outs` WRITE;
/*!40000 ALTER TABLE `mailboxer_conversation_opt_outs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailboxer_conversation_opt_outs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_conversations`
--

DROP TABLE IF EXISTS `mailboxer_conversations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mailboxer_conversations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) DEFAULT '',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_conversations`
--

LOCK TABLES `mailboxer_conversations` WRITE;
/*!40000 ALTER TABLE `mailboxer_conversations` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailboxer_conversations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_notifications`
--

DROP TABLE IF EXISTS `mailboxer_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mailboxer_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) DEFAULT NULL,
  `body` text,
  `subject` varchar(255) DEFAULT '',
  `sender_type` varchar(255) DEFAULT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `conversation_id` int(11) DEFAULT NULL,
  `draft` tinyint(1) DEFAULT '0',
  `notification_code` varchar(255) DEFAULT NULL,
  `notified_object_type` varchar(255) DEFAULT NULL,
  `notified_object_id` int(11) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  `global` tinyint(1) DEFAULT '0',
  `expires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mailboxer_notifications_notified_object` (`notified_object_type`,`notified_object_id`),
  KEY `index_mailboxer_notifications_on_conversation_id` (`conversation_id`),
  KEY `index_mailboxer_notifications_on_type` (`type`),
  KEY `index_mailboxer_notifications_on_sender_id_and_sender_type` (`sender_id`,`sender_type`),
  KEY `index_mailboxer_notifications_on_notified_object_id_and_type` (`notified_object_id`,`notified_object_type`),
  CONSTRAINT `notifications_on_conversation_id` FOREIGN KEY (`conversation_id`) REFERENCES `mailboxer_conversations` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_notifications`
--

LOCK TABLES `mailboxer_notifications` WRITE;
/*!40000 ALTER TABLE `mailboxer_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailboxer_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mailboxer_receipts`
--

DROP TABLE IF EXISTS `mailboxer_receipts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mailboxer_receipts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiver_type` varchar(255) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `notification_id` int(11) NOT NULL,
  `is_read` tinyint(1) DEFAULT '0',
  `trashed` tinyint(1) DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  `mailbox_type` varchar(25) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_delivered` tinyint(1) DEFAULT '0',
  `delivery_method` varchar(255) DEFAULT NULL,
  `message_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_mailboxer_receipts_on_notification_id` (`notification_id`),
  KEY `index_mailboxer_receipts_on_receiver_id_and_receiver_type` (`receiver_id`,`receiver_type`),
  CONSTRAINT `receipts_on_notification_id` FOREIGN KEY (`notification_id`) REFERENCES `mailboxer_notifications` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailboxer_receipts`
--

LOCK TABLES `mailboxer_receipts` WRITE;
/*!40000 ALTER TABLE `mailboxer_receipts` DISABLE KEYS */;
/*!40000 ALTER TABLE `mailboxer_receipts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `minter_states`
--

DROP TABLE IF EXISTS `minter_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `minter_states` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namespace` varchar(255) NOT NULL DEFAULT 'default',
  `template` varchar(255) NOT NULL,
  `counters` text,
  `seq` bigint(20) DEFAULT '0',
  `rand` blob,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_minter_states_on_namespace` (`namespace`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `minter_states`
--

LOCK TABLES `minter_states` WRITE;
/*!40000 ALTER TABLE `minter_states` DISABLE KEYS */;
/*!40000 ALTER TABLE `minter_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `notifiable_type` varchar(255) DEFAULT NULL,
  `notifiable_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_notifications_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_b080fb4855` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_template_accesses`
--

DROP TABLE IF EXISTS `permission_template_accesses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_template_accesses` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `permission_template_id` bigint(20) DEFAULT NULL,
  `agent_type` varchar(255) DEFAULT NULL,
  `agent_id` varchar(255) DEFAULT NULL,
  `access` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_permission_template_accesses` (`permission_template_id`,`agent_id`,`agent_type`,`access`),
  KEY `index_permission_template_accesses_on_permission_template_id` (`permission_template_id`),
  CONSTRAINT `fk_rails_9c1ccdc6d5` FOREIGN KEY (`permission_template_id`) REFERENCES `permission_templates` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_template_accesses`
--

LOCK TABLES `permission_template_accesses` WRITE;
/*!40000 ALTER TABLE `permission_template_accesses` DISABLE KEYS */;
INSERT INTO `permission_template_accesses` VALUES (1,1,'group','admin','manage','2020-04-22 19:57:46','2020-04-22 19:57:46'),(2,1,'group','registered','deposit','2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `permission_template_accesses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission_templates`
--

DROP TABLE IF EXISTS `permission_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission_templates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_id` varchar(255) DEFAULT NULL,
  `visibility` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `release_date` date DEFAULT NULL,
  `release_period` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_permission_templates_on_source_id` (`source_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission_templates`
--

LOCK TABLES `permission_templates` WRITE;
/*!40000 ALTER TABLE `permission_templates` DISABLE KEYS */;
INSERT INTO `permission_templates` VALUES (1,'admin_set/default',NULL,'2020-04-22 19:57:46','2020-04-22 19:57:46',NULL,NULL);
/*!40000 ALTER TABLE `permission_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_deposit_requests`
--

DROP TABLE IF EXISTS `proxy_deposit_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxy_deposit_requests` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `work_id` varchar(255) NOT NULL,
  `sending_user_id` bigint(20) NOT NULL,
  `receiving_user_id` bigint(20) NOT NULL,
  `fulfillment_date` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `sender_comment` text,
  `receiver_comment` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proxy_deposit_requests_on_sending_user_id` (`sending_user_id`),
  KEY `index_proxy_deposit_requests_on_receiving_user_id` (`receiving_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_deposit_requests`
--

LOCK TABLES `proxy_deposit_requests` WRITE;
/*!40000 ALTER TABLE `proxy_deposit_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_deposit_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proxy_deposit_rights`
--

DROP TABLE IF EXISTS `proxy_deposit_rights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proxy_deposit_rights` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `grantor_id` bigint(20) DEFAULT NULL,
  `grantee_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_proxy_deposit_rights_on_grantor_id` (`grantor_id`),
  KEY `index_proxy_deposit_rights_on_grantee_id` (`grantee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proxy_deposit_rights`
--

LOCK TABLES `proxy_deposit_rights` WRITE;
/*!40000 ALTER TABLE `proxy_deposit_rights` DISABLE KEYS */;
/*!40000 ALTER TABLE `proxy_deposit_rights` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_local_authorities`
--

DROP TABLE IF EXISTS `qa_local_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_local_authorities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_qa_local_authorities_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_local_authorities`
--

LOCK TABLES `qa_local_authorities` WRITE;
/*!40000 ALTER TABLE `qa_local_authorities` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_local_authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qa_local_authority_entries`
--

DROP TABLE IF EXISTS `qa_local_authority_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qa_local_authority_entries` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `local_authority_id` bigint(20) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_qa_local_authority_entries_on_uri` (`uri`),
  KEY `index_qa_local_authority_entries_on_local_authority_id` (`local_authority_id`),
  CONSTRAINT `fk_rails_cee742275b` FOREIGN KEY (`local_authority_id`) REFERENCES `qa_local_authorities` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qa_local_authority_entries`
--

LOCK TABLES `qa_local_authority_entries` WRITE;
/*!40000 ALTER TABLE `qa_local_authority_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `qa_local_authority_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin'),(2,'site_admin');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles_users`
--

DROP TABLE IF EXISTS `roles_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles_users` (
  `role_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  KEY `index_roles_users_on_role_id` (`role_id`),
  KEY `index_roles_users_on_user_id` (`user_id`),
  KEY `index_roles_users_on_role_id_and_user_id` (`role_id`,`user_id`),
  KEY `index_roles_users_on_user_id_and_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles_users`
--

LOCK TABLES `roles_users` WRITE;
/*!40000 ALTER TABLE `roles_users` DISABLE KEYS */;
INSERT INTO `roles_users` VALUES (1,1),(1,2),(1,3),(1,4),(2,1);
/*!40000 ALTER TABLE `roles_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('201901162141281'),('201901162203121'),('201901241536541'),('201901241536542'),('20190911133657'),('20190911134002'),('20190911142616'),('20190918214137'),('20190919145012'),('20190921153802'),('20190921153851'),('20190921153933'),('20190921154009'),('20190921154038'),('20190921154221'),('20190923182946'),('20191029162902'),('20191031131041'),('20191105165518'),('20191105211127'),('20191112041219'),('20191112041220'),('20191112041221'),('20191112041323'),('20191112041341'),('20191112041602'),('20191112041603'),('20191112041604'),('20191112041605'),('20191112041606'),('20191112041607'),('20191112041608'),('20191112041609'),('20191112041610'),('20191112041611'),('20191112041612'),('20191112041613'),('20191112041614'),('20191112041615'),('20191112041616'),('20191112041617'),('20191112041618'),('20191112041619'),('20191112041620'),('20191112041621'),('20191112041622'),('20191112041623'),('20191112041624'),('20191112041625'),('20191112041626'),('20191112041627'),('20191112041628'),('20191112041629'),('20191112041630'),('20191112041631'),('20191112041632'),('20191112041633'),('20191112041634'),('20191112041635'),('20191112041636'),('20191112041637'),('20191112041638'),('20191112041639'),('20191112041640'),('20191112041641'),('20191112041642'),('20191112041643'),('20191112041644'),('20191112041645'),('20191112041646'),('20191112041647'),('20191112041648'),('20191112041649'),('20191112041650'),('20191112041651'),('20191112041652'),('20191112041719'),('20191112041720'),('20191112041721'),('20191112041722'),('20191112041757'),('20191112041817'),('20191112041952'),('20191112041953'),('20191114021032'),('20191210223833'),('20200316200130'),('20200318202355'),('20200320050102'),('20200418183917');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `searches`
--

DROP TABLE IF EXISTS `searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `query_params` blob,
  `user_id` int(11) DEFAULT NULL,
  `user_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_searches_on_user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `searches`
--

LOCK TABLES `searches` WRITE;
/*!40000 ALTER TABLE `searches` DISABLE KEYS */;
INSERT INTO `searches` VALUES (1,_binary '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nlocale: en\ncontroller: hyrax/my/works\naction: index\n',NULL,NULL,'2020-04-22 20:57:59','2020-04-22 20:57:59'),(2,_binary '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nlocale: en\ncontroller: hyrax/my/collections\naction: index\n',NULL,NULL,'2020-04-22 20:59:02','2020-04-22 20:59:02'),(3,_binary '--- !ruby/hash:ActiveSupport::HashWithIndifferentAccess\nlocale: en\ncontroller: hyrax/dashboard/collections\naction: index\n',NULL,NULL,'2020-04-22 22:18:01','2020-04-22 22:18:01');
/*!40000 ALTER TABLE `searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `single_use_links`
--

DROP TABLE IF EXISTS `single_use_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `single_use_links` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `download_key` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `item_id` varchar(255) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `single_use_links`
--

LOCK TABLES `single_use_links` WRITE;
/*!40000 ALTER TABLE `single_use_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `single_use_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_agents`
--

DROP TABLE IF EXISTS `sipity_agents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_agents` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proxy_for_id` varchar(255) NOT NULL,
  `proxy_for_type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sipity_agents_proxy_for` (`proxy_for_id`,`proxy_for_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_agents`
--

LOCK TABLES `sipity_agents` WRITE;
/*!40000 ALTER TABLE `sipity_agents` DISABLE KEYS */;
INSERT INTO `sipity_agents` VALUES (1,'admin','Hyrax::Group','2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,'registered','Hyrax::Group','2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,'1','User','2020-04-22 20:12:08','2020-04-22 20:12:08');
/*!40000 ALTER TABLE `sipity_agents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_comments`
--

DROP TABLE IF EXISTS `sipity_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_comments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `comment` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sipity_comments_on_agent_id` (`agent_id`),
  KEY `index_sipity_comments_on_created_at` (`created_at`),
  KEY `index_sipity_comments_on_entity_id` (`entity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_comments`
--

LOCK TABLES `sipity_comments` WRITE;
/*!40000 ALTER TABLE `sipity_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `sipity_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_entities`
--

DROP TABLE IF EXISTS `sipity_entities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_entities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `proxy_for_global_id` varchar(255) NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `workflow_state_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sipity_entities_proxy_for_global_id` (`proxy_for_global_id`),
  KEY `index_sipity_entities_on_workflow_id` (`workflow_id`),
  KEY `index_sipity_entities_on_workflow_state_id` (`workflow_state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_entities`
--

LOCK TABLES `sipity_entities` WRITE;
/*!40000 ALTER TABLE `sipity_entities` DISABLE KEYS */;
/*!40000 ALTER TABLE `sipity_entities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_entity_specific_responsibilities`
--

DROP TABLE IF EXISTS `sipity_entity_specific_responsibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_entity_specific_responsibilities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflow_role_id` int(11) NOT NULL,
  `entity_id` varchar(255) NOT NULL,
  `agent_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sipity_entity_specific_responsibilities_aggregate` (`workflow_role_id`,`entity_id`,`agent_id`),
  KEY `sipity_entity_specific_responsibilities_agent` (`agent_id`),
  KEY `sipity_entity_specific_responsibilities_entity` (`entity_id`),
  KEY `sipity_entity_specific_responsibilities_role` (`workflow_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_entity_specific_responsibilities`
--

LOCK TABLES `sipity_entity_specific_responsibilities` WRITE;
/*!40000 ALTER TABLE `sipity_entity_specific_responsibilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `sipity_entity_specific_responsibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_notifiable_contexts`
--

DROP TABLE IF EXISTS `sipity_notifiable_contexts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_notifiable_contexts` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `scope_for_notification_id` int(11) NOT NULL,
  `scope_for_notification_type` varchar(255) NOT NULL,
  `reason_for_notification` varchar(255) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sipity_notifiable_contexts_concern_surrogate` (`scope_for_notification_id`,`scope_for_notification_type`,`reason_for_notification`,`notification_id`),
  KEY `sipity_notifiable_contexts_notification_id` (`notification_id`),
  KEY `sipity_notifiable_contexts_concern_context` (`scope_for_notification_id`,`scope_for_notification_type`,`reason_for_notification`),
  KEY `sipity_notifiable_contexts_concern` (`scope_for_notification_id`,`scope_for_notification_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_notifiable_contexts`
--

LOCK TABLES `sipity_notifiable_contexts` WRITE;
/*!40000 ALTER TABLE `sipity_notifiable_contexts` DISABLE KEYS */;
INSERT INTO `sipity_notifiable_contexts` VALUES (1,1,'Sipity::WorkflowAction','action_is_taken',1,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,2,'Sipity::WorkflowAction','action_is_taken',2,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,3,'Sipity::WorkflowAction','action_is_taken',3,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(4,4,'Sipity::WorkflowAction','action_is_taken',1,'2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `sipity_notifiable_contexts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_notification_recipients`
--

DROP TABLE IF EXISTS `sipity_notification_recipients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_notification_recipients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `notification_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `recipient_strategy` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sipity_notifications_recipients_surrogate` (`notification_id`,`role_id`,`recipient_strategy`),
  KEY `sipity_notification_recipients_notification` (`notification_id`),
  KEY `sipity_notification_recipients_recipient_strategy` (`recipient_strategy`),
  KEY `sipity_notification_recipients_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_notification_recipients`
--

LOCK TABLES `sipity_notification_recipients` WRITE;
/*!40000 ALTER TABLE `sipity_notification_recipients` DISABLE KEYS */;
INSERT INTO `sipity_notification_recipients` VALUES (1,1,2,'to','2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,2,2,'to','2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,3,2,'to','2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `sipity_notification_recipients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_notifications`
--

DROP TABLE IF EXISTS `sipity_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_notifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `notification_type` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sipity_notifications_on_name` (`name`),
  KEY `index_sipity_notifications_on_notification_type` (`notification_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_notifications`
--

LOCK TABLES `sipity_notifications` WRITE;
/*!40000 ALTER TABLE `sipity_notifications` DISABLE KEYS */;
INSERT INTO `sipity_notifications` VALUES (1,'Hyrax::Workflow::PendingReviewNotification','email','2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,'Hyrax::Workflow::ChangesRequiredNotification','email','2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,'Hyrax::Workflow::DepositedNotification','email','2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `sipity_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_roles`
--

DROP TABLE IF EXISTS `sipity_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sipity_roles_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_roles`
--

LOCK TABLES `sipity_roles` WRITE;
/*!40000 ALTER TABLE `sipity_roles` DISABLE KEYS */;
INSERT INTO `sipity_roles` VALUES (1,'managing','Grants access to management tasks','2020-04-22 19:57:11','2020-04-22 19:57:11'),(2,'approving','Grants access to approval tasks','2020-04-22 19:57:11','2020-04-22 19:57:11'),(3,'depositing','Grants access to depositing tasks','2020-04-22 19:57:11','2020-04-22 19:57:11');
/*!40000 ALTER TABLE `sipity_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_workflow_actions`
--

DROP TABLE IF EXISTS `sipity_workflow_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_workflow_actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `resulting_workflow_state_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sipity_workflow_actions_aggregate` (`workflow_id`,`name`),
  KEY `sipity_workflow_actions_resulting_workflow_state` (`resulting_workflow_state_id`),
  KEY `sipity_workflow_actions_workflow` (`workflow_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_workflow_actions`
--

LOCK TABLES `sipity_workflow_actions` WRITE;
/*!40000 ALTER TABLE `sipity_workflow_actions` DISABLE KEYS */;
INSERT INTO `sipity_workflow_actions` VALUES (1,1,1,'deposit','2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,1,3,'request_changes','2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,1,2,'approve','2020-04-22 19:57:47','2020-04-22 19:57:47'),(4,1,1,'request_review','2020-04-22 19:57:47','2020-04-22 19:57:47'),(5,1,NULL,'comment_only','2020-04-22 19:57:47','2020-04-22 19:57:47'),(6,2,4,'deposit','2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `sipity_workflow_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_workflow_methods`
--

DROP TABLE IF EXISTS `sipity_workflow_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_workflow_methods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_name` varchar(255) NOT NULL,
  `weight` int(11) NOT NULL,
  `workflow_action_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sipity_workflow_methods_on_workflow_action_id` (`workflow_action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_workflow_methods`
--

LOCK TABLES `sipity_workflow_methods` WRITE;
/*!40000 ALTER TABLE `sipity_workflow_methods` DISABLE KEYS */;
INSERT INTO `sipity_workflow_methods` VALUES (1,'Hyrax::Workflow::GrantReadToDepositor',0,1,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,'Hyrax::Workflow::DeactivateObject',1,1,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,'Hyrax::Workflow::DeactivateObject',0,2,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(4,'Hyrax::Workflow::GrantEditToDepositor',1,2,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(5,'Hyrax::Workflow::GrantReadToDepositor',0,3,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(6,'Hyrax::Workflow::RevokeEditFromDepositor',1,3,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(7,'Hyrax::Workflow::ActivateObject',2,3,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(8,'Hyrax::Workflow::GrantEditToDepositor',0,6,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(9,'Hyrax::Workflow::ActivateObject',1,6,'2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `sipity_workflow_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_workflow_responsibilities`
--

DROP TABLE IF EXISTS `sipity_workflow_responsibilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_workflow_responsibilities` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `agent_id` int(11) NOT NULL,
  `workflow_role_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sipity_workflow_responsibilities_aggregate` (`agent_id`,`workflow_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_workflow_responsibilities`
--

LOCK TABLES `sipity_workflow_responsibilities` WRITE;
/*!40000 ALTER TABLE `sipity_workflow_responsibilities` DISABLE KEYS */;
INSERT INTO `sipity_workflow_responsibilities` VALUES (1,1,3,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,1,4,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,1,5,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(4,1,6,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(5,1,1,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(6,1,2,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(7,2,5,'2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `sipity_workflow_responsibilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_workflow_roles`
--

DROP TABLE IF EXISTS `sipity_workflow_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_workflow_roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sipity_workflow_roles_aggregate` (`workflow_id`,`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_workflow_roles`
--

LOCK TABLES `sipity_workflow_roles` WRITE;
/*!40000 ALTER TABLE `sipity_workflow_roles` DISABLE KEYS */;
INSERT INTO `sipity_workflow_roles` VALUES (1,1,2,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,1,3,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,2,1,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(4,2,2,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(5,2,3,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(6,1,1,'2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `sipity_workflow_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_workflow_state_action_permissions`
--

DROP TABLE IF EXISTS `sipity_workflow_state_action_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_workflow_state_action_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflow_role_id` int(11) NOT NULL,
  `workflow_state_action_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sipity_workflow_state_action_permissions_aggregate` (`workflow_role_id`,`workflow_state_action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_workflow_state_action_permissions`
--

LOCK TABLES `sipity_workflow_state_action_permissions` WRITE;
/*!40000 ALTER TABLE `sipity_workflow_state_action_permissions` DISABLE KEYS */;
INSERT INTO `sipity_workflow_state_action_permissions` VALUES (1,1,1,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,1,2,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,1,3,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(4,2,4,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(5,1,5,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(6,1,6,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(7,2,7,'2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `sipity_workflow_state_action_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_workflow_state_actions`
--

DROP TABLE IF EXISTS `sipity_workflow_state_actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_workflow_state_actions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `originating_workflow_state_id` int(11) NOT NULL,
  `workflow_action_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sipity_workflow_state_actions_aggregate` (`originating_workflow_state_id`,`workflow_action_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_workflow_state_actions`
--

LOCK TABLES `sipity_workflow_state_actions` WRITE;
/*!40000 ALTER TABLE `sipity_workflow_state_actions` DISABLE KEYS */;
INSERT INTO `sipity_workflow_state_actions` VALUES (1,2,2,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,1,2,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,1,3,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(4,3,4,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(5,1,5,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(6,2,5,'2020-04-22 19:57:47','2020-04-22 19:57:47'),(7,3,5,'2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `sipity_workflow_state_actions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_workflow_states`
--

DROP TABLE IF EXISTS `sipity_workflow_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_workflow_states` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sipity_type_state_aggregate` (`workflow_id`,`name`),
  KEY `index_sipity_workflow_states_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_workflow_states`
--

LOCK TABLES `sipity_workflow_states` WRITE;
/*!40000 ALTER TABLE `sipity_workflow_states` DISABLE KEYS */;
INSERT INTO `sipity_workflow_states` VALUES (1,1,'pending_review','2020-04-22 19:57:47','2020-04-22 19:57:47'),(2,1,'deposited','2020-04-22 19:57:47','2020-04-22 19:57:47'),(3,1,'changes_required','2020-04-22 19:57:47','2020-04-22 19:57:47'),(4,2,'deposited','2020-04-22 19:57:47','2020-04-22 19:57:47');
/*!40000 ALTER TABLE `sipity_workflow_states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sipity_workflows`
--

DROP TABLE IF EXISTS `sipity_workflows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sipity_workflows` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `permission_template_id` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `allows_access_grant` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_sipity_workflows_on_permission_template_and_name` (`permission_template_id`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sipity_workflows`
--

LOCK TABLES `sipity_workflows` WRITE;
/*!40000 ALTER TABLE `sipity_workflows` DISABLE KEYS */;
INSERT INTO `sipity_workflows` VALUES (1,'one_step_mediated_deposit','One-step mediated deposit workflow','A single-step workflow for mediated deposit in which all deposits must be approved by a reviewer. Reviewer may also send deposits back to the depositor.','2020-04-22 19:57:47','2020-04-22 19:57:47',1,NULL,0),(2,'default','Default workflow','A single submission step, default workflow','2020-04-22 19:57:47','2020-04-22 19:57:47',1,1,1);
/*!40000 ALTER TABLE `sipity_workflows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tinymce_assets`
--

DROP TABLE IF EXISTS `tinymce_assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tinymce_assets` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tinymce_assets`
--

LOCK TABLES `tinymce_assets` WRITE;
/*!40000 ALTER TABLE `tinymce_assets` DISABLE KEYS */;
/*!40000 ALTER TABLE `tinymce_assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trophies`
--

DROP TABLE IF EXISTS `trophies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trophies` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `work_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trophies`
--

LOCK TABLES `trophies` WRITE;
/*!40000 ALTER TABLE `trophies` DISABLE KEYS */;
/*!40000 ALTER TABLE `trophies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uploaded_files`
--

DROP TABLE IF EXISTS `uploaded_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uploaded_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `file_set_uri` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_uploaded_files_on_user_id` (`user_id`),
  KEY `index_uploaded_files_on_file_set_uri` (`file_set_uri`),
  CONSTRAINT `fk_rails_ece9dfb06e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uploaded_files`
--

LOCK TABLES `uploaded_files` WRITE;
/*!40000 ALTER TABLE `uploaded_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `uploaded_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_stats`
--

DROP TABLE IF EXISTS `user_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_stats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `file_views` int(11) DEFAULT NULL,
  `file_downloads` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `work_views` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_user_stats_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_stats`
--

LOCK TABLES `user_stats` WRITE;
/*!40000 ALTER TABLE `user_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `guest` tinyint(1) DEFAULT '0',
  `facebook_handle` varchar(255) DEFAULT NULL,
  `twitter_handle` varchar(255) DEFAULT NULL,
  `googleplus_handle` varchar(255) DEFAULT NULL,
  `display_name` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `admin_area` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `office` varchar(255) DEFAULT NULL,
  `chat_id` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `affiliation` varchar(255) DEFAULT NULL,
  `telephone` varchar(255) DEFAULT NULL,
  `avatar_file_name` varchar(255) DEFAULT NULL,
  `avatar_content_type` varchar(255) DEFAULT NULL,
  `avatar_file_size` int(11) DEFAULT NULL,
  `avatar_updated_at` datetime DEFAULT NULL,
  `linkedin_handle` varchar(255) DEFAULT NULL,
  `orcid` varchar(255) DEFAULT NULL,
  `arkivo_token` varchar(255) DEFAULT NULL,
  `arkivo_subscription` varchar(255) DEFAULT NULL,
  `zotero_token` blob,
  `zotero_userid` varchar(255) DEFAULT NULL,
  `preferred_locale` varchar(255) DEFAULT NULL,
  `approved` tinyint(1) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `confirmation_token` varchar(255) DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `confirmation_sent_at` datetime DEFAULT NULL,
  `unconfirmed_email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`),
  UNIQUE KEY `index_users_on_username` (`username`),
  UNIQUE KEY `index_users_on_confirmation_token` (`confirmation_token`),
  KEY `index_users_on_approved` (`approved`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'suzanne.vogt@unh.edu','$2a$11$yfRagaaaAmZTBtnFDf0lteha8e/1YBSmciVDc3wLZivlkXnCBTfpq',NULL,NULL,NULL,'2019-11-14 15:57:20','2020-01-28 14:50:26',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en',1,'skv2000',NULL,'2020-03-24 05:14:20',NULL,NULL),(2,'svogt@sumarc.net','$2a$11$//OKEi7ORSRXaPt3SY5CLO.rtkiwd0TO25ipDdoOPt1BTEWZr3wIm',NULL,NULL,NULL,'2020-03-24 06:00:26','2020-03-24 06:08:19',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en',1,'svogt','GswEjhXq_xT9D9o2K9VX','2020-03-24 06:06:00','2020-03-24 06:00:00',NULL),(3,'patricia.condon@unh.edu','$2a$11$oNwlY.dAOjcLmDOwav6v2uDolHv8ynsmWwcwH6Q8YH2zSjAxm//ay',NULL,NULL,NULL,'2020-03-24 14:44:22','2020-03-24 15:06:46',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en',1,'pcondon','uwjbzmyMexpLn5UJhZsT','2020-03-24 14:44:00','2020-03-24 14:44:00',NULL),(4,'sarah.stinson@unh.edu','$2a$11$gxelNYpgRM/T5E/jNylc3epAg4wl1P5IiBCicJmPGYQSFS9UUrCnq',NULL,NULL,'2020-03-25 15:02:04','2020-03-24 21:40:06','2020-03-25 15:02:08',0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'en',1,'ssm6','tGWGuCXwrt4ffY6iJm4-','2020-03-24 21:42:00','2020-03-24 21:40:00',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `version_committers`
--

DROP TABLE IF EXISTS `version_committers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `version_committers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `obj_id` varchar(255) DEFAULT NULL,
  `datastream_id` varchar(255) DEFAULT NULL,
  `version_id` varchar(255) DEFAULT NULL,
  `committer_login` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `version_committers`
--

LOCK TABLES `version_committers` WRITE;
/*!40000 ALTER TABLE `version_committers` DISABLE KEYS */;
/*!40000 ALTER TABLE `version_committers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_view_stats`
--

DROP TABLE IF EXISTS `work_view_stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_view_stats` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `work_views` int(11) DEFAULT NULL,
  `work_id` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_work_view_stats_on_work_id` (`work_id`),
  KEY `index_work_view_stats_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_view_stats`
--

LOCK TABLES `work_view_stats` WRITE;
/*!40000 ALTER TABLE `work_view_stats` DISABLE KEYS */;
/*!40000 ALTER TABLE `work_view_stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zizia_csv_import_details`
--

DROP TABLE IF EXISTS `zizia_csv_import_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zizia_csv_import_details` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `csv_import_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `depositor_id` varchar(255) DEFAULT NULL,
  `collection_id` varchar(255) DEFAULT NULL,
  `batch_id` varchar(255) DEFAULT NULL,
  `success_count` int(11) DEFAULT NULL,
  `failure_count` int(11) DEFAULT NULL,
  `deduplication_field` varchar(255) DEFAULT NULL,
  `update_actor_stack` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_zizia_csv_import_details_on_csv_import_id` (`csv_import_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zizia_csv_import_details`
--

LOCK TABLES `zizia_csv_import_details` WRITE;
/*!40000 ALTER TABLE `zizia_csv_import_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `zizia_csv_import_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zizia_csv_imports`
--

DROP TABLE IF EXISTS `zizia_csv_imports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zizia_csv_imports` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `manifest` varchar(255) DEFAULT NULL,
  `fedora_collection_id` varchar(255) DEFAULT NULL,
  `update_actor_stack` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_zizia_csv_imports_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_0b7719917e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zizia_csv_imports`
--

LOCK TABLES `zizia_csv_imports` WRITE;
/*!40000 ALTER TABLE `zizia_csv_imports` DISABLE KEYS */;
/*!40000 ALTER TABLE `zizia_csv_imports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zizia_pre_ingest_files`
--

DROP TABLE IF EXISTS `zizia_pre_ingest_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zizia_pre_ingest_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `size` int(11) DEFAULT NULL,
  `row` text,
  `row_number` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `pre_ingest_work_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(255) DEFAULT 'preingest',
  PRIMARY KEY (`id`),
  KEY `index_zizia_pre_ingest_files_on_pre_ingest_work_id` (`pre_ingest_work_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zizia_pre_ingest_files`
--

LOCK TABLES `zizia_pre_ingest_files` WRITE;
/*!40000 ALTER TABLE `zizia_pre_ingest_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `zizia_pre_ingest_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zizia_pre_ingest_works`
--

DROP TABLE IF EXISTS `zizia_pre_ingest_works`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zizia_pre_ingest_works` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_object` int(11) DEFAULT NULL,
  `csv_import_detail_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `deduplication_key` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'preingest',
  PRIMARY KEY (`id`),
  KEY `index_zizia_pre_ingest_works_on_csv_import_detail_id` (`csv_import_detail_id`),
  KEY `index_zizia_pre_ingest_works_on_deduplication_key` (`deduplication_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zizia_pre_ingest_works`
--

LOCK TABLES `zizia_pre_ingest_works` WRITE;
/*!40000 ALTER TABLE `zizia_pre_ingest_works` DISABLE KEYS */;
/*!40000 ALTER TABLE `zizia_pre_ingest_works` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-04-22 19:53:09
