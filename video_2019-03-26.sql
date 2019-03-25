# ************************************************************
# Sequel Pro SQL dump
# Version 5120
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.22)
# Database: video
# Generation Time: 2019-03-25 16:04:52 +0000
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
	(6,'login_image','http://video.test/storage/1-1.jpeg','登陆注册页背景图片','2019-03-24 23:38:25','2019-03-24 23:41:11'),
	(7,'login_text','嗅嗅视频','登陆界面 logo 文字','2019-03-25 20:54:39','2019-03-25 20:54:39');

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
	(12,0,6,'付款管理','fa-bars','project',NULL,'2019-03-24 19:37:03','2019-03-24 23:14:42'),
	(13,2,12,'系统配置','fa-toggle-on','config',NULL,'2019-03-24 20:01:44','2019-03-24 23:40:36'),
	(14,0,7,'意见建议','fa-bars','suggest',NULL,'2019-03-24 20:09:18','2019-03-24 23:14:42'),
	(16,2,11,'文件管理','fa-file','media',NULL,'2019-03-24 23:39:44','2019-03-24 23:40:36'),
	(17,0,2,'会员管理','fa-user','user',NULL,'2019-03-22 11:30:42','2019-03-22 11:30:47'),
	(18,0,3,'视频管理','fa-video-camera',NULL,NULL,'2019-03-22 13:36:43','2019-03-22 13:42:33'),
	(19,0,6,'充值记录','fa-cc-visa','recharge',NULL,'2019-03-22 13:37:21','2019-03-22 13:42:27'),
	(20,18,4,'视频分类','fa-list-ul','category',NULL,'2019-03-22 13:38:19','2019-03-22 13:42:27'),
	(21,0,7,'充值选项','fa-cny','recharge',NULL,'2019-03-22 13:39:02','2019-03-22 13:42:27'),
	(22,18,5,'视频中心','fa-camera-retro','video',NULL,'2019-03-22 13:42:16','2019-03-22 13:42:27');

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
	(359,1,'admin/config','GET','127.0.0.1','[]','2019-03-24 23:41:11','2019-03-24 23:41:11'),
	(360,1,'admin','GET','127.0.0.1','[]','2019-03-25 13:37:58','2019-03-25 13:37:58'),
	(361,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:38:01','2019-03-25 13:38:01'),
	(362,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:38:03','2019-03-25 13:38:03'),
	(363,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:38:04','2019-03-25 13:38:04'),
	(364,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:38:05','2019-03-25 13:38:05'),
	(365,1,'admin/suggest','GET','127.0.0.1','[]','2019-03-25 13:38:06','2019-03-25 13:38:06'),
	(366,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:38:12','2019-03-25 13:38:12'),
	(367,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:38:14','2019-03-25 13:38:14'),
	(368,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:38:15','2019-03-25 13:38:15'),
	(369,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:38:15','2019-03-25 13:38:15'),
	(370,1,'admin/project','GET','127.0.0.1','[]','2019-03-25 13:38:35','2019-03-25 13:38:35'),
	(371,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:38:37','2019-03-25 13:38:37'),
	(372,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:38:38','2019-03-25 13:38:38'),
	(373,1,'admin/video','GET','127.0.0.1','[]','2019-03-25 13:41:19','2019-03-25 13:41:19'),
	(374,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:44:24','2019-03-25 13:44:24'),
	(375,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:44:30','2019-03-25 13:44:30'),
	(376,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:44:34','2019-03-25 13:44:34'),
	(377,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:44:36','2019-03-25 13:44:36'),
	(378,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:44:38','2019-03-25 13:44:38'),
	(379,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:44:38','2019-03-25 13:44:38'),
	(380,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:44:39','2019-03-25 13:44:39'),
	(381,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:44:39','2019-03-25 13:44:39'),
	(382,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:44:39','2019-03-25 13:44:39'),
	(383,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:44:40','2019-03-25 13:44:40'),
	(384,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 13:45:31','2019-03-25 13:45:31'),
	(385,1,'admin/category','GET','127.0.0.1','[]','2019-03-25 17:26:45','2019-03-25 17:26:45'),
	(386,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 17:26:48','2019-03-25 17:26:48'),
	(387,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 17:26:50','2019-03-25 17:26:50'),
	(388,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 17:26:53','2019-03-25 17:26:53'),
	(389,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 17:26:55','2019-03-25 17:26:55'),
	(390,1,'admin/media','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 17:26:56','2019-03-25 17:26:56'),
	(391,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 17:26:57','2019-03-25 17:26:57'),
	(392,1,'admin','GET','127.0.0.1','[]','2019-03-25 19:54:49','2019-03-25 19:54:49'),
	(393,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:54:53','2019-03-25 19:54:53'),
	(394,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:54:54','2019-03-25 19:54:54'),
	(395,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:54:57','2019-03-25 19:54:57'),
	(396,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:02','2019-03-25 19:55:02'),
	(397,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:04','2019-03-25 19:55:04'),
	(398,1,'admin/suggest','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:05','2019-03-25 19:55:05'),
	(399,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:06','2019-03-25 19:55:06'),
	(400,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:08','2019-03-25 19:55:08'),
	(401,1,'admin/media','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:09','2019-03-25 19:55:09'),
	(402,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:09','2019-03-25 19:55:09'),
	(403,1,'admin/media','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:10','2019-03-25 19:55:10'),
	(404,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:12','2019-03-25 19:55:12'),
	(405,1,'admin/media','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:13','2019-03-25 19:55:13'),
	(406,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 19:55:15','2019-03-25 19:55:15'),
	(407,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:08:07','2019-03-25 20:08:07'),
	(408,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:08:09','2019-03-25 20:08:09'),
	(409,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:53:14','2019-03-25 20:53:14'),
	(410,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:53:17','2019-03-25 20:53:17'),
	(411,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:53:19','2019-03-25 20:53:19'),
	(412,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:53:20','2019-03-25 20:53:20'),
	(413,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:54:08','2019-03-25 20:54:08'),
	(414,1,'admin/config/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:54:11','2019-03-25 20:54:11'),
	(415,1,'admin/config','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:54:14','2019-03-25 20:54:14'),
	(416,1,'admin/config/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:54:15','2019-03-25 20:54:15'),
	(417,1,'admin/config','POST','127.0.0.1','{\"name\":\"login_text\",\"value\":\"\\u55c5\\u55c5\\u89c6\\u9891\",\"description\":\"\\u767b\\u9646\\u754c\\u9762 logo \\u6587\\u5b57\",\"_token\":\"GEo2qdqqtZjBGBSmXNAZcptwBqvsbltmHgFx1iGd\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/config\"}','2019-03-25 20:54:39','2019-03-25 20:54:39'),
	(418,1,'admin/config','GET','127.0.0.1','[]','2019-03-25 20:54:39','2019-03-25 20:54:39'),
	(419,1,'admin/config','GET','127.0.0.1','[]','2019-03-25 20:56:55','2019-03-25 20:56:55'),
	(420,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:57:05','2019-03-25 20:57:05'),
	(421,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:57:06','2019-03-25 20:57:06'),
	(422,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:57:11','2019-03-25 20:57:11'),
	(423,1,'admin/auth/logout','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 20:57:17','2019-03-25 20:57:17'),
	(424,1,'admin','GET','127.0.0.1','[]','2019-03-25 20:58:00','2019-03-25 20:58:00'),
	(425,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:14:40','2019-03-25 21:14:40'),
	(426,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:14:40','2019-03-25 21:14:40'),
	(427,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:14:42','2019-03-25 21:14:42'),
	(428,1,'admin/video','GET','127.0.0.1','[]','2019-03-25 21:15:50','2019-03-25 21:15:50'),
	(429,1,'admin/video','GET','127.0.0.1','{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}','2019-03-25 21:16:00','2019-03-25 21:16:00'),
	(430,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\",\"page\":\"1\"}','2019-03-25 21:16:03','2019-03-25 21:16:03'),
	(431,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:16:18','2019-03-25 21:16:18'),
	(432,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:16:30','2019-03-25 21:16:30'),
	(433,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:16:32','2019-03-25 21:16:32'),
	(434,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:19:11','2019-03-25 21:19:11'),
	(435,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:41:16','2019-03-25 21:41:16'),
	(436,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:41:17','2019-03-25 21:41:17'),
	(437,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:41:30','2019-03-25 21:41:30'),
	(438,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:52:56','2019-03-25 21:52:56'),
	(439,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:52:57','2019-03-25 21:52:57'),
	(440,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:52:57','2019-03-25 21:52:57'),
	(441,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:52:57','2019-03-25 21:52:57'),
	(442,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:52:57','2019-03-25 21:52:57'),
	(443,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 21:54:08','2019-03-25 21:54:08'),
	(444,1,'admin/user','GET','127.0.0.1','{\"_scope_\":\"type\",\"_pjax\":\"#pjax-container\"}','2019-03-25 21:54:10','2019-03-25 21:54:10'),
	(445,1,'admin/user','GET','127.0.0.1','{\"_scope_\":\"type\",\"_pjax\":\"#pjax-container\"}','2019-03-25 21:54:12','2019-03-25 21:54:12'),
	(446,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 21:54:14','2019-03-25 21:54:14'),
	(447,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 21:56:11','2019-03-25 21:56:11'),
	(448,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 21:56:45','2019-03-25 21:56:45'),
	(449,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 21:57:53','2019-03-25 21:57:53'),
	(450,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 21:58:20','2019-03-25 21:58:20'),
	(451,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 21:58:44','2019-03-25 21:58:44'),
	(452,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 21:59:36','2019-03-25 21:59:36'),
	(453,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:00:21','2019-03-25 22:00:21'),
	(454,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:00:51','2019-03-25 22:00:51'),
	(455,1,'admin/category','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:01:00','2019-03-25 22:01:00'),
	(456,1,'admin/video','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:01:01','2019-03-25 22:01:01'),
	(457,1,'admin/project','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:01:04','2019-03-25 22:01:04'),
	(458,1,'admin/recharge','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:01:05','2019-03-25 22:01:05'),
	(459,1,'admin/recharge','GET','127.0.0.1','[]','2019-03-25 22:03:07','2019-03-25 22:03:07'),
	(460,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:03:09','2019-03-25 22:03:09'),
	(461,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:03:22','2019-03-25 22:03:22'),
	(462,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:03:25','2019-03-25 22:03:25'),
	(463,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:04:04','2019-03-25 22:04:04'),
	(464,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:05:37','2019-03-25 22:05:37'),
	(465,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:05:39','2019-03-25 22:05:39'),
	(466,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:06:00','2019-03-25 22:06:00'),
	(467,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:06:02','2019-03-25 22:06:02'),
	(468,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:06:15','2019-03-25 22:06:15'),
	(469,1,'admin/user','GET','127.0.0.1','{\"_scope_\":\"type\",\"_pjax\":\"#pjax-container\"}','2019-03-25 22:06:27','2019-03-25 22:06:27'),
	(470,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:06:29','2019-03-25 22:06:29'),
	(471,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:06:31','2019-03-25 22:06:31'),
	(472,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:06:42','2019-03-25 22:06:42'),
	(473,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:06:55','2019-03-25 22:06:55'),
	(474,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:07:06','2019-03-25 22:07:06'),
	(475,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:09:04','2019-03-25 22:09:04'),
	(476,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:10:03','2019-03-25 22:10:03'),
	(477,1,'admin/user/1,2,3','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\"}','2019-03-25 22:10:16','2019-03-25 22:10:16'),
	(478,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:10:16','2019-03-25 22:10:16'),
	(479,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:10:18','2019-03-25 22:10:18'),
	(480,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:10:42','2019-03-25 22:10:42'),
	(481,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:12:20','2019-03-25 22:12:20'),
	(482,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:12:22','2019-03-25 22:12:22'),
	(483,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:15:39','2019-03-25 22:15:39'),
	(484,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:15:41','2019-03-25 22:15:41'),
	(485,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 22:16:04','2019-03-25 22:16:04'),
	(486,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 22:16:24','2019-03-25 22:16:24'),
	(487,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 22:16:54','2019-03-25 22:16:54'),
	(488,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:21:37','2019-03-25 22:21:37'),
	(489,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:21:39','2019-03-25 22:21:39'),
	(490,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:22:01','2019-03-25 22:22:01'),
	(491,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:22:04','2019-03-25 22:22:04'),
	(492,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:22:26','2019-03-25 22:22:26'),
	(493,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:22:28','2019-03-25 22:22:28'),
	(494,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:22:29','2019-03-25 22:22:29'),
	(495,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:23:19','2019-03-25 22:23:19'),
	(496,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:23:21','2019-03-25 22:23:21'),
	(497,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:23:22','2019-03-25 22:23:22'),
	(498,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:23:27','2019-03-25 22:23:27'),
	(499,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:23:28','2019-03-25 22:23:28'),
	(500,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:23:29','2019-03-25 22:23:29'),
	(501,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:23:42','2019-03-25 22:23:42'),
	(502,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:23:43','2019-03-25 22:23:43'),
	(503,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:23:44','2019-03-25 22:23:44'),
	(504,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:23:48','2019-03-25 22:23:48'),
	(505,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:23:49','2019-03-25 22:23:49'),
	(506,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:23:50','2019-03-25 22:23:50'),
	(507,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:23:52','2019-03-25 22:23:52'),
	(508,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:23:54','2019-03-25 22:23:54'),
	(509,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:23:55','2019-03-25 22:23:55'),
	(510,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:23:59','2019-03-25 22:23:59'),
	(511,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:24:01','2019-03-25 22:24:01'),
	(512,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:24:02','2019-03-25 22:24:02'),
	(513,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:24:07','2019-03-25 22:24:07'),
	(514,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:24:08','2019-03-25 22:24:08'),
	(515,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:24:10','2019-03-25 22:24:10'),
	(516,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:24:11','2019-03-25 22:24:11'),
	(517,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:24:29','2019-03-25 22:24:29'),
	(518,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:24:30','2019-03-25 22:24:30'),
	(519,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:25:20','2019-03-25 22:25:20'),
	(520,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:25:21','2019-03-25 22:25:21'),
	(521,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:25:22','2019-03-25 22:25:22'),
	(522,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 22:25:22','2019-03-25 22:25:22'),
	(523,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 22:27:37','2019-03-25 22:27:37'),
	(524,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\"}','2019-03-25 22:27:39','2019-03-25 22:27:39'),
	(525,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:27:47','2019-03-25 22:27:47'),
	(526,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\"}','2019-03-25 22:27:48','2019-03-25 22:27:48'),
	(527,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:27:50','2019-03-25 22:27:50'),
	(528,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\"}','2019-03-25 22:27:51','2019-03-25 22:27:51'),
	(529,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:27:53','2019-03-25 22:27:53'),
	(530,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\"}','2019-03-25 22:27:54','2019-03-25 22:27:54'),
	(531,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:27:55','2019-03-25 22:27:55'),
	(532,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\"}','2019-03-25 22:27:56','2019-03-25 22:27:56'),
	(533,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:27:57','2019-03-25 22:27:57'),
	(534,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 22:31:32','2019-03-25 22:31:32'),
	(535,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":null,\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\"}','2019-03-25 22:31:34','2019-03-25 22:31:34'),
	(536,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 22:31:34','2019-03-25 22:31:34'),
	(537,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"\\u5907\\u6ce8\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\"}','2019-03-25 22:31:40','2019-03-25 22:31:40'),
	(538,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 22:31:40','2019-03-25 22:31:40'),
	(539,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 22:31:59','2019-03-25 22:31:59'),
	(540,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"\\u963f\\u65af\\u987f\\u6492\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\"}','2019-03-25 22:32:01','2019-03-25 22:32:01'),
	(541,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:32:41','2019-03-25 22:32:41'),
	(542,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:32:42','2019-03-25 22:32:42'),
	(543,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"\\u6492\\u6253\\u7b97\\u7684\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:32:46','2019-03-25 22:32:46'),
	(544,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:37:11','2019-03-25 22:37:11'),
	(545,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:37:14','2019-03-25 22:37:14'),
	(546,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"dsasd\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:37:18','2019-03-25 22:37:18'),
	(547,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 22:37:53','2019-03-25 22:37:53'),
	(548,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 22:37:55','2019-03-25 22:37:55'),
	(549,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":null,\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 22:37:56','2019-03-25 22:37:56'),
	(550,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 22:37:56','2019-03-25 22:37:56'),
	(551,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"sdasd\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\"}','2019-03-25 22:37:59','2019-03-25 22:37:59'),
	(552,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:01:44','2019-03-25 23:01:44'),
	(553,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:02:46','2019-03-25 23:02:46'),
	(554,1,'admin/user/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:02:48','2019-03-25 23:02:48'),
	(555,1,'admin/user/4','PUT','127.0.0.1','{\"username\":\"admin\",\"remarks\":\"\\u4e3b\\u52a8\\u6ce8\\u518c\",\"expire_at\":\"2019-03-25 23:02:48\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"_token\":\"9aEhwx4WmF3Hj1BoldEdetbPJ4G1kKBMgEDaTqvJ\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:02:53','2019-03-25 23:02:53'),
	(556,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:02:53','2019-03-25 23:02:53'),
	(557,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:03:40','2019-03-25 23:03:40'),
	(558,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:03:46','2019-03-25 23:03:46'),
	(559,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":null,\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:03:47','2019-03-25 23:03:47'),
	(560,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:03:47','2019-03-25 23:03:47'),
	(561,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"dasdsa\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:03:49','2019-03-25 23:03:49'),
	(562,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:04:32','2019-03-25 23:04:32'),
	(563,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:04:34','2019-03-25 23:04:34'),
	(564,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":null,\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:04:34','2019-03-25 23:04:34'),
	(565,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:04:34','2019-03-25 23:04:34'),
	(566,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:04:37','2019-03-25 23:04:37'),
	(567,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:04:55','2019-03-25 23:04:55'),
	(568,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:04:57','2019-03-25 23:04:57'),
	(569,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"asd\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:04:58','2019-03-25 23:04:58'),
	(570,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:05:37','2019-03-25 23:05:37'),
	(571,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:05:39','2019-03-25 23:05:39'),
	(572,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":null,\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:05:39','2019-03-25 23:05:39'),
	(573,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:05:39','2019-03-25 23:05:39'),
	(574,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"asdsad\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:05:41','2019-03-25 23:05:41'),
	(575,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:05:52','2019-03-25 23:05:52'),
	(576,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:05:53','2019-03-25 23:05:53'),
	(577,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"asdasd\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:05:55','2019-03-25 23:05:55'),
	(578,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:06:48','2019-03-25 23:06:48'),
	(579,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:06:49','2019-03-25 23:06:49'),
	(580,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":null,\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:06:50','2019-03-25 23:06:50'),
	(581,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:06:50','2019-03-25 23:06:50'),
	(582,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"sadsad\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:06:52','2019-03-25 23:06:52'),
	(583,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:07:01','2019-03-25 23:07:01'),
	(584,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:07:02','2019-03-25 23:07:02'),
	(585,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"asdsad\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:07:04','2019-03-25 23:07:04'),
	(586,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:08:43','2019-03-25 23:08:43'),
	(587,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:08:45','2019-03-25 23:08:45'),
	(588,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":null,\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:08:46','2019-03-25 23:08:46'),
	(589,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:08:46','2019-03-25 23:08:46'),
	(590,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"asdasd\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:08:49','2019-03-25 23:08:49'),
	(591,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:09:23','2019-03-25 23:09:23'),
	(592,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:09:25','2019-03-25 23:09:25'),
	(593,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":null,\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:09:26','2019-03-25 23:09:26'),
	(594,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:09:26','2019-03-25 23:09:26'),
	(595,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:09:28','2019-03-25 23:09:28'),
	(596,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:09:50','2019-03-25 23:09:50'),
	(597,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:09:51','2019-03-25 23:09:51'),
	(598,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"sadsa\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:09:53','2019-03-25 23:09:53'),
	(599,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:10:45','2019-03-25 23:10:45'),
	(600,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:10:46','2019-03-25 23:10:46'),
	(601,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"asdasd\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:10:48','2019-03-25 23:10:48'),
	(602,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:11:05','2019-03-25 23:11:05'),
	(603,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:11:06','2019-03-25 23:11:06'),
	(604,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"asdsad\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:11:09','2019-03-25 23:11:09'),
	(605,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:12:32','2019-03-25 23:12:32'),
	(606,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:12:33','2019-03-25 23:12:33'),
	(607,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"\\u6492\\u6253\\u7b97\\u7684\\u6492\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:12:40','2019-03-25 23:12:40'),
	(608,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:12:40','2019-03-25 23:12:40'),
	(609,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:12:54','2019-03-25 23:12:54'),
	(610,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"\\u7b2c\\u4e00\\u6b21\\u521b\\u5efa\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:13:03','2019-03-25 23:13:03'),
	(611,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:13:03','2019-03-25 23:13:03'),
	(612,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:14:02','2019-03-25 23:14:02'),
	(613,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:14:05','2019-03-25 23:14:05'),
	(614,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:14:06','2019-03-25 23:14:06'),
	(615,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:14:12','2019-03-25 23:14:12'),
	(616,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"1222\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:14:15','2019-03-25 23:14:15'),
	(617,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:14:15','2019-03-25 23:14:15'),
	(618,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:14:54','2019-03-25 23:14:54'),
	(619,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"asad\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:14:56','2019-03-25 23:14:56'),
	(620,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:14:56','2019-03-25 23:14:56'),
	(621,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:14:59','2019-03-25 23:14:59'),
	(622,1,'admin/user','POST','127.0.0.1','{\"number\":\"1000\",\"validity_period\":\"3\",\"remarks\":\"asdasd\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:15:04','2019-03-25 23:15:04'),
	(623,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:15:05','2019-03-25 23:15:05'),
	(624,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:16:43','2019-03-25 23:16:43'),
	(625,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"222\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:16:46','2019-03-25 23:16:46'),
	(626,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:16:46','2019-03-25 23:16:46'),
	(627,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:16:47','2019-03-25 23:16:47'),
	(628,1,'admin/user','POST','127.0.0.1','{\"number\":\"1000\",\"validity_period\":\"3\",\"remarks\":\"sdasd\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:16:53','2019-03-25 23:16:53'),
	(629,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:16:53','2019-03-25 23:16:53'),
	(630,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:16:55','2019-03-25 23:16:55'),
	(631,1,'admin/user','POST','127.0.0.1','{\"number\":\"1000\",\"validity_period\":\"3\",\"remarks\":\"22222\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:17:01','2019-03-25 23:17:01'),
	(632,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:17:01','2019-03-25 23:17:01'),
	(633,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:17:04','2019-03-25 23:17:04'),
	(634,1,'admin/user','POST','127.0.0.1','{\"number\":\"1000\",\"validity_period\":\"3\",\"remarks\":\"dasd\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:17:09','2019-03-25 23:17:09'),
	(635,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:17:09','2019-03-25 23:17:09'),
	(636,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:17:19','2019-03-25 23:17:19'),
	(637,1,'admin/user','POST','127.0.0.1','{\"number\":\"1000\",\"validity_period\":\"3\",\"remarks\":\"asdsad\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:17:24','2019-03-25 23:17:24'),
	(638,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:17:24','2019-03-25 23:17:24'),
	(639,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:17:37','2019-03-25 23:17:37'),
	(640,1,'admin/user','POST','127.0.0.1','{\"number\":\"100000\",\"validity_period\":\"3\",\"remarks\":\"ssss\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:17:43','2019-03-25 23:17:43'),
	(641,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:18:37','2019-03-25 23:18:37'),
	(642,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:18:41','2019-03-25 23:18:41'),
	(643,1,'admin/user','POST','127.0.0.1','{\"number\":\"5000\",\"validity_period\":\"3\",\"remarks\":null,\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:18:45','2019-03-25 23:18:45'),
	(644,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:18:45','2019-03-25 23:18:45'),
	(645,1,'admin/user','POST','127.0.0.1','{\"number\":\"5000\",\"validity_period\":\"3\",\"remarks\":\"76868\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:18:50','2019-03-25 23:18:50'),
	(646,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:18:57','2019-03-25 23:18:57'),
	(647,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:21:10','2019-03-25 23:21:10'),
	(648,1,'admin/user','POST','127.0.0.1','{\"number\":\"5000\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:21:15','2019-03-25 23:21:15'),
	(649,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:21:20','2019-03-25 23:21:20'),
	(650,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:21:22','2019-03-25 23:21:22'),
	(651,1,'admin/user','POST','127.0.0.1','{\"number\":\"5000\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:21:26','2019-03-25 23:21:26'),
	(652,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:21:39','2019-03-25 23:21:39'),
	(653,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:21:40','2019-03-25 23:21:40'),
	(654,1,'admin/user','POST','127.0.0.1','{\"number\":\"5000\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:21:43','2019-03-25 23:21:43'),
	(655,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:22:45','2019-03-25 23:22:45'),
	(656,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:22:46','2019-03-25 23:22:46'),
	(657,1,'admin/user','POST','127.0.0.1','{\"number\":\"500000\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:22:50','2019-03-25 23:22:50'),
	(658,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:22:50','2019-03-25 23:22:50'),
	(659,1,'admin/user','POST','127.0.0.1','{\"number\":\"50000\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\"}','2019-03-25 23:22:55','2019-03-25 23:22:55'),
	(660,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:23:14','2019-03-25 23:23:14'),
	(661,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:23:16','2019-03-25 23:23:16'),
	(662,1,'admin/user','POST','127.0.0.1','{\"number\":\"5000\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:23:20','2019-03-25 23:23:20'),
	(663,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:23:59','2019-03-25 23:23:59'),
	(664,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:24:01','2019-03-25 23:24:01'),
	(665,1,'admin/user','POST','127.0.0.1','{\"number\":\"5000\",\"validity_period\":\"3\",\"remarks\":\"123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:24:04','2019-03-25 23:24:04'),
	(666,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:24:07','2019-03-25 23:24:07'),
	(667,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:24:10','2019-03-25 23:24:10'),
	(668,1,'admin/user','POST','127.0.0.1','{\"number\":\"5000\",\"validity_period\":\"3\",\"remarks\":\"21323\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:24:14','2019-03-25 23:24:14'),
	(669,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:24:17','2019-03-25 23:24:17'),
	(670,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:24:21','2019-03-25 23:24:21'),
	(671,1,'admin/user','POST','127.0.0.1','{\"number\":\"5000\",\"validity_period\":\"3\",\"remarks\":\"2131231\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:24:24','2019-03-25 23:24:24'),
	(672,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:24:28','2019-03-25 23:24:28'),
	(673,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:24:30','2019-03-25 23:24:30'),
	(674,1,'admin/user','POST','127.0.0.1','{\"number\":\"10000\",\"validity_period\":\"3\",\"remarks\":\"111\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:24:35','2019-03-25 23:24:35'),
	(675,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:25:05','2019-03-25 23:25:05'),
	(676,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:25:27','2019-03-25 23:25:27'),
	(677,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:25:31','2019-03-25 23:25:31'),
	(678,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:25:31','2019-03-25 23:25:31'),
	(679,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:25:33','2019-03-25 23:25:33'),
	(680,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:25:35','2019-03-25 23:25:35'),
	(681,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:25:35','2019-03-25 23:25:35'),
	(682,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:25:36','2019-03-25 23:25:36'),
	(683,1,'admin/user','POST','127.0.0.1','{\"number\":\"5000\",\"validity_period\":\"3\",\"remarks\":\"123123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:25:39','2019-03-25 23:25:39'),
	(684,1,'admin/user/create','GET','127.0.0.1','[]','2019-03-25 23:25:46','2019-03-25 23:25:46'),
	(685,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:25:52','2019-03-25 23:25:52'),
	(686,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:25:53','2019-03-25 23:25:53'),
	(687,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:25:56','2019-03-25 23:25:56'),
	(688,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:25:56','2019-03-25 23:25:56'),
	(689,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:25:57','2019-03-25 23:25:57'),
	(690,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"121312\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:25:59','2019-03-25 23:25:59'),
	(691,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:25:59','2019-03-25 23:25:59'),
	(692,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:26:01','2019-03-25 23:26:01'),
	(693,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"123\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:26:03','2019-03-25 23:26:03'),
	(694,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:26:03','2019-03-25 23:26:03'),
	(695,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:26:04','2019-03-25 23:26:04'),
	(696,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"2222\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:26:06','2019-03-25 23:26:06'),
	(697,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:26:06','2019-03-25 23:26:06'),
	(698,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:26:07','2019-03-25 23:26:07'),
	(699,1,'admin/user','POST','127.0.0.1','{\"number\":\"1000\",\"validity_period\":\"3\",\"remarks\":\"123213\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:26:11','2019-03-25 23:26:11'),
	(700,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:26:11','2019-03-25 23:26:11'),
	(701,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:51:44','2019-03-25 23:51:44'),
	(702,1,'admin/user','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:56:29','2019-03-25 23:56:29'),
	(703,1,'admin/user/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-03-25 23:56:30','2019-03-25 23:56:30'),
	(704,1,'admin/user','POST','127.0.0.1','{\"number\":\"500\",\"validity_period\":\"3\",\"remarks\":\"asd\",\"_token\":\"onhUaveYgoJuIHt4ApxAKgwNTdznUVk5oE6fHTTA\",\"_previous_\":\"http:\\/\\/video.test\\/admin\\/user\"}','2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(705,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(706,1,'admin/user','GET','127.0.0.1','[]','2019-03-25 23:57:14','2019-03-25 23:57:14');

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
	(1,'admin','$2y$10$iEf8JKwBIX1S2PWHiVj02uIGa4fSQxOyLj.vSdSMm6B6C9EkVFGEy','Administrator',NULL,'0A16JnQpy2dm5K1xlvO1cJKavmqTG5wNHH4GbmiKitJ8mBRvLtWOinuV5bSy','2019-03-22 22:04:41','2019-03-22 22:04:41');

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
	(6,1,1,'1U1238631913',100,'UNPAID',NULL,'2019-03-25 00:05:14','2019-03-25 00:05:14'),
	(7,2,5,'2U1117730736',1000,'UNPAID',NULL,'2019-03-25 21:12:26','2019-03-25 21:12:26');

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
  `type` int(11) NOT NULL DEFAULT '0' COMMENT '类型0主动注册;1后台生成',
  `validity_period` int(11) NOT NULL DEFAULT '0' COMMENT '有效期/天',
  `real_password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '系统生成的初始密码',
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

INSERT INTO `users` (`id`, `username`, `nickname`, `password`, `type`, `validity_period`, `real_password`, `remarks`, `first_login`, `expire_at`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(36505,'L7SUG2','L7SUG2','6cc1c170de48dc101750e8b0c20be47f',1,3,'356472','asd','2019-03-25 23:57:54','2019-03-28 23:57:54',NULL,'2019-03-25 23:56:34','2019-03-25 23:57:54'),
	(36506,'3AH4CT','3AH4CT','9ec5d1b555847434139eb3b6e7abcdcd',1,3,'207762','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36507,'MA31PK','MA31PK','4d0e44d0e2236ba821d35e29f167f038',1,3,'501492','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36508,'HXNBMV','HXNBMV','60e8084a6af831be488c07aa48422a4f',1,3,'128086','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36509,'HHU1GU','HHU1GU','fc2f1118be7b4d144efa3b07e53d826d',1,3,'177278','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36510,'RM6345','RM6345','5f5297aa0e148e2e7ba77dcf76211bca',1,3,'341703','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36511,'JLQSTJ','JLQSTJ','f1cf1ba2da4b13f3f26606029a40c595',1,3,'711680','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36512,'AKSSQ8','AKSSQ8','98f70b2a6bd19a467655d9c1d9c5b66c',1,3,'212253','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36513,'9MJU82','9MJU82','c8b904be704fac296f8e8724833ac4cb',1,3,'102995','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36514,'NFNRXL','NFNRXL','2554484a7f99fbbf99142e7d7c0b9f0e',1,3,'779117','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36515,'68RUVC','68RUVC','17c7b3319475c7c86a32b69c3870d21f',1,3,'971641','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36516,'8182F3','8182F3','a24a46f54c0b28b33dd12ecdc2355b7d',1,3,'155640','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36517,'EHKTHX','EHKTHX','50cce5cc9d9ba38e9d0c4be7720d2d93',1,3,'665782','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36518,'TPGSD5','TPGSD5','775fea36815a24d46512785f8ef0102d',1,3,'943278','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36519,'A6A8AK','A6A8AK','744f89938d0b389099edf304f01fea9d',1,3,'504496','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36520,'Q2N4QE','Q2N4QE','669cc6388878761b99566e9f5f53a12c',1,3,'461510','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36521,'K69X3A','K69X3A','a6ed7c994d03f39cd855368460fdac77',1,3,'142995','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36522,'CGDT2M','CGDT2M','e99f8b1f4b22e85f3ba14a339ebdb29a',1,3,'150039','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36523,'SD6K7E','SD6K7E','bf2c4601b1e7f8c00cea63ac8324d9c3',1,3,'482582','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36524,'68X5MF','68X5MF','b320018292f6e987bcc5c3f3c90807cc',1,3,'724306','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36525,'RLB7Q3','RLB7Q3','b25c70686eb0d4c54ce9e9dec422e615',1,3,'756466','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36526,'R1D7EC','R1D7EC','392371e7e83777a683edd34385a0822b',1,3,'262958','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36527,'SXF3VA','SXF3VA','394dbbbe8581d057d54d6cfdf436b2e5',1,3,'479707','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36528,'NUW2N8','NUW2N8','155dc7d4ae19de21348a3d21a100f86f',1,3,'605314','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36529,'THM62D','THM62D','12caa76cd4510d029885d04b3c0f09fb',1,3,'448646','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36530,'4DQK4Y','4DQK4Y','b4c8307ccffdae5445e3463b5af39894',1,3,'402325','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36531,'AG8Q7X','AG8Q7X','11866653fb005f4d91b0770f0b4026c9',1,3,'519645','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36532,'L3D4BJ','L3D4BJ','1878605742edb9b142a2485d1b484b29',1,3,'818797','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36533,'BVPVNY','BVPVNY','c3b206f07ba07333bdfba9cb2613372f',1,3,'623155','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36534,'Q9W8PU','Q9W8PU','3c746b682d082652e55034864e69a32a',1,3,'279098','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36535,'2RCGHR','2RCGHR','60ca4775c32017b11ce18995ef52c4f5',1,3,'165680','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36536,'28M2UN','28M2UN','9f25dffe1db2fdb61f39c00c6644cd20',1,3,'312859','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36537,'Q2MWSL','Q2MWSL','04cefa8ef689ef2b7acc20ab0fa31111',1,3,'350876','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36538,'R4N8QU','R4N8QU','4a47fdbb84e73b91fdd98210258b0dc1',1,3,'270416','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36539,'4CN9K3','4CN9K3','7349cdc928cf3d469985428c6ae64cdf',1,3,'107082','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36540,'QD2M5X','QD2M5X','a78759dfbf7cc6706d50625efe72e174',1,3,'885564','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36541,'P378W4','P378W4','81de7f421015d02b8322e254815793f7',1,3,'715139','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36542,'ESVDYP','ESVDYP','4c36ddda7b42968d4534fbc6dd68a90a',1,3,'200407','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36543,'VHNJ4Q','VHNJ4Q','59b79a567e7ee830627e8cb147fc8e5f',1,3,'309873','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36544,'TPMC37','TPMC37','5550e3de79f1a14e6bc109501047e345',1,3,'344948','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36545,'2RCHUG','2RCHUG','22dfc8d1aa6b2139b5d2bbb4a549c8a0',1,3,'434292','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36546,'Y6W8V9','Y6W8V9','4f67a26c0b6de1ec69e56dc5f5046d41',1,3,'788567','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36547,'JBEXJT','JBEXJT','46d6f87f06db6e5926dd1a652399cd02',1,3,'562016','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36548,'BJ87VC','BJ87VC','d07fc76eaa9e4df7d20945d731077b6a',1,3,'343186','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36549,'WC6AHM','WC6AHM','458cd336cc7dc9ab622f8af1dacf3383',1,3,'930537','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36550,'58SV5T','58SV5T','81e421d33df0d74f165c2ae459f74760',1,3,'371197','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36551,'PPHEC7','PPHEC7','8a59631d059698c70a55c97168426264',1,3,'573603','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36552,'BKJ2EU','BKJ2EU','5a14fad9b0fbd7c2d20995f23d883148',1,3,'861870','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36553,'VHE5FM','VHE5FM','3289805c6246b9ab72247e0cc56ae655',1,3,'929962','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36554,'FMQWGY','FMQWGY','efa6b825aafe44bad6cdf809a6028ded',1,3,'761683','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36555,'HNMVTF','HNMVTF','7b85ec7480b441da5c5166f441af8ba4',1,3,'929988','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36556,'4V2VSV','4V2VSV','3529b20321508d579b96482376e24d54',1,3,'144795','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36557,'HY1BFH','HY1BFH','2b4aa08ee2a68f39d6d251099a033408',1,3,'228466','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36558,'RQ4D62','RQ4D62','c2957916f105d16be76986748beab8cf',1,3,'397131','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36559,'EPBYXY','EPBYXY','cd7ab3eb20d66f831b182882d85aab26',1,3,'560872','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36560,'J1WE3A','J1WE3A','b8f90451c17123cc0229746a4eb8e432',1,3,'750915','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36561,'7B9N2P','7B9N2P','1ad786fde8bb3ec4eb88d6493b287685',1,3,'828277','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36562,'D9KNJA','D9KNJA','bb6dd1bf95573bc0c8bc1408bbc8f9c3',1,3,'825097','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36563,'QPF5L2','QPF5L2','e1f2ac105fe69fda74a58f7fcc697c0e',1,3,'277321','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36564,'6SWF24','6SWF24','669bb185c1a4acceae49ea6d274888e4',1,3,'600183','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36565,'Q6DM9S','Q6DM9S','ca0f3364c07373511f98d061eb4dbd3a',1,3,'479414','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36566,'F9SVWX','F9SVWX','d3d64284672b037e7b51aad4adf6018a',1,3,'549226','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36567,'WKGJEQ','WKGJEQ','53208dbbfe8e7959823f35e262ab8075',1,3,'304975','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36568,'3NA4YT','3NA4YT','ed31bcf8d36d5e9d51a1ba455d1ebe85',1,3,'207122','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36569,'M35KEK','M35KEK','e51cd177493e02c2401a12ddcd78a9ed',1,3,'277347','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36570,'T5R8JD','T5R8JD','4307f0f7583562e9ec237cfbc4fbd4cc',1,3,'427184','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36571,'LAGU59','LAGU59','928fbbed2e0abf2393540c0e2a1957d6',1,3,'597068','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36572,'HYLL7B','HYLL7B','2d2edae7fa18b4ebd67574ea5965ff2a',1,3,'436053','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36573,'T95NFS','T95NFS','80a12b7b39ce6f1c202685a2d27b1325',1,3,'712269','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36574,'BN2546','BN2546','7706ce7f0bceee17f79cbf2110d6f765',1,3,'900169','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36575,'Q93GGH','Q93GGH','f7b0ef6e807ede2766074c47ed9e6978',1,3,'974029','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36576,'LR6MRC','LR6MRC','0544d58c65b05cde6898142f95ad4de3',1,3,'245512','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36577,'BH99YE','BH99YE','1118049709437ede06222dcc7da124cc',1,3,'283226','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36578,'U5HHS1','U5HHS1','aff79a3c31d44270d55a94d48cb51437',1,3,'933891','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36579,'9C2G8L','9C2G8L','b8b496422c6993e90587f5bcf3547628',1,3,'419124','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36580,'VCVW7D','VCVW7D','dac2ff3d084361aad2e887ff994caa1c',1,3,'204217','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36581,'4WLQ2R','4WLQ2R','e4b94a88951def4848d141c0981a4242',1,3,'157023','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36582,'TXTNSQ','TXTNSQ','629b5bb00786a796fa5e276b4d5d3ad2',1,3,'873230','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36583,'3Q5SQN','3Q5SQN','24bfef5d26a00502d5c805e9ffc1a232',1,3,'138619','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36584,'W2GVDB','W2GVDB','4ee2aed308e9e6a7c6d7afc45b71143e',1,3,'749428','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36585,'ERYL3X','ERYL3X','acd63a0cbfc4816ccab7a057116f7e3c',1,3,'539421','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36586,'6QGFKL','6QGFKL','1cba370c6a7f5a8b2014788e9ab72f43',1,3,'905217','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36587,'5TWNJ9','5TWNJ9','994d01a9628f104801d76f0dc0b6b29e',1,3,'870041','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36588,'89LRK1','89LRK1','5686121cc7f4c8e4cc6b28072dac2384',1,3,'373005','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36589,'GWRNUN','GWRNUN','509a197a51f3df65a329af5a3d1e3372',1,3,'802072','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36590,'WRWQ3B','WRWQ3B','1de50d94c5d5cf66ac8fdaeafae02444',1,3,'838032','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36591,'4221XU','4221XU','5f7aad4eb09c4ad7cdf231b74eee60a8',1,3,'166220','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36592,'R4N5SK','R4N5SK','bd39d3fbe00812d1d1da6f6241bf05ac',1,3,'577672','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36593,'D7C7HQ','D7C7HQ','25346b0827d360ce7ca5c4cf59c6d564',1,3,'383319','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36594,'MYAUBD','MYAUBD','8387170682a44d221b5ab798d0351b05',1,3,'513835','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36595,'WPPVHL','WPPVHL','238886fee5df4ee0542b51521c037baa',1,3,'609451','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36596,'Y8FJA8','Y8FJA8','c66a4ee6445d7dd3ef40487ec7de58c7',1,3,'533298','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36597,'6P2HGG','6P2HGG','c7f7beebbea3a839e0157c1c5177a737',1,3,'109176','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36598,'74GH5P','74GH5P','02763473a177f4576019c5ee5970f0e8',1,3,'383040','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36599,'79KF5A','79KF5A','b33597002a719a2785e320485674125d',1,3,'297824','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36600,'VP19UR','VP19UR','96565ad89e321d22cacf1255e7de14dd',1,3,'915763','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36601,'W69HTG','W69HTG','9979ac2a64bff457b20a7feba6c07f78',1,3,'607641','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36602,'TA645U','TA645U','2d162a8e6449e51b76458071a5717419',1,3,'293917','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36603,'HTDQPB','HTDQPB','5f8a9f098ea9c95c197b4fafeaec1ca4',1,3,'872607','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36604,'5NVABC','5NVABC','bdfb3373b4558da2ac17d3ad1baf2f78',1,3,'199252','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36605,'GHMMME','GHMMME','38ab55906651ea0fa0a5748e90194179',1,3,'621604','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36606,'3DLD25','3DLD25','0f1d065ccbc575a1154ab61febb8dc41',1,3,'381870','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36607,'MQ29YH','MQ29YH','1350ed11c3511d124d05f120beb06c01',1,3,'742398','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36608,'VEDPH8','VEDPH8','ee0a0c796699ecfc923359c0e1fc7e04',1,3,'681773','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36609,'BK7UB4','BK7UB4','04c17e66293b862fb96daa33d63290d3',1,3,'782634','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36610,'4PPSA3','4PPSA3','b5732525ba2a43547a04350db468d22f',1,3,'133301','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36611,'QQGF4Q','QQGF4Q','df530ace263fafa6f11b61b68e98380c',1,3,'261778','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36612,'W9SSGN','W9SSGN','57d489cf6110c1b4eb3da68ffed38350',1,3,'949705','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36613,'AM5C77','AM5C77','b74c2685800d68b3340698117ab358c8',1,3,'652472','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36614,'HG531Y','HG531Y','ed8a721d50b469f2819db02938833bf3',1,3,'547766','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36615,'UKTWBU','UKTWBU','e2b45e2cd283fbc2d0f636cc74e13144',1,3,'252441','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36616,'VYAFNM','VYAFNM','dd8276699488d01a29e1c212a397bed6',1,3,'621281','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36617,'MGR42L','MGR42L','3038856c533ad1bf845eb507375b26b1',1,3,'537908','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36618,'J93VMU','J93VMU','dab503862e149f4604674887b1fface6',1,3,'816839','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36619,'YUUHAC','YUUHAC','e0384273cbf9c94aa12f3fcc4bac56f3',1,3,'840513','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36620,'NL58CP','NL58CP','ad60c21fb2ac62b2fea81eea864e4caa',1,3,'928047','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36621,'6QSMK9','6QSMK9','1dd0356d8c418a1fb1b2ee8e84d11a0c',1,3,'929371','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36622,'CC4YPV','CC4YPV','ad389707306632791a4e772e1d1d5ab6',1,3,'950558','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36623,'52T4RT','52T4RT','c69e5f79181b8b92337b9c28303b9cd3',1,3,'857752','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36624,'WDSY94','WDSY94','d26b41e59548bef9bdfbe8951efeebb6',1,3,'574742','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36625,'UE8QK3','UE8QK3','cf4ecfa1f13397bd306912b076dc6682',1,3,'599912','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36626,'N589HX','N589HX','7f29c38d7eb9d9c809d285544f68fe86',1,3,'486106','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36627,'2URRG8','2URRG8','94f8974c095accc6f0283191abc484e4',1,3,'687249','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36628,'4VAUBW','4VAUBW','babf21ef44f52a296b595541bc9374f1',1,3,'774004','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36629,'R52V16','R52V16','a6e98a210406360fb0ceb070ceecefb1',1,3,'918425','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36630,'J7LN61','J7LN61','755f8d5906f27c997d5e2027efb13521',1,3,'910541','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36631,'1EN9LV','1EN9LV','3fd46647ae13d105d72ead04b7b130a2',1,3,'401816','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36632,'S3XS6V','S3XS6V','bea02341f1569129c24941eb657002de',1,3,'498003','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36633,'AJQ55X','AJQ55X','b9b33c3e4348a0cb09afc2112695e94f',1,3,'847970','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36634,'EAK3YT','EAK3YT','56714450e82b3ed69d21fff752b04e5b',1,3,'780105','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36635,'KEFVKM','KEFVKM','527e0fd9d7d16a5bcb2c475322b45c91',1,3,'579655','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36636,'7DL6XM','7DL6XM','5f246747f3468d28af8a4b133b48fc7d',1,3,'400534','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36637,'94T8N3','94T8N3','4adfa87c26105793b0eff3170d78a55f',1,3,'407198','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36638,'19B75L','19B75L','2715ec81fe7365fee8ea3b17b9403432',1,3,'449444','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36639,'9EVN9H','9EVN9H','6de05c007ee1d25498588293ff9e9f24',1,3,'151805','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36640,'8WYE3F','8WYE3F','560cbe612e4dcead5b0673d36a3b095d',1,3,'432320','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36641,'3YCE5E','3YCE5E','4ac7904e25cca9e25bd6b85e8d0ba15e',1,3,'908567','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36642,'PPRDNQ','PPRDNQ','a7c3a15386d747d8b4cda2ebba9d2425',1,3,'998088','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36643,'9YMANL','9YMANL','b83b93c6a483192e4df1e4d4e1ecdf39',1,3,'783276','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36644,'BYV67F','BYV67F','0160340d74ca6c073b9a5f7041f3d273',1,3,'153280','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36645,'8ATNJJ','8ATNJJ','86c9d4e04b99f7267d03868c40faa4da',1,3,'391293','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36646,'79HS28','79HS28','ab18382f12581ac824eefe127f850a9d',1,3,'386441','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36647,'SELB4P','SELB4P','0948038751c2cccb7380c6670c6239af',1,3,'795410','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36648,'9SL9EK','9SL9EK','952773357a643ac62150bd960153cb3e',1,3,'293187','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36649,'68QJ3A','68QJ3A','5a606918e7611466211d25d54274af75',1,3,'687301','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36650,'3CU1NU','3CU1NU','f7e33881bccdf7a8f1018c773cb51c4c',1,3,'675218','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36651,'SAMJ9E','SAMJ9E','8950a1a63f17646157cc28d04257e35d',1,3,'703646','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36652,'LYJV5J','LYJV5J','5d0d6a1ea914f1d67d9ba799bb4142d0',1,3,'241514','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36653,'NCE9B6','NCE9B6','2473a9861f1df624d75dae078be1b42d',1,3,'655009','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36654,'B6AGBK','B6AGBK','598d511d4f02b66ff09a344d3100f9ea',1,3,'724206','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36655,'HKUBUV','HKUBUV','d2d3ab06f00fc56729b3f0a340ac5997',1,3,'769530','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36656,'RA6E4P','RA6E4P','520684a69503b6dff02f30e0d2e0993f',1,3,'970538','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36657,'Q8S7TM','Q8S7TM','cedeb81744f9b1a6914a9894863e86b9',1,3,'646612','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36658,'Q6D35Y','Q6D35Y','195614bc0ad00e10566697e5b8247ac8',1,3,'983840','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36659,'TD9M6X','TD9M6X','c57ddbb0a02d4a20afddb2e8e9db8250',1,3,'165770','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36660,'VM2TS9','VM2TS9','edc7dd9b48663b1f6985182b2794ca6b',1,3,'864354','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36661,'JGC7D5','JGC7D5','d425999501c673a4e365aa8c55ec1c74',1,3,'572892','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36662,'2DXGUY','2DXGUY','db5d1b1ca843cbad39c74c68caa82ab5',1,3,'705294','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36663,'E3KGJJ','E3KGJJ','e8d036f32201b9c2cece35c67d14290c',1,3,'124200','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36664,'372T6H','372T6H','b05129578482516f276dda7a3186e5c3',1,3,'269868','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36665,'C5HSM1','C5HSM1','fb99f8f547ad84d0e625a86b52460cf0',1,3,'594071','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36666,'JV643P','JV643P','b149e4ff7305f4ffe58a44841630eb80',1,3,'965667','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36667,'URVS46','URVS46','11e2fd23a8d0c4879bf8c4957ee13822',1,3,'385601','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36668,'R251EC','R251EC','b943f1d258de5f98809cb713065fc2a4',1,3,'446236','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36669,'GWTSYA','GWTSYA','68dd6ee505a7ff9679ea26435c529366',1,3,'496646','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36670,'6PQWE2','6PQWE2','9d8ea9ee95ab5ab6e0a4843e8b0ebb7b',1,3,'224035','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36671,'53WLWJ','53WLWJ','df15b2aca3956347ddaff4918c2782d4',1,3,'461282','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36672,'PUJENY','PUJENY','22c5589be9407ea48da0166d9561cfc8',1,3,'259537','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36673,'F642NL','F642NL','96d6f297f20fabc52952fed1760a4956',1,3,'947322','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36674,'MSN1RE','MSN1RE','75f1ecd73cc0a597a2720d8b7154edd7',1,3,'224878','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36675,'DEVVJX','DEVVJX','0916883479855c9e7c071df014729c8a',1,3,'404575','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36676,'JYUVRT','JYUVRT','f001cd21736992ad040dfb84379d6508',1,3,'971742','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36677,'LXSGT4','LXSGT4','cb343999bfe4649e2294d3a21b3d928f',1,3,'475661','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36678,'6CTM7C','6CTM7C','54455788321cbe70af2ff858e67d2c53',1,3,'387308','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36679,'1PB4FW','1PB4FW','24ed53caa282762c6e558811ecd10a8e',1,3,'996007','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36680,'BV5RKG','BV5RKG','664100ebd2c90bbe49fd684eb2debe9c',1,3,'464275','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36681,'CCLPH9','CCLPH9','1e4aaf1dffc0344ea6840f470cd4a021',1,3,'716456','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36682,'48P896','48P896','7d1c39c27c21adad9519f34181c130c7',1,3,'135354','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36683,'4VV3NC','4VV3NC','417b79f4f0909e3d565fb272e3520918',1,3,'145038','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36684,'WMN2SG','WMN2SG','de414d90b678f9d379f17054aca6a130',1,3,'139532','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36685,'2ARL17','2ARL17','906cc0b4cad0f21acfaa32f06e7825e7',1,3,'590445','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36686,'548NRE','548NRE','a691d5ced949bbab9cb394052e42ab39',1,3,'509314','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36687,'EEEYCN','EEEYCN','ebf6219c16cdab7476f8faebc57c3eb1',1,3,'896896','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36688,'5A8VGQ','5A8VGQ','7ecdac483fe54d501d63949805f1d24f',1,3,'141330','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36689,'NG9RHM','NG9RHM','aec2ccbba4de4abf5935ece278f60193',1,3,'594330','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36690,'5QM2MV','5QM2MV','82b929e3fa2b8824aa4e8d4c00a31c25',1,3,'343927','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36691,'K9SDGN','K9SDGN','5278bd5059f34b9472980991e0870d41',1,3,'818290','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36692,'DKJPX3','DKJPX3','b6c52ba7abb543b3924872c4e3c8f3f5',1,3,'371679','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36693,'LM7QTT','LM7QTT','a291e76bfe3588210b05a8407d33e743',1,3,'661035','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36694,'GFJMVS','GFJMVS','a655480e25c51ed8ba76fccb5cef8136',1,3,'395847','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36695,'V2N98B','V2N98B','59d0db17658699fe864e91de581fd77a',1,3,'475218','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36696,'GG7XFK','GG7XFK','98256de2c49e5f52e580d0c1bf21c512',1,3,'479321','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36697,'1CK35L','1CK35L','3fabb335e143d4436cd37227142544b9',1,3,'531913','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36698,'CWLNWW','CWLNWW','a49a00b972bc9e55e4aae2f14ada1dd3',1,3,'590842','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36699,'UM2Y6C','UM2Y6C','e71d41a016ba8e3e5577244d4ea7db1d',1,3,'708999','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36700,'W46YMY','W46YMY','06e8ef7f13c4064553e2df4177759845',1,3,'655162','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36701,'MUM577','MUM577','e3a5a55b124b1af0e71e4b3232ab6058',1,3,'612487','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36702,'WDU167','WDU167','dbb71c91bfe1605553312d6524c0bff3',1,3,'342173','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36703,'H73X8T','H73X8T','7cf470992fdb1c5b4115eb807496ae38',1,3,'385186','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36704,'X2YBS9','X2YBS9','a007b64e65b52d373019b3126b6c6e2e',1,3,'761285','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36705,'AF6LK7','AF6LK7','ecea2053fe475c60888b2ea9321338f7',1,3,'445967','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36706,'C8NNGF','C8NNGF','520d68969085b4b038805bee2b5f89ac',1,3,'622703','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36707,'TNL364','TNL364','fee5349f5f8c7a1dd41be40d5a14e2e5',1,3,'281452','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36708,'LMKJK1','LMKJK1','c4a76ff3b852bdfea778c4243114cf29',1,3,'361653','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36709,'UDTLAU','UDTLAU','1f02d00a6688c3806183d0b2c2e90dbb',1,3,'524401','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36710,'E9UHPC','E9UHPC','5344cfbe8cadfea9b23e471dc13750d9',1,3,'799611','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36711,'DRC3E7','DRC3E7','e22c17c60d56ae6c5afe04b4e26b563b',1,3,'240310','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36712,'8B97F3','8B97F3','f873a087df7b9b90896f10165b7d59d8',1,3,'911696','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36713,'27UBT1','27UBT1','50dc0ca8616c7696ac8f4cd5b90395b2',1,3,'283089','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36714,'81A93J','81A93J','6585edca6f693fd114edb20b0552d883',1,3,'687702','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36715,'G55KNS','G55KNS','2e4f0a1f3f2826bfdc68f960f220e87d',1,3,'891290','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36716,'TPPXEL','TPPXEL','2caa0f4ae340b8c6d4c53b89b3b4336a',1,3,'456990','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36717,'GXH2H4','GXH2H4','2b22b563bf75aa3de191195f4be1dd08',1,3,'714380','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36718,'TFP52L','TFP52L','80df42ad83f9bf8a3439a87aee47b1e1',1,3,'383639','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36719,'AEWJGN','AEWJGN','9c3b2add5fa954436c3796b03e7316b7',1,3,'788797','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36720,'GN4SHW','GN4SHW','e99825c178861d4165b4c5382297926c',1,3,'305469','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36721,'K9NPTF','K9NPTF','153e13b5e618d9cc1949327b619e9f73',1,3,'118264','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36722,'XRXKHX','XRXKHX','fdede5e51eb87d676a11b81f1415d8a4',1,3,'856136','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36723,'NEDMRD','NEDMRD','9552febc6ff0fe89018c863980027e53',1,3,'135453','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36724,'577G9S','577G9S','d3a5b65877d6b2ad9a9bbe6738949a79',1,3,'447319','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36725,'9RVY1V','9RVY1V','e68b328dc08159013427a8e49b8fabbf',1,3,'759391','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36726,'YA6CH1','YA6CH1','22cb1c1506aadeb91a12f95626fff841',1,3,'997094','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36727,'PJFYB6','PJFYB6','2c91e8e1ee9902dde040ecadc4d4a15a',1,3,'491186','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36728,'8UJQR3','8UJQR3','e13ab50bb42f36ba0fb682838dbd95f9',1,3,'839112','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36729,'XN26DL','XN26DL','211df5480ec34108c4bed93022e3d05c',1,3,'753220','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36730,'FFRSW7','FFRSW7','04ecdd3ff6c797b4f5c28e97a444f595',1,3,'815960','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36731,'633DK8','633DK8','fd082f2bee3cdd0553586d98b64da2a2',1,3,'633846','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36732,'WYQHX1','WYQHX1','b209c57ad1f11f8418b991d6a782448a',1,3,'446006','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36733,'4G4HAV','4G4HAV','922444d87f40c3e5f1c76decdcea3d57',1,3,'669026','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36734,'S38C8Y','S38C8Y','7eb272d51186dd978732e9b765da9e9b',1,3,'513605','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36735,'CJMKA3','CJMKA3','adc9a2cb065f03bebf05d52f83226b4b',1,3,'349330','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36736,'F1MG4T','F1MG4T','d4fce27167cfe7fc295fecd259744b3f',1,3,'995357','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36737,'37Q5UY','37Q5UY','79a0e9c520104773e13ccd072bc956aa',1,3,'242066','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36738,'9MDREU','9MDREU','3b6304218c59762db8e4615aab7e0d94',1,3,'402296','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36739,'GNG8FF','GNG8FF','9a88e4d66873d3523bca050260f241ef',1,3,'211914','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36740,'6V6R86','6V6R86','4cd70395e5f0ff9c1d96a2609f219361',1,3,'316880','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36741,'JXQMNU','JXQMNU','36183af00820af02dc34b9f2f9e783e6',1,3,'936487','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36742,'XM367K','XM367K','e8bd0aa509c1d631c4068137f9abecd5',1,3,'495732','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36743,'BQSP45','BQSP45','e6c7c37b7b3982be6ec9328480f7130b',1,3,'230884','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36744,'V4HTG2','V4HTG2','a89531cbeb632dfe39cff2a0bbfa0af0',1,3,'332923','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36745,'U54PDG','U54PDG','133eb4575dc58ef51c31b9c35fda6a94',1,3,'546457','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36746,'6JJ5ST','6JJ5ST','23c0b2cc2754856d376957c75edb371d',1,3,'112081','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36747,'SL99CS','SL99CS','cf6b633d54438f70ae53294221045dd5',1,3,'163308','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36748,'6BU7LE','6BU7LE','11b3aa8d84dc348787d00f49b1beba55',1,3,'831715','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36749,'LQHLHR','LQHLHR','1f887fce1d74d99e3b1f75e843e5795f',1,3,'554281','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36750,'YF4NGJ','YF4NGJ','02d29afd8f95c8645fedc07fd0b3c23b',1,3,'255786','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36751,'5AG666','5AG666','02fe211983bf38ed4649d93975438f46',1,3,'645520','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36752,'J3XS4X','J3XS4X','85e18c3e769ec68cb94e6a5dd92b5547',1,3,'363982','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36753,'KCNHF2','KCNHF2','3dac2c5b190f4b9122938fe289611deb',1,3,'452996','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36754,'SRWU6L','SRWU6L','ff095c82df21830b08192452e24e067d',1,3,'809574','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36755,'8HRLPV','8HRLPV','7dcf1ed01da67860e67b56da05cbb3b1',1,3,'929775','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36756,'T1DAKW','T1DAKW','66ca0b29e7f3a642507594206cdb77bb',1,3,'318397','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36757,'YYP8FP','YYP8FP','f53302c072dbfb21c657f244e69b0115',1,3,'784301','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36758,'XSLCM3','XSLCM3','6d6f53573c30ffc6b3b333d129110ad7',1,3,'683863','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36759,'9UCLJQ','9UCLJQ','b7a57985fa054833fc1f292e63b5e86f',1,3,'215147','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36760,'JDB3F5','JDB3F5','78327a7e1038a749655311a0b54c8237',1,3,'580678','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36761,'H72DYN','H72DYN','5386dc3001c7c62f777d51aec10fff82',1,3,'274723','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36762,'GH2271','GH2271','a716e0021b50d23bc2b8bf32f5acef64',1,3,'324604','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36763,'ECTC89','ECTC89','23481251ba23b18f9a8bc7437184b5f9',1,3,'653876','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36764,'RPH9QG','RPH9QG','50c05ee0f5d07e53853eec3e639f7eb7',1,3,'182726','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36765,'USF7FC','USF7FC','06478053b4cc53da4e423c448c3ad27f',1,3,'143610','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36766,'99HVS8','99HVS8','d48e2f6c109766ce7bfd47f2cbb71e6c',1,3,'541789','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36767,'RS2N69','RS2N69','b21df5e5f55c75fa6f324e70bd629196',1,3,'319395','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36768,'5388NW','5388NW','66d0db2eff9938816108b6b3a688e2ef',1,3,'266102','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36769,'KMCYCC','KMCYCC','d2289766486aaecc2ba035005097e6a2',1,3,'721377','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36770,'6Y89XK','6Y89XK','6fecbff08c1de6596466f6d2a89d5b53',1,3,'211487','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36771,'TDTSSY','TDTSSY','2c9888e98e228992af138c94fd50e7a0',1,3,'596297','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36772,'9CCMJV','9CCMJV','398188050227c7f1c8b3045a0a865105',1,3,'956173','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36773,'P13RNT','P13RNT','697ce04df23611c4262b3b66eef14f2f',1,3,'237372','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36774,'GWW4J3','GWW4J3','8fea6b52ac937ae83144fe3a4d7768ab',1,3,'970084','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36775,'WGFWXC','WGFWXC','b59d768971c8e78312b7a47aaee30519',1,3,'567592','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36776,'ETRQQ1','ETRQQ1','6fe55f135c7bd571cd25c6ed4a38e0de',1,3,'793320','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36777,'1VS4Q6','1VS4Q6','92e56624abd36ff4bcada7da264e55f2',1,3,'831626','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36778,'L9V55W','L9V55W','c3e924560b9143c6f19d6741c36b87aa',1,3,'548274','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36779,'QD5225','QD5225','617b99db869bb72f9202254f45eb6b39',1,3,'325035','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36780,'3KPKSB','3KPKSB','ec5d9ed50a60638c968c0194d6cad800',1,3,'884280','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36781,'KDW16R','KDW16R','55679c90c5d9c2e1048b3c30f158920d',1,3,'817530','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36782,'X8PJP9','X8PJP9','298178e09909c939b749f02acdb2a956',1,3,'637112','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36783,'G3FTSN','G3FTSN','dbc7a208362889754fa1ccc112de20c2',1,3,'928960','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36784,'3U1TUB','3U1TUB','d582c4777763424842bce90808126b69',1,3,'649476','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36785,'GNSAJ6','GNSAJ6','389361d0c4f81283e8d615031b29fff1',1,3,'608968','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36786,'12EEBK','12EEBK','5b645b620f67e2f5d72e5ebbc16c5aea',1,3,'277364','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36787,'L1GPW8','L1GPW8','fde3df7fec600cf67ad7ef2474f30495',1,3,'942030','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36788,'18WAPG','18WAPG','45b38a254873b43b667fffc0d3397f31',1,3,'856043','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36789,'WQRG3T','WQRG3T','0319e2b90001c0e54325ee5a3bc6428a',1,3,'602913','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36790,'F11GWP','F11GWP','4ed323b9b0467847a39f8e1cec317ac5',1,3,'530551','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36791,'5HNKJY','5HNKJY','0c3866c0573916d508a28369879ec37e',1,3,'533120','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36792,'26N8SY','26N8SY','92c7c9624b1ea8bc5392cadfe0fe052d',1,3,'312752','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36793,'VAG9UA','VAG9UA','88f3b3d5bd458f8142af02f937cfa722',1,3,'703944','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36794,'4U6KWT','4U6KWT','04f2ecf9b386186fbd9207c11a264464',1,3,'471825','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36795,'BKJ7F6','BKJ7F6','69661f92c86d439057118c9d007b18b3',1,3,'102381','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36796,'8MV6Q5','8MV6Q5','9dad40c3163b72b483d87dc8b4562365',1,3,'944905','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36797,'BCMVYW','BCMVYW','0696d9a2b0d348ca0a97380ee3d37eb4',1,3,'173007','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36798,'P8MFGA','P8MFGA','3a4838d416a88ab8bfee5029318cf7e4',1,3,'257621','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36799,'EJBSUF','EJBSUF','f0b0bbc93284cae201d31afe7763b396',1,3,'436402','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36800,'DYHVKP','DYHVKP','6f6d01d585363d6dc1622640bb4fcb3f',1,3,'701242','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36801,'XND184','XND184','34d71968bcb1c1101f8d0d931c711754',1,3,'370297','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36802,'YKRRFF','YKRRFF','20d20b2b9d1d4dd482e3bfe373c2bda2',1,3,'447484','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36803,'6TMT4N','6TMT4N','7b76c1c8f50d921fc103baddc227b04f',1,3,'706173','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36804,'TN2V56','TN2V56','57967195731a23f152c655319dde995f',1,3,'979812','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36805,'CTPW7R','CTPW7R','da8bc728476341632a56e7a93359e1b1',1,3,'317506','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36806,'L2VYSY','L2VYSY','9300ddd264e9de1113f7c6a7dac1c403',1,3,'247926','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36807,'45UAUU','45UAUU','5c3741fc3da7782a13eb719e8a21cbc4',1,3,'278350','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36808,'8VFAQJ','8VFAQJ','2eb4ecb635ae8517ea29178c75aa2c0e',1,3,'462806','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36809,'3777PM','3777PM','c269c891a72f28a2999af460bdde0ae2',1,3,'258765','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36810,'LGX3J1','LGX3J1','b83dc6e505caf9f5e90f27a3b3ac5c58',1,3,'294392','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36811,'L88X8X','L88X8X','3f54bbc68e4911ec152d2fe641e41355',1,3,'564894','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36812,'DC52JB','DC52JB','2b563bfdc1c03f10f3db828e689f2c61',1,3,'805853','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36813,'JJEA37','JJEA37','65d198b41d18485cb23ba085a7c4cbba',1,3,'126505','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36814,'TGNKKQ','TGNKKQ','d56d0bdbdfc2568f4ac7e740ff765c92',1,3,'507492','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36815,'FDTUKP','FDTUKP','347133293e79ab3b1cce03b6d1d81421',1,3,'801666','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36816,'BBD9P3','BBD9P3','a57b33a3a9a949172bec68ab7e5266e0',1,3,'868956','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36817,'LTBJ56','LTBJ56','2782341594899d3c425b4fbfbb532d32',1,3,'114675','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36818,'58HM7R','58HM7R','7128bff23a133cbc354ff8e9fb308ae2',1,3,'189763','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36819,'TSNAVB','TSNAVB','ad9e7fc1d121c8d3652fa5348865e1ea',1,3,'354498','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36820,'Y4SPML','Y4SPML','56b6ac62cd1118a4c36375652d178b8a',1,3,'906167','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36821,'CMMM6R','CMMM6R','094de7ac35661291a9e8c09cce4b504e',1,3,'498263','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36822,'UEA7SX','UEA7SX','2e94e308d36b87b8d704b88c33a657d6',1,3,'395655','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36823,'WN7XNS','WN7XNS','24af6615a9822b1d1814511209366ee0',1,3,'818067','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36824,'TJYPYR','TJYPYR','1c538b3bc1338dcdcf6d93596baa97a5',1,3,'688981','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36825,'TTKPVL','TTKPVL','930041897a3e266ee0cfb2f6f6e764d7',1,3,'940397','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36826,'L2Q7HY','L2Q7HY','361e30b846bbae4426ee62c8a0ae747c',1,3,'814618','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36827,'499X6J','499X6J','0cf6d68d588eea7a73f3cc454c130051',1,3,'289157','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36828,'8QDRBP','8QDRBP','e0d261b6caa9e65111bb60793902ae70',1,3,'540962','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36829,'6WUGWJ','6WUGWJ','fb2973060eab70fd342f72e56362d253',1,3,'708435','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36830,'SY9EA6','SY9EA6','eb947d70cb47437d868df8536e15e975',1,3,'285991','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36831,'6VHAS5','6VHAS5','e10c32b7489dbfd327bfd2edeb358cb6',1,3,'144729','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36832,'H7EF5A','H7EF5A','6a502243eda6f3077544ea0608a42d03',1,3,'868813','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36833,'PCXU3T','PCXU3T','9fb5ad55cc67e5fbfa8b2a92dbb90c5a',1,3,'724193','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36834,'UC6WYD','UC6WYD','9f8ebf98bcc97deb5eb1f4d1677a3275',1,3,'106920','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36835,'21S7JR','21S7JR','2995380ea03f3bd7b74bca93198bcd30',1,3,'658529','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36836,'XFEN8J','XFEN8J','999a5c98447c85647eb9388c62836ee5',1,3,'565065','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36837,'JRK8GG','JRK8GG','7167d558e4e86f5fb1648acd26fde806',1,3,'667749','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36838,'VSPGC4','VSPGC4','2c210b991f4f25fbcb4b64ee99e34cc4',1,3,'999486','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36839,'8MY7WG','8MY7WG','0ded22f0b80d92b46194d4ab477cbfed',1,3,'782647','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36840,'5XLGJJ','5XLGJJ','be75b8a254f597a60a01eda4a505795b',1,3,'212041','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36841,'56E56C','56E56C','96c43dab4e11f37cbd6a63104871847a',1,3,'290457','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36842,'8HNCD1','8HNCD1','8676ee8cfd694f306ec7acacd88c1e12',1,3,'910516','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36843,'XJYGAE','XJYGAE','5ada043fcf5d821eba0fe73cb43247c2',1,3,'871881','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36844,'BTK2NX','BTK2NX','b850732ba0dd68022684ac23acd6c9ce',1,3,'717193','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36845,'TNEU99','TNEU99','c2832b9a213036bd9c1dda8ff4729d1a',1,3,'308145','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36846,'CNQVT2','CNQVT2','3e23acd04fd3acca7ad4c88523c95772',1,3,'357886','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36847,'2T2VB8','2T2VB8','11e704a9816d97b450cbd1b9d87a644c',1,3,'897149','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36848,'89YQ1F','89YQ1F','d65fdfda8855ea28f06ba97b78b82c27',1,3,'194605','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36849,'GRRYLB','GRRYLB','ee78a4362d7bf5f792f8e5f802abbd76',1,3,'222314','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36850,'5FWXLP','5FWXLP','409949a175cffc8940e347c05135096d',1,3,'351360','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36851,'PSW3Q2','PSW3Q2','4e65663886a211dd981e48fef6c6faa6',1,3,'841056','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36852,'NJ6S6R','NJ6S6R','93ddec78b1352c549eced92d6ff636e6',1,3,'239219','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36853,'G5Y5M4','G5Y5M4','7c4d38605c499a47d7764227c804367b',1,3,'621428','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36854,'ABPK47','ABPK47','894a2f4822cb9895b1d07d7acafc0963',1,3,'869696','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36855,'RC8P4C','RC8P4C','bac923515d481fbfa46d1d7e9763d5b0',1,3,'525744','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36856,'32H6TF','32H6TF','0301a0989393495cd40f4c5825d082db',1,3,'782063','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36857,'SFAF4B','SFAF4B','b0634045a4bb9a15cdd4f448344aed02',1,3,'353845','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36858,'DQC2GF','DQC2GF','838e7d9679175954d35cb5e9279725ac',1,3,'897317','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36859,'795F75','795F75','58032774c885508edbad506effc89f8a',1,3,'992641','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36860,'X3P66S','X3P66S','625fe677e6c527fcde31a424433b4ad3',1,3,'860934','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36861,'Q3YBTU','Q3YBTU','f91d55b9fad4db20486cb4a4fbb5134d',1,3,'525072','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36862,'9UHCCF','9UHCCF','70f607ae7efd7fb88d020605fafcb304',1,3,'198745','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36863,'U6D5DG','U6D5DG','1780a4b52fc37a1e31763cd61e0f006b',1,3,'150061','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36864,'V62RNK','V62RNK','edf7aa47834128aec73a790c4bda48bc',1,3,'549227','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36865,'VNK8RP','VNK8RP','1df71bbe6a21bdf8fa63476253f8cc65',1,3,'874786','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36866,'MNFGS6','MNFGS6','87fa93bdcf84cdbabc94043d1b452a76',1,3,'481723','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36867,'S1Y1A2','S1Y1A2','0338a71a14b9b4046a967c7ae70e4bcd',1,3,'905889','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36868,'FV7L95','FV7L95','3984d5113ae4c2ef02b267aa49d271b5',1,3,'534046','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36869,'MD4HX4','MD4HX4','873d63a4b7bfdc9c8b7baf56b1b39d21',1,3,'290223','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36870,'PBKLB4','PBKLB4','11cd35c92ee9357c1b88cdb42d2b8c31',1,3,'846201','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36871,'MFNUKH','MFNUKH','1d7b617f27fa3d7ee72f3f9a798d848f',1,3,'111074','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36872,'SCT7ER','SCT7ER','b766cbf076325ec27279c2b89f96dd01',1,3,'970697','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36873,'F2GP84','F2GP84','6e4dc041025e5b41cd3ca3e4c804de89',1,3,'347676','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36874,'S8WJJC','S8WJJC','bce016fcaeff55d1aae8f1e1e9157c96',1,3,'358708','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36875,'W5NB1C','W5NB1C','232cb851727762bbf7dd097da3bcd354',1,3,'130825','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36876,'J6BESJ','J6BESJ','975898e977891eb28d3a249c1d8825f8',1,3,'487783','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36877,'N1AY1H','N1AY1H','16c02bf3aef0f08fac273f70fab38a56',1,3,'450315','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36878,'GT38TX','GT38TX','48abde0f8c67f3066ed6a990f768fc28',1,3,'895123','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36879,'7NEDUW','7NEDUW','e36e10aba4db6fcccca7860b76fff8e3',1,3,'290630','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36880,'7QSXF7','7QSXF7','50a84d21d8de1921f8c620d165adca71',1,3,'959760','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36881,'S5AAL1','S5AAL1','e07edfef8ad9a176083c6be416d43921',1,3,'709293','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36882,'989QE7','989QE7','e4761be59250e5f9963123f9b78a2226',1,3,'169466','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36883,'WJVWJ8','WJVWJ8','61297b0bd5d85e406a5ab986068e0796',1,3,'362180','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36884,'5SQC1A','5SQC1A','1b55e7c7c898ef25bcb56db8d24099e7',1,3,'841320','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36885,'AUEYP3','AUEYP3','f8f80ed56b7d0b88d81bfddac6a135e2',1,3,'378782','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36886,'NS4D3H','NS4D3H','ad1611f555171c08c0f7fc837de8ecb0',1,3,'145027','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36887,'5YCPT6','5YCPT6','d40e2748dfb85021a98316bcbc49372a',1,3,'555443','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36888,'PPDW9X','PPDW9X','b605dbcd4601ce4b71c15c71ffe5547a',1,3,'705476','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36889,'9MHLAU','9MHLAU','26d680d572824bd84cb37af6fbc56a18',1,3,'785123','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36890,'Y83U7N','Y83U7N','c79f4ea256526fb50661b2b901f3f20a',1,3,'127650','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36891,'QEY3M2','QEY3M2','0a5c12ad7e99baa773185ad00348ef7d',1,3,'916470','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36892,'V7SUAU','V7SUAU','30d0b02f24e571b1e7b4e1dd285a1572',1,3,'813520','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36893,'8LGCBF','8LGCBF','d0971a1f0f5b25bab8ea40b366d03093',1,3,'323263','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36894,'G9VRFH','G9VRFH','22756bed468ad8af549cf99359fac283',1,3,'413927','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36895,'BKU9MR','BKU9MR','e68d58572933c3520ad37b3baaec0f26',1,3,'888680','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36896,'2DTHS4','2DTHS4','88494f12a08be5d57adbcd312b149ee3',1,3,'793515','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36897,'KTDFD7','KTDFD7','70f4bd33b78183f810703a0bb0509f8c',1,3,'747374','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36898,'UL89E6','UL89E6','9af9717135168557662518a4d061836f',1,3,'434262','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36899,'T9T8N1','T9T8N1','bb8f47dd7bc6c6e6168ed42ebed1bbaf',1,3,'618631','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36900,'ACXHG6','ACXHG6','10704fb67d4eda5d105328437b7340a1',1,3,'334833','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36901,'7J4V6L','7J4V6L','4cbdf86bf4ca03758e20d22a8c336529',1,3,'663362','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36902,'6S8QBW','6S8QBW','1a81d9ae194ee66552351a9d79cd1e97',1,3,'272090','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36903,'CUADAE','CUADAE','a1f2c4a35997b3e396345c1d21f999ed',1,3,'682722','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36904,'CAEXX8','CAEXX8','7ca1592922d7124ceba2e51d424f2825',1,3,'683180','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36905,'PLYH3W','PLYH3W','fec0d60207dd5987e630ab4f6e47ba92',1,3,'192056','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36906,'GT7C57','GT7C57','f5725801eb3d5ed7a1a6842517b4ed58',1,3,'621269','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36907,'2EY3YN','2EY3YN','05ba7b9ef251ad56c30baae6008bf20d',1,3,'108206','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36908,'J7GYBB','J7GYBB','53c88f1eedd64b359da0eb14b72330e4',1,3,'692263','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36909,'XCA8KY','XCA8KY','13282660ed1408f1abfa0bcff60cf329',1,3,'937305','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36910,'N84A4Y','N84A4Y','80e043a2f55285900415ba07af19a05b',1,3,'317444','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36911,'DXYT5S','DXYT5S','030bf09d69cada8da146931ba92d5176',1,3,'729523','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36912,'HLCXHT','HLCXHT','73e8e050171db48499716f35e13fcad8',1,3,'856135','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36913,'FWL2KB','FWL2KB','78c16d25dfdeed18c7fe673b759d1a68',1,3,'315822','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36914,'VG1B5X','VG1B5X','1c07430cf42b6c62ba3c84161cb8ab56',1,3,'705522','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36915,'RU6DPB','RU6DPB','05ba831a1b96dd3c5c0567b29b0db635',1,3,'713639','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36916,'HV6LV7','HV6LV7','2eef0570f5d26eca0c9a2fa49f89ddda',1,3,'412453','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36917,'1LR6TB','1LR6TB','ff844accc76496dcfca8570b11d064dc',1,3,'697900','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36918,'1S9J4R','1S9J4R','fb5f06c8eb22928f3f076dd53bdb6a25',1,3,'233200','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36919,'8T6TKL','8T6TKL','113655905e9a9e508c64d902a01dc06b',1,3,'397765','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36920,'8VLSSG','8VLSSG','4eba91d50f67662eb281dd4683035568',1,3,'661501','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36921,'DJCY7J','DJCY7J','8ce27879e18f8661b52f702157287576',1,3,'861902','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36922,'21RGLR','21RGLR','70a28b5281fd01459b0bcf00033b2932',1,3,'833305','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36923,'KRM92A','KRM92A','0c087a52873c6f2d6fbf30fe181293a5',1,3,'813695','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36924,'T1M68V','T1M68V','3d9796a2db7eeffb13db5d3bccfc6015',1,3,'729529','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36925,'7Y1SDS','7Y1SDS','2a89461b38f6713b9fd2ff45ec7996a5',1,3,'754222','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36926,'HR4PJ5','HR4PJ5','22e405bc7c65f7dc6638f7682b457be0',1,3,'983667','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36927,'48635V','48635V','0cb54dc6c273630fc0efdd8e8aa40390',1,3,'325002','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36928,'VCFURP','VCFURP','5fca17213a5c43a0d082f57fc920e4e2',1,3,'825154','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36929,'2EE8RX','2EE8RX','f535f78875d6adfb868cfef7253b2929',1,3,'385371','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36930,'WC12PM','WC12PM','4742d6f76a780cd5dd4f7a7c27231574',1,3,'989026','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36931,'QEMJ6T','QEMJ6T','b576814019dc1303e3b78cdc50571b55',1,3,'582394','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36932,'RCCG6S','RCCG6S','0dd58eeecd9a0a4c76492f8d4c5649ac',1,3,'801867','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36933,'JT7QP8','JT7QP8','58e8bc694af2d2cf0ebc54e65bcf4f5f',1,3,'257471','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36934,'HP9Y48','HP9Y48','5c7720b18ec09610cb1506a494ed722a',1,3,'413883','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36935,'16XUMU','16XUMU','ce1ce91323ad3f6d9bc3dc2b44d3afe8',1,3,'401455','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36936,'D6BA3L','D6BA3L','409f6f1012f96daeab7a69ba83252020',1,3,'913413','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36937,'NSLKNW','NSLKNW','7644c026649e1c85852435261dc33c14',1,3,'366255','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36938,'R7C5BB','R7C5BB','c04c21d5f51cd55c250fcf19d4b2c16c',1,3,'393374','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36939,'TER2CP','TER2CP','d967f983f9db52180e2a98e4ec1aa5ba',1,3,'685319','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36940,'LLYTUK','LLYTUK','2e7b7e80b37c248443340cc8aa39b156',1,3,'179814','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36941,'TKUDLV','TKUDLV','82b1e3a73317810437972db32cb9314d',1,3,'327553','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36942,'7RUJVA','7RUJVA','432f4845aa6dbc29019eac31feddf907',1,3,'214639','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36943,'EH889B','EH889B','e7567e1de573a86a2345372ee4870e08',1,3,'639124','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36944,'7F75KG','7F75KG','bbba0281d3336c5f5318fe24f476a22a',1,3,'376337','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36945,'YWFHV7','YWFHV7','afa84e2633fc334b8d20f3b422ec687d',1,3,'975460','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36946,'C6HVYS','C6HVYS','34783a626ed122acdac279fbf14c57a7',1,3,'418758','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36947,'K3G3BH','K3G3BH','04908b3d2c2da3b10950b9880b02676d',1,3,'673800','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36948,'JWR8LQ','JWR8LQ','a42fdb265bbddd5cacf21852cc56773d',1,3,'963115','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36949,'BU1WNB','BU1WNB','3d14c0568c8ed85c4a997ffcb6be7e37',1,3,'639554','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36950,'A32PHA','A32PHA','5b598a3454adf51a0451c334be359c2f',1,3,'200494','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36951,'4LD4C1','4LD4C1','b3cd68eb6e7c4a4ad851f9fe2e017c7f',1,3,'665350','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36952,'SSBLMA','SSBLMA','ac204801c97dfae3c34a0c08d6afaded',1,3,'860856','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36953,'4CB7UY','4CB7UY','643ef7873a0e756125d5a52b02309492',1,3,'921260','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36954,'T96U5M','T96U5M','cc57e0de870ead26b89c992c0f05bd2b',1,3,'672913','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36955,'E2SUTH','E2SUTH','7c0f3e5250eebdca3ea28806eaee910f',1,3,'123165','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36956,'8Y569T','8Y569T','21b2db05d2b998117f2e08f1688e79dd',1,3,'986987','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36957,'VT6KBU','VT6KBU','3054b29433e280509a90611514182fcf',1,3,'163551','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36958,'8EVVDY','8EVVDY','be0fb681a13a85b3a14242f7477898e2',1,3,'404386','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36959,'VGF52Q','VGF52Q','a682b189bc1b5172e35a2ce1b32b98c5',1,3,'422518','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36960,'R6PM26','R6PM26','8b3bdf1477bed6cf7e960c6679a0b23f',1,3,'632210','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36961,'DD363V','DD363V','b2c859ee7dcbd5ccad45f6c3c6094c3d',1,3,'205582','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36962,'8E5LK2','8E5LK2','ef6cd582fb20acf37310af47e79ba162',1,3,'504606','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36963,'VPPB5T','VPPB5T','02331ff235b533122a13178061a9f17c',1,3,'424098','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36964,'GQYE6J','GQYE6J','1b63f5c5fb61bcb280b8f84e0de710ff',1,3,'981261','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36965,'RK4DTJ','RK4DTJ','cd8b5c9f731a772f35c924030be5924e',1,3,'670769','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36966,'FBCN3X','FBCN3X','b3647ef0291771b165af521e3d0aaeed',1,3,'819688','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36967,'LV8NXJ','LV8NXJ','c37c7fa9ef546fd507f2126431e37317',1,3,'360998','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36968,'MFDWCA','MFDWCA','b8b71d12675f7663bbfad48ff83a1d42',1,3,'675273','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36969,'1VXSGF','1VXSGF','31859dcd55398e04d100a2d3d4684071',1,3,'225783','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36970,'2RKPN9','2RKPN9','15bd326a4bc734de3967f59d192f8290',1,3,'850789','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36971,'9S59YW','9S59YW','5abf10ac48b98a19dec7194b46d80c7e',1,3,'754519','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36972,'LV9UPD','LV9UPD','fb7a48750bb2361d0667cc8d1803c2da',1,3,'388548','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36973,'MHMX4E','MHMX4E','41194e0213126d50f85b86b668d78568',1,3,'191532','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36974,'P7PFEG','P7PFEG','46ed2b2e825d86b1d249a6c713d46706',1,3,'262177','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36975,'PFBUWJ','PFBUWJ','9708c6a8cb22a56231f94906ce5c641d',1,3,'891736','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36976,'K2CRRY','K2CRRY','0a334c4dbf29ef5f6b1bb24a566c9916',1,3,'981141','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36977,'V92LW9','V92LW9','05da261edf322dbbc74580232c51879e',1,3,'654509','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36978,'NTAPE1','NTAPE1','93962bd906e92ed8b543a3ed388e2a48',1,3,'773605','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36979,'XX4F4K','XX4F4K','74cc67612cf19ae78c729576283d7b3d',1,3,'708831','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36980,'DUJSTA','DUJSTA','62e821353a142ff3b1da3ed2fdf50081',1,3,'253795','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36981,'B5VP15','B5VP15','092d9e4f2111c8592c0d2ea0cb43b471',1,3,'749387','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36982,'9LNWLB','9LNWLB','5c939fd136a404936835b5b68e658d9d',1,3,'619599','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36983,'UC22PC','UC22PC','4b8052b97ca7e639ee75b0b0bfd965f0',1,3,'260656','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36984,'77WE5W','77WE5W','6aa721c28637fa6a3aa604bb4aa7e998',1,3,'809894','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36985,'58RQM9','58RQM9','bcc1a5d107d6e2eb1dc6e082470d3970',1,3,'517681','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36986,'PLK8MT','PLK8MT','d349e2b1ae5e603e50f49c6a6175c02e',1,3,'577308','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36987,'GTJ8X2','GTJ8X2','a89ddbf588bbb2aeb1e882aafa61e78e',1,3,'693725','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36988,'X55RSR','X55RSR','54227d0820da7ef0f889aaead75ab0e2',1,3,'538531','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36989,'CUK3HM','CUK3HM','e423e61f74881ab6b37b4b5685d14515',1,3,'810472','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36990,'H2GQJU','H2GQJU','abb216a36f8c963103890e4085e909bb',1,3,'911392','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36991,'HLL4BU','HLL4BU','6b1ca6afe21db23d4b97813a46963fa5',1,3,'507037','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36992,'L6QVF6','L6QVF6','1a13ed5e1260ec9be469ebf23e33a8fa',1,3,'826290','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36993,'1UL8XY','1UL8XY','34992c8a55de4219bc19e8aeec752186',1,3,'515637','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36994,'VLF3PU','VLF3PU','346d1c305dbb476837047d3bcbe40e8e',1,3,'837855','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36995,'FCKPX7','FCKPX7','b6df2a19a85993056bcd5a28193aa4ca',1,3,'258507','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36996,'9HUTYJ','9HUTYJ','3990ee67b13f24546ae8fa9a97739680',1,3,'195682','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36997,'FTMSKP','FTMSKP','7f8f014f3621fffa976394f9ac6986e6',1,3,'336245','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36998,'895AB3','895AB3','22dd504907b60df22207ce9ec17186ba',1,3,'161822','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(36999,'TJM7P6','TJM7P6','f69711506efe71ca52403606ebc97209',1,3,'881666','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(37000,'Y89MJM','Y89MJM','0da80749fa3c87eaa77615e9cb5b83c9',1,3,'326194','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(37001,'33XQ4B','33XQ4B','7f648b4515cbcd0372ef1d8f1dc937cf',1,3,'941062','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(37002,'C95Y5C','C95Y5C','3077e903371b06126cf5e7af1547a8f5',1,3,'745519','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(37003,'YSY6YC','YSY6YC','f3c20adf2f268572ad012253473649f4',1,3,'975770','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34'),
	(37004,'WY8JB5','WY8JB5','3ac8ec5b073f98feab20ee67b7cbdd81',1,3,'587801','asd',NULL,NULL,NULL,'2019-03-25 23:56:34','2019-03-25 23:56:34');

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
