/*
Navicat MySQL Data Transfer

Source Server         : 腾讯云服务器
Source Server Version : 50725
Source Host           : 111.230.112.121:3306
Source Database       : map_food

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2019-05-01 17:25:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `shop_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `comment_text` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `rate` decimal(2,1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('50', '1', '5', '阿三打', '2019-04-26 01:39:24', '4.0');
INSERT INTO `comment` VALUES ('51', '1', '5', 'asdsa', '2019-04-26 01:54:52', '4.0');
INSERT INTO `comment` VALUES ('52', '1', '4', '12321321', '2019-04-26 04:51:49', '3.0');
INSERT INTO `comment` VALUES ('53', '1', '4', 'caoni', '2019-04-26 04:51:57', '3.0');
INSERT INTO `comment` VALUES ('54', '1', '4', 'caoni', '2019-04-26 04:52:45', '5.0');
INSERT INTO `comment` VALUES ('55', '1', '4', 'caoni', '2019-04-26 04:52:49', '5.0');
INSERT INTO `comment` VALUES ('56', '1', '4', 'caoni', '2019-04-26 04:52:54', '2.0');
INSERT INTO `comment` VALUES ('57', '1', '4', '?', '2019-04-26 04:54:40', '3.0');
INSERT INTO `comment` VALUES ('58', '1', '6', '草泥马', '2019-04-27 15:31:12', '2.0');
INSERT INTO `comment` VALUES ('59', '1', '6', '草泥马', '2019-04-27 15:31:26', '1.0');
INSERT INTO `comment` VALUES ('60', '1', '6', '草泥马', '2019-04-27 15:31:27', '1.0');
INSERT INTO `comment` VALUES ('61', '1', '6', '草泥马', '2019-04-27 15:31:27', '1.0');
INSERT INTO `comment` VALUES ('62', '1', '6', '草泥马', '2019-04-27 15:31:27', '1.0');
INSERT INTO `comment` VALUES ('63', '1', '6', '草泥马', '2019-04-27 15:31:27', '1.0');
INSERT INTO `comment` VALUES ('64', '1', '7', 'sadasd', '2019-04-27 15:41:15', '4.0');

-- ----------------------------
-- Table structure for comment_img
-- ----------------------------
DROP TABLE IF EXISTS `comment_img`;
CREATE TABLE `comment_img` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) DEFAULT NULL,
  `comment_img` varchar(1000) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment_img
-- ----------------------------

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `shop_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES ('1', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '1');
INSERT INTO `food` VALUES ('2', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '1');
INSERT INTO `food` VALUES ('3', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '2');
INSERT INTO `food` VALUES ('4', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '2');
INSERT INTO `food` VALUES ('5', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '3');
INSERT INTO `food` VALUES ('6', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '3');
INSERT INTO `food` VALUES ('7', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '4');
INSERT INTO `food` VALUES ('8', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '4');
INSERT INTO `food` VALUES ('9', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '5');
INSERT INTO `food` VALUES ('10', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '6');
INSERT INTO `food` VALUES ('11', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '6');
INSERT INTO `food` VALUES ('12', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '7');
INSERT INTO `food` VALUES ('13', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '7');
INSERT INTO `food` VALUES ('14', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '7');
INSERT INTO `food` VALUES ('15', '小龙虾', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '1.10', '7');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(1000) DEFAULT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `module` varchar(1000) DEFAULT NULL,
  `rate` decimal(2,1) DEFAULT NULL COMMENT '0',
  `price` decimal(10,2) DEFAULT NULL COMMENT '0',
  `scene` varchar(1000) DEFAULT NULL,
  `comment` bigint(20) DEFAULT '0' COMMENT '0',
  `tel` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `cost` decimal(10,2) DEFAULT '0.00' COMMENT '0',
  `lng` decimal(20,10) DEFAULT NULL,
  `lat` decimal(20,10) DEFAULT NULL,
  `address` varchar(1000) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', 'xx奶茶', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '热门', '2.7', '7.00', '肥牛。鲜牛肉。鲜牛肉丸', '15', '12345687', '餐饮类型；火锅店', '32.00', '113.9500530000', '22.5852500000', '广东省深圳市南山区西丽街道旺棠', '1');
INSERT INTO `shop` VALUES ('2', 'xx木桶饭', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '热门', '3.0', '3.00', '肥牛。鲜牛肉。鲜牛肉丸', '0', '12345687', '餐饮类型；火锅店', '12.00', '113.9496770000', '22.5852990000', '广东省深圳市南山区西丽街道旺棠', '1');
INSERT INTO `shop` VALUES ('3', 'xx鸡公煲', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '热门', '2.0', '6.00', '肥牛。鲜牛肉。鲜牛肉丸', '0', '12345687', '餐饮类型；火锅店', '33.00', '113.9489310000', '22.5853990000', '广东省深圳市南山区西丽街道旺棠', '1');
INSERT INTO `shop` VALUES ('4', '一点点', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '热门', '5.0', '8.00', '肥牛。鲜牛肉。鲜牛肉丸', '0', '12345687', '餐饮类型；火锅店', '55.00', '113.9489310000', '22.5854990000', '广东省深圳市南山区西丽街道旺棠', '1');
INSERT INTO `shop` VALUES ('5', '黄鼠狼鸡公煲', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '', '1.0', '2.00', '肥牛。鲜牛肉。鲜牛肉丸', '0', '12345687', '餐饮类型；火锅店', '12.00', '113.9489310000', '22.5855990000', '广东省深圳市南山区西丽街道旺棠', '1');
INSERT INTO `shop` VALUES ('6', '老字号', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '', '4.6', '1.00', '肥牛。鲜牛肉。鲜牛肉丸', '0', '12345687', '餐饮类型；火锅店', '15.00', '113.9489310000', '22.5856990000', '广东省深圳市南山区西丽街道旺棠', '1');
INSERT INTO `shop` VALUES ('7', '老地方盖浇饭', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '', '2.1', '0.00', '肥牛。鲜牛肉。鲜牛肉丸', '0', '12345687', '餐饮类型；火锅店', '16.00', '113.9489310000', '22.5857990000', '广东省深圳市南山区西丽街道旺棠', '1');
INSERT INTO `shop` VALUES ('8', '东城餐吧', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '', '3.4', '13.00', '肥牛。鲜牛肉。鲜牛肉丸', '0', '12345687', '餐饮类型；火锅店', '54.00', '113.9489310000', '22.5858990000', '广东省深圳市南山区西丽街道旺棠', '1');
INSERT INTO `shop` VALUES ('9', '西城餐吧', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '', '2.1', '23.00', '肥牛。鲜牛肉。鲜牛肉丸', '0', '12345687', '餐饮类型；火锅店', '73.00', '113.9489310000', '22.5858990000', '广东省深圳市南山区西丽街道旺棠', '1');
INSERT INTO `shop` VALUES ('10', '哦吼', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '', '4.2', '22.00', '肥牛。鲜牛肉。鲜牛肉丸', '0', '12345687', '餐饮类型；火锅店', '123.00', '113.9489310000', '22.5862990000', '广东省深圳市南山区西丽街道旺棠', '1');
INSERT INTO `shop` VALUES ('11', '潮汕牛肉店', 'http://jox.ngrok.xiaomiqiu.cn/02110e74aa11b4b1cbd26952a60313df.jpg', '', '1.9', '134.00', '肥牛。鲜牛肉。鲜牛肉丸', '0', '12345687', '餐饮类型；火锅店', '23.00', '113.9489310000', '22.5861990000', '广东省深圳市南山区西丽街道旺棠', '1');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(1000) DEFAULT NULL,
  `passwd` varchar(1000) DEFAULT NULL,
  `email` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('4', 'jonson', 'c8837b23ff8aaa8a2dde915473ce0991', '953234252@qq.com');
INSERT INTO `users` VALUES ('5', 'frankin', 'c8837b23ff8aaa8a2dde915473ce0991', '545520197@qq.com');
INSERT INTO `users` VALUES ('6', 'alex', 'e10adc3949ba59abbe56e057f20f883e', '337233263@qq.com');
INSERT INTO `users` VALUES ('7', 'nitaishuaile', '202cb962ac59075b964b07152d234b70', '913032684@qq.com');

-- ----------------------------
-- View structure for get_comment
-- ----------------------------
DROP VIEW IF EXISTS `get_comment`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `get_comment` AS select `comment`.`id` AS `id`,`comment`.`shop_id` AS `shop_id`,`comment`.`user_id` AS `user_id`,`comment`.`comment_text` AS `comment_text`,`comment`.`create_time` AS `create_time`,`comment`.`rate` AS `rate`,`users`.`username` AS `username`,`users`.`email` AS `email` from (`comment` join `users`) where (`comment`.`user_id` = `users`.`id`) order by `comment`.`create_time` desc ;
