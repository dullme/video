# ************************************************************
# Sequel Pro SQL dump
# Version 5120
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.22)
# Database: video
# Generation Time: 2019-03-24 16:16:00 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_config`;

CREATE TABLE `admin_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_config_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_config` WRITE;
/*!40000 ALTER TABLE `admin_config` DISABLE KEYS */;

INSERT INTO `admin_config` (`id`, `name`, `value`, `description`, `created_at`, `updated_at`)
VALUES
	(1,'recharge','on','当 Value 为 off 时表示关闭充值，否则表示开启','2019-03-24 20:39:55','2019-03-24 20:44:05'),
	(2,'appid','XVxcxxrxxVcCC5C6A88CAEC21FA3C93E','充值的 appid','2019-03-24 20:40:20','2019-03-24 22:03:00'),
	(3,'secret_key','asdasdsad','充值的 secretKey','2019-03-24 20:40:42','2019-03-24 20:40:42'),
	(4,'alipay_real_name','*中山','收款支付宝实名','2019-03-24 22:02:34','2019-03-24 22:02:34'),
	(5,'announcement','超经典科幻大片重启！百分百必看','公告为 null 时不显示，否则显示输入的内容','2019-03-24 23:16:53','2019-03-24 23:18:09'),
	(6,'login_image','http://video.test/storage/1-1.jpeg','登陆注册页背景图片','2019-03-24 23:38:25','2019-03-24 23:41:11');

