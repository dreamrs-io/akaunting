CREATE DATABASE  IF NOT EXISTS `akaunting` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `akaunting`;
-- MySQL dump 10.13  Distrib 8.0.28, for macos11 (x86_64)
--
-- Host: efortlesdb.cywgz5nwjcfq.us-east-1.rds.amazonaws.com    Database: akaunting
-- ------------------------------------------------------
-- Server version	8.0.28

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `qm0_accounts`
--

DROP TABLE IF EXISTS `qm0_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_accounts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'bank',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opening_balance` double(15,4) NOT NULL DEFAULT '0.0000',
  `bank_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bank_address` text COLLATE utf8mb4_unicode_ci,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_accounts_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_accounts`
--

LOCK TABLES `qm0_accounts` WRITE;
/*!40000 ALTER TABLE `qm0_accounts` DISABLE KEYS */;
INSERT INTO `qm0_accounts` VALUES (1,1,'bank','Cash','1','USD',0.0000,'Cash',NULL,NULL,1,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL);
/*!40000 ALTER TABLE `qm0_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_categories`
--

DROP TABLE IF EXISTS `qm0_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `parent_id` int unsigned DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_categories_company_id_index` (`company_id`),
  KEY `qm0_categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `qm0_categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `qm0_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_categories`
--

LOCK TABLES `qm0_categories` WRITE;
/*!40000 ALTER TABLE `qm0_categories` DISABLE KEYS */;
INSERT INTO `qm0_categories` VALUES (1,1,'Transfer','other','#3c3f72',1,NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(2,1,'Deposit','income','#efad32',1,NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(3,1,'Sales','income','#6da252',1,NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(4,1,'Other','expense','#e5e5e5',1,NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(5,1,'General','item','#328aef',1,NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL);
/*!40000 ALTER TABLE `qm0_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_companies`
--

DROP TABLE IF EXISTS `qm0_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_companies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `domain` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_companies`
--

LOCK TABLES `qm0_companies` WRITE;
/*!40000 ALTER TABLE `qm0_companies` DISABLE KEYS */;
INSERT INTO `qm0_companies` VALUES (1,'',1,'core::console',NULL,'2023-09-01 05:42:36','2023-09-01 05:42:36',NULL);
/*!40000 ALTER TABLE `qm0_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_contacts`
--

DROP TABLE IF EXISTS `qm0_contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_contacts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_contacts_company_id_type_email_deleted_at_unique` (`company_id`,`type`,`email`,`deleted_at`),
  KEY `qm0_contacts_company_id_type_index` (`company_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_contacts`
--

LOCK TABLES `qm0_contacts` WRITE;
/*!40000 ALTER TABLE `qm0_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_currencies`
--

DROP TABLE IF EXISTS `qm0_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_currencies` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,8) NOT NULL,
  `precision` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `symbol_first` int NOT NULL DEFAULT '1',
  `decimal_mark` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `thousands_separator` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint NOT NULL DEFAULT '1',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_currencies_company_id_code_deleted_at_unique` (`company_id`,`code`,`deleted_at`),
  KEY `qm0_currencies_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_currencies`
--

