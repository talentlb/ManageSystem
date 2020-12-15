/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : managesystem

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2020-11-22 21:13:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_group_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_permission`
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add group', '1', 'add_group');
INSERT INTO `auth_permission` VALUES ('2', 'Can change group', '1', 'change_group');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete group', '1', 'delete_group');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add notice', '6', 'add_notice');
INSERT INTO `auth_permission` VALUES ('17', 'Can change notice', '6', 'change_notice');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete notice', '6', 'delete_notice');
INSERT INTO `auth_permission` VALUES ('19', 'Can add userinfo', '7', 'add_userinfo');
INSERT INTO `auth_permission` VALUES ('20', 'Can change userinfo', '7', 'change_userinfo');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete userinfo', '7', 'delete_userinfo');
INSERT INTO `auth_permission` VALUES ('22', 'Can add workman', '8', 'add_workman');
INSERT INTO `auth_permission` VALUES ('23', 'Can change workman', '8', 'change_workman');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete workman', '8', 'delete_workman');
INSERT INTO `auth_permission` VALUES ('25', 'Can add database_manage', '9', 'add_database_manage');
INSERT INTO `auth_permission` VALUES ('26', 'Can change database_manage', '9', 'change_database_manage');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete database_manage', '9', 'delete_database_manage');
INSERT INTO `auth_permission` VALUES ('28', 'Can add process_module', '10', 'add_process_module');
INSERT INTO `auth_permission` VALUES ('29', 'Can change process_module', '10', 'change_process_module');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete process_module', '10', 'delete_process_module');
INSERT INTO `auth_permission` VALUES ('31', 'Can add working', '11', 'add_working');
INSERT INTO `auth_permission` VALUES ('32', 'Can change working', '11', 'change_working');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete working', '11', 'delete_working');
INSERT INTO `auth_permission` VALUES ('34', 'Can add production_plan', '12', 'add_production_plan');
INSERT INTO `auth_permission` VALUES ('35', 'Can change production_plan', '12', 'change_production_plan');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete production_plan', '12', 'delete_production_plan');
INSERT INTO `auth_permission` VALUES ('37', 'Can add workstate', '13', 'add_workstate');
INSERT INTO `auth_permission` VALUES ('38', 'Can change workstate', '13', 'change_workstate');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete workstate', '13', 'delete_workstate');
INSERT INTO `auth_permission` VALUES ('40', 'Can add process_name', '14', 'add_process_name');
INSERT INTO `auth_permission` VALUES ('41', 'Can change process_name', '14', 'change_process_name');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete process_name', '14', 'delete_process_name');
INSERT INTO `auth_permission` VALUES ('43', 'Can add plan_module', '15', 'add_plan_module');
INSERT INTO `auth_permission` VALUES ('44', 'Can change plan_module', '15', 'change_plan_module');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete plan_module', '15', 'delete_plan_module');
INSERT INTO `auth_permission` VALUES ('46', 'Can add process_img', '16', 'add_process_img');
INSERT INTO `auth_permission` VALUES ('47', 'Can change process_img', '16', 'change_process_img');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete process_img', '16', 'delete_process_img');
INSERT INTO `auth_permission` VALUES ('49', 'Can add pto m', '17', 'add_ptom');
INSERT INTO `auth_permission` VALUES ('50', 'Can change pto m', '17', 'change_ptom');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete pto m', '17', 'delete_ptom');
INSERT INTO `auth_permission` VALUES ('52', 'Can add notice_content', '18', 'add_notice_content');
INSERT INTO `auth_permission` VALUES ('53', 'Can change notice_content', '18', 'change_notice_content');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete notice_content', '18', 'delete_notice_content');
INSERT INTO `auth_permission` VALUES ('55', 'Can add note', '19', 'add_note');
INSERT INTO `auth_permission` VALUES ('56', 'Can change note', '19', 'change_note');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete note', '19', 'delete_note');
INSERT INTO `auth_permission` VALUES ('58', 'Can add schedule', '20', 'add_schedule');
INSERT INTO `auth_permission` VALUES ('59', 'Can change schedule', '20', 'change_schedule');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete schedule', '20', 'delete_schedule');
INSERT INTO `auth_permission` VALUES ('61', 'Can add chat', '21', 'add_chat');
INSERT INTO `auth_permission` VALUES ('62', 'Can change chat', '21', 'change_chat');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete chat', '21', 'delete_chat');
INSERT INTO `auth_permission` VALUES ('64', 'Can add executor', '22', 'add_executor');
INSERT INTO `auth_permission` VALUES ('65', 'Can change executor', '22', 'change_executor');
INSERT INTO `auth_permission` VALUES ('66', 'Can delete executor', '22', 'delete_executor');
INSERT INTO `auth_permission` VALUES ('67', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('68', 'Can view group', '1', 'view_group');
INSERT INTO `auth_permission` VALUES ('69', 'Can view user', '3', 'view_user');
INSERT INTO `auth_permission` VALUES ('70', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('71', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('72', 'Can view chat', '21', 'view_chat');
INSERT INTO `auth_permission` VALUES ('73', 'Can view notice', '6', 'view_notice');
INSERT INTO `auth_permission` VALUES ('74', 'Can view process_module', '10', 'view_process_module');
INSERT INTO `auth_permission` VALUES ('75', 'Can view process_name', '14', 'view_process_name');
INSERT INTO `auth_permission` VALUES ('76', 'Can view production_plan', '12', 'view_production_plan');
INSERT INTO `auth_permission` VALUES ('77', 'Can view userinfo', '7', 'view_userinfo');
INSERT INTO `auth_permission` VALUES ('78', 'Can view workman', '8', 'view_workman');
INSERT INTO `auth_permission` VALUES ('79', 'Can view workstate', '13', 'view_workstate');
INSERT INTO `auth_permission` VALUES ('80', 'Can view working', '11', 'view_working');
INSERT INTO `auth_permission` VALUES ('81', 'Can view schedule', '20', 'view_schedule');
INSERT INTO `auth_permission` VALUES ('82', 'Can view pto m', '17', 'view_ptom');
INSERT INTO `auth_permission` VALUES ('83', 'Can view process_img', '16', 'view_process_img');
INSERT INTO `auth_permission` VALUES ('84', 'Can view plan_module', '15', 'view_plan_module');
INSERT INTO `auth_permission` VALUES ('85', 'Can view note', '19', 'view_note');
INSERT INTO `auth_permission` VALUES ('86', 'Can view executor', '22', 'view_executor');
INSERT INTO `auth_permission` VALUES ('87', 'Can view database_manage', '9', 'view_database_manage');
INSERT INTO `auth_permission` VALUES ('88', 'Can add file system', '23', 'add_filesystem');
INSERT INTO `auth_permission` VALUES ('89', 'Can change file system', '23', 'change_filesystem');
INSERT INTO `auth_permission` VALUES ('90', 'Can delete file system', '23', 'delete_filesystem');
INSERT INTO `auth_permission` VALUES ('91', 'Can view file system', '23', 'view_filesystem');
INSERT INTO `auth_permission` VALUES ('92', 'Can add appendix', '24', 'add_appendix');
INSERT INTO `auth_permission` VALUES ('93', 'Can change appendix', '24', 'change_appendix');
INSERT INTO `auth_permission` VALUES ('94', 'Can delete appendix', '24', 'delete_appendix');
INSERT INTO `auth_permission` VALUES ('95', 'Can view appendix', '24', 'view_appendix');
INSERT INTO `auth_permission` VALUES ('96', 'Can add model record', '25', 'add_modelrecord');
INSERT INTO `auth_permission` VALUES ('97', 'Can change model record', '25', 'change_modelrecord');
INSERT INTO `auth_permission` VALUES ('98', 'Can delete model record', '25', 'delete_modelrecord');
INSERT INTO `auth_permission` VALUES ('99', 'Can view model record', '25', 'view_modelrecord');
INSERT INTO `auth_permission` VALUES ('100', 'Can add call boss', '26', 'add_callboss');
INSERT INTO `auth_permission` VALUES ('101', 'Can change call boss', '26', 'change_callboss');
INSERT INTO `auth_permission` VALUES ('102', 'Can delete call boss', '26', 'delete_callboss');
INSERT INTO `auth_permission` VALUES ('103', 'Can view call boss', '26', 'view_callboss');
INSERT INTO `auth_permission` VALUES ('104', 'Can add file modify record', '27', 'add_filemodifyrecord');
INSERT INTO `auth_permission` VALUES ('105', 'Can change file modify record', '27', 'change_filemodifyrecord');
INSERT INTO `auth_permission` VALUES ('106', 'Can delete file modify record', '27', 'delete_filemodifyrecord');
INSERT INTO `auth_permission` VALUES ('107', 'Can view file modify record', '27', 'view_filemodifyrecord');
INSERT INTO `auth_permission` VALUES ('108', 'Can add plan to process', '28', 'add_plantoprocess');
INSERT INTO `auth_permission` VALUES ('109', 'Can change plan to process', '28', 'change_plantoprocess');
INSERT INTO `auth_permission` VALUES ('110', 'Can delete plan to process', '28', 'delete_plantoprocess');
INSERT INTO `auth_permission` VALUES ('111', 'Can view plan to process', '28', 'view_plantoprocess');

-- ----------------------------
-- Table structure for `auth_user`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_groups`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `auth_user_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `django_content_type`
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('24', 'web', 'appendix');
INSERT INTO `django_content_type` VALUES ('26', 'web', 'callboss');
INSERT INTO `django_content_type` VALUES ('21', 'web', 'chat');
INSERT INTO `django_content_type` VALUES ('9', 'web', 'database_manage');
INSERT INTO `django_content_type` VALUES ('22', 'web', 'executor');
INSERT INTO `django_content_type` VALUES ('27', 'web', 'filemodifyrecord');
INSERT INTO `django_content_type` VALUES ('23', 'web', 'filesystem');
INSERT INTO `django_content_type` VALUES ('25', 'web', 'modelrecord');
INSERT INTO `django_content_type` VALUES ('19', 'web', 'note');
INSERT INTO `django_content_type` VALUES ('6', 'web', 'notice');
INSERT INTO `django_content_type` VALUES ('18', 'web', 'notice_content');
INSERT INTO `django_content_type` VALUES ('28', 'web', 'plantoprocess');
INSERT INTO `django_content_type` VALUES ('15', 'web', 'plan_module');
INSERT INTO `django_content_type` VALUES ('16', 'web', 'process_img');
INSERT INTO `django_content_type` VALUES ('10', 'web', 'process_module');
INSERT INTO `django_content_type` VALUES ('14', 'web', 'process_name');
INSERT INTO `django_content_type` VALUES ('12', 'web', 'production_plan');
INSERT INTO `django_content_type` VALUES ('17', 'web', 'ptom');
INSERT INTO `django_content_type` VALUES ('20', 'web', 'schedule');
INSERT INTO `django_content_type` VALUES ('7', 'web', 'userinfo');
INSERT INTO `django_content_type` VALUES ('11', 'web', 'working');
INSERT INTO `django_content_type` VALUES ('8', 'web', 'workman');
INSERT INTO `django_content_type` VALUES ('13', 'web', 'workstate');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-08-07 18:44:08');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2020-08-07 18:44:08');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2020-08-07 18:44:09');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2020-08-07 18:44:09');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2020-08-07 18:44:09');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2020-08-07 18:44:09');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2020-08-07 18:44:09');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2020-08-07 18:44:09');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2020-08-07 18:44:09');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2020-08-07 18:44:09');
INSERT INTO `django_migrations` VALUES ('11', 'sessions', '0001_initial', '2020-08-07 18:44:09');
INSERT INTO `django_migrations` VALUES ('12', 'web', '0001_initial', '2020-08-07 18:44:09');
INSERT INTO `django_migrations` VALUES ('13', 'web', '0002_auto_20200811_0911', '2020-08-11 09:11:21');
INSERT INTO `django_migrations` VALUES ('14', 'web', '0003_auto_20200811_1502', '2020-08-11 15:02:34');
INSERT INTO `django_migrations` VALUES ('15', 'web', '0004_auto_20200811_1522', '2020-08-11 15:22:18');
INSERT INTO `django_migrations` VALUES ('16', 'web', '0005_auto_20200811_2233', '2020-08-11 22:33:27');
INSERT INTO `django_migrations` VALUES ('17', 'web', '0006_auto_20200811_2236', '2020-08-11 22:36:18');
INSERT INTO `django_migrations` VALUES ('18', 'web', '0007_auto_20200811_2239', '2020-08-11 22:39:07');
INSERT INTO `django_migrations` VALUES ('19', 'web', '0008_auto_20200812_1039', '2020-08-12 10:40:04');
INSERT INTO `django_migrations` VALUES ('20', 'web', '0009_process_img', '2020-08-13 09:19:41');
INSERT INTO `django_migrations` VALUES ('21', 'web', '0010_userinfo_usertype', '2020-08-14 20:58:04');
INSERT INTO `django_migrations` VALUES ('22', 'web', '0011_auto_20200817_1425', '2020-08-17 14:25:53');
INSERT INTO `django_migrations` VALUES ('23', 'web', '0012_auto_20200817_1501', '2020-08-17 15:01:22');
INSERT INTO `django_migrations` VALUES ('24', 'web', '0013_working_working_number', '2020-08-18 09:18:33');
INSERT INTO `django_migrations` VALUES ('25', 'web', '0014_auto_20200818_0926', '2020-08-18 09:26:27');
INSERT INTO `django_migrations` VALUES ('26', 'web', '0015_auto_20200818_1335', '2020-08-18 13:35:29');
INSERT INTO `django_migrations` VALUES ('27', 'web', '0016_production_plan_progress', '2020-08-19 11:46:06');
INSERT INTO `django_migrations` VALUES ('28', 'web', '0017_auto_20200820_1031', '2020-08-20 10:32:05');
INSERT INTO `django_migrations` VALUES ('29', 'web', '0018_auto_20200823_1840', '2020-08-23 18:40:15');
INSERT INTO `django_migrations` VALUES ('30', 'web', '0019_working_modify_count', '2020-09-03 10:41:42');
INSERT INTO `django_migrations` VALUES ('31', 'web', '0020_auto_20200906_1010', '2020-09-06 10:10:28');
INSERT INTO `django_migrations` VALUES ('32', 'web', '0021_auto_20200908_1639', '2020-09-08 16:39:21');
INSERT INTO `django_migrations` VALUES ('33', 'web', '0022_auto_20200908_2002', '2020-09-08 20:02:26');
INSERT INTO `django_migrations` VALUES ('34', 'web', '0023_auto_20200910_0931', '2020-09-10 09:32:05');
INSERT INTO `django_migrations` VALUES ('35', 'web', '0024_note_schedule', '2020-09-20 16:29:30');
INSERT INTO `django_migrations` VALUES ('36', 'web', '0025_chat_executor', '2020-09-22 09:36:38');
INSERT INTO `django_migrations` VALUES ('37', 'web', '0026_auto_20200922_1046', '2020-09-22 10:46:08');
INSERT INTO `django_migrations` VALUES ('38', 'web', '0027_schedule_user', '2020-09-22 10:59:20');
INSERT INTO `django_migrations` VALUES ('39', 'web', '0028_schedule_exe_type', '2020-09-22 11:07:04');
INSERT INTO `django_migrations` VALUES ('40', 'web', '0029_auto_20200922_1720', '2020-09-22 17:20:38');
INSERT INTO `django_migrations` VALUES ('41', 'web', '0030_schedule_is_read', '2020-09-23 13:22:51');
INSERT INTO `django_migrations` VALUES ('42', 'web', '0031_auto_20200923_1454', '2020-09-23 14:54:45');
INSERT INTO `django_migrations` VALUES ('43', 'auth', '0009_alter_user_last_name_max_length', '2020-09-30 10:48:52');
INSERT INTO `django_migrations` VALUES ('44', 'auth', '0010_alter_group_name_max_length', '2020-09-30 10:48:52');
INSERT INTO `django_migrations` VALUES ('45', 'auth', '0011_update_proxy_permissions', '2020-09-30 10:48:52');
INSERT INTO `django_migrations` VALUES ('46', 'auth', '0012_alter_user_first_name_max_length', '2020-09-30 10:48:52');
INSERT INTO `django_migrations` VALUES ('47', 'web', '0002_auto_20201005_1538', '2020-10-05 15:38:29');
INSERT INTO `django_migrations` VALUES ('48', 'web', '0003_process_name_money', '2020-10-06 09:04:07');
INSERT INTO `django_migrations` VALUES ('49', 'web', '0004_auto_20201006_0907', '2020-10-06 09:07:04');
INSERT INTO `django_migrations` VALUES ('50', 'web', '0005_workman_boss', '2020-10-13 08:53:50');
INSERT INTO `django_migrations` VALUES ('51', 'web', '0006_workman_password', '2020-10-15 15:31:01');
INSERT INTO `django_migrations` VALUES ('52', 'web', '0007_working_cutmoney', '2020-10-16 11:19:04');
INSERT INTO `django_migrations` VALUES ('53', 'web', '0008_appendix_filesystem', '2020-10-30 10:14:16');
INSERT INTO `django_migrations` VALUES ('54', 'web', '0009_filesystem_info_datetime', '2020-10-31 13:05:40');
INSERT INTO `django_migrations` VALUES ('55', 'web', '0010_filesystem_is_modify', '2020-11-03 10:44:59');
INSERT INTO `django_migrations` VALUES ('56', 'web', '0011_callboss_modelrecord', '2020-11-03 16:16:34');
INSERT INTO `django_migrations` VALUES ('57', 'web', '0012_callboss_is_read', '2020-11-03 17:31:25');
INSERT INTO `django_migrations` VALUES ('58', 'web', '0002_filemodifyrecord', '2020-11-14 10:03:09');
INSERT INTO `django_migrations` VALUES ('59', 'web', '0003_production_plan_total_float', '2020-11-16 12:58:07');
INSERT INTO `django_migrations` VALUES ('60', 'web', '0002_auto_20201122_1102', '2020-11-22 11:03:06');
INSERT INTO `django_migrations` VALUES ('61', 'web', '0003_plantoprocess', '2020-11-22 14:59:21');
INSERT INTO `django_migrations` VALUES ('62', 'web', '0004_auto_20201122_1528', '2020-11-22 15:28:51');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0q5wwxzxvugj6d5qc1y1aeka6i3ny6be', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDExIiwibmFtZSI6Ilx1NWYyMFx1OThkZSIsInVzZXJUeXBlIjoxfQ:1kbBrs:5BKLDeHV3_d7_HPKNaCzXvk-YxXYpsTYxs9QsOFDwn8', '2020-11-21 08:14:09');
INSERT INTO `django_session` VALUES ('0x7j4faoy4log292f7xtqkhas9jklig4', 'eyJ1c2VyX2lkIjo2OCwiY29kZSI6IjAwMyIsIm5hbWUiOiJcdTliNGZcdTVlN2ZcdTY2MGUiLCJ1c2VyVHlwZSI6MH0:1keAu4:d1dkJ0bEsRsGLUehxLfyqa61T68zek9hxGlXlh5tecY', '2020-11-29 13:48:45');
INSERT INTO `django_session` VALUES ('1jtnd6zf6g111rjoiiand8k8tdbtbuvq', 'MzdhNjVmZmZkMjRhMTg4ZGUzMTc1M2E4NGQ0ZjI4MWMyMGM4NDY1Mjp7InVzZXJUeXBlIjoxLCJjb2RlIjoiMDExIiwidXNlcl9pZCI6MiwibmFtZSI6Ilx1NWYyMFx1NGUwOSJ9', '2020-09-24 09:54:54');
INSERT INTO `django_session` VALUES ('2yf5ha3m5t8zjdol1zzquwiqv67ewqdb', 'NDU4YjQ4YWNhYThjOWI3ZmVkZjI5MWEyZjk2ZDUxOTM5MzczM2Q3Mjp7InVzZXJUeXBlIjoiMCIsImNvZGUiOiIwMDIiLCJ1c2VyX2lkIjozMywibmFtZSI6Ilx1NWY2ZFx1NGUwN1x1OTFjYyJ9', '2020-10-07 14:49:03');
INSERT INTO `django_session` VALUES ('5k9bwjzug25zzeb9410536ykaaiy1ww3', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDExIiwibmFtZSI6Ilx1NWYyMFx1OThkZSIsInVzZXJUeXBlIjoxfQ:1kSGM7:qyDV-B-8kYPOajjxZiYFrLbZl4C_6QTRLOl7ZhQuxLI', '2020-10-27 17:12:27');
INSERT INTO `django_session` VALUES ('5sggmnfpet5571qmtadao918ktafsz59', 'NThlM2I1MWY5YmE3OTUzMmMwZjUyYTVmMzY1ZDM5M2FlOTNmMWExODp7InVzZXJUeXBlIjoyLCJjb2RlIjoiMDEwIiwidXNlcl9pZCI6MSwibmFtZSI6Ilx1NTIxOFx1NTI5Zlx1NmU5MCJ9', '2020-09-23 11:21:32');
INSERT INTO `django_session` VALUES ('5w0innpt8fj9eouzw9zryyp54qm44tih', 'ZDM2MTAwMGE3OWM5MjdlYTNjZjRkMjdhMmU4ZjBiNmYyNGMyZDdjYzp7InVzZXJUeXBlIjoyLCJjb2RlIjoiMDAwMyIsIm5hbWUiOiJcdTY3NGVcdTU2ZGIifQ==', '2020-09-07 16:55:06');
INSERT INTO `django_session` VALUES ('6r7ku06xm4qlqjsepzyrm531ypwuddeo', 'N2ZlZTFlOWRlOTg3NzJhY2IyNjA4ZDlhZWVhZWEyNjRiMWFlYjRhNjp7InVzZXJUeXBlIjoxLCJjb2RlIjoiMDExIiwibmFtZSI6Ilx1NWYyMFx1NGUwOSJ9', '2020-09-14 13:37:31');
INSERT INTO `django_session` VALUES ('70nm5nirhaosjuuudmg8jxajr6ldms5p', 'eyJ1c2VyX2lkIjozMiwiY29kZSI6IjAwMSIsIm5hbWUiOiJcdTllYzRcdTVmM2FcdThmODkiLCJ1c2VyVHlwZSI6MH0:1kaAw3:rS361JmE0HSAWKL3qmNdMjkMbGnmRvxXk8KD_j5Z_2I', '2020-11-18 13:02:16');
INSERT INTO `django_session` VALUES ('9sba8v30zaj32apwswx5o1oqfq6kzhmg', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDExIiwibmFtZSI6Ilx1NWYyMFx1OThkZSIsInVzZXJUeXBlIjoxfQ:1kSxna:VhTwtdGOxSYN3MeYmebexbHxS_4R1jT9QrMxNagdNlY', '2020-10-29 15:35:43');
INSERT INTO `django_session` VALUES ('a7ifxdq4vnfmf49yql7mh77nelp56cb5', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDExIiwibmFtZSI6Ilx1NWYyMFx1OThkZSIsInVzZXJUeXBlIjoxfQ:1kWrtY:qzO5UP2Y6z4yd9JAkoQOYienI5ItZjYbWHFb_i73ILo', '2020-11-09 10:06:00');
INSERT INTO `django_session` VALUES ('ai4uqqy938ecsheu19xp11igqov14yk4', 'eyJ1c2VyX2lkIjozMiwiY29kZSI6IjAwMSIsIm5hbWUiOiJcdTllYzRcdTVmM2FcdThmODkiLCJ1c2VyVHlwZSI6MH0:1kaYuA:asaTpUvh9wqV4D8dbx8IwLyJ2c2KJ-YlWeFNzrQT7YY', '2020-11-19 14:37:54');
INSERT INTO `django_session` VALUES ('ajrw4e6ww0tunvwns35hr2ze7l5fkf9j', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDExIiwibmFtZSI6Ilx1NWYyMFx1OThkZSIsInVzZXJUeXBlIjoxfQ:1kYgsg:l3PcTbmGtRVkBZgH7sI-_WUjC2ssM-9P03iaLzYFBZY', '2020-11-14 10:44:39');
INSERT INTO `django_session` VALUES ('ckyizhcepims83lsm2fiuqco5yhn50wq', '.eJyrViotTi2Kz0xRsjLTUUrOT0lVslKytLRU0lHKS8wFcWJKzZPTkoBkakpaTKlpmoEBkDROMQSSRoYWINISKG6WamkA1AMyLKSyAKjPqBYA_i4b6Q:1kd2kN:3G3YJfug91Jzen_IphmvoqJaemBHdrYW2Oj3Gd8CI0Y', '2020-11-26 10:54:04');
INSERT INTO `django_session` VALUES ('clcq8f8oq73ec2o9zzkmjnh8smo0dqml', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDExIiwibmFtZSI6Ilx1NWYyMFx1OThkZSIsInVzZXJUeXBlIjoxfQ:1kSGXY:dwEhk8cPXPvgeuSm1RNpAQBsa3R9KPpgQtQWJtkUjHQ', '2020-10-27 17:24:17');
INSERT INTO `django_session` VALUES ('csu6ioqqifq8kmqynpdjf8u9dzmoyrm1', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDAxIiwibmFtZSI6Ilx1NzUxZlx1NGVhN1x1NTM4Mlx1OTU3Zlx1NTIxOFx1NTdmOVx1NjU4NyIsInVzZXJUeXBlIjoxfQ:1keVY0:CKUzA7McRyEz0eLTTttVv8Xv-nvM0q5UMAE2vxIn_IA', '2020-11-30 11:51:20');
INSERT INTO `django_session` VALUES ('f82pc2mdfbjlu727xs1u6nnhx0mclkgr', 'MzdhNjVmZmZkMjRhMTg4ZGUzMTc1M2E4NGQ0ZjI4MWMyMGM4NDY1Mjp7InVzZXJUeXBlIjoxLCJjb2RlIjoiMDExIiwidXNlcl9pZCI6MiwibmFtZSI6Ilx1NWYyMFx1NGUwOSJ9', '2020-09-20 19:49:07');
INSERT INTO `django_session` VALUES ('fhvcogtt2hou1jefot0wk7g4ycshpyfo', 'eyJ1c2VyX2lkIjo2OCwiY29kZSI6IjAwMyIsIm5hbWUiOiJcdTliNGZcdTVlN2ZcdTY2MGUiLCJ1c2VyVHlwZSI6MH0:1kcoF4:Cvxe_KD0MMSoTtH2_dAKKq0PqXy4HiIRVN7g25vg8XQ', '2020-11-25 19:24:47');
INSERT INTO `django_session` VALUES ('fqiba66apaoc7kzjzqik64hrtg4ns27p', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDAxIiwibmFtZSI6Ilx1NzUxZlx1NGVhN1x1NTM4Mlx1OTU3Zlx1NTIxOFx1NTdmOVx1NjU4NyIsInVzZXJUeXBlIjoxfQ:1kcpH3:jzoKLoa4U_Um18L6x8RjP-0FowwsPPwB6kpj2owAYdc', '2020-11-25 20:30:53');
INSERT INTO `django_session` VALUES ('g4zna82qkonlohla7qlzub2l22k7aq7c', 'eyJ1c2VyX2lkIjozMiwiY29kZSI6IjAwMSIsIm5hbWUiOiJcdTllYzRcdTVmM2FcdThmODkiLCJ1c2VyVHlwZSI6MH0:1kcQlb:PBvQNAiq36T7r437mC8BWVYzZAC4b6A1EchVFiDdmPs', '2020-11-24 18:20:48');
INSERT INTO `django_session` VALUES ('ighkw1t11c0g0nebp4imujk70svr0ydy', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDAxIiwibmFtZSI6Ilx1NzUxZlx1NGVhN1x1NTM4Mlx1OTU3Zlx1NTIxOFx1NTdmOVx1NjU4NyIsInVzZXJUeXBlIjoxfQ:1keBLG:qzpOowGrjuO3YMLtYk22jVbIaL6GSaAOcOXVRl3uyrg', '2020-11-29 14:16:50');
INSERT INTO `django_session` VALUES ('ikv2pgjccpff9of75xnm2na2sbozfvbs', 'N2ZlZTFlOWRlOTg3NzJhY2IyNjA4ZDlhZWVhZWEyNjRiMWFlYjRhNjp7InVzZXJUeXBlIjoxLCJjb2RlIjoiMDExIiwibmFtZSI6Ilx1NWYyMFx1NGUwOSJ9', '2020-09-15 14:41:43');
INSERT INTO `django_session` VALUES ('isfsua6dgirna9q5xxdd2co92fuu8ejs', 'N2UwZTg5MTkzM2Q0ZDU2OTU5MjMzMGRkODNjODdiMTFjYmM5ZDE4ODp7InVzZXJUeXBlIjoiMCIsImNvZGUiOiIwMDEiLCJuYW1lIjoiXHU5ZWM0XHU1ZjNhXHU4Zjg5In0=', '2020-09-07 11:39:48');
INSERT INTO `django_session` VALUES ('kq58wwsrioioxyoszhs80pzgmb2dxjnq', 'YWY5ZTgyYmM1M2JlZTc0MGE3N2IwYzlkYTViNjJkMWFlMjQ0MmRlYTp7InVzZXJUeXBlIjoiIn0=', '2020-09-09 11:36:37');
INSERT INTO `django_session` VALUES ('n6ado6wzz8hdubj1tdue83xpt5or7ki6', 'N2ZlZTFlOWRlOTg3NzJhY2IyNjA4ZDlhZWVhZWEyNjRiMWFlYjRhNjp7InVzZXJUeXBlIjoxLCJjb2RlIjoiMDExIiwibmFtZSI6Ilx1NWYyMFx1NGUwOSJ9', '2020-09-15 09:32:28');
INSERT INTO `django_session` VALUES ('p1pe9v3mwru2nmb8wnmgkhg6ew1xk15p', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDExIiwibmFtZSI6Ilx1NWYyMFx1OThkZSIsInVzZXJUeXBlIjoxfQ:1kSFok:NP9ocMWn9t02C6JbmRfMeQUJsiFTYxdhubVxI-svBUk', '2020-10-27 16:37:58');
INSERT INTO `django_session` VALUES ('pk452y4blf95ylysmk6nvips1rxr2fj1', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDAxIiwibmFtZSI6Ilx1NzUxZlx1NGVhN1x1NTM4Mlx1OTU3Zlx1NTIxOFx1NTdmOVx1NjU4NyIsInVzZXJUeXBlIjoxfQ:1kcpi6:hMbn2cqRGSLNp_G1-kIJIiF3uBMyz6pD58UeNlZm2QM', '2020-11-25 20:58:50');
INSERT INTO `django_session` VALUES ('rk99vtevq5nao8i23q9lwm5cyaaugrya', 'eyJ1c2VyX2lkIjo2LCJjb2RlIjoiOTk5IiwibmFtZSI6Ilx1N2NmYlx1N2VkZlx1NWYwMFx1NTNkMSIsInVzZXJUeXBlIjoyfQ:1kgf53:Yk3BfocVlEfPsUp47uMpp4WegYP6iJEWeSuTv6LVHWU', '2020-12-06 10:26:21');
INSERT INTO `django_session` VALUES ('sjhq87q9f2rdqeunr3daljxemmccn870', '.eJyrViotTi2Kz0xRsjLUUUrOT0lVslIyMDRQ0lHKS8wFcWJKTY0MLUCkZVpMqVmqJUgOpCmksgAob1QLAJwkE8Y:1kUrVZ:RC9lt6Tcj9lc3OA1zfkam7MURHdFWhd4k2ff3GFoiP4', '2020-11-03 21:16:58');
INSERT INTO `django_session` VALUES ('snew2rrzm9l8qp7139wn50472hifteb7', 'eyJ1c2VyX2lkIjo2LCJjb2RlIjoiOTk5IiwibmFtZSI6Ilx1N2NmYlx1N2VkZlx1NWYwMFx1NTNkMSIsInVzZXJUeXBlIjoyfQ:1keVQF:2TtoFvItNwuRBh90f6KHf3C3WDHZ-1WSYe19Bvfp9Nc', '2020-11-30 11:43:19');
INSERT INTO `django_session` VALUES ('sqjlz6zyotmt9q0glg15o254s75ogmhu', 'eyJ1c2VyX2lkIjo4NiwiY29kZSI6IjAyMSIsIm5hbWUiOiJcdTUyMThcdTU3ZjlcdTlmOTkiLCJ1c2VyVHlwZSI6MH0:1kd2mk:lp55lXu2BAxGc1l8FBaJyInqk8PmHzEHOVzMMFAXh1M', '2020-11-26 10:56:30');
INSERT INTO `django_session` VALUES ('urxykmsza6abq57m0iqagzlyqj8fldfw', 'eyJ1c2VyX2lkIjoyLCJjb2RlIjoiMDAxIiwibmFtZSI6Ilx1NzUxZlx1NGVhN1x1NTM4Mlx1OTU3Zlx1NTIxOFx1NTdmOVx1NjU4NyIsInVzZXJUeXBlIjoxfQ:1keA3q:b07o6MQ27jghSL5gfEeXrc41rQjSe1hQCBiX4IiOeAE', '2020-11-29 12:54:46');
INSERT INTO `django_session` VALUES ('vr3bcl4ciigpxneapg1t5ut9tsye6k41', '.eJyrViotTi2Kz0xRsjLUUUrOT0lVslIyMDRQ0lHKS8wFcWJKTY0MLUCkZVpMqVmqJUgOpCmksgAob1QLAJwkE8Y:1kTLis:kiZPN26ckdb1-ctcW1OOnhFkVXA9bifixx7UHkL3pko', '2020-10-30 17:08:26');
INSERT INTO `django_session` VALUES ('vvowz6bmcbpbnn475bo7vxyuvxqicqka', 'eyJ1c2VyX2lkIjozMiwiY29kZSI6IjAwMSIsIm5hbWUiOiJcdTllYzRcdTVmM2FcdThmODkiLCJ1c2VyVHlwZSI6MH0:1kcP9H:tGHGRrcQL8_7fhFPbzv2iYdgiTuqZ0qKHGv82hJeMRE', '2020-11-24 16:37:08');
INSERT INTO `django_session` VALUES ('yf19hk559vyep385v1gr3tngljnzttd7', 'eyJ1c2VyX2lkIjozLCJjb2RlIjoiMDEyIiwibmFtZSI6Ilx1Njc0ZVx1NTZkYiIsInVzZXJUeXBlIjoxfQ:1kSFoQ:EBLwazfLf29R8KIkeqYTcNo4hYQttzO6v9LTBPN6tMU', '2020-10-27 16:37:39');
INSERT INTO `django_session` VALUES ('ygj4bfnassmw78bby52pas6rnnkoeom3', '.eJyrViotTi2Kz0xRsjLUUUrOT0lVslIyMDRQ0lHKS8wFcWJKTY0MLUCkZVpMqVmqJUgOpCmksgAob1QLAJwkE8Y:1kcURa:MZLgvXMoNMo-M98eJ2bV4cUCYl1nsFDM-Sgjspu26dk', '2020-11-24 22:16:22');
INSERT INTO `django_session` VALUES ('yru94q06w6mmx5bpashvesky3s4zyvsz', 'eyJ1c2VyX2lkIjo2LCJjb2RlIjoiOTk5IiwibmFtZSI6Ilx1N2NmYlx1N2VkZlx1NWYwMFx1NTNkMSIsInVzZXJUeXBlIjoyfQ:1keX3y:e23dmEQ2EfrCgeXeD6Yj0nPeWJNsstrujL1Rqa30OeY', '2020-11-30 13:28:27');

-- ----------------------------
-- Table structure for `web_appendix`
-- ----------------------------
DROP TABLE IF EXISTS `web_appendix`;
CREATE TABLE `web_appendix` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `appendix_name` varchar(50) DEFAULT NULL,
  `appendix_type` varchar(50) DEFAULT NULL,
  `appendix_file` varchar(200) DEFAULT NULL,
  `appendix_content` varchar(200) DEFAULT NULL,
  `doc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_appendix_doc_id_c458d688_fk_web_filesystem_id` (`doc_id`),
  CONSTRAINT `web_appendix_doc_id_c458d688_fk_web_filesystem_id` FOREIGN KEY (`doc_id`) REFERENCES `web_filesystem` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_appendix
-- ----------------------------
INSERT INTO `web_appendix` VALUES ('19', '新员工入职申请表(通用).doc', 'Word文档', '/static/uploads/2020/11/14/新员工入职申请表(通用).doc', null, '27');

-- ----------------------------
-- Table structure for `web_callboss`
-- ----------------------------
DROP TABLE IF EXISTS `web_callboss`;
CREATE TABLE `web_callboss` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `msg` varchar(200) DEFAULT NULL,
  `info_datetime` datetime(6) NOT NULL,
  `accp_user_id` int(11) DEFAULT NULL,
  `send_user_id` int(11) DEFAULT NULL,
  `is_read` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_callboss_accp_user_id_773a33dc_fk_web_userinfo_id` (`accp_user_id`),
  KEY `web_callboss_send_user_id_64d3f052_fk_web_workman_id` (`send_user_id`),
  CONSTRAINT `web_callboss_accp_user_id_773a33dc_fk_web_userinfo_id` FOREIGN KEY (`accp_user_id`) REFERENCES `web_userinfo` (`id`),
  CONSTRAINT `web_callboss_send_user_id_64d3f052_fk_web_workman_id` FOREIGN KEY (`send_user_id`) REFERENCES `web_workman` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_callboss