/*!40000 ALTER TABLE `admin_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`)
VALUES
	(1,0,1,'首页','fa-bar-chart','/',NULL,NULL,'2018-10-06 03:44:17'),
	(2,0,9,'系统管理','fa-tasks',NULL,NULL,NULL,'2019-03-24 23:14:42'),
	(3,2,10,'管理员','fa-users','auth/users',NULL,NULL,'2019-03-24 23:14:42'),
	(4,2,13,'角色','fa-user','auth/roles',NULL,NULL,'2019-03-24 23:40:36'),
	(5,2,14,'权限','fa-ban','auth/permissions',NULL,NULL,'2019-03-24 23:40:36'),
	(6,2,15,'菜单','fa-bars','auth/menu',NULL,NULL,'2019-03-24 23:40:36'),
	(7,2,16,'操作日志','fa-history','auth/logs',NULL,NULL,'2019-03-24 23:40:36'),
	(8,0,2,'会员管理','fa-bars','user',NULL,'2019-03-23 14:44:16','2019-03-23 14:44:19'),
	(9,0,3,'视频管理','fa-bars',NULL,NULL,'2019-03-23 14:47:02','2019-03-23 14:47:45'),
	(10,9,4,'视频分类','fa-bars','category',NULL,'2019-03-23 14:47:20','2019-03-23 14:47:45'),
	(11,9,5,'视频中心','fa-bars','video',NULL,'2019-03-23 14:47:33','2019-03-23 14:47:45'),
	(12,0,6,'付款管理','fa-bars','project',NULL,'2019-03-24 19:37:03','2019-03-24 23:14:42'),
	(13,2,12,'系统配置','fa-toggle-on','config',NULL,'2019-03-24 20:01:44','2019-03-24 23:40:36'),
	(14,0,7,'意见建议','fa-bars','suggest',NULL,'2019-03-24 20:09:18','2019-03-24 23:14:42'),
	(15,0,8,'充值管理','fa-bars','recharge',NULL,'2019-03-24 22:50:17','2019-03-24 23:14:42'),
	(16,2,11,'文件管理','fa-file','media',NULL,'2019-03-24 23:39:44','2019-03-24 23:40:36');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`)
VALUES
	(1,1,'admin','GET','127.0.0.1','[]','2019-03-22 22:04:52','2019-03-22 22:04:52'),
	(2,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-22 22:04:54','2019-03-22 22:04:54'),
	(3,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-22 22:04:57','2019-03-22 22:04:57'),
	(4,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-22 22:05:04','2019-03-22 22:05:04'),
	(5,1,'admin','GET','127.0.0.1','[]','2019-03-23 14:43:55','2019-03-23 14:43:55'),
	(6,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:44:02','2019-03-23 14:44:02'),
	(7,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u4f1a\\u5458\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"user\",\"roles\":[null],\"permission\":null,\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\"}','2019-03-23 14:44:16','2019-03-23 14:44:16'),
	(8,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-23 14:44:16','2019-03-23 14:44:16'),
	(9,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-03-23 14:44:19','2019-03-23 14:44:19'),
	(10,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:44:19','2019-03-23 14:44:19'),
	(11,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-23 14:44:20','2019-03-23 14:44:20'),
	(12,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:44:21','2019-03-23 14:44:21'),
	(13,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:44:23','2019-03-23 14:44:23'),
	(14,1,'admin/user','POST','127.0.0.1','{\"username\":\"admin\",\"remarks\":\"admin\",\"expire_at\":\"2019-03-23 14:44:23\",\"password\":\"admin\",\"password_confirmation\":\"admin\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-23 14:44:35','2019-03-23 14:44:35'),
	(15,1,'admin/user','GET','127.0.0.1','[]','2019-03-23 14:44:35','2019-03-23 14:44:35'),
	(16,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:46:54','2019-03-23 14:46:54'),
	(17,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u89c6\\u9891\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\"}','2019-03-23 14:47:02','2019-03-23 14:47:02'),
	(18,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-23 14:47:02','2019-03-23 14:47:02'),
	(19,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u89c6\\u9891\\u5206\\u7c7b\",\"icon\":\"fa-bars\",\"uri\":\"category\",\"roles\":[null],\"permission\":null,\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\"}','2019-03-23 14:47:20','2019-03-23 14:47:20'),
	(20,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-23 14:47:20','2019-03-23 14:47:20'),
	(21,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u89c6\\u9891\\u4e2d\\u5fc3\",\"icon\":\"fa-bars\",\"uri\":\"video\",\"roles\":[null],\"permission\":null,\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\"}','2019-03-23 14:47:33','2019-03-23 14:47:33'),
	(22,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-23 14:47:33','2019-03-23 14:47:33'),
	(23,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11}]}]\"}','2019-03-23 14:47:39','2019-03-23 14:47:39'),
	(24,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:47:39','2019-03-23 14:47:39'),
	(25,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11}]},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-03-23 14:47:45','2019-03-23 14:47:45'),
	(26,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:47:45','2019-03-23 14:47:45'),
	(27,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-23 14:47:46','2019-03-23 14:47:46'),
	(28,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:47:49','2019-03-23 14:47:49'),
	(29,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:47:50','2019-03-23 14:47:50'),
	(30,1,'admin/video/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:47:51','2019-03-23 14:47:51'),
	(31,1,'admin/video','POST','127.0.0.1','{\"category_id\":null,\"name\":null,\"url\":null,\"hot\":\"off\",\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/video\"}','2019-03-23 14:47:54','2019-03-23 14:47:54'),
	(32,1,'admin/video/create','GET','127.0.0.1','[]','2019-03-23 14:47:54','2019-03-23 14:47:54'),
	(33,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:47:56','2019-03-23 14:47:56'),
	(34,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:47:59','2019-03-23 14:47:59'),
	(35,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:48:00','2019-03-23 14:48:00'),
	(36,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:48:02','2019-03-23 14:48:02'),
	(37,1,'admin/category/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:48:03','2019-03-23 14:48:03'),
	(38,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u7535\\u5f71\",\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/category\"}','2019-03-23 14:48:13','2019-03-23 14:48:13'),
	(39,1,'admin/category','GET','127.0.0.1','[]','2019-03-23 14:48:13','2019-03-23 14:48:13'),
	(40,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:48:16','2019-03-23 14:48:16'),
	(41,1,'admin/video/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 14:48:17','2019-03-23 14:48:17'),
	(42,1,'admin/video','POST','127.0.0.1','{\"category_id\":\"1\",\"name\":\"\\u6d41\\u6d6a\\u5730\\u7403\",\"url\":\"https:\\/\\/hkwycc.com\\/v\\/V2eiXtAg\",\"hot\":\"off\",\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/video\"}','2019-03-23 14:49:41','2019-03-23 14:49:41'),
	(43,1,'admin/video','GET','127.0.0.1','[]','2019-03-23 14:49:41','2019-03-23 14:49:41'),
	(44,1,'admin/video','GET','127.0.0.1','[]','2019-03-23 14:49:54','2019-03-23 14:49:54'),
	(45,1,'admin/video','GET','127.0.0.1','[]','2019-03-23 14:53:43','2019-03-23 14:53:43'),
	(46,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 15:08:28','2019-03-23 15:08:28'),
	(47,1,'admin/category/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 15:08:30','2019-03-23 15:08:30'),
	(48,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u7535\\u89c6\\u5267\",\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/category\"}','2019-03-23 15:08:38','2019-03-23 15:08:38'),
	(49,1,'admin/category/create','GET','127.0.0.1','[]','2019-03-23 15:08:38','2019-03-23 15:08:38'),
	(50,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u7efc\\u827a\",\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\"}','2019-03-23 15:08:59','2019-03-23 15:08:59'),
	(51,1,'admin/category/create','GET','127.0.0.1','[]','2019-03-23 15:08:59','2019-03-23 15:08:59'),
	(52,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u5a31\\u4e50\",\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\"}','2019-03-23 15:09:03','2019-03-23 15:09:03'),
	(53,1,'admin/category/create','GET','127.0.0.1','[]','2019-03-23 15:09:03','2019-03-23 15:09:03'),
	(54,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u65b0\\u95fb\",\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\"}','2019-03-23 15:09:07','2019-03-23 15:09:07'),
	(55,1,'admin/category/create','GET','127.0.0.1','[]','2019-03-23 15:09:07','2019-03-23 15:09:07'),
	(56,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u7ecf\\u5178\",\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\"}','2019-03-23 15:09:12','2019-03-23 15:09:12'),
	(57,1,'admin/category/create','GET','127.0.0.1','[]','2019-03-23 15:09:12','2019-03-23 15:09:12'),
	(58,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u641e\\u7b11\",\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\"}','2019-03-23 15:09:17','2019-03-23 15:09:17'),
	(59,1,'admin/category/create','GET','127.0.0.1','[]','2019-03-23 15:09:17','2019-03-23 15:09:17'),
	(60,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u65b0\\u7535\\u5f71\",\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\"}','2019-03-23 15:09:28','2019-03-23 15:09:28'),
	(61,1,'admin/category/create','GET','127.0.0.1','[]','2019-03-23 15:09:28','2019-03-23 15:09:28'),
	(62,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u6700\\u65b0\\u5927\\u7247\",\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\"}','2019-03-23 15:09:34','2019-03-23 15:09:34'),
	(63,1,'admin/category/create','GET','127.0.0.1','[]','2019-03-23 15:09:34','2019-03-23 15:09:34'),
	(64,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u6559\\u80b2\",\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\"}','2019-03-23 15:09:42','2019-03-23 15:09:42'),
	(65,1,'admin/category/create','GET','127.0.0.1','[]','2019-03-23 15:09:42','2019-03-23 15:09:42'),
	(66,1,'admin/category','POST','127.0.0.1','{\"name\":\"\\u513f\\u7ae5\",\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\"}','2019-03-23 15:09:47','2019-03-23 15:09:47'),
	(67,1,'admin/category/create','GET','127.0.0.1','[]','2019-03-23 15:09:47','2019-03-23 15:09:47'),
	(68,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 15:09:50','2019-03-23 15:09:50'),
	(69,1,'admin/category/2','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:09:51','2019-03-23 15:09:51'),
	(70,1,'admin/category/3','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:09:51','2019-03-23 15:09:51'),
	(71,1,'admin/category/4','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:09:52','2019-03-23 15:09:52'),
	(72,1,'admin/category/5','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:09:52','2019-03-23 15:09:52'),
	(73,1,'admin/category/6','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:09:53','2019-03-23 15:09:53'),
	(74,1,'admin/category/7','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:09:53','2019-03-23 15:09:53'),
	(75,1,'admin/category/8','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:09:54','2019-03-23 15:09:54'),
	(76,1,'admin/category/9','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:09:54','2019-03-23 15:09:54'),
	(77,1,'admin/category/10','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:09:54','2019-03-23 15:09:54'),
	(78,1,'admin/category/11','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:09:55','2019-03-23 15:09:55'),
	(79,1,'admin/category/1','PUT','127.0.0.1','{\"status\":\"off\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:16:51','2019-03-23 15:16:51'),
	(80,1,'admin/category/1','PUT','127.0.0.1','{\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_method\":\"PUT\"}','2019-03-23 15:27:05','2019-03-23 15:27:05'),
	(81,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 15:30:02','2019-03-23 15:30:02'),
	(82,1,'admin/video/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 15:30:06','2019-03-23 15:30:06'),
	(83,1,'admin/video','POST','127.0.0.1','{\"category_id\":\"1\",\"name\":\"\\u6d4b\\u8bd5\",\"url\":null,\"hot\":\"off\",\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/video\"}','2019-03-23 15:30:22','2019-03-23 15:30:22'),
	(84,1,'admin/video/create','GET','127.0.0.1','[]','2019-03-23 15:30:22','2019-03-23 15:30:22'),
	(85,1,'admin/video','POST','127.0.0.1','{\"category_id\":\"1\",\"name\":\"\\u6d4b\\u8bd5\",\"url\":\"https:\\/\\/hkwycc.com\\/v\\/V2eiXtAg\",\"hot\":\"off\",\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\"}','2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(86,1,'admin/video','GET','127.0.0.1','[]','2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(87,1,'admin/video/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-23 15:42:36','2019-03-23 15:42:36'),
	(88,1,'admin/video','POST','127.0.0.1','{\"category_id\":\"2\",\"name\":\"\\u7535\\u89c6\\u5267\",\"url\":\"https:\\/\\/hkwycc.com\\/v\\/V2eiXtAg\",\"hot\":\"off\",\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\",\"after-save\":\"2\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/video\"}','2019-03-23 15:42:59','2019-03-23 15:42:59'),
	(89,1,'admin/video/create','GET','127.0.0.1','[]','2019-03-23 15:42:59','2019-03-23 15:42:59'),
	(90,1,'admin/video','POST','127.0.0.1','{\"category_id\":\"1\",\"name\":\"\\u7535\\u5f71\",\"url\":\"https:\\/\\/hkwycc.com\\/v\\/V2eiXtAg\",\"hot\":\"off\",\"status\":\"on\",\"_token\":\"hVx66RiQN8Nu2GWh8C5dCFqqd0HVtgU073gdrwrD\"}','2019-03-23 15:43:13','2019-03-23 15:43:13'),
	(91,1,'admin/video','GET','127.0.0.1','[]','2019-03-23 15:43:13','2019-03-23 15:43:13'),
	(92,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:36:49','2019-03-24 19:36:49'),
	(93,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u4ed8\\u6b3e\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"projects\",\"roles\":[null],\"permission\":null,\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\"}','2019-03-24 19:37:03','2019-03-24 19:37:03'),
	(94,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 19:37:03','2019-03-24 19:37:03'),
	(95,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 19:37:08','2019-03-24 19:37:08'),
	(96,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:37:11','2019-03-24 19:37:11'),
	(97,1,'admin/auth/users','GET','127.0.0.1','[]','2019-03-24 19:37:16','2019-03-24 19:37:16'),
	(98,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:37:18','2019-03-24 19:37:18'),
	(99,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:37:21','2019-03-24 19:37:21'),
	(100,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u4ed8\\u6b3e\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"project\",\"roles\":[null],\"permission\":null,\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/auth\\/menu\"}','2019-03-24 19:37:24','2019-03-24 19:37:24'),
	(101,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 19:37:24','2019-03-24 19:37:24'),
	(102,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:37:28','2019-03-24 19:37:28'),
	(103,1,'admin/project/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:38:09','2019-03-24 19:38:09'),
	(104,1,'admin/project','POST','127.0.0.1','{\"name\":\"\\u7eed\\u8d393\\u59291\\u5143\",\"amount\":\"1\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:38:25','2019-03-24 19:38:25'),
	(105,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:38:25','2019-03-24 19:38:25'),
	(106,1,'admin/project/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:38:27','2019-03-24 19:38:27'),
	(107,1,'admin/project','POST','127.0.0.1','{\"name\":\"\\u7eed\\u8d391\\u4e2a\\u6708 5\\u5143\",\"amount\":\"5\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:38:37','2019-03-24 19:38:37'),
	(108,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:38:37','2019-03-24 19:38:37'),
	(109,1,'admin/project/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:38:42','2019-03-24 19:38:42'),
	(110,1,'admin/project','POST','127.0.0.1','{\"name\":\"\\u7eed\\u8d393\\u4e2a\\u6708 10\\u5143\",\"amount\":\"10\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:38:46','2019-03-24 19:38:46'),
	(111,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:38:46','2019-03-24 19:38:46'),
	(112,1,'admin/project/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:38:51','2019-03-24 19:38:51'),
	(113,1,'admin/project','POST','127.0.0.1','{\"name\":\"\\u7eed\\u8d391\\u5e74 20\\u5143\",\"amount\":\"20\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:38:55','2019-03-24 19:38:55'),
	(114,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:38:55','2019-03-24 19:38:55'),
	(115,1,'admin/project/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:01','2019-03-24 19:39:01'),
	(116,1,'admin/project/1','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d393\\u59291\\u5143\",\"amount\":\"100\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:39:05','2019-03-24 19:39:05'),
	(117,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:39:05','2019-03-24 19:39:05'),
	(118,1,'admin/project/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:06','2019-03-24 19:39:06'),
	(119,1,'admin/project/2','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d391\\u4e2a\\u6708 5\\u5143\",\"amount\":\"500\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:39:09','2019-03-24 19:39:09'),
	(120,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:39:09','2019-03-24 19:39:09'),
	(121,1,'admin/project/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:11','2019-03-24 19:39:11'),
	(122,1,'admin/project/3','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d393\\u4e2a\\u6708 10\\u5143\",\"amount\":\"1000\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:39:14','2019-03-24 19:39:14'),
	(123,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:39:14','2019-03-24 19:39:14'),
	(124,1,'admin/project/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:15','2019-03-24 19:39:15'),
	(125,1,'admin/project/4','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d391\\u5e74 20\\u5143\",\"amount\":\"2000\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:39:19','2019-03-24 19:39:19'),
	(126,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:39:19','2019-03-24 19:39:19'),
	(127,1,'admin/project/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:33','2019-03-24 19:39:33'),
	(128,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:40','2019-03-24 19:39:40'),
	(129,1,'admin/project/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:41','2019-03-24 19:39:41'),
	(130,1,'admin/project/2','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:45','2019-03-24 19:39:45'),
	(131,1,'admin/project/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:48','2019-03-24 19:39:48'),
	(132,1,'admin/project/2','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d391\\u4e2a\\u67085\\u5143\",\"amount\":\"500\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\\/2\"}','2019-03-24 19:39:52','2019-03-24 19:39:52'),
	(133,1,'admin/project/2','GET','127.0.0.1','[]','2019-03-24 19:39:52','2019-03-24 19:39:52'),
	(134,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:54','2019-03-24 19:39:54'),
	(135,1,'admin/project/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:56','2019-03-24 19:39:56'),
	(136,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:39:59','2019-03-24 19:39:59'),
	(137,1,'admin/project/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:40:02','2019-03-24 19:40:02'),
	(138,1,'admin/project/1','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d393\\u5929 1\\u5143\",\"amount\":\"100\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:40:04','2019-03-24 19:40:04'),
	(139,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:40:04','2019-03-24 19:40:04'),
	(140,1,'admin/project/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:40:05','2019-03-24 19:40:05'),
	(141,1,'admin/project/2','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d39 1 \\u4e2a\\u6708 5 \\u5143\",\"amount\":\"500\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:40:13','2019-03-24 19:40:13'),
	(142,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:40:13','2019-03-24 19:40:13'),
	(143,1,'admin/project/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:40:15','2019-03-24 19:40:15'),
	(144,1,'admin/project/1','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d39 3 \\u5929 1 \\u5143\",\"amount\":\"100\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:40:19','2019-03-24 19:40:19'),
	(145,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:40:19','2019-03-24 19:40:19'),
	(146,1,'admin/project/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:40:20','2019-03-24 19:40:20'),
	(147,1,'admin/project/3','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d39 3 \\u4e2a\\u6708 10 \\u5143\",\"amount\":\"1000\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:40:25','2019-03-24 19:40:25'),
	(148,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:40:25','2019-03-24 19:40:25'),
	(149,1,'admin/project/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:40:26','2019-03-24 19:40:26'),
	(150,1,'admin/project/4','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d39 1 \\u5e74 20 \\u5143\",\"amount\":\"2000\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:40:31','2019-03-24 19:40:31'),
	(151,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:40:31','2019-03-24 19:40:31'),
	(152,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:47:16','2019-03-24 19:47:16'),
	(153,1,'admin/project/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:47:23','2019-03-24 19:47:23'),
	(154,1,'admin/project/1','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d39 3 \\u5929 1 \\u5143\",\"day\":\"3\",\"amount\":\"100\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:47:28','2019-03-24 19:47:28'),
	(155,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:47:28','2019-03-24 19:47:28'),
	(156,1,'admin/project/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:47:29','2019-03-24 19:47:29'),
	(157,1,'admin/project/2','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d39 1 \\u4e2a\\u6708 5 \\u5143\",\"day\":\"30\",\"amount\":\"500\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:47:33','2019-03-24 19:47:33'),
	(158,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:47:33','2019-03-24 19:47:33'),
	(159,1,'admin/project/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:47:34','2019-03-24 19:47:34'),
	(160,1,'admin/project/3','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d39 3 \\u4e2a\\u6708 10 \\u5143\",\"day\":\"90\",\"amount\":\"1000\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:47:42','2019-03-24 19:47:42'),
	(161,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:47:42','2019-03-24 19:47:42'),
	(162,1,'admin/project/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:47:45','2019-03-24 19:47:45'),
	(163,1,'admin/project/4','PUT','127.0.0.1','{\"name\":\"\\u7eed\\u8d39 1 \\u5e74 20 \\u5143\",\"day\":\"365\",\"amount\":\"2000\",\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 19:47:49','2019-03-24 19:47:49'),
	(164,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 19:47:49','2019-03-24 19:47:49'),
	(165,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 19:53:48','2019-03-24 19:53:48'),
	(166,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:55:01','2019-03-24 19:55:01'),
	(167,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:55:22','2019-03-24 19:55:22'),
	(168,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:55:49','2019-03-24 19:55:49'),
	(169,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:56:11','2019-03-24 19:56:11'),
	(170,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:56:26','2019-03-24 19:56:26'),
	(171,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:57:00','2019-03-24 19:57:00'),
	(172,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:57:03','2019-03-24 19:57:03'),
	(173,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:57:14','2019-03-24 19:57:14'),
	(174,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:57:48','2019-03-24 19:57:48'),
	(175,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:58:02','2019-03-24 19:58:02'),
	(176,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:58:18','2019-03-24 19:58:18'),
	(177,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:58:44','2019-03-24 19:58:44'),
	(178,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:59:02','2019-03-24 19:59:02'),
	(179,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:59:12','2019-03-24 19:59:12'),
	(180,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:59:20','2019-03-24 19:59:20'),
	(181,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:59:45','2019-03-24 19:59:45'),
	(182,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 19:59:55','2019-03-24 19:59:55'),
	(183,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 20:01:49','2019-03-24 20:01:49'),
	(184,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:01:52','2019-03-24 20:01:52'),
	(185,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:09:10','2019-03-24 20:09:10'),
	(186,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u610f\\u89c1\\u5efa\\u8bae\",\"icon\":\"fa-bars\",\"uri\":\"suggest\",\"roles\":[null],\"permission\":null,\"_token\":\"eAwFkrKYxGMjc1Glx4wx5CXOJVF3ck3UbZXbaQ1L\"}','2019-03-24 20:09:18','2019-03-24 20:09:18'),
	(187,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 20:09:18','2019-03-24 20:09:18'),
	(188,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 20:09:20','2019-03-24 20:09:20'),
	(189,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:09:21','2019-03-24 20:09:21'),
	(190,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:09:22','2019-03-24 20:09:22'),
	(191,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:10:01','2019-03-24 20:10:01'),
	(192,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:10:03','2019-03-24 20:10:03'),
	(193,1,'admin/suggest','GET','127.0.0.1','[]','2019-03-24 20:10:53','2019-03-24 20:10:53'),
	(194,1,'admin/suggest','GET','127.0.0.1','[]','2019-03-24 20:11:41','2019-03-24 20:11:41'),
	(195,1,'admin/suggest','GET','127.0.0.1','[]','2019-03-24 20:11:48','2019-03-24 20:11:48'),
	(196,1,'admin/suggest','GET','127.0.0.1','[]','2019-03-24 20:12:30','2019-03-24 20:12:30'),
	(197,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:37:55','2019-03-24 20:37:55'),
	(198,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:37:56','2019-03-24 20:37:56'),
	(199,1,'admin/config/create','GET','127.0.0.1','[]','2019-03-24 20:39:49','2019-03-24 20:39:49'),
	(200,1,'admin/config','POST','127.0.0.1','{\"name\":\"recharge\",\"value\":\"on\",\"description\":\"\\u5f53 Value \\u4e3a off \\u65f6\\u8868\\u793a\\u5173\\u95ed\\u5145\\u503c\\uff0c\\u5426\\u5219\\u8868\\u793a\\u5f00\\u542f\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 20:39:55','2019-03-24 20:39:55'),
	(201,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 20:39:55','2019-03-24 20:39:55'),
	(202,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:39:58','2019-03-24 20:39:58'),
	(203,1,'admin/config','POST','127.0.0.1','{\"name\":\"appid\",\"value\":null,\"description\":\"\\u5145\\u503c\\u7684 appid\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 20:40:18','2019-03-24 20:40:18'),
	(204,1,'admin/config/create','GET','127.0.0.1','[]','2019-03-24 20:40:18','2019-03-24 20:40:18'),
	(205,1,'admin/config','POST','127.0.0.1','{\"name\":\"appid\",\"value\":\"123\",\"description\":\"\\u5145\\u503c\\u7684 appid\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\"}','2019-03-24 20:40:20','2019-03-24 20:40:20'),
	(206,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 20:40:20','2019-03-24 20:40:20'),
	(207,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:40:26','2019-03-24 20:40:26'),
	(208,1,'admin/config','POST','127.0.0.1','{\"name\":\"secret_key\",\"value\":\"asdasdsad\",\"description\":\"\\u5145\\u503c\\u7684 secretKey\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 20:40:42','2019-03-24 20:40:42'),
	(209,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 20:40:42','2019-03-24 20:40:42'),
	(210,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 20:41:39','2019-03-24 20:41:39'),
	(211,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:41:44','2019-03-24 20:41:44'),
	(212,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:41:46','2019-03-24 20:41:46'),
	(213,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:41:50','2019-03-24 20:41:50'),
	(214,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:41:55','2019-03-24 20:41:55'),
	(215,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:41:58','2019-03-24 20:41:58'),
	(216,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:41:59','2019-03-24 20:41:59'),
	(217,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:42:08','2019-03-24 20:42:08'),
	(218,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:42:09','2019-03-24 20:42:09'),
	(219,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 20:43:42','2019-03-24 20:43:42'),
	(220,1,'admin/config/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:43:49','2019-03-24 20:43:49'),
	(221,1,'admin/config/1','PUT','127.0.0.1','{\"name\":\"recharge\",\"value\":\"off\",\"description\":\"\\u5f53 Value \\u4e3a off \\u65f6\\u8868\\u793a\\u5173\\u95ed\\u5145\\u503c\\uff0c\\u5426\\u5219\\u8868\\u793a\\u5f00\\u542f\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 20:43:53','2019-03-24 20:43:53'),
	(222,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 20:43:53','2019-03-24 20:43:53'),
	(223,1,'admin/config/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 20:44:02','2019-03-24 20:44:02'),
	(224,1,'admin/config/1','PUT','127.0.0.1','{\"name\":\"recharge\",\"value\":\"on\",\"description\":\"\\u5f53 Value \\u4e3a off \\u65f6\\u8868\\u793a\\u5173\\u95ed\\u5145\\u503c\\uff0c\\u5426\\u5219\\u8868\\u793a\\u5f00\\u542f\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 20:44:05','2019-03-24 20:44:05'),
	(225,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 20:44:05','2019-03-24 20:44:05'),
	(226,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 22:02:15','2019-03-24 22:02:15'),
	(227,1,'admin/config','POST','127.0.0.1','{\"name\":\"alipay_real_name\",\"value\":\"*\\u4e2d\\u5c71\",\"description\":\"\\u6536\\u6b3e\\u652f\\u4ed8\\u5b9d\\u5b9e\\u540d\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 22:02:34','2019-03-24 22:02:34'),
	(228,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 22:02:34','2019-03-24 22:02:34'),
	(229,1,'admin/config/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 22:02:54','2019-03-24 22:02:54'),
	(230,1,'admin/config/2','PUT','127.0.0.1','{\"name\":\"appid\",\"value\":\"XVxcxxrxxVcCC5C6A88CAEC21FA3C93E\",\"description\":\"\\u5145\\u503c\\u7684 appid\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 22:03:00','2019-03-24 22:03:00'),
	(231,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 22:03:00','2019-03-24 22:03:00'),
	(232,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 22:49:59','2019-03-24 22:49:59'),
	(233,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 22:50:03','2019-03-24 22:50:03'),
	(234,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 22:50:05','2019-03-24 22:50:05'),
	(235,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u5145\\u503c\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"recharge\",\"roles\":[null],\"permission\":null,\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\"}','2019-03-24 22:50:17','2019-03-24 22:50:17'),
	(236,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 22:50:17','2019-03-24 22:50:17'),
	(237,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 22:50:19','2019-03-24 22:50:19'),
	(238,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 22:50:21','2019-03-24 22:50:21'),
	(239,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 22:53:47','2019-03-24 22:53:47'),
	(240,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 22:54:06','2019-03-24 22:54:06'),
	(241,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 22:54:15','2019-03-24 22:54:15'),
	(242,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 22:54:26','2019-03-24 22:54:26'),
	(243,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 22:54:31','2019-03-24 22:54:31'),
	(244,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 22:54:32','2019-03-24 22:54:32'),
	(245,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 22:54:32','2019-03-24 22:54:32'),
	(246,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 22:54:37','2019-03-24 22:54:37'),
	(247,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 22:55:43','2019-03-24 22:55:43'),
	(248,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 22:56:10','2019-03-24 22:56:10'),
	(249,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 23:02:24','2019-03-24 23:02:24'),
	(250,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 23:02:37','2019-03-24 23:02:37'),
	(251,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 23:03:09','2019-03-24 23:03:09'),
	(252,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:03:42','2019-03-24 23:03:42'),
	(253,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:03:43','2019-03-24 23:03:43'),
	(254,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:04:46','2019-03-24 23:04:46'),
	(255,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"_scope_\":\"status\"}','2019-03-24 23:04:48','2019-03-24 23:04:48'),
	(256,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"_scope_\":\"status\"}','2019-03-24 23:04:50','2019-03-24 23:04:50'),
	(257,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"_scope_\":\"status\"}','2019-03-24 23:04:52','2019-03-24 23:04:52'),
	(258,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"_scope_\":\"status\"}','2019-03-24 23:04:54','2019-03-24 23:04:54'),
	(259,1,'admin/recharge','GET','127.0.0.1','{\"_scope_\":\"status\"}','2019-03-24 23:05:04','2019-03-24 23:05:04'),
	(260,1,'admin/recharge','GET','127.0.0.1','{\"_scope_\":\"status\",\"_pjax\":\"#pjax-container\"}','2019-03-24 23:05:07','2019-03-24 23:05:07'),
	(261,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:05:08','2019-03-24 23:05:08'),
	(262,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"_scope_\":\"status\"}','2019-03-24 23:05:09','2019-03-24 23:05:09'),
	(263,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:05:11','2019-03-24 23:05:11'),
	(264,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"_scope_\":\"status\"}','2019-03-24 23:05:14','2019-03-24 23:05:14'),
	(265,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:05:17','2019-03-24 23:05:17'),
	(266,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 23:05:59','2019-03-24 23:05:59'),
	(267,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 23:06:16','2019-03-24 23:06:16'),
	(268,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 23:06:41','2019-03-24 23:06:41'),
	(269,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:06:57','2019-03-24 23:06:57'),
	(270,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:06:58','2019-03-24 23:06:58'),
	(271,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 23:07:26','2019-03-24 23:07:26'),
	(272,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 23:08:07','2019-03-24 23:08:07'),
	(273,1,'admin/project/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:08:08','2019-03-24 23:08:08'),
	(274,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:08:10','2019-03-24 23:08:10'),
	(275,1,'admin/project/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:08:12','2019-03-24 23:08:12'),
	(276,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:08:17','2019-03-24 23:08:17'),
	(277,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 23:11:01','2019-03-24 23:11:01'),
	(278,1,'admin/project/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:11:02','2019-03-24 23:11:02'),
	(279,1,'admin/project/create','GET','127.0.0.1','[]','2019-03-24 23:11:35','2019-03-24 23:11:35'),
	(280,1,'admin/project','POST','127.0.0.1','{\"name\":\"10\\u5929\\u4f1a\\u5458\",\"day\":\"10\",\"amount\":\"10\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 23:11:55','2019-03-24 23:11:55'),
	(281,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 23:11:55','2019-03-24 23:11:55'),
	(282,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 23:12:53','2019-03-24 23:12:53'),
	(283,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 23:13:03','2019-03-24 23:13:03'),
	(284,1,'admin/project/5/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:05','2019-03-24 23:13:05'),
	(285,1,'admin/project/5','PUT','127.0.0.1','{\"name\":\"10\\u5929\\u4f1a\\u5458\",\"day\":\"10\",\"amount\":\"1000\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/project\"}','2019-03-24 23:13:09','2019-03-24 23:13:09'),
	(286,1,'admin/project','GET','127.0.0.1','[]','2019-03-24 23:13:09','2019-03-24 23:13:09'),
	(287,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:12','2019-03-24 23:13:12'),
	(288,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-24 23:13:20','2019-03-24 23:13:20'),
	(289,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:25','2019-03-24 23:13:25'),
	(290,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:26','2019-03-24 23:13:26'),
	(291,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:29','2019-03-24 23:13:29'),
	(292,1,'admin/suggest','GET','127.0.0.1','[]','2019-03-24 23:13:47','2019-03-24 23:13:47'),
	(293,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:49','2019-03-24 23:13:49'),
	(294,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:50','2019-03-24 23:13:50'),
	(295,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:51','2019-03-24 23:13:51'),
	(296,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:51','2019-03-24 23:13:51'),
	(297,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:53','2019-03-24 23:13:53'),
	(298,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:54','2019-03-24 23:13:54'),
	(299,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:54','2019-03-24 23:13:54'),
	(300,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:56','2019-03-24 23:13:56'),
	(301,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:13:58','2019-03-24 23:13:58'),
	(302,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:01','2019-03-24 23:14:01'),
	(303,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:07','2019-03-24 23:14:07'),
	(304,1,'admin/auth/menu/13/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:11','2019-03-24 23:14:11'),
	(305,1,'admin/auth/menu/13','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u914d\\u7f6e\",\"icon\":\"fa-toggle-on\",\"uri\":\"config\",\"roles\":[null],\"permission\":null,\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/auth\\/menu\"}','2019-03-24 23:14:24','2019-03-24 23:14:24'),
	(306,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 23:14:24','2019-03-24 23:14:24'),
	(307,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11}]},{\\\"id\\\":12},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":13},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-03-24 23:14:42','2019-03-24 23:14:42'),
	(308,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:42','2019-03-24 23:14:42'),
	(309,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 23:14:43','2019-03-24 23:14:43'),
	(310,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:46','2019-03-24 23:14:46'),
	(311,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:50','2019-03-24 23:14:50'),
	(312,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:51','2019-03-24 23:14:51'),
	(313,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:52','2019-03-24 23:14:52'),
	(314,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:54','2019-03-24 23:14:54'),
	(315,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:55','2019-03-24 23:14:55'),
	(316,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:56','2019-03-24 23:14:56'),
	(317,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:14:59','2019-03-24 23:14:59'),
	(318,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:15:12','2019-03-24 23:15:12'),
	(319,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:15:17','2019-03-24 23:15:17'),
	(320,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:15:33','2019-03-24 23:15:33'),
	(321,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:15:35','2019-03-24 23:15:35'),
	(322,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:15:37','2019-03-24 23:15:37'),
	(323,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:15:39','2019-03-24 23:15:39'),
	(324,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:15:48','2019-03-24 23:15:48'),
	(325,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:15:49','2019-03-24 23:15:49'),
	(326,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:16:04','2019-03-24 23:16:04'),
	(327,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:16:25','2019-03-24 23:16:25'),
	(328,1,'admin/config','POST','127.0.0.1','{\"name\":\"announcement\",\"value\":\"null\",\"description\":\"\\u516c\\u544a\\u4e3a null \\u65f6\\u4e0d\\u663e\\u793a\\uff0c\\u5426\\u5219\\u663e\\u793a\\u8f93\\u5165\\u7684\\u5185\\u5bb9\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 23:16:53','2019-03-24 23:16:53'),
	(329,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 23:16:53','2019-03-24 23:16:53'),
	(330,1,'admin/config/5/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:16:56','2019-03-24 23:16:56'),
	(331,1,'admin/config/5','PUT','127.0.0.1','{\"name\":\"announcement\",\"value\":\"\\u8d85\\u7ecf\\u5178\\u79d1\\u5e7b\\u5927\\u7247\\u91cd\\u542f\\uff01\\u767e\\u5206\\u767e\\u5fc5\\u770b\",\"description\":\"\\u516c\\u544a\\u4e3a null \\u65f6\\u4e0d\\u663e\\u793a\\uff0c\\u5426\\u5219\\u663e\\u793a\\u8f93\\u5165\\u7684\\u5185\\u5bb9\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 23:18:09','2019-03-24 23:18:09'),
	(332,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 23:18:09','2019-03-24 23:18:09'),
	(333,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 23:26:27','2019-03-24 23:26:27'),
	(334,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:26:34','2019-03-24 23:26:34'),
	(335,1,'admin/video/1','PUT','127.0.0.1','{\"hot\":\"on\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\"}','2019-03-24 23:26:37','2019-03-24 23:26:37'),
	(336,1,'admin/video/3','PUT','127.0.0.1','{\"hot\":\"on\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\"}','2019-03-24 23:27:46','2019-03-24 23:27:46'),
	(337,1,'admin/video/2','PUT','127.0.0.1','{\"hot\":\"on\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\"}','2019-03-24 23:27:47','2019-03-24 23:27:47'),
	(338,1,'admin/video','GET','127.0.0.1','[]','2019-03-24 23:34:25','2019-03-24 23:34:25'),
	(339,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:37:42','2019-03-24 23:37:42'),
	(340,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:37:43','2019-03-24 23:37:43'),
	(341,1,'admin/config','POST','127.0.0.1','{\"name\":\"login_image\",\"value\":null,\"description\":\"\\u767b\\u9646\\u6ce8\\u518c\\u9875\\u80cc\\u666f\\u56fe\\u7247\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 23:38:23','2019-03-24 23:38:23'),
	(342,1,'admin/config/create','GET','127.0.0.1','[]','2019-03-24 23:38:23','2019-03-24 23:38:23'),
	(343,1,'admin/config','POST','127.0.0.1','{\"name\":\"login_image\",\"value\":\"123\",\"description\":\"\\u767b\\u9646\\u6ce8\\u518c\\u9875\\u80cc\\u666f\\u56fe\\u7247\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\"}','2019-03-24 23:38:25','2019-03-24 23:38:25'),
	(344,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 23:38:25','2019-03-24 23:38:25'),
	(345,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 23:40:06','2019-03-24 23:40:06'),
	(346,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:40:12','2019-03-24 23:40:12'),
	(347,1,'admin/auth/menu/16/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:40:14','2019-03-24 23:40:14'),
	(348,1,'admin/auth/menu/16','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u6587\\u4ef6\\u7ba1\\u7406\",\"icon\":\"fa-file\",\"uri\":\"media\",\"roles\":[null],\"permission\":null,\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/auth\\/menu\"}','2019-03-24 23:40:32','2019-03-24 23:40:32'),
	(349,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 23:40:32','2019-03-24 23:40:32'),
	(350,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":9,\\\"children\\\":[{\\\"id\\\":10},{\\\"id\\\":11}]},{\\\"id\\\":12},{\\\"id\\\":14},{\\\"id\\\":15},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":16},{\\\"id\\\":13},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-03-24 23:40:36','2019-03-24 23:40:36'),
	(351,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:40:36','2019-03-24 23:40:36'),
	(352,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-03-24 23:40:38','2019-03-24 23:40:38'),
	(353,1,'admin/media','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:40:40','2019-03-24 23:40:40'),
	(354,1,'admin/media/upload','POST','127.0.0.1','{\"dir\":\"\\/\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\"}','2019-03-24 23:40:52','2019-03-24 23:40:52'),
	(355,1,'admin/media','GET','127.0.0.1','[]','2019-03-24 23:40:52','2019-03-24 23:40:52'),
	(356,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:41:06','2019-03-24 23:41:06'),
	(357,1,'admin/config/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-24 23:41:08','2019-03-24 23:41:08'),
	(358,1,'admin/config/6','PUT','127.0.0.1','{\"name\":\"login_image\",\"value\":\"http:\\/\\/video.test\\/storage\\/1-1.jpeg\",\"description\":\"\\u767b\\u9646\\u6ce8\\u518c\\u9875\\u80cc\\u666f\\u56fe\\u7247\",\"_token\":\"6NwyuXMYF0zyhhe2Us5ZnV6m9YsgKbwxPFZZw8pP\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-24 23:41:11','2019-03-24 23:41:11'),
	(359,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 23:41:11','2019-03-24 23:41:11');

/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`)
VALUES
	(1,'All permission','*','','*',NULL,NULL),
	(2,'Dashboard','dashboard','GET','/',NULL,NULL),
	(3,'Login','auth.login','','/auth/login\r\n/auth/logout',NULL,NULL),
	(4,'User setting','auth.setting','GET,PUT','/auth/setting',NULL,NULL),
	(5,'Auth management','auth.management','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,NULL),
	(6,'Admin Config','ext.config',NULL,'/config*','2019-03-24 20:01:44','2019-03-24 20:01:44'),
	(7,'Media manager','ext.media-manager',NULL,'/media*','2019-03-24 23:39:44','2019-03-24 23:39:44');

/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_permissions`;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_users`;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'Administrator','administrator','2019-03-22 22:04:41','2019-03-22 22:04:41');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_permissions`;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin','$2y$10$iEf8JKwBIX1S2PWHiVj02uIGa4fSQxOyLj.vSdSMm6B6C9EkVFGEy','Administrator',NULL,'sduYlnrhafpD1ZwNYPZtPli3bQSZ9bTIYj7dQFyjYpajCtlPuvK4aJiEFgXD','2019-03-22 22:04:41','2019-03-22 22:04:41');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table categories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `categories`;

CREATE TABLE `categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1显示;0不显示',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;

INSERT INTO `categories` (`id`, `name`, `status`, `created_at`, `updated_at`)
VALUES
	(1,'电影',1,'2019-03-23 14:48:13','2019-03-23 15:27:05'),
	(2,'电视剧',1,'2019-03-23 15:08:38','2019-03-23 15:09:51'),
	(3,'综艺',1,'2019-03-23 15:08:59','2019-03-23 15:09:51'),
	(4,'娱乐',1,'2019-03-23 15:09:03','2019-03-23 15:09:52'),
	(5,'新闻',1,'2019-03-23 15:09:07','2019-03-23 15:09:52'),
	(6,'经典',1,'2019-03-23 15:09:12','2019-03-23 15:09:53'),
	(7,'搞笑',1,'2019-03-23 15:09:17','2019-03-23 15:09:53'),
	(8,'新电影',1,'2019-03-23 15:09:28','2019-03-23 15:09:54'),
	(9,'最新大片',1,'2019-03-23 15:09:34','2019-03-23 15:09:54'),
	(10,'教育',1,'2019-03-23 15:09:42','2019-03-23 15:09:55'),
	(11,'儿童',1,'2019-03-23 15:09:47','2019-03-23 15:09:55');

/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_01_04_173148_create_admin_tables',1),
	(4,'2019_03_22_111515_create_categories_table',1),
	(5,'2019_03_22_111518_create_videos_table',1),
	(6,'2019_03_22_112436_create_recharges_table',1),
	(7,'2019_03_22_112710_create_projects_table',1),
	(8,'2017_07_17_040159_create_config_table',2),
	(9,'2019_03_24_200713_create_suggests_table',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table projects
# ------------------------------------------------------------

DROP TABLE IF EXISTS `projects`;

CREATE TABLE `projects` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `day` int(11) NOT NULL,
  `amount` bigint(20) unsigned NOT NULL COMMENT '金额',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;

INSERT INTO `projects` (`id`, `name`, `day`, `amount`, `created_at`, `updated_at`)
VALUES
	(1,'续费 3 天 1 元',3,100,'2019-03-24 19:38:25','2019-03-24 19:47:28'),
	(2,'续费 1 个月 5 元',30,500,'2019-03-24 19:38:37','2019-03-24 19:47:33'),
	(3,'续费 3 个月 10 元',90,1000,'2019-03-24 19:38:46','2019-03-24 19:47:42'),
	(4,'续费 1 年 20 元',365,2000,'2019-03-24 19:38:55','2019-03-24 19:47:49'),
	(5,'10天会员',10,1000,'2019-03-24 23:11:55','2019-03-24 23:13:09');

/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table recharges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recharges`;

CREATE TABLE `recharges` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `project_id` int(10) unsigned NOT NULL,
  `order_no` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '订单编号',
  `amount` bigint(20) unsigned NOT NULL COMMENT '充值金额',
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '充值状态',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `recharges` WRITE;
/*!40000 ALTER TABLE `recharges` DISABLE KEYS */;