LOCK TABLES `qm0_currencies` WRITE;
/*!40000 ALTER TABLE `qm0_currencies` DISABLE KEYS */;
INSERT INTO `qm0_currencies` VALUES (1,1,'US Dollar','USD',1.00000000,'2','$',1,'.',',',1,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL);
/*!40000 ALTER TABLE `qm0_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_dashboards`
--

DROP TABLE IF EXISTS `qm0_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_dashboards` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_dashboards_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_dashboards`
--

LOCK TABLES `qm0_dashboards` WRITE;
/*!40000 ALTER TABLE `qm0_dashboards` DISABLE KEYS */;
INSERT INTO `qm0_dashboards` VALUES (1,1,'Dashboard',1,'core::seed',NULL,'2023-09-01 06:42:37','2023-09-01 06:42:37',NULL);
/*!40000 ALTER TABLE `qm0_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_document_histories`
--

DROP TABLE IF EXISTS `qm0_document_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_document_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_document_histories_company_id_index` (`company_id`),
  KEY `qm0_document_histories_type_index` (`type`),
  KEY `qm0_document_histories_document_id_index` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_document_histories`
--

LOCK TABLES `qm0_document_histories` WRITE;
/*!40000 ALTER TABLE `qm0_document_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_document_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_document_item_taxes`
--

DROP TABLE IF EXISTS `qm0_document_item_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_document_item_taxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int unsigned NOT NULL,
  `document_item_id` int unsigned NOT NULL,
  `tax_id` int unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL DEFAULT '0.0000',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_document_item_taxes_company_id_index` (`company_id`),
  KEY `qm0_document_item_taxes_type_index` (`type`),
  KEY `qm0_document_item_taxes_document_id_index` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_document_item_taxes`
--

LOCK TABLES `qm0_document_item_taxes` WRITE;
/*!40000 ALTER TABLE `qm0_document_item_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_document_item_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_document_items`
--

DROP TABLE IF EXISTS `qm0_document_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_document_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int unsigned NOT NULL,
  `item_id` int unsigned DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` double(7,2) NOT NULL,
  `price` double(15,4) NOT NULL,
  `tax` double(15,4) NOT NULL DEFAULT '0.0000',
  `discount_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `discount_rate` double(15,4) NOT NULL DEFAULT '0.0000',
  `total` double(15,4) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_document_items_company_id_index` (`company_id`),
  KEY `qm0_document_items_type_index` (`type`),
  KEY `qm0_document_items_document_id_index` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_document_items`
--

LOCK TABLES `qm0_document_items` WRITE;
/*!40000 ALTER TABLE `qm0_document_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_document_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_document_totals`
--

DROP TABLE IF EXISTS `qm0_document_totals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_document_totals` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_id` int unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` double(15,4) NOT NULL,
  `sort_order` int NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_document_totals_company_id_index` (`company_id`),
  KEY `qm0_document_totals_type_index` (`type`),
  KEY `qm0_document_totals_document_id_index` (`document_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_document_totals`
--

LOCK TABLES `qm0_document_totals` WRITE;
/*!40000 ALTER TABLE `qm0_document_totals` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_document_totals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_documents`
--

DROP TABLE IF EXISTS `qm0_documents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_documents` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int unsigned NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `document_number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issued_at` datetime NOT NULL,
  `due_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `category_id` int unsigned NOT NULL DEFAULT '1',
  `contact_id` int unsigned NOT NULL,
  `contact_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_tax_number` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_address` text COLLATE utf8mb4_unicode_ci,
  `contact_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_zip_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subheading` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `footer` text COLLATE utf8mb4_unicode_ci,
  `parent_id` int unsigned NOT NULL DEFAULT '0',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_documents_document_number_deleted_at_company_id_type_unique` (`document_number`,`deleted_at`,`company_id`,`type`),
  KEY `qm0_documents_company_id_index` (`company_id`),
  KEY `qm0_documents_type_index` (`type`),
  KEY `qm0_documents_contact_id_index` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_documents`
--

LOCK TABLES `qm0_documents` WRITE;
/*!40000 ALTER TABLE `qm0_documents` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_documents` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_email_templates`
--

DROP TABLE IF EXISTS `qm0_email_templates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_email_templates` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_email_templates_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  KEY `qm0_email_templates_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_email_templates`
--

LOCK TABLES `qm0_email_templates` WRITE;
/*!40000 ALTER TABLE `qm0_email_templates` DISABLE KEYS */;
INSERT INTO `qm0_email_templates` VALUES (1,1,'invoice_new_customer','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_new_customer','{invoice_number} invoice created','Dear {customer_name},<br /><br />We have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(2,1,'invoice_remind_customer','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_remind_customer','{invoice_number} invoice overdue notice','Dear {customer_name},<br /><br />This is an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(3,1,'invoice_remind_admin','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_remind_admin','{invoice_number} invoice overdue notice','Hello,<br /><br />{customer_name} has received an overdue notice for <strong>{invoice_number}</strong> invoice.<br /><br />The invoice total is {invoice_total} and was due <strong>{invoice_due_date}</strong>.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(4,1,'invoice_recur_customer','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_recur_customer','{invoice_number} recurring invoice created','Dear {customer_name},<br /><br />Based on your recurring circle, we have prepared the following invoice for you: <strong>{invoice_number}</strong>.<br /><br />You can see the invoice details and proceed with the payment from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(5,1,'invoice_recur_admin','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_recur_admin','{invoice_number} recurring invoice created','Hello,<br /><br />Based on {customer_name} recurring circle, <strong>{invoice_number}</strong> invoice has been automatically created.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(6,1,'invoice_view_admin','App\\Notifications\\Sale\\Invoice','settings.email.templates.invoice_view_admin','{invoice_number} invoice viewed','Hello,<br /><br />{customer_name} has viewed the <strong>{invoice_number}</strong> invoice.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(7,1,'invoice_payment_customer','App\\Notifications\\Portal\\PaymentReceived','settings.email.templates.invoice_payment_customer','Your receipt for {invoice_number} invoice','Dear {customer_name},<br /><br />Thank you for the payment. Find the payment details below:<br /><br />-------------------------------------------------<br />Amount: <strong>{transaction_total}</strong><br />Date: <strong>{transaction_paid_date}</strong><br />Invoice Number: <strong>{invoice_number}</strong><br />-------------------------------------------------<br /><br />You can always see the invoice details from the following link: <a href=\"{invoice_guest_link}\">{invoice_number}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(8,1,'invoice_payment_admin','App\\Notifications\\Portal\\PaymentReceived','settings.email.templates.invoice_payment_admin','Payment received for {invoice_number} invoice','Hello,<br /><br />{customer_name} recorded a payment for <strong>{invoice_number}</strong> invoice.<br /><br />You can see the invoice details from the following link: <a href=\"{invoice_admin_link}\">{invoice_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(9,1,'bill_remind_admin','App\\Notifications\\Purchase\\Bill','settings.email.templates.bill_remind_admin','{bill_number} bill reminding notice','Hello,<br /><br />This is a reminding notice for <strong>{bill_number}</strong> bill to {vendor_name}.<br /><br />The bill total is {bill_total} and is due <strong>{bill_due_date}</strong>.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(10,1,'bill_recur_admin','App\\Notifications\\Purchase\\Bill','settings.email.templates.bill_recur_admin','{bill_number} recurring bill created','Hello,<br /><br />Based on {vendor_name} recurring circle, <strong>{bill_number}</strong> bill has been automatically created.<br /><br />You can see the bill details from the following link: <a href=\"{bill_admin_link}\">{bill_number}</a>.<br /><br />Best regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(11,1,'payment_received_customer','App\\Notifications\\Banking\\Transaction','settings.email.templates.payment_received_customer','Your receipt from {company_name}','Dear {contact_name},<br /><br />Thank you for the payment. <br /><br />You can see the payment details from the following link: <a href=\"{payment_guest_link}\">{payment_date}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(12,1,'payment_made_vendor','App\\Notifications\\Banking\\Transaction','settings.email.templates.payment_made_vendor','Payment made by {company_name}','Dear {contact_name},<br /><br />We have made the following payment. <br /><br />You can see the payment details from the following link: <a href=\"{payment_guest_link}\">{payment_date}</a>.<br /><br />Feel free to contact us with any questions.<br /><br />Best Regards,<br />{company_name}',NULL,'core::seed',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL);
/*!40000 ALTER TABLE `qm0_email_templates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_failed_jobs`
--

DROP TABLE IF EXISTS `qm0_failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_failed_jobs`
--

LOCK TABLES `qm0_failed_jobs` WRITE;
/*!40000 ALTER TABLE `qm0_failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_firewall_ips`
--

DROP TABLE IF EXISTS `qm0_firewall_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_firewall_ips` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_id` int DEFAULT NULL,
  `blocked` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_firewall_ips_ip_deleted_at_unique` (`ip`,`deleted_at`),
  KEY `qm0_firewall_ips_ip_index` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_firewall_ips`
--

LOCK TABLES `qm0_firewall_ips` WRITE;
/*!40000 ALTER TABLE `qm0_firewall_ips` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_firewall_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_firewall_logs`
--

DROP TABLE IF EXISTS `qm0_firewall_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_firewall_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'medium',
  `middleware` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referrer` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `request` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_firewall_logs_ip_index` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_firewall_logs`
--

LOCK TABLES `qm0_firewall_logs` WRITE;
/*!40000 ALTER TABLE `qm0_firewall_logs` DISABLE KEYS */;
INSERT INTO `qm0_firewall_logs` VALUES (1,'167.248.133.38','medium','agent',0,'https://44.195.9.194','NULL','','2023-09-09 09:28:15','2023-09-09 09:28:15',NULL),(2,'162.142.125.214','medium','agent',0,'https://44.195.9.194','NULL','','2023-09-09 10:20:18','2023-09-09 10:20:18',NULL),(3,'167.94.145.58','medium','agent',0,'https://44.195.9.194','NULL','','2023-09-09 14:56:58','2023-09-09 14:56:58',NULL),(4,'167.94.138.127','medium','agent',0,'https://44.195.9.194','NULL','','2023-09-09 18:49:54','2023-09-09 18:49:54',NULL),(5,'205.210.31.186','medium','agent',0,'https://_bimi.aazadi.co','NULL','','2023-09-09 21:24:15','2023-09-09 21:24:15',NULL);
/*!40000 ALTER TABLE `qm0_firewall_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_item_taxes`
--

DROP TABLE IF EXISTS `qm0_item_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_item_taxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `item_id` int NOT NULL,
  `tax_id` int DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_item_taxes_company_id_item_id_index` (`company_id`,`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_item_taxes`
--

LOCK TABLES `qm0_item_taxes` WRITE;
/*!40000 ALTER TABLE `qm0_item_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_item_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_items`
--

DROP TABLE IF EXISTS `qm0_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_items` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'product',
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sku` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `sale_price` double DEFAULT NULL,
  `purchase_price` double DEFAULT NULL,
  `category_id` int DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_items_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_items`
--

LOCK TABLES `qm0_items` WRITE;
/*!40000 ALTER TABLE `qm0_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_jobs`
--

DROP TABLE IF EXISTS `qm0_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_jobs_queue_reserved_at_index` (`queue`,`reserved_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_jobs`
--

LOCK TABLES `qm0_jobs` WRITE;
/*!40000 ALTER TABLE `qm0_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_media`
--

DROP TABLE IF EXISTS `qm0_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_media` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int unsigned NOT NULL DEFAULT '0',
  `disk` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `directory` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime_type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `aggregate_type` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int unsigned NOT NULL,
  `variant_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `original_media_id` int unsigned DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_media_disk_directory_filename_extension_unique` (`disk`,`directory`,`filename`,`extension`),
  UNIQUE KEY `qm0_media_disk_directory_filename_extension_deleted_at_unique` (`disk`,`directory`,`filename`,`extension`,`deleted_at`),
  KEY `qm0_media_aggregate_type_index` (`aggregate_type`),
  KEY `qm0_media_disk_directory_index` (`disk`,`directory`),
  KEY `qm0_media_company_id_index` (`company_id`),
  KEY `original_media_id` (`original_media_id`),
  CONSTRAINT `original_media_id` FOREIGN KEY (`original_media_id`) REFERENCES `qm0_media` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_media`
--

LOCK TABLES `qm0_media` WRITE;
/*!40000 ALTER TABLE `qm0_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_mediables`
--

DROP TABLE IF EXISTS `qm0_mediables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_mediables` (
  `media_id` int unsigned NOT NULL,
  `company_id` int unsigned NOT NULL DEFAULT '0',
  `mediable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mediable_id` int unsigned NOT NULL,
  `tag` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int unsigned NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  PRIMARY KEY (`media_id`,`mediable_type`,`mediable_id`,`tag`),
  KEY `qm0_mediables_mediable_id_mediable_type_index` (`mediable_id`,`mediable_type`),
  KEY `qm0_mediables_tag_index` (`tag`),
  KEY `qm0_mediables_order_index` (`order`),
  KEY `qm0_mediables_company_id_index` (`company_id`),
  CONSTRAINT `qm0_mediables_media_id_foreign` FOREIGN KEY (`media_id`) REFERENCES `qm0_media` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_mediables`
--

LOCK TABLES `qm0_mediables` WRITE;
/*!40000 ALTER TABLE `qm0_mediables` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_mediables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_migrations`
--

DROP TABLE IF EXISTS `qm0_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_migrations`
--

LOCK TABLES `qm0_migrations` WRITE;
/*!40000 ALTER TABLE `qm0_migrations` DISABLE KEYS */;
INSERT INTO `qm0_migrations` VALUES (1,'2016_06_27_000000_create_mediable_tables',1),(2,'2017_09_14_000000_core_v1',1),(3,'2019_11_16_000000_core_v2',1),(4,'2020_10_12_000000_add_variants_to_media',1),(5,'2022_05_10_000000_core_v300',1),(6,'2022_06_28_000000_core_v304',1),(7,'2022_07_21_000000_core_v305',1),(8,'2022_08_29_000000_core_v3015',1),(9,'2022_08_29_000000_core_v307',1),(10,'2023_06_22_000000_core_v3016',1),(11,'2023_08_14_000000_core_v3017',1);
/*!40000 ALTER TABLE `qm0_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_module_histories`
--

DROP TABLE IF EXISTS `qm0_module_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_module_histories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `module_id` int NOT NULL,
  `version` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_module_histories_company_id_module_id_index` (`company_id`,`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_module_histories`
--

LOCK TABLES `qm0_module_histories` WRITE;
/*!40000 ALTER TABLE `qm0_module_histories` DISABLE KEYS */;
INSERT INTO `qm0_module_histories` VALUES (1,1,1,'3.0.2','offline-payments installed','::console',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(2,1,2,'3.0.1','paypal-standard installed','::console',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL);
/*!40000 ALTER TABLE `qm0_module_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_modules`
--

DROP TABLE IF EXISTS `qm0_modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_modules` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `alias` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_modules_company_id_alias_deleted_at_unique` (`company_id`,`alias`,`deleted_at`),
  KEY `qm0_modules_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_modules`
--

LOCK TABLES `qm0_modules` WRITE;
/*!40000 ALTER TABLE `qm0_modules` DISABLE KEYS */;
INSERT INTO `qm0_modules` VALUES (1,1,'offline-payments',1,'::console',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL),(2,1,'paypal-standard',1,'::console',NULL,'2023-09-01 06:42:36','2023-09-01 06:42:36',NULL);
/*!40000 ALTER TABLE `qm0_modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_notifications`
--

DROP TABLE IF EXISTS `qm0_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_notifications`
--

LOCK TABLES `qm0_notifications` WRITE;
/*!40000 ALTER TABLE `qm0_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_password_resets`
--

DROP TABLE IF EXISTS `qm0_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `qm0_password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_password_resets`
--

LOCK TABLES `qm0_password_resets` WRITE;
/*!40000 ALTER TABLE `qm0_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_permissions`
--

DROP TABLE IF EXISTS `qm0_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_permissions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_permissions_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_permissions`
--

LOCK TABLES `qm0_permissions` WRITE;
/*!40000 ALTER TABLE `qm0_permissions` DISABLE KEYS */;
INSERT INTO `qm0_permissions` VALUES (1,'read-admin-panel','Read Admin Panel','Read Admin Panel','2023-09-01 05:42:29','2023-09-01 05:42:29'),(2,'read-api','Read Api','Read Api','2023-09-01 05:42:29','2023-09-01 05:42:29'),(3,'read-auth-profile','Read Auth Profile','Read Auth Profile','2023-09-01 05:42:29','2023-09-01 05:42:29'),(4,'update-auth-profile','Update Auth Profile','Update Auth Profile','2023-09-01 05:42:29','2023-09-01 05:42:29'),(5,'create-auth-users','Create Auth Users','Create Auth Users','2023-09-01 05:42:29','2023-09-01 05:42:29'),(6,'read-auth-users','Read Auth Users','Read Auth Users','2023-09-01 05:42:29','2023-09-01 05:42:29'),(7,'update-auth-users','Update Auth Users','Update Auth Users','2023-09-01 05:42:29','2023-09-01 05:42:29'),(8,'delete-auth-users','Delete Auth Users','Delete Auth Users','2023-09-01 05:42:29','2023-09-01 05:42:29'),(9,'create-banking-accounts','Create Banking Accounts','Create Banking Accounts','2023-09-01 05:42:29','2023-09-01 05:42:29'),(10,'read-banking-accounts','Read Banking Accounts','Read Banking Accounts','2023-09-01 05:42:29','2023-09-01 05:42:29'),(11,'update-banking-accounts','Update Banking Accounts','Update Banking Accounts','2023-09-01 05:42:29','2023-09-01 05:42:29'),(12,'delete-banking-accounts','Delete Banking Accounts','Delete Banking Accounts','2023-09-01 05:42:29','2023-09-01 05:42:29'),(13,'create-banking-reconciliations','Create Banking Reconciliations','Create Banking Reconciliations','2023-09-01 05:42:29','2023-09-01 05:42:29'),(14,'read-banking-reconciliations','Read Banking Reconciliations','Read Banking Reconciliations','2023-09-01 05:42:29','2023-09-01 05:42:29'),(15,'update-banking-reconciliations','Update Banking Reconciliations','Update Banking Reconciliations','2023-09-01 05:42:29','2023-09-01 05:42:29'),(16,'delete-banking-reconciliations','Delete Banking Reconciliations','Delete Banking Reconciliations','2023-09-01 05:42:29','2023-09-01 05:42:29'),(17,'create-banking-transactions','Create Banking Transactions','Create Banking Transactions','2023-09-01 05:42:29','2023-09-01 05:42:29'),(18,'read-banking-transactions','Read Banking Transactions','Read Banking Transactions','2023-09-01 05:42:29','2023-09-01 05:42:29'),(19,'update-banking-transactions','Update Banking Transactions','Update Banking Transactions','2023-09-01 05:42:29','2023-09-01 05:42:29'),(20,'delete-banking-transactions','Delete Banking Transactions','Delete Banking Transactions','2023-09-01 05:42:29','2023-09-01 05:42:29'),(21,'create-banking-transfers','Create Banking Transfers','Create Banking Transfers','2023-09-01 05:42:29','2023-09-01 05:42:29'),(22,'read-banking-transfers','Read Banking Transfers','Read Banking Transfers','2023-09-01 05:42:29','2023-09-01 05:42:29'),(23,'update-banking-transfers','Update Banking Transfers','Update Banking Transfers','2023-09-01 05:42:29','2023-09-01 05:42:29'),(24,'delete-banking-transfers','Delete Banking Transfers','Delete Banking Transfers','2023-09-01 05:42:29','2023-09-01 05:42:29'),(25,'create-common-companies','Create Common Companies','Create Common Companies','2023-09-01 05:42:29','2023-09-01 05:42:29'),(26,'read-common-companies','Read Common Companies','Read Common Companies','2023-09-01 05:42:30','2023-09-01 05:42:30'),(27,'update-common-companies','Update Common Companies','Update Common Companies','2023-09-01 05:42:30','2023-09-01 05:42:30'),(28,'delete-common-companies','Delete Common Companies','Delete Common Companies','2023-09-01 05:42:30','2023-09-01 05:42:30'),(29,'create-common-dashboards','Create Common Dashboards','Create Common Dashboards','2023-09-01 05:42:30','2023-09-01 05:42:30'),(30,'read-common-dashboards','Read Common Dashboards','Read Common Dashboards','2023-09-01 05:42:30','2023-09-01 05:42:30'),(31,'update-common-dashboards','Update Common Dashboards','Update Common Dashboards','2023-09-01 05:42:30','2023-09-01 05:42:30'),(32,'delete-common-dashboards','Delete Common Dashboards','Delete Common Dashboards','2023-09-01 05:42:30','2023-09-01 05:42:30'),(33,'create-common-import','Create Common Import','Create Common Import','2023-09-01 05:42:30','2023-09-01 05:42:30'),(34,'create-common-items','Create Common Items','Create Common Items','2023-09-01 05:42:30','2023-09-01 05:42:30'),(35,'read-common-items','Read Common Items','Read Common Items','2023-09-01 05:42:30','2023-09-01 05:42:30'),(36,'update-common-items','Update Common Items','Update Common Items','2023-09-01 05:42:30','2023-09-01 05:42:30'),(37,'delete-common-items','Delete Common Items','Delete Common Items','2023-09-01 05:42:30','2023-09-01 05:42:30'),(38,'create-common-reports','Create Common Reports','Create Common Reports','2023-09-01 05:42:30','2023-09-01 05:42:30'),(39,'read-common-reports','Read Common Reports','Read Common Reports','2023-09-01 05:42:30','2023-09-01 05:42:30'),(40,'update-common-reports','Update Common Reports','Update Common Reports','2023-09-01 05:42:30','2023-09-01 05:42:30'),(41,'delete-common-reports','Delete Common Reports','Delete Common Reports','2023-09-01 05:42:30','2023-09-01 05:42:30'),(42,'read-common-search','Read Common Search','Read Common Search','2023-09-01 05:42:30','2023-09-01 05:42:30'),(43,'read-common-uploads','Read Common Uploads','Read Common Uploads','2023-09-01 05:42:30','2023-09-01 05:42:30'),(44,'delete-common-uploads','Delete Common Uploads','Delete Common Uploads','2023-09-01 05:42:30','2023-09-01 05:42:30'),(45,'create-common-widgets','Create Common Widgets','Create Common Widgets','2023-09-01 05:42:30','2023-09-01 05:42:30'),(46,'read-common-widgets','Read Common Widgets','Read Common Widgets','2023-09-01 05:42:30','2023-09-01 05:42:30'),(47,'update-common-widgets','Update Common Widgets','Update Common Widgets','2023-09-01 05:42:30','2023-09-01 05:42:30'),(48,'delete-common-widgets','Delete Common Widgets','Delete Common Widgets','2023-09-01 05:42:30','2023-09-01 05:42:30'),(49,'create-purchases-bills','Create Purchases Bills','Create Purchases Bills','2023-09-01 05:42:30','2023-09-01 05:42:30'),(50,'read-purchases-bills','Read Purchases Bills','Read Purchases Bills','2023-09-01 05:42:30','2023-09-01 05:42:30'),(51,'update-purchases-bills','Update Purchases Bills','Update Purchases Bills','2023-09-01 05:42:30','2023-09-01 05:42:30'),(52,'delete-purchases-bills','Delete Purchases Bills','Delete Purchases Bills','2023-09-01 05:42:30','2023-09-01 05:42:30'),(53,'create-purchases-vendors','Create Purchases Vendors','Create Purchases Vendors','2023-09-01 05:42:30','2023-09-01 05:42:30'),(54,'read-purchases-vendors','Read Purchases Vendors','Read Purchases Vendors','2023-09-01 05:42:30','2023-09-01 05:42:30'),(55,'update-purchases-vendors','Update Purchases Vendors','Update Purchases Vendors','2023-09-01 05:42:30','2023-09-01 05:42:30'),(56,'delete-purchases-vendors','Delete Purchases Vendors','Delete Purchases Vendors','2023-09-01 05:42:30','2023-09-01 05:42:30'),(57,'create-sales-customers','Create Sales Customers','Create Sales Customers','2023-09-01 05:42:30','2023-09-01 05:42:30'),(58,'read-sales-customers','Read Sales Customers','Read Sales Customers','2023-09-01 05:42:31','2023-09-01 05:42:31'),(59,'update-sales-customers','Update Sales Customers','Update Sales Customers','2023-09-01 05:42:31','2023-09-01 05:42:31'),(60,'delete-sales-customers','Delete Sales Customers','Delete Sales Customers','2023-09-01 05:42:31','2023-09-01 05:42:31'),(61,'create-sales-invoices','Create Sales Invoices','Create Sales Invoices','2023-09-01 05:42:31','2023-09-01 05:42:31'),(62,'read-sales-invoices','Read Sales Invoices','Read Sales Invoices','2023-09-01 05:42:31','2023-09-01 05:42:31'),(63,'update-sales-invoices','Update Sales Invoices','Update Sales Invoices','2023-09-01 05:42:31','2023-09-01 05:42:31'),(64,'delete-sales-invoices','Delete Sales Invoices','Delete Sales Invoices','2023-09-01 05:42:31','2023-09-01 05:42:31'),(65,'read-install-updates','Read Install Updates','Read Install Updates','2023-09-01 05:42:31','2023-09-01 05:42:31'),(66,'update-install-updates','Update Install Updates','Update Install Updates','2023-09-01 05:42:31','2023-09-01 05:42:31'),(67,'create-modules-api-key','Create Modules Api Key','Create Modules Api Key','2023-09-01 05:42:31','2023-09-01 05:42:31'),(68,'update-modules-api-key','Update Modules Api Key','Update Modules Api Key','2023-09-01 05:42:31','2023-09-01 05:42:31'),(69,'read-modules-home','Read Modules Home','Read Modules Home','2023-09-01 05:42:31','2023-09-01 05:42:31'),(70,'create-modules-item','Create Modules Item','Create Modules Item','2023-09-01 05:42:31','2023-09-01 05:42:31'),(71,'read-modules-item','Read Modules Item','Read Modules Item','2023-09-01 05:42:31','2023-09-01 05:42:31'),(72,'update-modules-item','Update Modules Item','Update Modules Item','2023-09-01 05:42:31','2023-09-01 05:42:31'),(73,'delete-modules-item','Delete Modules Item','Delete Modules Item','2023-09-01 05:42:31','2023-09-01 05:42:31'),(74,'read-modules-my','Read Modules My','Read Modules My','2023-09-01 05:42:31','2023-09-01 05:42:31'),(75,'read-modules-tiles','Read Modules Tiles','Read Modules Tiles','2023-09-01 05:42:31','2023-09-01 05:42:31'),(76,'read-notifications','Read Notifications','Read Notifications','2023-09-01 05:42:31','2023-09-01 05:42:31'),(77,'update-notifications','Update Notifications','Update Notifications','2023-09-01 05:42:31','2023-09-01 05:42:31'),(78,'read-reports-expense-summary','Read Reports Expense Summary','Read Reports Expense Summary','2023-09-01 05:42:31','2023-09-01 05:42:31'),(79,'read-reports-income-summary','Read Reports Income Summary','Read Reports Income Summary','2023-09-01 05:42:31','2023-09-01 05:42:31'),(80,'read-reports-income-expense-summary','Read Reports Income Expense Summary','Read Reports Income Expense Summary','2023-09-01 05:42:31','2023-09-01 05:42:31'),(81,'read-reports-profit-loss','Read Reports Profit Loss','Read Reports Profit Loss','2023-09-01 05:42:31','2023-09-01 05:42:31'),(82,'read-reports-tax-summary','Read Reports Tax Summary','Read Reports Tax Summary','2023-09-01 05:42:31','2023-09-01 05:42:31'),(83,'create-settings-categories','Create Settings Categories','Create Settings Categories','2023-09-01 05:42:31','2023-09-01 05:42:31'),(84,'read-settings-categories','Read Settings Categories','Read Settings Categories','2023-09-01 05:42:31','2023-09-01 05:42:31'),(85,'update-settings-categories','Update Settings Categories','Update Settings Categories','2023-09-01 05:42:31','2023-09-01 05:42:31'),(86,'delete-settings-categories','Delete Settings Categories','Delete Settings Categories','2023-09-01 05:42:32','2023-09-01 05:42:32'),(87,'read-settings-company','Read Settings Company','Read Settings Company','2023-09-01 05:42:32','2023-09-01 05:42:32'),(88,'update-settings-company','Update Settings Company','Update Settings Company','2023-09-01 05:42:32','2023-09-01 05:42:32'),(89,'create-settings-currencies','Create Settings Currencies','Create Settings Currencies','2023-09-01 05:42:32','2023-09-01 05:42:32'),(90,'read-settings-currencies','Read Settings Currencies','Read Settings Currencies','2023-09-01 05:42:32','2023-09-01 05:42:32'),(91,'update-settings-currencies','Update Settings Currencies','Update Settings Currencies','2023-09-01 05:42:32','2023-09-01 05:42:32'),(92,'delete-settings-currencies','Delete Settings Currencies','Delete Settings Currencies','2023-09-01 05:42:32','2023-09-01 05:42:32'),(93,'read-settings-defaults','Read Settings Defaults','Read Settings Defaults','2023-09-01 05:42:32','2023-09-01 05:42:32'),(94,'update-settings-defaults','Update Settings Defaults','Update Settings Defaults','2023-09-01 05:42:32','2023-09-01 05:42:32'),(95,'read-settings-email','Read Settings Email','Read Settings Email','2023-09-01 05:42:32','2023-09-01 05:42:32'),(96,'update-settings-email','Update Settings Email','Update Settings Email','2023-09-01 05:42:32','2023-09-01 05:42:32'),(97,'read-settings-email-templates','Read Settings Email Templates','Read Settings Email Templates','2023-09-01 05:42:32','2023-09-01 05:42:32'),(98,'update-settings-email-templates','Update Settings Email Templates','Update Settings Email Templates','2023-09-01 05:42:32','2023-09-01 05:42:32'),(99,'read-settings-invoice','Read Settings Invoice','Read Settings Invoice','2023-09-01 05:42:32','2023-09-01 05:42:32'),(100,'update-settings-invoice','Update Settings Invoice','Update Settings Invoice','2023-09-01 05:42:32','2023-09-01 05:42:32'),(101,'read-settings-localisation','Read Settings Localisation','Read Settings Localisation','2023-09-01 05:42:32','2023-09-01 05:42:32'),(102,'update-settings-localisation','Update Settings Localisation','Update Settings Localisation','2023-09-01 05:42:32','2023-09-01 05:42:32'),(103,'read-settings-modules','Read Settings Modules','Read Settings Modules','2023-09-01 05:42:32','2023-09-01 05:42:32'),(104,'update-settings-modules','Update Settings Modules','Update Settings Modules','2023-09-01 05:42:32','2023-09-01 05:42:32'),(105,'read-settings-schedule','Read Settings Schedule','Read Settings Schedule','2023-09-01 05:42:32','2023-09-01 05:42:32'),(106,'update-settings-schedule','Update Settings Schedule','Update Settings Schedule','2023-09-01 05:42:32','2023-09-01 05:42:32'),(107,'create-settings-taxes','Create Settings Taxes','Create Settings Taxes','2023-09-01 05:42:32','2023-09-01 05:42:32'),(108,'read-settings-taxes','Read Settings Taxes','Read Settings Taxes','2023-09-01 05:42:32','2023-09-01 05:42:32'),(109,'update-settings-taxes','Update Settings Taxes','Update Settings Taxes','2023-09-01 05:42:32','2023-09-01 05:42:32'),(110,'delete-settings-taxes','Delete Settings Taxes','Delete Settings Taxes','2023-09-01 05:42:32','2023-09-01 05:42:32'),(111,'read-widgets-account-balance','Read Widgets Account Balance','Read Widgets Account Balance','2023-09-01 05:42:32','2023-09-01 05:42:32'),(112,'read-widgets-bank-feeds','Read Widgets Bank Feeds','Read Widgets Bank Feeds','2023-09-01 05:42:33','2023-09-01 05:42:33'),(113,'read-widgets-cash-flow','Read Widgets Cash Flow','Read Widgets Cash Flow','2023-09-01 05:42:33','2023-09-01 05:42:33'),(114,'read-widgets-currencies','Read Widgets Currencies','Read Widgets Currencies','2023-09-01 05:42:33','2023-09-01 05:42:33'),(115,'read-widgets-expenses-by-category','Read Widgets Expenses By Category','Read Widgets Expenses By Category','2023-09-01 05:42:33','2023-09-01 05:42:33'),(116,'read-widgets-payables','Read Widgets Payables','Read Widgets Payables','2023-09-01 05:42:33','2023-09-01 05:42:33'),(117,'read-widgets-profit-loss','Read Widgets Profit Loss','Read Widgets Profit Loss','2023-09-01 05:42:33','2023-09-01 05:42:33'),(118,'read-widgets-receivables','Read Widgets Receivables','Read Widgets Receivables','2023-09-01 05:42:33','2023-09-01 05:42:33'),(119,'read-client-portal','Read Client Portal','Read Client Portal','2023-09-01 05:42:35','2023-09-01 05:42:35'),(120,'read-portal-invoices','Read Portal Invoices','Read Portal Invoices','2023-09-01 05:42:35','2023-09-01 05:42:35'),(121,'update-portal-invoices','Update Portal Invoices','Update Portal Invoices','2023-09-01 05:42:35','2023-09-01 05:42:35'),(122,'read-portal-payments','Read Portal Payments','Read Portal Payments','2023-09-01 05:42:35','2023-09-01 05:42:35'),(123,'update-portal-payments','Update Portal Payments','Update Portal Payments','2023-09-01 05:42:35','2023-09-01 05:42:35'),(124,'read-portal-profile','Read Portal Profile','Read Portal Profile','2023-09-01 05:42:35','2023-09-01 05:42:35'),(125,'update-portal-profile','Update Portal Profile','Update Portal Profile','2023-09-01 05:42:35','2023-09-01 05:42:35'),(126,'read-offline-payments-settings','Read Offline Payments Settings','Read Offline Payments Settings','2023-09-01 06:42:36','2023-09-01 06:42:36'),(127,'update-offline-payments-settings','Update Offline Payments Settings','Update Offline Payments Settings','2023-09-01 06:42:36','2023-09-01 06:42:36'),(128,'delete-offline-payments-settings','Delete Offline Payments Settings','Delete Offline Payments Settings','2023-09-01 06:42:36','2023-09-01 06:42:36'),(129,'read-paypal-standard-settings','Read PayPal Standard Settings','Read PayPal Standard Settings','2023-09-01 06:42:36','2023-09-01 06:42:36'),(130,'update-paypal-standard-settings','Update PayPal Standard Settings','Update PayPal Standard Settings','2023-09-01 06:42:36','2023-09-01 06:42:36');
/*!40000 ALTER TABLE `qm0_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_personal_access_tokens`
--

DROP TABLE IF EXISTS `qm0_personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_personal_access_tokens_token_unique` (`token`),
  KEY `qm0_personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_personal_access_tokens`
--

LOCK TABLES `qm0_personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `qm0_personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_reconciliations`
--

DROP TABLE IF EXISTS `qm0_reconciliations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_reconciliations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `account_id` int NOT NULL,
  `started_at` datetime NOT NULL,
  `ended_at` datetime NOT NULL,
  `closing_balance` double(15,4) NOT NULL DEFAULT '0.0000',
  `transactions` text COLLATE utf8mb4_unicode_ci,
  `reconciled` tinyint(1) NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_reconciliations_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_reconciliations`
--

LOCK TABLES `qm0_reconciliations` WRITE;
/*!40000 ALTER TABLE `qm0_reconciliations` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_reconciliations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_recurring`
--

DROP TABLE IF EXISTS `qm0_recurring`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_recurring` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `recurable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `recurable_id` bigint unsigned NOT NULL,
  `frequency` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `interval` int NOT NULL DEFAULT '1',
  `started_at` datetime NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `limit_by` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'count',
  `limit_count` int NOT NULL DEFAULT '0',
  `limit_date` datetime DEFAULT NULL,
  `auto_send` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_recurring_recurable_type_recurable_id_index` (`recurable_type`,`recurable_id`),
  KEY `qm0_recurring_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_recurring`
--

LOCK TABLES `qm0_recurring` WRITE;
/*!40000 ALTER TABLE `qm0_recurring` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_recurring` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_reports`
--

DROP TABLE IF EXISTS `qm0_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_reports` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_by` int unsigned DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_reports_company_id_index` (`company_id`),
  KEY `qm0_reports_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_reports`
--

LOCK TABLES `qm0_reports` WRITE;
/*!40000 ALTER TABLE `qm0_reports` DISABLE KEYS */;
INSERT INTO `qm0_reports` VALUES (1,1,'App\\Reports\\IncomeSummary','Income Summary','Monthly income summary by category.','{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\"}',NULL,'core::seed','2023-09-01 06:42:37','2023-09-01 06:42:37',NULL),(2,1,'App\\Reports\\ExpenseSummary','Expense Summary','Monthly expense summary by category.','{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\"}',NULL,'core::seed','2023-09-01 06:42:37','2023-09-01 06:42:37',NULL),(3,1,'App\\Reports\\IncomeExpenseSummary','Income vs Expense','Monthly income vs expense by category.','{\"group\":\"category\",\"period\":\"monthly\",\"basis\":\"accrual\"}',NULL,'core::seed','2023-09-01 06:42:37','2023-09-01 06:42:37',NULL),(4,1,'App\\Reports\\ProfitLoss','Profit & Loss','Quarterly profit & loss by category.','{\"group\":\"category\",\"period\":\"quarterly\",\"basis\":\"accrual\"}',NULL,'core::seed','2023-09-01 06:42:37','2023-09-01 06:42:37',NULL),(5,1,'App\\Reports\\TaxSummary','Tax Summary','Quarterly tax summary.','{\"period\":\"quarterly\",\"basis\":\"accrual\"}',NULL,'core::seed','2023-09-01 06:42:37','2023-09-01 06:42:37',NULL);
/*!40000 ALTER TABLE `qm0_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_role_permissions`
--

DROP TABLE IF EXISTS `qm0_role_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_role_permissions` (
  `role_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  PRIMARY KEY (`role_id`,`permission_id`),
  KEY `qm0_role_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `qm0_role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `qm0_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `qm0_role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `qm0_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_role_permissions`
--

LOCK TABLES `qm0_role_permissions` WRITE;
/*!40000 ALTER TABLE `qm0_role_permissions` DISABLE KEYS */;
INSERT INTO `qm0_role_permissions` VALUES (1,1),(2,1),(4,1),(1,2),(4,2),(1,3),(2,3),(4,3),(1,4),(2,4),(4,4),(1,5),(1,6),(1,7),(1,8),(1,9),(2,9),(1,10),(2,10),(4,10),(1,11),(2,11),(1,12),(2,12),(1,13),(2,13),(1,14),(2,14),(4,14),(1,15),(2,15),(1,16),(2,16),(1,17),(2,17),(1,18),(2,18),(4,18),(1,19),(2,19),(1,20),(2,20),(1,21),(2,21),(1,22),(2,22),(4,22),(1,23),(2,23),(1,24),(2,24),(1,25),(2,25),(1,26),(2,26),(1,27),(2,27),(1,28),(2,28),(1,29),(2,29),(1,30),(2,30),(4,30),(1,31),(2,31),(1,32),(2,32),(1,33),(2,33),(1,34),(2,34),(1,35),(2,35),(4,35),(1,36),(2,36),(1,37),(2,37),(1,38),(2,38),(1,39),(2,39),(4,39),(1,40),(2,40),(1,41),(2,41),(1,42),(2,42),(1,43),(2,43),(1,44),(1,45),(2,45),(1,46),(2,46),(1,47),(2,47),(1,48),(2,48),(1,49),(2,49),(1,50),(2,50),(4,50),(1,51),(2,51),(1,52),(2,52),(1,53),(2,53),(1,54),(2,54),(4,54),(1,55),(2,55),(1,56),(2,56),(1,57),(2,57),(1,58),(2,58),(4,58),(1,59),(2,59),(1,60),(2,60),(1,61),(2,61),(1,62),(2,62),(4,62),(1,63),(2,63),(1,64),(2,64),(1,65),(2,65),(1,66),(2,66),(1,67),(1,68),(1,69),(4,69),(1,70),(1,71),(4,71),(1,72),(1,73),(1,74),(4,74),(1,75),(4,75),(1,76),(2,76),(1,77),(2,77),(1,78),(2,78),(4,78),(1,79),(2,79),(4,79),(1,80),(2,80),(4,80),(1,81),(2,81),(4,81),(1,82),(2,82),(4,82),(1,83),(2,83),(1,84),(2,84),(1,85),(2,85),(1,86),(2,86),(1,87),(2,87),(1,88),(2,88),(1,89),(2,89),(1,90),(2,90),(1,91),(2,91),(1,92),(2,92),(1,93),(2,93),(1,94),(2,94),(1,95),(2,95),(1,96),(2,96),(1,97),(2,97),(1,98),(2,98),(1,99),(2,99),(1,100),(2,100),(1,101),(2,101),(1,102),(2,102),(1,103),(2,103),(1,104),(2,104),(1,105),(2,105),(1,106),(2,106),(1,107),(2,107),(1,108),(2,108),(1,109),(2,109),(1,110),(2,110),(1,111),(2,111),(4,111),(1,112),(2,112),(4,112),(1,113),(2,113),(4,113),(1,114),(2,114),(4,114),(1,115),(2,115),(4,115),(1,116),(2,116),(4,116),(1,117),(2,117),(4,117),(1,118),(2,118),(4,118),(3,119),(3,120),(3,121),(3,122),(3,123),(3,124),(3,125),(1,126),(2,126),(1,127),(2,127),(1,128),(2,128),(1,129),(2,129),(1,130),(2,130);
/*!40000 ALTER TABLE `qm0_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_roles`
--

DROP TABLE IF EXISTS `qm0_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_roles_name_unique` (`name`),
  KEY `qm0_roles_name_index` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_roles`
--

LOCK TABLES `qm0_roles` WRITE;
/*!40000 ALTER TABLE `qm0_roles` DISABLE KEYS */;
INSERT INTO `qm0_roles` VALUES (1,'admin','Admin','They get full access to your Akaunting including customers, invoices, reports, settings, and apps.',NULL,NULL,'2023-09-01 05:42:29','2023-09-01 05:42:29'),(2,'manager','Manager','They get full access to your Akaunting, but can\'t manage users and apps.',NULL,NULL,'2023-09-01 05:42:33','2023-09-01 05:42:33'),(3,'customer','Customer','They can access the Client Portal and pay their invoices online through the payment methods you set up.',NULL,NULL,'2023-09-01 05:42:35','2023-09-01 05:42:35'),(4,'accountant','Accountant','They can access invoices, transactions, reports, and create journal entries.',NULL,NULL,'2023-09-01 05:42:35','2023-09-01 05:42:35');
/*!40000 ALTER TABLE `qm0_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_sessions`
--

DROP TABLE IF EXISTS `qm0_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  UNIQUE KEY `qm0_sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_sessions`
--

LOCK TABLES `qm0_sessions` WRITE;
/*!40000 ALTER TABLE `qm0_sessions` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_settings`
--

DROP TABLE IF EXISTS `qm0_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_settings_company_id_key_deleted_at_unique` (`company_id`,`key`,`deleted_at`),
  KEY `qm0_settings_company_id_index` (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_settings`
--

LOCK TABLES `qm0_settings` WRITE;
/*!40000 ALTER TABLE `qm0_settings` DISABLE KEYS */;
INSERT INTO `qm0_settings` VALUES (1,1,'invoice.title','Invoice',NULL),(2,1,'default.account','1',NULL),(3,1,'default.income_category','2',NULL),(4,1,'default.expense_category','4',NULL),(5,1,'wizard.completed','1',NULL),(6,1,'offline-payments.methods','[{\"code\":\"offline-payments.cash.1\",\"name\":\"Cash\",\"customer\":\"0\",\"order\":\"1\",\"description\":null},{\"code\":\"offline-payments.bank_transfer.2\",\"name\":\"Bank Transfer\",\"customer\":\"0\",\"order\":\"2\",\"description\":null}]',NULL),(7,1,'company.name','My Company',NULL),(8,1,'company.email','my@company.com',NULL);
/*!40000 ALTER TABLE `qm0_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_taxes`
--

DROP TABLE IF EXISTS `qm0_taxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_taxes` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rate` double(15,4) NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_taxes_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_taxes`
--

LOCK TABLES `qm0_taxes` WRITE;
/*!40000 ALTER TABLE `qm0_taxes` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_taxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_transactions`
--

DROP TABLE IF EXISTS `qm0_transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_transactions` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `paid_at` datetime NOT NULL,
  `amount` double(15,4) NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_rate` double(15,8) NOT NULL,
  `account_id` int NOT NULL,
  `document_id` int DEFAULT NULL,
  `contact_id` int DEFAULT NULL,
  `category_id` int NOT NULL DEFAULT '1',
  `description` text COLLATE utf8mb4_unicode_ci,
  `payment_method` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int NOT NULL DEFAULT '0',
  `split_id` int unsigned DEFAULT NULL,
  `reconciled` tinyint(1) NOT NULL DEFAULT '0',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_transactions_company_id_type_index` (`company_id`,`type`),
  KEY `qm0_transactions_account_id_index` (`account_id`),
  KEY `qm0_transactions_category_id_index` (`category_id`),
  KEY `qm0_transactions_contact_id_index` (`contact_id`),
  KEY `qm0_transactions_document_id_index` (`document_id`),
  KEY `qm0_transactions_split_id_foreign` (`split_id`),
  KEY `qm0_transactions_number_index` (`number`),
  CONSTRAINT `qm0_transactions_split_id_foreign` FOREIGN KEY (`split_id`) REFERENCES `qm0_transactions` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_transactions`
--

LOCK TABLES `qm0_transactions` WRITE;
/*!40000 ALTER TABLE `qm0_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_transfers`
--

DROP TABLE IF EXISTS `qm0_transfers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_transfers` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `expense_transaction_id` int NOT NULL,
  `income_transaction_id` int NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_transfers_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_transfers`
--

LOCK TABLES `qm0_transfers` WRITE;
/*!40000 ALTER TABLE `qm0_transfers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_transfers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_user_companies`
--

DROP TABLE IF EXISTS `qm0_user_companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_user_companies` (
  `user_id` int unsigned NOT NULL,
  `company_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`company_id`),
  KEY `qm0_user_companies_user_id_index` (`user_id`),
  KEY `qm0_user_companies_company_id_index` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_user_companies`
--

LOCK TABLES `qm0_user_companies` WRITE;
/*!40000 ALTER TABLE `qm0_user_companies` DISABLE KEYS */;
INSERT INTO `qm0_user_companies` VALUES (1,1);
/*!40000 ALTER TABLE `qm0_user_companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_user_dashboards`
--

DROP TABLE IF EXISTS `qm0_user_dashboards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_user_dashboards` (
  `user_id` int unsigned NOT NULL,
  `dashboard_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`dashboard_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_user_dashboards`
--

LOCK TABLES `qm0_user_dashboards` WRITE;
/*!40000 ALTER TABLE `qm0_user_dashboards` DISABLE KEYS */;
INSERT INTO `qm0_user_dashboards` VALUES (1,1);
/*!40000 ALTER TABLE `qm0_user_dashboards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_user_invitations`
--

DROP TABLE IF EXISTS `qm0_user_invitations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_user_invitations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_user_invitations`
--

LOCK TABLES `qm0_user_invitations` WRITE;
/*!40000 ALTER TABLE `qm0_user_invitations` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_user_invitations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_user_permissions`
--

DROP TABLE IF EXISTS `qm0_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_user_permissions` (
  `user_id` int unsigned NOT NULL,
  `permission_id` int unsigned NOT NULL,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`user_id`,`permission_id`,`user_type`),
  KEY `qm0_user_permissions_permission_id_foreign` (`permission_id`),
  CONSTRAINT `qm0_user_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `qm0_permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_user_permissions`
--

LOCK TABLES `qm0_user_permissions` WRITE;
/*!40000 ALTER TABLE `qm0_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `qm0_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_user_roles`
--

DROP TABLE IF EXISTS `qm0_user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_user_roles` (
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `qm0_user_roles_user_id_index` (`user_id`),
  KEY `qm0_user_roles_role_id_index` (`role_id`),
  CONSTRAINT `qm0_user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `qm0_roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_user_roles`
--

LOCK TABLES `qm0_user_roles` WRITE;
/*!40000 ALTER TABLE `qm0_user_roles` DISABLE KEYS */;
INSERT INTO `qm0_user_roles` VALUES (1,1);
/*!40000 ALTER TABLE `qm0_user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_users`
--

DROP TABLE IF EXISTS `qm0_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_logged_in_at` timestamp NULL DEFAULT NULL,
  `locale` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'en-GB',
  `landing_page` varchar(70) COLLATE utf8mb4_unicode_ci DEFAULT 'dashboard',
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `qm0_users_email_deleted_at_unique` (`email`,`deleted_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_users`
--

LOCK TABLES `qm0_users` WRITE;
/*!40000 ALTER TABLE `qm0_users` DISABLE KEYS */;
INSERT INTO `qm0_users` VALUES (1,'','leo.liu@dreamrs.io','$2y$10$KzB24VTC7OmWelS41S/H/Ovsm3yIUi/4g5Id1ChU1pxtwUn3ttBWO','05sVgZyCalpx7NTEwIvNuwrLv1gHCkTM3cFP7q1OMj8FlLyyY6GgvmqBBXOY','2023-09-11 20:27:45','en-GB','dashboard',1,'core::console',NULL,'2023-09-01 06:42:37','2023-09-11 20:27:45',NULL);
/*!40000 ALTER TABLE `qm0_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `qm0_widgets`
--

DROP TABLE IF EXISTS `qm0_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `qm0_widgets` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `company_id` int NOT NULL,
  `dashboard_id` int NOT NULL,
  `class` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sort` int NOT NULL DEFAULT '0',
  `settings` text COLLATE utf8mb4_unicode_ci,
  `created_from` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` int unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `qm0_widgets_company_id_dashboard_id_index` (`company_id`,`dashboard_id`),
  KEY `qm0_widgets_class_index` (`class`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `qm0_widgets`
--

LOCK TABLES `qm0_widgets` WRITE;
/*!40000 ALTER TABLE `qm0_widgets` DISABLE KEYS */;
INSERT INTO `qm0_widgets` VALUES (1,1,1,'App\\Widgets\\Receivables','Receivables',1,'{\"width\":\"w-full lg:w-2\\/4 lg:px-12 my-8\"}','core::seed',NULL,'2023-09-01 06:42:37','2023-09-01 06:42:37',NULL),(2,1,1,'App\\Widgets\\Payables','Payables',2,'{\"width\":\"w-full lg:w-2\\/4 lg:px-12 my-8\"}','core::seed',NULL,'2023-09-01 06:42:37','2023-09-01 06:42:37',NULL),(3,1,1,'App\\Widgets\\CashFlow','Cash Flow',3,'{\"width\":\"w-full my-8 lg:px-12\"}','core::seed',NULL,'2023-09-01 06:42:37','2023-09-01 06:42:37',NULL),(4,1,1,'App\\Widgets\\ProfitLoss','Profit & Loss',4,'{\"width\":\"w-full lg:w-2\\/4 lg:px-12 my-8\"}','core::seed',NULL,'2023-09-01 06:42:37','2023-09-01 06:42:37',NULL),(5,1,1,'App\\Widgets\\ExpensesByCategory','Expenses By Category',5,'{\"width\":\"w-full lg:w-2\\/4 lg:px-12 my-8\"}','core::seed',NULL,'2023-09-01 06:42:37','2023-09-01 06:42:37',NULL),(6,1,1,'App\\Widgets\\AccountBalance','Account Balance',6,'{\"width\":\"w-full lg:w-2\\/4 lg:px-12 my-8\"}','core::seed',NULL,'2023-09-01 06:42:37','2023-09-01 06:42:37',NULL),(7,1,1,'App\\Widgets\\BankFeeds','Connect Bank Accounts',7,'{\"width\":\"w-full lg:w-2\\/4 lg:px-12 my-8\"}','core::seed',NULL,'2023-09-01 06:42:37','2023-09-01 06:42:37',NULL);
/*!40000 ALTER TABLE `qm0_widgets` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-11 16:35:03