-- ----------------------------
INSERT INTO `web_callboss` VALUES ('77', '呼叫主管', '2020-11-11 17:14:47.813778', '2', '86', '1');
INSERT INTO `web_callboss` VALUES ('78', '物料紧缺', '2020-11-11 17:18:36.193840', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('79', '呼叫主管', '2020-11-11 17:24:18.603425', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('80', '物料紧缺', '2020-11-11 17:24:37.456503', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('81', '呼叫主管', '2020-11-11 17:28:32.106924', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('82', '呼叫主管', '2020-11-11 17:28:42.508519', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('83', '呼叫主管', '2020-11-11 17:32:42.622253', '2', '86', '1');
INSERT INTO `web_callboss` VALUES ('84', '呼叫主管', '2020-11-11 17:33:36.738348', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('85', '物料紧缺', '2020-11-11 17:33:45.749864', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('86', '机器故障', '2020-11-11 17:33:48.527023', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('87', '物料紧缺', '2020-11-11 17:33:55.350413', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('88', '呼叫主管', '2020-11-11 17:33:58.071569', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('89', '呼叫主管', '2020-11-11 18:11:39.570919', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('90', '呼叫主管', '2020-11-11 18:47:53.779276', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('91', '呼叫主管', '2020-11-11 18:48:24.288021', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('92', '呼叫主管', '2020-11-11 18:48:42.592068', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('93', '物料紧缺', '2020-11-11 18:48:45.121213', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('94', '机器故障', '2020-11-11 18:48:51.018550', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('95', '呼叫主管', '2020-11-11 18:55:17.280643', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('96', '物料紧缺', '2020-11-11 18:56:09.987658', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('97', '呼叫主管', '2020-11-11 19:03:03.705321', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('98', '机器故障', '2020-11-11 19:05:18.376024', '2', '69', '0');
INSERT INTO `web_callboss` VALUES ('99', '呼叫主管', '2020-11-11 19:29:49.956194', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('100', '呼叫主管', '2020-11-11 20:31:45.451708', '2', '86', '0');
INSERT INTO `web_callboss` VALUES ('101', '呼叫主管', '2020-11-11 20:32:03.499740', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('102', '物料紧缺', '2020-11-11 20:32:29.673237', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('103', '物料紧缺', '2020-11-11 20:32:44.762100', '2', '86', '0');
INSERT INTO `web_callboss` VALUES ('104', '物料紧缺', '2020-11-11 20:32:52.096520', '2', '86', '0');
INSERT INTO `web_callboss` VALUES ('105', '呼叫主管', '2020-11-11 20:33:55.185128', '2', '86', '0');
INSERT INTO `web_callboss` VALUES ('106', '呼叫主管', '2020-11-11 20:41:16.350361', '2', '86', '0');
INSERT INTO `web_callboss` VALUES ('107', '呼叫主管', '2020-11-11 20:50:55.343478', '2', '86', '1');
INSERT INTO `web_callboss` VALUES ('108', '呼叫主管', '2020-11-11 23:16:21.884607', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('109', '呼叫主管', '2020-11-12 01:26:51.530438', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('110', '呼叫主管', '2020-11-12 10:49:21.466823', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('111', '呼叫主管', '2020-11-12 11:00:03.430542', '2', '86', '0');
INSERT INTO `web_callboss` VALUES ('112', '呼叫主管', '2020-11-12 11:00:24.447744', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('113', '物料紧缺', '2020-11-12 11:00:32.410199', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('114', '物料紧缺', '2020-11-12 11:03:44.595192', '2', '86', '0');
INSERT INTO `web_callboss` VALUES ('115', '呼叫主管', '2020-11-12 11:13:01.423040', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('116', '物料紧缺', '2020-11-12 11:13:10.244545', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('117', '呼叫主管', '2020-11-12 11:28:45.866059', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('118', '物料紧缺', '2020-11-12 11:28:47.020125', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('119', '机器故障', '2020-11-12 11:28:47.803170', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('120', '呼叫主管', '2020-11-12 12:02:25.333566', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('121', '呼叫主管', '2020-11-12 12:34:11.231577', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('122', '物料紧缺', '2020-11-12 12:34:16.882901', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('123', '呼叫主管', '2020-11-12 12:59:03.426926', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('124', '物料紧缺', '2020-11-12 12:59:08.735230', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('125', '呼叫主管', '2020-11-12 22:14:10.652990', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('126', '物料紧缺', '2020-11-12 22:14:15.208251', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('127', '机器故障', '2020-11-12 22:14:16.952351', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('128', '呼叫主管', '2020-11-12 22:16:42.951701', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('129', '呼叫主管', '2020-11-12 22:17:12.253377', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('130', '物料紧缺', '2020-11-12 22:17:16.835640', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('131', '呼叫主管', '2020-11-12 22:23:33.372176', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('132', '呼叫主管', '2020-11-13 00:59:28.032232', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('133', '物料紧缺', '2020-11-13 00:59:34.327592', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('134', '机器故障', '2020-11-13 00:59:38.455828', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('135', '呼叫主管', '2020-11-13 08:39:23.582607', '2', '86', '0');
INSERT INTO `web_callboss` VALUES ('136', '呼叫主管', '2020-11-13 22:35:57.084511', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('137', '呼叫主管', '2020-11-13 23:18:54.869952', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('138', '物料紧缺', '2020-11-13 23:19:04.411498', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('139', '呼叫主管', '2020-11-13 23:19:15.662142', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('140', '呼叫主管', '2020-11-13 23:19:18.302293', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('141', '呼叫主管', '2020-11-13 23:19:42.327667', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('142', '呼叫主管', '2020-11-13 23:20:17.194661', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('143', '呼叫主管', '2020-11-13 23:20:33.796611', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('144', '呼叫主管', '2020-11-13 23:22:37.323676', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('145', '呼叫主管', '2020-11-14 18:06:12.280779', '2', '68', '1');
INSERT INTO `web_callboss` VALUES ('146', '呼叫主管', '2020-11-15 13:48:51.070924', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('147', '呼叫主管', '2020-11-15 13:49:09.724991', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('148', '呼叫主管', '2020-11-15 13:49:21.655673', '2', '68', '0');
INSERT INTO `web_callboss` VALUES ('149', '物料紧缺', '2020-11-15 13:49:24.038809', '2', '68', '0');

-- ----------------------------
-- Table structure for `web_chat`
-- ----------------------------
DROP TABLE IF EXISTS `web_chat`;
CREATE TABLE `web_chat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sid` varchar(50) DEFAULT NULL,
  `send_name` varchar(50) DEFAULT NULL,
  `aid` varchar(50) DEFAULT NULL,
  `receive_name` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `info_datetime` datetime NOT NULL,
  `is_read` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=286 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_chat
-- ----------------------------
INSERT INTO `web_chat` VALUES ('148', '003', '魏广明', '001', '生产厂长刘培文', '？？？？？？', '2020-11-11 17:22:18', '1');
INSERT INTO `web_chat` VALUES ('149', '003', '魏广明', '001', '生产厂长刘培文', '测试', '2020-11-11 17:22:24', '1');
INSERT INTO `web_chat` VALUES ('150', '001', '生产厂长刘培文', '003', '魏广明', '？？？？', '2020-11-11 17:25:02', '1');
INSERT INTO `web_chat` VALUES ('151', '003', '魏广明', '001', '生产厂长刘培文', '妈妈哈哈', '2020-11-11 17:25:15', '1');
INSERT INTO `web_chat` VALUES ('152', '003', '魏广明', '001', '生产厂长刘培文', '叫姐姐', '2020-11-11 17:34:29', '1');
INSERT INTO `web_chat` VALUES ('153', '003', '魏广明', '001', '生产厂长刘培文', '叫姐姐叫姐姐', '2020-11-11 17:34:55', '1');
INSERT INTO `web_chat` VALUES ('154', '001', '生产厂长刘培文', '003', '魏广明', '？？？？？？？', '2020-11-11 17:35:32', '1');
INSERT INTO `web_chat` VALUES ('155', '001', '生产厂长刘培文', '003', '魏广明', '干松木？', '2020-11-11 17:35:38', '1');
INSERT INTO `web_chat` VALUES ('156', '003', '魏广明', '001', '生产厂长刘培文', '。。锯', '2020-11-11 17:36:20', '1');
INSERT INTO `web_chat` VALUES ('157', '003', '魏广明', '001', '生产厂长刘培文', '哦哦哦', '2020-11-11 18:11:19', '1');
INSERT INTO `web_chat` VALUES ('158', '003', '魏广明', '001', '生产厂长刘培文', '哦哦哦', '2020-11-11 18:11:20', '1');
INSERT INTO `web_chat` VALUES ('159', '003', '魏广明', '001', '生产厂长刘培文', '哦哦哦', '2020-11-11 18:11:21', '1');
INSERT INTO `web_chat` VALUES ('160', '003', '魏广明', '001', '生产厂长刘培文', '妈妈哦', '2020-11-11 18:12:03', '1');
INSERT INTO `web_chat` VALUES ('161', '001', '生产厂长刘培文', '003', '魏广明', '？？？？', '2020-11-11 18:49:05', '1');
INSERT INTO `web_chat` VALUES ('162', '003', '魏广明', '001', '生产厂长刘培文', '妈妈', '2020-11-11 18:49:21', '1');
INSERT INTO `web_chat` VALUES ('163', '021', '刘培龙', '001', '生产厂长刘培文', 'jjj', '2020-11-11 20:34:18', '1');
INSERT INTO `web_chat` VALUES ('164', '001', '生产厂长刘培文', '021', '刘培龙', 'ji', '2020-11-11 20:34:47', '1');
INSERT INTO `web_chat` VALUES ('165', '001', '生产厂长刘培文', '021', '刘培龙', 'ji', '2020-11-11 20:35:34', '1');
INSERT INTO `web_chat` VALUES ('166', '021', '刘培龙', '001', '生产厂长刘培文', 'hi', '2020-11-11 20:35:46', '1');
INSERT INTO `web_chat` VALUES ('167', '001', '生产厂长刘培文', '021', '刘培龙', 'ji', '2020-11-11 20:37:16', '1');
INSERT INTO `web_chat` VALUES ('168', '001', '生产厂长刘培文', '021', '刘培龙', 'hi', '2020-11-11 20:41:09', '1');
INSERT INTO `web_chat` VALUES ('169', '001', '生产厂长刘培文', '021', '刘培龙', 'hi', '2020-11-11 20:41:35', '1');
INSERT INTO `web_chat` VALUES ('170', '001', '生产厂长刘培文', '021', '刘培龙', 'hi', '2020-11-11 20:41:52', '1');
INSERT INTO `web_chat` VALUES ('171', '021', '刘培龙', '001', '生产厂长刘培文', 'hi', '2020-11-11 20:42:05', '1');
INSERT INTO `web_chat` VALUES ('172', '021', '刘培龙', '001', '生产厂长刘培文', 'hi', '2020-11-11 20:42:18', '1');
INSERT INTO `web_chat` VALUES ('173', '021', '刘培龙', '001', '生产厂长刘培文', 'hi', '2020-11-11 20:42:38', '1');
INSERT INTO `web_chat` VALUES ('174', '001', '生产厂长刘培文', '021', '刘培龙', 'l', '2020-11-11 20:42:56', '1');
INSERT INTO `web_chat` VALUES ('175', '021', '刘培龙', '001', '生产厂长刘培文', '多', '2020-11-11 20:48:05', '1');
INSERT INTO `web_chat` VALUES ('176', '021', '刘培龙', '001', '生产厂长刘培文', '是', '2020-11-11 20:48:24', '1');
INSERT INTO `web_chat` VALUES ('177', '001', '生产厂长刘培文', '021', '刘培龙', 'k ', '2020-11-11 20:48:36', '1');
INSERT INTO `web_chat` VALUES ('178', '001', '生产厂长刘培文', '021', '刘培龙', 'k', '2020-11-11 20:48:50', '1');
INSERT INTO `web_chat` VALUES ('179', '001', '生产厂长刘培文', '021', '刘培龙', 'k', '2020-11-11 20:49:13', '1');
INSERT INTO `web_chat` VALUES ('180', '021', '刘培龙', '001', '生产厂长刘培文', '\n是', '2020-11-11 20:50:29', '0');
INSERT INTO `web_chat` VALUES ('181', '021', '刘培龙', '001', '生产厂长刘培文', '\n是\n', '2020-11-11 20:50:34', '0');
INSERT INTO `web_chat` VALUES ('182', '003', '魏广明', '001', '生产厂长刘培文', '。。。。', '2020-11-11 23:15:31', '1');
INSERT INTO `web_chat` VALUES ('183', '999', '系统开发刘功源', '003', '魏广明', 'ni hao', '2020-11-12 10:54:16', '1');
INSERT INTO `web_chat` VALUES ('184', '003', '魏广明', '999', '系统开发刘功源', '21', '2020-11-12 10:54:28', '1');
INSERT INTO `web_chat` VALUES ('185', '999', '系统开发刘功源', '003', '魏广明', '12', '2020-11-12 10:54:31', '1');
INSERT INTO `web_chat` VALUES ('186', '003', '魏广明', '999', '系统开发刘功源', '12313', '2020-11-12 10:54:48', '1');
INSERT INTO `web_chat` VALUES ('187', '999', '系统开发刘功源', '003', '魏广明', '12', '2020-11-12 10:54:50', '1');
INSERT INTO `web_chat` VALUES ('188', '003', '魏广明', '999', '系统开发刘功源', '123', '2020-11-12 10:56:50', '1');
INSERT INTO `web_chat` VALUES ('189', '003', '魏广明', '999', '系统开发刘功源', '111', '2020-11-12 10:56:54', '1');
INSERT INTO `web_chat` VALUES ('190', '003', '魏广明', '999', '系统开发刘功源', 'sasf', '2020-11-12 10:57:03', '1');
INSERT INTO `web_chat` VALUES ('191', '999', '系统开发刘功源', '003', '魏广明', '12', '2020-11-12 10:57:08', '1');
INSERT INTO `web_chat` VALUES ('192', '999', '系统开发刘功源', '003', '魏广明', '1212', '2020-11-12 10:57:11', '1');
INSERT INTO `web_chat` VALUES ('193', '003', '魏广明', '999', '系统开发刘功源', '12312313', '2020-11-12 10:57:15', '1');
INSERT INTO `web_chat` VALUES ('194', '003', '魏广明', '999', '系统开发刘功源', '12313', '2020-11-12 10:58:05', '1');
INSERT INTO `web_chat` VALUES ('195', '003', '魏广明', '999', '系统开发刘功源', '12123', '2020-11-12 10:58:19', '1');
INSERT INTO `web_chat` VALUES ('196', '999', '系统开发刘功源', '003', '魏广明', '22', '2020-11-12 10:58:22', '1');
INSERT INTO `web_chat` VALUES ('197', '003', '魏广明', '999', '系统开发刘功源', '12312323', '2020-11-12 10:58:35', '1');
INSERT INTO `web_chat` VALUES ('198', '003', '魏广明', '999', '系统开发刘功源', '123123', '2020-11-12 10:58:41', '1');
INSERT INTO `web_chat` VALUES ('199', '999', '系统开发刘功源', '003', '魏广明', '222', '2020-11-12 10:58:46', '1');
INSERT INTO `web_chat` VALUES ('200', '999', '系统开发刘功源', '003', '魏广明', '11', '2020-11-12 10:59:08', '1');
INSERT INTO `web_chat` VALUES ('201', '003', '魏广明', '999', '系统开发刘功源', '211', '2020-11-12 10:59:14', '1');
INSERT INTO `web_chat` VALUES ('202', '003', '魏广明', '999', '系统开发刘功源', '123', '2020-11-12 10:59:22', '1');
INSERT INTO `web_chat` VALUES ('203', '003', '魏广明', '999', '系统开发刘功源', 'sa', '2020-11-12 10:59:43', '1');
INSERT INTO `web_chat` VALUES ('204', '999', '系统开发刘功源', '003', '魏广明', '22', '2020-11-12 10:59:46', '1');
INSERT INTO `web_chat` VALUES ('205', '003', '魏广明', '999', '系统开发刘功源', '123', '2020-11-12 11:00:42', '1');
INSERT INTO `web_chat` VALUES ('206', '999', '系统开发刘功源', '003', '魏广明', '22', '2020-11-12 11:00:45', '1');
INSERT INTO `web_chat` VALUES ('207', '003', '魏广明', '999', '系统开发刘功源', '123123', '2020-11-12 11:01:04', '1');
INSERT INTO `web_chat` VALUES ('208', '999', '系统开发刘功源', '003', '魏广明', '22', '2020-11-12 11:01:06', '1');
INSERT INTO `web_chat` VALUES ('209', '003', '魏广明', '999', '系统开发刘功源', '123', '2020-11-12 11:01:16', '1');
INSERT INTO `web_chat` VALUES ('210', '003', '魏广明', '999', '系统开发刘功源', 'kk ', '2020-11-12 11:02:04', '1');
INSERT INTO `web_chat` VALUES ('211', '999', '系统开发刘功源', '003', '魏广明', '22', '2020-11-12 11:02:08', '1');
INSERT INTO `web_chat` VALUES ('212', '003', '魏广明', '999', '系统开发刘功源', '99', '2020-11-12 11:02:42', '1');
INSERT INTO `web_chat` VALUES ('213', '003', '魏广明', '999', '系统开发刘功源', 'ss', '2020-11-12 11:06:45', '1');
INSERT INTO `web_chat` VALUES ('214', '003', '魏广明', '999', '系统开发刘功源', 'nihao', '2020-11-12 11:06:47', '1');
INSERT INTO `web_chat` VALUES ('215', '003', '魏广明', '999', '系统开发刘功源', '113', '2020-11-12 11:06:50', '1');
INSERT INTO `web_chat` VALUES ('216', '003', '魏广明', '999', '系统开发刘功源', '1213', '2020-11-12 11:06:58', '1');
INSERT INTO `web_chat` VALUES ('217', '003', '魏广明', '999', '系统开发刘功源', 'fa', '2020-11-12 11:07:00', '1');
INSERT INTO `web_chat` VALUES ('218', '003', '魏广明', '001', '生产厂长刘培文', '1213', '2020-11-12 11:07:17', '1');
INSERT INTO `web_chat` VALUES ('219', '003', '魏广明', '999', '系统开发刘功源', '21123', '2020-11-12 11:07:25', '1');
INSERT INTO `web_chat` VALUES ('220', '003', '魏广明', '999', '系统开发刘功源', '321', '2020-11-12 11:07:31', '1');
INSERT INTO `web_chat` VALUES ('221', '003', '魏广明', '999', '系统开发刘功源', '123123', '2020-11-12 11:07:39', '1');
INSERT INTO `web_chat` VALUES ('222', '003', '魏广明', '999', '系统开发刘功源', '1213', '2020-11-12 11:07:55', '1');
INSERT INTO `web_chat` VALUES ('223', '003', '魏广明', '999', '系统开发刘功源', '2123', '2020-11-12 11:07:57', '1');
INSERT INTO `web_chat` VALUES ('224', '003', '魏广明', '999', '系统开发刘功源', '1231231', '2020-11-12 11:09:23', '1');
INSERT INTO `web_chat` VALUES ('225', '003', '魏广明', '999', '系统开发刘功源', '322', '2020-11-12 11:09:28', '1');
INSERT INTO `web_chat` VALUES ('226', '003', '魏广明', '004', '孙光勇', '22', '2020-11-12 11:10:28', '0');
INSERT INTO `web_chat` VALUES ('227', '003', '魏广明', '002', '仓库管理龙倩倩', '222', '2020-11-12 11:11:24', '0');
INSERT INTO `web_chat` VALUES ('228', '003', '魏广明', '001', '生产厂长刘培文', '22', '2020-11-12 11:12:24', '1');
INSERT INTO `web_chat` VALUES ('229', '003', '魏广明', '001', '生产厂长刘培文', '13', '2020-11-12 11:12:28', '1');
INSERT INTO `web_chat` VALUES ('230', '003', '魏广明', '999', '系统开发刘功源', '11', '2020-11-12 11:13:17', '1');
INSERT INTO `web_chat` VALUES ('231', '003', '魏广明', '999', '系统开发刘功源', '333', '2020-11-12 11:13:21', '1');
INSERT INTO `web_chat` VALUES ('232', '003', '魏广明', '001', '生产厂长刘培文', '12313', '2020-11-12 11:28:35', '1');
INSERT INTO `web_chat` VALUES ('233', '003', '魏广明', '999', '系统开发刘功源', '1111', '2020-11-12 11:28:38', '1');
INSERT INTO `web_chat` VALUES ('234', '003', '魏广明', '999', '系统开发刘功源', '131213', '2020-11-12 11:28:40', '1');
INSERT INTO `web_chat` VALUES ('235', '003', '魏广明', '999', '系统开发刘功源', '33212313', '2020-11-12 11:28:42', '1');
INSERT INTO `web_chat` VALUES ('236', '003', '魏广明', '999', '系统开发刘功源', 'HI', '2020-11-12 11:28:56', '1');
INSERT INTO `web_chat` VALUES ('237', '003', '魏广明', '999', '系统开发刘功源', 'hello', '2020-11-12 11:28:59', '1');
INSERT INTO `web_chat` VALUES ('238', '003', '魏广明', '999', '系统开发刘功源', '00', '2020-11-12 11:29:16', '1');
INSERT INTO `web_chat` VALUES ('239', '003', '魏广明', '999', '系统开发刘功源', '炎', '2020-11-12 11:30:22', '1');
INSERT INTO `web_chat` VALUES ('240', '003', '魏广明', '999', '系统开发刘功源', 'ooi', '2020-11-12 11:58:06', '1');
INSERT INTO `web_chat` VALUES ('241', '003', '魏广明', '999', '系统开发刘功源', '==', '2020-11-12 12:01:34', '1');
INSERT INTO `web_chat` VALUES ('242', '003', '魏广明', '001', '生产厂长刘培文', 'pp', '2020-11-12 12:09:19', '1');
INSERT INTO `web_chat` VALUES ('243', '003', '魏广明', '666', '生产系统管理员', '99', '2020-11-12 12:09:23', '1');
INSERT INTO `web_chat` VALUES ('244', '001', '生产厂长刘培文', '003', '魏广明', '？？', '2020-11-12 12:34:29', '1');
INSERT INTO `web_chat` VALUES ('245', '001', '生产厂长刘培文', '003', '魏广明', '？？？？', '2020-11-12 12:34:34', '1');
INSERT INTO `web_chat` VALUES ('246', '003', '魏广明', '001', '生产厂长刘培文', '好的', '2020-11-12 12:34:46', '1');
INSERT INTO `web_chat` VALUES ('247', '003', '魏广明', '001', '生产厂长刘培文', '哈哈', '2020-11-12 12:34:50', '1');
INSERT INTO `web_chat` VALUES ('248', '001', '生产厂长刘培文', '003', '魏广明', 'hao的 ', '2020-11-12 12:37:13', '1');
INSERT INTO `web_chat` VALUES ('249', '001', '生产厂长刘培文', '003', '魏广明', '去哪里？', '2020-11-12 12:37:18', '1');
INSERT INTO `web_chat` VALUES ('250', '003', '魏广明', '001', '生产厂长刘培文', '在的', '2020-11-12 12:37:36', '1');
INSERT INTO `web_chat` VALUES ('251', '003', '魏广明', '001', '生产厂长刘培文', '。。。', '2020-11-12 12:56:19', '1');
INSERT INTO `web_chat` VALUES ('252', '003', '魏广明', '001', '生产厂长刘培文', '没没没', '2020-11-12 12:56:25', '1');
INSERT INTO `web_chat` VALUES ('253', '003', '魏广明', '001', '生产厂长刘培文', '妈妈', '2020-11-12 12:56:50', '1');
INSERT INTO `web_chat` VALUES ('254', '', '生产厂长刘培文', '003', '魏广明', '？？？？？？', '2020-11-12 12:57:03', '0');
INSERT INTO `web_chat` VALUES ('255', '003', '魏广明', '001', '生产厂长刘培文', '。', '2020-11-12 12:57:25', '1');
INSERT INTO `web_chat` VALUES ('256', '001', '生产厂长刘培文', '003', '魏广明', '？？？？？？', '2020-11-12 12:58:21', '1');
INSERT INTO `web_chat` VALUES ('257', '003', '魏广明', '001', '生产厂长刘培文', '。。。。', '2020-11-12 12:58:27', '1');
INSERT INTO `web_chat` VALUES ('258', '003', '魏广明', '001', '生产厂长刘培文', '叫姐姐', '2020-11-12 22:14:30', '1');
INSERT INTO `web_chat` VALUES ('259', '003', '魏广明', '001', '生产厂长刘培文', '快快快', '2020-11-12 22:14:36', '1');
INSERT INTO `web_chat` VALUES ('260', '001', '生产厂长刘培文', '003', '魏广明', '...........', '2020-11-12 22:14:49', '1');
INSERT INTO `web_chat` VALUES ('261', '001', '生产厂长刘培文', '003', '魏广明', '？？？？？？？？？', '2020-11-12 22:14:59', '1');
INSERT INTO `web_chat` VALUES ('262', '001', '生产厂长刘培文', '003', '魏广明', '？？？？？', '2020-11-12 22:15:20', '1');
INSERT INTO `web_chat` VALUES ('263', '001', '生产厂长刘培文', '003', '魏广明', 'llllllllll', '2020-11-12 22:15:26', '1');
INSERT INTO `web_chat` VALUES ('264', '003', '魏广明', '001', '生产厂长刘培文', '你那', '2020-11-12 22:15:55', '1');
INSERT INTO `web_chat` VALUES ('265', '003', '魏广明', '001', '生产厂长刘培文', '。。。', '2020-11-12 22:16:03', '1');
INSERT INTO `web_chat` VALUES ('266', '003', '魏广明', '001', '生产厂长刘培文', '没没没', '2020-11-13 00:59:51', '1');
INSERT INTO `web_chat` VALUES ('267', '001', '生产厂长刘培文', '003', '魏广明', '？？？？？？？', '2020-11-13 00:59:59', '1');
INSERT INTO `web_chat` VALUES ('268', '001', '生产厂长刘培文', '003', '魏广明', '啦啦啦啦啦啦啦啦', '2020-11-13 01:00:38', '1');
INSERT INTO `web_chat` VALUES ('269', '003', '魏广明', '001', '生产厂长刘培文', '。。。', '2020-11-13 01:12:37', '1');
INSERT INTO `web_chat` VALUES ('270', '003', '魏广明', '001', '生产厂长刘培文', '哈哈哈', '2020-11-13 01:12:48', '1');
INSERT INTO `web_chat` VALUES ('271', '001', '生产厂长刘培文', '003', '魏广明', '啦啦啦', '2020-11-13 01:13:35', '1');
INSERT INTO `web_chat` VALUES ('272', '001', '生产厂长刘培文', '003', '魏广明', '快快快', '2020-11-13 01:13:40', '1');
INSERT INTO `web_chat` VALUES ('273', '001', '生产厂长刘培文', '003', '魏广明', '急急急', '2020-11-13 01:13:44', '1');
INSERT INTO `web_chat` VALUES ('274', '021', '刘培龙', '999', '系统开发', '你好', '2020-11-13 08:37:37', '1');
INSERT INTO `web_chat` VALUES ('275', '021', '刘培龙', '999', '系统开发', '晃', '2020-11-13 08:37:53', '1');
INSERT INTO `web_chat` VALUES ('276', '999', '系统开发', '021', '刘培龙', '13', '2020-11-13 10:16:10', '1');
INSERT INTO `web_chat` VALUES ('277', '021', '刘培龙', '999', '系统开发', '99', '2020-11-13 19:41:27', '1');
INSERT INTO `web_chat` VALUES ('278', '999', '系统开发', '021', '刘培龙', '99', '2020-11-13 19:42:39', '0');
INSERT INTO `web_chat` VALUES ('279', '003', '魏广明', '001', '生产厂长刘培文', '？？？？', '2020-11-13 22:35:47', '1');
INSERT INTO `web_chat` VALUES ('280', '003', '魏广明', '001', '生产厂长刘培文', '哪里？', '2020-11-13 22:35:51', '1');
INSERT INTO `web_chat` VALUES ('281', '003', '魏广明', '001', '生产厂长刘培文', '你那', '2020-11-13 23:20:55', '1');
INSERT INTO `web_chat` VALUES ('282', '001', '生产厂长刘培文', '003', '魏广明', '？？？？？？？？？？', '2020-11-13 23:21:11', '1');
INSERT INTO `web_chat` VALUES ('283', '003', '魏广明', '001', '生产厂长刘培文', '马', '2020-11-13 23:21:32', '1');
INSERT INTO `web_chat` VALUES ('284', '003', '魏广明', '001', '生产厂长刘培文', '你你你', '2020-11-14 18:06:28', '1');
INSERT INTO `web_chat` VALUES ('285', '003', '魏广明', '001', '生产厂长刘培文', '、、、、、、、、、', '2020-11-15 14:08:20', '1');

-- ----------------------------
-- Table structure for `web_database_manage`
-- ----------------------------
DROP TABLE IF EXISTS `web_database_manage`;
CREATE TABLE `web_database_manage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `backup_name` varchar(100) DEFAULT NULL,
  `size` varchar(50) DEFAULT NULL,
  `op_datetime` datetime DEFAULT NULL,
  `userinfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_database_manage_userinfo_id_d6a1ef95_fk_web_userinfo_id` (`userinfo_id`),
  CONSTRAINT `web_database_manage_userinfo_id_d6a1ef95_fk_web_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `web_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_database_manage
-- ----------------------------

-- ----------------------------
-- Table structure for `web_executor`
-- ----------------------------
DROP TABLE IF EXISTS `web_executor`;
CREATE TABLE `web_executor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `op_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) NOT NULL,
  `wk_id` int(11) DEFAULT NULL,
  `is_read` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_executor_schedule_id_77a8b7b8_fk_web_schedule_id` (`schedule_id`),
  KEY `web_executor_op_id_a5be7308_fk_web_userinfo_id` (`op_id`),
  KEY `web_executor_wk_id_5aa0a981_fk_web_workman_id` (`wk_id`),
  CONSTRAINT `web_executor_op_id_a5be7308_fk_web_userinfo_id` FOREIGN KEY (`op_id`) REFERENCES `web_userinfo` (`id`),
  CONSTRAINT `web_executor_schedule_id_77a8b7b8_fk_web_schedule_id` FOREIGN KEY (`schedule_id`) REFERENCES `web_schedule` (`id`),
  CONSTRAINT `web_executor_wk_id_5aa0a981_fk_web_workman_id` FOREIGN KEY (`wk_id`) REFERENCES `web_workman` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_executor
-- ----------------------------

-- ----------------------------
-- Table structure for `web_filemodifyrecord`
-- ----------------------------
DROP TABLE IF EXISTS `web_filemodifyrecord`;
CREATE TABLE `web_filemodifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modifyDateTime` datetime(6) NOT NULL,
  `fileKey_id` int(11) DEFAULT NULL,
  `modifyUser_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_filemodifyrecord_fileKey_id_cda537ad_fk_web_filesystem_id` (`fileKey_id`),
  KEY `web_filemodifyrecord_modifyUser_id_be576f8e_fk_web_userinfo_id` (`modifyUser_id`),
  CONSTRAINT `web_filemodifyrecord_fileKey_id_cda537ad_fk_web_filesystem_id` FOREIGN KEY (`fileKey_id`) REFERENCES `web_filesystem` (`id`),
  CONSTRAINT `web_filemodifyrecord_modifyUser_id_be576f8e_fk_web_userinfo_id` FOREIGN KEY (`modifyUser_id`) REFERENCES `web_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_filemodifyrecord
-- ----------------------------
INSERT INTO `web_filemodifyrecord` VALUES ('1', '2020-11-14 10:07:17.564059', '26', '6');
INSERT INTO `web_filemodifyrecord` VALUES ('2', '2020-11-14 10:07:38.333247', '26', '6');
INSERT INTO `web_filemodifyrecord` VALUES ('3', '2020-11-14 18:08:13.383792', '28', '1');

-- ----------------------------
-- Table structure for `web_filesystem`
-- ----------------------------
DROP TABLE IF EXISTS `web_filesystem`;
CREATE TABLE `web_filesystem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sort_num` int(11) NOT NULL,
  `content` longtext,
  `keywords` varchar(200) DEFAULT NULL,
  `info_datetime` datetime(6) NOT NULL,
  `is_modify` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_filesystem
-- ----------------------------
INSERT INTO `web_filesystem` VALUES ('26', '10项基本安全操作规程', '1', '<p>木艺是一项充满乐趣的活动，但这种乐趣需要建立在安全可靠的基础之上。</p><p>以下规程都是最常识最基础的规程，如果不遵守，就会大大提高事故的机率。有句话怎么说来着？最好在中午玩木工，因为早晚会出事。</p><p>1、始终坚持佩戴安全设备</p><p>听力的损伤是不可恢复的，因此在操作嘈杂的机械时，耳塞或耳罩是必备之物。</p><p>油漆会造成过敏，且不易清洁，这时候可以使用乳胶手套。</p><p>绝大数机械都会造成灰尘，口罩要常带。但与防疫不同，就防尘效果来说，KN95要比普通医用口罩更适合工业生产。</p><p>眼睛是另一个重点保护对象，美国大胡子木工从不戴口罩，却在每一集开头都会提示要戴好护目镜。</p><p>&nbsp;</p><p>2、穿合适的衣服</p><p>在木工车间工作时，切记避免穿宽松的衣服，不要戴配饰。因为你不会希望任何衣服被锯片或其它什么玩意缠住。工作服还会保护你的身体免受木屑碎片的伤害。</p><p>在穿着干净衣服时，人会本能的远离污染物。因此保护性的服装，比如围裙、套袖等，还会保证你操作动作不变形，防止出现事故。</p><p>&nbsp;</p><p>3、避免酒后工作</p><p>木工是危险的工作。如果因为某种原因影响了你的反应速度，请远离工房。</p><p>虽然在周末的休闲木工活动中饮用一瓶啤酒似乎无伤大雅，但我们永远也无法准确衡量这会对你的反应能力产生多大的影响。唯一确定的是，这会加大工作中的风险。这样看来，一瓶啤酒的收益似乎远比不上随之而来的风险，那么为什么还要做呢？</p><p>&nbsp;</p><p>4、更换刀片之前先断开电源</p><p>每当需要更换电动工具上的刀片或钻头时，一定要先断开电动工具的电源。许多木工忘记了这个重要环节，结果失去了手指。</p><p>&nbsp;</p><p>5、永远只使用一根重型拖线板</p><p>使用一根重型延长线，而不是每个工具一个，让自己永远处于插孔不够用的状态。</p><p>这样一来，在更换工具之前，你不得先拔掉其它插头，以便空出一个插孔。通过这种方式，使当前插电设备的数量保持在一个较低的水平。同时，你将始终记得转换工具时要插拔电源，最终使安全性得到提高。</p><p>&nbsp;</p><p>6、保持刀片和钻头的锋利</p><p>钝的切削工具非常危险。如果锯片没有达到理想的锐度，你必须施加更大的力量。因此，机械和你的力量都将变得很不可控，工具将更有可能反冲或被抱死。</p><p>此外，使用更锋利的切割工具可以使切割更干净，因此，保持锋利并不仅是一个安全方面的问题，还有助于更好的加工效果。</p><p>&nbsp;</p><p>7、始终检查钉子，螺丝和其他金属碎片</p><p>在使用机械时，要注意周围的金属碎片，比如钉子、小螺丝等。对于旧木料，最好用金属探测器进行检查，防止内部含有钉子，崩坏锯片刨刀，并带来危险。</p><p>&nbsp;</p><p>8、工件运行方向永远与刀具运动方向相反</p><p>手提锯开机时，永远不要后退。台锯送料时只前进不后退，要安装分料刀。铣刀加工时，工件要迎着铣刀的旋转方向前进，禁止后退。电钻操作时，工件要可靠固定，防止随钻头转动带来危险。</p><p>&nbsp;</p><p>9、远离锯片</p><p>在台锯、斜切锯等上作业时，切勿将手放在刀片附近的地方，不要在锯片转动时移动工件。</p><p>操作斜切锯时，要掌握以下节奏：</p><p>左手保持距离压住工件，右手握手柄先开机让锯片转动，然后再缓慢压下机头切割。切割完成后，右手先不抬，先松开开关，待锯片完全停止后，再抬起机头，然后手再离开手柄。</p><p>以上动作不要过于连惯，一定要切实完成一个动作后，再进行下一个动作。</p><p>台锯也是如此，锯片不完全停止，禁止拾捡锯台上的工件。</p><p>最后，要擅长的制作使用各种辅助工装，这会大大增加安全性。</p><p>&nbsp;</p><p>10、避免分心</p><p>一个通用经验是：如果心烦意燥，心中牵挂某件未尽事宜，从而无法全身心的投入。那么，这时候就应该果断停止工作，该干嘛就干嘛去。</p><p>按照我的经验，如果在这时候硬要坚持工作，那么受伤的可能性超过90%。</p>', '', '2020-11-11 16:33:54.338447', '0');
INSERT INTO `web_filesystem` VALUES ('27', '员工入职登记表', '2', '<p>RTT</p>', '', '2020-11-14 02:08:02.808381', '1');
INSERT INTO `web_filesystem` VALUES ('28', '生产厂长工作要求以及内容', '3', '<p class=\"ql-align-center\"><strong>生产厂长工作要求以及内容</strong></p><h4>生产宗旨：安全生产&nbsp;节能降耗&nbsp;提高效率</h4><p>每天的工作内容：</p><p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每天对员工进行考勤</p><p>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每天对完成生产的产品进行检查验收</p><p>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每天对机械设备 进行检查 报修。</p><p>4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据生产计划，合理安排员工 工作内容和生产进度。</p><p>5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;早8点-下午3点操作数控设备，进行生产。</p><p>每月月底，需要提交：</p><p>1.考勤详表&nbsp;</p><p>2.工资单详表 （电脑提交） </p><p>3.产品交付详表（包含每天的交于仓库的产品，和月底累计总数表）</p><p>4. 每月1号进行车间卫生大扫除</p><p>&nbsp;</p><p>生产厂长工资计算</p><p>&nbsp;</p><p>基本工资3000元 加产品提成0.2元*每个月的总产量+自己计件工资+工龄。</p><p>1.年底奖金为0.01元*年产量，如出现安全事故，无任何年终奖。 </p><p>2.如一年中没有一次缺货的情况并且无安全事故，年终奖为奖金的2倍！</p><p>3.如一年中没有一次缺货的情况并且无安全事故，产量达到年第一季度平均月产量的20倍，者奖金为3倍。</p><p>4. 如一年中没有一次缺货的情况并且无安全事故，产量达到年第一季度平均月产量的20倍，并且年底无余料和浪费材料，者奖金为5倍。</p><p>5.当月的歇班扣除金额按照当月总产量的提成除以当月天数，然后在乘以休假天数。所扣除的提成交给带班人员。例如当月产量10000个 天数为30天 休班5天，那么扣除的金额为</p><p>10000/30*0.2*5=333.33元</p>', '', '2020-11-14 02:09:41.897049', '0');
INSERT INTO `web_filesystem` VALUES ('29', '木工损耗奖罚制度', '4', '<p>为了降低生产成本，减少原料不必要的浪费特设立此制度。</p><p>任何工序的工作都需要按样板标准工艺生产（样板可以向生产厂长获取），如因个人原因造成所生产配件，不达标。将按照10元/KG的价格进行处罚！（此价格根据板材价格计算所得）。</p><p>如因原材料自身原因而造成的产品缺陷，将不进行处罚。</p><p>每位员工有义务对上一道工序进行监督，如因使用不达标的配件而造成了产品的整体报废而无法修复，报废品将按照20元/KG的价格进行处罚！</p><p>自规定公布实行后如发现个别工人为了逃避处罚将损坏的木料私自处理隐藏者一经发现将按照所藏匿品的5倍重量处罚！</p><p>此制度由生产厂长具体执行，仓库进行监督抽查。如发现藏匿原材料生产厂长隐瞒事实，将对生产厂长罚款500元/次！</p><p>每个月的15号将对本月所产品的损耗进行结算。</p>', null, '2020-11-14 18:08:52.181060', '0');
INSERT INTO `web_filesystem` VALUES ('30', '【木工生产制度大全】', '0', '<h1 class=\"ql-align-center\">木工奖罚制度</h1><p>&nbsp;</p><p>&nbsp;</p><p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;零工为80元/班/9小时</p><p>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;满勤奖金由原来30元&nbsp;迟到早退5分钟以上罚款30元/次。考勤人员如不如实考勤罚款30元。以监控为准。</p><p>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;木工生产正常生产的产品，如不缺货奖励 生产厂长奖励300元，如单品缺货24小时以上，奖金扣除。每增加1天单品罚款生产厂长20元/个（如延误3天，那么单个商品的罚款就是20*3*1个=60元&nbsp;&nbsp;如10个就是600元。</p><p>4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产厂长和个人奖金为每年6-11月。其余时间无奖金。</p><p>5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;单月表现突出的员工（仅一人）生产厂长有权限奖励200元。</p><p>6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;顾客反馈质量问题 当事人罚款100元/个 生产厂长罚款50元/个</p><p>&nbsp;</p><p>&nbsp;</p><p>10项基本安全操作规程</p><p>&nbsp;</p><p>木艺是一项充满乐趣的活动，但这种乐趣需要建立在安全可靠的基础之上。</p><p>以下规程都是最常识最基础的规程，如果不遵守，就会大大提高事故的机率。有句话怎么说来着？最好在中午玩木工，因为早晚会出事。</p><p>1、始终坚持佩戴安全设备</p><p>听力的损伤是不可恢复的，因此在操作嘈杂的机械时，耳塞或耳罩是必备之物。</p><p>油漆会造成过敏，且不易清洁，这时候可以使用乳胶手套。</p><p>绝大数机械都会造成灰尘，口罩要常带。但与防疫不同，就防尘效果来说，KN95要比普通医用口罩更适合工业生产。</p><p>眼睛是另一个重点保护对象，美国大胡子木工从不戴口罩，却在每一集开头都会提示要戴好护目镜。</p><p>&nbsp;</p><p>2、穿合适的衣服</p><p>在木工车间工作时，切记避免穿宽松的衣服，不要戴配饰。因为你不会希望任何衣服被锯片或其它什么玩意缠住。工作服还会保护你的身体免受木屑碎片的伤害。</p><p>在穿着干净衣服时，人会本能的远离污染物。因此保护性的服装，比如围裙、套袖等，还会保证你操作动作不变形，防止出现事故。</p><p>&nbsp;</p><p>3、避免酒后工作</p><p>木工是危险的工作。如果因为某种原因影响了你的反应速度，请远离工房。</p><p>虽然在周末的休闲木工活动中饮用一瓶啤酒似乎无伤大雅，但我们永远也无法准确衡量这会对你的反应能力产生多大的影响。唯一确定的是，这会加大工作中的风险。这样看来，一瓶啤酒的收益似乎远比不上随之而来的风险，那么为什么还要做呢？</p><p>&nbsp;</p><p>4、更换刀片之前先断开电源</p><p>每当需要更换电动工具上的刀片或钻头时，一定要先断开电动工具的电源。许多木工忘记了这个重要环节，结果失去了手指。</p><p>&nbsp;</p><p>5、永远只使用一根重型拖线板</p><p>使用一根重型延长线，而不是每个工具一个，让自己永远处于插孔不够用的状态。</p><p>这样一来，在更换工具之前，你不得先拔掉其它插头，以便空出一个插孔。通过这种方式，使当前插电设备的数量保持在一个较低的水平。同时，你将始终记得转换工具时要插拔电源，最终使安全性得到提高。</p><p>&nbsp;</p><p>6、保持刀片和钻头的锋利</p><p>钝的切削工具非常危险。如果锯片没有达到理想的锐度，你必须施加更大的力量。因此，机械和你的力量都将变得很不可控，工具将更有可能反冲或被抱死。</p><p>此外，使用更锋利的切割工具可以使切割更干净，因此，保持锋利并不仅是一个安全方面的问题，还有助于更好的加工效果。</p><p>&nbsp;</p><p>7、始终检查钉子，螺丝和其他金属碎片</p><p>在使用机械时，要注意周围的金属碎片，比如钉子、小螺丝等。对于旧木料，最好用金属探测器进行检查，防止内部含有钉子，崩坏锯片刨刀，并带来危险。</p><p>&nbsp;</p><p>8、工件运行方向永远与刀具运动方向相反</p><p>手提锯开机时，永远不要后退。台锯送料时只前进不后退，要安装分料刀。铣刀加工时，工件要迎着铣刀的旋转方向前进，禁止后退。电钻操作时，工件要可靠固定，防止随钻头转动带来危险。</p><p>&nbsp;</p><p>9、远离锯片</p><p>在台锯、斜切锯等上作业时，切勿将手放在刀片附近的地方，不要在锯片转动时移动工件。</p><p>操作斜切锯时，要掌握以下节奏：</p><p>左手保持距离压住工件，右手握手柄先开机让锯片转动，然后再缓慢压下机头切割。切割完成后，右手先不抬，先松开开关，待锯片完全停止后，再抬起机头，然后手再离开手柄。</p><p>以上动作不要过于连惯，一定要切实完成一个动作后，再进行下一个动作。</p><p>台锯也是如此，锯片不完全停止，禁止拾捡锯台上的工件。</p><p>最后，要擅长的制作使用各种辅助工装，这会大大增加安全性。</p><p>&nbsp;</p><p>10、避免分心</p><p>一个通用经验是：如果心烦意燥，心中牵挂某件未尽事宜，从而无法全身心的投入。那么，这时候就应该果断停止工作，该干嘛就干嘛去。</p><p>按照我的经验，如果在这时候硬要坚持工作，那么受伤的可能性超过90%。</p><p>&nbsp;</p><p>木工工龄制度</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;员工自入厂起每满一年每月的工资额外补助30元。例如 张三2016年8月15日进厂 到2017年8月16日以后每月工资额外增加30元，到2018年8月16日后每月工资额外增加60元以此类推！入厂日期请员工自行记住，到期后请向生产厂长申请，核实无误后。通知财务给与批准增加工龄奖！</p><p>&nbsp;</p><p>木工技术等级制度</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;为了提高本厂工人的技术含量，特采用木工技术等级制度。本制度把木工技术共分为6个等级！每年度根据行业状况给与技术等级的工资补助。</p><p>一级木工：木工初学者进厂不满一年，且无任何木工基础。</p><p>二级木工：可以熟练的掌握木工的各种机械 工具的使用，并可以独立的完成产品部件的制作。</p><p>三级木工：可以熟练的使用各种木工机械 工具，可以独立完成机械的维护。并可以完成简单的产品的单独制作和开发！</p><p>四级木工：可以做到三级木工的所能做到的一切 并可以使用电脑雕刻机 和产品制图！。</p><p>五级木工：含四级木工所有技能，并熟悉工厂工序 质量管理。</p><p>六级木工：大师级，具有木工所有技能和工厂管理经验。可以独立的完成任何木工产品的开发和制作。</p><p>2017年度每月木工等级补助金额：</p><p>一级 0元</p><p>二级 200元</p><p>三级 500元</p><p>四级 1000元</p><p>五级 1500元</p><p>六级 3000元</p><p>&nbsp;</p><p>木工损耗奖罚制度</p><p>&nbsp;</p><p>&nbsp;</p><p>为了降低生产成本，减少原料不必要的浪费特设立此制度。</p><p>任何工序的工作都需要按样板标准工艺生产（样板可以向生产厂长获取），如因个人原因造成所生产配件，不达标。将按照10元/KG的价格进行处罚！（此价格根据板材价格计算所得）。</p><p>如因原材料自身原因而造成的产品缺陷，将不进行处罚。</p><p>每位员工有义务对上一道工序进行监督，如因使用不达标的配件而造成了产品的整体报废而无法修复，报废品将按照20元/KG的价格进行处罚！</p><p>自规定公布实行后如发现个别工人为了逃避处罚将损坏的木料私自处理隐藏者一经发现将按照所藏匿品的5倍重量处罚！</p><p>此制度由生产厂长具体执行，仓库进行监督抽查。如发现藏匿原材料生产厂长隐瞒事实，将对生产厂长罚款500元/次！</p><p>每个月的15号将对本月所产品的损耗进行结算。</p><p>&nbsp;</p><h3 class=\"ql-align-center\">木工加班制度</h3><p>&nbsp;</p><p>木工加班至晚上9点 为一个加班。计件工补贴为10元/加班。按时工，按此人工资小时计算加补贴10元/班。</p><p>加班有免费晚饭。如员工 加班不到9点无补贴。</p><p>加班补贴由生产厂长统计报财务。</p><p>加班晚饭由生产厂长提前通知厨房人数。以方便厨房安排伙食。</p><h3 class=\"ql-align-center\">木工新员工扶持补贴制度</h3><p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新员工培训制度：新员工入职后，由生产厂长指定安排郭师傅对其指导监督。此新员工按新手学习80元/天。直至新员工认为可以自己独当一面。（简单工序最高不得超过7天）。</p><p>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;新员工的工作内容计件多少，由生产厂长统计到生产工资详单上。</p><h3 class=\"ql-align-center\">生产厂长工作要求以及内容</h3><h4>生产宗旨：安全生产&nbsp;节能降耗&nbsp;提高效率</h4><p>每天的工作内容：</p><p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每天对员工进行考勤</p><p>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每天对完成生产的产品进行检查验收</p><p>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每天对机械设备 进行检查 报修。</p><p>4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;根据生产计划，合理安排员工 工作内容和生产进度。</p><p>5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;早8点-下午3点操作数控设备，进行生产。</p><p>每月月底，需要提交：</p><p>1.考勤详表&nbsp;</p><p>2.工资单详表 （电脑提交） </p><p>3.产品交付详表（包含每天的交于仓库的产品，和月底累计总数表）</p><p>4. 每月1号进行车间卫生大扫除</p><p>&nbsp;</p><p>生产厂长工资计算</p><p>&nbsp;</p><p>基本工资3000元 加产品提成0.2元*每个月的总产量+自己计件工资+工龄。</p><p>1.年底奖金为0.01元*年产量，如出现安全事故，无任何年终奖。 </p><p>2.如一年中没有一次缺货的情况并且无安全事故，年终奖为奖金的2倍！</p><p>3.如一年中没有一次缺货的情况并且无安全事故，产量达到年第一季度平均月产量的20倍，者奖金为3倍。</p><p>4. 如一年中没有一次缺货的情况并且无安全事故，产量达到年第一季度平均月产量的20倍，并且年底无余料和浪费材料，者奖金为5倍。</p><p>5.当月的歇班扣除金额按照当月总产量的提成除以当月天数，然后在乘以休假天数。所扣除的提成交给带班人员。例如当月产量10000个 天数为30天 休班5天，那么扣除的金额为</p><p>10000/30*0.2*5=333.33元</p><p>&nbsp;</p><p>公司员工工资预支制度</p><p>&nbsp;</p><p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;因人而异，一般是员工月工资的一半，例如某位员工月工资大约6000元，那么此人最高预支金额为3000元。</p><p>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;预支的金额上限由老板定量，财务执行。</p><p>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;预支成功后，还款的日期为下个月发工资，财务追回。</p><p>&nbsp;</p><p>&nbsp;仓库员工个人物品管理</p><p>任何人的个人物品，例如手提包 手提袋 不得带入工作区 如仓库 木工车间 如发现每次罚款100元。</p><p>个人物品例如手提袋 包 塑料袋请放入个人专用员工箱内。</p><p>如发现员工盗窃公司财产，无论金额大小将立即开除。并且不退还押金。价值金额巨大者，将交于公安部门处理！</p><p>本公司监控 24小时不间断录制，请不要以身试法。</p><p>&nbsp;</p><p><br></p><h2 class=\"ql-align-center\">仓库员工管理条例</h2><p>一、领料时间：中午12点-下午5点 所有需要消耗品 配件 原料的人员均可以在此时间段内 认领物品。其他时间不在开放.如因个人没有按时认领物品 造成工作延误。而必须认领物品的 每次扣当事人10元</p><p>二、 生产所需要原材料、零部件等的领取必须办理领用手续。领料由仓库管理员开《领料单》领料人签字生效，仓库凭有效《领料单》发料。 发料后，仓库保管领料单。以便以后核对账务</p><p>三、在领料时应自觉排队，除非仓库管理员允许，一律不得进入库房内。 </p><p>&nbsp;</p><p>四、领料人领取物料后，对物料 工具 消耗品 原材料等有保管的义务。如发现物料账目不符，或者领料人盗取物料 工具等，一经发现立即开除。并不退还押金！金额巨大者将交于公安处理！</p><p>五 消耗品仓库，工具类的《以旧换新》 消耗类的 比如墨水，需要拿旧的墨水瓶换新的</p><p>色带架拿旧的换新的 木工刀具 工具等 以此类推！胶带器 胶带等物品均需要以旧换新！圆珠笔 计算器 扫描枪</p><p>&nbsp;</p><p>&nbsp;</p><p>六. 除木工使用的消耗品以外，其他人认领消耗品。必须本人认领不得他人代替。</p><p>七. 每月不定时对仓库库存账目和实物核对如不一致每次罚款200元，一个月之内连续3次，直接辞退。</p><p>&nbsp;</p><p>&nbsp;</p><h3 class=\"ql-align-center\">工具维护奖罚制度</h3><p>&nbsp;</p><p>为了降低生产成本，使大家爱护工具和公共财物特设立此制度。</p><p>本厂所有常用个人工具，电脑，打印机，大型机械等将采用有偿维修更换！</p><p>维修价格： 电脑硬件损坏2元</p><p>&nbsp;打印机 2元</p><p>&nbsp;扫描枪 1元</p><p>&nbsp;电子秤 2元</p><p>&nbsp;胶带器 0.5元</p><p>&nbsp;气钉枪 1元</p><p>&nbsp;砂光机1元</p><p>&nbsp;电动螺丝刀 1元</p><p>&nbsp;电机砂光机 2元</p><p>&nbsp;台钻 2元</p><p>&nbsp;雕刻机 推台锯 镂铣机5元</p><p>其他未列出的机械 2元/台/次</p><p>如连续6个月个人所使用的工具无损坏 更换!，员工可以在满6个月的时候向生产厂长申报，在核实无误后，将对其奖励30元！</p><p>此制度附工具维修更换申请表，如所使用的工具需要维修更换，必须填写此表格才可以给与更换和维修！</p><p>此表格可以到生产厂长处领取填写。消耗品仓库签字生效后，给与办理维修或更换。</p><p>6. 需要维修产品的维修费用 根据月度结算给与维修人员。需要更换的工具罚金归公司所有。 </p><p>工具维修更换申请表</p><p>日期：</p><p>工具名称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;更换或维修&nbsp;&nbsp;&nbsp;&nbsp;损坏部件&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;仓库签字&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员工签字&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;生产厂长签字</p>', null, '2020-11-14 18:10:25.952824', '0');

-- ----------------------------
-- Table structure for `web_modelrecord`
-- ----------------------------
DROP TABLE IF EXISTS `web_modelrecord`;
CREATE TABLE `web_modelrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_type` int(11) NOT NULL,
  `callBoss_id` int(11) DEFAULT NULL,
  `executor_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_modelrecord_callBoss_id_0c0d1fec_fk_web_callboss_id` (`callBoss_id`),
  KEY `web_modelrecord_executor_id_5d9b2c28_fk_web_executor_id` (`executor_id`),
  CONSTRAINT `web_modelrecord_callBoss_id_0c0d1fec_fk_web_callboss_id` FOREIGN KEY (`callBoss_id`) REFERENCES `web_callboss` (`id`),
  CONSTRAINT `web_modelrecord_executor_id_5d9b2c28_fk_web_executor_id` FOREIGN KEY (`executor_id`) REFERENCES `web_executor` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_modelrecord
-- ----------------------------
INSERT INTO `web_modelrecord` VALUES ('87', '1', '77', null);
INSERT INTO `web_modelrecord` VALUES ('88', '1', '78', null);
INSERT INTO `web_modelrecord` VALUES ('89', '1', '79', null);
INSERT INTO `web_modelrecord` VALUES ('90', '1', '80', null);
INSERT INTO `web_modelrecord` VALUES ('91', '1', '81', null);
INSERT INTO `web_modelrecord` VALUES ('92', '1', '82', null);
INSERT INTO `web_modelrecord` VALUES ('93', '1', '83', null);
INSERT INTO `web_modelrecord` VALUES ('94', '1', '84', null);
INSERT INTO `web_modelrecord` VALUES ('95', '1', '85', null);
INSERT INTO `web_modelrecord` VALUES ('96', '1', '86', null);
INSERT INTO `web_modelrecord` VALUES ('97', '1', '87', null);
INSERT INTO `web_modelrecord` VALUES ('98', '1', '88', null);
INSERT INTO `web_modelrecord` VALUES ('99', '1', '89', null);
INSERT INTO `web_modelrecord` VALUES ('100', '1', '90', null);
INSERT INTO `web_modelrecord` VALUES ('101', '1', '91', null);
INSERT INTO `web_modelrecord` VALUES ('102', '1', '92', null);
INSERT INTO `web_modelrecord` VALUES ('103', '1', '93', null);
INSERT INTO `web_modelrecord` VALUES ('104', '1', '94', null);
INSERT INTO `web_modelrecord` VALUES ('105', '1', '95', null);
INSERT INTO `web_modelrecord` VALUES ('106', '1', '96', null);
INSERT INTO `web_modelrecord` VALUES ('107', '1', '97', null);
INSERT INTO `web_modelrecord` VALUES ('108', '1', '98', null);
INSERT INTO `web_modelrecord` VALUES ('109', '1', '99', null);
INSERT INTO `web_modelrecord` VALUES ('110', '1', '100', null);
INSERT INTO `web_modelrecord` VALUES ('111', '1', '101', null);
INSERT INTO `web_modelrecord` VALUES ('112', '1', '102', null);
INSERT INTO `web_modelrecord` VALUES ('113', '1', '103', null);
INSERT INTO `web_modelrecord` VALUES ('114', '1', '104', null);
INSERT INTO `web_modelrecord` VALUES ('115', '1', '105', null);
INSERT INTO `web_modelrecord` VALUES ('116', '1', '106', null);
INSERT INTO `web_modelrecord` VALUES ('117', '1', '107', null);
INSERT INTO `web_modelrecord` VALUES ('118', '1', '108', null);
INSERT INTO `web_modelrecord` VALUES ('119', '1', '109', null);
INSERT INTO `web_modelrecord` VALUES ('120', '1', '110', null);
INSERT INTO `web_modelrecord` VALUES ('121', '1', '111', null);
INSERT INTO `web_modelrecord` VALUES ('122', '1', '112', null);
INSERT INTO `web_modelrecord` VALUES ('123', '1', '113', null);
INSERT INTO `web_modelrecord` VALUES ('124', '1', '114', null);
INSERT INTO `web_modelrecord` VALUES ('125', '1', '115', null);
INSERT INTO `web_modelrecord` VALUES ('126', '1', '116', null);
INSERT INTO `web_modelrecord` VALUES ('127', '1', '117', null);
INSERT INTO `web_modelrecord` VALUES ('128', '1', '118', null);
INSERT INTO `web_modelrecord` VALUES ('129', '1', '119', null);
INSERT INTO `web_modelrecord` VALUES ('130', '1', '120', null);
INSERT INTO `web_modelrecord` VALUES ('131', '1', '121', null);
INSERT INTO `web_modelrecord` VALUES ('132', '1', '122', null);
INSERT INTO `web_modelrecord` VALUES ('133', '1', '123', null);
INSERT INTO `web_modelrecord` VALUES ('134', '1', '124', null);
INSERT INTO `web_modelrecord` VALUES ('135', '1', '125', null);
INSERT INTO `web_modelrecord` VALUES ('136', '1', '126', null);
INSERT INTO `web_modelrecord` VALUES ('137', '1', '127', null);
INSERT INTO `web_modelrecord` VALUES ('138', '1', '128', null);
INSERT INTO `web_modelrecord` VALUES ('139', '1', '129', null);
INSERT INTO `web_modelrecord` VALUES ('140', '1', '130', null);
INSERT INTO `web_modelrecord` VALUES ('141', '1', '131', null);
INSERT INTO `web_modelrecord` VALUES ('142', '1', '132', null);
INSERT INTO `web_modelrecord` VALUES ('143', '1', '133', null);
INSERT INTO `web_modelrecord` VALUES ('144', '1', '134', null);
INSERT INTO `web_modelrecord` VALUES ('145', '1', '135', null);
INSERT INTO `web_modelrecord` VALUES ('146', '1', '136', null);
INSERT INTO `web_modelrecord` VALUES ('147', '1', '137', null);
INSERT INTO `web_modelrecord` VALUES ('148', '1', '138', null);
INSERT INTO `web_modelrecord` VALUES ('149', '1', '139', null);
INSERT INTO `web_modelrecord` VALUES ('150', '1', '140', null);
INSERT INTO `web_modelrecord` VALUES ('151', '1', '141', null);
INSERT INTO `web_modelrecord` VALUES ('152', '1', '142', null);
INSERT INTO `web_modelrecord` VALUES ('153', '1', '143', null);
INSERT INTO `web_modelrecord` VALUES ('154', '1', '144', null);
INSERT INTO `web_modelrecord` VALUES ('155', '1', '145', null);
INSERT INTO `web_modelrecord` VALUES ('156', '1', '146', null);
INSERT INTO `web_modelrecord` VALUES ('157', '1', '147', null);
INSERT INTO `web_modelrecord` VALUES ('158', '1', '148', null);
INSERT INTO `web_modelrecord` VALUES ('159', '1', '149', null);

-- ----------------------------
-- Table structure for `web_note`
-- ----------------------------
DROP TABLE IF EXISTS `web_note`;
CREATE TABLE `web_note` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `info_datetime` datetime NOT NULL,
  `level` int(11) NOT NULL,
  `userinfo_id` int(11) DEFAULT NULL,
  `workman_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_note_userinfo_id_490c7404_fk_web_userinfo_id` (`userinfo_id`),
  KEY `web_note_workman_id_e0780b97_fk_web_workman_id` (`workman_id`),
  CONSTRAINT `web_note_userinfo_id_490c7404_fk_web_userinfo_id` FOREIGN KEY (`userinfo_id`) REFERENCES `web_userinfo` (`id`),
  CONSTRAINT `web_note_workman_id_e0780b97_fk_web_workman_id` FOREIGN KEY (`workman_id`) REFERENCES `web_workman` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_note
-- ----------------------------
INSERT INTO `web_note` VALUES ('1', null, '22222222222222', '2020-11-15 13:47:46', '3', '2', null);

-- ----------------------------
-- Table structure for `web_notice`
-- ----------------------------
DROP TABLE IF EXISTS `web_notice`;
CREATE TABLE `web_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `info_datetime` datetime NOT NULL,
  `is_show` int(11) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `title` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_notice
-- ----------------------------
INSERT INTO `web_notice` VALUES ('41', '2020-11-11 16:23:37', '1', '20201110 即将缺货：姜网六插，松木六插，松木八插，特大号卷艾机，双膝艾灸盒，掀盖四插，颈椎双插，实木单孔，四柱，砭石双足，方形坐熏【网】，大号督脉灸【插】，单插，单柱，切艾器，松木平板，松木圆点，松木大方块，姜网六柱，松木八柱', '每天生产缺货详单，具体内容双击查看。');
INSERT INTO `web_notice` VALUES ('42', '2020-11-14 02:10:31', '1', '生产宗旨：安全生产 节能降耗 提高效率', '生产宗旨：安全生产 节能降耗 提高效率');

-- ----------------------------
-- Table structure for `web_plantoprocess`
-- ----------------------------
DROP TABLE IF EXISTS `web_plantoprocess`;
CREATE TABLE `web_plantoprocess` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total` int(11) NOT NULL,
  `planKey_id` int(11) DEFAULT NULL,
  `processKey_id` int(11) DEFAULT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_plantoprocess_planKey_id_9cbf08a4_fk_web_production_plan_id` (`planKey_id`),
  KEY `web_plantoprocess_processKey_id_b2076973_fk_web_process_name_id` (`processKey_id`),
  CONSTRAINT `web_plantoprocess_planKey_id_9cbf08a4_fk_web_production_plan_id` FOREIGN KEY (`planKey_id`) REFERENCES `web_production_plan` (`id`),
  CONSTRAINT `web_plantoprocess_processKey_id_b2076973_fk_web_process_name_id` FOREIGN KEY (`processKey_id`) REFERENCES `web_process_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_plantoprocess
-- ----------------------------
INSERT INTO `web_plantoprocess` VALUES ('17', '700', '46', '739', '1');
INSERT INTO `web_plantoprocess` VALUES ('18', '800', '46', '740', '1');

-- ----------------------------
-- Table structure for `web_plan_module`
-- ----------------------------
DROP TABLE IF EXISTS `web_plan_module`;
CREATE TABLE `web_plan_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) DEFAULT NULL,
  `plan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_plan_module_module_id_77182d5b_fk_web_process_module_id` (`module_id`),
  KEY `web_plan_module_plan_id_99a0996d_fk_web_production_plan_id` (`plan_id`),
  CONSTRAINT `web_plan_module_module_id_77182d5b_fk_web_process_module_id` FOREIGN KEY (`module_id`) REFERENCES `web_process_module` (`id`),
  CONSTRAINT `web_plan_module_plan_id_99a0996d_fk_web_production_plan_id` FOREIGN KEY (`plan_id`) REFERENCES `web_production_plan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_plan_module
-- ----------------------------
INSERT INTO `web_plan_module` VALUES ('73', '23', '46');

-- ----------------------------
-- Table structure for `web_process_img`
-- ----------------------------
DROP TABLE IF EXISTS `web_process_img`;
CREATE TABLE `web_process_img` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(250) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `p_name_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_process_img_p_name_id_dd11760f_fk_web_process_name_id` (`p_name_id`),
  CONSTRAINT `web_process_img_p_name_id_dd11760f_fk_web_process_name_id` FOREIGN KEY (`p_name_id`) REFERENCES `web_process_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_process_img
-- ----------------------------
INSERT INTO `web_process_img` VALUES ('43', '/static/uploads/2020/11/11/192224824.png', '啊啊啊', '199');

-- ----------------------------
-- Table structure for `web_process_module`
-- ----------------------------
DROP TABLE IF EXISTS `web_process_module`;
CREATE TABLE `web_process_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `update_date` datetime NOT NULL,
  `content` longtext,
  `module_state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_process_module
-- ----------------------------
INSERT INTO `web_process_module` VALUES ('16', '松木平底六插艾灸盒', '2020-08-12 11:52:19', '', '1');
INSERT INTO `web_process_module` VALUES ('17', '松木平底六柱艾灸盒', '2020-08-12 11:52:26', '', '1');
INSERT INTO `web_process_module` VALUES ('18', '松木加高弧度六插艾灸盒', '2020-08-12 11:52:32', '', '1');
INSERT INTO `web_process_module` VALUES ('19', '松木加高弧度六柱艾灸盒', '2020-11-11 16:08:33', null, '1');
INSERT INTO `web_process_module` VALUES ('20', '松木加高弧度六插【姜网款】', '2020-11-11 16:10:31', null, '1');
INSERT INTO `web_process_module` VALUES ('21', '松木加高弧度六柱【姜网款】', '2020-11-11 16:10:54', null, '1');
INSERT INTO `web_process_module` VALUES ('22', '松木翻盖六插艾灸盒', '2020-11-11 16:11:25', null, '1');
INSERT INTO `web_process_module` VALUES ('23', '零工计算', '2020-11-15 00:03:06', '2020.11.15', '1');

-- ----------------------------
-- Table structure for `web_process_name`
-- ----------------------------
DROP TABLE IF EXISTS `web_process_name`;
CREATE TABLE `web_process_name` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `content` longtext,
  `update_date` datetime NOT NULL,
  `money` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=741 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_process_name
-- ----------------------------
INSERT INTO `web_process_name` VALUES ('54', '1', '001#02单叉补钉眼', '备注信息', '2020-11-11 16:03:01', '0.11');
INSERT INTO `web_process_name` VALUES ('55', '2', '002#04单叉单柱打铁皮', '', '2020-11-11 16:03:01', '0.25');
INSERT INTO `web_process_name` VALUES ('56', '3', '002#12单叉单柱覆膜包装', '', '2020-11-11 16:03:01', '0.07');
INSERT INTO `web_process_name` VALUES ('57', '4', '002#03单叉单柱盖面加斜', '', '2020-11-11 16:03:01', '0.02');
INSERT INTO `web_process_name` VALUES ('58', '5', '002#06单叉单柱合底网', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('59', '6', '002#05单叉单柱合盒子', '', '2020-11-11 16:03:01', '0.35');
INSERT INTO `web_process_name` VALUES ('60', '7', '002#02单叉单柱开槽（手工）', '', '2020-11-11 16:03:01', '0.15');
INSERT INTO `web_process_name` VALUES ('61', '8', '002#08单叉单柱气动打磨', '', '2020-11-11 16:03:01', '0.25');
INSERT INTO `web_process_name` VALUES ('62', '9', '002#07单叉单柱砂光', '', '2020-11-11 16:03:01', '0.25');
INSERT INTO `web_process_name` VALUES ('63', '10', '002#10单叉单柱上配件', '', '2020-11-11 16:03:01', '0.25');
INSERT INTO `web_process_name` VALUES ('64', '11', '002#09单叉单柱烫印', '', '2020-11-11 16:03:01', '0.02');
INSERT INTO `web_process_name` VALUES ('65', '12', '002#01单叉单柱下木料（手工）', '', '2020-11-11 16:03:01', '0.05');
INSERT INTO `web_process_name` VALUES ('66', '13', '002#11单叉单柱钻孔', '', '2020-11-11 16:03:01', '0.05');
INSERT INTO `web_process_name` VALUES ('67', '14', '001#01单叉下铁料', '', '2020-11-11 16:03:01', '0.15');
INSERT INTO `web_process_name` VALUES ('68', '15', '002#15单柱补钉眼', '', '2020-11-11 16:03:01', '0.08');
INSERT INTO `web_process_name` VALUES ('69', '16', '002#16单柱下粗网', '', '2020-11-11 16:03:01', '0.05');
INSERT INTO `web_process_name` VALUES ('70', '17', '002#13单柱下铁料', '', '2020-11-11 16:03:01', '0.15');
INSERT INTO `web_process_name` VALUES ('71', '18', '002#14单柱扎柱子', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('72', '19', '003#11单孔补钉眼', '', '2020-11-11 16:03:01', '0.08');
INSERT INTO `web_process_name` VALUES ('73', '20', '003#04单孔打铁皮', '', '2020-11-11 16:03:01', '0.27');
INSERT INTO `web_process_name` VALUES ('74', '21', '003#15单孔覆膜', '', '2020-11-11 16:03:01', '0.07');
INSERT INTO `web_process_name` VALUES ('75', '22', '003#12单孔盖面打磨', '', '2020-11-11 16:03:01', '0.12');
INSERT INTO `web_process_name` VALUES ('76', '23', '003#05单孔盖面铣边', '', '2020-11-11 16:03:01', '0.05');
INSERT INTO `web_process_name` VALUES ('77', '24', '003#06单孔合底网', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('78', '25', '003#07单孔合盒子', '', '2020-11-11 16:03:01', '0.35');
INSERT INTO `web_process_name` VALUES ('79', '26', '003#09单孔气动打磨', '', '2020-11-11 16:03:01', '0.25');
INSERT INTO `web_process_name` VALUES ('80', '27', '003#08单孔机器砂光', '', '2020-11-11 16:03:01', '0.25');
INSERT INTO `web_process_name` VALUES ('81', '28', '003#13单孔上磁铁', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('82', '29', '003#14单孔上配件', '', '2020-11-11 16:03:01', '0.30');
INSERT INTO `web_process_name` VALUES ('83', '30', '003#10单孔烫印', '', '2020-11-11 16:03:01', '0.02');
INSERT INTO `web_process_name` VALUES ('84', '31', '003#01单孔下木料', '', '2020-11-11 16:03:01', '0.05');
INSERT INTO `web_process_name` VALUES ('85', '32', '003#02单孔下铁料', '', '2020-11-11 16:03:01', '0.20');
INSERT INTO `web_process_name` VALUES ('86', '33', '003#03单孔钻孔', '', '2020-11-11 16:03:01', '0.08');
INSERT INTO `web_process_name` VALUES ('87', '34', '004#09双叉补钉眼', '', '2020-11-11 16:03:01', '0.11');
INSERT INTO `web_process_name` VALUES ('88', '35', '004#04双叉双柱打铁皮', '', '2020-11-11 16:03:01', '0.27');
INSERT INTO `web_process_name` VALUES ('89', '36', '004#14双叉双柱覆膜包装', '', '2020-11-11 16:03:01', '0.07');
INSERT INTO `web_process_name` VALUES ('90', '37', '004#08双叉双柱盖面加斜', '', '2020-11-11 16:03:01', '0.02');
INSERT INTO `web_process_name` VALUES ('91', '38', '004#07双叉双柱合底网', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('92', '39', '004#06双叉双柱合盒子', '', '2020-11-11 16:03:01', '0.40');
INSERT INTO `web_process_name` VALUES ('93', '40', '004#03双叉双柱开槽扣头（手工）', '', '2020-11-11 16:03:01', '0.20');
INSERT INTO `web_process_name` VALUES ('94', '41', '004#11双叉双柱气动打磨', '', '2020-11-11 16:03:01', '0.30');
INSERT INTO `web_process_name` VALUES ('95', '42', '004#10双叉双柱砂光', '', '2020-11-11 16:03:01', '0.30');
INSERT INTO `web_process_name` VALUES ('96', '43', '004#13双叉双柱上配件', '', '2020-11-11 16:03:01', '0.26');
INSERT INTO `web_process_name` VALUES ('97', '44', '004#12双叉双柱烫印', '', '2020-11-11 16:03:01', '0.02');
INSERT INTO `web_process_name` VALUES ('98', '45', '004#01双叉双柱下木料（手工）', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('99', '46', '004#05双叉双柱钻孔', '', '2020-11-11 16:03:01', '0.05');
INSERT INTO `web_process_name` VALUES ('100', '47', '004#02a双叉下铁料', '', '2020-11-11 16:03:01', '0.20');
INSERT INTO `web_process_name` VALUES ('101', '48', '004#09b双柱补钉眼', '', '2020-11-11 16:03:01', '0.08');
INSERT INTO `web_process_name` VALUES ('102', '49', '004#02b双柱下铁料', '', '2020-11-11 16:03:01', '0.25');
INSERT INTO `web_process_name` VALUES ('103', '50', '004#15b双柱扎柱子', '', '2020-11-11 16:03:01', '0.20');
INSERT INTO `web_process_name` VALUES ('104', '51', '005@09双孔补钉眼', '', '2020-11-11 16:03:01', '0.08');
INSERT INTO `web_process_name` VALUES ('105', '52', '005@04双孔打铁皮', '', '2020-11-11 16:03:01', '0.28');
INSERT INTO `web_process_name` VALUES ('106', '53', '005@15双孔覆膜包装', '', '2020-11-11 16:03:01', '0.07');
INSERT INTO `web_process_name` VALUES ('107', '54', '005@12双孔盖面打磨', '', '2020-11-11 16:03:01', '0.15');
INSERT INTO `web_process_name` VALUES ('108', '55', '005@06双孔盖面铣边', '', '2020-11-11 16:03:01', '0.06');
INSERT INTO `web_process_name` VALUES ('109', '56', '005@08双孔合底网', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('110', '57', '005@07双孔合盒子', '', '2020-11-11 16:03:01', '0.40');
INSERT INTO `web_process_name` VALUES ('111', '58', '005@11双孔气动打磨', '', '2020-11-11 16:03:01', '0.25');
INSERT INTO `web_process_name` VALUES ('112', '59', '005@10双孔机械砂光', '', '2020-11-11 16:03:01', '0.26');
INSERT INTO `web_process_name` VALUES ('113', '60', '005@13双孔上磁铁', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('114', '61', '005@14双孔上配件', '', '2020-11-11 16:03:01', '0.34');
INSERT INTO `web_process_name` VALUES ('115', '62', '005@03双孔烫印', '', '2020-11-11 16:03:01', '0.04');
INSERT INTO `web_process_name` VALUES ('116', '63', '005@01双孔下木料', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('117', '64', '005@02双孔下铁料', '', '2020-11-11 16:03:01', '0.20');
INSERT INTO `web_process_name` VALUES ('118', '65', '005@05双孔钻孔', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('119', '66', '006#08a三叉补钉眼', '', '2020-11-11 16:03:01', '0.11');
INSERT INTO `web_process_name` VALUES ('120', '67', '006#09a三叉打叉钉', '', '2020-11-11 16:03:01', '0.08');
INSERT INTO `web_process_name` VALUES ('121', '68', '006#14三叉三柱安装配件', '', '2020-11-11 16:03:01', '0.32');
INSERT INTO `web_process_name` VALUES ('122', '69', '006#04三叉三柱打铁皮', '', '2020-11-11 16:03:01', '0.29');
INSERT INTO `web_process_name` VALUES ('123', '70', '006#15三叉三柱覆膜', '', '2020-11-11 16:03:01', '0.07');
INSERT INTO `web_process_name` VALUES ('124', '71', '006#05三叉三柱盖面加斜', '', '2020-11-11 16:03:01', '0.02');
INSERT INTO `web_process_name` VALUES ('125', '72', '006#07三叉三柱合底网', '', '2020-11-11 16:03:01', '0.10');
INSERT INTO `web_process_name` VALUES ('126', '73', '006#06三叉三柱合盒子', '', '2020-11-11 16:03:01', '0.40');
INSERT INTO `web_process_name` VALUES ('127', '74', '006#02三叉三柱开槽扣头（手工）', '', '2020-11-11 16:03:01', '0.22');
INSERT INTO `web_process_name` VALUES ('128', '75', '006#12三叉三柱气动打磨', '', '2020-11-11 16:03:01', '0.35');
INSERT INTO `web_process_name` VALUES ('129', '76', '006#11三叉三柱机器砂光', '', '2020-11-11 16:03:01', '0.32');
INSERT INTO `web_process_name` VALUES ('130', '77', '006#13三叉三柱烫印', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('131', '78', '006#01三叉三柱木料下料（手工）', '', '2020-11-11 16:03:02', '0.12');
INSERT INTO `web_process_name` VALUES ('132', '79', '006#10三叉三柱钻孔', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('133', '80', '006#03a三叉下铁料', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('134', '81', '006#08b三柱补钉眼', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('135', '82', '006#03b三柱下铁料', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('136', '83', '006#09b三柱扎柱子', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('137', '84', '007#14三孔安装配件', '', '2020-11-11 16:03:02', '0.37');
INSERT INTO `web_process_name` VALUES ('138', '85', '007#13三孔补钉眼', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('139', '86', '007#05三孔打铁皮', '', '2020-11-11 16:03:02', '0.28');
INSERT INTO `web_process_name` VALUES ('140', '87', '007#15三孔覆膜', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('141', '88', '007#04三孔盖面打磨', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('142', '89', '007#03三孔盖面铣边', '', '2020-11-11 16:03:02', '0.06');
INSERT INTO `web_process_name` VALUES ('143', '90', '007#07三孔合底网', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('144', '91', '007#06三孔合盒子', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('145', '92', '007#09三孔气动打磨', '', '2020-11-11 16:03:02', '0.27');
INSERT INTO `web_process_name` VALUES ('146', '93', '007#08三孔机器砂光', '', '2020-11-11 16:03:02', '0.27');
INSERT INTO `web_process_name` VALUES ('147', '94', '007#11三孔打小孔上磁铁', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('148', '95', '007#10三孔烫印', '', '2020-11-11 16:03:02', '0.04');
INSERT INTO `web_process_name` VALUES ('149', '96', '007#01三孔下木料', '', '2020-11-11 16:03:02', '0.12');
INSERT INTO `web_process_name` VALUES ('150', '97', '007#02三孔下铁料', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('151', '98', '007#12三孔钻通风孔', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('152', '99', '008#10a四叉补钉眼', '', '2020-11-11 16:03:02', '0.11');
INSERT INTO `web_process_name` VALUES ('153', '100', '008#11a四叉打叉钉', '', '2020-11-11 16:03:02', '0.09');
INSERT INTO `web_process_name` VALUES ('154', '101', '008#06四叉四柱打铁皮', '', '2020-11-11 16:03:02', '0.31');
INSERT INTO `web_process_name` VALUES ('155', '102', '008#16四叉四柱覆膜', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('156', '103', '008#04四叉四柱盖面加斜', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('157', '104', '008#08四叉四柱合底网', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('158', '105', '008#09四叉四柱合盒子', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('159', '106', '008#02四叉四柱开槽（手工）', '', '2020-11-11 16:03:02', '0.18');
INSERT INTO `web_process_name` VALUES ('160', '107', '008#14四叉四柱气动打磨', '', '2020-11-11 16:03:02', '0.37');
INSERT INTO `web_process_name` VALUES ('161', '108', '008#13四叉四柱机器砂光', '', '2020-11-11 16:03:02', '0.34');
INSERT INTO `web_process_name` VALUES ('162', '109', '008#15四叉四柱上配件', '', '2020-11-11 16:03:02', '0.27');
INSERT INTO `web_process_name` VALUES ('163', '110', '008#05四叉四柱烫印', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('164', '111', '008#01四叉四柱下木料（手工）', '', '2020-11-11 16:03:02', '0.13');
INSERT INTO `web_process_name` VALUES ('165', '112', '008#07四叉四柱钻通风孔', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('166', '113', '008#12四叉四柱钻手柄眼', '', '2020-11-11 16:03:02', '0.03');
INSERT INTO `web_process_name` VALUES ('167', '114', '008#03a四叉下铁料', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('168', '115', '008#10b四柱补钉眼', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('169', '116', '008#03b四柱下铁料', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('170', '117', '008#11b四柱扎柱子', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('171', '118', '009@14四孔安装配件', '', '2020-11-11 16:03:02', '0.36');
INSERT INTO `web_process_name` VALUES ('172', '119', '009@08四孔补钉眼', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('173', '120', '009@04四孔打铁皮', '', '2020-11-11 16:03:02', '0.28');
INSERT INTO `web_process_name` VALUES ('174', '121', '009@15四孔覆膜', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('175', '122', '009@12四孔盖面打磨', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('176', '123', '009@09四孔盖面铣边', '', '2020-11-11 16:03:02', '0.06');
INSERT INTO `web_process_name` VALUES ('177', '124', '009@07四孔合底网', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('178', '125', '009@06四孔合盒子', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('179', '126', '009@11四孔气动打磨', '', '2020-11-11 16:03:02', '0.28');
INSERT INTO `web_process_name` VALUES ('180', '127', '009@10四孔砂光', '', '2020-11-11 16:03:02', '0.28');
INSERT INTO `web_process_name` VALUES ('181', '128', '009@13四孔上磁铁', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('182', '129', '009@03四孔烫印', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('183', '130', '009@01四孔下木料', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('184', '131', '009@02四孔下铁料', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('185', '132', '009@05四孔钻孔', '', '2020-11-11 16:03:02', '0.18');
INSERT INTO `web_process_name` VALUES ('186', '133', '028@05小号卷艾器清木丝', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('187', '134', '010#12a六叉补钉眼', '', '2020-11-11 16:03:02', '0.11');
INSERT INTO `web_process_name` VALUES ('188', '135', '010#10a六叉打叉钉', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('189', '136', '010#04六叉六柱打铁皮', '', '2020-11-11 16:03:02', '0.32');
INSERT INTO `web_process_name` VALUES ('190', '137', '010#06六叉六柱覆膜包装', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('191', '138', '010#09六叉六柱盖面加斜', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('192', '139', '010#08六叉六柱合底网', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('193', '140', '010#07六叉六柱合盒子', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('194', '141', '010#02六叉六柱开槽（手工）', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('195', '142', '010#15六叉六柱气动打磨', '', '2020-11-11 16:03:02', '0.39');
INSERT INTO `web_process_name` VALUES ('196', '143', '010#14六叉六柱砂光', '', '2020-11-11 16:03:02', '0.36');
INSERT INTO `web_process_name` VALUES ('197', '144', '010#16六叉六柱上配件', '', '2020-11-11 16:03:02', '0.32');
INSERT INTO `web_process_name` VALUES ('198', '145', '010#03六叉六柱烫印', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('199', '146', '010#01六叉六柱下木料（手工）', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('200', '147', '010#05六叉六柱钻通风孔', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('201', '148', '010#13六叉六柱钻手柄眼', '', '2020-11-11 16:03:02', '0.03');
INSERT INTO `web_process_name` VALUES ('202', '149', '010#11a六叉下铁料', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('203', '150', '010#12b六柱补钉眼', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('204', '151', '010#11b六柱下铁料', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('205', '152', '010#10b六柱扎柱子', '', '2020-11-11 16:03:02', '0.50');
INSERT INTO `web_process_name` VALUES ('206', '153', '011六孔安装配件', '', '2020-11-11 16:03:02', '0.38');
INSERT INTO `web_process_name` VALUES ('207', '154', '011六孔补钉眼', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('208', '155', '011六孔打铁皮', '', '2020-11-11 16:03:02', '0.28');
INSERT INTO `web_process_name` VALUES ('209', '156', '011六孔覆膜', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('210', '157', '011六孔盖面钉横棍', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('211', '158', '011六孔盖面铣边', '', '2020-11-11 16:03:02', '0.06');
INSERT INTO `web_process_name` VALUES ('212', '159', '011六孔合底网', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('213', '160', '011六孔合盒子', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('214', '161', '011六孔机器打磨', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('215', '162', '011六孔气动打磨', '', '2020-11-11 16:03:02', '0.28');
INSERT INTO `web_process_name` VALUES ('216', '163', '011六孔上磁铁', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('217', '164', '011六孔手工盖面打磨', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('218', '165', '011六孔烫印', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('219', '166', '011六孔下料', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('220', '167', '011六孔下铁料', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('221', '168', '011六孔钻孔', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('222', '169', '012#15八叉八柱安装配件', '', '2020-11-11 16:03:02', '0.32');
INSERT INTO `web_process_name` VALUES ('223', '170', '012#05八叉八柱打铁皮', '', '2020-11-11 16:03:02', '0.32');
INSERT INTO `web_process_name` VALUES ('224', '171', '012#16八叉八柱覆膜包装', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('225', '172', '012#04八叉八柱盖面加斜', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('226', '173', '012#07八叉八柱合底网', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('227', '174', '012#06八叉八柱合盒子', '', '2020-11-11 16:03:02', '0.45');
INSERT INTO `web_process_name` VALUES ('228', '175', '012#02八叉八柱开槽（手工）', '', '2020-11-11 16:03:02', '0.22');
INSERT INTO `web_process_name` VALUES ('229', '176', '012#14八叉八柱气动打磨', '', '2020-11-11 16:03:02', '0.45');
INSERT INTO `web_process_name` VALUES ('230', '177', '012#13八叉八柱机器砂光', '', '2020-11-11 16:03:02', '0.38');
INSERT INTO `web_process_name` VALUES ('231', '178', '012#03八叉八柱烫印', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('232', '179', '012#01八叉八柱下木料（手工）', '', '2020-11-11 16:03:02', '0.18');
INSERT INTO `web_process_name` VALUES ('233', '180', '012#08八叉八柱钻通风孔', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('234', '181', '012#09八叉八柱钻手柄眼', '', '2020-11-11 16:03:02', '0.03');
INSERT INTO `web_process_name` VALUES ('235', '182', '012#12a八叉补钉眼', '', '2020-11-11 16:03:02', '0.11');
INSERT INTO `web_process_name` VALUES ('236', '183', '012#10a八叉打叉钉', '', '2020-11-11 16:03:02', '0.11');
INSERT INTO `web_process_name` VALUES ('237', '184', '012#11a八叉下铁料', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('238', '185', '012#12b八柱补钉眼', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('239', '186', '012#11b八柱下铁料', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('240', '187', '012#10b八柱扎柱子', '', '2020-11-11 16:03:02', '0.60');
INSERT INTO `web_process_name` VALUES ('241', '188', '013#12a十二叉补钉眼', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('242', '189', '013#15十二叉十二柱安装配件', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('243', '190', '013#03十二叉十二柱打铁皮', '', '2020-11-11 16:03:02', '0.32');
INSERT INTO `web_process_name` VALUES ('244', '191', '013#16十二叉十二柱覆膜包装', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('245', '192', '013#07十二叉十二柱盖面固定', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('246', '193', '013#06十二叉十二柱盖面加斜', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('247', '194', '013#14十二叉十二柱和盒子', '', '2020-11-11 16:03:02', '0.55');
INSERT INTO `web_process_name` VALUES ('248', '195', '013#02十二叉十二柱开槽（手工）', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('249', '196', '013#09十二叉十二柱气动打磨', '', '2020-11-11 16:03:02', '0.35');
INSERT INTO `web_process_name` VALUES ('250', '197', '013#08十二叉十二柱机器砂光', '', '2020-11-11 16:03:02', '0.45');
INSERT INTO `web_process_name` VALUES ('251', '198', '013#05十二叉十二柱烫印', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('252', '199', '013#01十二叉十二柱下木料（手工）', '', '2020-11-11 16:03:02', '0.18');
INSERT INTO `web_process_name` VALUES ('253', '200', '013#10十二叉十二柱钻通风孔', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('254', '201', '013#11十二叉十二柱钻手柄眼', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('255', '202', '013#04a十二叉下铁料', '', '2020-11-11 16:03:02', '0.22');
INSERT INTO `web_process_name` VALUES ('256', '203', '013#12b十二柱补钉眼', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('257', '204', '013#04b十二柱下铁料', '', '2020-11-11 16:03:02', '0.27');
INSERT INTO `web_process_name` VALUES ('258', '205', '013#13b十二柱扎柱子', '', '2020-11-11 16:03:02', '0.80');
INSERT INTO `web_process_name` VALUES ('259', '206', '014艾灸凳盒子打铁皮', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('260', '207', '014艾灸凳盒子覆膜', '', '2020-11-11 16:03:02', '0.08');
INSERT INTO `web_process_name` VALUES ('261', '208', '014艾灸凳盒子合盒子', '', '2020-11-11 16:03:02', '0.50');
INSERT INTO `web_process_name` VALUES ('262', '209', '014艾灸凳盒子开槽', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('263', '210', '014艾灸凳盒子开两侧槽', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('264', '211', '014艾灸凳盒子气动打磨', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('265', '212', '014艾灸凳盒子砂光', '', '2020-11-11 16:03:02', '0.35');
INSERT INTO `web_process_name` VALUES ('266', '213', '014艾灸凳盒子上配件', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('267', '214', '014艾灸凳盒子下料', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('268', '215', '014艾灸凳盒子下铁料', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('269', '216', '014艾灸凳盒子扎柱子', '', '2020-11-11 16:03:02', '0.70');
INSERT INTO `web_process_name` VALUES ('270', '217', '014艾灸凳盒子钻孔', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('271', '218', '014艾灸凳盒子钻手柄孔', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('272', '219', '014艾灸凳盒子做网', '', '2020-11-11 16:03:02', '0.80');
INSERT INTO `web_process_name` VALUES ('273', '220', '014灸凳盒子补钉眼', '', '2020-11-11 16:03:02', '0.27');
INSERT INTO `web_process_name` VALUES ('274', '221', '015艾灸櫈板面末边', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('275', '222', '015艾灸櫈打铁皮', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('276', '223', '015艾灸櫈横撑开槽', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('277', '224', '015艾灸櫈检验包装', '', '2020-11-11 16:03:02', '0.55');
INSERT INTO `web_process_name` VALUES ('278', '225', '015艾灸櫈面板下料', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('279', '226', '015艾灸櫈排钻钻孔', '', '2020-11-11 16:03:02', '0.50');
INSERT INTO `web_process_name` VALUES ('280', '227', '015艾灸櫈气动打磨', '', '2020-11-11 16:03:02', '1.00');
INSERT INTO `web_process_name` VALUES ('281', '228', '015艾灸櫈砂光圆头模棱', '', '2020-11-11 16:03:02', '2.00');
INSERT INTO `web_process_name` VALUES ('282', '229', '015艾灸櫈烫印', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('283', '230', '015艾灸櫈下铁皮', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('284', '231', '015艾灸櫈主体末边', '', '2020-11-11 16:03:02', '1.30');
INSERT INTO `web_process_name` VALUES ('285', '232', '015艾灸櫈主体下料', '', '2020-11-11 16:03:02', '2.00');
INSERT INTO `web_process_name` VALUES ('286', '233', '015艾灸櫈主体钻孔', '', '2020-11-11 16:03:02', '2.00');
INSERT INTO `web_process_name` VALUES ('287', '234', '015艾灸櫈组装', '', '2020-11-11 16:03:02', '2.00');
INSERT INTO `web_process_name` VALUES ('288', '235', '015艾灸櫈镂铣圆头', '', '2020-11-11 16:03:02', '0.50');
INSERT INTO `web_process_name` VALUES ('289', '236', '016坐灸盒补钉眼', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('290', '237', '016坐灸盒打叉钉', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('291', '238', '016坐灸盒打铁皮', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('292', '239', '016坐灸盒钉横棍铁皮', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('293', '240', '016坐灸盒覆膜', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('294', '241', '016坐灸盒和盒子', '', '2020-11-11 16:03:02', '0.48');
INSERT INTO `web_process_name` VALUES ('295', '242', '016坐灸盒开槽', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('296', '243', '016坐灸盒排钻钻孔', '', '2020-11-11 16:03:02', '0.50');
INSERT INTO `web_process_name` VALUES ('297', '244', '016坐灸盒气动打磨', '', '2020-11-11 16:03:02', '0.35');
INSERT INTO `web_process_name` VALUES ('298', '245', '016坐灸盒砂光', '', '2020-11-11 16:03:02', '0.47');
INSERT INTO `web_process_name` VALUES ('299', '246', '016坐灸盒上角撑', '', '2020-11-11 16:03:02', '0.18');
INSERT INTO `web_process_name` VALUES ('300', '247', '016坐灸盒上配件', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('301', '248', '016坐灸盒上条子', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('302', '249', '016坐灸盒烫印', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('303', '250', '016坐灸盒下料', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('304', '251', '016坐灸盒下铁皮', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('305', '252', '016坐灸盒压铁皮条子', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('306', '253', '016坐灸盒找补返修', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('307', '254', '016坐灸盒钻孔', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('308', '255', '016坐灸盒做网', '', '2020-11-11 16:03:02', '0.80');
INSERT INTO `web_process_name` VALUES ('309', '256', '017足熏板打铁皮', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('310', '257', '017足熏板雕刻面板', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('311', '258', '017足熏板钉横棍铁皮', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('312', '259', '017足熏板覆膜', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('313', '260', '017足熏板盖面找补', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('314', '261', '017足熏板排钻钻孔', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('315', '262', '017足熏板砂光', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('316', '263', '017足熏板上条子', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('317', '264', '017足熏板手工打磨', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('318', '265', '017足熏板下料', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('319', '266', '017足熏板下铁皮', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('320', '267', '017足熏板压铁皮条子', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('321', '268', '018#09翻盖4叉补钉眼', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('322', '269', '018#08翻盖4叉打叉钉', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('323', '270', '018#03翻盖4叉打铁皮', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('324', '271', '018#07翻盖4叉钉网', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('325', '272', '018#17翻盖4叉覆膜包装', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('326', '273', '018#05翻盖4叉合底网', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('327', '274', '018#04翻盖4叉合盒子', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('328', '275', '018#10翻盖4叉开盖面', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('329', '276', '018#13翻盖4叉气动打磨', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('330', '277', '018#12翻盖4叉机械砂光', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('331', '278', '018#14翻盖4叉上拉扣', '', '2020-11-11 16:03:02', '0.14');
INSERT INTO `web_process_name` VALUES ('332', '279', '018#15翻盖4叉上配件', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('333', '280', '018#16翻盖4叉上折页', '', '2020-11-11 16:03:02', '0.14');
INSERT INTO `web_process_name` VALUES ('334', '281', '018#06翻盖4叉烫印', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('335', '282', '018#01翻盖4叉下木料', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('336', '283', '018#02翻盖4叉下铁皮', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('337', '284', '018#11翻盖4叉钻通风孔', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('338', '285', '019#11翻盖六叉补钉眼', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('339', '286', '019#10翻盖六叉打叉钉', '', '2020-11-11 16:03:02', '0.12');
INSERT INTO `web_process_name` VALUES ('340', '287', '019#03翻盖六叉打铁皮', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('341', '288', '019#09翻盖六叉钉网', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('342', '289', '019#18翻盖六叉覆膜包装', '', '2020-11-11 16:03:02', '0.07');
INSERT INTO `web_process_name` VALUES ('343', '290', '019#07翻盖六叉合底网', '', '2020-11-11 16:03:02', '0.10');
INSERT INTO `web_process_name` VALUES ('344', '291', '019#06翻盖六叉合盒子', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('345', '292', '019#08翻盖六叉开槽(手动）', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('346', '293', '019#14翻盖六叉锯开盖面', '', '2020-11-11 16:03:02', '0.05');
INSERT INTO `web_process_name` VALUES ('347', '294', '019#13翻盖六叉气动打磨', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('348', '295', '019#12翻盖六叉机械砂光', '', '2020-11-11 16:03:02', '0.40');
INSERT INTO `web_process_name` VALUES ('349', '296', '019#15翻盖六叉上拉扣', '', '2020-11-11 16:03:02', '0.14');
INSERT INTO `web_process_name` VALUES ('350', '297', '019#17翻盖六叉上配件', '', '2020-11-11 16:03:02', '0.30');
INSERT INTO `web_process_name` VALUES ('351', '298', '019#16翻盖六叉上折页', '', '2020-11-11 16:03:02', '0.14');
INSERT INTO `web_process_name` VALUES ('352', '299', '019#04翻盖六叉烫印', '', '2020-11-11 16:03:02', '0.02');
INSERT INTO `web_process_name` VALUES ('353', '300', '019#01翻盖六叉下木料', '', '2020-11-11 16:03:02', '0.18');
INSERT INTO `web_process_name` VALUES ('354', '301', '019#02翻盖六叉下铁皮', '', '2020-11-11 16:03:02', '0.25');
INSERT INTO `web_process_name` VALUES ('355', '302', '019#05翻盖六叉钻通风孔', '', '2020-11-11 16:03:02', '0.15');
INSERT INTO `web_process_name` VALUES ('356', '303', '020艾灸床打磨', '', '2020-11-11 16:03:02', '1.00');
INSERT INTO `web_process_name` VALUES ('357', '304', '020艾灸床覆膜', '', '2020-11-11 16:03:02', '0.24');
INSERT INTO `web_process_name` VALUES ('358', '305', '020艾灸床末边', '', '2020-11-11 16:03:02', '2.00');
INSERT INTO `web_process_name` VALUES ('359', '306', '020艾灸床砂光', '', '2020-11-11 16:03:02', '1.00');
INSERT INTO `web_process_name` VALUES ('360', '307', '020艾灸床上滑道', '', '2020-11-11 16:03:02', '1.00');
INSERT INTO `web_process_name` VALUES ('361', '308', '020艾灸床上螺丝', '', '2020-11-11 16:03:02', '1.00');
INSERT INTO `web_process_name` VALUES ('362', '309', '020艾灸床贴标', '', '2020-11-11 16:03:02', '0.20');
INSERT INTO `web_process_name` VALUES ('363', '310', '020艾灸床下料', '', '2020-11-11 16:03:02', '5.00');
INSERT INTO `web_process_name` VALUES ('364', '311', '020艾灸床钻孔', '', '2020-11-11 16:03:03', '2.00');
INSERT INTO `web_process_name` VALUES ('365', '312', '021艾灸床盒子补钉眼', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('366', '313', '021艾灸床盒子打铁皮', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('367', '314', '021艾灸床盒子覆膜', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('368', '315', '021艾灸床盒子和盒子', '', '2020-11-11 16:03:03', '1.90');
INSERT INTO `web_process_name` VALUES ('369', '316', '021艾灸床盒子激光雕刻', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('370', '317', '021艾灸床盒子开榫', '', '2020-11-11 16:03:03', '1.00');
INSERT INTO `web_process_name` VALUES ('371', '318', '021艾灸床盒子气动打磨', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('372', '319', '021艾灸床盒子砂光', '', '2020-11-11 16:03:03', '1.00');
INSERT INTO `web_process_name` VALUES ('373', '320', '021艾灸床盒子上配件', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('374', '321', '021艾灸床盒子上蜗牛螺丝', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('375', '322', '021艾灸床盒子下料', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('376', '323', '021艾灸床盒子下铁皮', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('377', '324', '021艾灸床盒子压条子网', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('378', '325', '021艾灸床盒子装袋上丝棍', '', '2020-11-11 16:03:03', '0.25');
INSERT INTO `web_process_name` VALUES ('379', '326', '021艾灸床盒子钻孔', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('380', '327', '022艾灸枕补槽', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('381', '328', '022艾灸枕补钉眼', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('382', '329', '022艾灸枕打叉钉', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('383', '330', '022艾灸枕打铁皮', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('384', '331', '022艾灸枕覆膜', '', '2020-11-11 16:03:03', '0.07');
INSERT INTO `web_process_name` VALUES ('385', '332', '022艾灸枕盖面打磨', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('386', '333', '022艾灸枕和盒子', '', '2020-11-11 16:03:03', '2.80');
INSERT INTO `web_process_name` VALUES ('387', '334', '022艾灸枕开槽', '', '2020-11-11 16:03:03', '0.70');
INSERT INTO `web_process_name` VALUES ('388', '335', '022艾灸枕排钻钻孔', '', '2020-11-11 16:03:03', '0.55');
INSERT INTO `web_process_name` VALUES ('389', '336', '022艾灸枕气动打磨', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('390', '337', '022艾灸枕砂光', '', '2020-11-11 16:03:03', '1.00');
INSERT INTO `web_process_name` VALUES ('391', '338', '022艾灸枕上配件', '', '2020-11-11 16:03:03', '0.25');
INSERT INTO `web_process_name` VALUES ('392', '339', '022艾灸枕烫印', '', '2020-11-11 16:03:03', '0.02');
INSERT INTO `web_process_name` VALUES ('393', '340', '022艾灸枕下料', '', '2020-11-11 16:03:03', '0.35');
INSERT INTO `web_process_name` VALUES ('394', '341', '022艾灸枕下铁皮', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('395', '342', '022艾灸枕钻孔', '', '2020-11-11 16:03:03', '0.15');
INSERT INTO `web_process_name` VALUES ('396', '343', '023@1大督脉灸补叉钉?', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('397', '344', '023@2大督脉灸补钉眼', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('398', '345', '023@3大督脉灸打叉钉', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('399', '346', '023@4大督脉灸打铁皮', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('400', '347', '023@5大督脉灸钉网', '', '2020-11-11 16:03:03', '0.25');
INSERT INTO `web_process_name` VALUES ('401', '348', '023@6大督脉灸覆膜', '', '2020-11-11 16:03:03', '0.25');
INSERT INTO `web_process_name` VALUES ('402', '349', '023@7大督脉灸和盒子', '', '2020-11-11 16:03:03', '1.70');
INSERT INTO `web_process_name` VALUES ('403', '350', '023@8大督脉灸开榫', '', '2020-11-11 16:03:03', '1.20');
INSERT INTO `web_process_name` VALUES ('404', '351', '023@9大督脉灸排钻孔', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('405', '352', '023@10大督脉灸气动打', '', '2020-11-11 16:03:03', '1.00');
INSERT INTO `web_process_name` VALUES ('406', '353', '023@11大督脉灸砂光', '', '2020-11-11 16:03:03', '1.50');
INSERT INTO `web_process_name` VALUES ('407', '354', '023@12大督脉灸上配件', '', '2020-11-11 16:03:03', '1.70');
INSERT INTO `web_process_name` VALUES ('408', '355', '023@13大督脉灸烫印', '', '2020-11-11 16:03:03', '0.05');
INSERT INTO `web_process_name` VALUES ('409', '356', '023@14大督脉灸下料', '', '2020-11-11 16:03:03', '0.90');
INSERT INTO `web_process_name` VALUES ('410', '357', '023@15大督脉灸下铁皮', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('411', '358', '023@16大督脉灸压条子', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('412', '359', '024@1督脉灸补钉眼', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('413', '360', '024@2督脉灸打叉钉', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('414', '361', '024@3督脉灸打铁皮', '', '2020-11-11 16:03:03', '0.35');
INSERT INTO `web_process_name` VALUES ('415', '362', '024@4督脉灸钉盖面横?', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('416', '363', '024@5督脉灸钉网', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('417', '364', '024@6督脉灸覆膜', '', '2020-11-11 16:03:03', '0.07');
INSERT INTO `web_process_name` VALUES ('418', '365', '024@7督脉灸盖面加斜', '', '2020-11-11 16:03:03', '0.02');
INSERT INTO `web_process_name` VALUES ('419', '366', '024@8督脉灸和盒子', '', '2020-11-11 16:03:03', '0.45');
INSERT INTO `web_process_name` VALUES ('420', '367', '024@9督脉灸合底网', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('421', '368', '024@10督脉灸开槽（手动）', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('422', '369', '024@11督脉灸排钻钻孔', '', '2020-11-11 16:03:03', '0.15');
INSERT INTO `web_process_name` VALUES ('423', '370', '024@12督脉灸气动打磨', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('424', '371', '024@13督脉灸砂光', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('425', '372', '024@14督脉灸上配件', '', '2020-11-11 16:03:03', '0.54');
INSERT INTO `web_process_name` VALUES ('426', '373', '024@15督脉灸烫印', '', '2020-11-11 16:03:03', '0.02');
INSERT INTO `web_process_name` VALUES ('427', '374', '024@16督脉灸下料', '', '2020-11-11 16:03:03', '0.26');
INSERT INTO `web_process_name` VALUES ('428', '375', '024@17督脉灸下铁皮', '', '2020-11-11 16:03:03', '0.25');
INSERT INTO `web_process_name` VALUES ('429', '376', '024@18督脉灸找补返修', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('430', '377', '024@19督脉灸钻手柄孔', '', '2020-11-11 16:03:03', '0.06');
INSERT INTO `web_process_name` VALUES ('431', '378', '025#08颈椎灸补钉眼', '', '2020-11-11 16:03:03', '0.11');
INSERT INTO `web_process_name` VALUES ('432', '379', '025#07颈椎灸打叉钉', '', '2020-11-11 16:03:03', '0.07');
INSERT INTO `web_process_name` VALUES ('433', '380', '025#06颈椎灸打通风孔', '', '2020-11-11 16:03:03', '0.05');
INSERT INTO `web_process_name` VALUES ('434', '381', '025#15颈椎灸覆膜', '', '2020-11-11 16:03:03', '0.07');
INSERT INTO `web_process_name` VALUES ('435', '382', '025#04颈椎灸盖面加斜', '', '2020-11-11 16:03:03', '0.02');
INSERT INTO `web_process_name` VALUES ('436', '383', '025#05颈椎灸和盒子', '', '2020-11-11 16:03:03', '0.45');
INSERT INTO `web_process_name` VALUES ('437', '384', '025#03颈椎灸开槽（手动）', '', '2020-11-11 16:03:03', '0.15');
INSERT INTO `web_process_name` VALUES ('438', '385', '025#10颈椎灸气动打磨', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('439', '386', '025#09颈椎灸机器砂光', '', '2020-11-11 16:03:03', '0.35');
INSERT INTO `web_process_name` VALUES ('440', '387', '025#13颈椎灸上配件', '', '2020-11-11 16:03:03', '0.26');
INSERT INTO `web_process_name` VALUES ('441', '388', '025#14颈椎灸烫印', '', '2020-11-11 16:03:03', '0.02');
INSERT INTO `web_process_name` VALUES ('442', '389', '025#01颈椎灸下木料（手动）', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('443', '390', '025#02颈椎灸下铁料', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('444', '391', '025#11颈椎灸钻手柄眼', '', '2020-11-11 16:03:03', '0.03');
INSERT INTO `web_process_name` VALUES ('445', '392', '025#12颈椎灸镂铣抹边', '', '2020-11-11 16:03:03', '0.15');
INSERT INTO `web_process_name` VALUES ('446', '393', '026小号橡木桶补钉眼', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('447', '394', '026小号橡木桶打铁皮', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('448', '395', '026小号橡木桶钉桶面拉手', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('449', '396', '026小号橡木桶覆膜', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('450', '397', '026小号橡木桶合桶', '', '2020-11-11 16:03:03', '2.50');
INSERT INTO `web_process_name` VALUES ('451', '398', '026小号橡木桶激光雕刻', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('452', '399', '026小号橡木桶开槽', '', '2020-11-11 16:03:03', '1.00');
INSERT INTO `web_process_name` VALUES ('453', '400', '026小号橡木桶排钻钻孔', '', '2020-11-11 16:03:03', '0.60');
INSERT INTO `web_process_name` VALUES ('454', '401', '026小号橡木桶气动打磨', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('455', '402', '026小号橡木桶砂光', '', '2020-11-11 16:03:03', '0.60');
INSERT INTO `web_process_name` VALUES ('456', '403', '026小号橡木桶上角撑', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('457', '404', '026小号橡木桶上配件', '', '2020-11-11 16:03:03', '0.70');
INSERT INTO `web_process_name` VALUES ('458', '405', '026小号橡木桶上桶盖', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('459', '406', '026小号橡木桶下料', '', '2020-11-11 16:03:03', '0.35');
INSERT INTO `web_process_name` VALUES ('460', '407', '026小号橡木桶下铁皮', '', '2020-11-11 16:03:03', '0.15');
INSERT INTO `web_process_name` VALUES ('461', '408', '026小号橡木桶钻孔', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('462', '409', '026小号橡木桶钻孔上吸铁石', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('463', '410', '027大中号橡木桶打磨', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('464', '411', '027大中号橡木桶打铁皮', '', '2020-11-11 16:03:03', '0.25');
INSERT INTO `web_process_name` VALUES ('465', '412', '027大中号橡木桶钉升降板', '', '2020-11-11 16:03:03', '0.35');
INSERT INTO `web_process_name` VALUES ('466', '413', '027大中号橡木桶钉桶面拉手', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('467', '414', '027大中号橡木桶覆膜', '', '2020-11-11 16:03:03', '0.25');
INSERT INTO `web_process_name` VALUES ('468', '415', '027大中号橡木桶合桶', '', '2020-11-11 16:03:03', '3.00');
INSERT INTO `web_process_name` VALUES ('469', '416', '027大中号橡木桶激光雕刻', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('470', '417', '027大中号橡木桶开槽', '', '2020-11-11 16:03:03', '1.00');
INSERT INTO `web_process_name` VALUES ('471', '418', '027大中号橡木桶排钻钻孔', '', '2020-11-11 16:03:03', '0.60');
INSERT INTO `web_process_name` VALUES ('472', '419', '027大中号橡木桶砂光', '', '2020-11-11 16:03:03', '1.00');
INSERT INTO `web_process_name` VALUES ('473', '420', '027大中号橡木桶上角撑', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('474', '421', '027大中号橡木桶上配件', '', '2020-11-11 16:03:03', '0.90');
INSERT INTO `web_process_name` VALUES ('475', '422', '027大中号橡木桶上桶盖', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('476', '423', '027大中号橡木桶下料', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('477', '424', '027大中号橡木桶下铁皮', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('478', '425', '027大中号橡木桶橡木桶补钉眼', '', '2020-11-11 16:03:03', '0.45');
INSERT INTO `web_process_name` VALUES ('479', '426', '027大中号橡木桶钻孔', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('480', '427', '027大中号橡木桶钻升降板孔', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('481', '428', '028@08小号卷艾器补钉眼', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('482', '429', '028@14小号卷艾器腹膜', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('483', '430', '028@06小号卷艾器合盒子', '', '2020-11-11 16:03:03', '0.70');
INSERT INTO `web_process_name` VALUES ('484', '431', '028@11小号卷艾器激光切布', '', '2020-11-11 16:03:03', '0.05');
INSERT INTO `web_process_name` VALUES ('485', '432', '028@12小号卷艾器气动打磨', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('486', '433', '028@10小号卷艾器机器砂光', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('487', '434', '028@13小号卷艾器上配件', '', '2020-11-11 16:03:03', '0.60');
INSERT INTO `web_process_name` VALUES ('488', '435', '028@03小号卷艾器烫印', '', '2020-11-11 16:03:03', '0.02');
INSERT INTO `web_process_name` VALUES ('489', '436', '028@01小号卷艾器木下料', '', '2020-11-11 16:03:03', '0.60');
INSERT INTO `web_process_name` VALUES ('490', '437', '028@09小号卷艾器钻孔', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('491', '438', '029艾灸罐覆膜', '', '2020-11-11 16:03:03', '0.15');
INSERT INTO `web_process_name` VALUES ('492', '439', '029艾灸罐焊网', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('493', '440', '029艾灸罐合罐', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('494', '441', '029艾灸罐激光找点及钻孔点', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('495', '442', '029艾灸罐开凹及打磨', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('496', '443', '029艾灸罐上配件', '', '2020-11-11 16:03:03', '0.60');
INSERT INTO `web_process_name` VALUES ('497', '444', '029艾灸罐上下末边', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('498', '445', '029艾灸罐下料', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('499', '446', '029艾灸罐下铁料', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('500', '447', '029艾灸罐钻孔', '', '2020-11-11 16:03:03', '0.70');
INSERT INTO `web_process_name` VALUES ('501', '448', '030双膝艾灸盒补钉眼', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('502', '449', '030双膝艾灸盒打铁皮', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('503', '450', '030双膝艾灸盒覆膜', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('504', '451', '030双膝艾灸盒盖面打磨', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('505', '452', '030双膝艾灸盒和盒子', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('506', '453', '030双膝艾灸盒合内架', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('507', '454', '030双膝艾灸盒激光雕刻', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('508', '455', '030双膝艾灸盒开槽', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('509', '456', '030双膝艾灸盒气动打磨', '', '2020-11-11 16:03:03', '0.35');
INSERT INTO `web_process_name` VALUES ('510', '457', '030双膝艾灸盒砂光', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('511', '458', '030双膝艾灸盒上底网', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('512', '459', '030双膝艾灸盒上配件', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('513', '460', '030双膝艾灸盒上蜗牛螺丝', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('514', '461', '030双膝艾灸盒下料', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('515', '462', '030双膝艾灸盒下铁皮', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('516', '463', '030双膝艾灸盒压凹槽', '', '2020-11-11 16:03:03', '0.15');
INSERT INTO `web_process_name` VALUES ('517', '464', '030双膝艾灸盒转孔', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('518', '465', '031胸灸补钉眼', '', '2020-11-11 16:03:03', '0.60');
INSERT INTO `web_process_name` VALUES ('519', '466', '031胸灸打铁皮', '', '2020-11-11 16:03:03', '0.60');
INSERT INTO `web_process_name` VALUES ('520', '467', '031胸灸钉升降腿', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('521', '468', '031胸灸钉网', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('522', '469', '031胸灸盖面抹边', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('523', '470', '031胸灸合两个分盒子', '', '2020-11-11 16:03:03', '1.20');
INSERT INTO `web_process_name` VALUES ('524', '471', '031胸灸合主框', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('525', '472', '031胸灸激光雕刻', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('526', '473', '031胸灸加盖覆膜包装', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('527', '474', '031胸灸开槽', '', '2020-11-11 16:03:03', '1.00');
INSERT INTO `web_process_name` VALUES ('528', '475', '031胸灸气动打磨', '', '2020-11-11 16:03:03', '0.90');
INSERT INTO `web_process_name` VALUES ('529', '476', '031胸灸砂光', '', '2020-11-11 16:03:03', '1.00');
INSERT INTO `web_process_name` VALUES ('530', '477', '031胸灸上底网', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('531', '478', '031胸灸上蜗牛螺丝', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('532', '479', '031胸灸下料', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('533', '480', '031胸灸下铁皮', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('534', '481', '031胸灸钻孔', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('535', '482', '032@1圆形松木枕头下料', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('536', '483', '033艾塔模具测轴（本厂生产）', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('537', '484', '033艾塔模具覆膜包装', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('538', '485', '033艾塔模具砂光', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('539', '486', '033艾塔模具手工打磨', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('540', '487', '033艾塔模具烫印', '', '2020-11-11 16:03:03', '0.02');
INSERT INTO `web_process_name` VALUES ('541', '488', '033艾塔模具下料', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('542', '489', '033艾塔模具钻孔', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('543', '490', '034#01中号卷艾器下木料', '', '2020-11-11 16:03:03', '1.30');
INSERT INTO `web_process_name` VALUES ('544', '491', '034#02中号卷艾器板面末边', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('545', '492', '034#03中号卷艾器合直角面', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('546', '493', '034#04中号卷艾器合内盒子', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('547', '494', '034#05中号卷艾器合大盒子', '', '2020-11-11 16:03:03', '0.90');
INSERT INTO `web_process_name` VALUES ('548', '495', '034#06中号卷艾器上内盒子', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('549', '496', '034#07中号卷艾器补钉眼', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('550', '497', '034#08中号卷艾器机械砂光', '', '2020-11-11 16:03:03', '0.90');
INSERT INTO `web_process_name` VALUES ('551', '498', '034#09中号卷艾器气动打磨', '', '2020-11-11 16:03:03', '0.70');
INSERT INTO `web_process_name` VALUES ('552', '499', '034#10中号卷艾器激光切布', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('553', '500', '034#11中号卷艾器横条钻孔', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('554', '501', '034#12中号卷艾器烫印商标', '', '2020-11-11 16:03:03', '0.05');
INSERT INTO `web_process_name` VALUES ('555', '502', '034#13中号卷艾器上配件', '', '2020-11-11 16:03:03', '0.70');
INSERT INTO `web_process_name` VALUES ('556', '503', '034#14中号卷艾器覆膜包装', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('557', '504', '035单膝艾灸盒001下料', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('558', '505', '035单膝艾灸盒002开槽', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('559', '506', '035单膝艾灸盒003上底网', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('560', '507', '035单膝艾灸盒004下铁皮', '', '2020-11-11 16:03:03', '0.25');
INSERT INTO `web_process_name` VALUES ('561', '508', '035单膝艾灸盒005打铁皮', '', '2020-11-11 16:03:03', '0.25');
INSERT INTO `web_process_name` VALUES ('562', '509', '035单膝艾灸盒006和盒子', '', '2020-11-11 16:03:03', '0.60');
INSERT INTO `web_process_name` VALUES ('563', '510', '035单膝艾灸盒007打叉钉', '', '2020-11-11 16:03:03', '0.05');
INSERT INTO `web_process_name` VALUES ('564', '511', '035单膝艾灸盒008补钉眼', '', '2020-11-11 16:03:03', '0.15');
INSERT INTO `web_process_name` VALUES ('565', '512', '035单膝艾灸盒009砂光', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('566', '513', '035单膝艾灸盒010气动打磨', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('567', '514', '035单膝艾灸盒011钉盖面横撑', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('568', '515', '035单膝艾灸盒012上配件', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('569', '516', '035单膝艾灸盒013烫印', '', '2020-11-11 16:03:03', '0.02');
INSERT INTO `web_process_name` VALUES ('570', '517', '035单膝艾灸盒014覆膜', '', '2020-11-11 16:03:03', '0.70');
INSERT INTO `web_process_name` VALUES ('571', '518', '032@2圆形松木枕头拉槽', '', '2020-11-11 16:03:03', '1.50');
INSERT INTO `web_process_name` VALUES ('572', '519', '032@3圆形松木枕头合枕头加刷胶', '', '2020-11-11 16:03:03', '3.70');
INSERT INTO `web_process_name` VALUES ('573', '520', '032@4圆形松木枕头刮底面平面', '', '2020-11-11 16:03:03', '1.00');
INSERT INTO `web_process_name` VALUES ('574', '521', '032@5圆形松木枕头帖内条', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('575', '522', '032@6圆形松木枕头开槽', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('576', '523', '032@7圆形松木枕头下铁料', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('577', '524', '032@8圆形松木枕头钉铁皮', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('578', '525', '032@9圆形松木枕头打孔', '', '2020-11-11 16:03:03', '1.50');
INSERT INTO `web_process_name` VALUES ('579', '526', '032@10圆形松木枕头砂光', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('580', '527', '032@11圆形松木枕头补钉眼', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('581', '528', '032@12圆形松木枕头压凹槽', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('582', '529', '032@13圆形松木枕头印商标', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('583', '530', '032@14圆形松木枕头上配件', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('584', '531', '032@15圆形松木枕头气动打磨', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('585', '532', '032@16圆形松木枕头覆膜包装', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('586', '533', '032@17圆形松木枕头订底板横棍', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('587', '534', '032@18圆形松木枕头订网', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('588', '535', '032@19圆形松木枕头帖脚丫并补钉', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('589', '536', '036@01眼灸下料', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('590', '537', '036@03眼灸下铁料', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('591', '538', '036@04眼灸打铁皮', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('592', '539', '036@05眼灸钻孔', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('593', '540', '036@07眼灸和盒子', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('594', '541', '036@09眼灸上底网', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('595', '542', '036@06眼灸焊柱子加焊底网', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('596', '543', '036@08眼灸补钉眼', '', '2020-11-11 16:03:03', '0.30');
INSERT INTO `web_process_name` VALUES ('597', '544', '036@10眼灸机械砂光', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('598', '545', '036@11眼灸气动打磨', '', '2020-11-11 16:03:03', '0.80');
INSERT INTO `web_process_name` VALUES ('599', '546', '036@14眼灸上配件', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('600', '547', '036@12眼灸上蜗牛', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('601', '548', '036@13眼灸印图案加商标', '', '2020-11-11 16:03:03', '0.20');
INSERT INTO `web_process_name` VALUES ('602', '549', '036@15眼灸打磨支架', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('603', '550', '036@16眼灸腹膜包装', '', '2020-11-11 16:03:03', '0.40');
INSERT INTO `web_process_name` VALUES ('604', '551', '036@17眼灸拉盒子盖', '', '2020-11-11 16:03:03', '0.50');
INSERT INTO `web_process_name` VALUES ('605', '552', '036@02眼灸开槽', '', '2020-11-11 16:03:03', '1.50');
INSERT INTO `web_process_name` VALUES ('606', '553', '035单膝艾灸盒18盖面加斜', '', '2020-11-11 16:03:03', '0.10');
INSERT INTO `web_process_name` VALUES ('607', '554', '小号卷艾器返修', '', '2020-11-11 16:03:03', '3.67');
INSERT INTO `web_process_name` VALUES ('608', '555', '028@07小号卷艾器上面板', '', '2020-11-11 16:03:04', '0.30');
INSERT INTO `web_process_name` VALUES ('609', '556', '胸部艾灸盒返修', '', '2020-11-11 16:03:04', '10.40');
INSERT INTO `web_process_name` VALUES ('610', '557', '松木单膝艾灸盒返修', '', '2020-11-11 16:03:04', '3.42');
INSERT INTO `web_process_name` VALUES ('611', '558', '圆形艾灸枕返修', '', '2020-11-11 16:03:04', '14.00');
INSERT INTO `web_process_name` VALUES ('612', '559', '座熏盒（插）返修', '', '2020-11-11 16:03:04', '4.70');
INSERT INTO `web_process_name` VALUES ('613', '560', '019#19翻盖六插顶部开通风孔', '', '2020-11-11 16:03:04', '0.08');
INSERT INTO `web_process_name` VALUES ('614', '561', '030双膝艾灸盒钉腿横棍', '', '2020-11-11 16:03:04', '0.10');
INSERT INTO `web_process_name` VALUES ('615', '562', '025#16颈椎艾灸盒打铁皮', '', '2020-11-11 16:03:04', '0.30');
INSERT INTO `web_process_name` VALUES ('616', '563', '004#15a双叉打叉丁', '', '2020-11-11 16:03:04', '0.06');
INSERT INTO `web_process_name` VALUES ('617', '564', '018#18翻盖四叉开槽（手动）', '', '2020-11-11 16:03:04', '0.04');
INSERT INTO `web_process_name` VALUES ('618', '565', '028@04小号卷艾器抹边', '', '2020-11-11 16:03:04', '0.20');
INSERT INTO `web_process_name` VALUES ('619', '566', '眼部艾灸盒返修', '', '2020-11-11 16:03:04', '9.70');
INSERT INTO `web_process_name` VALUES ('620', '567', '037@01特大号艾条机下料', '', '2020-11-11 16:03:04', '1.40');
INSERT INTO `web_process_name` VALUES ('621', '568', '037@02特大号艾条机开槽', '', '2020-11-11 16:03:04', '0.50');
INSERT INTO `web_process_name` VALUES ('622', '569', '037@03特大号艾条机板面末边', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('623', '570', '037@04特大号艾条机合直角面', '', '2020-11-11 16:03:04', '0.30');
INSERT INTO `web_process_name` VALUES ('624', '571', '037@05特大号艾条机合内盒子', '', '2020-11-11 16:03:04', '0.60');
INSERT INTO `web_process_name` VALUES ('625', '572', '037@06特大号艾条机合大盒子', '', '2020-11-11 16:03:04', '1.00');
INSERT INTO `web_process_name` VALUES ('626', '573', '037@07特大号艾条机上内盒子', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('627', '574', '037@08特大号艾条机补钉眼', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('628', '575', '037@09特大号艾条机机械砂光', '', '2020-11-11 16:03:04', '1.10');
INSERT INTO `web_process_name` VALUES ('629', '576', '037@10特大号艾条机气动打磨', '', '2020-11-11 16:03:04', '0.90');
INSERT INTO `web_process_name` VALUES ('630', '577', '037@11特大号艾条机激光切布', '', '2020-11-11 16:03:04', '0.10');
INSERT INTO `web_process_name` VALUES ('631', '578', '037@12特大号艾条机钻孔', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('632', '579', '037@13特大号艾条机烫印', '', '2020-11-11 16:03:04', '0.05');
INSERT INTO `web_process_name` VALUES ('633', '580', '037@14特大号艾条机上配件', '', '2020-11-11 16:03:04', '0.80');
INSERT INTO `web_process_name` VALUES ('634', '581', '037@15特大号艾条机覆膜包装', '', '2020-11-11 16:03:04', '0.30');
INSERT INTO `web_process_name` VALUES ('635', '582', '013#13a十二插打叉丁', '', '2020-11-11 16:03:04', '0.20');
INSERT INTO `web_process_name` VALUES ('636', '583', '038@01双足艾灸盒下木料', '', '2020-11-11 16:03:04', '1.00');
INSERT INTO `web_process_name` VALUES ('637', '584', '038@02双足艾灸盒下铁料', '', '2020-11-11 16:03:04', '0.70');
INSERT INTO `web_process_name` VALUES ('638', '585', '038@03双足艾灸盒打砭石孔装砭石', '', '2020-11-11 16:03:04', '0.80');
INSERT INTO `web_process_name` VALUES ('639', '586', '038@04双足艾灸盒开木槽', '', '2020-11-11 16:03:04', '0.50');
INSERT INTO `web_process_name` VALUES ('640', '587', '038@05双足艾灸盒钉铁皮铁网', '', '2020-11-11 16:03:04', '1.00');
INSERT INTO `web_process_name` VALUES ('641', '588', '038@06双足艾灸上姜网铁角', '', '2020-11-11 16:03:04', '0.20');
INSERT INTO `web_process_name` VALUES ('642', '589', '038@07双足艾灸盒做姜网', '', '2020-11-11 16:03:04', '0.80');
INSERT INTO `web_process_name` VALUES ('643', '590', '038@08双足艾灸盒打通风孔', '', '2020-11-11 16:03:04', '0.60');
INSERT INTO `web_process_name` VALUES ('644', '591', '038@09双足艾灸盒合大小盒子', '', '2020-11-11 16:03:04', '2.00');
INSERT INTO `web_process_name` VALUES ('645', '592', '038@10双足艾灸盒钉上盖边木条', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('646', '593', '038@11双足艾灸盒合抽屉铁件（包铁皮组装燃烧架', '', '2020-11-11 16:03:04', '0.60');
INSERT INTO `web_process_name` VALUES ('647', '594', '038@12双足艾灸盒胡腻子（3次）', '', '2020-11-11 16:03:04', '1.00');
INSERT INTO `web_process_name` VALUES ('648', '595', '038@13双足艾灸盒机器砂光（含内盒）', '', '2020-11-11 16:03:04', '1.40');
INSERT INTO `web_process_name` VALUES ('649', '596', '038@14双足艾灸盒气动砂光（含内盒）', '', '2020-11-11 16:03:04', '1.20');
INSERT INTO `web_process_name` VALUES ('650', '597', '038@15双足艾灸盒激光印花', '', '2020-11-11 16:03:04', '0.20');
INSERT INTO `web_process_name` VALUES ('651', '598', '038@16双足艾灸盒装配件', '', '2020-11-11 16:03:04', '1.00');
INSERT INTO `web_process_name` VALUES ('652', '599', '038@17双足艾灸盒打内盒钢钉', '', '2020-11-11 16:03:04', '0.12');
INSERT INTO `web_process_name` VALUES ('653', '600', '038@18双足艾灸盒焊接内盒底网', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('654', '601', '038@19双足艾灸盒包装', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('655', '602', '035单膝艾灸盒15下木条', '', '2020-11-11 16:03:04', '0.10');
INSERT INTO `web_process_name` VALUES ('656', '603', '035单膝艾灸盒16钉边条', '', '2020-11-11 16:03:04', '0.20');
INSERT INTO `web_process_name` VALUES ('657', '604', '035单膝艾灸盒17焊底网', '', '2020-11-11 16:03:04', '0.07');
INSERT INTO `web_process_name` VALUES ('658', '605', '666通用砭石镶嵌单个分值', '', '2020-11-11 16:03:04', '0.10');
INSERT INTO `web_process_name` VALUES ('659', '606', '松木双足艾灸盒（砭石款）返修', '', '2020-11-11 16:03:04', '14.32');
INSERT INTO `web_process_name` VALUES ('660', '607', '橡木大号卷艾器返修', '', '2020-11-11 16:03:04', '8.65');
INSERT INTO `web_process_name` VALUES ('661', '608', '039@01半圆枕30CM开料', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('662', '609', '039@02半圆枕30CM拉槽', '', '2020-11-11 16:03:04', '1.20');
INSERT INTO `web_process_name` VALUES ('663', '610', '039@03半圆枕30CM合盒加刷胶', '', '2020-11-11 16:03:04', '3.00');
INSERT INTO `web_process_name` VALUES ('664', '611', '039@04半圆枕30CM刮底面平面', '', '2020-11-11 16:03:04', '0.80');
INSERT INTO `web_process_name` VALUES ('665', '612', '039@05半圆枕30CM贴内条', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('666', '613', '039@06半圆枕30CM开槽', '', '2020-11-11 16:03:04', '0.60');
INSERT INTO `web_process_name` VALUES ('667', '614', '039@07半圆枕30CM下铁料', '', '2020-11-11 16:03:04', '0.16');
INSERT INTO `web_process_name` VALUES ('668', '615', '039@08半圆枕30CM钉铁皮', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('669', '616', '039@09半圆枕30CM打孔', '', '2020-11-11 16:03:04', '1.20');
INSERT INTO `web_process_name` VALUES ('670', '617', '039@10半圆枕30CM砂光', '', '2020-11-11 16:03:04', '0.64');
INSERT INTO `web_process_name` VALUES ('671', '618', '039@11半圆枕30CM补丁眼', '', '2020-11-11 16:03:04', '0.16');
INSERT INTO `web_process_name` VALUES ('672', '619', '039@12半圆枕30CM压凹槽', '', '2020-11-11 16:03:04', '0.16');
INSERT INTO `web_process_name` VALUES ('673', '620', '039@13半圆枕30CM印商标', '', '2020-11-11 16:03:04', '0.08');
INSERT INTO `web_process_name` VALUES ('674', '621', '039@14半圆枕30CM上配件', '', '2020-11-11 16:03:04', '0.24');
INSERT INTO `web_process_name` VALUES ('675', '622', '039@15半圆枕30CM气动打磨', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('676', '623', '039@16半圆枕30CM覆膜包装', '', '2020-11-11 16:03:04', '0.16');
INSERT INTO `web_process_name` VALUES ('677', '624', '039@17半圆枕30CM钉底板横棍', '', '2020-11-11 16:03:04', '0.16');
INSERT INTO `web_process_name` VALUES ('678', '625', '039@18半圆枕30CM钉网', '', '2020-11-11 16:03:04', '0.16');
INSERT INTO `web_process_name` VALUES ('679', '626', '039@19半圆枕30CM贴脚丫并钉钉子', '', '2020-11-11 16:03:04', '0.08');
INSERT INTO `web_process_name` VALUES ('680', '627', '040@01手柄三叉三柱开槽', '', '2020-11-11 16:03:04', '0.18');
INSERT INTO `web_process_name` VALUES ('681', '628', '040@02手柄三叉三柱手柄钻眼', '', '2020-11-11 16:03:04', '0.03');
INSERT INTO `web_process_name` VALUES ('682', '629', '041@01拉筋板下木料（除档位器外，包含下底板3根木?', '', '2020-11-11 16:03:04', '0.60');
INSERT INTO `web_process_name` VALUES ('683', '630', '041@02拉筋板机器抛光（包含正反面，所有部件）', '', '2020-11-11 16:03:04', '0.10');
INSERT INTO `web_process_name` VALUES ('684', '631', '041@03拉筋板地镂倒楞（包含3根木条）', '', '2020-11-11 16:03:04', '0.30');
INSERT INTO `web_process_name` VALUES ('685', '632', '041@04拉筋板钉底板3根木条', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('686', '633', '041@05拉筋板钉挡脚片布', '', '2020-11-11 16:03:04', '0.10');
INSERT INTO `web_process_name` VALUES ('687', '634', '041@06拉筋板胡腻子（包含3根木条和挡脚木条', '', '2020-11-11 16:03:04', '0.20');
INSERT INTO `web_process_name` VALUES ('688', '635', '041@07拉筋板手工打磨（平板款', '', '2020-11-11 16:03:04', '0.80');
INSERT INTO `web_process_name` VALUES ('689', '636', '041@08拉筋板手工打磨（小方块款）', '', '2020-11-11 16:03:04', '2.00');
INSERT INTO `web_process_name` VALUES ('690', '637', '041@09拉筋板手工打磨（大方块款）', '', '2020-11-11 16:03:04', '1.60');
INSERT INTO `web_process_name` VALUES ('691', '638', '041@10拉筋板手工打磨（圆点款）', '', '2020-11-11 16:03:04', '2.50');
INSERT INTO `web_process_name` VALUES ('692', '639', '041@11拉筋板上折页', '', '2020-11-11 16:03:04', '0.30');
INSERT INTO `web_process_name` VALUES ('693', '640', '041@12拉筋板钉挡脚木条', '', '2020-11-11 16:03:04', '0.30');
INSERT INTO `web_process_name` VALUES ('694', '641', '041@13拉筋板覆膜包装', '', '2020-11-11 16:03:04', '0.20');
INSERT INTO `web_process_name` VALUES ('695', '642', '041@14拉筋板烫印', '', '2020-11-11 16:03:04', '0.05');
INSERT INTO `web_process_name` VALUES ('696', '643', '043#01翻盖弧度6插下木料', '', '2020-11-11 16:03:04', '0.15');
INSERT INTO `web_process_name` VALUES ('697', '644', '043#02翻盖弧度6插下铁料', '', '2020-11-11 16:03:04', '0.30');
INSERT INTO `web_process_name` VALUES ('698', '645', '043#03翻盖弧度6插打铁皮', '', '2020-11-11 16:03:04', '0.32');
INSERT INTO `web_process_name` VALUES ('699', '646', '043#04翻盖弧度6插钻孔', '', '2020-11-11 16:03:04', '0.08');
INSERT INTO `web_process_name` VALUES ('700', '647', '043#05翻盖弧度6插合盒子', '', '2020-11-11 16:03:04', '0.40');
INSERT INTO `web_process_name` VALUES ('701', '648', '043#06翻盖弧度6插合底网', '', '2020-11-11 16:03:04', '0.10');
INSERT INTO `web_process_name` VALUES ('702', '649', '043#07翻盖弧度6插打叉丁', '', '2020-11-11 16:03:04', '0.10');
INSERT INTO `web_process_name` VALUES ('703', '650', '043#08翻盖弧度6插补丁眼', '', '2020-11-11 16:03:04', '0.11');
INSERT INTO `web_process_name` VALUES ('704', '651', '043#09翻盖弧度6插盖面加斜', '', '2020-11-11 16:03:04', '0.02');
INSERT INTO `web_process_name` VALUES ('705', '652', '043#10翻盖弧度6插烫印', '', '2020-11-11 16:03:04', '0.02');
INSERT INTO `web_process_name` VALUES ('706', '653', '043#11翻盖弧度6插砂光', '', '2020-11-11 16:03:04', '0.36');
INSERT INTO `web_process_name` VALUES ('707', '654', '043#12翻盖弧度6插气动打磨', '', '2020-11-11 16:03:04', '0.39');
INSERT INTO `web_process_name` VALUES ('708', '655', '043#13翻盖弧度6插上层配件', '', '2020-11-11 16:03:04', '0.32');
INSERT INTO `web_process_name` VALUES ('709', '656', '043#14翻盖弧度6插钻手柄眼', '', '2020-11-11 16:03:04', '0.03');
INSERT INTO `web_process_name` VALUES ('710', '657', '043#15翻盖弧度6插锯姜网', '', '2020-11-11 16:03:04', '0.07');
INSERT INTO `web_process_name` VALUES ('711', '658', '043#16翻盖弧度6插合姜网', '', '2020-11-11 16:03:04', '0.10');
INSERT INTO `web_process_name` VALUES ('712', '659', '043#17翻盖弧度6插上姜网折页', '', '2020-11-11 16:03:04', '0.15');
INSERT INTO `web_process_name` VALUES ('713', '660', '043#18翻盖弧度6插上拉扣', '', '2020-11-11 16:03:04', '0.15');
INSERT INTO `web_process_name` VALUES ('714', '661', '043#19翻盖弧度6插覆膜包装', '', '2020-11-11 16:03:04', '0.07');
INSERT INTO `web_process_name` VALUES ('715', '662', '046#02双插孔柱下压网条', '', '2020-11-11 16:03:04', '0.03');
INSERT INTO `web_process_name` VALUES ('716', '663', '046#03三插孔柱下压网条', '', '2020-11-11 16:03:04', '0.04');
INSERT INTO `web_process_name` VALUES ('717', '664', '046#04四插孔柱下压网条', '', '2020-11-11 16:03:04', '0.05');
INSERT INTO `web_process_name` VALUES ('718', '665', '046#05五插孔柱下压网条', '', '2020-11-11 16:03:04', '0.06');
INSERT INTO `web_process_name` VALUES ('719', '666', '046#06六插孔柱下压网条', '', '2020-11-11 16:03:04', '0.07');
INSERT INTO `web_process_name` VALUES ('720', '667', '046#07八插孔柱下压网条', '', '2020-11-11 16:03:04', '0.08');
INSERT INTO `web_process_name` VALUES ('721', '668', '046#08十二插柱下压网条', '', '2020-11-11 16:03:04', '0.09');
INSERT INTO `web_process_name` VALUES ('722', '669', '045#01拉筋板喷漆后气动手工打磨一遍（平板款）', '', '2020-11-11 16:03:04', '2.30');
INSERT INTO `web_process_name` VALUES ('723', '670', '045#02拉筋板喷漆后气动手工打磨一遍（大方块款）', '', '2020-11-11 16:03:04', '3.10');
INSERT INTO `web_process_name` VALUES ('724', '671', '045#03拉筋板喷漆后气动手工打磨一遍（小方块款）', '', '2020-11-11 16:03:04', '3.50');
INSERT INTO `web_process_name` VALUES ('725', '672', '045#04拉筋板喷漆后气动手工打磨一遍（圆点款）', '', '2020-11-11 16:03:04', '4.00');
INSERT INTO `web_process_name` VALUES ('726', '673', '045#05拉筋板喷漆款钻孔选料', '', '2020-11-11 16:03:04', '0.30');
INSERT INTO `web_process_name` VALUES ('727', '674', '044#01头颈艾灸盒手工下木料（包含机器下完后截料）', '', '2020-11-11 16:03:04', '1.40');
INSERT INTO `web_process_name` VALUES ('728', '675', '044#02头颈艾灸盒下所有铁皮铁网料', '', '2020-11-11 16:03:04', '0.20');
INSERT INTO `web_process_name` VALUES ('729', '676', '044#03头颈艾灸盒地镂倒楞（包含 底座 顶板 侧板）', '', '2020-11-11 16:03:04', '0.60');
INSERT INTO `web_process_name` VALUES ('730', '677', '044#04头颈艾灸盒打铁皮和钉网', '', '2020-11-11 16:03:04', '0.32');
INSERT INTO `web_process_name` VALUES ('731', '678', '044#05头颈艾灸盒胡泥（盒体 支架 底座）', '', '2020-11-11 16:03:04', '0.20');
INSERT INTO `web_process_name` VALUES ('732', '679', '044#06头颈艾灸盒机器砂光（底座 盒体 支架）', '', '2020-11-11 16:03:04', '0.48');
INSERT INTO `web_process_name` VALUES ('733', '680', '044#07头颈艾灸盒气动手工打磨（底座 盒体 支架）', '', '2020-11-11 16:03:04', '1.25');
INSERT INTO `web_process_name` VALUES ('734', '681', '044#08头颈艾灸盒和盒体 组支架 前盖', '', '2020-11-11 16:03:04', '0.90');
INSERT INTO `web_process_name` VALUES ('735', '682', '044#09头颈艾灸盒打底座孔和燃烧架孔', '', '2020-11-11 16:03:04', '0.20');
INSERT INTO `web_process_name` VALUES ('736', '683', '044#10头颈艾灸盒底座上合页  上木塞  钉枕头燃烧架', '', '2020-11-11 16:03:04', '0.28');
INSERT INTO `web_process_name` VALUES ('737', '684', '044#11头颈艾灸盒上配件（铁腕钻孔 上铁腕螺丝  上?', '', '2020-11-11 16:03:04', '1.70');
INSERT INTO `web_process_name` VALUES ('738', '685', '044#12头颈艾灸盒放保护木架 覆膜 包装', '', '2020-11-11 16:03:04', '0.25');
INSERT INTO `web_process_name` VALUES ('739', '686', '木工生产零工计算', '80/9H/60M=0.148', '2020-11-15 00:01:23', '0.15');
INSERT INTO `web_process_name` VALUES ('740', '687', '请勿点击选择', '配合零工工序使用', '2020-11-15 00:11:16', '0.01');

-- ----------------------------
-- Table structure for `web_production_plan`
-- ----------------------------
DROP TABLE IF EXISTS `web_production_plan`;
CREATE TABLE `web_production_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `total_output` int(11) DEFAULT NULL,
  `real_output` int(11) DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `plan_state` int(11) DEFAULT NULL,
  `unit` varchar(20) DEFAULT NULL,
  `progress` int(11) DEFAULT NULL,
  `total_float` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_production_plan
-- ----------------------------
INSERT INTO `web_production_plan` VALUES ('46', '001', '测试计划', '1000', '0', '2020-11-22 00:00:00', '2020-11-28 00:00:00', '2', '个', '75', '100');

-- ----------------------------
-- Table structure for `web_ptom`
-- ----------------------------
DROP TABLE IF EXISTS `web_ptom`;
CREATE TABLE `web_ptom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_ptom_module_id_0497fb7e_fk_web_process_module_id` (`module_id`),
  KEY `web_ptom_process_id_da330e76_fk_web_process_name_id` (`process_id`),
  CONSTRAINT `web_ptom_module_id_0497fb7e_fk_web_process_module_id` FOREIGN KEY (`module_id`) REFERENCES `web_process_module` (`id`),
  CONSTRAINT `web_ptom_process_id_da330e76_fk_web_process_name_id` FOREIGN KEY (`process_id`) REFERENCES `web_process_name` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=87 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_ptom
-- ----------------------------
INSERT INTO `web_ptom` VALUES ('68', '16', '202');
INSERT INTO `web_ptom` VALUES ('69', '16', '201');
INSERT INTO `web_ptom` VALUES ('70', '16', '200');
INSERT INTO `web_ptom` VALUES ('71', '16', '199');
INSERT INTO `web_ptom` VALUES ('72', '16', '198');
INSERT INTO `web_ptom` VALUES ('73', '16', '197');
INSERT INTO `web_ptom` VALUES ('74', '16', '196');
INSERT INTO `web_ptom` VALUES ('75', '16', '195');
INSERT INTO `web_ptom` VALUES ('76', '16', '194');
INSERT INTO `web_ptom` VALUES ('77', '16', '193');
INSERT INTO `web_ptom` VALUES ('78', '16', '192');
INSERT INTO `web_ptom` VALUES ('79', '16', '191');
INSERT INTO `web_ptom` VALUES ('80', '16', '190');
INSERT INTO `web_ptom` VALUES ('81', '16', '189');
INSERT INTO `web_ptom` VALUES ('82', '16', '188');
INSERT INTO `web_ptom` VALUES ('83', '16', '187');
INSERT INTO `web_ptom` VALUES ('84', '23', '739');
INSERT INTO `web_ptom` VALUES ('85', '23', '740');

-- ----------------------------
-- Table structure for `web_schedule`
-- ----------------------------
DROP TABLE IF EXISTS `web_schedule`;
CREATE TABLE `web_schedule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(300) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `level` int(11) NOT NULL,
  `info_datetime` datetime NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `exe_type` int(11) NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_schedule_user_id_f7b8666a_fk_web_userinfo_id` (`user_id`),
  CONSTRAINT `web_schedule_user_id_f7b8666a_fk_web_userinfo_id` FOREIGN KEY (`user_id`) REFERENCES `web_userinfo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for `web_userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `web_userinfo`;
CREATE TABLE `web_userinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `station` varchar(20) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `op_flag` int(11) DEFAULT NULL,
  `info_datetime` datetime NOT NULL,
  `is_login` int(11) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `userType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_userinfo
-- ----------------------------
INSERT INTO `web_userinfo` VALUES ('1', '666', '生产系统管理员', '管理员', '', '2', '2020-08-12 09:03:50', '0', '050501', '2');
INSERT INTO `web_userinfo` VALUES ('2', '001', '生产厂长刘培文', '工序操作员', '擅长压膜工序', '1', '2020-08-12 09:05:00', '0', '123456', '1');
INSERT INTO `web_userinfo` VALUES ('3', '002', '仓库管理龙倩倩', '仓库', '仓库管理员', '1', '2020-08-12 09:21:41', '0', '12345678', '1');
INSERT INTO `web_userinfo` VALUES ('6', '999', '系统开发', '临时管理员', '临时管理员', '2', '2020-11-11 16:15:22', '0', 'liubing0917', '2');

-- ----------------------------
-- Table structure for `web_working`
-- ----------------------------
DROP TABLE IF EXISTS `web_working`;
CREATE TABLE `web_working` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_datetime` datetime DEFAULT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `w_output` int(11) DEFAULT NULL,
  `productivity` double DEFAULT NULL,
  `w_time` double DEFAULT NULL,
  `p_state` int(11) DEFAULT NULL,
  `content` longtext,
  `p_name_id` int(11) DEFAULT NULL,
  `p_plan_id` int(11) DEFAULT NULL,
  `w_code_id` int(11) DEFAULT NULL,
  `op_code_id` int(11) DEFAULT NULL,
  `job_num` varchar(20) DEFAULT NULL,
  `distribute_print_count` int(11) NOT NULL,
  `distribute_time` datetime DEFAULT NULL,
  `finished_print_count` int(11) NOT NULL,
  `finished_time` datetime DEFAULT NULL,
  `timeSpent` varchar(50) DEFAULT NULL,
  `modify_count` int(11) NOT NULL,
  `cutMoney` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `web_working_p_name_id_b4014ece_fk_web_process_name_id` (`p_name_id`),
  KEY `web_working_p_plan_id_d849786b_fk_web_production_plan_id` (`p_plan_id`),
  KEY `web_working_w_code_id_f87b91cd_fk_web_workman_id` (`w_code_id`),
  KEY `web_working_op_code_id_1fd1d7c5_fk_web_userinfo_id` (`op_code_id`),
  CONSTRAINT `web_working_op_code_id_1fd1d7c5_fk_web_userinfo_id` FOREIGN KEY (`op_code_id`) REFERENCES `web_userinfo` (`id`),
  CONSTRAINT `web_working_p_name_id_b4014ece_fk_web_process_name_id` FOREIGN KEY (`p_name_id`) REFERENCES `web_process_name` (`id`),
  CONSTRAINT `web_working_p_plan_id_d849786b_fk_web_production_plan_id` FOREIGN KEY (`p_plan_id`) REFERENCES `web_production_plan` (`id`),
  CONSTRAINT `web_working_w_code_id_f87b91cd_fk_web_workman_id` FOREIGN KEY (`w_code_id`) REFERENCES `web_workman` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_working
-- ----------------------------
INSERT INTO `web_working` VALUES ('165', '2020-11-22 20:27:05', '2020-11-22 20:28:27', '600', '444.44', '1.35', '1', null, '739', '46', '68', '6', '20201122001', '0', '2020-11-22 20:27:05', '0', '2020-11-22 20:27:05', '1分21秒', '0', '0.00');
INSERT INTO `web_working` VALUES ('166', '2020-11-22 20:27:18', '2020-11-22 20:28:21', '800', '776.7', '1.03', '1', null, '740', '46', '69', '6', '20201122002', '0', '2020-11-22 20:27:18', '0', '2020-11-22 20:27:18', '1分1秒', '0', '0.00');
INSERT INTO `web_working` VALUES ('167', '2020-11-22 20:27:56', null, '300', '0', '0', '0', null, '739', '46', '70', '6', '20201122003', '0', '2020-11-22 20:27:56', '0', '2020-11-22 20:27:56', null, '0', '0.00');
INSERT INTO `web_working` VALUES ('168', '2020-11-22 20:28:08', null, '200', '0', '0', '0', null, '740', '46', '72', '6', '20201122004', '0', '2020-11-22 20:28:08', '0', '2020-11-22 20:28:08', null, '1', '0.00');
INSERT INTO `web_working` VALUES ('169', '2020-11-22 20:33:49', '2020-11-22 20:33:58', '100', '769.23', '0.13', '1', null, '739', '46', '74', '6', '20201122005', '0', '2020-11-22 20:33:49', '0', '2020-11-22 20:33:49', '0分7秒', '1', '0.00');

-- ----------------------------
-- Table structure for `web_workman`
-- ----------------------------
DROP TABLE IF EXISTS `web_workman`;
CREATE TABLE `web_workman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `content` varchar(500) DEFAULT NULL,
  `boss_id` int(11) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `web_workman_boss_id_c047c97a_fk_web_userinfo_id` (`boss_id`),
  CONSTRAINT `web_workman_boss_id_c047c97a_fk_web_userinfo_id` FOREIGN KEY (`boss_id`) REFERENCES `web_userinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_workman
-- ----------------------------
INSERT INTO `web_workman` VALUES ('68', '003', '魏广明', '生产提成0.1元 仓库提成0.02元 送货50元 5月-11月加100元', '2', '123456');
INSERT INTO `web_workman` VALUES ('69', '004', '孙光勇', '16年4月入职  2019.12月开始基本工资由1500变更为1000', '2', '');
INSERT INTO `web_workman` VALUES ('70', '005', '刘贤玲', '', '2', '');
INSERT INTO `web_workman` VALUES ('71', '006', '龙倩', '', '2', '');
INSERT INTO `web_workman` VALUES ('72', '007', '刘欣然', '', '2', '');
INSERT INTO `web_workman` VALUES ('73', '008', '刘培成', '', '2', '');
INSERT INTO `web_workman` VALUES ('74', '009', '龙春', '', '2', '');
INSERT INTO `web_workman` VALUES ('75', '010', '李静', '', '2', '');
INSERT INTO `web_workman` VALUES ('76', '011', '付应芳', '', '2', '');
INSERT INTO `web_workman` VALUES ('77', '012', '任雪', '', '2', '');
INSERT INTO `web_workman` VALUES ('78', '013', '刘文华', '16年5月入职', '2', '');
INSERT INTO `web_workman` VALUES ('79', '014', '龙云', '17年2月入职', '2', '');
INSERT INTO `web_workman` VALUES ('80', '015', '张宗宝', '2018.4.17日基本工资涨200元 原500 现在700元 17年3月开始计算工龄', '2', '');
INSERT INTO `web_workman` VALUES ('81', '016', '郭全威', '', '2', '');
INSERT INTO `web_workman` VALUES ('82', '017', '刘培艳', '', '2', '');
INSERT INTO `web_workman` VALUES ('83', '018', '王锦銮', '', '2', '');
INSERT INTO `web_workman` VALUES ('84', '019', '刘霞', '', '2', '');
INSERT INTO `web_workman` VALUES ('85', '020', '宗广涛', '', '2', '');
INSERT INTO `web_workman` VALUES ('86', '021', '刘培龙', '', '2', '');
INSERT INTO `web_workman` VALUES ('87', '022', '李大勇', '2019.10.29开始为正式员工 基本工资1000元', '2', '');
INSERT INTO `web_workman` VALUES ('88', '023', '王思钜', '', '2', '');
INSERT INTO `web_workman` VALUES ('89', '024', '马志文', '', '2', '');
INSERT INTO `web_workman` VALUES ('90', '025', '王晓霞', '', '2', '');
INSERT INTO `web_workman` VALUES ('91', '026', '李修永', '2018.12月入职', '2', '');
INSERT INTO `web_workman` VALUES ('92', '027', '姚兴城', '19年3月8日入职', '2', '');
INSERT INTO `web_workman` VALUES ('93', '028', '魏敏', '2019.04.12入职', '2', '');
INSERT INTO `web_workman` VALUES ('94', '029', '王福文', '2019.09.12', '2', '');
INSERT INTO `web_workman` VALUES ('95', '030', '王思云', '2020.03.25', '2', '');
INSERT INTO `web_workman` VALUES ('96', '031', '刘培玲', '2019.09.12', '2', '');
INSERT INTO `web_workman` VALUES ('97', '032', '李飞', '2019.11.14日入职  中专毕业 23岁', '2', '');
INSERT INTO `web_workman` VALUES ('98', '033', '葛建华', '2019.11月入职', '2', '');
INSERT INTO `web_workman` VALUES ('99', '034', '于茂法', '2020.01月入职', '2', '');
INSERT INTO `web_workman` VALUES ('100', '035', '梁昌云', '2020.01月入职', '2', '');
INSERT INTO `web_workman` VALUES ('101', '036', '师学武', '2020.04入职', '2', '');
INSERT INTO `web_workman` VALUES ('102', '037', '张荣德', '2020.04入职', '2', '');
INSERT INTO `web_workman` VALUES ('103', '038', '赵玲', '2020.04入职', '2', '');
INSERT INTO `web_workman` VALUES ('104', '039', '朱茂正', '2020.07.16 入职', '2', '');
INSERT INTO `web_workman` VALUES ('105', '040', '刘春江', '', '2', '');
INSERT INTO `web_workman` VALUES ('106', '041', '孟庆英', '', '2', '');
INSERT INTO `web_workman` VALUES ('107', '042', '刘宇', '', '2', '');
INSERT INTO `web_workman` VALUES ('108', '043', '龙浩', '', '2', '');
INSERT INTO `web_workman` VALUES ('109', '044', '李西花', '', '2', '');
INSERT INTO `web_workman` VALUES ('110', '045', '武丽', '', '2', '');
INSERT INTO `web_workman` VALUES ('111', '046', '倪登荣', '', '2', '');
INSERT INTO `web_workman` VALUES ('112', '047', '刘慎云', '', '2', '');
INSERT INTO `web_workman` VALUES ('113', '048', '赵克云', '', '2', '');
INSERT INTO `web_workman` VALUES ('114', '049', '孙志源', '', '2', '');
INSERT INTO `web_workman` VALUES ('115', '050', '马振美 ', '', '2', '');
INSERT INTO `web_workman` VALUES ('116', '051', '郝兆菊', '', '2', '');
INSERT INTO `web_workman` VALUES ('117', '052', '刘培文', '入职生产主管2020.10月', '2', '');
INSERT INTO `web_workman` VALUES ('118', '053', '刘培军', '', '2', '');
INSERT INTO `web_workman` VALUES ('119', '054', '董文征', '', '2', '');
INSERT INTO `web_workman` VALUES ('120', '53', '齐广德', '2020.11入职', '2', '');

-- ----------------------------
-- Table structure for `web_workstate`
-- ----------------------------
DROP TABLE IF EXISTS `web_workstate`;
CREATE TABLE `web_workstate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of web_workstate
-- ----------------------------
INSERT INTO `web_workstate` VALUES ('1', '0');