INSERT INTO `recharges` (`id`, `user_id`, `project_id`, `order_no`, `amount`, `status`, `paid_at`, `created_at`, `updated_at`)
VALUES
	(1,1,1,'345749462416',100,'UNPAID',NULL,'2019-03-24 22:38:01','2019-03-24 22:38:01'),
	(2,1,1,'240626747355',100,'PAID','2019-03-24 22:42:05','2019-03-24 22:42:05','2019-03-24 22:42:05'),
	(3,1,1,'11466450166',100,'UNPAID',NULL,'2019-03-24 22:48:14','2019-03-24 22:48:14'),
	(4,1,1,'1A1499504319',100,'UNPAID',NULL,'2019-03-24 22:48:36','2019-03-24 22:48:36'),
	(5,1,4,'1U1343979667',2000,'UNPAID',NULL,'2019-03-24 22:49:44','2019-03-24 22:49:44'),
	(6,1,1,'1U1238631913',100,'UNPAID',NULL,'2019-03-25 00:05:14','2019-03-25 00:05:14');

/*!40000 ALTER TABLE `recharges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table suggests
# ------------------------------------------------------------

DROP TABLE IF EXISTS `suggests`;

CREATE TABLE `suggests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '会员ID',
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '意见',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `suggests` WRITE;
/*!40000 ALTER TABLE `suggests` DISABLE KEYS */;

