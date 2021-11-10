-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: 151.106.112.32    Database: puppeteer
-- ------------------------------------------------------
-- Server version	5.7.32-0ubuntu0.18.04.1

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
-- Table structure for table `audit_log`
--

DROP TABLE IF EXISTS `audit_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audit_log` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(100) NOT NULL,
  `path` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `data` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `status` varchar(1) NOT NULL DEFAULT '1',
  `user_agent` varchar(255) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_log`
--

LOCK TABLES `audit_log` WRITE;
/*!40000 ALTER TABLE `audit_log` DISABLE KEYS */;
INSERT INTO `audit_log` VALUES (1,'1','/api/master/user','POST','{\"user_id\":1,\"user_name\":\"gesang\",\"user_email\":\"gesangseto@gmail.com\",\"section_id\":1,\"created_at\":null,\"updated_at\":\"2021-07-05T17:00:00.000Z\",\"created_by\":null,\"status\":1,\"department_id\":1,\"section_name\":\"Development\",\"section_code\":\"DEV\",\"department_name\":\"Information Technology\",\"department_code\":\"IT\"}','2021-09-24 13:36:10','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(2,'1','/api/master/user','POST','{\"user_id\":1,\"user_name\":\"gesang\",\"user_email\":\"gesangseto@gmail.com\",\"section_id\":1,\"created_at\":null,\"updated_at\":\"2021-07-05T17:00:00.000Z\",\"created_by\":null,\"status\":1,\"department_id\":1,\"section_name\":\"Development\",\"section_code\":\"DEV\",\"department_name\":\"Information Technology\",\"department_code\":\"IT\"}','2021-09-24 13:38:15','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(3,'1','/api/master/user','POST','{\"user_id\":11,\"user_name\":\"Test23\",\"user_email\":\"tes2@gmail.com\",\"section_id\":\"1\",\"created_at\":null,\"updated_at\":\"2021-07-05T17:00:00.000Z\",\"created_by\":null,\"status\":1,\"department_id\":1,\"section_name\":\"Support\",\"section_code\":\"SP\",\"department_name\":\"Information Technology\",\"department_code\":\"IT\"}','2021-09-24 14:41:36','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(4,'1','/api/master/user','DELETE','{\"user_id\":11}','2021-09-24 14:41:46','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(5,'1','/api/master/user','POST','{\"user_id\":11,\"user_name\":\"Test23\",\"user_email\":\"tes2@gmail.com\",\"section_id\":1,\"created_at\":null,\"updated_at\":\"2021-07-05T17:00:00.000Z\",\"created_by\":null,\"status\":0,\"department_id\":1,\"section_name\":\"Development\",\"section_code\":\"DEV\",\"department_name\":\"Information Technology\",\"department_code\":\"IT\"}','2021-09-24 14:41:55','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(6,'1','/api/master/user','DELETE','{\"user_id\":11}','2021-09-24 14:42:01','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(7,'1','/api/master/user','POST','{\"user_id\":10,\"user_name\":\"Test\",\"user_email\":\"test@gmail.com\",\"section_id\":\"1\",\"created_at\":null,\"updated_at\":\"2021-07-05T17:00:00.000Z\",\"created_by\":null,\"status\":0,\"department_id\":1,\"section_name\":\"Support\",\"section_code\":\"SP\",\"department_name\":\"Information Technology\",\"department_code\":\"IT\"}','2021-09-24 15:07:03','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(8,'1','/api/master/user_department','POST','{\"department_id\":1,\"department_name\":\"Information Technology\",\"department_code\":\"IT\",\"created_at\":null,\"updated_at\":\"2021-07-05T17:00:00.000Z\",\"created_by\":null,\"status\":0}','2021-09-24 15:18:27','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(9,'1','/api/master/user_department','POST','{\"department_id\":1,\"department_name\":\"Information Technology\",\"department_code\":\"IT\",\"created_at\":null,\"updated_at\":\"2021-07-05T17:00:00.000Z\",\"created_by\":null,\"status\":1}','2021-09-24 15:19:11','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(10,'1','/api/master/user_department','POST','{\"department_id\":1,\"department_name\":\"Information Technology\",\"department_code\":\"IT\",\"created_at\":null,\"updated_at\":\"2021-07-05T17:00:00.000Z\",\"created_by\":null,\"status\":0}','2021-09-24 22:20:55','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(11,'1','/api/master/user_department','POST','{\"department_id\":1,\"department_name\":\"Information Technology\",\"department_code\":\"IT\",\"created_at\":null,\"updated_at\":\"2021-07-05T17:00:00.000Z\",\"created_by\":null,\"status\":0}','2021-09-24 22:21:48','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(12,'1','/api/master/user','PUT','{\"status\":1,\"user_name\":\"admin\",\"user_email\":\"admin@admin.com\",\"user_password\":\"p@ssw0rd\",\"department_id\":\"1\",\"section_id\":\"11\"}','2021-09-25 20:54:18','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(13,'1','/api/master/user','POST','{\"user_id\":12,\"user_name\":\"admin\",\"user_email\":\"admin@admin.com\",\"section_id\":11,\"created_at\":null,\"updated_at\":\"2021-09-25T13:52:22.000Z\",\"created_by\":null,\"status\":0,\"flag_delete\":0,\"department_id\":1,\"section_name\":\"Support\",\"section_code\":\"SPRT\",\"department_name\":\"Information Technology\",\"department_code\":\"IT\"}','2021-09-25 20:54:41','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(14,'1','/api/role/section','POST','{\"roles\":[{\"section_id\":\"11\",\"menu_child_id\":1,\"menu_child_name\":\"User\",\"menu_child_url\":\"/user\",\"menu_child_icon\":null,\"menu_url\":\"/administrator/user\",\"menu_role_id\":null,\"flag_create\":1,\"flag_read\":1,\"flag_update\":1,\"flag_delete\":1,\"flag_print\":1,\"flag_download\":1,\"dummy_key\":\" \",\"check_all\":1},{\"section_id\":\"11\",\"menu_child_id\":2,\"menu_child_name\":\"Department\",\"menu_child_url\":\"/department\",\"menu_child_icon\":null,\"menu_url\":\"/administrator/department\",\"menu_role_id\":null,\"flag_create\":1,\"flag_read\":1,\"flag_update\":1,\"flag_delete\":1,\"flag_print\":1,\"flag_download\":1,\"dummy_key\":\" \",\"check_all\":1},{\"section_id\":\"11\",\"menu_child_id\":8,\"menu_child_name\":\"Section\",\"menu_child_url\":\"/section\",\"menu_child_icon\":null,\"menu_url\":\"/administrator/section\",\"menu_role_id\":null,\"flag_create\":1,\"flag_read\":1,\"flag_update\":1,\"flag_delete\":1,\"flag_print\":1,\"flag_download\":1,\"dummy_key\":\" \",\"check_all\":1},{\"section_id\":\"11\",\"menu_child_id\":9,\"menu_child_name\":\"Role Section\",\"menu_child_url\":\"/role_section\",\"menu_child_icon\":null,\"menu_url\":\"/administrator/role_section\",\"menu_role_id\":null,\"flag_create\":1,\"flag_read\":1,\"flag_update\":1,\"flag_delete\":1,\"flag_print\":1,\"flag_download\":1,\"dummy_key\":\" \",\"check_all\":1}]}','2021-09-25 20:55:27','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1'),(15,'1','/api/role/section','POST','{\"roles\":[{\"section_id\":\"11\",\"menu_child_id\":1,\"menu_child_name\":\"User\",\"menu_child_url\":\"/user\",\"menu_child_icon\":null,\"menu_url\":\"/administrator/user\",\"menu_role_id\":null,\"flag_create\":1,\"flag_read\":1,\"flag_update\":1,\"flag_delete\":1,\"flag_print\":1,\"flag_download\":1,\"dummy_key\":\" \",\"check_all\":1},{\"section_id\":\"11\",\"menu_child_id\":2,\"menu_child_name\":\"Department\",\"menu_child_url\":\"/department\",\"menu_child_icon\":null,\"menu_url\":\"/administrator/department\",\"menu_role_id\":null,\"flag_create\":1,\"flag_read\":1,\"flag_update\":1,\"flag_delete\":1,\"flag_print\":1,\"flag_download\":1,\"dummy_key\":\" \",\"check_all\":1},{\"section_id\":\"11\",\"menu_child_id\":8,\"menu_child_name\":\"Section\",\"menu_child_url\":\"/section\",\"menu_child_icon\":null,\"menu_url\":\"/administrator/section\",\"menu_role_id\":null,\"flag_create\":1,\"flag_read\":1,\"flag_update\":1,\"flag_delete\":1,\"flag_print\":1,\"flag_download\":1,\"dummy_key\":\" \",\"check_all\":1},{\"section_id\":\"11\",\"menu_child_id\":9,\"menu_child_name\":\"Role Section\",\"menu_child_url\":\"/role_section\",\"menu_child_icon\":null,\"menu_url\":\"/administrator/role_section\",\"menu_role_id\":null,\"flag_create\":1,\"flag_read\":1,\"flag_update\":1,\"flag_delete\":1,\"flag_print\":1,\"flag_download\":1,\"dummy_key\":\" \",\"check_all\":1}]}','2021-09-25 20:55:32','1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36','::ffff:127.0.0.1');
/*!40000 ALTER TABLE `audit_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puppeteer`
--

DROP TABLE IF EXISTS `puppeteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puppeteer` (
  `puppeteer_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `puppeteer_name` varchar(100) DEFAULT NULL,
  `puppeteer_description` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `puppeteer_url` text,
  `puppeteer_execution_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`puppeteer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1636526032293 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puppeteer`
--

LOCK TABLES `puppeteer` WRITE;
/*!40000 ALTER TABLE `puppeteer` DISABLE KEYS */;
INSERT INTO `puppeteer` VALUES (1636526032292,'Shopee','-',NULL,NULL,1,1,'https://shopee.co.id/',NULL);
/*!40000 ALTER TABLE `puppeteer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puppeteer_detail`
--

DROP TABLE IF EXISTS `puppeteer_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puppeteer_detail` (
  `puppeteer_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `puppeteer_id` bigint(20) DEFAULT NULL,
  `puppeteer_detail_name` varchar(100) DEFAULT NULL,
  `puppeteer_detail_description` varchar(100) DEFAULT NULL,
  `step` int(11) DEFAULT NULL,
  `delay` int(11) DEFAULT NULL,
  `url` text,
  `type` varchar(100) DEFAULT NULL,
  `element_name` text,
  `command_text` varchar(100) DEFAULT NULL,
  `command_keyboard` varchar(100) DEFAULT NULL,
  `wait_full_load` varchar(6) DEFAULT NULL,
  `timeout_execution` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`puppeteer_detail_id`),
  UNIQUE KEY `puppeteer_detail_UN` (`puppeteer_id`,`step`),
  CONSTRAINT `puppeteer_detail_FK` FOREIGN KEY (`puppeteer_id`) REFERENCES `puppeteer` (`puppeteer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puppeteer_detail`
--

LOCK TABLES `puppeteer_detail` WRITE;
/*!40000 ALTER TABLE `puppeteer_detail` DISABLE KEYS */;
INSERT INTO `puppeteer_detail` VALUES (15,1636526032292,'Goto Login Page','-',2,999,'','button','#main > div > div._193wCc._3cVWns > div.shopee-top.shopee-top--sticky > div.navbar-wrapper.container-wrapper > div > ul > a:nth-child(5)','',NULL,'null',50000,NULL,NULL,1,NULL),(16,1636526032292,'Fill Email','-',3,1000,'','form','#main > div > div._1229NB > div > div > form > div > div._3e4zDA > div._3nZHpB > div._3mizNj > input','082122222657',NULL,'null',NULL,NULL,NULL,1,NULL),(17,1636526032292,'Fill Password','-',4,5000,'','form','#main > div > div._1229NB > div > div > form > div > div._3e4zDA > div._35M4-Y > div._3mizNj > input','Bilal123@','Enter','true',NULL,NULL,NULL,1,NULL),(18,1636526032292,'Verification Link','',5,5000,'','button','#main > div > div._1229NB > div > div > div > div._311AHs._34gSQ- > div > div.b6uJpH > div > button','',NULL,'true',50000,NULL,NULL,1,NULL),(19,1636526032292,'Remove Add','-',1,899,'','button','#modal > div > div > div.shopee-popup__container > div','',NULL,'null',50000,NULL,NULL,1,NULL),(20,1636526032292,'Send link to WA','-',6,5000,'','button','#modal > aside > div.OZxFMu.undefined > div > div.dsyKcA._3P6yMq > button._1ruZ5a._3Nrkgj._3tZeq7.hh2rFL._3_offS','',NULL,'null',NULL,NULL,NULL,1,NULL),(21,1636526032292,'Remove Ad','-',7,5000,'','button','#modal > div > div > div.shopee-popup__container > div','',NULL,'null',NULL,NULL,NULL,1,NULL),(22,1636526032292,'Coba mencari','-',8,1000,'','form','#main > div > div._193wCc._3cVWns > div.shopee-top.shopee-top--sticky > div.container-wrapper.header-with-search-wrapper > div > div.header-with-search__search-section > div.shopee-searchbar > div > form > input','Iphone XR','Enter','true',NULL,NULL,NULL,1,NULL);
/*!40000 ALTER TABLE `puppeteer_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_configuration`
--

DROP TABLE IF EXISTS `sys_configuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_configuration` (
  `id` int(11) NOT NULL,
  `app_name` varchar(100) DEFAULT NULL,
  `app_logo` mediumtext,
  `user_name` varchar(100) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `multi_login` tinyint(1) NOT NULL DEFAULT '0',
  `expired_token` int(11) DEFAULT '30'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_configuration`
--

LOCK TABLES `sys_configuration` WRITE;
/*!40000 ALTER TABLE `sys_configuration` DISABLE KEYS */;
INSERT INTO `sys_configuration` VALUES (1,'Base Webs','data:image/jpeg;base64,/9j/4AAQSkZJRgABAQEAYABgAAD//gA7Q1JFQVRPUjogZ2QtanBlZyB2MS4wICh1c2luZyBJSkcgSlBFRyB2ODApLCBxdWFsaXR5ID0gOTAK/9sAQwAEAgMDAwIEAwMDBAQEBAUJBgUFBQULCAgGCQ0LDQ0NCwwMDhAUEQ4PEw8MDBIYEhMVFhcXFw4RGRsZFhoUFhcW/9sAQwEEBAQFBQUKBgYKFg8MDxYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYWFhYW/8IAEQgBzAKKAwEiAAIRAQMRAf/EABwAAQEAAwEBAQEAAAAAAAAAAAABAgYHBQQIA//EABoBAQEAAwEBAAAAAAAAAAAAAAABAgQFAwb/2gAMAwEAAhADEAAAAe0jl7JRFEURRFEURRFEURRFEUQAUAKRS4qAAAACiLEAAlIAAAAAAAAAAAACqiKAAAAAAABAWFoQKACgC1MWSsWQxZDG0YrTFkMWSMWUIFCAAAgAAAAAAAAAAAlAAAAAABCxBqvg83wz6xvHPuhe2CrEUgVUoVUUkVUUJRFCUJRFEZSIFiyEtMVRBKAYoyQUAAAAAAABBQAAAAARIXyuK7L6zXs9y1b5fr9n+qvpuQoktUGRZCpRKqMiYsqYMxgzGDOGLIYsoSikRQJUY2yEpcZkxYPE1Wui2MMskqSgABKAACUQoAAAAAllTXdk5Tk57tvx/wBNT33HW9h8nib3XLX0/IEyLKRkslWossoIqpQAAAiiUAiKjFkXC2SksJUTHLX41zdfG3Pd8eQ9E9XlPjn0wavrRAAAAAAgWFIVBSFSgULY4z2fh3n6fJNl59weh6+xcz3rv8/uY9/ItsllqUslKKCrIoiiKIoiiKIokyhJkjFYtRCWy4WyWaDv3jp6vPuUfR7cLqmja12fD23Quv2YsUICACUAAQKlAAAoZWIted+Y+6/n+Zd25t0jQ/jO38nv+L631PK7iN/VUzgqSrUWkWWWUC1FJFVjcpEVUVGNFiyCpcZkJMoRZKhEmUxun6Z7m9+/hpO3e9y+5dEa7sep7JUuKyAlCAAAIsFlAAoWyjIqWcs5x0D+HO2/P8vVup6Gx9nh7P4Gv6dmS/W8alslEKqMlkVQWBQAAAAAQCxUY2yIWWSpcWUJhnMctE6J+ct799He/V/L2046ns9W5B17x61V5+kiy4kiiUIAASwWUChbFMilhFcm9jUfX+f6PNOu696nM2/g2z89fpL6blbZTpatVZFtSmUSkCi0xtVFCUJQlEUYshiqJKCIKlhJSzGzHKS8843+peMNHWPl/R3PctToX0149sIiyEslgxBKAIFEpQWWlLLViZSlr81fz2Hw/H06Bof9dp5uzre8afsXR1uvU3PBVsEyxootIqgoAAAAAAABKjGZ4wAGNiyWS/zxvPvX83o/vhNH3i2aVtXOt61/X6x5ZBEJKmWOIJQiKBCpaWWyjJRYi5KLOIef6fv/AD/R1nSc/V6Hhvfz+z5XM2eu1fqOSS5YhVpQUAAAAAAAAAAABMc5iiCxcbj/AD/rMb+d+/cQ1u8rdOt/nD08dPqjh/6TvZ+9XltwSpZCVjcVkoYgEqpQZRlLZlZCZGUtiW5Pxh+ieF7lwuh7X1fbnwd/4du4p2f6nlb5LOxoC0ySqKAAAEKpIyViyGLKEWSgAAAASZY4ooY5THLxPzv+ouT463Ovl7H4ePI2vch9EsuNwWRS43ES4rMQShEWFGS2WxlLlJDJaIpk4DoHTfp4u9qH167vGz5+Nsbz88e/peppC0pkAAEKlFqwKAlAACTKRBKAShKIEGJ83085Xx9+97++ePz846foMbo17Ydf1UiY5441Yli44rjlJYMbKkUULVFlGUlMlWWUZTkHs8U3Tg9D5f4dE5tpbHr/ANP63yvaPu8X2vtuEyloKJQgqC5S2BQAAAAAGKyCJalECkEsxTj3YdDY+v8AT+f/AKfPk942D8675ns3onD+4YdCjH0izBBKlkqWYoMaAAsVkLMoZQlyZSrErKfn7TOwa1qe/wDT59d9PQ99h8f2ef6Gz0js35q/RX1HI+yy7HmFAARRkLAoAAAAABjljEVKAABJccTDRfCNE9zcOmY8/wDLv8vV7v563ze9Ze4lktlmFiWW43HFZZLBjQAArJLZRlCMmaWwTKefxXqn5c1fbuPJO1ef8h2NN3DX/q+p5f8Ab3sOc873/Tjy/V+n5QmSgAShljbKKAAAAAAkMQKAABPn/v5uLQupfm39I5eOSXL15j0fnHRfDPKWY5BiS440WWY5SVLMUGNAACrZbLccrMamTK45ZRKyn8/y7+peTy8p6v8AHp/ynX3PlN3Pf8Ogci6toHJ2cf0b+edn+r5XYx0NYgsCoKgzYWzJLQAABIWJiqFqCglBCJ8/95H5Q6dqPn+HzvvfoP8AL3dfTb9vV/s8nPrb+l8fUImOUxspKhjWOWOIJQiUoC3HLKLLYlmS5YZWUZR/L+rJ+eOh+xwLgdDrXyZZfM9P4cfi3j6vlaB/H7to5W1l038hdr+x43Ux64AAAAAVFZSEqJQAAACCoh/L+mixrH0el0vLDgu2dOk8vzN5vubtr8vlP6bz+rLsypPeoxsRLRiglksxBKEABSxZkKoykqZM0tgZT4fyT+xOQVoG3/L5ehsex8ul9N52z8m4cK7py9niO8eFuPR19w3r86df+h522JdnyAAAAAAAAAAAEhPj5vHU+Sb3z6eU7N+Yvew5f6Aw8DYvfr836Dz3oXh6pLjQhjZjZZZUshLMbBjQgABKJSrcblLYqysosWZIsv8AL+rJ+eOg7f8Annib3WdX/t9vzPU1/wDr5mfW1fX+DYtf62ltvLevcl4HR6H13imf1PJ7SjpaqlAASgAAlAAkVjIsa6ct7b+cf0zfDnWjd+uXtw3Tf1F+ZtX5zrfQOBbx79b+PQucdH8+jUuNQxsEoYoJZDEEoQASgAUsWZJarG2UZGWKzJGSfkj9c6dnjwjefB/vztrddU8r+Wp6+j5W56x4+vTeTe79ep6fZ/Hz965+x9G/cC7591wLY9/OoLcbVQVBUFkFRDG8yjy75nd8vHnPl7TxFl9X6U/LmweHF/QrRt62e3q3Auu9A88PzT936Heb4vtsm0qY1jUBjWKyokBjQgAABLACpaWLMktVLZKZFiyiub6h3fQtb1/leYe/8Z2tr8zxdf2vPY/A+nbN7X8jcOIdAxv8uz8z2jd8N3S9/nS2UCBQEoBBcVn5h/Qv5sw5vWuscb7D6e+fxfbfTZ1DhX6M/Oer890DsnKOr+3X5tv/ADzoeO6seWYkWEoQxrEiShAY0AAABKIolAKWLMoVbFhWSZRVQn5fz7zxDJsOy+N9PE3tI8jtM52z8Wj+/wD21fbwula9pXX0/wBIOB7B9FzOuOafVZ0G6f7p6bGlQVMI/pPC8at2c6+U/ryn+/8APz+dx2HwPZx1P0Wfw3fquG6L0rcNbQ4pu185j7HXPL9OdaowyJYCEJUSAlDEAAAABKhSFSgBLSxWUlstiqlsCr4/ryz88bJ2Lm+hs/S0K8Xd93Ut+6f3NL85br1Llnhl63n6b8vF3tv/AIeF9Xln/byve9qNE9zbfK3vDffA/OXsfVfN7Hq3tMeN4f0fV8rz/tn5/wDNf57Lqu3Zbn8+kcm2DHT/AErq306dtfSbJsX8/wCmp7iS2LCUCYgVExBKAlRKAAEUAJYAALKSwVKBTLFlMkosWVLSVQFRVSo/n/RXkfFsitG1bsUs/N2ue3j5cmMfNnI+Tc/Y9nx+q/tsW4NzPwPt9JLjbMWucP8A0nMvL8m9v37+iZJcPcASLjUsskWEBKEAAAAAJQBFEURRFEUAABSxVuJMkVbFVCUZCiAAaFvnE8sNF+15ePxrdenaLr/a7DoW5eH8d3+y/wBdZ2b7ngUApFkSwVECLUkWEBKEAAAAAAAJQIWAAAAAAAAAsVYFsWZMVZMaLLVgVIl0vc1fkfpHa/65a2XyfSw2fzg/Rs8vTD+8e3nlCLBSCoiyIsAJQAgAAAAAAAAABKIAsAAABSLAohSLCpQKACqgqErEuTEZMSZMS5MRkhLBQAgAIAAAAAAAAAAAAgBCoKgqCpQQqCoKgqCoKgKIolgssKKSwAFIolgoiFJZQgqCoKgWBYKgsoSwqCywsCoKgqU//8QAMxAAAQQBAgQEBQIHAQEAAAAABAIDBQYBAAcTFEBQEBESFSAhIyVgFjEiJjAyNUGAMzf/2gAIAQEAAQUC/wCW52wxcVmr2LE2X+H3qfUAnMQ2HG7ag8pW/wAOmzW46Lq4zhL10zlbIbSWBfwzPyw3apFVy3OeU8tltLTXo5vcDtVikUxcaBOSTB/YbaXyNdpYuG7RNZ5rcfVUxxtwO1WBxJ9mn41mUjGpeRg9BEsFj9fuq7nIGcYEu4OeLenVYQ3tc3l1fabNIYjIenROY8PTraHURPAibt19zzx71cfNhysLS9O3uQ4AWz5anIvtN8UltsEwYtu4zhYkiNbGPbanh4+6dec4kjcubFwZGURfLDGjOEwm22OVs/aZ0BuTixXDI83PGJIO9QiKPFe2xHXSz/KxlKfWqx6Na5KFk8cRqA+nuR2qzQAsunbkVz3vcaO4oUUeNIh9duO9wair7ZOp8s4visNxNWws6UjP/pfarIUVJSkJHDxcfnUxXSAyqzKJlY/rd2l/Yb+L6dU8/mo+6tKMLBHbFEhMcTcntOf225QlUXoeUAfLXnCU1g5t++dbup802cLJsQtzyZQx6pbOtvcc1Z+051h8+v2Ay1suxLeVNql7EaaBtmIpbvW7sY9IX74mweBbkf3WY3AMTt7H8hXO1X2GXICjvpd00IS6xHguS8sIw0MN1u7knhOIAnBUROsYckEkttt2A9yWkKKRzNU7XuKPHrJiBMBxteabjLr1OPh3JRki20gzIjx/zfBiSJ+xnhDJuG1DnnXe1WWWMcPrNdGi/C4xT5aaxNMyo/WyDeCdxIaMVKw0PJGES23q0ty1U8yztqs+lfaXM+lG3DaVxnjdo1YrgD6CgusIx6NzT3VwVpknW39xlHPNPRAiQo7bH/LdpdT6m63JmQhYpg5AZtnkFnw5zchHXiXaDjaBlSqj1OPGwelrck8ZswStNPDW6uCYdtSs+WNqU+pPar+HyVhxlWE6jpE4BL3MHnRQqAo7q1f24KdammVpcbPHwizwTPDcspXKQ+3oWQqv2qejWJWNIHKjD9OZdW/UYBmHH6z/AEYHlwKiSeHRpPH1QPkuyGYlZXbqQ5+t9rteGZuy3CHEZhts47K/hz1UW0n9SqjnhZlE64+ubcknJx+GRDWajOe3XLtJb7Qw2S5uzuVuEDhhimkPj0EnI7PTY/oSSeU3LscSiSHlZJbw7yuDfbCrj7kzyuSs3abtjnZJhtDTXhcol5/VYlW5eM+PPTbntZGJbVhaL7HYcGnnfSJXFc/PXxHnDRrnFju0bjZfFmqtLpkxJ+XHimYGXHlWs/tGYQHuH1t1KPcsFNPypkppLwxbeXaLRW/RXrxn+Xq4rCoDtG4oai61HlOtLOKJNIr5/tsnNWtrhbdJcJtPW3sBP60aaJyRCWAcpMdhL+qbn+X9wHkpE2ykFsu9oXjC02GOcg5ceBkHgNBMFyxddih4iN+DPU7qjKzGTMemWCS9GyLsOH7Na4HyYOsfElS5HiCtAvoKDx2ayz7opuIm4najqcykvyxhMkG4daYePFjAvhz1MwIg6LpT6kjykcLINFDFQs5deOOQXDtxG20Yxguo7WGKch+ykOYaY23y2XjxriUD3b4s9TcXS2K3FST4ssM62+xNgoPjymsyNPkpbnNrIpvgxhEkRXrfEHDyIPZJf/FUIzIZ/jdsZjZZGcKT1ziEuNPQyUS8XIHQBUfJBGoD8mpeZw8Ccj5IvquFOQJ7lalWlpcb7GSjiDx+PJge1ktxYU3JDGtKwtubDRIRW3xKyax1WPh3Nj14bQgObizKl5ZB56Hnr2HxRAnMOiTAmJS2wDKJWq7bSbrT3ZLKLmOtOv8AVTkR3oKWssWE3tthWa317zaHmUpcrFgxnzweKyYMG1lQMBnLA23aOesdaTy07cWHR10m2NSuOwOrS239xtpmaYQzqVr1pLIDqTXAOYUMW9wU6BHImCI0VsIDsF0ABOhK/YlBaDkwCUmFjM6tzL/I7aYExVY/HldymUvjRwWSXaLZFGZ6/cUnl6rtm99q8ZJsybtEXR45rQYw4rPYZIZBsdiNJHkYoKuS2XNvm8C1I3JAkQSqsWb/AMtw9S7uY+52WLySijTuJmO67dVz6e3T2G5bwc+Te2ycfp34s9duTGuMuOR8dPBNRdjB0XmZBmCmhp2EEMJEsOP2mQ+dslUI5mClsPQM5W7ABMtdUcUyIMq+ROHYaajZRO6mPrDPOjEv2GZdXV5BUlFZ1QfpJ7I62h1otl2qTzS0uIUnCk8D2gm3RGDxqbJc2DT0c5cKBn7SexgkQeO5xqo23Lj/AFJbzdjuzYw6B5unxxa5qKtxDDlZkWxNbc/4fUD9O+dlmo4aTAyWTWZUKdjCUkyEdhmtzLGDbJGvDkbRZG9qreOUntEEe03awRDEkxSLA+OV09qO9ugKgjLUp4r8sJMynJdcm3InX6yjuHRl8+d2VXzxYI0qPsoy4B9cTVKwXqxVWLXD1eXy7mXjyos5+aHesurmIoqwVMrm4S0ReDxNv5lUpE9FnR8/KS8qqAtAaKzZcGE7rO/a4p3DEtjxuMgmNgBApw1C4qyI0DWZyQdjhWgguzXKEbmY2HcYNyVUxVKxUPPTtRcbzEFkY1aa7xNUyV5gdvHH3IqaeVk9DL9mvfRbjyyhAtt2MNzurXADzDFjOk3Hs4xnDc7NNs0yYdkmtbh/xq7Xea57imuzXGV4PtNvNoJ5YidhMErqUlgK4Wbyjrxq8s+qIhSObiegV8sHk5kp7bZrGXPAoUcnEpAR7omflnbdGcymtws+l3tlurA0vj3SVgn2LLFLwRZ4tvGfeLSuNlSowuWjhJMeeFlI8KoSiTgLEj1wW3TnEp3QWN7l4KNx5BbfnjDEJVhWPCdLSFGZ/fbV1vHhuN/Gvtu4Dkji2jyMFnUadQmsk3aDFask+/PsQcsfEqFIFkBZOBeFKenGSIXbbHpp3QbnmcGAbx6UKThWKsa6BLeF6m2HpJBgystOKQ6FbJEdEMWu0WfttmhRZkFK3oUzENDEIGhoxhWMYxhaUrwTE8JyLlUPuycYGej2iYinGLpNA6Y3AjFYTeoLOkXSvK0zaIB3Q8gCR8S1JRgiZiWNO26vN6Vd6/jTl8g8anJdE9PeFcHyVPaIXhpilQcdJRBNYgnkHURHqYpEi45EgDRwXbpqNElAzgJmrPRM2CcnwlpgIBAMLK2ZeJKXg3o2TCOQrGFYdABc0qFi86VAROdOVmKVp2pMabDs8ZoC7HCOQ8zHSjM9boqNyfb54/LzEiWpMUxjSY4XGsBC6wKNjQucMS/htshGSNXV/lqtU2eXrXc1YwrE7S405SqtaRtJq9pJ1B0mPEWjGEpKHYJZmKKG6t0C3xWsWcofKLaDnSbTGZ01YYlzQ5gr/hMuhMB5RzJwoLLXh8sacJHRpUiLjWZQfWZVvWRpGTIxBWlphBPk9FHkRp0HLhyjO5D3MNtpwhvvjjbbmHIqMXpyAhV6IqEA7o6gCZ1Is2GtYcURLFJxhKc5+RcjjCo2my56QqHDtYZq0C3pMHDp01HgNaxjGPCfhQZZiXhZeGW2Y64/UIYtp/8AAc58sWeRVPTuMeWFqShIQxU0Q7AA+1bcSrucf0MIRjP4FuLI5ArYDPBG0yIZOGU0tORdWP1R0ww4l1n8K3Z8+b1JOLwmoRCIeI3CjlAmBvoJFt3ozAU7K81b8KvEPmYiHCyRV0CCKekNHDtlCO+5VYtn3C0mjNpZY/C1IQpXivGFYSlKU/8AN3//xAAwEQACAQMCBAUEAAcBAAAAAAABAgMABBEFEhMhMUAQIjBBUSMyUGEVICQzQ1Jggf/aAAgBAwEBPwH/AJtY3fO2h+HByamQQWu0dtuHYmo48XAStSbyqvbE5NK/t2EQ3SKKlTZdh6nlMsm7tTV3fMo2AYarF5bg7n9uwiOJA1Xg+lvrh7bXd+/Rz6siIxyRScuwgj3xPUMhnh4ZrUcLEF7Z7hFJDGo9SjYHNQligLevpreYrUKCJ2q8n4sn6H8meyvLNbgZ96ttNWOQMewjJi2yCrqYSRhhTx7Ylb57YnwU+vBFxrYrSRl0CfutSAVVXtprs20pD9DVvqfnPE6VayNKN2OXr6fJw22t70EAlq+l4kn67a6t1mTaat9NYTefpQGOXrpAZrfK9RXFkMTZ6iljzalv3247DTptrFTV1CAWx7ilQCy7V87eVHU1WPB+6oL1Hi3tUbblz68URkU7eoqO6Z2VHqeULa7alj2NjtZrCKV95qy04A75KHr203ClBq4t1kG9OtXineD7Gr6L6SN2kUocHwXsFxnnSCeIeTmtP9aMnHNavj/Tip4doDjoezuJpbWdgvvWnXLSZDmlIPY2d4I/I/SiYz5s1fMRiOoIxLabaaNh2HSkYOu4VLbxyHLiotMcuWJwKggWJcL2OBnnTWkg5rzFBTPFsb7hWnN9MqfaoVV5HiNTRGN9p9eb+22KtL+JIQrnmKBB5ih2dpd8Lyt0p2ibmDWRnjR/+1aPm53fNXqJlS1XNs0J/XqwS8UE0RkYrULWOHBWrW4iMSjNL2ZoWbOu6PnUMNzC2cVLB/miq7lWS2yKhxPbANUqGNyp9EnAzUMvEXcKlOENWF6kSFXpXDruFPbRynLilsoFOQvawztC2RUd9C464qa7iTmpyaeJLlMxdasHMbGJ61JQJc1j0NTkKQYHvVmRwFx4aqqKw21ZD6C0vbogY4JoabIfek09ozuVudOqthZRg/NXkEzYPXFEEdfQ1ebLhPirF5BMoU+EumJMxYmobK4hOFflSjA7iG6ki5e1fxNf9anunm69KhvZI+R50t7bt9wriWZ+K4Vo/TFTaegG5Tirm9ig5Z51JqszfZyrffP0zQgvj81c6fLNhx1q1BtrgcUUpzQ7/FYrUtTeNeEpqzspbuTAoaWtoByrFY8JYUkGGFQW6xDC/gZDhc0qvcT4+ascWmNtXSCSA/hiKitIo23KPDiybNmeX4fH5/8A/8QAOxEAAAUBBAcFBgUEAwAAAAAAAAECAwQRBRIhMRATIDBAQVEGFCIyYSNxgZGhwTNCULHRFRYk8FJggv/aAAgBAgEBPwH/AK2txtqmsPPIgsirhpps0FBQU0U4o0XcVCE8cy09YrItim1TRTapsEhRlXgUliJEi/Z6ni6Ds42d5xzZpvKbFKmEJoVA60WZcA+q5HcV6CM9rrIW2WZYfUQoiYsYmueZ8HTQnAwpwwazNOPAPIvsKb5mRiyFKKTqepl9B3i/aWqLkkEWzQUFBQUFBQUFBTaoG09QtFQZU382T3eSxXLETI6IEw5KeZGfxHZ+85IW6rp+/AU2r5AnSDmJ7/tI0rUtuFyE11cqOzTE6fcWVB7pGorzHnsU4Kl7Aau7jwD6G5SVxl9CFlQ1xXTbXmRfcNSNZKcb6U4YipocTTfz5hw7SS4eRliHpKWXVvcrhfuOzy1OOOuq58NfuhLvUKOpb/tBF17OtRmjMLeWuGRelPqLFid2jeLM8QW5pvLtRq6HiD3700olomlzyLIh3VhuU2SU+EyP+QuTdtNLXVPC0BEFFUt8WjtFCNxknk/lFlSzWholflVT4GHH1Ltwj6HTQW9Pb1uASsjIKz3paJMtLDiSc8isA/ZjTDTjrPv+WIhRTctZTvLP5iO8TyLxAuDoDaIwSaZ6T3ZaJ8TvUVSOfIWdaTkZeoe8h4e4WQr2Jt80nT+BYkq9Kea5GdQXBpOuheewe8XeNBkk8Q+qDMXSR7NwvkGP8OWkr1UrLP1IWCk/6ir4iHL1iltK8yeDUo0ngGlGYXlsHuy0WxZByfbM+YITKT7E0n6ehixWm1GuTzV/pifJOJa98vSoQ6lZ0LPcV3JZBSCMXKcAWiqiSd3MNWvGUd1w7qi6hSigyte3i0vP0MdpGqSUulkZCc44xGYlozIiIxFkoktE6jfnkEuERaFZ8CWi1rI72Wta8/7hpqWwrVrQdDzIG2d3uEn/AMH9hbDFLNNBfloLEfeurQ2eJYl/As60m5icMFcy3qTqKBxBJCFlQLz4NJhdrMsuat/wn9BMmWZMRq1OY8jESfQjhyzzyPqLIiORbTNtXQTlLg2kpTfvEd9L7SXU89FdmoroTiDLANrIswR1C6DAV4SZDamN3HPmJNiTGVYJvF6CBZMp3wOpon1+walvWY6Tcoqp5KFvR0yG0y2Tr1HZxw1RDT0PcVCzwDflLQ7Sob8oc4dx1SG7yU1C+0UZOaTqHu0Lb5XHGqpDK1s1chneRzSf+/UWTaEFJGkvCZ9QRkeJChjHTUYihhw+QbrXQok1CcOYUqvD1EyzI0vFWCuo/tlVfxCoIFmsQi8OJ9RMsaLJ8ReE/QLsOez+CqvuMd2tlP8Ay+Y73a7HmvfEQ+0D6lkhxF73CqaVGsPkKrMXVhSK4hHhViKgz4+8YvGDaaQu+lJXgpSUpNazoQhWgxKJWq5C8YqYqLwv4ULjq6UZjzKE+KmUwbXy94sta485KfgYPPRX9DI6DWFyFRqI+t11zxCv6HXcV/Wv/8QATBAAAQIDAwYKBQgJAwQDAAAAAQIDAAQRBRIhEyIxMkFREBQjQlBSYXGBkTNAQ7HBJFNicqHR4fAGFSA0RGBjc4KDovEWJYCSMJPC/9oACAEBAAY/Av8AxbuzD9XPm0Yqh1DEottpkYrWrSf5QFnyGdOvbuZD1oWicvMXa5xwB+MIdIz5k5Q92z+T3pxzQ0ioG87BDlszuc9MGqa7BEtJI1pl4CG2UaraAkfycUscrLuO5JDOyldMSFkoP7w5eX3QltAolIoIkGTilhOU+PRapkoyiqhKEdZRhqXt2QTKpmfQuJNRXcegpp+tFBu6nvMWaFjFTZc98Xdkqz8Px4Jxz5hmnu6Ls6ymc/Iu8Yf+iBohyUe52qrak74EtbsqtbKcETjWIPfCX5dxLjatCh0BJyCNMy/7v+Ysk6EkZP4RazvVN38+UKWo0CRUxaNpK/iHaJ+37+inZmlV6raeso6IL8yb87NZ76zv3cBQ4hK0nSFCoh6yZZXyeYbyoR82vd5dASEvsZbvxIz6f4d8E+/4Rar6TULdqD4mOJtnPe1uwRMyivYLBT41+7oqz33DyTc6gr7ovyzyHE/RMJlZJwIupqs3a47oKn0HjQGDYGC4Eys1yKFLcV2noB8pNQ0zd8aQ6wdJTh3xPurHogCfCsP25N60w6G5dPvidlOsylX58+inZN3QsYHcYXLLWtiZZzSUml4RUlTriz3kwrKoKVJ2GAp0fKJjPdPw9fmJn5ppSvsgreVVTyVVJ2ngtU6Mq9QRYNjJ0IaDzvjjChscl+iwtRLUwjVdTpibyjiH0SnJpdToJhu0WmcoqUcC3EddEJmZVy+hX2dnr8zvcojzMSbh0XEE+WMVEJT848KxMWqsUTQNtDshn+wfd0X/ANP2Yq6aVmnvm07u+ESksmiE/ad/Aq0/0dcyL2lyX5jkZUoLbzZuPNnmq9el2vnJpPuMSjyRsycCXdPLsZqh2RIyTftFEwiXbFEoFIP9KX6LfnFYvTMytS1ePAZVqZQp0c0GCToEWiJdN1l9rKDtIIFfXrNTsMzC2066c5HfEtacq9k5la8hMN9vW8YyyvYshKeC1LQ5qaNp/Ph0XMSjTygkLyiEHVWkwtLbTrcytN0CmA7awFNqKVJxSRsji6whpNOVUk6/3RMWssUS4Mk13bfXpB/5ua+H4RWGAkcm+6lQHjjCz2w4uueoXUd8NXxykxyq/HotM5KD5XLao643RTVWNZB0iC82wtTadKgMIRZzZKUa76tyYQwym622KJA9easoNg1o6VbvzjDDw6tD3xZ7u1D9Ps/CH3HVpSltZqSYzKhpsHJiJNdcQ3cPhh0YymTH/dXFgJS1tH0oal8KpTndp2xaEiQBxhIeZO9O71+YSPYSyT+fOOIzGCXxfaMSv934GJ2W41k5Zh284Pu8oNnyqAGZSVu+JH4w4z8y+U9F/qWxU3ptXpXdjIjLuEzE4vXfXp8OBqfs9VyekzVv6Y6sEEZKaaweZVpSfXrSaXoMrd+xMPSCDcn7NcJa+knd5xLyE6yUPS96/XbhFuPrNAhVSezOiftRf8Q7m90Wqx1JgfH7uiircIetFQq9OPqUpR3V/YH6Q2bmTMvi8kaHUbaw1Mt6rqAoeuzv0mB/+YatZCTkH8x+kIeaUFIXKhSSNuEWnZ0tXKz8wEYdXGG5dPNGPaYtr+8n3q6KUjrCkOyqlqW2w8UuNH3jdHGmnUlqlb26C7KrSlgHMQU6w7YRNN87SOqd0OyiaLfeQRd6o3mJK91T7z6604Dg+xT4fCFy7oqlY8oEq8SS0lSRXdE7MqGDKzTvJisWnNfOzH3/AH9FpnQORnBRR3LEKSla0pXrJCiArvHAtEo/cS5pFK+MCTZKnZmYOco+8wzKt6GkBPrhjjaySUvVPnCXEmoUKiJObHtEqQryidVtXMqh5yucU3U98S6VCi3eUV49Frk39CtCuqd8Gz53WGLa9ixwNysqi++8aITF5XKTTnpHfgPXp1aRnSs0a90cQdVnt6naIlVbnx7jEwP6x9wjiDJqhtKqdqqQ0FnlJfkl+GjoySsmXopTBykw6n2Y3Qual2QhUuKm7tEOW0+nF3MZG5Pr9syTgqlSzh2QuVaWUTCTeYNaX+yJaUmmSiYRMov4dsLsmz0503Q126IsyVCr7ikFbqt5xids7Q3MjKIH57z0Ut99YQ22KqUdkFFm1kbOrQzB13O6CiXvKWvFx1esqFsrFUuJumHbCmcJmSUafTRv9fd6s2yPz9kVTmPo1FRLsTzQE/JvgF2mK09v2RZT+x7MhpIxyEvjFl2iPnLi+78k9FWZYxJyc06VugbUpFYS22kJSkUAGzhRalmnJz8rikj2g6sJmEi64M11HVV69Z9roHonMmv3/fAWnQoVECfaGe3r9oix7SHslpNfI/CLRtY4hxy633fmkBz5pwGGHeu2k/Z0TZs+w4UEXkBQ2GM+iX2sHE/GEqdClrXqNp0mFKaCkLRrIVpHBPSrRFyZlg+UjYqtPXpuVfmXMkh7BBOakbINnTGDzGiu0Q40rQtJBgtnWlV08jDauuomHPrCJIpIPydGju6JcW2OUlyHU+Gn7IRNSzpbXTAiMvNOX10popQQmZNSjVcA3Rk7MBW4faLTQJibnVEruMXFLPOUSPu9eovBE+zQHcr8gRkk1btKU1P6yd3fAameQfGBCsAYtiQ0gqJHiIaT1CoHziXl1e0cqe4f8w9YU0rOazme0dElKhUHTGR0yj5qwrq9kcbQ2LukJOseDidnJ/uO81EJlWMdq1nSo+vS9ot68o8PI/jDU9Km5MBIUhQ2xxa3mlyU6MONoGt9YfGOJCYD7cwzeQ4OdE9JHC65lE9xicmWvQWegCvjSLNt+X12koynbDUy2aodQFDx6HTZtmSxmp5Yrd2N98Xpu2USiTzGho8oTM2nPPT60aA5oigEOWTKYXnTfUOYmEy0q2EpT5q7T6+9KOaHUEQ7Zz2DsqsinZF19sV2K2iJYuqUtltYyatl2uMNTkqu7xhGSUYnGqhTrjYW6veaw1Lq9oxSHbPdPKSTl3w/Nehluq0ITWJ21FrCpmZezhtQnYP2LYZWkBxZS6g7SnoCZeklFLyE1BGwbYTOuKUsrPKEnXEJdaUFIUKgwthWtSqDuMXVDlmU/wC5MJqrlapYX3gxLtdVsCHX2BVt6inEdYQiall3kLHl2dCzP9lXuiWVWjbvJufD7f2JL9IEDNbORmKdQwFJNQdB9fU2sVSoUIiasV03HEG/LL39kGVmmyWq6vxEBTD6T9E6REzK810B1I+ww7ZvsHX0up/PjAAiXdpXk8RvxhCqldmTud9XthK0KvJUKgjb0ItHWSRBaOBQspPnAZVL35lIuh0qzT2mBMuTjroryiFHNI7tkBadChUQ/Jr0OopDOV12SWleHQDNtSo5WUOfTqwhxxtKkrHikwVSc0R9Ff3wyqcCwmt0kmoIhufbGcwce0Q06OegGOKabkos+N00+EcUe0tkor1YcsCePKM+hJ2jd0LMNU5OaOWb8dPCylT6A4ym44CrEUg0ey6xzGsftjLKFOMPrcp3noBTTiQpKxRQO2FyD9eJvmrKzsiohTL6QQfshUlM51wXK9ZO+FyTpzpU0/x2GLStQjkxybZ/PZFqyWxD5I8zDVsSZuvS5xIgSs3dam9g2Od3QKlrNEpFSTDhYm3ZKy2jdSpGs9F+R/SCcbX9IwwJh9iaSwrNdrRVIPGX1FwjmaBDkuvS2qkXnbvjAkrPbN0+kcpgkQ1KtDMaTdHQLnHl5JLQvB2mpHFpirzIOavaBFWZlB7CaGEuqfbGzWhc5Jmiwi65TnJhnipqTi7vvxbH14WyvVWmhh6UQrJzssolpXWpsj9W2lmTreAr7T8egHwDnP0aHjDkmf4ZQp3H8n9ibl7NTodIcdOhEByeccm3NtTRMZKWZQ0gbECnQT0ovVeQUw/LhAVMSqsW1DXEBtb7tmTWi6TVsnsrDi0Witxy7VsXKAmFyE16eXzFA7RGTWTxCdP/AKxPJ+fQFjtwHAX06L4UfGE2hIkpmm84FPOijuE0zg6n4+v2fL7FvFR8P+YfZPtmxT/H/nhJG6C5z3H1qX316Fat6THKMHlqbRvhM2kZNxY1k7+2LsjahuDQm+RAtKbaN+uesDBXlGadcVSeqYluOa0tyKidqfyYqInmQKlMlfHeKGGFnSkXT4Q3bUkiqFGjyNhj5O5ddGs0rWHrapiYcDbaBUqMUyE0W6+kuYR8jmkrPU0KHhFmObMotPnSETEuu642apMBXGktU2NIw+2EvrADic1dN/BaUif4adXTuPQqmnBeSsUUN4gtqqqz5k1QerAWhVUq0GClQqDsMF5n90dPKo+bO8RxqXpl0D/3EcXdPLsYGu0Raj/NQyWvz5Q631HzC2Tzhh2Rxqz1cXnpZVHEJNMd4gWbbPIzINA4cArv9aEnMrVxFlZShCTgtQ3wGEMoDYFLl3CMvJ1kpkYpW1gK90NSMyhqbaacCkPJOdBeVk6pFbgVjwO/3z7hwWy0NC0oc6GXKTSapVoPVO+F2c64mZYSa5p0QKTAQeqvCDlZpkpIxz6wuzsreavfJ1nduj9a2ZmuJ9Ikbe2JhQdCplbtXRtA2Rakgea8VDgWdDT9L3jFdV4aq4Fh2waODBlw7ez1iZmgc5KKI7zoiQ62WBP7GMOlOgrNPOFoyOWZcN4pBoQeyCpUtNimy4Pvi0bbuFKZpy60FdUdDEQ4wrWK7zSl88RkbYknpF/a4xqnvTsgLZtRb46ocAMZKQDUs+1i2sr1u+DZ09mzDeaCedH63sc3VJxcbG2Je1m+Ty6Lky31Tv7tHA023rrYJHhWGlk1UnNVGUawmGsUK+EZKYPyqWzHO3t9UXZn6PXEhGtML+EcZlbdLz2lTa9UwbPtJrik+nmKwC+6JSVHtpkE9wESrytVDya/sPPnSRcTTeYykrZq8nsUvCsY2WT3KgIm20yjHPJOce6G5VhNG2k0HQ90YTDWLK/hCrKtlgcaZzc7AmL0vMONd+MVcn1H/GL8rO540XhSBJ2ki4/zV81z8YVNyCc7Spsbe6OJTBo+1orzhEm3pDbRJ8jFo2cfYvEgdnAw8nNYn8xe6p/H1NNnyqvlE3/tTF1OhEuqvmOC8OSmm/RPDSIk7PtZhSZiVWeU2ODfFDAbRPYJ0EtJJhxmZu5dmlVJ5w38FksHVcn0BXRnH5HMnWt3tI4lPclNN5pvYXuG44mohMtNK1vROnndh7Y43JqyE0nG8OdDkxbdWnVNZMKIwBwhm0EkcXn0UKhor+acAfTry6woGJaZ+daCvUaxNT5xTfybX1RE4/tF1Hx4aTDCHANF5NYWGpdLbl3NUmKRMubEtBPmeCyF9W0EdG5do5CbGhwc7vgSlryylp5q9/jtjF1SPrJjNWpw/RTGQlJbJSwNb6tHnH6sttCkKTquGKOgHqrTpEcUdUXpRKrzSup90Bpw8u0KK7e2Jsf0VGJM7klP+4+ozb2i4yqEdorExLPupbLxCkFRoDspFUkHu4XX1HGlE9p4JtqoyhUlVOynBZDI1lzyadHK4xzf3fq3Yu2v+j2Tc2rYJTX/ABgLErdV/VQVRdlUuPbktouiMl+oxQajmKlJ8YDU0y6ZfcoavdF5opdbVpEcesdV1QxyUTTMwMhM5FSS2rbhsiUFesf9x9R4mk8pOLCR3VqYCdwiikgwylC1ZF1dxbdcMdvCZQPAIlzQiulUUDohLzDpbcTqrQcYpMNNTIHOrcMNWgWFNStnJzQTWqz0cWXhdWPRuAYpj9WW5LpdZ9m6pNcIDiJVspOgpi8iTbrvOMYACKKSCO0RxmzF8Xd2pGovvEcVmk5CaTpQdvdFJhoE7FjSIytjzy6dStPwi5aVmZSnO1Y5WVmG/IxrvD/TjGbUnvaMZtpsj61U++OQnGHPquA/tVUoAdpjlbRlk/6gjG0Un6qFH4R+8OHuaMZuXV3NwmYaStLMu3RCVb+GWaTzV5RXcOBbh0JSSY/WVoSqXnpl1a6qOysXTZrKO1AumL1nWi6z9FYqIpN2mnJbbgxMIlZZF1CPt6PMvNtBY2HanuguM1mpAny790US5cc6iuE5RwKXsQnTDlpLPFUBPIVGtAlrYllrRsc/HbFWHkk9U6YoQDGfKMK72xH7i15R+6JHcTGDa09yoqxNuo7xWKyNorcSObfw8jGStmzz9dAofKL8pMpVvToUPCC2HOMPDmNffBEk2mVR9EVPmYvTs+6uvWWTGcpSo1K+MehEehT5Q43oC9HDNuc8BKR3cE65/SKR44RJNUpRkdKUUKgwXZcmUd+hq+UXZW0AtA0cqRF2ZtEISf6pPugPTizNufSGb5RdSKAaILUw0hxB0pUKwXbOfXKudXSmME8bbG0G/wDjF2ds1SD5e+M5h0RjlR/jH71d+skiORmG19yuBSp64UblCtYU5Itql2vrRUi+reeHOeTGvXuEaFeUZrajCVysg8TvSmAtUiHBuvpr74LEy2ph0c1YpAmpfHCi0HQsRel1541m1ayYlLEZPLTj6bw3IEJQnQkUHTtFoSrvEZ9nyp/0RGdZkt4IpH7lc+ooiL0jOvMq3LzhAW+6l+XrQG9UffHGps8nzEDRFEigEVi4wKnrQl2fmUsIVjSt4xyy33z2qoIws5s/WqYwsyV/+oRyUlLo+q0Iw4Lky1nDVcTrJg8mZuW2LRpHfCRIsv8AGeaUYEQbVthwuzzibovezH8hVhV0/JJbNQN/bFBBUo0Ai41VEuk5y4Mo23nbHOdWHLFnTy8rqV2p/wDhqEJHh/IbgQaOzHJo+MJTt0ngVKSKahpN5ROiDZ7jeSfl8FJ38EpbTPMcAd7R/wAQlxGKVio/kuzQdSp+HAlhoVdeN1IEJYwLqs51W8w3+kEknFKqTAG3thD7ZqlYqIfvbBh3xIlzWyI/kvJtenaN9r7oLEzKrDqcMcIFsWi2UBHoUK09/A5LuiqHElJhUs8yp+UJ5NQ0Q3LtsFmUSqrijCGUCiUJuj+TLykJJG0j9iihUdsUSAB2f+N//8QALBABAAIAAwYGAwEBAQEAAAAAAQARITFBECBRYXGBMJGhscHRQFDw4fFggP/aAAgBAQABPyH9pUrZUqV+9qVKlSpUqVKlfuLl+NUqVK36lft3/wAl1la3/fjTvBdlcUTIo6Ouw2Y7K8KpUrcrZUrwa/XYElopdXWuPCPfRVsTl1WzALUv8ae8Nlb1Sty5ey5cuXLl7bly9lSpTvVK/U45qLH/AGGpfAj6oPbtH+ySagn2QTqEuQVKhuV49b9y9l7a3a3j9AhFyIt1WzNgUdHW5RTay9DR7vlAABByIjFRI4JfuDwzZUqVKleFRKlSo71R3KiHabtLKCLz6qd6px2n5rspGwL2j3mIr/fFwelRxeJ+y22NXim8Fp97DfqVK/FqVvO4iFgpxDYHvAyoFiYPIc4vhyQl0rxmYXW2Ow/MrY+GFs4mD3EOGQf51llt0HlkRf0RHSoezgvyLPs8trtJX5lb4BGHxYofPaW3pnTbGrwNhVjq0O0wpuHYZjri8vwjxQmL12hztfglVMemLIUqDBqKQS5HfzjKEK6Y+7cVK8GtlbalSpW5XiVuUNrZMDFKP1m2V1lRW65KvVyrzlKisldxHQ6y417T4evp+bjDYMoOxoBfvAcxTyjKWtB2UUBdxPaXi7BXnNOim5lfbYEN+pW9UrZUrbUreqVtd2sIzBowbmTY+cQQap4B5kWYFlxcbYTl03ExKrmZeXZ9/hG9W4G03NB6mCM046BjsAoxPSa+2aJkP60vzjC8E96D6lfoq3XYw9q1l3J4kEyC5m/894tHZWYOJ2hdvMPiNGO2vFfCDYwJgxqi5/4XLGqHTmnyiC1iWRttCuiv8iD7DaAD2CPI/hbx4VSvAqVK8Kt63J6PLgOb5mZHqrbrLmwCUljNTDB7YaP9hL1U5mUdr+KbrVczdibniV1MvmDSGKs3Q/EzvFHQMMfK557IXOXYMEvlh/viV42O5UrwXZhTwgjXV5tUDpstt+OYrOuMUsAtXIlQBxPsjbDcfEd821txvxPkfcBe/LkyHlGtchyZ84Ilb1UtvoEyXK6xvHHH6PnsNtblfkVHedmI4xwSHbavL5JbPIAu6OCIcczJEstlFLHwj2a3TMtrzD1hCJtr8I2m1BcgHumCqGTMNM+ZXT3e8HWD2mANSObWKqj6h6Vvh4FeFUqVvXHfdlpjE1NX6y6x4MNJ0mdO20QLQKOlp1YKcnSjfTwnxWJIWzYoVDMWp6LBhnMyeVmCnnVAUEdBa11AtfSWPbvhvw2G4b1Q/BrwnYkcIbtzirsx8yq6GIMNR5xR559h6PtM/HrxlTGU+FYKJXvyV/nuQAHnJ2RcdjeGDjizj21VMbxKuqy7DjRcMndMt2vxq3SO12A6yvzO85f4xserzOA2FWsPzF1ir9IXHdN1/HNhhX5Yj8wFizcFHH1qYyrEjTllnHOFwFVkC0Zs2hbmX68pwkZ518AflJuu21srprml8igdNzIaYFQCoeuRcdx2viG02ky2UJc8eX1jZGEer2vtMo2cQXjAWsl5ljvZ6zmLbzGdrJIG6fmO5e2zGhPNH7O3ZV917wahZ7Aa3wqVfdivOWePKYA4eaGa6TGpvtUbgsZwjphen4hsM90wlGqFo6l/BCp0HVonOWurNw2VyxvvLAWTf6VcBE4BG0wAeNWkNjtPzk3XY1fYPYfYKnpNYsjB2LRxjkXwDkwY3120NU6TJew8a13na77tNpvWKs6hRRWXNzShkycmGTVg4pghUuJX5QcPKxc1hKGb96elQjtPHxmMxmPjO6wDKxSzPIQq8Kl3ZsbBWD3iBw+N/FbjnsNx8I3GaQ2Ec1y2x3vsfUJl5V38vtAE/wCwJTIqTzSZo4JkdvipiIdY4nlX4J+K57SOwwlucc3xfqYAEt69wYMx1jRm9323xs12PgGw3GXDYTMhxyZWqX7Jl9RI4bcX/JpiuAaxWaMBVjd6BhcdDCexTUhylg+Zot9vI2Y7Dww8SvDdzSyggRxLAGg/mnnBDSsLXm8JaeQeSVEBqxdRsPn7R3HLcfwGuwyjs0nCCRzaPlwumZ+NmmlYX69UgQsjFxuz5IXsZGl+ZlbDzgPaA2X4p4z4btx+BJwJBw8HoBt7JLRzXGWFKpzLMhv5PGIxhnsdhGopeHBwe0LZZE4kqYYdfN7R0efwLcYhfzgRQuY8/wC0KNh+U+E7T8fri+8YhpRC15eTFgrVHnOORHpjVfkuGZsDgHSywul2sNx2u18A2kdhnuMXtSP4jRGUyf8AX/yE3feomOMtcrT2ZgBim96+IRbqJ5wqLmK9Owy8I/AfEZaYrnPF8jAjXpXB4kc5fUo4ARzjSvtXqcxxg0Xcx2bisErXDduz7objsNx8A3HYZ7NdmsosKOBML84EWwDFkZDiDLiRozVqOV+0ZBKGt53zOc+qrxYNNGDHYC7q5h6Owy/Lc/DYNQNB1Igdp+9ekSgUtKHiEcHhUt5eLkdYSFvUGu+Nmux8A3HYZ7msM3OE0/yEG+8quKoHxi6A8jT7ILhuJQczV4M4SHPXjU71AFT6sfKVccSmijPriS/kT5C5k/LfCZgJ0GVxhnOznuTAe8WBlvz9LbhUAAoIhllk18WZ5dnU4mr4A2a7HwDaR2Ge7qaZ4NYMxK2Vni+7848ephld+eRdCw5ZsS4udfiY6aysOycNgciH/gOPR0fOo2rJ3O916kHhD+A+EzMwD6BcTft/5O2GxbthMQY1yvab5mux8M3NNyt/u8bPhczmeCUcbZSlEIXp8B2NcqU1yXzqZgFjmKD3AnPDutQn+HPBM+93B/8AflquZ+U+Ew2Rr7qKvtHS4npSXB2Jj6/ZK9H4g8B2GSbDffD12m4bhbG3ajLrwpMmZ0JXlMwHCcubHITmldiNlXAtj8oecN+VXDMK/mUBkAIFVFLtFrPKUK0WvXl1HqQKwy2AdfyL8Nn/AGdCYtcSmIkejlggZ3ymLOe31QehUfyyJxGHSWiujo+cGrY/cX9VHfI7XwTwmspvFNZtn2fefJKSqeMdHMwPhNb4IDg0w7axE1fp94gOAPcgutOgWfUxVXCmpmIxUNyoydHueIPhX4jGWMcVHvpiwHe9iXSHKGSEFW3xKZTKe/l5DzmUbPgP8I7jsNj45l4D2i5QEim8Pr/jJ84QJY5JDyvg6vic5jnVaOh5PaY4hldc/ke0S5Fuai/Q85VeXPA+iop42vpo+tSnN5GBfLl4ty9y5fisEq1kgGcMZy5RdXpMOG4iL2SLPksCWY4XDZWTIvfOYvjHWsYYHmY3Oui10ozD5la7rua7Hd7bptNw3CUWJY8vj/k0dMHvtOUx3bgDsxdAGxS0f65iojxj9fcxec2nUH07SgPAwtLR3pTFoGqLG3EzGO9agrB+gJUydyx9LirnsuvubTgQq9YQSGviO6GHoRj6wVkYKN13Ha+GbxuuKiVNLM4pDWKA5oa4e8zC/esoOiw2fdJSYXi4QUKvzcMP8ivXJo9Ht7Sy3KVmWI2YSgI4gx92EiQWpBid5bA4ZXy9fzHayb2Iwk9K+tP96bW5kMELQLc1eJ4Z2PiG03DdQsGBocl7PKZtoKRNQNYF/PEHCWYLAVeTeTGGEq4v/vCYrQ9QxAvjR6CITkOUK6k5P0kZRftZ9TAcJdXPz95faJeD+zt+Vcs9UXAiyiUobestlFtXmFFNDscxT2nLkeOjymNobCi64ljG0dMjU64PeCyo3OVJ3j52O47jtfFNpHfIyq3JMEnGImf+i+5AMEsHBIXI1IWMBay5mfBcYfNWyvJ6wBrhXmDAYVPfmCj5R7GhrsRjKzXFoxGy+YI8i4UODbZ4cD6MGz8e4sUXrNBW+hlKXwDBwqKLo/hDtUDqFUwcVrjqQpHYWK+VREYKbjAZ9pSr/Ze4x3HY/gm6blXF4GegOZK9EGaX2eUdn5ityYOpACx0jUVowfV+JjaxQMuoPeIUHytD/XnMsVT5X9JsxPeiaBj2ZkIHD9nlM7q/7U68mX+Isu9mEw3yL1MEtSPFbv33EhyVjMx++iEn5FCy2wdJSyRbZ9YZkfziv79t13H8U3DcHNCopFvx4Zwxc+GMpBmDGzinsiP2zkKuDsiOLajc4tNvkH594BZhysGuGpyhUXBmjg+o7TSxsmWYBxbviLiE24p/lSgFatgtYwwxDi58Po2341y4wLYd98MMaaXNhicWcWdj0S7PQiQU0l5hryiLGmNUfZKviycBa+YrL2EadwjmcDCYkYfBrqPV0SfmNKzmAcBKJEH87i7l/iG08DDRe5zi5MyYOJpml53HCnQwT5l236f9sC49vUupH6OK0Hk+yXqF/LPpBJoayUPkmGdAeH8EyPWFzV9bLdWQtCB8HvvXLly5cuXLl7tdzCUz13vl5wQOaOK7E7rLApweJOcIGoA9GcqJgzDm1UB5qYzNjYFD5U0cNhMoscSABWmyvyHwTcNyjDPjgoadeDLM71GcM+jyhsQGTzOkTDbgB/B1gUWBYB1c+cyKR5vYnsZ84W2EheUXfmmcyBaliAI3ZdU/BVq0j/ti3TA/us1o59KfltPsy6VIHjJsFMNizGoF7u3NR+NhTg47t7T8J3zabhDYRQceEw5PvKVthfiTUyRiqeCfEZvD32RkxODwJx+JL6irJ1pbqc5bqVbvIeEIYfZu3L4ZQVOAFxOkEzp5Av4iLOPlQQZfjMU1sge0putjvAbA6SFrOuUKhHVbRoUYcTIiVLm5xJyEJxcL32EUe1M/eGW47jluP5I7Hbe16YDKJ0M8OspahkrzYipQSMcv87IfrGmnnKa+kKAeU4gHce97So2aQvskDsXb4n1EFjgDZR/xBpCtlabS5cuXLly5cuXLl7azCBa1Celd4J+REqoeZK6tXDjUA0R2+c9sB5ZTzc+Exsc0I++kqn7HzdwT2jRCdeb09DxH8g23u3sLni8U/rlHHAEPMcT2hU9taD5TAiNH5yvEGgS+5aWS71X5IghyHfhzrWdJgjvS/Wveu6jiiAbUAv2SHLrWgYXj1bjn8V4EYCw/pSV2IZfYQRxvden2tBLy5NG6MUv/AAVDOEY+JZ7swviZuzi/3DaG10Jwx/ejY5dKXACYoqRaplfJmTYYUjuQq4J9dFQXX3C6HeATN3Wq8XYu6/nXuXukXeevcVpMdiC410NXPKEh6z09uME2Gmq3afiDxoHmDINa5wsxazlOJk90GLOeEe0ooOZFbcc2x7RPHs1hfpB8w1sufLtt0o+kUdW1q9GDzOPqJg+cvHwt/MqdeTKnnkjgDk0H8aERpc3yLGMS61NW9Sgo5JEvw6aGu1b1z0Mbfn7bMUaXrH+kz5Gp1x+dlb7uP6E3lpAUiXcSksbJZ5/Soz/fAGcWXfEEJh8aqL7u8HBBQCghDVoMPnM7MBf9SP4+WHg6XHFGqX6RDMT5Uz37zhVVw+Gmtvw1mkGKrWdeAR0/YGLA6/EFp6g3CgoyIoWoEyUvJuat6iDyWLfqkyS2E495Vllt49iHwjdZFALxVXBvPgzBN4GXmfOUxo0A6he9eTDwogcA8B/KPCNwd65e9UG8DY+qrmtvtB67J9kP/hOsstBKPMKY2z3t54Y4JbuahgOBDxMgEISQDFWVjZVsoaB6HA9Br1gbjWnyghfe37rCwwnM+IzaHEL7QGgBy2U5VYYOk/EwcPLWHJme0x0RmVdpjDXC+X131/UG5fgXL3gsNBLmbkWX+3tAAKDImuWTEB4ov7F5Skgpa+asYIZnNwu3t4Dzj5Q5pid692/1ly9leBculAq0vN5XCraR3dh2lWqwaX1wIKhLRpxZ9eMZTWmh/wBY2PKINQtyfAqVtv8AXjv34Ld3e/rewoIjNMcJTb4NPQlFwxWTRez22KxwYHwHvEuc4vhp6VDfuXu3+4uXLNrWktDhbr3TFjOCqCKLDUnk4bKP/nkktpO6Jng6PElU1baq66vAlPNh4AVtuXy8C5f7S/DEZBgKbisjZgsZUqsgUeCy/wBA/nXLl7L372XL/wDgg2u08Kp//9oADAMBAAIAAwAAABA8IIIIIIIIIIII800kDwQwwwAU028844444444444w4AAAAAAABEAIAIQ4vDHGHnGMMwIIAIAAAAAAAAAAAoAAAAAAQXZAA84oI/3JPNJX0crZhooA80AAAAAAAA4AAAAAK/0jiedGapQOvPPf+ej7EWdDvaYOAACAABDoAAAAIGD5YNi7cjUGEUAARiEGOGZrJ+spQIAAAAATYQwAoI2ANsRMqc44FDzz77gEVvU/q4elk8AAAAgABogAIBp7IWMcA8jpVIo82cUujaLkUJ2FYcsIsAAAADaAIB4BXhU40i/LPuGAAA0ACOC2GljELs1yNo8AAABYAAGB2zw8PRHLBMQqJJJNKDApB2MUY57zJesYMIATKAEAYRTkoFT4cRrIAAAAAAAAAJQCYAdDrALY4IADAYAYRtS0s9kYsQAAAAAAAAAAAAABYR7tAXqEK0IAIBCKQO7VgBOn3iQAAAAQcAIUoAAAAALDTd1wrnICoAKYSoFyqL/NkpaAAAQ7IACAAAMAAghwgSmPePMadAKQBAJyDRJdi+GEAgwyoAAAAAACkwhwQv1Kr4CNagQIAAQJwhJAb9GMEAADAIAAAAAAATAAAC884WF0N49QIABQrQwocH3ZFsQABCUAAAAAACMAAAAt10pAMdDgAIAACIuahD2y1K0Axwww8gAAAzcwwCBkFPX2oHHQpYIKAIhPw8NT1OWJoAAAABABEIAAAAwqBtO6iYyzoCMAAIBUKSQBCIaweeYgAAAAAAAAAAAKsfZKgoNu6FCIIAJKKxLpE9I0FjERIaAACAABAAYsZhpZhIliBgCsAAAoAAEp8qUgH7nB1AeDagI4JiL5/nJhgTGLFtggIIAAJRAgMrOLFqmYZasIOQ8ACA8SOZlWsChwAzFwEIAAAJDCIDJbeiCbm8rxb/8A75x7b/BCE/sMKKeCYgCAAAACkEICIAeQvKXdZI2KN1IqP5YoVJv0aczACCAQgAAwCUE0oqKCkKzrYSCfjQTDYHxR3huOMxSsDACAAAAAQCwgQwwACAAHOC3wAMqXGCR2OIGtjkOzCCCAAAAAAQGcwAQAUgU+sehFOoQH4PBRxRQMATBCACAAAAAAAAACQMEMMMokgokKACAADOOv+ODQAAACCAAAAAAAAAAADHHDDLHDDDDDBxxvXBV15xlD7rBBBBjjHbTPTTDBF//EACkRAAMAAQMEAQQCAwEAAAAAAAABESEQMUEgMFFhcUCBkaGxwdHh8PH/2gAIAQMBAT8QvdpSl7FKUpfqqUpSlKUpSlL9QkWSYW78DNqsbL0UulLrS9FLpCfQbGCRzFcvzyLYpS9FKUpSl6KXVoc0feR4IqnlC1yW7+C6tjZSlL0UpSlLrYqzMDKm79FNPKLfs1/CH59lhaUulKXWlLpSlKUpS2nBocp/0F1cWPy/JYXuPOjOITVENvBP94Hkd3+gsFKUpSl0UpSlKIpSlELaFXJDuLcTudE+086z63xPtkljZpN+v+RG/P6SKMpSlGy6zWlEyl0pxER6Neefg28NbLyYmG9U72HpdE+c4ON4Td/VKs8CGXVeq9NKJiet4cXZjx7PXIsCL3KMtk3/AOjocN/1sX7evwPS/QJ6WIoylehdT0ej2FrN020RNHf8ZEu4Gxv6JPgtUFRN5k/6HZOW3oeHjh796rRdT0YzK2Ng7Oct/ozy2YQ+zSlL2Exr3OH4Oclz8+hCRtotVv0PR6pijubLZsizz4h5RX+j7167BsZLAndFoul6vRimrfYcqYp90xrXlUbo+7elCMybIxIxxOPksxJrdClqpdF1vpZ7yX2EZ+m/lSClWXifA78z7Mf0SGPPIuPI8oseF8ciTYotF0vRnGtB22fwLWJcr2eIC/fn9kOakkx9L7r2GIt02n9jYbRC7L1Yyq1q5RZrbbz8CXIZZ6YinwQdgvw/HVOmE6UNmyJln2LbL3HjSe2iF2XoxjPxifgbSmVH7Qidssp+VwLL+4IU5jsTsNpG2JGwxbsaHgaOTeGXX33fUulrpYoOArWQ2aGFE27yhnNMxS+G6vkbuDvUdp26P+CSDBsLVsMiaJC0XZekIQTHxvQlS9WzosTrWEX8j6OT/Y0jw8P14f2Kh5bZ/wCe42RLZNr8CGMIeb5FIWpJT2bCdM62tJpNErFRkfhoiGPKu4+pGU614+wtOzULzAjfCXZU5nEhC1YYxteGOhmaKjamL1EFdZNCUxohaLsv1o1pNOK/K8ihUbwxZ9sc/IwOnJe/8iY4+BJTlDEJ0QhzgaDvpDyJ1EnzPBBa8aITVaJdpp6TSEMBnscJpYzbLehj4RT+n59DbZ4XkYRIYMGCIiKipENeyv5Y8JG8o3Hhq/0JF3i0QL0JaTuTSE0aTMad8H/RZZamLw8BEsDwxbtfKp/5RxDfDG2F7kGzevBDeJH5Zvf5Bnn8n/sScSk034MaVojNbCYJrNEvo4ToiZBCyUnvPr/ZNLy8sTrzfPsSojTPkjJye3dVrPooNazppjyo2SxUwt/YyF4q/kWV0ZITSfTwnRBDUYxytjycx9SE6IT6KEIQhCE1g0QmiEIQn0dKUpSlKUpSlKUpSlKUpSlLpS6Uut1un//EACgRAAMAAQIFBQEBAQEBAAAAAAABESEQMSBBUWFxMIGRwdGxoeHw8f/aAAgBAgEBPxApSlKUpSlKXjhCcWTJkpSlKUpSlEP04QhCEIQhCEIQhCerR+i23jxG75fAhK4ITRCEJwhNEIQaIQhCei+KEK+RKzreWl0SWCNkEtEIJEIyiMojIQiIMNDQyaLBnmT0HwoQiG9kPdN3/wBcKgsJJe7f/BE0mhIgkQhCEIQaKIQgmQlo6F4mIg+J8CEiDugv/B2+pfJGhef2c/iiQkQhCaQhCDRNIQg1oaGSWTRbjY0Eho24nqhIRBXT09kLE4s91+iWMqdfLab+tBImkEF6IAmsGhhiVEcQxoxjROF6TRISJRLLxmj94hmWEC8J8Viv6us92EtEiEEhInFBrpoaGtZGJCjGk6bkhCDXA9EJCQkSHJEzXzGv4Zaoh9W8PpDEKmTs6L2EJCWiaJEIQhCEGtGhog0MxUYsh1vI0NDQ+BiEhEEtOsMeLs/lEiHSue7x/ApE8L97/RIglpCelNINDRMwWmBq7laaIMejHpz0QhaJCnMdeF+i3qjF3rT5qHeVxfdtiEtEp6sGtGtG7Z2ZlejoNUY0MesEhIQhIwTWTqjyb0HPkk8+hiVhnLonstSXFNEITiaINGGCa20asejQxrR6IQtEQ5yIdntf0SVqqW6tST+oY42/2TbX2JC4UhKcUXC9MmQMANRwYxj0eqFwEI9r3eH+DYMq9i0vhikPZ9iw/s58ReqZXyLUNZKh7j3AY9x6MeqFqmBbHPVGb2T79mv4Pz3SRclSpPwTTjv8Mf3/AA5pE2n5TjNvCvQfC9xMxw2yu7jnRm4ZzGPVC1YRMe7yX7sOrG6Mn1Yq+0JbG+bul/EJm8hPmM6OFP0G+HmI0LK0Y9THotE9EIQkTcj78v8Ao8OqjaWTRGHWuh4F8/Yol8lXz+invO0+65P94k+Fsb4WzYZlzFxNjp6HqYxl1QmIT0Iw33rr38iXbHcHg6edmKa9pNdH+nkacS+RNZG12Ec7PZ+OO6LxNjZLoyTFStxDakWwxvRjHrz0TEJ6kQHgGHbxrq87C+xYMOrqY+f8N0qWe6/5Bq/uAmrH8DjMNfD5r1aRswYWUxNNFp6UejYxjY9GIQhMT0YTHYBJuv8AzccXWKDz3Xdbpj1M5t/r+diC9n+IhSeVLk5vHdT3OTx/9F2E16NKIUGjJEGVV1W9KNjfA9EJiYmJ0QmMWw5raOe7LqmvwgV2Dw/M2FIJpJyUeFn7+RQmE2eq5P8AgxCRx0jzPBsALf1ezK1opUVF0UMZJUSZoWxhCVC1kbTZDDZRsejLq9FonRMTExMTJ1jWybp/nYmO4Zf5uZZN54NPrzeeTOVX0KtLz07ciZClIzjk/bZjWPeXs4xMpdaXRExiGsCpgJEN6GxsbGylG3wvW6JiYmJrSmeKt0nH7CZqFyc/oy2nfPtjcWVTrGl3XNdnvBx9taaq9n08imtXY7B4FKUJMtjsEmg049HnrEeKxLBlSG6UY2PhfAtExMTEyih1Clr7T7XMtfxHRgebht06JDZorz2e6/Bk3F4H8OD/ABq+zcvHZV/qKZTc5H8bEkbDfIe0hukVHRzCNTMSlndKNjyUbKXifDSlExMomUUKUp3BbTyPiBllpZIpjdnMA/Pdrr4G/md4bCaR5Q00DZSlGyl43xp6JlKJlLoTKZKJMNgL3bs/R+FluHnBgyLopSlKNlGX0H6N0pSlKUpVUOGEbEyyjk7v+/I6KUbKUpSl9J+nS6UuilKUpSjQulKX1IQhCEIQhCE0ulLx0pS8EIQhCEIQe+n/xAAqEAEAAgEEAgMAAgMAAwEBAAABABEhEDFBUWFxIIGRMKFAscHR4fDxUP/aAAgBAQABPxBGA1H5VcL6/wABP4xphLJZLJZLJZLIZ+f2n2le59p9p9oFf5Dd1Dbf4Z7/AMW4wdLlwzK0pdF+o04lOyU8SnZLdEvoESu9bly5cZ3Bly5cMy8Rc6XLlxeZ3Bly5cMy8Rc6XLlxeYS5z/ihk+P0T6PhXiU8Ez1BMtLS0S+JnqZ6mepTKWWloiEz0TPRPr4YmJiYmJjxpjXEr+TEr4fRNrZvpn+daijL1NaZWJUBuBKIfFhob/BLlEoiMqU6fUx0THRrjo0+v8ZgVrjuY7np0z5mfPxWoemL7i52i0cIgqOysNth74wuFxK4oIZUWJu2gvUte0t4uejC3eHKV4lFbQA+FQJULcz2h5SvMrzK8ww3leY47zCJK9/B2n1KvioxUZjuY70x3PuWdzHcx3MdwTuY7mO5juY7mO4oTHcx3MdzHcx3MdwTuY7mO4b/AB4/iWZi/wBS2CqgeEeTeH28QtKVuAhzsG+McwhatCm2C+hcDMC4UiTMuX3OILQH7AY0byncp3FIU122qtwc7yncp3KdyriIqdWi1C9KjFiOJccEtvaW9TEtufWl/H6l/H60s/mz3F4ZdwRa7lK2EguUHmh4u4n1Gu7msm21Ojyi9EDuANvchWkUVQh/qHlBRo3Ab3nvKOpR4mOJcuW9zfXjaVDbaPqVLVtAepS8QI441tDKXN1THiIPUcN5SMbvrTEQyqjzGX7g4i7g3oFfJL+dS2Ww+X3p96u0M7xSqC1YbtSVBBEZbVld04CmMGiwqXeLWQ/BQoAAx9Qj7R9gBcJQV+xbhaQMQDmY2l5l3o1U2QGCgK5lOmU8wEolEo0olEolHco5Y7kTxc9ZYmHMavTBL/JZVyjBjBKdLiJsNMOIbnm18DM1Q1R2UAWN632rYbz3LzmL+f6P2XeIHxx1MdTBCupjqY6hXURtAm/eEU04/I2+oZpdhbmvPIF7m0RU3Mx/TGYbTN5mH9wFl2wQo4inUVhfcplME8wUB1A1dDf5OlQalXnVJRyRHAS5yRLlMLmeoXBExEuLTUsSEs0vBVbeTub5KhZB/AT8s5mPNJF4QWmGdl6d4AMl9EPD2OSMX8tSvMN/4GHwIN4gG7N2VD7/AAQUwahwWID8x6kKV4Ih9SPLY1AKr+QnYeOXpeLGEohV6HebwPJEQJZLJeIfczxMzPMKnMQ+VSpjTMzzoS9KjuyxHiN1oYjGg2YJZldaMQ9tvCjZQFQ8DyGqMXb1LjewHAu4qxgVtA1c8twGwILq/wBgc/y/c+/6jt9/FZ1LPX8H3Sygqgstsu5NiWKcUH9r9h89sYJJ7xMawW7Jv/WPQxe6XVkNI+k/YtzEPEPCHhKxUuMplaG2YV+y3cpqA3qVK+IVK8ypTqV4lPcqt4vjRMzPmE20oiuMRvRYTJb2A3JyGY3riF29DcfDLEr4m0bwAE4vDJUt70z7Eqp2iszV4jYONxD1ehwQFmDSuf5bjttCcbTN7S3qX40d4FfClsQVLqLV1pYBHsWQbikvCt/oQz4z52L3iHMbAlHSdUfuHXXKjtyJZvMMaZveZ7iXKO4blZiuSGECpWlKSm5TQB2ykp5lEo9SncpETzM9TPUqUdT2loiuSIXvBip9Q50TxGkeBMW5cRg/QH+o5WJQWzWGM5szcUWvKaPnlwf1KB2FvGBHObP2FXRVlv4w8dsF3DaJmoz7+We/jnuO2pag3pXmexKeyU3vpZlhgolsU4Mw5Uj9qKRszlg1fKLOKTEDMg6Vd+vyStMLdhor9CXAfQhcI3Kzc4hegKbkDuY6lkM7Ss5lEzDVm8Zn4G8uZvSiJ1E0wsTMFHf4dInUGZWiiwAWh9z2Vww9iTPO1ZlA2kBgwgbd5LZ9XCeXmnal8IvJA1cIZNFN/wAmzQ+/nviJelKzKIzL56YE/EFF2v6UFLhk7GPQ7JoS/wCk6kjA9D0f2sQcXd/j/wCCcytCG0FStAveGNMwt0p6lO5SYJfiWTEU6j6hUpHzj9pTcbILolyjbOtEekbmephjhjiChj358xsH3gd1k9C2OAnmg/K2CIjApGAle6MJl2KdYLcQsAllb4ZzTuf+obYYxCDHyvxrfjS3ojBqXoaZ1HelkC24UGIl+qZ2j/tJgYF6uAZOIzboilXgpeTzFzcSMuq64LIOsYPK5Xats3zlXkQkK+tMbEACECBHQvmU1iGWYgQreNdwlvfwz38M8MrtLe5ZUoTaPSK7m0rSo2caJcStoSJG9QuDC5Qn+oDB5YtG0fjNiK2FtTmrqosdK4AZV8QNIsqGGnGd9kVm8TUR/hs1G/xt6IIaFoUYqC1UzZeE7/8A0QFaQjkVo8pYe4WIozIUNhQlHum+LaEZ4ev/AMMzFcDL6iiPDey2/wDlSMFw02TbY0q4e0wbQY7/ADp6lPUpuIynr5ijLzGvEcoE4jtCJqVbjiUQSjx3Fnbqf6LwVaYGxziMoyASpC0i1LB2xHVDHWzI+ILxyrIyUmXkFXa6g9cUmpL2JPZoe0ol52jGDf5u0x4jG4bw+AK6jMFR3iUXUPbOvVBLMFnZncSBUnKwqD+z4KQ6psF5aMNIUvZQqh4Mzc5P5sYvo/ZYBvUJzAmQhtMm0oDEVlZvRhAvEMsyiUVMVpz60ujSiI6lOowlfBMwszpE6jpipTFhEqJUPSFEZefO7o7s5g7j6gCwis7zHZylEttOjfqVBSHdqqPYge7hH8OoP/b55YBzOdo5Imb04/hMdHzEL30MsAqMd4WsUTJT4p2SrfZBw5R3W7fZf3OIzRy/2RBgMgsKoK9ANzf5T6kx3Wt2/wDAl+5xLVDbT6g5rEs2laY7nMLbwBK14lfCsV8XRBntEdKlT3MJElaCMBKgse/2LQmAWqx3jelnHRjDkpBJdD2mNLOJVFnujjqDCtSJiJWjtEz8/aOZTKYba0pjR2ganEzLgt3/AHD4ajXACX+48dS/GIPmh7TeV8NZ3NbULhyC2y0HCgLWP6ji1OQpySBa/wDCWpvDhP8AYsCyFEOYFxRa674h2JWdoGf8Nj0IlRhFZsqDUch70N5dzKuSkxedrKFYnYhZOGArkvteXiBRV3HEkqYXPicL8nMQKNYgIIHK3ZrGzGk9SmfUMkN6XGcx3+FNz8hFr4G+0NN5cYsNty5UOpnVk/2io7Ks5R4ALgXpjHv7KFYmAORhu4l7OaVRXoBjkjPv2D6K+obZxd+5j6R3xCBcwEvMV0FsAP8AIS5QYnOmblwcxu9o7wmVIfoLlfqcWwG9Ka96WG+PuJcOazRR7KboVbyeQjiGweAqfVp9aDMJcObhtpu2/gq9TeCtG+II1toLxABp2Pc4Fv8AShh/OjaMO6B8qJiRC0AH1U2wtQoH9wvUBsNGPcb/AEX6gx8MkN2hsYjklEogbv8Ay2C5m60dpsidRIDgiJuUS/7idQa5Pe3BujFM72Wy1AQRflZWOSPbELBatYJzkUJvGgv7m0q8xCf3FJ32wWFwU0F2vgUvLzVvUP6iJEqG0Ig/k2YxMXErRhp+xl9znQ3mBBuCKjvoOZ0lOowRcBKmGvwjrDhQWj0A5GW8RgQt9xYEViwtwsF+wfqVGkK9EYgq+OHd+kyTbiK4baC2BU5+Dtow2+HenPwdtGG3w7+FhEzKgQS6rQkR2SPBKL6yP2UUi+2EH2jGo4lqA6g7ogZ2aLIGP1y/9Kfg24meKutNWUeW37jONoV1PRBshwe9Rna/g6OgNOWoxHbMIGfuGJuyybDSu6mL/uALk63f2CaFfZCxg+0GG7LfpT6iH+yQAP8AbKOCE0Q0r1a/UeEmaAiqXzvzAFizN5cFsMfyFymV0ldJXSV0mb/lE4l4hvc3gqMuHSjmPMH9LOYZsSktlBO8bbiJBHZv1OqOqe27Ab24wwqkUlt4fEUPaW8ViqiSsQ0pcWPMTENC/JlnWu1hc5PgC4uJulNxVcS+lIhzo+vorKxbyPkyHlT+eogGQH5P9k2vDvj/AMjCCnm/Z9zYfKxeSfuVKT3+wzYjzibcQL4hXEXx/Fm8QUZzAOvkkoiNQ2/jwprgsyi01Km9gIcPDYBXC+ULegdu2jlDN+GBSFFE7H0hXpdyqfGl6bLlY0MTRsjv8XTZKuCtAuHUUtA/scNTtKsJ2ITOs/kjI9WOQCoCccKPIhr9Eo1FjOQxtOvSMQrTQDV3oiGiTcPRBwAov3zMihlbFaHWA+nUcz6TPiB6gfxgV8a+NRlM/wAQx8FTdVwef+ByoQCRQADTW7BPCueEDakFX9GA2gbXy5gM+4ly/pYQQvVe1Uy24YJVkNomTQbIQYQc6OSJmcaMvw6ONobQhvCctOUTMwjdDaVbHmNieLeRff8AaYSkafGd7jNLm+N5VXbcOqN1BRdxGKWFxTpT9lizA+R/zYuPI/ki/f5IFCkdk5n2y87sNv4OYwd/zC9XaEzG5mMzMwU+9Ke5lrWQbi64afsIRcYIqgA2K1FoHxlpD2Lq8ZTnGfjLuVBzThHp7m7ViZ3rQmEGjvq678aG0No7TbNk2TigmoNwLgvOQekH2kLSQDhCxhyaLCniXlf0+Isy+nqP+mI3OJ6uK9EjhW6jjc/7LC/3tr/s+oM3D4PxN/8AA338W9DU6LHO73sBMOECEcJCfaoJcwPu9InEWc1nB3LABuvZvcJZkfK5EiZpHh5lLLtUxP6tXZOQqeSbNcw1oMyJzUZa/lnvThHTZNkczEQjuaOh6riOndzzCNtA2YmYKywTcV3V/dGGnOD0h/2Bi4bZtn9EEAHLhqv+oLFnzRrKDJSoUNz7uXOaG2nMrzCV5leZTK8wVx/gDDHeZlPc+pnqfU+pnqN9SsZ1uJKwtAUK8n6IYrjTbW5uLBsTiWM8jRla+AtXtXPEciewEujkBTqzmUuANxzcq6ZQdrtFb2thBvYtbGwBA86PvTjqTE50HzN9btDabNNiG0dW2gunDD7WvT5iL7RadkeEePcLzh+ajaypT5ZPMKrPAKrIkVJEJncCV/caeGIDUC/o/Jd9xX3L7hkfC9fxXEdobf4TzO/m7aLiJMKVYhkTqoK1nixqq7s8OxHuXZbTgl4NV1bmK67SzbtLoW6G5dKgc9Bl4jjhazK/9IOAj+TmG+nDTdGO74a8yjuUdvwxdSbI7TahtOdbwrYmd0vr9LFBlCwlGmyOzw3H9EAzsjVaqwZ3WBbYOoYKBqixzGuB2kobV4ERjua6mGwe0v1Kqczo99Bf4SDPJ9uyj7zo3jTn5eIbH+DuY/GyWSyYSLgg8V0GxtX+0pjK5IZzcLr35DjdwhvWgRkVJR4WvDC1YhKA6qXlWgQGpW2GjyhzBn9dd83cJ/8Ak4m7HeBnThEgzcZy0B/Bw12zZGChCc6N7vEBYoqLvX4NP1LZUx1kj+fgJce4th2DL6cRhcSLZWHtVh5vmUk15oRCPgaPFQMZJmMonQ0fvMAH9QD+QRLQADGFQ+ieKjxU4NH5c/4Js0dobfPAjtV73C/oZxHP6Fwu1LpMIHI0BU3RhHj0Uai3yF1zoTsx314aE2M5RLlrr+A2lbRmcqPiENmqYhkZAkgsWPu4qWYRoUhc3cX7CC+QrYj/AN4+oWDcotEaPvD4YvO0ksoh7C/SX4rlWRLfb/bDE3pnIN/3cYQy9MtRzQsE53xDnAfTweEwk5iSvmbwf5naJcQ+DDbVjsiFrQB5lUsAC0lH/wAALAZp25gDUMkREoIy58gR+4EIFi1FiPJTpam9WO+htNi+NGO+r8SB056cpps1vxDZ2hYakfCKfc2C0VuWO0+ivMQ/bVxnfBRvJs+GVc3pHci8/wDJ5+KRRCvY+0ZNs3sD+oQ+sMSggHGI9qaFYJp2KSUm0kkpwe8v/ZUJpFhCsDyIn7H47fAaZZX8i1FLKhqaXjTmpdGYph+8T7D/ALGcFiUVflMrqGGAMG9V3GFzYQiMN2FwRSBXBkLuCsBRwCxPplIoaWV39QH6jbZIrcIz7H6iqDj3reIsv4t7+FeX4c6xzonMbi1IFKosBSjlhdmB8PqPWUimIoAyBK8ktbtpNdB/4IVmLnX7giF3XiG4AqZUIvo/FCZL4Z2X/sBgTCrr+yuRtmYy2wXVCFclkFSe275u3o+h8VDQ3ncVqcw3htLajtM3EcQf4MxXEVZzLbY7XOo7/F3jvERYQA5EHMxdYirI+ptdVDBDRbJUNTnQNQpgAds77y0cpodF3R1u9vDM4Pw/of3jvGnOmyVAXOYspo4ItvxzfwHRxFcPEuDTDRnEJYfVpBH6WI1GsKFKXyn6DZCAGFFidx2LrA6j8DuUEXZVwlTzsfKlXx4MNdrrZGOBEWcBfUVkid5wDESyekWtpO6bL4YGuOQiG9tt9t8l8DZjMYaFxvXN65hFOmL1LxcsnpEVglvemb0b0L+LEVGj9VQ1peACXt1HLXYSxXOCzC3TtJrHzgcb2MqQEBQEoVgNZzzLi4BJ9Mv+kZMXmyjhPZTL40my/Mwi6xXf5L62N3YJaKCpkAFeVtfc3bi6rNaG8dp2jFmO/wAMfBxMNUbR2ldypy1MTBlakXQ40AFRwI395igra9oOEN1OWSCEwF9aNLBwfzjwaLzSn0YViQdyhX3kj0w53lQAuJwFDsDHx5aV9o/+JUnKPQr/ANxClovoEGyHsPG2BKuLO6+A8nJk5+L8z5PzNKlSo4jFlVUUWspXhFm0oXigScQKJmIbQMSwO8trzlVZeO5YPtrW+Mw9/SBuavxSGXyxY3EeoXFhlsthdbTD3rnDHwo+N0xFaG9wjzPuKmXrxN4kHlop6W/qInzJbZDGw1uljaKECDrCm4Mvg3RcDcmhlJeRNGK3lsfbnZzHdKV6ILnvebadGbT2r4IDabWQ2B9LoriEWAQP2Q3/AMLuAPTh52j+ltXoAOuRw2dQ/wAtURcxibWLHIOP2DoJpatNPdW+0u4GZuGZ9qxNmoJLDG3OA0WoGLjDS14mCFdRaIrfvRVN9v5Btos5iXpfiO8ac6G9wH4Jcagbh+w6ilXFfo7Ub8+czI8XFA4K0etoucRxMZO4N1zeY7SJdVTZ9No6i9TCTyU4YD10RkLAUcwtKaNxB+lPuKdQe+V/xDU0lUoYNbFLvgDA2wdatWhscmbea2nrWvkyvlXyZWjRjf8AVADx23gDLD9SulOwS/W/iUJPJzeAOOyyKYVRwsv9v5M0RIWmkQ5QonTFYC1vHqniyC7KylXYNoBoVrDNQlWzGKApOFP9ehW1qFEwzOZUDEuG851GI/DHn90+9GEKIh21RqMQbfgRG+bBUHSKQJUVB3Nr9Z8DDrxvSCxE4iZZGAO4jiHIV2ZsAcOwHGHYhcQ2yt7I3AqP1zEEFe6I5xs+SUsHi5LakAM5uXH/ANsXEmB33Q9IRv7qS9lhvRttd7QEwHGGOB8Z/DaVCbO2pt8nf5m3yWoolRbxmWlTuFoulGzNUFWzEZrnrWxSVOOFfAyKKDNZs9zHE1DKWxNivJjdjzAtmG9VY/coaUm55jrt4/oP/kAlQrPNw70f9o2+CouZPjQIxW/Wmxjv8vr+9PR8SGTR1DMcQyQa4myMIlk6GECpk8J/28QVPxJasrxuXi9u5f2kEnq3D+wPaV0opKLeJW6g2OSI9bJM7ckTVO3YQ8hi6dFkazc9mGDuLe+6cS0+Wfd1UOOcx9hj9s/Df7LXFrvzeqN/7HHlmSTFA7vyE/JzASzv/CWnidLAZDvpUIwv6rnA/UTS5827k+qQ2NAuIeBbbqofYe6ST+oXEEBT2GAhYU2xC6faqd4M+5RwhwIy0LM4YXKlGGbGjFwRhXJAoj61V/hz38eYOqI5m3EcxBiWR0Fywew1Vm8da1oQW40mxdsMP0bOPMHLfGvEXHM/XIU/k3vzoWlqW1YXZyYsgy3kSjhS7JrfhmMdRQIOZzeeG5L0o5LNU7RQ75DCkAQsRsSP/QeMgr9pQ9xd4VHKaH2qFwEsiOQdpjpjpAQ4lkc7bD5HuVW0F7hG8uFPwNGEvuXHJES3DFSgGVcAe4SvGQEsKAICCblSibblXnJPv2EdIJwoO6+TuvcWIIoCt3p+t9RJFNsFzXwF/qEYbHkho2j1gs0o70K/ULH2qpPdtj1cyZuLC/qTEOo9xorbsZQz9I07g7Wt08q2r2zNVHrqXKDErmZ7gRjaWRfMTN3/AAczfmV5+S0+4ol8yjuY7g+YVU5mKxHJnsYp1aHQekHiWMS7fJhqgDZyZzLmVUx4I4/tcHieRkfawtAJ1QNqZp+otLBAp4scbG+W9SpDASh8lw/24nhRF4gp9CdQSgmXBVv6YEjdHbJivof3HDE4R4rIvBXpW4g4utb8waghmXFfAekyxPWNuIrC60Wo9Uy3VmvG5B9uCZjEUbQt8qP5D1MJlzYOSnNv2bnNiEfWUeBoF6MN8NxHcOk2uLtBtkdjgHNW8wzWGWcnQFCGOTrS0RvDguH9hMFcDgi20G0KI9aO8DG0Wp7mIGbi1BvRqO/8GfHw2aDpUIVqrI7XMHGi2t2m+Y2QyUwwoAv1DeDX9DxWzEMccEQymeXEVnjuDmK4YTtNlbicJMsHpJ022Dxx7R8Biiw2Kbf/AKXBtyrkCdQrhjKBmf8AJRaMcfcwTIbGIVQY2Fpp4zT9EBhZl3YV/u4FaBqN/C2G8fhjqDQKNttSuWMVjUV73+0ZQeg7D9R+ENoyvVsuPZZh9Q2aLIJZZdJZk8xBlIR0jX/JneiVgk/B/s3Io2rF/v8A4iVmBU4i5gdxU9xn+kWiOWVGO/8AgBuVobxaXFjMcmqRmWXRZljby4hkApc1QyeTErxNEDHYVG2+S8we1e06vuxDpQscX4uhHXltMxShlzs3N4xD22LYfg/cCrtXOBpDDltkf7mWIWDnu29xRtbDuQso+APAd4ofMCrYcXlzCem1eCP6CUQtL9TfmPuJ0T6fyfT+T6fyfT+T6fyBbeY77x9yzxFW0ynRSqbh/aTBzk3blcdcpxUJKwFXI+IERrAI/ZKzvMQcBztIkL7/AKGPmKqu15/uAubgW1g5AN9Wdy5lbOTehSropMR4IsMzBvUWd9aiqLvOlxfzMplMPgLWINs2ikuxKINBCAe7lYg8Y8R9MR7fbUzW2W3buUzUTyQgFvCkNmimW+n+RDHw/B11D6GMbIx2fYKnlCM2gKyMd0P/AA9Q40BymMr2fDK6yxg2yt5Ht3iAl3Bz1SF2vkeZQgpFedY9NRKyQWpaWlpe8xzx8fvLy0tIr3UHFzxw/pAgANAfoqNmHcJH9hK7r3oY0gbVZZBuLUZRJy2M654PuZgfF232xamNsrXJsayrHkgLHkqs3oX+fSFBVOO/CAYA3mvJBxDMUIqvjQzAoigURV30WW150z8X+LOo0RXPrQo1LviJZtLzVRvqCOIN+INYqI29ztc8v7gQ8oaN6FR9O6gNLE1QbLBzC9vWKR6zqEtuQwPoiAWUmCemGADgGrzKLeTaCPR9ENkERDzzG1WUA9Q5+nEDx2VjdK/WpdmlNftsTxsBECs7APsRfyDVpcjK/FlY8rR/sjozYf8AAE9yGp+iAABHZHDHeta5cHcGs1pi+2Ijfxf8Cv8AU8UA/vYMCg23P6EDbNwZH4StYEBbLgoXZ+IaPVHCTS77/doNl4ORV/qCCCXQRCgEtMnMf7IKeRaX93Lfrb9JXIPYwZwlIbcMAvtv0yplExfOfI5WKEs2KjbzCVLriLGjiLFzM9y/Uv1L9S/Uv1L9S/Uv1L9S/Uv1rz/GWl4m5BSAWV5+CZl4bQHD3i/3s4mFXAsK0A20Vha/qJI2xX+W30zFbI+ooGdufEHCRoeIGsD3LS7pgjYVsN99h4zFS3xTw1mlO0ECwsu9Ly+y5ZmeASLEhka9uUbJL3/8RI43xVqRZWtnC/bg0J5rA+xRM+TAAe5t6mXdUuXl/ohHF7Q/hie6TzEbWxYObG29CviYMh0q7S38hM0Th9OFB9S6d+an6r/sJyrFsw9Ce7f+wUp12WXRZoFjYHjiDc5jb145Aw8P+nQSrNrpppUXAkA4Tf8AuN2pujXbLxmNJGZuoFRVFWc6KXb8WHyfqfmrLl4lzDoB1peddoOYONVLIkaOITNxBOKcDuIzLKt5bYQ+0O+QAAetD9jgfMaCbbQY6tyo3S9yvKfUCRwMDoDEZh6xt2BJfHSo3b0bZ+RfUQ9xgjtA48Sgm4BV6/6JwHhgf+yKAL3LbX4xwCPTPbh/cKLjYflLuVe+wi0SgR0ey+tvEXw6+44TK89MQded0y/Bx/cADrABxGA1lVqoshDj/iubD7a/2Eer1YP9seBZ2wIYAAwlNm4BXuY1FgH5sL4LY2crQL9mPuE+e+rS7OA54M8MCJP4+WLlOha4Zb84a7i9IyeoeEJaAA/Cbf8A7FuU9yoHEqY3ijosXGmOv8FJxqXMHTn43iKetMm07IUyqMapFGZvljzpWdoWEtnhiqfxJyYRC9uce1CV/wCmRBi3mu9Fic3sIB4wB+sD9C9laVQ1F4sIjMmlKXA8du7Bm5QaAhc1sKAjt7ejXo59wKuMluzjbIUa0WYPpP8AbD4ocg/shkJsV36wdPtv0ItCJ1sCgiKRWYwUG7MOS+VniLHO14YG0r35RaasNtYzml7jjuCniI7WhWBhmtsnLBXepXqU+IGYHcwRKxM9TjR8S/4s+Pi7S/MdXbSvOpvo1oOPh6g8dxcS9LTaC5l3PuOu0t7grq2Ud7jXxYiAqrQHLC+zQZRRflf0IXA9AUBAIBtNiDyJRxXX/wAO49V2aKo1QyW0gBUs/Hew3lzmV5HWt1MTEuLiG9g3jJNtk5nsTeEDzEh5igaF1WMX/g2dRlErxGjiYrbUqNS/EOohKJnqZ6mepnqZ6hiCQbYZ1uuIZUw9Jvzo5qVmcacy5zHCK3TW4bb0cu0hUNocr3/NpileI7jnTOAuyqPbsMxkcxhRZ5Y8opd6Vu6WP2UD3Bt3AR/Eg3Le/iiy8Eby6il7y0cwK0XraLnS3uW9/wCDXxqUSiUaUSj+QGDfwFIRcolEqUymVUd94gQb6P8A4n+4bHqCW6K0rZ5VA9w5EwJlTIeho/eZt4EgfAuk/uQrQTHF7j5Gx9R3ZygzSqpmhAeVLEw9pUpgdyiUR3iZbv4LUcIuL/yPco6mLuO8Nn4DOdKjcya5JTMxHUsYLBzUs+DvcFuehoNy4ol3LIxF9OhFI8U54QjT7z0HYn9kcihTo8N7AcXlW5ZcBMk/KBryYR8ErKI5sujXYcincqH/AOVKXdQpEDltreV+vs2YH4SzqCbXMHGZfpLhfPwsixiz/kff9Rme5mt4lfxLFuEMR2uXLly4sv4CNpeZcv4p1LY5Kn9dkJBTEV71CjNCewMIHKhQ9BtLZmHwuXFTcy5/z8fIfJ2hvrxob6cTn+AYNTdpyiwEauWQTxGrglbxQwVKS9Rbn2/y40s8/CzzpZ5+ONLPOrLPPxTMDOlRJUqVKiQJRKIkolEqUSiUQJR/EYi9y5cuXLly4uIXUz//AAn515/jvSzW5etkrzD7le4aV5ZXl0qVOJUqVKlSpUrT7dGfsPcryyvLK8srzGV5dK8sryxIe5m4Yj7leWV5ZzvG4GleWV5YkPczcMR9yvLK8srzLeyJXLK8sryx96Pv4h5ZXNsDG7HbeH8leWV5ZXlleWV5leZXlleZXlleWV5Y+9HbeHuV5ZXlleXQleWV5ZXmV5ZXmV5f5smVndgXywUb6JzcN8ys7s50OcznXMN57M//2Q==','super_admin','a075d17f3d453073853f813838c15b8023b8c487038436354fe599c3942e1f95',1,30);
/*!40000 ALTER TABLE `sys_configuration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_child`
--

DROP TABLE IF EXISTS `sys_menu_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_child` (
  `menu_child_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_parent_id` int(11) unsigned NOT NULL,
  `menu_child_name` varchar(50) NOT NULL DEFAULT '',
  `menu_child_url` varchar(50) NOT NULL DEFAULT '',
  `menu_child_icon` varchar(50) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`menu_child_id`),
  UNIQUE KEY `menu_child_url` (`menu_child_url`),
  KEY `menu_parent_id` (`menu_parent_id`),
  CONSTRAINT `sys_menu_child_ibfk_1` FOREIGN KEY (`menu_parent_id`) REFERENCES `sys_menu_parent` (`menu_parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_child`
--

LOCK TABLES `sys_menu_child` WRITE;
/*!40000 ALTER TABLE `sys_menu_child` DISABLE KEYS */;
INSERT INTO `sys_menu_child` VALUES (1,1,'User','/user',NULL,NULL,'2021-07-06 00:00:00',NULL,1),(2,1,'Department','/department',NULL,NULL,'2021-09-22 00:00:00',NULL,1),(8,1,'Section','/section',NULL,NULL,NULL,NULL,1),(9,1,'Role Section','/role_section',NULL,NULL,'2021-09-22 00:00:00',NULL,1),(12,5,'Puppeteer','/puppeteer',NULL,NULL,NULL,0,1);
/*!40000 ALTER TABLE `sys_menu_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu_parent`
--

DROP TABLE IF EXISTS `sys_menu_parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu_parent` (
  `menu_parent_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_parent_name` varchar(50) NOT NULL DEFAULT '',
  `menu_parent_url` varchar(50) NOT NULL DEFAULT '',
  `menu_parent_icon` varchar(50) DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `is_system` int(11) DEFAULT NULL,
  PRIMARY KEY (`menu_parent_id`),
  UNIQUE KEY `menu_parent_url` (`menu_parent_url`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu_parent`
--

LOCK TABLES `sys_menu_parent` WRITE;
/*!40000 ALTER TABLE `sys_menu_parent` DISABLE KEYS */;
INSERT INTO `sys_menu_parent` VALUES (1,'Administrator','/administrator','cil-spreadsheet',NULL,'2021-09-22 00:00:00',NULL,1,1),(5,'Puppeteer','/puppeteer','cil-contact',NULL,'2021-11-10 03:44:32',0,1,NULL);
/*!40000 ALTER TABLE `sys_menu_parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_section`
--

DROP TABLE IF EXISTS `sys_role_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_section` (
  `menu_role_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `menu_child_id` int(11) unsigned NOT NULL,
  `section_id` int(11) unsigned NOT NULL,
  `flag_read` int(1) DEFAULT NULL,
  `flag_create` int(1) DEFAULT NULL,
  `flag_update` int(1) DEFAULT NULL,
  `flag_delete` int(1) DEFAULT NULL,
  `flag_print` int(1) DEFAULT NULL,
  `flag_download` int(1) DEFAULT NULL,
  `menu_role_type` int(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`menu_role_id`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `sys_role_section_ibfk_2` FOREIGN KEY (`section_id`) REFERENCES `user_section` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_section`
--

LOCK TABLES `sys_role_section` WRITE;
/*!40000 ALTER TABLE `sys_role_section` DISABLE KEYS */;
INSERT INTO `sys_role_section` VALUES (14,1,1,1,1,1,1,1,1,NULL,NULL,NULL,0),(15,2,1,1,1,1,1,1,1,NULL,NULL,NULL,0),(16,8,1,1,1,1,1,1,1,NULL,NULL,NULL,0),(17,9,1,1,1,1,1,1,1,NULL,NULL,NULL,0),(18,1,11,1,1,1,1,1,1,NULL,NULL,NULL,0),(19,2,11,1,1,1,1,1,1,NULL,NULL,NULL,0),(20,8,11,1,1,1,1,1,1,NULL,NULL,NULL,0),(21,9,11,1,1,1,1,1,1,NULL,NULL,NULL,0),(22,12,1,1,1,1,1,1,1,NULL,NULL,'2021-11-09 13:01:49',0);
/*!40000 ALTER TABLE `sys_role_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_status_information`
--

DROP TABLE IF EXISTS `sys_status_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_status_information` (
  `status_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `status` int(2) NOT NULL,
  `status_description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_status_information`
--

LOCK TABLES `sys_status_information` WRITE;
/*!40000 ALTER TABLE `sys_status_information` DISABLE KEYS */;
INSERT INTO `sys_status_information` VALUES (1,0,'DRAFT'),(2,1,'ACTIVE'),(3,-1,'INACTIVE'),(4,-9,'REJECT'),(5,9,'APPROVE');
/*!40000 ALTER TABLE `sys_status_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) DEFAULT NULL,
  `user_email` varchar(100) NOT NULL DEFAULT '',
  `user_password` varchar(255) NOT NULL DEFAULT '',
  `section_id` int(11) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `flag_delete` tinyint(4) NOT NULL DEFAULT '0',
  `updated_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`),
  KEY `section_id` (`section_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`section_id`) REFERENCES `user_section` (`section_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'gesang','gesangseto@gmail.com','a075d17f3d453073853f813838c15b8023b8c487038436354fe599c3942e1f95',1,NULL,'2021-09-30 14:32:36',NULL,1,0,0),(10,'Test','test@gmail.com','af91813db40db198d5303b9c2219c082',1,NULL,'2021-09-24 15:33:43',NULL,1,0,NULL),(12,'admin','admin@admin.com','a075d17f3d453073853f813838c15b8023b8c487038436354fe599c3942e1f95',11,'2021-09-25 20:54:19','2021-09-25 20:54:41',1,0,0,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_authentication`
--

DROP TABLE IF EXISTS `user_authentication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_authentication` (
  `authentication_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `token` varchar(100) NOT NULL,
  `expired_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_agent` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`authentication_id`),
  UNIQUE KEY `user_authentication_UN` (`token`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_authentication`
--

LOCK TABLES `user_authentication` WRITE;
/*!40000 ALTER TABLE `user_authentication` DISABLE KEYS */;
INSERT INTO `user_authentication` VALUES (16,1,'a77ba49574c9f637fe93aea91ef11c9fbec234822bacd13088c6132dfdc2902f','2021-10-24 15:01:25','2021-09-24 08:01:25',NULL),(17,1,'6d14e6bdbcb139fedeaa4c37b192c79e1fdbb0782530eaf7ce62a8510ffe282c','2021-10-24 15:09:11','2021-09-24 08:09:11',NULL),(18,1,'ac3f367c3624de5ecfb5c041c095c85278004345388f4f8d581f48643c7cc550','2021-10-24 15:14:15','2021-09-24 08:14:15',NULL),(19,1,'818d2c6baea706901b9b8a515355f12e7772decefec96ae27155f9dcb298666a','2021-10-24 15:14:34','2021-09-24 08:14:35',NULL),(20,1,'cdadfb9828f1361b90079d6f1b19ad2f8c27319d283dde4afb95c7627ad8d62e','2021-10-24 15:15:02','2021-09-24 08:15:02',NULL),(21,1,'6ff228a1bb2b79d68dc7a23e519cc0ed9a6b0d44a8ac71fc058462c14cf318a1','2021-10-24 19:51:45','2021-09-24 12:51:46',NULL),(22,1,'5e4a95a512efb46402c99e62d58c71b383116e7621f5c10464292e5374d92e4c','2021-10-24 19:55:35','2021-09-24 12:55:37',NULL),(23,1,'c5f1d0286cce98c9ea3af11e1ac47b485e14511215ab266e0db888286b20300d','2021-10-24 20:42:49','2021-09-24 13:42:52',NULL),(24,1,'9975beb601cc16f4daba73ed00458da283c7003372a4458a111485d947d38bad','2021-10-24 21:42:13','2021-09-24 14:42:16',NULL),(25,1,'9f6793f0094cc5cae1f8b87ad8f1f6a468a022a78d4f5c7fbd7357238897c69b','2021-10-24 22:07:15','2021-09-24 15:07:18',NULL),(26,1,'cef86f12ec82aa273b3e2efe97e1f7e302a9ed9efc7cac7cb2956d0743aa2edd','2021-10-24 22:15:58','2021-09-24 15:16:01',NULL),(27,1,'d3c64a6ef95942d05ddebc3a586c16618ba44e7375fec03884c7c457f6247fad','2021-10-24 22:22:55','2021-09-24 15:22:58',NULL),(28,1,'5ff9c37f2a8d68a8181d3fc5c9377e9afa9d8893d6dc0cd5041203e171bc4057','2021-10-26 05:35:39','2021-09-26 05:35:39',NULL),(29,1,'a219be2ffd5be9c0dd9696a649097a10c35de7a0a50c3a2f36e5953712f5bfdc','2021-10-27 08:49:36','2021-09-27 01:49:37',NULL),(30,1,'6067aa46f2a5b979e62e81a39c0e5b8032343c8f5aecbcb6d2b260ee3a29e5f7','2021-10-27 09:24:44','2021-09-27 09:24:45',NULL),(31,1,'6d671bf84363378a5bb48f89c696c8e74a1be501e0b282fcd2452791322a98fc','2021-10-27 13:10:39','2021-09-27 06:10:40',NULL),(32,1,'a96c2204a8f5e7ad531c2c967863f304b3e8ea24d6d00d8df688387366bf37b1','2021-12-09 13:44:52','2021-11-09 06:44:53',NULL),(33,1,'034c3b4069b85cfe2fd9f0e23f5c1149f72017ab85686c4de4fa55846c1a459b','2021-12-09 19:57:57','2021-11-09 12:57:58',NULL),(34,1,'00e1ce680556cf0f347f421dfa6c6ce7ef98bbae9863d1ea3d08198d7ff4f88b','2021-12-09 20:01:25','2021-11-09 13:01:26',NULL),(35,1,'c06fe5c5652d2c2cd037804993265fe19936c63a8f6b755a4a67ac582e5057ce','2021-12-09 20:02:01','2021-11-09 13:02:02',NULL),(36,1,'c8ea36ed70d3fa2d798110662cd9bc8a4e5278f230cdeff54ccd764a26a5a5b5','2021-12-09 20:50:23','2021-11-09 13:50:25',NULL),(37,1,'92a36e3b1673a1798d0c65d28b562386df7414298cec4f27ac949b586e7e90de','2021-12-09 20:52:51','2021-11-09 13:52:53',NULL),(38,1,'3e718725809c92df183ddbbf51b40c8c646a30c1787d27d0cd1765ac9f57cec7','2021-12-10 08:38:49','2021-11-10 01:38:51',NULL),(39,1,'b50e5aaf4d8bf628dbab717c66d2d7e63aac781b2f0bf7c42386a691d3a180fc','2021-12-10 13:31:01','2021-11-10 06:31:04',NULL),(40,1,'0df6ea9fbe84181243e2b25aeb7e1a1b589022de79bdef3ad94c188313f1c94b','2021-12-10 16:12:45','2021-11-10 09:12:46',NULL);
/*!40000 ALTER TABLE `user_authentication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_department`
--

DROP TABLE IF EXISTS `user_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_department` (
  `department_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(50) DEFAULT NULL,
  `department_code` varchar(20) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`department_id`),
  UNIQUE KEY `department_code` (`department_code`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_department`
--

LOCK TABLES `user_department` WRITE;
/*!40000 ALTER TABLE `user_department` DISABLE KEYS */;
INSERT INTO `user_department` VALUES (1,'Information Technology','IT',NULL,'2021-09-25 20:52:22',NULL,1),(6,'Warehouse Operation','WH-O','2021-09-17 00:00:00','2021-09-17 00:00:00',NULL,1);
/*!40000 ALTER TABLE `user_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_section`
--

DROP TABLE IF EXISTS `user_section`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_section` (
  `section_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `department_id` int(11) unsigned NOT NULL,
  `section_name` varchar(50) DEFAULT NULL,
  `section_code` varchar(20) NOT NULL DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `created_by` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  PRIMARY KEY (`section_id`),
  UNIQUE KEY `section_code` (`section_code`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `user_section_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `user_department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_section`
--

LOCK TABLES `user_section` WRITE;
/*!40000 ALTER TABLE `user_section` DISABLE KEYS */;
INSERT INTO `user_section` VALUES (1,1,'Development','DEV',NULL,'2021-07-06 00:00:00',NULL,1),(11,1,'Support','SPRT','2021-09-25 20:52:42',NULL,0,1);
/*!40000 ALTER TABLE `user_section` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'puppeteer'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-10 16:15:29
