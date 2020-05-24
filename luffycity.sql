/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 80011
Source Host           : localhost:3306
Source Database       : luffycity

Target Server Type    : MYSQL
Target Server Version : 80011
File Encoding         : 65001

Date: 2020-05-24 09:51:35
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account_account`
-- ----------------------------
DROP TABLE IF EXISTS `account_account`;
CREATE TABLE `account_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `balance` int(11) NOT NULL,
  `identity` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `telephone` (`telephone`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_account
-- ----------------------------
INSERT INTO `account_account` VALUES ('1', 'pbkdf2_sha256$180000$ff069qbE3V4x$YKnUaR4L5MCc5V7cFTh++p4eDMXR+ZJ72lbEuve61BU=', '2020-05-19 03:11:41.892968', '1', 'Alex', '', '', '', '1', '1', '2020-05-09 07:37:08.000000', 'avatars/default.png', null, '0', '1');
INSERT INTO `account_account` VALUES ('2', 'pbkdf2_sha256$180000$ff069qbE3V4x$YKnUaR4L5MCc5V7cFTh++p4eDMXR+ZJ72lbEuve61BU=', '2020-05-19 10:39:06.236136', '0', 'koking', '', '', '', '0', '1', '2020-05-14 09:48:25.000000', 'avatars/icon22x.png', null, '0', '3');
INSERT INTO `account_account` VALUES ('3', 'pbkdf2_sha256$180000$ff069qbE3V4x$YKnUaR4L5MCc5V7cFTh++p4eDMXR+ZJ72lbEuve61BU=', '2020-05-19 10:51:55.552976', '0', 'wupeiqi', '', '', '', '0', '1', '2020-05-14 10:03:01.000000', 'avatars/default.png', '987654321', '0', '2');
INSERT INTO `account_account` VALUES ('5', 'pbkdf2_sha256$180000$vmMB2jdkIY6n$nI9qEcdVamGDKOtZ74v4ooQPqzvrjnRFw1IWRfNDVz4=', null, '0', 'testRegister', '', '', '', '0', '1', '2020-05-16 15:09:51.457740', 'avatars/default.png', null, '0', '3');
INSERT INTO `account_account` VALUES ('6', 'pbkdf2_sha256$180000$yU3j9WyOSCIh$85SYVNeQcK1mIO0ulFFL/JSu7amyvOvhZ7z2QvedGtY=', null, '0', 'test', '', '', '', '0', '1', '2020-05-17 07:16:28.175079', 'avatars/default.png', null, '0', '3');
INSERT INTO `account_account` VALUES ('11', 'pbkdf2_sha256$180000$klHNBvjhNJHO$RcavgY7IXT/pUNa7SP0yDzZSQIaDiytOyy+OSNa9j8c=', '2020-05-17 07:28:39.223976', '0', '123', '', '', '', '0', '1', '2020-05-17 07:28:29.854211', 'avatars/default.png', null, '0', '3');

-- ----------------------------
-- Table structure for `account_account_groups`
-- ----------------------------
DROP TABLE IF EXISTS `account_account_groups`;
CREATE TABLE `account_account_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Account_account_groups_account_id_group_id_4c100dc3_uniq` (`account_id`,`group_id`),
  KEY `Account_account_groups_group_id_030b5a34_fk_auth_group_id` (`group_id`),
  CONSTRAINT `Account_account_groups_account_id_b0fc2369_fk_Account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `Account_account_groups_group_id_030b5a34_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_account_groups
-- ----------------------------

-- ----------------------------
-- Table structure for `account_account_user_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `account_account_user_permissions`;
CREATE TABLE `account_account_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Account_account_user_per_account_id_permission_id_50e554d8_uniq` (`account_id`,`permission_id`),
  KEY `Account_account_user_permission_id_42457f05_fk_auth_perm` (`permission_id`),
  CONSTRAINT `Account_account_user_account_id_be7a8af7_fk_Account_a` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `Account_account_user_permission_id_42457f05_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_account_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for `account_manager`
-- ----------------------------
DROP TABLE IF EXISTS `account_manager`;
CREATE TABLE `account_manager` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(32) NOT NULL,
  `manager_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manager_id` (`manager_id`),
  CONSTRAINT `Account_manager_manager_id_efcfec02_fk_Account_account_id` FOREIGN KEY (`manager_id`) REFERENCES `account_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_manager
-- ----------------------------

-- ----------------------------
-- Table structure for `account_student`
-- ----------------------------
DROP TABLE IF EXISTS `account_student`;
CREATE TABLE `account_student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `QQ` varchar(32) DEFAULT NULL,
  `telephone` varchar(32) DEFAULT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `student_id` (`student_id`),
  KEY `Account_student_teacher_id_b1a8c947_fk_Account_teacher_id` (`teacher_id`),
  CONSTRAINT `Account_student_student_id_d1d4482f_fk_Account_account_id` FOREIGN KEY (`student_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `Account_student_teacher_id_b1a8c947_fk_Account_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `account_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_student
-- ----------------------------
INSERT INTO `account_student` VALUES ('2', '2426671397', '18812649207', '2', '1');
INSERT INTO `account_student` VALUES ('3', null, null, '5', null);
INSERT INTO `account_student` VALUES ('4', null, null, '6', null);
INSERT INTO `account_student` VALUES ('6', null, null, '11', '1');

-- ----------------------------
-- Table structure for `account_student_completesection`
-- ----------------------------
DROP TABLE IF EXISTS `account_student_completesection`;
CREATE TABLE `account_student_completesection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `coursesection_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Account_student_complete_student_id_coursesection_75badf55_uniq` (`student_id`,`coursesection_id`),
  KEY `Account_student_comp_coursesection_id_f3a43b3c_fk_Course_co` (`coursesection_id`),
  CONSTRAINT `Account_student_comp_coursesection_id_f3a43b3c_fk_Course_co` FOREIGN KEY (`coursesection_id`) REFERENCES `course_coursesection` (`id`),
  CONSTRAINT `Account_student_comp_student_id_4e8f961c_fk_Account_s` FOREIGN KEY (`student_id`) REFERENCES `account_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_student_completesection
-- ----------------------------
INSERT INTO `account_student_completesection` VALUES ('1', '2', '1');
INSERT INTO `account_student_completesection` VALUES ('2', '2', '2');
INSERT INTO `account_student_completesection` VALUES ('3', '2', '3');
INSERT INTO `account_student_completesection` VALUES ('4', '2', '4');
INSERT INTO `account_student_completesection` VALUES ('5', '2', '5');
INSERT INTO `account_student_completesection` VALUES ('6', '2', '6');
INSERT INTO `account_student_completesection` VALUES ('7', '2', '7');
INSERT INTO `account_student_completesection` VALUES ('8', '6', '1');

-- ----------------------------
-- Table structure for `account_student_courses`
-- ----------------------------
DROP TABLE IF EXISTS `account_student_courses`;
CREATE TABLE `account_student_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) NOT NULL,
  `employmentcourse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Account_student_courses_student_id_employmentcou_655d454d_uniq` (`student_id`,`employmentcourse_id`),
  KEY `Account_student_cour_employmentcourse_id_2f87f974_fk_Course_em` (`employmentcourse_id`),
  CONSTRAINT `Account_student_cour_employmentcourse_id_2f87f974_fk_Course_em` FOREIGN KEY (`employmentcourse_id`) REFERENCES `course_employmentcourse` (`id`),
  CONSTRAINT `Account_student_cour_student_id_faec780a_fk_Account_s` FOREIGN KEY (`student_id`) REFERENCES `account_student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_student_courses
-- ----------------------------
INSERT INTO `account_student_courses` VALUES ('1', '2', '1');
INSERT INTO `account_student_courses` VALUES ('2', '6', '1');

-- ----------------------------
-- Table structure for `account_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `account_teacher`;
CREATE TABLE `account_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `telephone` varchar(32) NOT NULL,
  `remark` longtext,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `teacher_id` (`teacher_id`),
  CONSTRAINT `Account_teacher_teacher_id_60d2efc2_fk_Account_account_id` FOREIGN KEY (`teacher_id`) REFERENCES `account_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_teacher
-- ----------------------------
INSERT INTO `account_teacher` VALUES ('1', '123456', '', '3');

-- ----------------------------
-- Table structure for `auth_group`
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('5', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('8', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('9', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('11', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('12', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can view content type', '4', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('17', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('20', 'Can view session', '5', 'view_session');
INSERT INTO `auth_permission` VALUES ('21', 'Can add category', '6', 'add_category');
INSERT INTO `auth_permission` VALUES ('22', 'Can change category', '6', 'change_category');
INSERT INTO `auth_permission` VALUES ('23', 'Can delete category', '6', 'delete_category');
INSERT INTO `auth_permission` VALUES ('24', 'Can view category', '6', 'view_category');
INSERT INTO `auth_permission` VALUES ('25', 'Can add course chapter', '7', 'add_coursechapter');
INSERT INTO `auth_permission` VALUES ('26', 'Can change course chapter', '7', 'change_coursechapter');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete course chapter', '7', 'delete_coursechapter');
INSERT INTO `auth_permission` VALUES ('28', 'Can view course chapter', '7', 'view_coursechapter');
INSERT INTO `auth_permission` VALUES ('29', 'Can add course detail', '8', 'add_coursedetail');
INSERT INTO `auth_permission` VALUES ('30', 'Can change course detail', '8', 'change_coursedetail');
INSERT INTO `auth_permission` VALUES ('31', 'Can delete course detail', '8', 'delete_coursedetail');
INSERT INTO `auth_permission` VALUES ('32', 'Can view course detail', '8', 'view_coursedetail');
INSERT INTO `auth_permission` VALUES ('33', 'Can add teacher', '9', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('34', 'Can change teacher', '9', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('35', 'Can delete teacher', '9', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('36', 'Can view teacher', '9', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('37', 'Can add practical course', '10', 'add_practicalcourse');
INSERT INTO `auth_permission` VALUES ('38', 'Can change practical course', '10', 'change_practicalcourse');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete practical course', '10', 'delete_practicalcourse');
INSERT INTO `auth_permission` VALUES ('40', 'Can view practical course', '10', 'view_practicalcourse');
INSERT INTO `auth_permission` VALUES ('41', 'Can add free course', '11', 'add_freecourse');
INSERT INTO `auth_permission` VALUES ('42', 'Can change free course', '11', 'change_freecourse');
INSERT INTO `auth_permission` VALUES ('43', 'Can delete free course', '11', 'delete_freecourse');
INSERT INTO `auth_permission` VALUES ('44', 'Can view free course', '11', 'view_freecourse');
INSERT INTO `auth_permission` VALUES ('45', 'Can add course section', '12', 'add_coursesection');
INSERT INTO `auth_permission` VALUES ('46', 'Can change course section', '12', 'change_coursesection');
INSERT INTO `auth_permission` VALUES ('47', 'Can delete course section', '12', 'delete_coursesection');
INSERT INTO `auth_permission` VALUES ('48', 'Can view course section', '12', 'view_coursesection');
INSERT INTO `auth_permission` VALUES ('49', 'Can add go learn', '13', 'add_golearn');
INSERT INTO `auth_permission` VALUES ('50', 'Can change go learn', '13', 'change_golearn');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete go learn', '13', 'delete_golearn');
INSERT INTO `auth_permission` VALUES ('52', 'Can view go learn', '13', 'view_golearn');
INSERT INTO `auth_permission` VALUES ('53', 'Can add classes', '14', 'add_classes');
INSERT INTO `auth_permission` VALUES ('54', 'Can change classes', '14', 'change_classes');
INSERT INTO `auth_permission` VALUES ('55', 'Can delete classes', '14', 'delete_classes');
INSERT INTO `auth_permission` VALUES ('56', 'Can view classes', '14', 'view_classes');
INSERT INTO `auth_permission` VALUES ('57', 'Can add user', '15', 'add_account');
INSERT INTO `auth_permission` VALUES ('58', 'Can change user', '15', 'change_account');
INSERT INTO `auth_permission` VALUES ('59', 'Can delete user', '15', 'delete_account');
INSERT INTO `auth_permission` VALUES ('60', 'Can view user', '15', 'view_account');
INSERT INTO `auth_permission` VALUES ('61', 'Can add task', '16', 'add_task');
INSERT INTO `auth_permission` VALUES ('62', 'Can change task', '16', 'change_task');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete task', '16', 'delete_task');
INSERT INTO `auth_permission` VALUES ('64', 'Can view task', '16', 'view_task');
INSERT INTO `auth_permission` VALUES ('65', 'Can add student', '17', 'add_student');
INSERT INTO `auth_permission` VALUES ('66', 'Can change student', '17', 'change_student');
INSERT INTO `auth_permission` VALUES ('67', 'Can delete student', '17', 'delete_student');
INSERT INTO `auth_permission` VALUES ('68', 'Can view student', '17', 'view_student');
INSERT INTO `auth_permission` VALUES ('69', 'Can add employment course', '18', 'add_employmentcourse');
INSERT INTO `auth_permission` VALUES ('70', 'Can change employment course', '18', 'change_employmentcourse');
INSERT INTO `auth_permission` VALUES ('71', 'Can delete employment course', '18', 'delete_employmentcourse');
INSERT INTO `auth_permission` VALUES ('72', 'Can view employment course', '18', 'view_employmentcourse');
INSERT INTO `auth_permission` VALUES ('73', 'Can add module', '19', 'add_module');
INSERT INTO `auth_permission` VALUES ('74', 'Can change module', '19', 'change_module');
INSERT INTO `auth_permission` VALUES ('75', 'Can delete module', '19', 'delete_module');
INSERT INTO `auth_permission` VALUES ('76', 'Can view module', '19', 'view_module');
INSERT INTO `auth_permission` VALUES ('77', 'Can add teacher', '20', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('78', 'Can change teacher', '20', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('79', 'Can delete teacher', '20', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('80', 'Can view teacher', '20', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('81', 'Can add question', '21', 'add_question');
INSERT INTO `auth_permission` VALUES ('82', 'Can change question', '21', 'change_question');
INSERT INTO `auth_permission` VALUES ('83', 'Can delete question', '21', 'delete_question');
INSERT INTO `auth_permission` VALUES ('84', 'Can view question', '21', 'view_question');
INSERT INTO `auth_permission` VALUES ('85', 'Can add task', '22', 'add_task');
INSERT INTO `auth_permission` VALUES ('86', 'Can change task', '22', 'change_task');
INSERT INTO `auth_permission` VALUES ('87', 'Can delete task', '22', 'delete_task');
INSERT INTO `auth_permission` VALUES ('88', 'Can view task', '22', 'view_task');
INSERT INTO `auth_permission` VALUES ('89', 'Can add shopping car', '23', 'add_shoppingcar');
INSERT INTO `auth_permission` VALUES ('90', 'Can change shopping car', '23', 'change_shoppingcar');
INSERT INTO `auth_permission` VALUES ('91', 'Can delete shopping car', '23', 'delete_shoppingcar');
INSERT INTO `auth_permission` VALUES ('92', 'Can view shopping car', '23', 'view_shoppingcar');
INSERT INTO `auth_permission` VALUES ('93', 'Can add department', '24', 'add_department');
INSERT INTO `auth_permission` VALUES ('94', 'Can change department', '24', 'change_department');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete department', '24', 'delete_department');
INSERT INTO `auth_permission` VALUES ('96', 'Can view department', '24', 'view_department');
INSERT INTO `auth_permission` VALUES ('97', 'Can add menu', '25', 'add_menu');
INSERT INTO `auth_permission` VALUES ('98', 'Can change menu', '25', 'change_menu');
INSERT INTO `auth_permission` VALUES ('99', 'Can delete menu', '25', 'delete_menu');
INSERT INTO `auth_permission` VALUES ('100', 'Can view menu', '25', 'view_menu');
INSERT INTO `auth_permission` VALUES ('101', 'Can add permission', '26', 'add_permission');
INSERT INTO `auth_permission` VALUES ('102', 'Can change permission', '26', 'change_permission');
INSERT INTO `auth_permission` VALUES ('103', 'Can delete permission', '26', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('104', 'Can view permission', '26', 'view_permission');
INSERT INTO `auth_permission` VALUES ('105', 'Can add rbac user info', '27', 'add_rbacuserinfo');
INSERT INTO `auth_permission` VALUES ('106', 'Can change rbac user info', '27', 'change_rbacuserinfo');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete rbac user info', '27', 'delete_rbacuserinfo');
INSERT INTO `auth_permission` VALUES ('108', 'Can view rbac user info', '27', 'view_rbacuserinfo');
INSERT INTO `auth_permission` VALUES ('109', 'Can add role', '28', 'add_role');
INSERT INTO `auth_permission` VALUES ('110', 'Can change role', '28', 'change_role');
INSERT INTO `auth_permission` VALUES ('111', 'Can delete role', '28', 'delete_role');
INSERT INTO `auth_permission` VALUES ('112', 'Can view role', '28', 'view_role');
INSERT INTO `auth_permission` VALUES ('113', 'Can add team', '29', 'add_team');
INSERT INTO `auth_permission` VALUES ('114', 'Can change team', '29', 'change_team');
INSERT INTO `auth_permission` VALUES ('115', 'Can delete team', '29', 'delete_team');
INSERT INTO `auth_permission` VALUES ('116', 'Can view team', '29', 'view_team');
INSERT INTO `auth_permission` VALUES ('117', 'Can add score record', '30', 'add_scorerecord');
INSERT INTO `auth_permission` VALUES ('118', 'Can change score record', '30', 'change_scorerecord');
INSERT INTO `auth_permission` VALUES ('119', 'Can delete score record', '30', 'delete_scorerecord');
INSERT INTO `auth_permission` VALUES ('120', 'Can view score record', '30', 'view_scorerecord');
INSERT INTO `auth_permission` VALUES ('121', 'Can add attendance', '31', 'add_attendance');
INSERT INTO `auth_permission` VALUES ('122', 'Can change attendance', '31', 'change_attendance');
INSERT INTO `auth_permission` VALUES ('123', 'Can delete attendance', '31', 'delete_attendance');
INSERT INTO `auth_permission` VALUES ('124', 'Can view attendance', '31', 'view_attendance');
INSERT INTO `auth_permission` VALUES ('125', 'Can add manager', '32', 'add_manager');
INSERT INTO `auth_permission` VALUES ('126', 'Can change manager', '32', 'change_manager');
INSERT INTO `auth_permission` VALUES ('127', 'Can delete manager', '32', 'delete_manager');
INSERT INTO `auth_permission` VALUES ('128', 'Can view manager', '32', 'view_manager');

-- ----------------------------
-- Table structure for `classroom_question`
-- ----------------------------
DROP TABLE IF EXISTS `classroom_question`;
CREATE TABLE `classroom_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `content` longtext NOT NULL,
  `environment` varchar(255) NOT NULL,
  `state` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `situation` int(11) NOT NULL,
  `solve` longtext,
  PRIMARY KEY (`id`),
  KEY `Classroom_question_student_id_5d2cc9f6` (`student_id`),
  KEY `Classroom_question_teacher_id_c1622c4f` (`teacher_id`),
  CONSTRAINT `Classroom_question_student_id_5d2cc9f6_fk_Account_student_id` FOREIGN KEY (`student_id`) REFERENCES `account_student` (`id`),
  CONSTRAINT `Classroom_question_teacher_id_c1622c4f_fk_Account_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `account_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom_question
-- ----------------------------
INSERT INTO `classroom_question` VALUES ('1', 'title', 'content', 'Windows', '0', '2', '1', '1', '');
INSERT INTO `classroom_question` VALUES ('4', 'sklearn逻辑回归', 'sklearn逻辑回归 Content', 'Windows', '0', '2', '1', '2', '');

-- ----------------------------
-- Table structure for `classroom_task`
-- ----------------------------
DROP TABLE IF EXISTS `classroom_task`;
CREATE TABLE `classroom_task` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file` varchar(100) NOT NULL,
  `date` datetime(6) NOT NULL,
  `achievement` int(11) DEFAULT NULL,
  `comment` longtext,
  `student_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Classroom_task_student_id_ba4c31c7_fk_Account_account_id` (`student_id`),
  KEY `Classroom_task_chapter_id_45ebe2d1_fk_Course_coursechapter_id` (`chapter_id`),
  KEY `Classroom_task_teacher_id_9cb1307f_fk_Account_teacher_id` (`teacher_id`),
  CONSTRAINT `Classroom_task_chapter_id_45ebe2d1_fk_Course_coursechapter_id` FOREIGN KEY (`chapter_id`) REFERENCES `course_coursechapter` (`id`),
  CONSTRAINT `Classroom_task_student_id_ba4c31c7_fk_Account_account_id` FOREIGN KEY (`student_id`) REFERENCES `account_account` (`id`),
  CONSTRAINT `Classroom_task_teacher_id_9cb1307f_fk_Account_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `account_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of classroom_task
-- ----------------------------
INSERT INTO `classroom_task` VALUES ('1', 'media/task/轰炸脚本.vbs', '2020-05-16 00:42:44.000000', '90', 'good', '2', '1', '41', '1');
INSERT INTO `classroom_task` VALUES ('2', 'media/task/redis-server.exe', '2020-05-18 06:35:39.000000', null, '', '2', '1', '6', '0');
INSERT INTO `classroom_task` VALUES ('3', 'media/task/redis-benchmark.pdb', '2020-05-18 06:36:03.000000', null, '', '2', '1', '7', '0');

-- ----------------------------
-- Table structure for `course_category`
-- ----------------------------
DROP TABLE IF EXISTS `course_category`;
CREATE TABLE `course_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) NOT NULL,
  `categoryType` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_category
-- ----------------------------
INSERT INTO `course_category` VALUES ('1', 'python开发', '0');
INSERT INTO `course_category` VALUES ('2', 'Linux云计算', '0');
INSERT INTO `course_category` VALUES ('3', 'web前端', '0');
INSERT INTO `course_category` VALUES ('4', 'Java', '0');
INSERT INTO `course_category` VALUES ('5', 'Go语言&C语言', '0');
INSERT INTO `course_category` VALUES ('6', 'Python开发', '1');
INSERT INTO `course_category` VALUES ('7', 'Linux云计算', '1');
INSERT INTO `course_category` VALUES ('8', 'Web前端', '1');
INSERT INTO `course_category` VALUES ('9', 'Go语言', '1');
INSERT INTO `course_category` VALUES ('10', '机器学习&数据分析', '1');
INSERT INTO `course_category` VALUES ('11', 'Java&网络安全', '1');
INSERT INTO `course_category` VALUES ('12', '技术生涯', '1');

-- ----------------------------
-- Table structure for `course_coursechapter`
-- ----------------------------
DROP TABLE IF EXISTS `course_coursechapter`;
CREATE TABLE `course_coursechapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chapter` smallint(6) NOT NULL,
  `title` varchar(32) NOT NULL,
  `homeworkContent` longtext,
  `homeworkTitle` varchar(32) DEFAULT NULL,
  `homeworkPrice` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_coursechapter
-- ----------------------------
INSERT INTO `course_coursechapter` VALUES ('1', '1', '基本语法', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('2', '2', '数据类型&文件操作', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('3', '3', '函数编程', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('4', '1', 'Windows下双版本Python环境安装', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('5', '1', '评判算法的优劣标准有哪些', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('6', '2', '8大排序&查找算法', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('7', '1', '计算机硬件', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('8', '2', '网络基础', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('9', '1', 'BOM', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('10', '2', 'DOM', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('11', '1', 'Java基础', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('12', '2', 'Java进阶', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('13', '3', '方法', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('14', '1', 'Go语言', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('15', '1', '用户认证模块开发', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('16', '2', '项目管理模块开发', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('17', '3', 'Wiki&文件管理模块开发', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('18', '4', '问题管理模块开发', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('19', '5', '数据统计&支付功能', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('20', '1', 'Zabbix快速上手', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('21', '2', '自定义邮件,微信报警,实现grafana画图', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('22', '3', '自定义监控模版来监控nginx/redis/pv/uv等服务', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('23', '4', '通过自动发现自动添加监控主机', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('24', '5', 'Zabbix高级技能进阶', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('25', '1', 'Vue源码解析', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('26', '1', 'pow', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('27', '2', 'pos', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('28', '1', 'AI时代人工智能入学指南', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('29', '2', '机器学习入门篇', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('30', '3', '机器学习提升篇', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('31', '1', 'Web应用程序安全与风险', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('32', '2', 'Web 请求流程与Http方法剖析', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('33', '3', '安全攻防环境搭建', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('34', '4', 'Kail之MSF渗透测试实战演练', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('35', '5', '渗透测试之漏洞信息收集', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('36', '1', '网管到CEO的10年逆袭之路', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('37', '1', 'Python基础语法入门', '作业：双色球选购\r\n1 双色球（假设一共八个球，6个红球，球号1-32、2个蓝球，球号1-16）\r\n2 确保用户不能重复选择，不能超出范围\r\n3 用户输入有误时有相应的错误提示\r\n4 最后展示用户选择的双色球的号码\r\n效果图：双色球作业展示\r\n升级需求：\r\n1 一个while循环', '双色球选购', '300');
INSERT INTO `course_coursechapter` VALUES ('38', '2', '数据类型&文件操作', '数据结构：\r\n\r\nmenu = {\r\n    \'北京\':{\r\n        \'海淀\':{\r\n            \'五道口\':{\r\n                \'soho\':{},\r\n                \'网易\':{},\r\n                \'google\':{}\r\n            },\r\n            \'中关村\':{\r\n                \'爱奇艺\':{},\r\n                \'汽车之家\':{},\r\n                \'youku\':{},\r\n            },\r\n            \'上地\':{\r\n                \'百度\':{},\r\n            },\r\n        },\r\n        \'昌平\':{\r\n            \'沙河\':{\r\n                \'老男孩\':{},\r\n                \'北航\':{},\r\n            },\r\n            \'天通苑\':{},\r\n            \'回龙观\':{},\r\n        },\r\n        \'朝阳\':{},\r\n        \'东城\':{},\r\n    },\r\n    \'上海\':{\r\n        \'闵行\':{\r\n            \"人民广场\":{\r\n                \'炸鸡店\':{}\r\n            }\r\n        },\r\n        \'闸北\':{\r\n            \'火车站\':{\r\n                \'携程\':{}\r\n            }\r\n        },\r\n        \'浦东\':{},\r\n    },\r\n    \'山东\':{},\r\n}\r\n\r\n需求：\r\n可依次选择进入各子菜单\r\n可从任意一层往回退到上一层\r\n可从任意一层退出程序\r\n所需新知识点：列表、字典\r\n作业效果展示：\r\n三级菜单效果展示', '三级菜单', '300');
INSERT INTO `course_coursechapter` VALUES ('39', '3', '股票查询程序讲解', '1 程序启动后，给用户提供查询接口，允许用户重复查股票行情信息(用到循环)\r\n2 允许用户通过模糊查询股票名，比如输入“啤酒”, 就把所有股票名称中包含“啤酒”的信息打印出来\r\n3 允许按股票价格、涨跌幅、换手率这几列来筛选信息，\r\n     比如输入“价格>50”则把价格大于50的股票都打印，输入“市盈率<50“，则把市盈率小于50的股票都打印，不用判断等于。\r\n\r\nstock_data.txt 此文件请从课件中下载。\r\n思路提示：加载文件内容到内存，转成dict or list结构，然后对dict or list 进行查询等操作。 这样以后就不用每查一次就要打开一次文件了，效率会高。\r\n效果展示图片：\r\n实现基本功能90%\r\n1 满足作业需求的1、2、3\r\n编码规范需求：10%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n4. 程序的说明文档必须包含的内容：程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', '股票信息查询程序', '500');
INSERT INTO `course_coursechapter` VALUES ('40', '4', '作业讲解', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('41', '1', '函数编程', '作业详细需求：85%\r\n点击此处\r\n\r\n编码规范需求：15%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n4. 程序的说明文档必须包含的内容：程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', '员工信息查询', '600');
INSERT INTO `course_coursechapter` VALUES ('42', '2', '常用模块', '基本需求 90%\r\n1 统计本日志文件的总pv、uv\r\n2 列出全天每小时的pv、uv数\r\n3 列出top 10 uv的IP地址，以及每个ip的pv点击数\r\n4 列出top 10 访问量最多的页面及每个页面的访问量\r\n5 列出访问来源的设备列表及每个设备的访问量\r\n日志格式说明\r\n注意：网络日志文件在课件中，请先下载课件\r\n\r\n名词解释：\r\npv:page visit , 页面访问量，一次请求就是一次pv\r\nuv: user visit, 独立用户，一个ip就算一个独立用户\r\n编码规范需求：10%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n4. 程序的说明文档必须包含的内容：程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', '网站访问日志分析', '500');
INSERT INTO `course_coursechapter` VALUES ('43', '1', '面向对象', '基础需求：85%\r\n角色：学员、讲师、管理员\r\n要求:\r\n1. 创建北京、上海 2 所学校\r\n2. 创建linux , python , go 3个课程 ， linux\\py 在北京开， go 在上海开\r\n3. 课程包含，周期，价格，通过学校创建课程 \r\n4. 通过学校创建班级， 班级关联课程、讲师\r\n5. 创建学员时，选择学校，关联班级\r\n5. 创建讲师角色时要关联学校\r\n6. 提供三个角色接口\r\n    6.1 学员视图， 可以注册， 交学费， 选择班级\r\n    6.2 讲师视图， 讲师可管理自己的班级， 上课时选择班级， 查看班级学员列表 ， 修改所管理的学员的成绩\r\n    6.3 管理视图，创建讲师， 创建班级，创建课程\r\n7. 上面的操作产生的数据都通过pickle序列化保存到文件里\r\n\r\n编码规范需求：15%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n4. 程序的说明文档必须包含的内容：程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', '开发一套选课系统', '800');
INSERT INTO `course_coursechapter` VALUES ('44', '2', '网络编程', '基础需求：75%\r\n1. 用户加密认证\r\n2. 允许多用户登录\r\n3. 每个用户都有自己的家目录，且只能访问自己的家目录\r\n4. 对用户进行磁盘分配，每一个用户的可用空间可以自己设置\r\n5. 允许用户在ftp server上随意切换目录\r\n6. 允许用户查看自己家目录下的文件\r\n7. 允许用户上传和下载，保证文件的一致性（md5）\r\n8. 文件上传、下载过程中显示进度条\r\n\r\n升级需求：10%\r\n1. 文件支持断点续传\r\n\r\n编码规范需求：15%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n4. 程序的说明文档必须包含的内容：程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', '开发一个支持多用户在线的FTP程序', '1000');
INSERT INTO `course_coursechapter` VALUES ('45', '3', '选课系统作业讲解', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('46', '4', 'FTP项目作业讲解', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('47', '1', '网络编程进阶', '基础需求：75%\r\n1. 用户加密认证\r\n2. 允许多用户登录\r\n3. 每个用户都有自己的家目录，且只能访问自己的家目录\r\n4. 对用户进行磁盘分配，每一个用户的可用空间可以自己设置\r\n5. 允许用户在ftp server上随意切换目录\r\n6. 允许用户查看自己家目录下的文件\r\n7. 允许用户上传和下载，保证文件的一致性（md5）\r\n8. 文件上传、下载过程中显示进度条\r\n9. 支持多并发的功能\r\n10. 使用队列queue模块，实现线程池\r\n11. 允许用户配置最大的并发数，比如允许只有10并发用户\r\n\r\n升级需求：10%\r\n1. 文件支持断点续传\r\n\r\n编码规范需求：15%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n4. 程序的说明文档必须包含的内容：程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', '基于线程开发一个FTP服务器', '500');
INSERT INTO `course_coursechapter` VALUES ('48', '2', 'MySql数据库开发', '自行创建数据，也可以使用课件的表数据来进行做作业', 'MySQL综合练习作业', '600');
INSERT INTO `course_coursechapter` VALUES ('49', '1', 'HTML', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('50', '2', 'CSS', '基础需求：85%\r\n1.熟练运用所学知识还原小米商城官网首页静态页面\r\n2. html页面代码书写规范\r\n3. 程序有相应的目录划分（比如：存放css的文件，存放js的文件）\r\n4. html页面没有不能出现大量的css样式代码\r\n5. 页面的展示效果和小米的首页一样\r\n注意：只需要实现静态页面效果就可以\r\n\r\n编码规范需求：15%\r\n1. 代码有相应的注释\r\n2. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n3. 程序的说明文档必须包含的内容：程序的实现的功能、程序的启动方式、程序的运行效果', '开发”小米商城官网首页”（静态页面）', '600');
INSERT INTO `course_coursechapter` VALUES ('51', '3', 'JavaScript', '基础需求：85%\r\n参考链接http://www.todolist.cn/\r\n1. 将用户输入添加至待办项\r\n2. 可以对todolist进行分类（待办项和已完成组），用户勾选既将待办项分入已完成组，也可以将已完成变成未完成\r\n3. todolist的每一项可删除和编辑\r\n4. 下方有clear按钮，并清空所有todolist项\r\n5. 使用html、css、js、jquery编写\r\n\r\n编码规范需求：15%\r\n1. 代码有相应的注释\r\n2. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n3. 程序的说明文档必须包含的内容：程序的实现的功能、程序的启动方式、程序的运行效果\r\n4. 程序设计的流程图\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', '实现“todolist项目”', '400');
INSERT INTO `course_coursechapter` VALUES ('52', '1', 'Django框架开发', '基础需求：85%\r\n1. 基于ajax和用户认证组件实现登录验证\r\n2. 基于ajax和form组件实现注册功能\r\n3. 系统首页文章列表的渲染\r\n4. 个人站点页面设计\r\n5. 文章详细页的继承\r\n6. 点赞与踩\r\n7. 评论功能\r\n8. 富文本编辑器的使用\r\n9. 防止xss攻击\r\n\r\n编码规范需求：15%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/vueDrfDemo）\r\n4. 程序的说明文档必须包含的内容：程序的开发环境、程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', '开发BBS+BLOG系统', '1000');
INSERT INTO `course_coursechapter` VALUES ('53', '1', 'CRM客户关系管理系统开发', '基础需求：85%\r\n建议：使用pycharm进行开发\r\n1. 开发通用的、可插拔式的增删改查组件，可很容易的嵌入各种django项目\r\n2. 开发通用的、达到对象级别的权限控制组件，且允许用户自定制权限\r\n3. 权限组件支持角色管理，根据业务需求分出销售、学员、讲师角色\r\n4. 允许销售创建、跟进客户信息\r\n5. 允许学员交作业、查成绩\r\n6. 允许老师进行班级点名、批作业\r\n\r\n编码规范需求：15%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n4. 程序的说明文档必须包含的内容：程序的开发环境、程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', 'CRM实战开发及完善', '1500');
INSERT INTO `course_coursechapter` VALUES ('54', '2', '爬虫实战', '基础需求：85%\r\n建议：使用pycharm进行开发\r\n1. 基于Spider或者CrawlSpider进行二手房信息的爬取\r\n2. 本机搭建分布式环境对二手房信息进行爬取\r\n3. 搭建多台机器的分布式环境，多台机器同时进行二手房数据爬取\r\n\r\n编码规范需求：15%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n4. 程序的说明文档必须包含的内容：程序的开发环境、程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', 'scrapy+redis分布式爬取58同城北京全站二手房数据', '300');
INSERT INTO `course_coursechapter` VALUES ('55', '1', '算法&设计模式', '基础需求：85%\r\n1. 实现以下算法并且编写解题报告，解题报告中需要给出题目说明、自己对题目的理解、解题思路、对算法的说明和理解、以及算法复杂度分析等内容\r\n2. 实现冒泡排序、插入排序、快速排序和归并排序\r\n3. 以尽可能多的方法解决2-sum问题并分析其时间复杂度：给定一个列表和一个整数，从列表中找到两个数，使得两数之和等于给定的数，返回两个数的下标。题目保证有且只有一组解\r\n4. 封装一个双链表类，并实现双链表的创建、查找、插入和删除\r\n5. 使用至少一种算法解决迷宫寻路问题\r\n6. 使用动态规划算法实现最长公共子序列问题\r\n\r\n*注：作业要求的数据源在本模块的课件里有，请自行下载\r\n\r\n编码规范需求：15%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/vueDrfDemo）\r\n4. 程序的说明文档必须包含的内容：程序的开发环境、程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', '算法综合作业', '500');
INSERT INTO `course_coursechapter` VALUES ('56', '2', '企业应用工具学习', '基础需求：85%\r\n1. 把之前的CRM项目通过Uwsgi+nginx部署\r\n2. 通过压力测试工具，测试最大并发请求数\r\n3. 并发测试结果请截图交作业\r\n4. 写好readme，确保导师可以很简单的启动您的项目\r\n\r\n编码规范需求：15%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n4. 程序的说明文档必须包含的内容：程序的开发环境、程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', 'CRM项目通过Uwsgi+nginx部署', '500');
INSERT INTO `course_coursechapter` VALUES ('57', '1', 'VUE基础和高级知识点', null, null, null);
INSERT INTO `course_coursechapter` VALUES ('58', '2', '项目实战：在线教育平台开发', '基础需求：85%\r\n1. 前后端完全分离，前端基于Vue框架，后端使用Django, 用restful API交互\r\n2. 前端展示课程，允许用户购买\r\n3. 为学员、导师、管理员分别设计3个平台，互不影响\r\n4. 学员角色功能：\r\n    4.1 注册、登录、购买课程、支付宝接入\r\n    4.2 在线视频播放、评价、提问题、交作业\r\n5. 导师角色功能（可参照crm中的实现方式）：\r\n    5.1 对学员进行跟进、上传批改作业过程、回复学员问题\r\n6. 管理员角色功能（可参照crm中的实现方式）：\r\n    6.1 查看用户注册趋势图、订单量报表\r\n    6.2 增删改查课程\r\n    6.3 为学员分配导师\r\n    6.4 创建、管理资讯文章\r\n    6.5 追踪学员学习进度\r\n    6.6 导师跟进管理\r\n    6.7 订单管理\r\n7. 为主要的功能开发单元测试\r\n\r\n编码规范需求：15%\r\n1. 代码规范遵守pep8 (https://python.org/dev/peps/pep-0008/)\r\n2. 函数有相应的注释\r\n3. 程序有文档说明文件（README.md参考：https://github.com/csrftoken/surveySystem/blob/master/README.md）\r\n4. 程序的说明文档必须包含的内容：程序的开发环境、程序的实现的功能、程序的启动方式、登录用户信息、程序的运行效果\r\n5. 程序设计的流程图：\r\n(可以参考：https://www.processon.com/view/link/589eb841e4b0999184934329)', '路飞学城开发', '2000');
INSERT INTO `course_coursechapter` VALUES ('59', '1', '就业指导&工作推荐', null, null, null);

-- ----------------------------
-- Table structure for `course_coursedetail`
-- ----------------------------
DROP TABLE IF EXISTS `course_coursedetail`;
CREATE TABLE `course_coursedetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `brief` longtext NOT NULL,
  `qqGroup` varchar(11) DEFAULT NULL,
  `number` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_coursedetail
-- ----------------------------
INSERT INTO `course_coursedetail` VALUES ('1', '即使之前你从未写过1行代码，也能在学完本课程后，达到Python入门水平，能开发300-500行代码的小程序，掌握基本的编程思维、软件设计方法。无论你日后想做人工智能、数据分析，还是WEB开发、爬虫、大数据等，都应该先把这部分基础掌握。', '701031800', '87');
INSERT INTO `course_coursedetail` VALUES ('2', '本课程将带你在Windows环境下安装Python 2和Python 3以及介绍pip的用法，并且会引申到工作中的生产环境如何处理Python版本问题', '701031800', '1');
INSERT INTO `course_coursedetail` VALUES ('3', '本课程从最基础的时间、空间复杂度概念入手，深入浅出的讲解常用排序&查找算法，通过本课程的学习，我们希望能帮你建立起算法思维，使你在以后的项目开发中不断思考如何通过更优的算法来提高程序运行效率，且有能力写出适合你业务逻辑的算法程序。', '701031800', '15');
INSERT INTO `course_coursedetail` VALUES ('4', '本课程主要讲解计算机的硬件组成以及网络的基础知识，学完之后在短时间内能够让大家对软硬件以及网络有一个清晰的认识，为进一步学习Linux的相关知识打下坚实的基础。', '738274052', '16');
INSERT INTO `course_coursedetail` VALUES ('5', '几乎每天我们都在网上冲浪，那你知道在浏览器网页上动画效果、滚动效果、浏览器的返回按钮、前进后退等操作是如何完成的呢？这就需要JavaScript中另外两个部分：BOM和DOM。本课程我们讲解BOM和DOM的核心部分，从小白的角度演示每个知识点的用法，让大家感受一下它们在网页上的强大之处。', '345100763', '22');
INSERT INTO `course_coursedetail` VALUES ('6', '这是个针对0基础小白的入门课程，在学完本课程后，可达到Java入门水平，为后面学习web开发、后端开发以及各种流行框架的学习打下坚实的基础。与市面上各种枯燥乏味课程相比，我认为我们这个课还是有点竞争力的。', '345791983', '47');
INSERT INTO `course_coursedetail` VALUES ('7', '这是一个Go语言入门教程，适合有一定编程基础的同学学习，由于Go语言的语法非常简洁。通过本课程的学习你将掌握Go语言的基本语法，特别是Go语言中独特的并发和接口部分的内容。学习完本课程后你将具备独立开发一些简单的后端程序的能力。', '649305390', '26');
INSERT INTO `course_coursedetail` VALUES ('8', '基于django开发的Bug管理平台，为用户提供理想的工作云平台，涵盖了众多企业级功能，便捷的团队协作，轻量的项目管理， 完备的问题系统，大容量的文件存储等，大大提升了工作效率。', '701031800', '250');
INSERT INTO `course_coursedetail` VALUES ('9', 'Zabbix是目前最广泛使用的IT监控软件，可以监视各种系统与设备的参数，实现从网络、系统、应用软件等各业务指标详细的全方位监控。Zabbix使用灵活的告警机制，允许用户为几乎任何事件配置基于邮件、短信、微信的告警，使用户可以快速响应服务器问题。', '738274052', '44');
INSERT INTO `course_coursedetail` VALUES ('10', '这些年来，前端行业一直在飞速发展，行业的进步，导致对从业人员的要求不断攀升。放眼未来，虽然只会某些框架还可以找到工作，但仅仅满足于会用，一定无法走的更远。随着越来越多“聪明又勤奋”的人加入前端行列，能否洞悉前沿框架的设计和实现已经成为高级人才与普通人才的“分水岭”。本课将通过探究Vue.js渲染中变化侦测的实现原理，来解读GitHub上最流行Web框架Vue.js源码背后的思想，让你亲身体验从“知其然”到“知其所以然”的蜕变！', '345100763', '7');
INSERT INTO `course_coursedetail` VALUES ('11', 'BOSS直聘数据显示,区块链自2018年起成为行业最大风口,风头几平盖过人工智能,区块链相关岗位需求激增,平均招聘薪资达到25K。区块链因比特币而火起来的,但其更大的前景是在企业级应用,很多知名企业都在发力区块链技术的应用。例如Northern Trust私募基金通过区块链技术不断提升复杂私募基金交易的明晰度。沃尔玛与食品供应链上的其他成员紧密协作,通过区域链技术提高产品生产流程的可追踪性与透明度邮储银行在资产托管业务场景中,利用区块链技术实现中间环节缩减招商银行深耕于区块链在清算场景下的应用浙商银行通过区块链技术构建“应收链平台”,帮助企业盘活应收账款等等本课程将带领你由浅入深学习区块链,从底层的共识算法到上层的框架应用,再结合相关案例,让学习者理论与实践相结合。不仅掌握理解区块链底层算法,还能基于容器和区块链框架开发资产存管DAPP游戏等实战项目。', '649305390', '22');
INSERT INTO `course_coursedetail` VALUES ('12', '机器学习作为N的核心技术,可谓掌握了机器学习,便跨过了A的准入门门槛。机器学习与人工智能的热潮已经渗透我们的生活。从垃圾邮件分类到银行信货审批;从视频平台广告到房地产价格预测分析;从人机围棋大战到汽车智能驾驶;作为人工智能核心技术的机器学习也成为了技术热点,成为人们热议的话题。那机器学习到底是什么呢?希望通过本门课程,让大家对机器学习的来龙去脉,场景应用,以及自学路径形成较为精确的认识,有助你的学习与工作', '701031800', '180');
INSERT INTO `course_coursedetail` VALUES ('13', '随着全球网络信息技术高速发展,网络安全已成为“国之重器”。“网络安全竞争归根结底是人才的竞争”,而我国网络安全实战型人オ严重匮乏,缺口高达70万。此外,国内Web渗透测试课程缺乏系統化、体系化。作为培训界人才培养的“黄埔军校”,老男孩安全学院有着完备的教学人才培养体系,其中包括:全方位精品课程体系、雄厚的师资团队、安全厂商及企业绿色通道等,助力学员在全面、深入的掌握网络安全知识技能、实现安全专业能力高效进阶的同时,能够顺利进入理想工作,实现网络安全英雄梦', '683286711', '66');
INSERT INTO `course_coursedetail` VALUES ('14', '花了10年时间,我走过了从最底层的网管,到运维、开发、架构师、CTO、CEO的角色,失败教训不少,但也炼就了从多维视角看事情的能力。讲了6年课,之所以受到学生喜欢,是因为在讲课过程中除了技术之外,我总希望把我对生活、人生、工作的一些思考随时的分享给学生,也确实对一些学生产生了影响,帮他们变成了更优秀的人。我始终坚信,一个好的老师,除了知识之外,还要对学生的人生观、价值观产生积极正向的影响今天,我整理了一下最近在线上给学生讲的鸡汤视频,分享给大家,希望除了技术外,能让大家get到一些职业发展、人生规划方向上的新思路。毕竟如果只是战术上勤奋,摸着石头过河般的走人生路有可能走好,但碌碌庸庸的机率怕是更大吧', '701031800', '10');
INSERT INTO `course_coursedetail` VALUES ('15', '人工智能有多火？Google 中国为应届生岗位开出高达 56 万的年薪。计算机视觉、自然语言处理等前沿应用领域更是面临巨大的人才缺口。做为进入人工智能、数据分析领域的必备语言，过去3年里,市场对 Python 开发者的需求呈爆发性增长趋势。\r\n\r\n在这门课程里，你将得到专业导师的逐行代码审阅、反馈，全程高手引路、帮你快速从0基础学习Python编程。24周后，你将掌握数据库、网络编程、WEB开发、爬虫、数据分析等技能，并独立完成数个大型企业实战项目。成为市场上炙手可热的Python全栈开发工程师。', null, '0');
INSERT INTO `course_coursedetail` VALUES ('16', '人工智能有多火？Google 中国为应届生岗位开出高达 56 万的年薪。计算机视觉、自然语言处理等前沿应用领域更是面临巨大的人才缺口。做为进入人工智能、数据分析领域的必备语言，过去3年里,市场对 Python 开发者的需求呈爆发性增长趋势。\r\n\r\n在这门课程里，你将得到专业导师的逐行代码审阅、反馈，全程高手引路、帮你快速从0基础学习Python编程。24周后，你将掌握数据库、网络编程、WEB开发、爬虫、数据分析等技能，并独立完成数个大型企业实战项目。成为市场上炙手可热的Python全栈开发工程师。', null, '0');
INSERT INTO `course_coursedetail` VALUES ('17', '我国Linux市场以年均43.1%的复合增长率高速增长，预计到2021年Linux市场人才需求将超过150万；且Linux运维职位晋升快，3年左右就能升至技术管理岗位年薪25W起；5年以上达到架构师水平年薪突破40W。\r\n\r\n在这门课程里，你将跟随技术大牛，从0开始学习Linux系统原理，常用服务如NfS\\DNS\\FTP\\KVM\\Nginx等的配置与优化、Shell核心编程、Linux WEB集群、Zabbix监控、Mysql数据库知识，掌握成为Linux云计算工程师的必备技能。', null, '0');
INSERT INTO `course_coursedetail` VALUES ('18', '我国Linux市场以年均43.1%的复合增长率高速增长，预计到2021年Linux市场人才需求将超过150万；且Linux运维职位晋升快，3年左右就能升至技术管理岗位年薪25W起；5年以上达到架构师水平年薪突破40W。\r\n\r\n在这门课程里，你将跟随技术大牛，深入学习DevOps相关技术，如持续集成、持续交付、ELK分布式日志分析、Docker容器技术、K8s集群、Openstack云计算、阿里云实战、Mongodb缓存系统、Python自动化开发基础等， 掌握成为专业的Linux运维工程师的必备技能。', null, '0');

-- ----------------------------
-- Table structure for `course_coursedetail_teachers`
-- ----------------------------
DROP TABLE IF EXISTS `course_coursedetail_teachers`;
CREATE TABLE `course_coursedetail_teachers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coursedetail_id` int(11) NOT NULL,
  `teacher_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Course_coursedetail_teac_coursedetail_id_teacher__c98633f6_uniq` (`coursedetail_id`,`teacher_id`),
  KEY `Course_coursedetail__teacher_id_855b3ea0_fk_Course_te` (`teacher_id`),
  CONSTRAINT `Course_coursedetail__coursedetail_id_8781c350_fk_Course_co` FOREIGN KEY (`coursedetail_id`) REFERENCES `course_coursedetail` (`id`),
  CONSTRAINT `Course_coursedetail__teacher_id_855b3ea0_fk_Course_te` FOREIGN KEY (`teacher_id`) REFERENCES `course_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_coursedetail_teachers
-- ----------------------------
INSERT INTO `course_coursedetail_teachers` VALUES ('1', '1', '1');
INSERT INTO `course_coursedetail_teachers` VALUES ('2', '2', '2');
INSERT INTO `course_coursedetail_teachers` VALUES ('3', '3', '3');
INSERT INTO `course_coursedetail_teachers` VALUES ('4', '4', '4');
INSERT INTO `course_coursedetail_teachers` VALUES ('5', '5', '5');
INSERT INTO `course_coursedetail_teachers` VALUES ('6', '6', '6');
INSERT INTO `course_coursedetail_teachers` VALUES ('7', '7', '2');
INSERT INTO `course_coursedetail_teachers` VALUES ('8', '8', '7');
INSERT INTO `course_coursedetail_teachers` VALUES ('9', '9', '8');
INSERT INTO `course_coursedetail_teachers` VALUES ('10', '10', '5');
INSERT INTO `course_coursedetail_teachers` VALUES ('11', '11', '9');
INSERT INTO `course_coursedetail_teachers` VALUES ('12', '12', '10');
INSERT INTO `course_coursedetail_teachers` VALUES ('13', '13', '11');
INSERT INTO `course_coursedetail_teachers` VALUES ('14', '14', '1');
INSERT INTO `course_coursedetail_teachers` VALUES ('15', '15', '1');
INSERT INTO `course_coursedetail_teachers` VALUES ('16', '15', '2');
INSERT INTO `course_coursedetail_teachers` VALUES ('17', '15', '3');
INSERT INTO `course_coursedetail_teachers` VALUES ('18', '15', '5');
INSERT INTO `course_coursedetail_teachers` VALUES ('19', '15', '7');
INSERT INTO `course_coursedetail_teachers` VALUES ('20', '16', '1');
INSERT INTO `course_coursedetail_teachers` VALUES ('22', '16', '3');
INSERT INTO `course_coursedetail_teachers` VALUES ('23', '16', '7');
INSERT INTO `course_coursedetail_teachers` VALUES ('21', '16', '10');
INSERT INTO `course_coursedetail_teachers` VALUES ('24', '17', '12');
INSERT INTO `course_coursedetail_teachers` VALUES ('25', '17', '13');
INSERT INTO `course_coursedetail_teachers` VALUES ('26', '18', '12');
INSERT INTO `course_coursedetail_teachers` VALUES ('27', '18', '13');

-- ----------------------------
-- Table structure for `course_coursesection`
-- ----------------------------
DROP TABLE IF EXISTS `course_coursesection`;
CREATE TABLE `course_coursesection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `freeTrail` tinyint(1) NOT NULL,
  `sectionType` smallint(6) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `videoUrl` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Course_coursesection_chapter_id_553e5bd7_fk_Course_co` (`chapter_id`),
  CONSTRAINT `Course_coursesection_chapter_id_553e5bd7_fk_Course_co` FOREIGN KEY (`chapter_id`) REFERENCES `course_coursechapter` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_coursesection
-- ----------------------------
INSERT INTO `course_coursesection` VALUES ('1', '编程语言是如何演变过来的', '1', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('2', '高级语言的流派V2', '1', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('3', 'Python 发展史及应用领域介绍', '1', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('4', 'Python 版本介绍及优缺点', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('5', '在Windows和Mac上安装Python', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('6', '庄重的写下第一行Python代码', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('7', '选择全宇宙最好用的开发IDE', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('8', '变量的一系列没道德写法', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('9', '用常量骂你老板的方式', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('10', '注释', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('11', '计算机如何区分数字和字符串', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('12', '字符串', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('13', '布尔类型', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('14', '为啥要用列表', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('15', '列表的增删改查', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('16', '读取黑姑娘的输入', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('17', '如何输出好看的文本', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('18', '鸡汤之深圳小事', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('19', '运算符', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('20', '流程控制之if..else', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('21', '程序为何要缩进', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('22', 'if..elif 多分支', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('23', '开发匹配学习成绩的小程序', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('24', '猜随机数小程序开发', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('25', 'while循环', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('26', '打印0到100间的偶数', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('27', 'break and continue语法', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('28', '死循环', '0', '2', '1', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('29', '课前小鸡汤-如何进入挣钱效率高的公司', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('30', '课前小鸡汤-为何要成为复合型人才', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('31', '变量的创建过程和垃圾回收机制', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('32', '变量的指向关系', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('33', '如何判断一个值是不是字符串', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('34', '编程里为何有None值', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('35', '三元运算', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('36', '细讲列表的增删改查', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('37', '列表切片', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('38', '如何实现倒着切片', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('39', '列表循环和排序', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('40', '数据类型元组', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('41', '元组真的不能修改么', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('42', '细讲字符串的各种用法', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('43', '细讲字符串的各种用法2', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('44', '字典为何比列表牛逼', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('45', '创建字典的几种方式', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('46', '字典的删改查操作', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('47', '集合的用途', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('48', '集合的关系运算', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('49', '彻底搞懂二进制', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('50', '字符编码-文字是如何显示的', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('51', '字符编码-中文是如果显示的', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('52', '字符编码-编码的战国时代', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('53', '字符编码-py2 vs py3的编码', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('54', '秒懂16进制', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('55', 'HASH是个什么东西', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('56', '你知道为何dict查询速度极快么', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('57', '用py操作文件', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('58', '文件循环', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('59', '小鸡汤-有钱人的美好你体会不到', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('60', 'file类的其它必会功能', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('61', '混合模式下处理文件', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('62', '用不占内存的方式的修改文件', '0', '2', '2', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('63', '课前鸡汤之清朝是如何灭亡的', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('64', '上章补充-bytes类型', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('65', '上章补充-深浅copy', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('66', '上章补充-编码转换', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('67', '函数的定义及特性', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('68', '函数的默认参数', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('69', '函数的关键参数', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('70', '函数的非固定参数', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('71', '局部变量与全局变量', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('72', '函数传递列表时发生的现象', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('73', '嵌套函数&匿名函数', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('74', '高阶函数', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('75', '牛逼的递归函数', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('76', 'python内置函数详解', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('77', 'python内置函数详解2', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('78', '名称空间NameSpace', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('79', '闭包现象', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('80', '函数进阶-装饰器', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('81', '函数进阶-装饰器原理剖析', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('82', '函数进阶-装饰器终结版', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('83', '列表生成式', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('84', '通过生成器优化循环的效率', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('85', '斐波那契数列与函数生成器', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('86', '用生成器实现并发编程', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('87', '迭代器', '0', '2', '3', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('88', 'Windows下双版本Python环境安装', '1', '2', '4', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('89', '算法基础概念', '1', '2', '5', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('90', '估计算法运行效率', '1', '2', '5', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('91', '简单判断时间复杂度', '1', '2', '5', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('92', '空间复杂度', '0', '2', '5', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('93', '递归', '0', '2', '5', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('94', '汉诺塔介绍及问题', '0', '2', '5', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('95', '顺序查找', '0', '2', '6', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('96', '二分查找介绍', '0', '2', '6', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('97', '二分查找代码', '0', '2', '6', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('98', '二分查找与线性查找的比较', '0', '2', '6', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('99', '排序介绍', '0', '2', '6', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('100', '冒泡排序介绍', '0', '2', '6', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('101', '冒泡排序', '0', '2', '6', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('102', '选择排序', '0', '2', '6', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('103', '插入排序', '0', '2', '6', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('104', '计算机介绍', '1', '2', '7', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('105', 'CPU', '1', '2', '7', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('106', '硬盘', '1', '2', '7', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('107', '内存', '0', '2', '7', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('108', '主板', '0', '2', '7', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('109', '显卡', '0', '2', '7', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('110', '其他', '0', '2', '7', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('111', '操作系统', '0', '2', '7', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('112', '应用软件', '0', '2', '7', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('113', '故障分析', '0', '2', '7', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('114', '网络介绍及分类', '0', '2', '8', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('115', '网络介质及设备', '0', '2', '8', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('116', 'ISO与OSI', '0', '2', '8', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('117', 'OSI七层', '0', '2', '8', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('118', 'IP四层', '0', '2', '8', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('119', 'tcp?udp介绍', '0', '2', '8', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('120', 'BOM对象介绍', '1', '2', '9', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('121', 'window对象的alert,confirm,prompt方法', '1', '2', '9', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('122', '定时器方法', '1', '2', '9', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('123', 'location对象的常用属性介绍', '0', '2', '9', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('124', '如何访问每个查询字符串参数', '0', '2', '9', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('125', '当前浏览器的位置操作', '0', '2', '9', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('126', '如何检测当前浏览器上的插件', '0', '2', '9', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('127', 'history对象的介绍', '0', '2', '9', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('128', '快速认识DOM', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('129', 'DOM中节点中分类', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('130', '获取元素节点对象的方式', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('131', 'setAttribute()和getAttribute()用法', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('132', '节点对象的三个重要属性介绍', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('133', '节点对象的常用属性', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('134', '节点对象属性在各浏览器兼容性处理', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('135', '元素节点对象的增删改查方法', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('136', '样式设置', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('137', '事件介绍和onclick事件', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('138', '鼠标悬浮事件', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('139', '光标聚焦和失焦事件', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('140', '表单控件上内容选中和改变事件', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('141', '窗口加载事件', '0', '2', '10', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('142', '编程语言的发展', '1', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('143', '编程语言的发展_2', '1', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('144', '编程语言的介绍', '1', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('145', '编程语言的分类', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('146', 'java简介', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('147', 'java相关概念', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('148', 'JDK的安装', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('149', '第一个java程序', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('150', 'IDE的安装和使用', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('151', '注释', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('152', '变量和int', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('153', 'double', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('154', 'boolean', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('155', 'String', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('156', '用户输入', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('157', 'if_1', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('158', 'if_2', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('159', 'if_3', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('160', 'while循环', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('161', '第一章作业', '0', '2', '11', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('162', '二进制', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('163', '编码', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('164', '基础数据类型_整数', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('165', '基本数据类型_小数', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('166', '基本数据类型_字符', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('167', '基本数据类型_boolean', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('168', '基本数据类型小结', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('169', '基本数据类型转换', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('170', '基本数据类型计算', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('171', '基本运算符_算数运算', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('172', '基本运算符_赋值扩展运算', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('173', '基本运算符_比较运算', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('174', '基本运算符_逻辑运算', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('175', '一元运算符', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('176', 'switch语句', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('177', 'for循环', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('178', 'do...while', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('179', 'break和continue', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('180', '数组', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('181', '数组的联系', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('182', '作业讲解', '0', '2', '12', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('183', '方法的概述', '0', '2', '13', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('184', '方法的定义', '0', '2', '13', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('185', '方法的返回值', '0', '2', '13', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('186', '方法的参数', '0', '2', '13', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('187', '方法的简单练习', '0', '2', '13', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('188', '方法的重载', '0', '2', '13', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('189', '为什么应该学习Go语言_1', '1', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('190', '安装Go语言开发环境及第一个Go程序', '1', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('191', 'VSCode配置Go语言开发环境小技巧', '1', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('192', 'Go语言基础之语法', '1', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('193', 'Go语言基础之变量和常量', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('194', 'Go语言基础之运算符', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('195', 'Go语言基础之流程控制', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('196', 'Go语言基础之基本数据类型', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('197', 'Go语言基础之数组', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('198', 'Go语言基础之切片', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('199', 'Go语言基础之map', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('200', 'Go语言基础之函数', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('201', 'Go语言基础之匿名函数和闭包', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('202', 'Go语言基础之指针', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('203', '自定义类型和类型别名', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('204', '结构体定义与实例化', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('205', '方法的定义和接收者', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('206', '结构体嵌套', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('207', '结构体字段可见性和JSON', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('208', '学员信息管理系统练习', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('209', 'Go语言中的包', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('210', '接口介绍和使用', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('211', '标准库time包介绍', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('212', '文件操作', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('213', '反射初识', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('214', '结构体反射', '0', '2', '14', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('215', 'sass项目介绍', '1', '2', '15', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('216', 'sass项目演示', '1', '2', '15', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('217', '项目讲解和学习提醒', '1', '2', '15', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('218', '阶段项目涉及知识点', '0', '2', '15', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('219', '今日概要', '0', '2', '16', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('220', '内容回顾', '0', '2', '16', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('221', '注册-用户注册提交ajax', '0', '2', '16', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('222', '注册-数据校验', '0', '2', '16', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('223', '今日概要', '0', '2', '17', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('224', 'wiki表结构设计', '0', '2', '17', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('225', 'wiki开发流程', '0', '2', '17', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('226', 'wiki首页', '0', '2', '17', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('227', '今日概要', '0', '2', '18', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('228', '添加问题时数据初始化', '0', '2', '18', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('229', '创建项目默认创建问题类型', '0', '2', '18', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('230', '王洋的问题', '0', '2', '18', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('231', '今日概要', '0', '2', '19', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('232', 'django时区设置', '0', '2', '19', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('233', '上节bug处理', '0', '2', '19', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('234', '上节bug处理', '0', '2', '19', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('235', 'zabbix的安装', '1', '2', '20', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('236', '为什么需要监控', '1', '2', '20', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('237', '常用的监控命令', '0', '2', '24', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('238', 'zabbix的监控架构', '0', '2', '24', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('239', '自定义触发器表达式', '0', '2', '21', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('240', '自定义触发器表达式进阶', '0', '2', '21', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('241', 'zabbix邮件报警', '0', '2', '21', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('242', '自定义报警信息', '0', '2', '21', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('243', 'zabbix自定义模板', '0', '2', '22', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('244', '使用模板监控nginx服务', '0', '2', '22', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('245', '使用模板监控php-fpm服务', '0', '2', '22', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('246', '使用curl模拟登陆zabbix-web页面', '0', '2', '23', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('247', 'zabbix创建web场景监控', '0', '2', '23', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('248', 'zabbix版本升级', '0', '2', '24', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('249', '安装zabbix-proxy服务', '0', '2', '24', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('250', 'vue的MVVM响应式原理介绍', '1', '2', '25', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('251', '入口函数和编译类Compile实现', '1', '2', '25', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('252', '完整实现编译类Compile', '1', '2', '25', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('253', '实现Observer劫持并监听所有属性', '0', '2', '25', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('254', '实现观察者Watcher和依赖收集器Dep', '0', '2', '25', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('255', '课程介绍', '1', '2', '26', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('256', '基本概念介绍', '1', '2', '26', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('257', '创世区块', '1', '2', '26', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('258', '生成新区块', '0', '2', '26', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('259', 'PoS介绍', '0', '2', '27', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('260', 'PoS案例一（上）', '0', '2', '27', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('261', 'AI时代首选Python', '1', '2', '28', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('262', 'Python我该怎么学', '1', '2', '28', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('263', '人工智能的核心-机器学习', '0', '2', '28', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('264', '机器学习怎么学？', '0', '2', '28', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('265', '线性回归算法概述', '0', '2', '29', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('266', '误差项分析', '0', '2', '29', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('267', '推荐系统：开场', '0', '2', '30', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('268', '推荐系统应用', '0', '2', '30', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('269', 'Web渗透测试概述', '1', '2', '31', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('270', 'Web应用程序的发展历程', '1', '2', '31', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('271', 'Web应用程序安全', '0', '2', '31', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('272', 'HTTP请求与响应', '0', '2', '32', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('273', 'HTTP方法、URL、cookie及状态码', '0', '2', '32', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('274', 'Windows及Kail安装配置', '0', '2', '33', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('275', '22种组合apache、nginx、Lighttpd、tengi', '0', '2', '33', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('276', 'Kail问题解答及MSF初识', '0', '2', '33', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('277', '主域名及二级域名深测', '0', '2', '35', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('278', '7天集训营开班直播', '1', '2', '36', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('279', '技术人员如何度过经济寒冬', '1', '2', '36', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('280', '焦虑改变命运', '0', '2', '36', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('281', 'LuffyX学位课程合同，请认真阅读。', '0', '0', '37', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('282', '路飞导学必看-如何用正确的姿势学习IT技术', '1', '2', '37', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('283', '路飞导学必看-新生40天组队打卡编程挑战赛', '1', '2', '37', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('284', '开班入学必听-Alex大神讲行业前景', '1', '2', '37', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('285', '编程语言是如何演变过来的', '0', '2', '37', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('286', '课前小鸡汤-如何进入挣钱效率高的公司', '0', '2', '38', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('287', '变量的创建过程和垃圾回收机制', '0', '2', '38', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('288', '股票查询程序作业思路讲解', '0', '2', '39', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('289', '三级菜单作业讲解之普通青年版', '0', '2', '40', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('290', '课前鸡汤之清朝是如何灭亡的', '0', '2', '41', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('291', '上章补充-bytes类型', '0', '2', '41', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('292', '互联网公司是30岁求职者的坟墓', '0', '2', '42', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('293', '模块的种类介绍', '0', '2', '42', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('294', '我的失败与梦想(一)', '0', '2', '43', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('295', '编程范式', '0', '2', '43', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('296', '计算机基础', '0', '2', '44', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('297', '什么是网络', '0', '2', '44', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('298', '选课系统作业讲解', '0', '2', '45', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('299', 'FTP项目需求', '0', '2', '46', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('300', 'FTP项目 断点续传功能开发', '0', '2', '46', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('301', '进程与程序的概念', '0', '2', '47', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('302', '操作系统发展史-批处理系统', '0', '2', '47', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('303', 'MySQL-开篇', '0', '2', '48', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('304', 'MySQL简单介绍', '0', '2', '48', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('305', 'HTML的历史发展过程', '0', '2', '49', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('306', '搞懂HTML是什么', '0', '2', '49', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('307', 'CSS的介绍', '0', '2', '50', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('308', '使用css的优势', '0', '2', '50', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('309', 'JavaScript介绍', '0', '2', '51', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('310', '如何在页面中插入Javascript', '0', '2', '51', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('311', 'Django基础介绍', '0', '2', '52', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('312', 'Django简介', '0', '2', '52', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('313', '博客系统之功能需求', '0', '2', '53', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('314', '博客系统之创建项目与迁移表', '0', '2', '53', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('315', '爬虫简介-爬虫的概念和价值', '0', '2', '54', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('316', '算法入门概念', '0', '2', '55', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('317', '简单工厂模式', '0', '2', '55', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('318', '服务器部署逻辑', '0', '2', '56', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('319', 'nginx介绍', '0', '2', '56', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('320', 'ES6介绍', '0', '2', '57', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('321', 'let和const命令', '0', '2', '57', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('322', 'REST风格介绍', '0', '2', '58', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('323', '保利威播放加密视频', '0', '2', '58', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');
INSERT INTO `course_coursesection` VALUES ('324', '求职前需要做哪些功课', '0', '2', '59', '//player.bilibili.com/player.html?aid=82861347&bvid=BV1aJ411H7Ej&cid=141761157&page=1');

-- ----------------------------
-- Table structure for `course_employmentcourse`
-- ----------------------------
DROP TABLE IF EXISTS `course_employmentcourse`;
CREATE TABLE `course_employmentcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `courseImage` varchar(100) NOT NULL,
  `studyNumber` int(11) NOT NULL,
  `hours` int(11) NOT NULL,
  `slogan` varchar(1024) NOT NULL,
  `courseType` smallint(6) NOT NULL,
  `price` int(11) NOT NULL,
  `salary` varchar(128) NOT NULL,
  `employmentRate` double NOT NULL,
  `courseDetail_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseDetail_id` (`courseDetail_id`),
  CONSTRAINT `Course_employmentcou_courseDetail_id_932e145d_fk_Course_co` FOREIGN KEY (`courseDetail_id`) REFERENCES `course_coursedetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_employmentcourse
-- ----------------------------
INSERT INTO `course_employmentcourse` VALUES ('1', 'Python全栈开发 · 中级', 'course/2020-05/Python全栈开发__中级.png', '2067', '319', '迎上AI风口，抓住行业红利，0基础6个月炼成人工智能时代热门人才', '3', '12800', '10～15K', '95.8', '15');
INSERT INTO `course_employmentcourse` VALUES ('2', 'Python全栈开发+AI人工智能（高级）', 'course/2020-05/Python全栈开发AI人工智能高级.png', '1166', '178', '新增数据分析、人工智能和Golang语言开发课程，助你抢占薪资制高点', '3', '7999', '15～25K', '98.8', '16');
INSERT INTO `course_employmentcourse` VALUES ('3', 'Linux云计算运维 · 中级', 'course/2020-05/Linux云计算运维__中级.png', '771', '167', '玩转Linux，不写代码也能高薪，零基础首选，年薪30万不是梦！', '3', '10500', '8～12K', '95.8', '17');
INSERT INTO `course_employmentcourse` VALUES ('4', 'Linux云计算运维 · 高级', 'course/2020-05/Linux云计算运维__高级.png', '436', '110', '新增python自动化开发课程，向自动化运维方向奋进！', '3', '6500', '12～20K', '95.8', '18');

-- ----------------------------
-- Table structure for `course_freecourse`
-- ----------------------------
DROP TABLE IF EXISTS `course_freecourse`;
CREATE TABLE `course_freecourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `courseImage` varchar(100) NOT NULL,
  `studyNumber` int(11) NOT NULL,
  `hours` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  `courseType` smallint(6) NOT NULL,
  `category_id` int(11) NOT NULL,
  `courseDetail_id` int(11) NOT NULL,
  `slogan` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseDetail_id` (`courseDetail_id`),
  KEY `Course_freecourse_category_id_aa3ff325_fk_Course_category_id` (`category_id`),
  CONSTRAINT `Course_freecourse_category_id_aa3ff325_fk_Course_category_id` FOREIGN KEY (`category_id`) REFERENCES `course_category` (`id`),
  CONSTRAINT `Course_freecourse_courseDetail_id_5a34b810_fk_Course_co` FOREIGN KEY (`courseDetail_id`) REFERENCES `course_coursedetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_freecourse
-- ----------------------------
INSERT INTO `course_freecourse` VALUES ('1', 'Python21天入门', 'course/2020-05/Python21天入门_VqfILZI.png', '79640', '19', '0', '0', '1', '1', '跟随Alex金角大王3周上手Python开发');
INSERT INTO `course_freecourse` VALUES ('2', 'Windows下双版本Python环境安装', 'course/2020-05/Windows下双版本Python环境安装_HMmgXvw.png', '1728', '1', '1', '0', '1', '2', '解决生产环境下如何处理Python版本问题');
INSERT INTO `course_freecourse` VALUES ('3', '小白学算法入门', 'course/2020-05/小白学算法入门_vSDxjva.png', '3346', '3', '1', '0', '1', '3', '这几个基础算法都不会的话，就真的不用做程序员了');
INSERT INTO `course_freecourse` VALUES ('4', '4小时计算机预科', 'course/2020-05/4小时计算机预科_GgPpy53.png', '2977', '4', '0', '0', '2', '4', '适合连计算机硬件都不清楚的小白预科课程');
INSERT INTO `course_freecourse` VALUES ('5', 'BOM&DOM编程', 'course/2020-05/BOMDOM编程_VpTvIqn.png', '2577', '3', '1', '0', '3', '5', 'JavaScript开发进阶必备之BOM&DOM编程');
INSERT INTO `course_freecourse` VALUES ('6', 'Java开发7天入门', 'course/2020-05/Java开发7天入门_otMBuMw.png', '3443', '7', '0', '0', '4', '6', '跟着好老师，Java学起来才有趣');
INSERT INTO `course_freecourse` VALUES ('7', 'Go语言14天入门', 'course/2020-05/Go语言14天入门_LshckKV.png', '2477', '14', '0', '0', '5', '7', '相当于C的运行速度，Python的开发效率的语言');

-- ----------------------------
-- Table structure for `course_freecourse_chapter`
-- ----------------------------
DROP TABLE IF EXISTS `course_freecourse_chapter`;
CREATE TABLE `course_freecourse_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `freecourse_id` int(11) NOT NULL,
  `coursechapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Course_freecourse_course_freecourse_id_coursechap_f3f990d7_uniq` (`freecourse_id`,`coursechapter_id`),
  KEY `Course_freecourse_ch_coursechapter_id_0d578c08_fk_Course_co` (`coursechapter_id`),
  CONSTRAINT `Course_freecourse_ch_coursechapter_id_0d578c08_fk_Course_co` FOREIGN KEY (`coursechapter_id`) REFERENCES `course_coursechapter` (`id`),
  CONSTRAINT `Course_freecourse_ch_freecourse_id_3071a03c_fk_Course_fr` FOREIGN KEY (`freecourse_id`) REFERENCES `course_freecourse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_freecourse_chapter
-- ----------------------------
INSERT INTO `course_freecourse_chapter` VALUES ('1', '1', '1');
INSERT INTO `course_freecourse_chapter` VALUES ('2', '1', '2');
INSERT INTO `course_freecourse_chapter` VALUES ('3', '1', '3');
INSERT INTO `course_freecourse_chapter` VALUES ('4', '2', '4');
INSERT INTO `course_freecourse_chapter` VALUES ('5', '3', '5');
INSERT INTO `course_freecourse_chapter` VALUES ('6', '3', '6');
INSERT INTO `course_freecourse_chapter` VALUES ('8', '4', '7');
INSERT INTO `course_freecourse_chapter` VALUES ('7', '4', '8');
INSERT INTO `course_freecourse_chapter` VALUES ('9', '5', '9');
INSERT INTO `course_freecourse_chapter` VALUES ('10', '5', '10');
INSERT INTO `course_freecourse_chapter` VALUES ('11', '6', '11');
INSERT INTO `course_freecourse_chapter` VALUES ('12', '6', '12');
INSERT INTO `course_freecourse_chapter` VALUES ('13', '6', '13');
INSERT INTO `course_freecourse_chapter` VALUES ('14', '7', '14');

-- ----------------------------
-- Table structure for `course_golearn`
-- ----------------------------
DROP TABLE IF EXISTS `course_golearn`;
CREATE TABLE `course_golearn` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `courseDetail_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Course_golearn_courseDetail_id_06a018ec_fk_Course_co` (`courseDetail_id`),
  CONSTRAINT `Course_golearn_courseDetail_id_06a018ec_fk_Course_co` FOREIGN KEY (`courseDetail_id`) REFERENCES `course_coursedetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_golearn
-- ----------------------------
INSERT INTO `course_golearn` VALUES ('1', '学会Python基础语法', '1');
INSERT INTO `course_golearn` VALUES ('2', '掌握Python字符编码&数据类型', '1');
INSERT INTO `course_golearn` VALUES ('3', '通过Python操作文件', '1');
INSERT INTO `course_golearn` VALUES ('4', '通过函数减少重复代码，提高代码可扩展性', '1');
INSERT INTO `course_golearn` VALUES ('5', '开发300行代码的股票查询程序', '1');
INSERT INTO `course_golearn` VALUES ('6', '熟练搭建Python开发环境', '2');
INSERT INTO `course_golearn` VALUES ('7', 'pip的介绍和使用', '2');
INSERT INTO `course_golearn` VALUES ('8', '了解算法的重要性以及算法的应用领域', '3');
INSERT INTO `course_golearn` VALUES ('9', '学会如何快速判断算法优劣', '3');
INSERT INTO `course_golearn` VALUES ('10', '掌握常用排序&查找算法的原理', '3');
INSERT INTO `course_golearn` VALUES ('11', '计算机软硬件的组成', '4');
INSERT INTO `course_golearn` VALUES ('12', 'CPU、内存、硬盘之间的关系', '4');
INSERT INTO `course_golearn` VALUES ('13', '掌握操作系统的基本原理', '4');
INSERT INTO `course_golearn` VALUES ('14', '网络基础知识，组建小型的局域网', '4');
INSERT INTO `course_golearn` VALUES ('15', '如何在页面上弹出对话框', '5');
INSERT INTO `course_golearn` VALUES ('16', '如何写一个定时器', '5');
INSERT INTO `course_golearn` VALUES ('17', '鼠标悬浮、键盘输入、点击等事件监听&响应', '5');
INSERT INTO `course_golearn` VALUES ('18', '表单控件的操作', '5');
INSERT INTO `course_golearn` VALUES ('19', '写下人生第一个Java程序', '6');
INSERT INTO `course_golearn` VALUES ('20', '掌握常用数据类型的使用', '6');
INSERT INTO `course_golearn` VALUES ('21', '掌握流程控制', '6');
INSERT INTO `course_golearn` VALUES ('22', '通过方法写出可复用的代码', '6');
INSERT INTO `course_golearn` VALUES ('23', '掌握开发200行代码程序的能力', '6');
INSERT INTO `course_golearn` VALUES ('24', '学会基本语法，流程控制，手刃一个300行代码的小程序', '7');
INSERT INTO `course_golearn` VALUES ('25', '学习函数和数据结构，get到代码复用的重要性', '7');
INSERT INTO `course_golearn` VALUES ('26', '使用面向对象思维方式进行Go语言编程', '7');
INSERT INTO `course_golearn` VALUES ('27', '掌握面向接口编程 ，理解反射存在的意义及反射原理', '7');

-- ----------------------------
-- Table structure for `course_module`
-- ----------------------------
DROP TABLE IF EXISTS `course_module`;
CREATE TABLE `course_module` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(256) NOT NULL,
  `course_id` int(11) NOT NULL,
  `module` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Course_module_course_id_27e75134_fk_Course_employmentcourse_id` (`course_id`),
  CONSTRAINT `Course_module_course_id_27e75134_fk_Course_employmentcourse_id` FOREIGN KEY (`course_id`) REFERENCES `course_employmentcourse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_module
-- ----------------------------
INSERT INTO `course_module` VALUES ('1', '开发基础', '1', '1');
INSERT INTO `course_module` VALUES ('2', '函数编程', '1', '2');
INSERT INTO `course_module` VALUES ('3', '面向对象&网络编程基础', '1', '3');
INSERT INTO `course_module` VALUES ('4', '网络编程进阶&数据库开发', '1', '4');
INSERT INTO `course_module` VALUES ('5', 'WEB开发基础', '1', '5');
INSERT INTO `course_module` VALUES ('6', 'WEB框架开发', '1', '6');
INSERT INTO `course_module` VALUES ('7', '项目实战一', '1', '7');
INSERT INTO `course_module` VALUES ('8', '算法&设计模式、企业应用', '1', '8');
INSERT INTO `course_module` VALUES ('9', '项目实战二', '1', '9');
INSERT INTO `course_module` VALUES ('10', '就业指导', '1', '10');

-- ----------------------------
-- Table structure for `course_module_chapter`
-- ----------------------------
DROP TABLE IF EXISTS `course_module_chapter`;
CREATE TABLE `course_module_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `coursechapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Course_module_chapter_module_id_coursechapter_id_2955c1de_uniq` (`module_id`,`coursechapter_id`),
  KEY `Course_module_chapte_coursechapter_id_7ba79c4e_fk_Course_co` (`coursechapter_id`),
  CONSTRAINT `Course_module_chapte_coursechapter_id_7ba79c4e_fk_Course_co` FOREIGN KEY (`coursechapter_id`) REFERENCES `course_coursechapter` (`id`),
  CONSTRAINT `Course_module_chapter_module_id_6a411f08_fk_Course_module_id` FOREIGN KEY (`module_id`) REFERENCES `course_module` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_module_chapter
-- ----------------------------
INSERT INTO `course_module_chapter` VALUES ('2', '1', '37');
INSERT INTO `course_module_chapter` VALUES ('3', '1', '38');
INSERT INTO `course_module_chapter` VALUES ('4', '1', '39');
INSERT INTO `course_module_chapter` VALUES ('1', '1', '40');
INSERT INTO `course_module_chapter` VALUES ('5', '2', '41');
INSERT INTO `course_module_chapter` VALUES ('6', '2', '42');
INSERT INTO `course_module_chapter` VALUES ('7', '3', '43');
INSERT INTO `course_module_chapter` VALUES ('8', '3', '44');
INSERT INTO `course_module_chapter` VALUES ('9', '3', '45');
INSERT INTO `course_module_chapter` VALUES ('10', '3', '46');
INSERT INTO `course_module_chapter` VALUES ('12', '4', '47');
INSERT INTO `course_module_chapter` VALUES ('11', '4', '48');
INSERT INTO `course_module_chapter` VALUES ('13', '5', '49');
INSERT INTO `course_module_chapter` VALUES ('14', '5', '50');
INSERT INTO `course_module_chapter` VALUES ('15', '5', '51');
INSERT INTO `course_module_chapter` VALUES ('16', '6', '52');
INSERT INTO `course_module_chapter` VALUES ('17', '7', '53');
INSERT INTO `course_module_chapter` VALUES ('18', '7', '54');
INSERT INTO `course_module_chapter` VALUES ('20', '8', '55');
INSERT INTO `course_module_chapter` VALUES ('19', '8', '56');
INSERT INTO `course_module_chapter` VALUES ('21', '9', '57');
INSERT INTO `course_module_chapter` VALUES ('22', '9', '58');
INSERT INTO `course_module_chapter` VALUES ('23', '10', '59');

-- ----------------------------
-- Table structure for `course_practicalcourse`
-- ----------------------------
DROP TABLE IF EXISTS `course_practicalcourse`;
CREATE TABLE `course_practicalcourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `courseImage` varchar(100) NOT NULL,
  `studyNumber` int(11) NOT NULL,
  `hours` int(11) NOT NULL,
  `level` smallint(6) NOT NULL,
  `courseType` smallint(6) NOT NULL,
  `price` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `courseDetail_id` int(11) NOT NULL,
  `slogan` varchar(1024) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `courseDetail_id` (`courseDetail_id`),
  KEY `Course_practicalcour_category_id_26de7e37_fk_Course_ca` (`category_id`),
  CONSTRAINT `Course_practicalcour_category_id_26de7e37_fk_Course_ca` FOREIGN KEY (`category_id`) REFERENCES `course_category` (`id`),
  CONSTRAINT `Course_practicalcour_courseDetail_id_692e1061_fk_Course_co` FOREIGN KEY (`courseDetail_id`) REFERENCES `course_coursedetail` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_practicalcourse
-- ----------------------------
INSERT INTO `course_practicalcourse` VALUES ('1', '基于Django开发轻量级Bug管理平台', 'course/2020-05/基于Django开发轻量级Bug管理平台_cNpfjUN.png', '304', '63', '1', '1', '69', '6', '8', '基于Django开发轻量级Bug管理平台');
INSERT INTO `course_practicalcourse` VALUES ('2', '5天玩转Zabbix监控', 'course/2020-05/5天玩转Zabbix监控_guSQVMN.png', '5767', '16', '1', '1', '9', '7', '9', '5天玩转Zabbix监控');
INSERT INTO `course_practicalcourse` VALUES ('3', 'Vue源码解析', 'course/2020-05/Vue源码解析_Xaa9IKs.png', '450', '3', '1', '1', '9', '8', '10', 'Vue源码解析');
INSERT INTO `course_practicalcourse` VALUES ('4', '区块链开发从入门到进阶', 'course/2020-05/区块链开发从入门到进阶_cmbqBMC.png', '698', '7', '1', '1', '19', '9', '11', '区块链开发从入门到进阶');
INSERT INTO `course_practicalcourse` VALUES ('5', 'Python数据分析与机器学习实战', 'course/2020-05/Python数据分析与机器学习实战_SnOy2t6.jpeg', '8801', '80', '1', '1', '499', '10', '12', 'Python数据分析与机器学习实战');
INSERT INTO `course_practicalcourse` VALUES ('6', '渗透测试', 'course/2020-05/渗透测试_AXEHoDb.png', '4263', '12', '1', '1', '9', '11', '13', '渗透测试');
INSERT INTO `course_practicalcourse` VALUES ('7', '网管到CEO的10年逆袭之路', 'course/2020-05/网管到CEO的10年逆袭之路_lF8vMXm.jpeg', '14531', '8', '0', '1', '1', '12', '14', '网管到CEO的10年逆袭之路');

-- ----------------------------
-- Table structure for `course_practicalcourse_chapter`
-- ----------------------------
DROP TABLE IF EXISTS `course_practicalcourse_chapter`;
CREATE TABLE `course_practicalcourse_chapter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `practicalcourse_id` int(11) NOT NULL,
  `coursechapter_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Course_practicalcourse_c_practicalcourse_id_cours_601a9185_uniq` (`practicalcourse_id`,`coursechapter_id`),
  KEY `Course_practicalcour_coursechapter_id_e806509d_fk_Course_co` (`coursechapter_id`),
  CONSTRAINT `Course_practicalcour_coursechapter_id_e806509d_fk_Course_co` FOREIGN KEY (`coursechapter_id`) REFERENCES `course_coursechapter` (`id`),
  CONSTRAINT `Course_practicalcour_practicalcourse_id_e490be1e_fk_Course_pr` FOREIGN KEY (`practicalcourse_id`) REFERENCES `course_practicalcourse` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_practicalcourse_chapter
-- ----------------------------
INSERT INTO `course_practicalcourse_chapter` VALUES ('1', '1', '15');
INSERT INTO `course_practicalcourse_chapter` VALUES ('2', '1', '16');
INSERT INTO `course_practicalcourse_chapter` VALUES ('3', '1', '17');
INSERT INTO `course_practicalcourse_chapter` VALUES ('4', '1', '18');
INSERT INTO `course_practicalcourse_chapter` VALUES ('5', '1', '19');
INSERT INTO `course_practicalcourse_chapter` VALUES ('6', '2', '20');
INSERT INTO `course_practicalcourse_chapter` VALUES ('7', '2', '21');
INSERT INTO `course_practicalcourse_chapter` VALUES ('8', '2', '22');
INSERT INTO `course_practicalcourse_chapter` VALUES ('9', '2', '23');
INSERT INTO `course_practicalcourse_chapter` VALUES ('10', '2', '24');
INSERT INTO `course_practicalcourse_chapter` VALUES ('11', '3', '25');
INSERT INTO `course_practicalcourse_chapter` VALUES ('12', '4', '26');
INSERT INTO `course_practicalcourse_chapter` VALUES ('13', '4', '27');
INSERT INTO `course_practicalcourse_chapter` VALUES ('14', '5', '28');
INSERT INTO `course_practicalcourse_chapter` VALUES ('15', '5', '29');
INSERT INTO `course_practicalcourse_chapter` VALUES ('16', '5', '30');
INSERT INTO `course_practicalcourse_chapter` VALUES ('21', '6', '31');
INSERT INTO `course_practicalcourse_chapter` VALUES ('17', '6', '32');
INSERT INTO `course_practicalcourse_chapter` VALUES ('18', '6', '33');
INSERT INTO `course_practicalcourse_chapter` VALUES ('19', '6', '34');
INSERT INTO `course_practicalcourse_chapter` VALUES ('20', '6', '35');
INSERT INTO `course_practicalcourse_chapter` VALUES ('22', '7', '36');

-- ----------------------------
-- Table structure for `course_teacher`
-- ----------------------------
DROP TABLE IF EXISTS `course_teacher`;
CREATE TABLE `course_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `brief` longtext NOT NULL,
  `avatar` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course_teacher
-- ----------------------------
INSERT INTO `course_teacher` VALUES ('1', 'Alex', '10年+IT行业技术经验, 8年Python开发经验，6年教学经验，业内最早的的Python语言布道者之一。 51CTO学院2016/2017年度最受学员喜爱10大讲师之一，多款开源软件作者，fork me on git，triaquae 曾任职飞信、中金公司、NOKIA研究院、ADVENT金融、汽车之家，从底层网管一路走来，先后做过Linux运维、自动化开发、Python开发、架构师、教学总监职位。同时爱好读书、电影、音乐、旅行、潜水、姑娘，生活明朗，万物可期。', 'avatars/alex_vrVpRNI.png');
INSERT INTO `course_teacher` VALUES ('2', 'Avrion(苑昊)', '苑昊,老男孩教育金牌讲师，曾参与新加坡南洋理工大学大数据医疗相关项目，就职过多家互联网企业，有着多年开发经验，精通java,python,go等编程语言，Uric开源软件作者，致力于人工智能与大数据方向，对机器学习，深度学习等算法有深度研究。', 'avatars/yuanhao_MP9Pwca.png');
INSERT INTO `course_teacher` VALUES ('3', 'Jason Zhao', '对各种高精尖算法有较深研究，擅长C、C++、Python、Java语言、机器学习 2015年“甲骨文杯”全国Java程序设计大赛二等奖。计算机专业知识相当扎实，跟二进制一样严谨，擅长将枯燥的专业知识生动形象的表达出来，深入浅出，深受学员喜爱。', 'avatars/博士3x_1517450125.4485447.png');
INSERT INTO `course_teacher` VALUES ('4', '白树明', '曾就职新浪网任高级运维，RedHat官方认证专家，RHCA认证中国首批获得者，Openstack认证亚洲首批获得者。拥有13年Linux系统运维及开发经验；熟悉大型互联网架构、分布式架构、虚拟化及容器架构；精通C语言，特别是针对线上业务对Linux内核实现精确定制与优化；多年的开发运维及企业培训授课经验。', 'avatars/bai_meitu_kmDubm0.jpeg');
INSERT INTO `course_teacher` VALUES ('5', 'Mjj老师', '5年大厂前端经验，曾就职于掌阅科技，先前最早的一批iReaderAPP开发者，后就职于美团网。3年教学经验，有Object-C，swift语言开发经验。后来转型进攻前端，对react-native、phoneGap以及对谷歌新推出的Flutter移动端框架有深入研究。曾经独立负责应用过React/Vue项目开发，有着丰富的实战经验。对ES6/7、Nodejs、Vue、React、PWA技术栈有深入的理解，对于流行的小程序技术也有深入的见解，善于将丰富的开发经验融入到课程中。', 'avatars/马金聚_6NQMm3Y.png');
INSERT INTO `course_teacher` VALUES ('6', '樵夫', '本科毕业后做过几年Java讲师，后来去了阿里巴巴，参于阿里云多个项目开发，C/C++/Java/Python都用过，当然Java写的项目最多，工作稳定后，饱暖思淫欲，现在天天总想着为社会做点大的贡献，借着之前讲过课的功底，决定录制一期NB的Java教程给大家，希望帮助小白在Java自学之路上更加容易。', 'avatars/12x.png');
INSERT INTO `course_teacher` VALUES ('7', '武Sir 银角大王', '多年开发实战经验，先后任职于汽车之家、好大夫在线等多家大型互联网公司。 擅长C#,Python,PHP等一大堆语言开发，现任某大型互联网公司高级自动化开发工程师，已精读多个开源软件源码，自行开发过改进版的Tornado WEB框架，讲课风趣幽默。', 'avatars/peiqi_pukWeh5.png');
INSERT INTO `course_teacher` VALUES ('8', '周玉强', 'linux运维高级讲师，5年的互联网运维工作经验，擅长zabbix监控、kvm虚拟化技术、OpenStack云计算、docker容器等，曾维护2千台以上规模的集群架构，兴趣从硬件到操作系统，从网络到存储，从运维到开发都有涉及，热爱技术，热爱教学。', 'avatars/周玉强_KIdfv9G.png');
INSERT INTO `course_teacher` VALUES ('9', '孙建超', 'NEO区块链创客黑马赛优秀奖得主。精通Go语言、Java、Python和大数据生态圈；曾担任清华大学Java技术研究与开发联合实验室研究员；具备7年从业经验，在2018上海国际创客大赛—NEO区块链创客黑马赛中荣获优秀奖；参与过国家级区块链研发项目，对于数据的处理和去中心化的思想有独到的见解。', 'avatars/孙建超_zh1dUeQ.png');
INSERT INTO `course_teacher` VALUES ('10', '唐宇迪', '计算机博士，专注于机器学习与计算机视觉领域，深度学习领域一线实战专家。参与多个国家级计算机视觉项目，多年数据领域培训经验，丰富的教学讲解经验，擅长最用简洁通俗的故事讲解晦涩难懂的算法原理。出品多套机器学习与深度学习系列课程，课程生动形象，风格通俗易懂', 'avatars/唐宇迪_cYpdHse.png');
INSERT INTO `course_teacher` VALUES ('11', '超亮哥', '10年+网络信息安全领域从业经验，具有较强的网络安全管理、技术实战项目经验，曾就职于启明星辰、中证信息、蓝海创意云、欧驰云等公司，任安全技术总监，主要负责信息安全管理、渗透测试、风险评估、等级保护、应急响应、网络安全防护体系建设，曾为多家企业、运营商、金融、政府单位提供安全系统建设技术咨询服务，深受客户认可，国家首届安全周攻防比赛第二名获得者。 曾获技术资质：CISP、CIW、MCSE、网络工程师、系统分析师', 'avatars/超亮哥_XWfJwMY.png');
INSERT INTO `course_teacher` VALUES ('12', '老男孩 | 北京老男孩IT教育创始人', '老男孩，北京老男孩IT教育创始人，拥有十多年一线大规模网站集群运维架构实战经验及教学培训经验，曾主导了从几台到上千台规模集群运维架构的扩展，运维架构实战知识体系全面，擅长大规模集群架构部署调优、虚拟化、云计算、大数据、MySQL数据库等技术，是IT界资深的Linux集群架构实战专家。', 'avatars/老男孩_k9cSpA3.png');
INSERT INTO `course_teacher` VALUES ('13', '李泳谊 | 老男孩Linux学科带头人', '90后新兴讲师，师从业内顶级Linux专家老男孩老师，多年一线运维经验，讲课坚持以各种图形表达抽象概念。用简单粗暴的例子表达课上内容。追求讲到你懂了为止，适合零基础入门的的小伙伴。曾分享录制awk数组实战分享，http原理实战分享等精品视频，受益数千人，深得网友喜爱！', 'avatars/李泳谊_dHi32lU.png');

-- ----------------------------
-- Table structure for `django_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_Account_account_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_Account_account_id` FOREIGN KEY (`user_id`) REFERENCES `account_account` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=123 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2020-05-11 00:50:03.336568', '15', '人工智能有多火？Google 中国为应届生岗位开出高达 56 万的年薪。计算机视觉、自然语言处理等前沿应用领域更是面临巨大的人才缺口。做为进入人工智能、数据分析领域的必备语言，过去3年里,市场对 Python 开发者的需求呈爆发性增长趋势。\r\n\r\n在这门课程里，你将得到专业导师的逐行代码审阅、反馈，全程高手引路、帮你快速从0基础学习Python编程。24周后，你将掌握数据库、网络编程、WEB开发、', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2020-05-11 00:50:25.661521', '1', 'Python全栈开发 · 中级', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2020-05-11 01:02:31.147469', '16', '人工智能有多火？Google 中国为应届生岗位开出高达 56 万的年薪。计算机视觉、自然语言处理等前沿应用领域更是面临巨大的人才缺口。做为进入人工智能、数据分析领域的必备语言，过去3年里,市场对 Python 开发者的需求呈爆发性增长趋势。\r\n\r\n在这门课程里，你将得到专业导师的逐行代码审阅、反馈，全程高手引路、帮你快速从0基础学习Python编程。24周后，你将掌握数据库、网络编程、WEB开发、', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2020-05-11 01:02:57.158008', '2', 'Python全栈开发+AI人工智能（高级）', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2020-05-11 01:05:20.720103', '12', '老男孩 | 北京老男孩IT教育创始人', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2020-05-11 01:05:40.155876', '13', '李泳谊 | 老男孩Linux学科带头人', '1', '[{\"added\": {}}]', '9', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2020-05-11 01:05:50.940104', '17', '我国Linux市场以年均43.1%的复合增长率高速增长，预计到2021年Linux市场人才需求将超过150万；且Linux运维职位晋升快，3年左右就能升至技术管理岗位年薪25W起；5年以上达到架构师水平年薪突破40W。\r\n\r\n在这门课程里，你将跟随技术大牛，从0开始学习Linux系统原理，常用服务如NfS\\DNS\\FTP\\KVM\\Nginx等的配置与优化、Shell核心编程、Linux WEB集群', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2020-05-11 01:06:08.661365', '3', 'Linux云计算运维 · 中级', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2020-05-11 01:07:21.337607', '18', '我国Linux市场以年均43.1%的复合增长率高速增长，预计到2021年Linux市场人才需求将超过150万；且Linux运维职位晋升快，3年左右就能升至技术管理岗位年薪25W起；5年以上达到架构师水平年薪突破40W。\r\n\r\n在这门课程里，你将跟随技术大牛，深入学习DevOps相关技术，如持续集成、持续交付、ELK分布式日志分析、Docker容器技术、K8s集群、Openstack云计算、阿里云实', '1', '[{\"added\": {}}]', '8', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2020-05-11 01:07:45.742975', '4', 'Linux云计算运维 · 高级', '1', '[{\"added\": {}}]', '18', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2020-05-11 13:03:29.084742', '37', 'Python基础语法入门', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2020-05-11 13:03:40.446340', '38', '数据类型&文件操作', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2020-05-11 13:03:52.918372', '39', '股票查询程序讲解', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2020-05-11 13:12:10.622232', '40', '作业讲解', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2020-05-11 13:12:16.861765', '1', '开发基础', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2020-05-11 13:12:38.580714', '41', '函数编程', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2020-05-11 13:12:48.015238', '42', '常用模块', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2020-05-11 13:12:57.598906', '2', '函数编程', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2020-05-11 13:13:36.721237', '43', '面向对象', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2020-05-11 13:13:44.669749', '44', '网络编程', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2020-05-11 13:13:53.417606', '45', '选课系统作业讲解', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2020-05-11 13:14:04.232693', '46', 'FTP项目作业讲解', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2020-05-11 13:14:13.388653', '3', '面向对象&网络编程基础', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2020-05-11 13:14:35.934974', '47', '网络编程进阶', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2020-05-11 13:14:47.466215', '48', 'MySql数据库开发', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2020-05-11 13:14:53.576081', '4', '网络编程进阶&数据库开发', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2020-05-11 13:15:08.714956', '49', 'HTML', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2020-05-11 13:15:14.949212', '50', 'CSS', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('29', '2020-05-11 13:15:24.245010', '51', 'JavaScript', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('30', '2020-05-11 13:15:26.515934', '5', 'WEB开发基础', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('31', '2020-05-11 13:15:48.785364', '52', 'Django框架开发', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('32', '2020-05-11 13:15:57.264504', '6', 'WEB框架开发', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('33', '2020-05-11 13:16:29.318504', '53', 'CRM客户关系管理系统开发', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('34', '2020-05-11 13:16:37.952697', '54', '爬虫实战', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('35', '2020-05-11 13:16:43.025432', '7', '项目实战一', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('36', '2020-05-11 13:17:10.261521', '55', '算法&设计模式', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('37', '2020-05-11 13:17:21.407002', '56', '企业应用工具学习', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('38', '2020-05-11 13:17:24.987511', '8', '算法&设计模式、企业应用', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('39', '2020-05-11 13:17:46.953899', '57', 'VUE基础和高级知识点', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('40', '2020-05-11 13:18:00.932717', '58', '项目实战：在线教育平台开发', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('41', '2020-05-11 13:18:06.344781', '9', '项目实战二', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('42', '2020-05-11 13:18:26.249062', '59', '就业指导&工作推荐', '1', '[{\"added\": {}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('43', '2020-05-11 13:18:28.845141', '10', '就业指导', '1', '[{\"added\": {}}]', '19', '1');
INSERT INTO `django_admin_log` VALUES ('44', '2020-05-11 14:37:35.321992', '281', 'LuffyX学位课程合同，请认真阅读。', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('45', '2020-05-11 14:38:11.820938', '282', '路飞导学必看-如何用正确的姿势学习IT技术', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('46', '2020-05-11 14:38:29.100032', '283', '路飞导学必看-新生40天组队打卡编程挑战赛', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('47', '2020-05-11 14:38:53.079280', '284', '开班入学必听-Alex大神讲行业前景', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('48', '2020-05-11 14:39:10.042108', '285', '编程语言是如何演变过来的', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('49', '2020-05-11 14:39:44.892873', '286', '课前小鸡汤-如何进入挣钱效率高的公司', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('50', '2020-05-11 14:40:17.582600', '287', '变量的创建过程和垃圾回收机制', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('51', '2020-05-11 14:40:39.808769', '288', '股票查询程序作业思路讲解', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('52', '2020-05-11 14:41:10.814167', '289', '三级菜单作业讲解之普通青年版', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('53', '2020-05-11 14:41:38.948831', '290', '课前鸡汤之清朝是如何灭亡的', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('54', '2020-05-11 14:42:00.383344', '291', '上章补充-bytes类型', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('55', '2020-05-11 14:42:22.908299', '292', '互联网公司是30岁求职者的坟墓', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('56', '2020-05-11 14:42:39.783107', '293', '模块的种类介绍', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('57', '2020-05-11 14:43:06.640449', '294', '我的失败与梦想(一)', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('58', '2020-05-11 14:43:14.662185', '295', '编程范式', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('59', '2020-05-11 14:43:36.806757', '296', '计算机基础', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('60', '2020-05-11 14:43:44.927037', '297', '什么是网络', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('61', '2020-05-11 14:44:03.166019', '298', '选课系统作业讲解', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('62', '2020-05-11 14:44:22.087571', '299', 'FTP项目需求', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('63', '2020-05-11 14:44:32.454321', '300', 'FTP项目 断点续传功能开发', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('64', '2020-05-11 14:45:03.484006', '301', '进程与程序的概念', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('65', '2020-05-11 14:45:22.126688', '302', '操作系统发展史-批处理系统', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('66', '2020-05-11 14:45:36.940094', '303', 'MySQL-开篇', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('67', '2020-05-11 14:45:47.277831', '304', 'MySQL简单介绍', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('68', '2020-05-11 14:46:08.679813', '305', 'HTML的历史发展过程', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('69', '2020-05-11 14:46:44.794457', '306', '搞懂HTML是什么', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('70', '2020-05-11 14:47:02.493302', '307', 'CSS的介绍', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('71', '2020-05-11 14:47:19.598171', '308', '使用css的优势', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('72', '2020-05-11 14:47:51.902972', '309', 'JavaScript介绍', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('73', '2020-05-11 14:48:03.656875', '310', '如何在页面中插入Javascript', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('74', '2020-05-11 14:48:25.333538', '311', 'Django基础介绍', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('75', '2020-05-11 14:48:35.906922', '312', 'Django简介', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('76', '2020-05-11 14:49:15.641054', '313', '博客系统之功能需求', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('77', '2020-05-11 14:49:39.203619', '314', '博客系统之创建项目与迁移表', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('78', '2020-05-11 14:50:11.594538', '315', '爬虫简介-爬虫的概念和价值', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('79', '2020-05-11 14:50:31.198974', '316', '算法入门概念', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('80', '2020-05-11 14:50:45.764089', '317', '简单工厂模式', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('81', '2020-05-11 14:50:58.777415', '318', '服务器部署逻辑', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('82', '2020-05-11 14:51:10.199573', '319', 'nginx介绍', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('83', '2020-05-11 14:51:33.095217', '320', 'ES6介绍', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('84', '2020-05-11 14:51:40.520595', '321', 'let和const命令', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('85', '2020-05-11 14:52:00.540898', '322', 'REST风格介绍', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('86', '2020-05-11 14:52:14.587659', '323', '保利威播放加密视频', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('87', '2020-05-11 14:52:34.671315', '324', '求职前需要做哪些功课', '1', '[{\"added\": {}}]', '12', '1');
INSERT INTO `django_admin_log` VALUES ('88', '2020-05-13 16:29:46.171581', '1', 'Alex', '2', '[{\"changed\": {\"fields\": [\"Identity\", \"Courses\", \"CompleteSection\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('89', '2020-05-14 10:02:48.736261', '2', 'koking', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('90', '2020-05-14 10:03:59.032467', '3', 'wupeiqi', '1', '[{\"added\": {}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('91', '2020-05-14 10:35:15.782025', '1', 'wupeiqi', '1', '[{\"added\": {}}]', '20', '1');
INSERT INTO `django_admin_log` VALUES ('92', '2020-05-14 10:38:38.821896', '2', 'koking', '1', '[{\"added\": {}}]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('93', '2020-05-15 03:39:58.213080', '3', 'wupeiqi', '2', '[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('94', '2020-05-15 03:40:03.655527', '2', 'koking', '2', '[]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('95', '2020-05-15 03:40:13.747082', '1', 'Alex', '2', '[{\"changed\": {\"fields\": [\"\\u8eab\\u4efd\"]}}]', '15', '1');
INSERT INTO `django_admin_log` VALUES ('96', '2020-05-15 14:35:51.602020', '58', '项目实战：在线教育平台开发', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('97', '2020-05-15 14:36:25.943640', '56', '企业应用工具学习', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('98', '2020-05-15 14:36:47.494028', '55', '算法&设计模式', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('99', '2020-05-15 14:37:14.422012', '54', '爬虫实战', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('100', '2020-05-15 14:37:38.277142', '53', 'CRM客户关系管理系统开发', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('101', '2020-05-15 14:38:21.300831', '52', 'Django框架开发', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('102', '2020-05-15 14:38:50.500220', '51', 'JavaScript', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('103', '2020-05-15 14:39:08.479320', '50', 'CSS', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('104', '2020-05-15 14:39:37.559844', '48', 'MySql数据库开发', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('105', '2020-05-15 14:40:14.210014', '47', '网络编程进阶', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('106', '2020-05-15 14:40:43.665487', '44', '网络编程', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('107', '2020-05-15 14:41:09.253667', '43', '面向对象', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('108', '2020-05-15 14:42:05.534738', '42', '常用模块', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('109', '2020-05-15 14:42:27.958623', '41', '函数编程', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('110', '2020-05-15 14:43:05.981400', '39', '股票查询程序讲解', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('111', '2020-05-15 14:43:46.156382', '38', '数据类型&文件操作', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('112', '2020-05-15 14:44:08.779143', '37', 'Python基础语法入门', '2', '[{\"changed\": {\"fields\": [\"\\u4f5c\\u4e1a\\u9898\\u76ee\", \"\\u4f5c\\u4e1a\\u5185\\u5bb9\", \"\\u5956\\u5b66\\u91d1\"]}}]', '7', '1');
INSERT INTO `django_admin_log` VALUES ('113', '2020-05-16 15:09:45.959338', '4', 'testRegister', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('114', '2020-05-17 07:28:18.429883', '5', '123', '3', '', '17', '1');
INSERT INTO `django_admin_log` VALUES ('115', '2020-05-17 07:28:26.439310', '7', '123', '3', '', '15', '1');
INSERT INTO `django_admin_log` VALUES ('116', '2020-05-17 09:23:36.702536', '2', 'koking', '2', '[]', '17', '1');
INSERT INTO `django_admin_log` VALUES ('117', '2020-05-17 13:17:40.342216', '4', 'kokingwupeiqisklearn逻辑回归', '2', '[{\"changed\": {\"fields\": [\"\\u8fdb\\u5ea6\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('118', '2020-05-17 13:17:44.851169', '1', 'kokingwupeiqititle', '2', '[{\"changed\": {\"fields\": [\"\\u8fdb\\u5ea6\"]}}]', '21', '1');
INSERT INTO `django_admin_log` VALUES ('119', '2020-05-18 06:35:38.879925', '1', 'koking-员工信息查询', '2', '[]', '22', '1');
INSERT INTO `django_admin_log` VALUES ('120', '2020-05-18 06:36:03.047290', '2', 'koking-None', '1', '[{\"added\": {}}]', '22', '1');
INSERT INTO `django_admin_log` VALUES ('121', '2020-05-18 06:38:55.598864', '3', 'koking-None', '1', '[{\"added\": {}}]', '22', '1');
INSERT INTO `django_admin_log` VALUES ('122', '2020-05-18 07:28:42.788364', '1', 'kokingwupeiqititle', '2', '[{\"changed\": {\"fields\": [\"\\u89e3\\u51b3\\u5185\\u5bb9\", \"\\u8fdb\\u5ea6\"]}}]', '21', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('15', 'Account', 'account');
INSERT INTO `django_content_type` VALUES ('14', 'Account', 'classes');
INSERT INTO `django_content_type` VALUES ('32', 'Account', 'manager');
INSERT INTO `django_content_type` VALUES ('17', 'Account', 'student');
INSERT INTO `django_content_type` VALUES ('16', 'Account', 'task');
INSERT INTO `django_content_type` VALUES ('20', 'Account', 'teacher');
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('21', 'Classroom', 'question');
INSERT INTO `django_content_type` VALUES ('22', 'Classroom', 'task');
INSERT INTO `django_content_type` VALUES ('4', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('6', 'Course', 'category');
INSERT INTO `django_content_type` VALUES ('7', 'Course', 'coursechapter');
INSERT INTO `django_content_type` VALUES ('8', 'Course', 'coursedetail');
INSERT INTO `django_content_type` VALUES ('12', 'Course', 'coursesection');
INSERT INTO `django_content_type` VALUES ('18', 'Course', 'employmentcourse');
INSERT INTO `django_content_type` VALUES ('11', 'Course', 'freecourse');
INSERT INTO `django_content_type` VALUES ('13', 'Course', 'golearn');
INSERT INTO `django_content_type` VALUES ('19', 'Course', 'module');
INSERT INTO `django_content_type` VALUES ('10', 'Course', 'practicalcourse');
INSERT INTO `django_content_type` VALUES ('9', 'Course', 'teacher');
INSERT INTO `django_content_type` VALUES ('31', 'RBAC', 'attendance');
INSERT INTO `django_content_type` VALUES ('24', 'RBAC', 'department');
INSERT INTO `django_content_type` VALUES ('25', 'RBAC', 'menu');
INSERT INTO `django_content_type` VALUES ('26', 'RBAC', 'permission');
INSERT INTO `django_content_type` VALUES ('27', 'RBAC', 'rbacuserinfo');
INSERT INTO `django_content_type` VALUES ('28', 'RBAC', 'role');
INSERT INTO `django_content_type` VALUES ('30', 'RBAC', 'scorerecord');
INSERT INTO `django_content_type` VALUES ('29', 'RBAC', 'team');
INSERT INTO `django_content_type` VALUES ('5', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('23', 'Shopping', 'shoppingcar');

-- ----------------------------
-- Table structure for `django_migrations`
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2020-05-09 07:17:41.051376');
INSERT INTO `django_migrations` VALUES ('2', 'contenttypes', '0002_remove_content_type_name', '2020-05-09 07:17:44.251529');
INSERT INTO `django_migrations` VALUES ('3', 'auth', '0001_initial', '2020-05-09 07:17:47.111627');
INSERT INTO `django_migrations` VALUES ('4', 'auth', '0002_alter_permission_name_max_length', '2020-05-09 07:17:55.618348');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0003_alter_user_email_max_length', '2020-05-09 07:17:55.711103');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0004_alter_user_username_opts', '2020-05-09 07:17:55.798960');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0005_alter_user_last_login_null', '2020-05-09 07:17:55.892231');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0006_require_contenttypes_0002', '2020-05-09 07:17:55.972466');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0007_alter_validators_add_error_messages', '2020-05-09 07:17:56.150534');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0008_alter_user_username_max_length', '2020-05-09 07:17:56.232286');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0009_alter_user_last_name_max_length', '2020-05-09 07:17:56.318090');
INSERT INTO `django_migrations` VALUES ('12', 'auth', '0010_alter_group_name_max_length', '2020-05-09 07:17:57.939541');
INSERT INTO `django_migrations` VALUES ('13', 'auth', '0011_update_proxy_permissions', '2020-05-09 07:17:58.121088');
INSERT INTO `django_migrations` VALUES ('14', 'Course', '0001_initial', '2020-05-09 07:18:04.959718');
INSERT INTO `django_migrations` VALUES ('15', 'Course', '0002_auto_20200508_1617', '2020-05-09 07:18:38.216392');
INSERT INTO `django_migrations` VALUES ('16', 'Course', '0003_auto_20200508_1619', '2020-05-09 07:18:44.890563');
INSERT INTO `django_migrations` VALUES ('17', 'Course', '0004_auto_20200508_1626', '2020-05-09 07:18:47.444790');
INSERT INTO `django_migrations` VALUES ('18', 'Course', '0005_auto_20200508_1627', '2020-05-09 07:18:50.769496');
INSERT INTO `django_migrations` VALUES ('19', 'Course', '0006_auto_20200508_1627', '2020-05-09 07:18:51.183030');
INSERT INTO `django_migrations` VALUES ('20', 'Course', '0007_coursedetail_number', '2020-05-09 07:18:52.487225');
INSERT INTO `django_migrations` VALUES ('21', 'Course', '0008_practicalcourse_isbuy', '2020-05-09 07:18:54.151288');
INSERT INTO `django_migrations` VALUES ('22', 'Account', '0001_initial', '2020-05-09 07:18:59.594112');
INSERT INTO `django_migrations` VALUES ('23', 'admin', '0001_initial', '2020-05-09 07:19:21.232479');
INSERT INTO `django_migrations` VALUES ('24', 'admin', '0002_logentry_remove_auto_add', '2020-05-09 07:19:25.742510');
INSERT INTO `django_migrations` VALUES ('25', 'admin', '0003_logentry_add_action_flag_choices', '2020-05-09 07:19:25.845744');
INSERT INTO `django_migrations` VALUES ('26', 'sessions', '0001_initial', '2020-05-09 07:19:26.741348');
INSERT INTO `django_migrations` VALUES ('27', 'Course', '0009_auto_20200510_2335', '2020-05-10 15:35:59.867642');
INSERT INTO `django_migrations` VALUES ('28', 'Course', '0010_module_module', '2020-05-11 11:48:27.965771');
INSERT INTO `django_migrations` VALUES ('29', 'Account', '0002_auto_20200514_0021', '2020-05-13 16:21:56.241792');
INSERT INTO `django_migrations` VALUES ('30', 'Account', '0003_auto_20200514_1440', '2020-05-14 06:41:36.095683');
INSERT INTO `django_migrations` VALUES ('31', 'Account', '0004_student_teacher', '2020-05-14 07:28:17.808787');
INSERT INTO `django_migrations` VALUES ('32', 'Account', '0005_auto_20200514_1836', '2020-05-14 10:38:00.124377');
INSERT INTO `django_migrations` VALUES ('33', 'Classroom', '0001_initial', '2020-05-14 10:38:08.827102');
INSERT INTO `django_migrations` VALUES ('34', 'Classroom', '0002_auto_20200514_1841', '2020-05-14 12:42:59.443776');
INSERT INTO `django_migrations` VALUES ('35', 'Account', '0006_auto_20200514_2307', '2020-05-14 15:08:16.927232');
INSERT INTO `django_migrations` VALUES ('36', 'Classroom', '0003_auto_20200514_2307', '2020-05-14 15:08:18.376358');
INSERT INTO `django_migrations` VALUES ('37', 'Classroom', '0004_auto_20200514_2316', '2020-05-14 15:16:53.555576');
INSERT INTO `django_migrations` VALUES ('38', 'Classroom', '0005_auto_20200514_2327', '2020-05-14 15:28:24.845007');
INSERT INTO `django_migrations` VALUES ('39', 'Account', '0007_account_identity', '2020-05-15 03:35:37.955366');
INSERT INTO `django_migrations` VALUES ('40', 'Account', '0008_delete_task', '2020-05-15 10:17:52.748035');
INSERT INTO `django_migrations` VALUES ('41', 'Classroom', '0006_task', '2020-05-15 10:17:53.762915');
INSERT INTO `django_migrations` VALUES ('42', 'Course', '0011_auto_20200515_2208', '2020-05-15 14:08:52.370269');
INSERT INTO `django_migrations` VALUES ('43', 'Classroom', '0007_auto_20200515_2208', '2020-05-15 14:09:01.286944');
INSERT INTO `django_migrations` VALUES ('44', 'Shopping', '0001_initial', '2020-05-15 14:09:02.920218');
INSERT INTO `django_migrations` VALUES ('45', 'Course', '0012_coursechapter_homeworkprice', '2020-05-15 14:35:09.791977');
INSERT INTO `django_migrations` VALUES ('46', 'Course', '0013_coursesection_videourl', '2020-05-16 10:40:48.741778');
INSERT INTO `django_migrations` VALUES ('47', 'Account', '0009_auto_20200516_2308', '2020-05-16 15:08:57.844184');
INSERT INTO `django_migrations` VALUES ('48', 'Account', '0010_auto_20200517_1732', '2020-05-17 09:32:40.728353');
INSERT INTO `django_migrations` VALUES ('49', 'RBAC', '0001_initial', '2020-05-17 09:32:50.209786');
INSERT INTO `django_migrations` VALUES ('50', 'RBAC', '0002_auto_20200405_2153', '2020-05-17 09:33:13.656086');
INSERT INTO `django_migrations` VALUES ('51', 'RBAC', '0003_auto_20200405_2251', '2020-05-17 09:33:16.920359');
INSERT INTO `django_migrations` VALUES ('52', 'RBAC', '0004_rbacuserinfo_password', '2020-05-17 09:33:18.522077');
INSERT INTO `django_migrations` VALUES ('53', 'RBAC', '0005_role_duty', '2020-05-17 09:33:19.720869');
INSERT INTO `django_migrations` VALUES ('54', 'Classroom', '0008_auto_20200517_2117', '2020-05-17 13:17:28.056463');
INSERT INTO `django_migrations` VALUES ('55', 'Classroom', '0009_task_state', '2020-05-17 13:19:28.603345');
INSERT INTO `django_migrations` VALUES ('56', 'Account', '0011_manager', '2020-05-19 03:29:06.145563');

-- ----------------------------
-- Table structure for `django_session`
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('0us6u9wqyodnka0djlv1jgw1mowetq5v', 'YzAzYzdkNTcyYTVhZjkzMjZkMWM2YmU1MmFmN2M2Zjk3YTFkNGQxODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-31 09:59:35.890814');
INSERT INTO `django_session` VALUES ('4bjambc27ckuda8iphiptlc0xsz78k60', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 12:34:22.531374');
INSERT INTO `django_session` VALUES ('6m1hx6lbmlsnnoul5382ckzmvzs401v9', 'NGU2N2JlMjI5YzBjMDA5MmYxZDk2Y2I1OGIzNGExY2FhOTdkNzljZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-31 09:23:47.972208');
INSERT INTO `django_session` VALUES ('6vtgiskwoy9prb2rcs221acox6q0n5ap', 'YzAzYzdkNTcyYTVhZjkzMjZkMWM2YmU1MmFmN2M2Zjk3YTFkNGQxODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-06-02 10:14:01.972597');
INSERT INTO `django_session` VALUES ('7z1ya2tojg1qeg1lq585thp2ab32k5rv', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 14:32:24.799382');
INSERT INTO `django_session` VALUES ('8snibqmq3fsbxuf6xebnzspcq1g528f9', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 12:10:32.204386');
INSERT INTO `django_session` VALUES ('93pydmvtxc7wojv00t11xspzpf55tj3p', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 12:02:31.055153');
INSERT INTO `django_session` VALUES ('cme3i0wkx89sa1nfsqsp25nfkaha0y5e', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 11:34:49.011872');
INSERT INTO `django_session` VALUES ('d92w0xf8461pkybnz5l2ouhl8rhcddm0', 'MmM1Y2ZiMGYzZjQ0MWI3MjVmZDgxNjc0OWNkZDk1NjhiNjcxY2UyZjp7InVzZXJfaW5mbyI6eyJpZCI6MSwidXNlcm5hbWUiOiJBbGV4In0sIk1hdHJpeFBlcm1pc3Npb25VcmxMaXN0S2V5Ijp7IlJCQUNfcmJhY3VzZXJpbmZvX2FkZCI6eyJpZCI6MSwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTYyMTBcdTU0NTgiLCJ1cmwiOiIvc3RhcmsvUkJBQy9yYmFjdXNlcmluZm8vYWRkLyIsInBpZCI6NCwicF90aXRsZSI6Ilx1NjIxMFx1NTQ1OFx1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL1JCQUMvcmJhY3VzZXJpbmZvL2NoZWNrLyJ9LCJSQkFDX3JiYWN1c2VyaW5mb19kZWxldGUiOnsiaWQiOjIsInRpdGxlIjoiXHU1MjIwXHU5NjY0XHU2MjEwXHU1NDU4IiwidXJsIjoiL3N0YXJrL1JCQUMvcmJhY3VzZXJpbmZvL2RlbGV0ZS8oP1A8cGs+XFxkKykvIiwicGlkIjo0LCJwX3RpdGxlIjoiXHU2MjEwXHU1NDU4XHU1MjE3XHU4ODY4IiwicF91cmwiOiIvc3RhcmsvUkJBQy9yYmFjdXNlcmluZm8vY2hlY2svIn0sIlJCQUNfcmJhY3VzZXJpbmZvX2NoYW5nZSI6eyJpZCI6MywidGl0bGUiOiJcdTRmZWVcdTY1MzlcdTYyMTBcdTU0NTgiLCJ1cmwiOiIvc3RhcmsvUkJBQy9yYmFjdXNlcmluZm8vY2hhbmdlLyg/UDxwaz5cXGQrKS8iLCJwaWQiOjQsInBfdGl0bGUiOiJcdTYyMTBcdTU0NThcdTUyMTdcdTg4NjgiLCJwX3VybCI6Ii9zdGFyay9SQkFDL3JiYWN1c2VyaW5mby9jaGVjay8ifSwiUkJBQ19yYmFjdXNlcmluZm9fY2hlY2siOnsiaWQiOjQsInRpdGxlIjoiXHU2MjEwXHU1NDU4XHU1MjE3XHU4ODY4IiwidXJsIjoiL3N0YXJrL1JCQUMvcmJhY3VzZXJpbmZvL2NoZWNrLyIsInBpZCI6bnVsbCwicF90aXRsZSI6bnVsbCwicF91cmwiOm51bGx9LCJSQkFDX2RlcGFydG1lbnRfYWRkIjp7ImlkIjo5LCJ0aXRsZSI6Ilx1NmRmYlx1NTJhMFx1OTBlOFx1OTVlOCIsInVybCI6Ii9zdGFyay9SQkFDL2RlcGFydG1lbnQvYWRkLyIsInBpZCI6MTIsInBfdGl0bGUiOiJcdTkwZThcdTk1ZThcdTUyMTdcdTg4NjgiLCJwX3VybCI6Ii9zdGFyay9SQkFDL2RlcGFydG1lbnQvY2hlY2svIn0sIlJCQUNfZGVwYXJ0bWVudF9kZWxldGUiOnsiaWQiOjEwLCJ0aXRsZSI6Ilx1NTIyMFx1OTY2NFx1OTBlOFx1OTVlOCIsInVybCI6Ii9zdGFyay9SQkFDL2RlcGFydG1lbnQvZGVsZXRlLyg/UDxwaz5cXGQrKS8iLCJwaWQiOjEyLCJwX3RpdGxlIjoiXHU5MGU4XHU5NWU4XHU1MjE3XHU4ODY4IiwicF91cmwiOiIvc3RhcmsvUkJBQy9kZXBhcnRtZW50L2NoZWNrLyJ9LCJSQkFDX2RlcGFydG1lbnRfY2hhbmdlIjp7ImlkIjoxMSwidGl0bGUiOiJcdTRmZWVcdTY1MzlcdTkwZThcdTk1ZTgiLCJ1cmwiOiIvc3RhcmsvUkJBQy9kZXBhcnRtZW50L2NoYW5nZS8oP1A8cGs+XFxkKykvIiwicGlkIjoxMiwicF90aXRsZSI6Ilx1OTBlOFx1OTVlOFx1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL1JCQUMvZGVwYXJ0bWVudC9jaGVjay8ifSwiUkJBQ19kZXBhcnRtZW50X2NoZWNrIjp7ImlkIjoxMiwidGl0bGUiOiJcdTkwZThcdTk1ZThcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvc3RhcmsvUkJBQy9kZXBhcnRtZW50L2NoZWNrLyIsInBpZCI6bnVsbCwicF90aXRsZSI6bnVsbCwicF91cmwiOm51bGx9LCJSQkFDX3JvbGVfYWRkIjp7ImlkIjoxMywidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTg5ZDJcdTgyNzIiLCJ1cmwiOiIvc3RhcmsvUkJBQy9yb2xlL2FkZC8iLCJwaWQiOjE2LCJwX3RpdGxlIjoiXHU4OWQyXHU4MjcyXHU1MjE3XHU4ODY4IiwicF91cmwiOiIvc3RhcmsvUkJBQy9yb2xlL2NoZWNrLyJ9LCJSQkFDX3JvbGVfZGVsZXRlIjp7ImlkIjoxNCwidGl0bGUiOiJcdTUyMjBcdTk2NjRcdTg5ZDJcdTgyNzIiLCJ1cmwiOiIvc3RhcmsvUkJBQy9yb2xlL2RlbGV0ZS8oP1A8cGs+XFxkKykvIiwicGlkIjoxNiwicF90aXRsZSI6Ilx1ODlkMlx1ODI3Mlx1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL1JCQUMvcm9sZS9jaGVjay8ifSwiUkJBQ19yb2xlX2NoYW5nZSI6eyJpZCI6MTUsInRpdGxlIjoiXHU0ZmVlXHU2NTM5XHU4OWQyXHU4MjcyIiwidXJsIjoiL3N0YXJrL1JCQUMvcm9sZS9jaGFuZ2UvKD9QPHBrPlxcZCspLyIsInBpZCI6MTYsInBfdGl0bGUiOiJcdTg5ZDJcdTgyNzJcdTUyMTdcdTg4NjgiLCJwX3VybCI6Ii9zdGFyay9SQkFDL3JvbGUvY2hlY2svIn0sIlJCQUNfcm9sZV9jaGVjayI6eyJpZCI6MTYsInRpdGxlIjoiXHU4OWQyXHU4MjcyXHU1MjE3XHU4ODY4IiwidXJsIjoiL3N0YXJrL1JCQUMvcm9sZS9jaGVjay8iLCJwaWQiOm51bGwsInBfdGl0bGUiOm51bGwsInBfdXJsIjpudWxsfSwiUkJBQ19wZXJtaXNzaW9uX2FkZCI6eyJpZCI6MTcsInRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU2NzQzXHU5NjUwIiwidXJsIjoiL3N0YXJrL1JCQUMvcGVybWlzc2lvbi9hZGQvIiwicGlkIjoyMCwicF90aXRsZSI6Ilx1Njc0M1x1OTY1MFx1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL1JCQUMvcGVybWlzc2lvbi9jaGVjay8ifSwiUkJBQ19wZXJtaXNzaW9uX2RlbGV0ZSI6eyJpZCI6MTgsInRpdGxlIjoiXHU1MjIwXHU5NjY0XHU2NzQzXHU5NjUwIiwidXJsIjoiL3N0YXJrL1JCQUMvcGVybWlzc2lvbi9kZWxldGUvKD9QPHBrPlxcZCspLyIsInBpZCI6MjAsInBfdGl0bGUiOiJcdTY3NDNcdTk2NTBcdTUyMTdcdTg4NjgiLCJwX3VybCI6Ii9zdGFyay9SQkFDL3Blcm1pc3Npb24vY2hlY2svIn0sIlJCQUNfcGVybWlzc2lvbl9jaGFuZ2UiOnsiaWQiOjE5LCJ0aXRsZSI6Ilx1NGZlZVx1NjUzOVx1Njc0M1x1OTY1MCIsInVybCI6Ii9zdGFyay9SQkFDL3Blcm1pc3Npb24vY2hhbmdlLyg/UDxwaz5cXGQrKS8iLCJwaWQiOjIwLCJwX3RpdGxlIjoiXHU2NzQzXHU5NjUwXHU1MjE3XHU4ODY4IiwicF91cmwiOiIvc3RhcmsvUkJBQy9wZXJtaXNzaW9uL2NoZWNrLyJ9LCJSQkFDX3Blcm1pc3Npb25fY2hlY2siOnsiaWQiOjIwLCJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1NTIxN1x1ODg2OCIsInVybCI6Ii9zdGFyay9SQkFDL3Blcm1pc3Npb24vY2hlY2svIiwicGlkIjpudWxsLCJwX3RpdGxlIjpudWxsLCJwX3VybCI6bnVsbH0sIlJCQUNfbWVudV9hZGQiOnsiaWQiOjIyLCJ0aXRsZSI6Ilx1NmRmYlx1NTJhMFx1ODNkY1x1NTM1NSIsInVybCI6Ii9zdGFyay9SQkFDL21lbnUvYWRkLyIsInBpZCI6MjUsInBfdGl0bGUiOiJcdTgzZGNcdTUzNTVcdTUyMTdcdTg4NjgiLCJwX3VybCI6Ii9zdGFyay9SQkFDL21lbnUvY2hlY2svIn0sIlJCQUNfbWVudV9kZWxldGUiOnsiaWQiOjIzLCJ0aXRsZSI6Ilx1NTIyMFx1OTY2NFx1ODNkY1x1NTM1NSIsInVybCI6Ii9zdGFyay9SQkFDL21lbnUvZGVsZXRlLyg/UDxwaz5cXGQrKS8iLCJwaWQiOjI1LCJwX3RpdGxlIjoiXHU4M2RjXHU1MzU1XHU1MjE3XHU4ODY4IiwicF91cmwiOiIvc3RhcmsvUkJBQy9tZW51L2NoZWNrLyJ9LCJSQkFDX21lbnVfY2hhbmdlIjp7ImlkIjoyNCwidGl0bGUiOiJcdTRmZWVcdTY1MzlcdTgzZGNcdTUzNTUiLCJ1cmwiOiIvc3RhcmsvUkJBQy9tZW51L2NoYW5nZS8oP1A8cGs+XFxkKykvIiwicGlkIjoyNSwicF90aXRsZSI6Ilx1ODNkY1x1NTM1NVx1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL1JCQUMvbWVudS9jaGVjay8ifSwiUkJBQ19tZW51X2NoZWNrIjp7ImlkIjoyNSwidGl0bGUiOiJcdTgzZGNcdTUzNTVcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvc3RhcmsvUkJBQy9tZW51L2NoZWNrLyIsInBpZCI6bnVsbCwicF90aXRsZSI6bnVsbCwicF91cmwiOm51bGx9LCJSQkFDX3Blcm1pc3Npb25fYXNzaWdubWVudCI6eyJpZCI6NzAsInRpdGxlIjoiXHU2NzQzXHU5NjUwXHU1MjA2XHU5MTRkIiwidXJsIjoiL3N0YXJrL1JCQUMvcGVybWlzc2lvbi9hc3NpZ25tZW50LyIsInBpZCI6bnVsbCwicF90aXRsZSI6bnVsbCwicF91cmwiOm51bGx9LCJSQkFDX3Blcm1pc3Npb25fbXVsdGkiOnsiaWQiOjcxLCJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1NjI3OVx1OTFjZlx1NjRjZFx1NGY1YyIsInVybCI6Ii9zdGFyay9SQkFDL3Blcm1pc3Npb24vbXVsdGkvIiwicGlkIjpudWxsLCJwX3RpdGxlIjpudWxsLCJwX3VybCI6bnVsbH0sIlJCQUNfbWVudV9tZW51QXNzaWdubWVudCI6eyJpZCI6NzIsInRpdGxlIjoiXHU4M2RjXHU1MzU1XHU1MjA2XHU5MTRkIiwidXJsIjoiL3N0YXJrL1JCQUMvbWVudS9hc3NpZ25tZW50LyIsInBpZCI6bnVsbCwicF90aXRsZSI6bnVsbCwicF91cmwiOm51bGx9LCJSQkFDX3JiYWN1c2VyaW5mb19yZXNldF9wd2QiOnsiaWQiOjc1LCJ0aXRsZSI6Ilx1OTFjZFx1N2Y2ZVx1NWJjNlx1NzgwMSIsInVybCI6Ii9zdGFyay9SQkFDL3JiYWN1c2VyaW5mby9yZXNldC9wYXNzd29yZC8oP1A8cGs+XFxkKykvIiwicGlkIjo0LCJwX3RpdGxlIjoiXHU2MjEwXHU1NDU4XHU1MjE3XHU4ODY4IiwicF91cmwiOiIvc3RhcmsvUkJBQy9yYmFjdXNlcmluZm8vY2hlY2svIn0sIkNvdXJzZV9mcmVlY291cnNlX2FkZCI6eyJpZCI6ODYsInRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU1MTRkXHU4ZDM5XHU4YmZlXHU3YTBiIiwidXJsIjoiL3N0YXJrL0NvdXJzZS9mcmVlY291cnNlL2FkZC8iLCJwaWQiOjg5LCJwX3RpdGxlIjoiXHU1MTRkXHU4ZDM5XHU4YmZlXHU3YTBiIiwicF91cmwiOiIvc3RhcmsvQ291cnNlL2ZyZWVjb3Vyc2UvY2hlY2svIn0sIkNvdXJzZV9mcmVlY291cnNlX2RlbGV0ZSI6eyJpZCI6ODcsInRpdGxlIjoiXHU1MjIwXHU5NjY0XHU1MTRkXHU4ZDM5XHU4YmZlXHU3YTBiIiwidXJsIjoiL3N0YXJrL0NvdXJzZS9mcmVlY291cnNlL2RlbGV0ZS8oP1A8cGs+XFxkKykvIiwicGlkIjo4OSwicF90aXRsZSI6Ilx1NTE0ZFx1OGQzOVx1OGJmZVx1N2EwYiIsInBfdXJsIjoiL3N0YXJrL0NvdXJzZS9mcmVlY291cnNlL2NoZWNrLyJ9LCJDb3Vyc2VfZnJlZWNvdXJzZV9jaGFuZ2UiOnsiaWQiOjg4LCJ0aXRsZSI6Ilx1NGZlZVx1NjUzOVx1NTE0ZFx1OGQzOVx1OGJmZVx1N2EwYiIsInVybCI6Ii9zdGFyay9Db3Vyc2UvZnJlZWNvdXJzZS9jaGFuZ2UvKD9QPHBrPlxcZCspLyIsInBpZCI6ODksInBfdGl0bGUiOiJcdTUxNGRcdThkMzlcdThiZmVcdTdhMGIiLCJwX3VybCI6Ii9zdGFyay9Db3Vyc2UvZnJlZWNvdXJzZS9jaGVjay8ifSwiQ291cnNlX2ZyZWVjb3Vyc2VfY2hlY2siOnsiaWQiOjg5LCJ0aXRsZSI6Ilx1NTE0ZFx1OGQzOVx1OGJmZVx1N2EwYiIsInVybCI6Ii9zdGFyay9Db3Vyc2UvZnJlZWNvdXJzZS9jaGVjay8iLCJwaWQiOm51bGwsInBfdGl0bGUiOm51bGwsInBfdXJsIjpudWxsfSwiQ291cnNlX3ByYWN0aWNhbGNvdXJzZV9hZGQiOnsiaWQiOjkwLCJ0aXRsZSI6Ilx1NmRmYlx1NTJhMFx1NWI5ZVx1NjIxOFx1OGJmZVx1N2EwYiIsInVybCI6Ii9zdGFyay9Db3Vyc2UvcHJhY3RpY2FsY291cnNlL2FkZC8iLCJwaWQiOjkzLCJwX3RpdGxlIjoiXHU1YjllXHU2MjE4XHU4YmZlXHU3YTBiIiwicF91cmwiOiIvc3RhcmsvQ291cnNlL3ByYWN0aWNhbGNvdXJzZS9jaGVjay8ifSwiQ291cnNlX3ByYWN0aWNhbGNvdXJzZV9kZWxldGUiOnsiaWQiOjkxLCJ0aXRsZSI6Ilx1NTIyMFx1OTY2NFx1NWI5ZVx1NjIxOFx1OGJmZVx1N2EwYiIsInVybCI6Ii9zdGFyay9Db3Vyc2UvcHJhY3RpY2FsY291cnNlL2RlbGV0ZS8oP1A8cGs+XFxkKykvIiwicGlkIjo5MywicF90aXRsZSI6Ilx1NWI5ZVx1NjIxOFx1OGJmZVx1N2EwYiIsInBfdXJsIjoiL3N0YXJrL0NvdXJzZS9wcmFjdGljYWxjb3Vyc2UvY2hlY2svIn0sIkNvdXJzZV9wcmFjdGljYWxjb3Vyc2VfY2hhbmdlIjp7ImlkIjo5MiwidGl0bGUiOiJcdTRmZWVcdTY1MzlcdTViOWVcdTYyMThcdThiZmVcdTdhMGIiLCJ1cmwiOiIvc3RhcmsvQ291cnNlL3ByYWN0aWNhbGNvdXJzZS9jaGFuZ2UvKD9QPHBrPlxcZCspLyIsInBpZCI6OTMsInBfdGl0bGUiOiJcdTViOWVcdTYyMThcdThiZmVcdTdhMGIiLCJwX3VybCI6Ii9zdGFyay9Db3Vyc2UvcHJhY3RpY2FsY291cnNlL2NoZWNrLyJ9LCJDb3Vyc2VfcHJhY3RpY2FsY291cnNlX2NoZWNrIjp7ImlkIjo5MywidGl0bGUiOiJcdTViOWVcdTYyMThcdThiZmVcdTdhMGIiLCJ1cmwiOiIvc3RhcmsvQ291cnNlL3ByYWN0aWNhbGNvdXJzZS9jaGVjay8iLCJwaWQiOm51bGwsInBfdGl0bGUiOm51bGwsInBfdXJsIjpudWxsfSwiQ291cnNlX2VtcGxveW1lbnRjb3Vyc2VfYWRkIjp7ImlkIjo5NiwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTVjMzFcdTRlMWFcdTczZWRcdThiZmVcdTdhMGIiLCJ1cmwiOiIvc3RhcmsvQ291cnNlL2VtcGxveW1lbnRjb3Vyc2UvYWRkLyIsInBpZCI6OTksInBfdGl0bGUiOiJcdTVjMzFcdTRlMWFcdTczZWRcdThiZmVcdTdhMGIiLCJwX3VybCI6Ii9zdGFyay9Db3Vyc2UvZW1wbG95bWVudGNvdXJzZS9jaGVjay8ifSwiQ291cnNlX2VtcGxveW1lbnRjb3Vyc2VfZGVsZXRlIjp7ImlkIjo5NywidGl0bGUiOiJcdTUyMjBcdTk2NjRcdTVjMzFcdTRlMWFcdTczZWRcdThiZmVcdTdhMGIiLCJ1cmwiOiIvc3RhcmsvQ291cnNlL2VtcGxveW1lbnRjb3Vyc2UvZGVsZXRlLyg/UDxwaz5cXGQrKS8iLCJwaWQiOjk5LCJwX3RpdGxlIjoiXHU1YzMxXHU0ZTFhXHU3M2VkXHU4YmZlXHU3YTBiIiwicF91cmwiOiIvc3RhcmsvQ291cnNlL2VtcGxveW1lbnRjb3Vyc2UvY2hlY2svIn0sIkNvdXJzZV9lbXBsb3ltZW50Y291cnNlX2NoYW5nZSI6eyJpZCI6OTgsInRpdGxlIjoiXHU0ZmVlXHU2NTM5XHU1YzMxXHU0ZTFhXHU3M2VkXHU4YmZlXHU3YTBiIiwidXJsIjoiL3N0YXJrL0NvdXJzZS9lbXBsb3ltZW50Y291cnNlL2NoYW5nZS8oP1A8cGs+XFxkKykvIiwicGlkIjo5OSwicF90aXRsZSI6Ilx1NWMzMVx1NGUxYVx1NzNlZFx1OGJmZVx1N2EwYiIsInBfdXJsIjoiL3N0YXJrL0NvdXJzZS9lbXBsb3ltZW50Y291cnNlL2NoZWNrLyJ9LCJDb3Vyc2VfZW1wbG95bWVudGNvdXJzZV9jaGVjayI6eyJpZCI6OTksInRpdGxlIjoiXHU1YzMxXHU0ZTFhXHU3M2VkXHU4YmZlXHU3YTBiIiwidXJsIjoiL3N0YXJrL0NvdXJzZS9lbXBsb3ltZW50Y291cnNlL2NoZWNrLyIsInBpZCI6bnVsbCwicF90aXRsZSI6bnVsbCwicF91cmwiOm51bGx9LCJDb3Vyc2VfY2F0ZWdvcnlfYWRkIjp7ImlkIjoxMDAsInRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU4YmZlXHU3YTBiXHU1MjA2XHU3YzdiIiwidXJsIjoiL3N0YXJrL0NvdXJzZS9jYXRlZ29yeS9hZGQvIiwicGlkIjoxMDMsInBfdGl0bGUiOiJcdThiZmVcdTdhMGJcdTUyMDZcdTdjN2IiLCJwX3VybCI6Ii9zdGFyay9Db3Vyc2UvY2F0ZWdvcnkvY2hlY2svIn0sIkNvdXJzZV9jYXRlZ29yeV9kZWxldGUiOnsiaWQiOjEwMSwidGl0bGUiOiJcdTUyMjBcdTk2NjRcdThiZmVcdTdhMGJcdTUyMDZcdTdjN2IiLCJ1cmwiOiIvc3RhcmsvQ291cnNlL2NhdGVnb3J5L2RlbGV0ZS8oP1A8cGs+XFxkKykvIiwicGlkIjoxMDMsInBfdGl0bGUiOiJcdThiZmVcdTdhMGJcdTUyMDZcdTdjN2IiLCJwX3VybCI6Ii9zdGFyay9Db3Vyc2UvY2F0ZWdvcnkvY2hlY2svIn0sIkNvdXJzZV9jYXRlZ29yeV9jaGFuZ2UiOnsiaWQiOjEwMiwidGl0bGUiOiJcdTRmZWVcdTY1MzlcdThiZmVcdTdhMGJcdTUyMDZcdTdjN2IiLCJ1cmwiOiIvc3RhcmsvQ291cnNlL2NhdGVnb3J5L2NoYW5nZS8oP1A8cGs+XFxkKykvIiwicGlkIjoxMDMsInBfdGl0bGUiOiJcdThiZmVcdTdhMGJcdTUyMDZcdTdjN2IiLCJwX3VybCI6Ii9zdGFyay9Db3Vyc2UvY2F0ZWdvcnkvY2hlY2svIn0sIkNvdXJzZV9jYXRlZ29yeV9jaGVjayI6eyJpZCI6MTAzLCJ0aXRsZSI6Ilx1OGJmZVx1N2EwYlx1NTIwNlx1N2M3YiIsInVybCI6Ii9zdGFyay9Db3Vyc2UvY2F0ZWdvcnkvY2hlY2svIiwicGlkIjpudWxsLCJwX3RpdGxlIjpudWxsLCJwX3VybCI6bnVsbH0sIkFjY291bnRfYWNjb3VudF9hZGQiOnsiaWQiOjEwNCwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTc1MjhcdTYyMzciLCJ1cmwiOiIvc3RhcmsvQWNjb3VudC9hY2NvdW50L2FkZC8iLCJwaWQiOjEwNywicF90aXRsZSI6Ilx1NzUyOFx1NjIzN1x1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL0FjY291bnQvYWNjb3VudC9jaGVjay8ifSwiQWNjb3VudF9hY2NvdW50X2RlbGV0ZSI6eyJpZCI6MTA1LCJ0aXRsZSI6Ilx1NTIyMFx1OTY2NFx1NzUyOFx1NjIzNyIsInVybCI6Ii9zdGFyay9BY2NvdW50L2FjY291bnQvZGVsZXRlLyg/UDxwaz5cXGQrKS8iLCJwaWQiOjEwNywicF90aXRsZSI6Ilx1NzUyOFx1NjIzN1x1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL0FjY291bnQvYWNjb3VudC9jaGVjay8ifSwiQWNjb3VudF9hY2NvdW50X2NoYW5nZSI6eyJpZCI6MTA2LCJ0aXRsZSI6Ilx1NGZlZVx1NjUzOVx1NzUyOFx1NjIzNyIsInVybCI6Ii9zdGFyay9BY2NvdW50L2FjY291bnQvY2hhbmdlLyg/UDxwaz5cXGQrKS8iLCJwaWQiOjEwNywicF90aXRsZSI6Ilx1NzUyOFx1NjIzN1x1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL0FjY291bnQvYWNjb3VudC9jaGVjay8ifSwiQWNjb3VudF9hY2NvdW50X2NoZWNrIjp7ImlkIjoxMDcsInRpdGxlIjoiXHU3NTI4XHU2MjM3XHU1MjE3XHU4ODY4IiwidXJsIjoiL3N0YXJrL0FjY291bnQvYWNjb3VudC9jaGVjay8iLCJwaWQiOm51bGwsInBfdGl0bGUiOm51bGwsInBfdXJsIjpudWxsfSwiQWNjb3VudF9zdHVkZW50X2FkZCI6eyJpZCI6MTA4LCJ0aXRsZSI6Ilx1NmRmYlx1NTJhMFx1NWI2Nlx1NTQ1OCIsInVybCI6Ii9zdGFyay9BY2NvdW50L3N0dWRlbnQvYWRkLyIsInBpZCI6MTExLCJwX3RpdGxlIjoiXHU1YjY2XHU1NDU4XHU1MjE3XHU4ODY4IiwicF91cmwiOiIvc3RhcmsvQWNjb3VudC9zdHVkZW50L2NoZWNrLyJ9LCJBY2NvdW50X3N0dWRlbnRfZGVsZXRlIjp7ImlkIjoxMDksInRpdGxlIjoiXHU1MjIwXHU5NjY0XHU1YjY2XHU1NDU4IiwidXJsIjoiL3N0YXJrL0FjY291bnQvc3R1ZGVudC9kZWxldGUvKD9QPHBrPlxcZCspLyIsInBpZCI6MTExLCJwX3RpdGxlIjoiXHU1YjY2XHU1NDU4XHU1MjE3XHU4ODY4IiwicF91cmwiOiIvc3RhcmsvQWNjb3VudC9zdHVkZW50L2NoZWNrLyJ9LCJBY2NvdW50X3N0dWRlbnRfY2hhbmdlIjp7ImlkIjoxMTAsInRpdGxlIjoiXHU0ZmVlXHU2NTM5XHU1YjY2XHU1NDU4IiwidXJsIjoiL3N0YXJrL0FjY291bnQvc3R1ZGVudC9jaGFuZ2UvKD9QPHBrPlxcZCspLyIsInBpZCI6MTExLCJwX3RpdGxlIjoiXHU1YjY2XHU1NDU4XHU1MjE3XHU4ODY4IiwicF91cmwiOiIvc3RhcmsvQWNjb3VudC9zdHVkZW50L2NoZWNrLyJ9LCJBY2NvdW50X3N0dWRlbnRfY2hlY2siOnsiaWQiOjExMSwidGl0bGUiOiJcdTViNjZcdTU0NThcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvc3RhcmsvQWNjb3VudC9zdHVkZW50L2NoZWNrLyIsInBpZCI6bnVsbCwicF90aXRsZSI6bnVsbCwicF91cmwiOm51bGx9LCJBY2NvdW50X3RlYWNoZXJfYWRkIjp7ImlkIjoxMTIsInRpdGxlIjoiXHU2ZGZiXHU1MmEwXHU2NTU5XHU1ZTA4IiwidXJsIjoiL3N0YXJrL0FjY291bnQvdGVhY2hlci9hZGQvIiwicGlkIjoxMTUsInBfdGl0bGUiOiJcdTY1NTlcdTVlMDhcdTUyMTdcdTg4NjgiLCJwX3VybCI6Ii9zdGFyay9BY2NvdW50L3RlYWNoZXIvY2hlY2svIn0sIkFjY291bnRfdGVhY2hlcl9kZWxldGUiOnsiaWQiOjExMywidGl0bGUiOiJcdTUyMjBcdTk2NjRcdTY1NTlcdTVlMDgiLCJ1cmwiOiIvc3RhcmsvQWNjb3VudC90ZWFjaGVyL2RlbGV0ZS8oP1A8cGs+XFxkKykvIiwicGlkIjoxMTUsInBfdGl0bGUiOiJcdTY1NTlcdTVlMDhcdTUyMTdcdTg4NjgiLCJwX3VybCI6Ii9zdGFyay9BY2NvdW50L3RlYWNoZXIvY2hlY2svIn0sIkFjY291bnRfdGVhY2hlcl9jaGFuZ2UiOnsiaWQiOjExNCwidGl0bGUiOiJcdTRmZWVcdTY1MzlcdTY1NTlcdTVlMDgiLCJ1cmwiOiIvc3RhcmsvQWNjb3VudC90ZWFjaGVyL2NoYW5nZS8oP1A8cGs+XFxkKykvIiwicGlkIjoxMTUsInBfdGl0bGUiOiJcdTY1NTlcdTVlMDhcdTUyMTdcdTg4NjgiLCJwX3VybCI6Ii9zdGFyay9BY2NvdW50L3RlYWNoZXIvY2hlY2svIn0sIkFjY291bnRfdGVhY2hlcl9jaGVjayI6eyJpZCI6MTE1LCJ0aXRsZSI6Ilx1NjU1OVx1NWUwOFx1NTIxN1x1ODg2OCIsInVybCI6Ii9zdGFyay9BY2NvdW50L3RlYWNoZXIvY2hlY2svIiwicGlkIjpudWxsLCJwX3RpdGxlIjpudWxsLCJwX3VybCI6bnVsbH0sIkFjY291bnRfbWFuYWdlcl9hZGQiOnsiaWQiOjExNiwidGl0bGUiOiJcdTZkZmJcdTUyYTBcdTdiYTFcdTc0MDZcdTU0NTgiLCJ1cmwiOiIvc3RhcmsvQWNjb3VudC9tYW5hZ2VyL2FkZC8iLCJwaWQiOjExOSwicF90aXRsZSI6Ilx1N2JhMVx1NzQwNlx1NTQ1OFx1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL0FjY291bnQvbWFuYWdlci9jaGVjay8ifSwiQWNjb3VudF9tYW5hZ2VyX2RlbGV0ZSI6eyJpZCI6MTE3LCJ0aXRsZSI6Ilx1NTIyMFx1OTY2NFx1N2JhMVx1NzQwNlx1NTQ1OCIsInVybCI6Ii9zdGFyay9BY2NvdW50L21hbmFnZXIvZGVsZXRlLyg/UDxwaz5cXGQrKS8iLCJwaWQiOjExOSwicF90aXRsZSI6Ilx1N2JhMVx1NzQwNlx1NTQ1OFx1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL0FjY291bnQvbWFuYWdlci9jaGVjay8ifSwiQWNjb3VudF9tYW5hZ2VyX2NoYW5nZSI6eyJpZCI6MTE4LCJ0aXRsZSI6Ilx1NGZlZVx1NjUzOVx1N2JhMVx1NzQwNlx1NTQ1OCIsInVybCI6Ii9zdGFyay9BY2NvdW50L21hbmFnZXIvY2hhbmdlLyg/UDxwaz5cXGQrKS8iLCJwaWQiOjExOSwicF90aXRsZSI6Ilx1N2JhMVx1NzQwNlx1NTQ1OFx1NTIxN1x1ODg2OCIsInBfdXJsIjoiL3N0YXJrL0FjY291bnQvbWFuYWdlci9jaGVjay8ifSwiQWNjb3VudF9tYW5hZ2VyX2NoZWNrIjp7ImlkIjoxMTksInRpdGxlIjoiXHU3YmExXHU3NDA2XHU1NDU4XHU1MjE3XHU4ODY4IiwidXJsIjoiL3N0YXJrL0FjY291bnQvbWFuYWdlci9jaGVjay8iLCJwaWQiOm51bGwsInBfdGl0bGUiOm51bGwsInBfdXJsIjpudWxsfX0sIk1hdHJpeFBlcm1pc3Npb25NZW51S2V5Ijp7IjIiOnsidGl0bGUiOiJcdTViNjZcdTU0NThcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEtdXNlci1jaXJjbGUiLCJjaGlsZHJlbiI6W3siaWQiOjQsInRpdGxlIjoiXHU2MjEwXHU1NDU4XHU1MjE3XHU4ODY4IiwidXJsIjoiL3N0YXJrL1JCQUMvcmJhY3VzZXJpbmZvL2NoZWNrLyJ9LHsiaWQiOjEyLCJ0aXRsZSI6Ilx1OTBlOFx1OTVlOFx1NTIxN1x1ODg2OCIsInVybCI6Ii9zdGFyay9SQkFDL2RlcGFydG1lbnQvY2hlY2svIn0seyJpZCI6MTExLCJ0aXRsZSI6Ilx1NWI2Nlx1NTQ1OFx1NTIxN1x1ODg2OCIsInVybCI6Ii9zdGFyay9BY2NvdW50L3N0dWRlbnQvY2hlY2svIn1dfSwiNiI6eyJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1N2JhMVx1NzQwNiIsImljb24iOiJmYS1nZWFycyIsImNoaWxkcmVuIjpbeyJpZCI6MTYsInRpdGxlIjoiXHU4OWQyXHU4MjcyXHU1MjE3XHU4ODY4IiwidXJsIjoiL3N0YXJrL1JCQUMvcm9sZS9jaGVjay8ifSx7ImlkIjoyMCwidGl0bGUiOiJcdTY3NDNcdTk2NTBcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvc3RhcmsvUkJBQy9wZXJtaXNzaW9uL2NoZWNrLyJ9LHsiaWQiOjI1LCJ0aXRsZSI6Ilx1ODNkY1x1NTM1NVx1NTIxN1x1ODg2OCIsInVybCI6Ii9zdGFyay9SQkFDL21lbnUvY2hlY2svIn0seyJpZCI6NzAsInRpdGxlIjoiXHU2NzQzXHU5NjUwXHU1MjA2XHU5MTRkIiwidXJsIjoiL3N0YXJrL1JCQUMvcGVybWlzc2lvbi9hc3NpZ25tZW50LyJ9LHsiaWQiOjcxLCJ0aXRsZSI6Ilx1Njc0M1x1OTY1MFx1NjI3OVx1OTFjZlx1NjRjZFx1NGY1YyIsInVybCI6Ii9zdGFyay9SQkFDL3Blcm1pc3Npb24vbXVsdGkvIn0seyJpZCI6NzIsInRpdGxlIjoiXHU4M2RjXHU1MzU1XHU1MjA2XHU5MTRkIiwidXJsIjoiL3N0YXJrL1JCQUMvbWVudS9hc3NpZ25tZW50LyJ9XX0sIjUiOnsidGl0bGUiOiJcdThiZmVcdTdhMGJcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEtdmlkZW8tY2FtZXJhIiwiY2hpbGRyZW4iOlt7ImlkIjo4OSwidGl0bGUiOiJcdTUxNGRcdThkMzlcdThiZmVcdTdhMGIiLCJ1cmwiOiIvc3RhcmsvQ291cnNlL2ZyZWVjb3Vyc2UvY2hlY2svIn0seyJpZCI6OTMsInRpdGxlIjoiXHU1YjllXHU2MjE4XHU4YmZlXHU3YTBiIiwidXJsIjoiL3N0YXJrL0NvdXJzZS9wcmFjdGljYWxjb3Vyc2UvY2hlY2svIn0seyJpZCI6OTksInRpdGxlIjoiXHU1YzMxXHU0ZTFhXHU3M2VkXHU4YmZlXHU3YTBiIiwidXJsIjoiL3N0YXJrL0NvdXJzZS9lbXBsb3ltZW50Y291cnNlL2NoZWNrLyJ9LHsiaWQiOjEwMywidGl0bGUiOiJcdThiZmVcdTdhMGJcdTUyMDZcdTdjN2IiLCJ1cmwiOiIvc3RhcmsvQ291cnNlL2NhdGVnb3J5L2NoZWNrLyJ9XX0sIjciOnsidGl0bGUiOiJcdTc1MjhcdTYyMzdcdTdiYTFcdTc0MDYiLCJpY29uIjoiZmEtdXNlcnMiLCJjaGlsZHJlbiI6W3siaWQiOjEwNywidGl0bGUiOiJcdTc1MjhcdTYyMzdcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvc3RhcmsvQWNjb3VudC9hY2NvdW50L2NoZWNrLyJ9LHsiaWQiOjExNSwidGl0bGUiOiJcdTY1NTlcdTVlMDhcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvc3RhcmsvQWNjb3VudC90ZWFjaGVyL2NoZWNrLyJ9LHsiaWQiOjExOSwidGl0bGUiOiJcdTdiYTFcdTc0MDZcdTU0NThcdTUyMTdcdTg4NjgiLCJ1cmwiOiIvc3RhcmsvQWNjb3VudC9tYW5hZ2VyL2NoZWNrLyJ9XX19fQ==', '2020-06-02 06:06:33.056209');
INSERT INTO `django_session` VALUES ('e9z1ys9cvklbyjz9ew0zehgqbua1f3b8', 'NGU2N2JlMjI5YzBjMDA5MmYxZDk2Y2I1OGIzNGExY2FhOTdkNzljZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-31 09:54:33.300582');
INSERT INTO `django_session` VALUES ('eq1kfnybkgkbu4xrp7441ie0wr61s2xu', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 12:10:54.166220');
INSERT INTO `django_session` VALUES ('g58o9m24v48lbiue3e3mkf3xl0laa1sl', 'NGU2N2JlMjI5YzBjMDA5MmYxZDk2Y2I1OGIzNGExY2FhOTdkNzljZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-28 12:42:10.739980');
INSERT INTO `django_session` VALUES ('h5pbjvkr7c8ivjk6izd241457bet9mtm', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 12:09:53.085228');
INSERT INTO `django_session` VALUES ('h8mpcdsbah8ly64lhgw2nwmearnnf0yp', 'NGU2N2JlMjI5YzBjMDA5MmYxZDk2Y2I1OGIzNGExY2FhOTdkNzljZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-06-02 10:39:06.483504');
INSERT INTO `django_session` VALUES ('h95ypsx7iisrniaqfnh5n9j7sv8938sb', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 14:15:45.417156');
INSERT INTO `django_session` VALUES ('hunq6p30e2py6ie2nrwns2c7qel685un', 'NGU2N2JlMjI5YzBjMDA5MmYxZDk2Y2I1OGIzNGExY2FhOTdkNzljZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-29 03:44:55.366447');
INSERT INTO `django_session` VALUES ('hwspv6uhzsx3xxlf18qfl30d7jhe419i', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 10:11:19.898432');
INSERT INTO `django_session` VALUES ('icqv7mfntt8egzptu172n6p4c9nkuy2h', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 12:08:56.866789');
INSERT INTO `django_session` VALUES ('iq49etrnlakkofnywet7joimje6dw5b8', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 15:03:33.197314');
INSERT INTO `django_session` VALUES ('ng2zm8s6wn90hvzvdorrij3rx0rxjr1t', 'NGU2N2JlMjI5YzBjMDA5MmYxZDk2Y2I1OGIzNGExY2FhOTdkNzljZDp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-31 09:55:46.173338');
INSERT INTO `django_session` VALUES ('puy0syfcqf0lta0l2c3rit4o7n55gf81', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 16:18:35.088121');
INSERT INTO `django_session` VALUES ('qdm4ctoovk4fu8ql1mh5qbpi8v7m6kxy', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-24 02:29:52.692799');
INSERT INTO `django_session` VALUES ('qm696jl1f7itr5j47fro1ki9yj3zjc6f', 'Y2Q0ZDkxMGZhNjkyYjRmMzgxNmVlNDQwYzQ4NTY5NDFlMjk3MmQwYTp7Il9hdXRoX3VzZXJfaWQiOiIxMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMzc5OWZkODYwMjBkYTE0Y2UyMzRhMGZiMTcwYmYxNzA3ZTEyODgxNiJ9', '2020-05-31 07:28:39.492260');
INSERT INTO `django_session` VALUES ('r0s033exxr24opy7mo3vu0fyztrdxo4e', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 12:16:09.303152');
INSERT INTO `django_session` VALUES ('rzuilovts0vpo7eygjl71e2eqbizw0mg', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-06-02 03:10:18.346936');
INSERT INTO `django_session` VALUES ('s1kxkwks7gp4d8pcqiadcl6jjvahoj6j', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 12:15:57.683727');
INSERT INTO `django_session` VALUES ('saj8al5z4obrtschbyp0gnv0juddsvna', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 07:39:00.442579');
INSERT INTO `django_session` VALUES ('skn2ybklk8cy26lbxkhxkrt6libv5ts0', 'YzAzYzdkNTcyYTVhZjkzMjZkMWM2YmU1MmFmN2M2Zjk3YTFkNGQxODp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-06-02 10:51:55.743659');
INSERT INTO `django_session` VALUES ('ulupdj43ma962ne4zm4peqcaysuq184t', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-06-02 03:11:41.971758');
INSERT INTO `django_session` VALUES ('yisox1r312hurr180gfk63lcp4ncpwxe', 'MGNkN2RhOWMxYzIxODZhMGIxMDI5YjUzYjE4YzU1MzEyYzEzMTU0YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI1MDMyYWZjM2NiNDczNGRkYWZiYWRkYTFmM2QyZDI5YjhhMjRmMDFmIn0=', '2020-05-23 12:19:48.959922');
INSERT INTO `django_session` VALUES ('z42wgxfx3ixpa1vwvaeyrnglq35jv6ur', 'OTEyYTA2NzhhNjQwMzA1YmVhNWE3ZDk3ODE4NTZlY2U3MTQ4NWQwOTp7fQ==', '2020-05-23 12:16:52.191046');

-- ----------------------------
-- Table structure for `rbac_attendance`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_attendance`;
CREATE TABLE `rbac_attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(32) NOT NULL,
  `record` varchar(64) NOT NULL,
  `score` int(11) NOT NULL,
  `date` datetime(6) NOT NULL,
  `remark` longtext,
  `person_id` int(11) NOT NULL,
  `referee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RBAC_attendance_person_id_449aab03_fk_RBAC_rbacuserinfo_id` (`person_id`),
  KEY `RBAC_attendance_referee_id_8a505cd2_fk_RBAC_rbacuserinfo_id` (`referee_id`),
  CONSTRAINT `RBAC_attendance_person_id_449aab03_fk_RBAC_rbacuserinfo_id` FOREIGN KEY (`person_id`) REFERENCES `rbac_rbacuserinfo` (`id`),
  CONSTRAINT `RBAC_attendance_referee_id_8a505cd2_fk_RBAC_rbacuserinfo_id` FOREIGN KEY (`referee_id`) REFERENCES `rbac_rbacuserinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_attendance
-- ----------------------------

-- ----------------------------
-- Table structure for `rbac_department`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_department`;
CREATE TABLE `rbac_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `duty` longtext NOT NULL,
  `hasRoles_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `RBAC_department_hasRoles_id_946a5c97_fk_RBAC_role_id` (`hasRoles_id`),
  CONSTRAINT `RBAC_department_hasRoles_id_946a5c97_fk_RBAC_role_id` FOREIGN KEY (`hasRoles_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_department
-- ----------------------------
INSERT INTO `rbac_department` VALUES ('1', '项目商谈部', '由各组组长组成，负责与甲方商谈项目的需求功能与出价，整理出具体的需求分析报告或导图。', null);
INSERT INTO `rbac_department` VALUES ('2', '项目开发部', '负责每个项目的进度监督、成员安排、整体架构设计和技术解决方案，合理调配各组成员。', null);
INSERT INTO `rbac_department` VALUES ('3', 'UI设计部', '与项目开发人员沟通，负责前端、移动端页面设计，负责工作室宣传海报、视频的制作。', null);
INSERT INTO `rbac_department` VALUES ('4', '学院联系部', '负责与学院相关部门建立联系，维护工作室为学院制作的有关项目，并负责各种比赛的报名与培训安排。', null);
INSERT INTO `rbac_department` VALUES ('5', '成员管理部', '统一管理各组成员，每月团建，同时负责新成员的培训与学习监督，各组成员之间的流动。', null);
INSERT INTO `rbac_department` VALUES ('6', '技术委员会', '由各组组长和工作室M4、M5级别成员组成，为工作室提供技术支持和技术评审。', null);

-- ----------------------------
-- Table structure for `rbac_menu`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_menu`;
CREATE TABLE `rbac_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `icon` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_menu
-- ----------------------------
INSERT INTO `rbac_menu` VALUES ('1', '主页', 'fa-home');
INSERT INTO `rbac_menu` VALUES ('2', '学员管理', 'fa-user-circle');
INSERT INTO `rbac_menu` VALUES ('5', '课程管理', 'fa-video-camera');
INSERT INTO `rbac_menu` VALUES ('6', '权限管理', 'fa-gears');
INSERT INTO `rbac_menu` VALUES ('7', '用户管理', 'fa-users');

-- ----------------------------
-- Table structure for `rbac_permission`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_permission`;
CREATE TABLE `rbac_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `url` varchar(256) NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  `parentPermission_id` int(11) DEFAULT NULL,
  `title` varchar(32) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RBAC_permission_name_3391f7fb_uniq` (`name`),
  KEY `RBAC_permission_menu_id_abac9f39_fk_RBAC_menu_id` (`menu_id`),
  KEY `RBAC_permission_parentPermission_id_be98b5d3_fk_RBAC_perm` (`parentPermission_id`),
  CONSTRAINT `RBAC_permission_menu_id_abac9f39_fk_RBAC_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `rbac_menu` (`id`),
  CONSTRAINT `RBAC_permission_parentPermission_id_be98b5d3_fk_RBAC_perm` FOREIGN KEY (`parentPermission_id`) REFERENCES `rbac_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_permission
-- ----------------------------
INSERT INTO `rbac_permission` VALUES ('1', 'RBAC_rbacuserinfo_add', '/stark/RBAC/rbacuserinfo/add/', null, null, '4', '添加成员');
INSERT INTO `rbac_permission` VALUES ('2', 'RBAC_rbacuserinfo_delete', '/stark/RBAC/rbacuserinfo/delete/(?P<pk>\\d+)/', null, null, '4', '删除成员');
INSERT INTO `rbac_permission` VALUES ('3', 'RBAC_rbacuserinfo_change', '/stark/RBAC/rbacuserinfo/change/(?P<pk>\\d+)/', null, null, '4', '修改成员');
INSERT INTO `rbac_permission` VALUES ('4', 'RBAC_rbacuserinfo_check', '/stark/RBAC/rbacuserinfo/check/', null, '2', null, '成员列表');
INSERT INTO `rbac_permission` VALUES ('9', 'RBAC_department_add', '/stark/RBAC/department/add/', null, null, '12', '添加部门');
INSERT INTO `rbac_permission` VALUES ('10', 'RBAC_department_delete', '/stark/RBAC/department/delete/(?P<pk>\\d+)/', null, null, '12', '删除部门');
INSERT INTO `rbac_permission` VALUES ('11', 'RBAC_department_change', '/stark/RBAC/department/change/(?P<pk>\\d+)/', null, null, '12', '修改部门');
INSERT INTO `rbac_permission` VALUES ('12', 'RBAC_department_check', '/stark/RBAC/department/check/', null, '7', null, '部门列表');
INSERT INTO `rbac_permission` VALUES ('13', 'RBAC_role_add', '/stark/RBAC/role/add/', null, null, '16', '添加角色');
INSERT INTO `rbac_permission` VALUES ('14', 'RBAC_role_delete', '/stark/RBAC/role/delete/(?P<pk>\\d+)/', null, null, '16', '删除角色');
INSERT INTO `rbac_permission` VALUES ('15', 'RBAC_role_change', '/stark/RBAC/role/change/(?P<pk>\\d+)/', null, null, '16', '修改角色');
INSERT INTO `rbac_permission` VALUES ('16', 'RBAC_role_check', '/stark/RBAC/role/check/', null, '6', null, '角色列表');
INSERT INTO `rbac_permission` VALUES ('17', 'RBAC_permission_add', '/stark/RBAC/permission/add/', null, null, '20', '添加权限');
INSERT INTO `rbac_permission` VALUES ('18', 'RBAC_permission_delete', '/stark/RBAC/permission/delete/(?P<pk>\\d+)/', null, null, '20', '删除权限');
INSERT INTO `rbac_permission` VALUES ('19', 'RBAC_permission_change', '/stark/RBAC/permission/change/(?P<pk>\\d+)/', null, null, '20', '修改权限');
INSERT INTO `rbac_permission` VALUES ('20', 'RBAC_permission_check', '/stark/RBAC/permission/check/', null, '6', null, '权限列表');
INSERT INTO `rbac_permission` VALUES ('22', 'RBAC_menu_add', '/stark/RBAC/menu/add/', null, null, '25', '添加菜单');
INSERT INTO `rbac_permission` VALUES ('23', 'RBAC_menu_delete', '/stark/RBAC/menu/delete/(?P<pk>\\d+)/', null, null, '25', '删除菜单');
INSERT INTO `rbac_permission` VALUES ('24', 'RBAC_menu_change', '/stark/RBAC/menu/change/(?P<pk>\\d+)/', null, null, '25', '修改菜单');
INSERT INTO `rbac_permission` VALUES ('25', 'RBAC_menu_check', '/stark/RBAC/menu/check/', null, '6', null, '菜单列表');
INSERT INTO `rbac_permission` VALUES ('70', 'RBAC_permission_assignment', '/stark/RBAC/permission/assignment/', null, '6', null, '权限分配');
INSERT INTO `rbac_permission` VALUES ('71', 'RBAC_permission_multi', '/stark/RBAC/permission/multi/', null, '6', null, '权限批量操作');
INSERT INTO `rbac_permission` VALUES ('72', 'RBAC_menu_menuAssignment', '/stark/RBAC/menu/assignment/', null, '6', null, '菜单分配');
INSERT INTO `rbac_permission` VALUES ('75', 'RBAC_rbacuserinfo_reset_pwd', '/stark/RBAC/rbacuserinfo/reset/password/(?P<pk>\\d+)/', null, null, '4', '重置密码');
INSERT INTO `rbac_permission` VALUES ('86', 'Course_freecourse_add', '/stark/Course/freecourse/add/', null, null, '89', '添加免费课程');
INSERT INTO `rbac_permission` VALUES ('87', 'Course_freecourse_delete', '/stark/Course/freecourse/delete/(?P<pk>\\d+)/', null, null, '89', '删除免费课程');
INSERT INTO `rbac_permission` VALUES ('88', 'Course_freecourse_change', '/stark/Course/freecourse/change/(?P<pk>\\d+)/', null, null, '89', '修改免费课程');
INSERT INTO `rbac_permission` VALUES ('89', 'Course_freecourse_check', '/stark/Course/freecourse/check/', null, '5', null, '免费课程');
INSERT INTO `rbac_permission` VALUES ('90', 'Course_practicalcourse_add', '/stark/Course/practicalcourse/add/', null, null, '93', '添加实战课程');
INSERT INTO `rbac_permission` VALUES ('91', 'Course_practicalcourse_delete', '/stark/Course/practicalcourse/delete/(?P<pk>\\d+)/', null, null, '93', '删除实战课程');
INSERT INTO `rbac_permission` VALUES ('92', 'Course_practicalcourse_change', '/stark/Course/practicalcourse/change/(?P<pk>\\d+)/', null, null, '93', '修改实战课程');
INSERT INTO `rbac_permission` VALUES ('93', 'Course_practicalcourse_check', '/stark/Course/practicalcourse/check/', null, '5', null, '实战课程');
INSERT INTO `rbac_permission` VALUES ('96', 'Course_employmentcourse_add', '/stark/Course/employmentcourse/add/', null, null, '99', '添加就业班课程');
INSERT INTO `rbac_permission` VALUES ('97', 'Course_employmentcourse_delete', '/stark/Course/employmentcourse/delete/(?P<pk>\\d+)/', null, null, '99', '删除就业班课程');
INSERT INTO `rbac_permission` VALUES ('98', 'Course_employmentcourse_change', '/stark/Course/employmentcourse/change/(?P<pk>\\d+)/', null, null, '99', '修改就业班课程');
INSERT INTO `rbac_permission` VALUES ('99', 'Course_employmentcourse_check', '/stark/Course/employmentcourse/check/', null, '5', null, '就业班课程');
INSERT INTO `rbac_permission` VALUES ('100', 'Course_category_add', '/stark/Course/category/add/', null, null, '103', '添加课程分类');
INSERT INTO `rbac_permission` VALUES ('101', 'Course_category_delete', '/stark/Course/category/delete/(?P<pk>\\d+)/', null, null, '103', '删除课程分类');
INSERT INTO `rbac_permission` VALUES ('102', 'Course_category_change', '/stark/Course/category/change/(?P<pk>\\d+)/', null, null, '103', '修改课程分类');
INSERT INTO `rbac_permission` VALUES ('103', 'Course_category_check', '/stark/Course/category/check/', null, '5', null, '课程分类');
INSERT INTO `rbac_permission` VALUES ('104', 'Account_account_add', '/stark/Account/account/add/', null, null, '107', '添加用户');
INSERT INTO `rbac_permission` VALUES ('105', 'Account_account_delete', '/stark/Account/account/delete/(?P<pk>\\d+)/', null, null, '107', '删除用户');
INSERT INTO `rbac_permission` VALUES ('106', 'Account_account_change', '/stark/Account/account/change/(?P<pk>\\d+)/', null, null, '107', '修改用户');
INSERT INTO `rbac_permission` VALUES ('107', 'Account_account_check', '/stark/Account/account/check/', null, '7', null, '用户列表');
INSERT INTO `rbac_permission` VALUES ('108', 'Account_student_add', '/stark/Account/student/add/', null, null, '111', '添加学员');
INSERT INTO `rbac_permission` VALUES ('109', 'Account_student_delete', '/stark/Account/student/delete/(?P<pk>\\d+)/', null, null, '111', '删除学员');
INSERT INTO `rbac_permission` VALUES ('110', 'Account_student_change', '/stark/Account/student/change/(?P<pk>\\d+)/', null, null, '111', '修改学员');
INSERT INTO `rbac_permission` VALUES ('111', 'Account_student_check', '/stark/Account/student/check/', null, '2', null, '学员列表');
INSERT INTO `rbac_permission` VALUES ('112', 'Account_teacher_add', '/stark/Account/teacher/add/', null, null, '115', '添加教师');
INSERT INTO `rbac_permission` VALUES ('113', 'Account_teacher_delete', '/stark/Account/teacher/delete/(?P<pk>\\d+)/', null, null, '115', '删除教师');
INSERT INTO `rbac_permission` VALUES ('114', 'Account_teacher_change', '/stark/Account/teacher/change/(?P<pk>\\d+)/', null, null, '115', '修改教师');
INSERT INTO `rbac_permission` VALUES ('115', 'Account_teacher_check', '/stark/Account/teacher/check/', null, '7', null, '教师列表');
INSERT INTO `rbac_permission` VALUES ('116', 'Account_manager_add', '/stark/Account/manager/add/', null, null, '119', '添加管理员');
INSERT INTO `rbac_permission` VALUES ('117', 'Account_manager_delete', '/stark/Account/manager/delete/(?P<pk>\\d+)/', null, null, '119', '删除管理员');
INSERT INTO `rbac_permission` VALUES ('118', 'Account_manager_change', '/stark/Account/manager/change/(?P<pk>\\d+)/', null, null, '119', '修改管理员');
INSERT INTO `rbac_permission` VALUES ('119', 'Account_manager_check', '/stark/Account/manager/check/', null, '7', null, '管理员列表');

-- ----------------------------
-- Table structure for `rbac_rbacuserinfo`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_rbacuserinfo`;
CREATE TABLE `rbac_rbacuserinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `score` int(11) NOT NULL,
  `grade` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `telephone` varchar(11) DEFAULT NULL,
  `dateJoined` datetime(6) NOT NULL,
  `department_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `password` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `telephone` (`telephone`),
  KEY `RBAC_rbacuserinfo_team_id_977e0d1c_fk_RBAC_team_id` (`team_id`),
  KEY `RBAC_rbacuserinfo_department_id_3275a368_fk_RBAC_department_id` (`department_id`),
  CONSTRAINT `RBAC_rbacuserinfo_department_id_3275a368_fk_RBAC_department_id` FOREIGN KEY (`department_id`) REFERENCES `rbac_department` (`id`),
  CONSTRAINT `RBAC_rbacuserinfo_team_id_977e0d1c_fk_RBAC_team_id` FOREIGN KEY (`team_id`) REFERENCES `rbac_team` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_rbacuserinfo
-- ----------------------------
INSERT INTO `rbac_rbacuserinfo` VALUES ('1', 'Alex', '', '', '2426671397@mail.tust.edu.cn', '10', '1', '1', 'avatars/Alex0.jpg', '18812649207', '2020-04-03 11:37:31.000000', '4', '1', '20001001');
INSERT INTO `rbac_rbacuserinfo` VALUES ('2', 'xiao', '', '', '123456789@qq.com', '10', '1', '1', 'avatars/MatrixLogo.png', '123456789', '2020-04-03 11:39:36.000000', '3', '2', '20001001');
INSERT INTO `rbac_rbacuserinfo` VALUES ('3', 'meng', '', '', '123456@qq.com', '10', '1', '1', 'avatars/树莓派.jpg', '123456', '2020-04-03 11:40:13.000000', null, '3', '20001001');
INSERT INTO `rbac_rbacuserinfo` VALUES ('4', 'yan', '', '', '987654321@gmail.com', '10', '1', '1', 'avatars/35676deee8fb07b60c7d5ac9d7e8e90e.jpg', '987654321', '2020-04-03 11:40:48.000000', null, '4', '20001001');
INSERT INTO `rbac_rbacuserinfo` VALUES ('5', 'jin', '', '', '654321@qq.com', '10', '1', '1', 'avatars/default.png', '654321', '2020-04-03 11:41:12.000000', '6', null, '20001001');
INSERT INTO `rbac_rbacuserinfo` VALUES ('6', '123123', '234', '234', '2426671397@mail.tust.edu.cn', '10', '1', '1', 'avatars/default.png', '345325234', '2020-04-06 09:53:15.000000', '4', null, '20001001');

-- ----------------------------
-- Table structure for `rbac_rbacuserinfo_roles`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_rbacuserinfo_roles`;
CREATE TABLE `rbac_rbacuserinfo_roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rbacuserinfo_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RBAC_rbacuserinfo_roles_rbacuserinfo_id_role_id_ec0bdf47_uniq` (`rbacuserinfo_id`,`role_id`),
  KEY `RBAC_rbacuserinfo_roles_role_id_f5af9a95_fk_RBAC_role_id` (`role_id`),
  CONSTRAINT `RBAC_rbacuserinfo_ro_rbacuserinfo_id_51734b43_fk_RBAC_rbac` FOREIGN KEY (`rbacuserinfo_id`) REFERENCES `rbac_rbacuserinfo` (`id`),
  CONSTRAINT `RBAC_rbacuserinfo_roles_role_id_f5af9a95_fk_RBAC_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_rbacuserinfo_roles
-- ----------------------------
INSERT INTO `rbac_rbacuserinfo_roles` VALUES ('14', '1', '1');
INSERT INTO `rbac_rbacuserinfo_roles` VALUES ('15', '1', '2');
INSERT INTO `rbac_rbacuserinfo_roles` VALUES ('2', '2', '3');
INSERT INTO `rbac_rbacuserinfo_roles` VALUES ('3', '3', '4');
INSERT INTO `rbac_rbacuserinfo_roles` VALUES ('4', '4', '5');
INSERT INTO `rbac_rbacuserinfo_roles` VALUES ('5', '5', '1');

-- ----------------------------
-- Table structure for `rbac_role`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role`;
CREATE TABLE `rbac_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `duty` varchar(256) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_role
-- ----------------------------
INSERT INTO `rbac_role` VALUES ('1', 'CEO', 'Leaders');
INSERT INTO `rbac_role` VALUES ('2', '讲师', '讲课');
INSERT INTO `rbac_role` VALUES ('3', '销售', '销售课程');
INSERT INTO `rbac_role` VALUES ('4', '技术', '技术开发');
INSERT INTO `rbac_role` VALUES ('5', '导师', '知道学生');
INSERT INTO `rbac_role` VALUES ('12', '成员', '为工作室做贡献');
INSERT INTO `rbac_role` VALUES ('13', '学员', '学习更多知识');

-- ----------------------------
-- Table structure for `rbac_role_permissions`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_role_permissions`;
CREATE TABLE `rbac_role_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `RBAC_role_permissions_role_id_permission_id_ccc03b8f_uniq` (`role_id`,`permission_id`),
  KEY `RBAC_role_permission_permission_id_2342e70b_fk_RBAC_perm` (`permission_id`),
  CONSTRAINT `RBAC_role_permission_permission_id_2342e70b_fk_RBAC_perm` FOREIGN KEY (`permission_id`) REFERENCES `rbac_permission` (`id`),
  CONSTRAINT `RBAC_role_permissions_role_id_e9f1274f_fk_RBAC_role_id` FOREIGN KEY (`role_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=965 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_role_permissions
-- ----------------------------
INSERT INTO `rbac_role_permissions` VALUES ('932', '1', '1');
INSERT INTO `rbac_role_permissions` VALUES ('910', '1', '2');
INSERT INTO `rbac_role_permissions` VALUES ('964', '1', '3');
INSERT INTO `rbac_role_permissions` VALUES ('947', '1', '4');
INSERT INTO `rbac_role_permissions` VALUES ('950', '1', '9');
INSERT INTO `rbac_role_permissions` VALUES ('933', '1', '10');
INSERT INTO `rbac_role_permissions` VALUES ('945', '1', '11');
INSERT INTO `rbac_role_permissions` VALUES ('951', '1', '12');
INSERT INTO `rbac_role_permissions` VALUES ('946', '1', '13');
INSERT INTO `rbac_role_permissions` VALUES ('948', '1', '14');
INSERT INTO `rbac_role_permissions` VALUES ('940', '1', '15');
INSERT INTO `rbac_role_permissions` VALUES ('915', '1', '16');
INSERT INTO `rbac_role_permissions` VALUES ('956', '1', '17');
INSERT INTO `rbac_role_permissions` VALUES ('960', '1', '18');
INSERT INTO `rbac_role_permissions` VALUES ('962', '1', '19');
INSERT INTO `rbac_role_permissions` VALUES ('936', '1', '20');
INSERT INTO `rbac_role_permissions` VALUES ('934', '1', '22');
INSERT INTO `rbac_role_permissions` VALUES ('949', '1', '23');
INSERT INTO `rbac_role_permissions` VALUES ('917', '1', '24');
INSERT INTO `rbac_role_permissions` VALUES ('935', '1', '25');
INSERT INTO `rbac_role_permissions` VALUES ('941', '1', '70');
INSERT INTO `rbac_role_permissions` VALUES ('925', '1', '71');
INSERT INTO `rbac_role_permissions` VALUES ('963', '1', '72');
INSERT INTO `rbac_role_permissions` VALUES ('943', '1', '75');
INSERT INTO `rbac_role_permissions` VALUES ('953', '1', '86');
INSERT INTO `rbac_role_permissions` VALUES ('922', '1', '87');
INSERT INTO `rbac_role_permissions` VALUES ('937', '1', '88');
INSERT INTO `rbac_role_permissions` VALUES ('912', '1', '89');
INSERT INTO `rbac_role_permissions` VALUES ('911', '1', '90');
INSERT INTO `rbac_role_permissions` VALUES ('939', '1', '91');
INSERT INTO `rbac_role_permissions` VALUES ('961', '1', '92');
INSERT INTO `rbac_role_permissions` VALUES ('957', '1', '93');
INSERT INTO `rbac_role_permissions` VALUES ('954', '1', '96');
INSERT INTO `rbac_role_permissions` VALUES ('955', '1', '97');
INSERT INTO `rbac_role_permissions` VALUES ('923', '1', '98');
INSERT INTO `rbac_role_permissions` VALUES ('938', '1', '99');
INSERT INTO `rbac_role_permissions` VALUES ('914', '1', '100');
INSERT INTO `rbac_role_permissions` VALUES ('924', '1', '101');
INSERT INTO `rbac_role_permissions` VALUES ('942', '1', '102');
INSERT INTO `rbac_role_permissions` VALUES ('920', '1', '103');
INSERT INTO `rbac_role_permissions` VALUES ('930', '1', '104');
INSERT INTO `rbac_role_permissions` VALUES ('926', '1', '105');
INSERT INTO `rbac_role_permissions` VALUES ('909', '1', '106');
INSERT INTO `rbac_role_permissions` VALUES ('958', '1', '107');
INSERT INTO `rbac_role_permissions` VALUES ('919', '1', '108');
INSERT INTO `rbac_role_permissions` VALUES ('931', '1', '109');
INSERT INTO `rbac_role_permissions` VALUES ('952', '1', '110');
INSERT INTO `rbac_role_permissions` VALUES ('921', '1', '111');
INSERT INTO `rbac_role_permissions` VALUES ('927', '1', '112');
INSERT INTO `rbac_role_permissions` VALUES ('916', '1', '113');
INSERT INTO `rbac_role_permissions` VALUES ('959', '1', '114');
INSERT INTO `rbac_role_permissions` VALUES ('929', '1', '115');
INSERT INTO `rbac_role_permissions` VALUES ('918', '1', '116');
INSERT INTO `rbac_role_permissions` VALUES ('928', '1', '117');
INSERT INTO `rbac_role_permissions` VALUES ('944', '1', '118');
INSERT INTO `rbac_role_permissions` VALUES ('913', '1', '119');

-- ----------------------------
-- Table structure for `rbac_scorerecord`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_scorerecord`;
CREATE TABLE `rbac_scorerecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `reason` longtext NOT NULL,
  `person_id` int(11) NOT NULL,
  `referee_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `RBAC_scorerecord_person_id_284e8ec0_fk_RBAC_rbacuserinfo_id` (`person_id`),
  KEY `RBAC_scorerecord_referee_id_d7ca6ea4_fk_RBAC_rbacuserinfo_id` (`referee_id`),
  CONSTRAINT `RBAC_scorerecord_person_id_284e8ec0_fk_RBAC_rbacuserinfo_id` FOREIGN KEY (`person_id`) REFERENCES `rbac_rbacuserinfo` (`id`),
  CONSTRAINT `RBAC_scorerecord_referee_id_d7ca6ea4_fk_RBAC_rbacuserinfo_id` FOREIGN KEY (`referee_id`) REFERENCES `rbac_rbacuserinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_scorerecord
-- ----------------------------
INSERT INTO `rbac_scorerecord` VALUES ('1', '100', '做完了工作室官网的项目', '1', '1');
INSERT INTO `rbac_scorerecord` VALUES ('2', '-1', '迟到', '6', '1');
INSERT INTO `rbac_scorerecord` VALUES ('3', '100', '做完了乐享科大的项目', '2', '5');

-- ----------------------------
-- Table structure for `rbac_team`
-- ----------------------------
DROP TABLE IF EXISTS `rbac_team`;
CREATE TABLE `rbac_team` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `introduce` longtext NOT NULL,
  `hasRoles_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `RBAC_team_hasRoles_id_e8f6a574_fk_RBAC_role_id` (`hasRoles_id`),
  CONSTRAINT `RBAC_team_hasRoles_id_e8f6a574_fk_RBAC_role_id` FOREIGN KEY (`hasRoles_id`) REFERENCES `rbac_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rbac_team
-- ----------------------------
INSERT INTO `rbac_team` VALUES ('1', '算法组', '苦研算法，玩命刷题；只要敲不秃，就往秃里敲。', null);
INSERT INTO `rbac_team` VALUES ('2', '前端组', '做PPT的', null);
INSERT INTO `rbac_team` VALUES ('3', '后端组', '编程5分钟，扯淡2小时。', null);
INSERT INTO `rbac_team` VALUES ('4', 'AI组', '说了你也听不懂', null);

-- ----------------------------
-- Table structure for `shopping_shoppingcar`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_shoppingcar`;
CREATE TABLE `shopping_shoppingcar` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_id` (`account_id`),
  CONSTRAINT `Shopping_shoppingcar_account_id_dc4df3ff_fk_Account_account_id` FOREIGN KEY (`account_id`) REFERENCES `account_account` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_shoppingcar
-- ----------------------------

-- ----------------------------
-- Table structure for `shopping_shoppingcar_course`
-- ----------------------------
DROP TABLE IF EXISTS `shopping_shoppingcar_course`;
CREATE TABLE `shopping_shoppingcar_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shoppingcar_id` int(11) NOT NULL,
  `practicalcourse_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Shopping_shoppingcar_cou_shoppingcar_id_practical_6d5109bb_uniq` (`shoppingcar_id`,`practicalcourse_id`),
  KEY `Shopping_shoppingcar_practicalcourse_id_e34d084b_fk_Course_pr` (`practicalcourse_id`),
  CONSTRAINT `Shopping_shoppingcar_practicalcourse_id_e34d084b_fk_Course_pr` FOREIGN KEY (`practicalcourse_id`) REFERENCES `course_practicalcourse` (`id`),
  CONSTRAINT `Shopping_shoppingcar_shoppingcar_id_1f9f4086_fk_Shopping_` FOREIGN KEY (`shoppingcar_id`) REFERENCES `shopping_shoppingcar` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_shoppingcar_course
-- ----------------------------