INSERT INTO `suggests` (`id`, `user_id`, `content`, `created_at`, `updated_at`)
VALUES
	(10,1,'123123123','2019-03-24 20:37:00','2019-03-24 20:37:00'),
	(11,1,'123123','2019-03-25 00:05:22','2019-03-25 00:05:22');

/*!40000 ALTER TABLE `suggests` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remarks` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '备注',
  `first_login` timestamp NULL DEFAULT NULL,
  `expire_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `username`, `nickname`, `password`, `remarks`, `first_login`, `expire_at`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(1,'admin',NULL,'$2y$10$88e/D5BS/KJtzzypHAKm0Oy7E2otSaTuePMs8AURZC/rYQ9ejAO32','admin','2019-03-23 14:44:23','2019-03-23 14:44:23',NULL,'2019-03-23 14:44:35','2019-03-23 14:44:35');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table videos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `videos`;

CREATE TABLE `videos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `images` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1推荐;0不推荐',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1显示;0不显示',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `videos` WRITE;
/*!40000 ALTER TABLE `videos` DISABLE KEYS */;

INSERT INTO `videos` (`id`, `category_id`, `name`, `url`, `images`, `hot`, `status`, `created_at`, `updated_at`)
VALUES
	(1,1,'流浪地球','https://hkwycc.com/v/V2eiXtAg','[\"images\\/1-1.jpeg\",\"images\\/1-2.jpeg\"]',1,1,'2019-03-23 14:49:41','2019-03-24 23:26:37'),
	(2,1,'测试','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',1,1,'2019-03-23 15:30:44','2019-03-24 23:27:47'),
	(3,2,'电视剧','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2.jpeg\",\"images\\/3.jpeg\",\"images\\/4.jpeg\"]',1,1,'2019-03-23 15:42:59','2019-03-24 23:27:46'),
	(4,1,'电影','https://hkwycc.com/v/V2eiXtAg','[\"images\\/1.jpeg\"]',0,1,'2019-03-23 15:43:13','2019-03-23 15:43:13'),
	(5,1,'测试1','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(6,1,'测试2','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(7,1,'测试3','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(8,1,'三是实打实的','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(9,1,'撒打算的a','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(10,1,'德国法国','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(11,1,'5street','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(12,1,'沃尔沃人','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(13,1,'电风扇地方','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(14,1,'vcvdc','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(15,1,'435345是电风扇地方','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(16,1,'给对方感觉很干净','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(17,1,'u 具有体积','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(18,1,'123456','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(19,1,'1234567','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(20,1,'098776','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(21,1,'45345','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(22,1,'4234234234','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(23,1,'34234','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(24,1,'3243243','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(25,1,'234234234','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44'),
	(26,1,'234234234','https://hkwycc.com/v/V2eiXtAg','[\"images\\/2-1.jpeg\",\"images\\/2-2.jpeg\"]',0,1,'2019-03-23 15:30:44','2019-03-23 15:30:44');

/*!40000 ALTER TABLE `videos` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
