/*
 Navicat Premium Data Transfer

 Source Server         : 192.168.120.20_3307
 Source Server Type    : MySQL
 Source Server Version : 50738
 Source Host           : 192.168.120.20:3307
 Source Schema         : zc

 Target Server Type    : MySQL
 Target Server Version : 50738
 File Encoding         : 65001

 Date: 30/09/2022 08:31:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ads
-- ----------------------------
DROP TABLE IF EXISTS `ads`;
CREATE TABLE `ads`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列值',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `updated` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态',
  `intro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ads
-- ----------------------------
INSERT INTO `ads` VALUES (1, 'A1', 'https://iot.cloud.tencent.com/market/index', 'uploadFile/1.jpg', '2020-04-25 23:02:28', NULL, NULL, '--');
INSERT INTO `ads` VALUES (2, 'A2', 'https://iot.cloud.tencent.com/market/index', 'uploadFile/banner.jpg', '2020-04-25 23:25:28', NULL, NULL, '--');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `pid` int(11) NULL DEFAULT 0,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类别名称',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '描述',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `updated` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 0, '科技', 'uploadFile/design-1.png', '--', '2020-04-25 23:26:32', NULL, NULL);
INSERT INTO `category` VALUES (2, 0, '家电', 'uploadFile/design-1.png', '--', '2020-04-25 23:26:49', NULL, NULL);
INSERT INTO `category` VALUES (3, 0, '美食', 'uploadFile/design-1.png', '--', '2020-04-25 23:27:13', NULL, NULL);
INSERT INTO `category` VALUES (4, 0, '美学', 'uploadFile/design-1.png', '--', '2020-04-25 23:29:39', NULL, NULL);
INSERT INTO `category` VALUES (5, 0, '文化', 'uploadFile/design-1.png', '--', '2020-04-25 23:31:26', NULL, NULL);
INSERT INTO `category` VALUES (6, 0, '扶贫', 'uploadFile/design-1.png', '--', '2020-04-25 23:32:24', NULL, NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '用户编号',
  `mid` int(11) NULL DEFAULT NULL COMMENT '评论主题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `type` int(11) NULL DEFAULT 1 COMMENT '类型',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `updated` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态',
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, 2, 0, '这个网站真的很好啊！\r\n', NULL, '2020-04-25 23:42:43', 'test', NULL, NULL);
INSERT INTO `comment` VALUES (2, 2, 1, '<span style=\'color:#c00\'>@回复：</span>比心比心', NULL, '2020-04-25 23:42:54', 'test', NULL, NULL);
INSERT INTO `comment` VALUES (3, 3, 1, '<span style=\'color:#c00\'>@回复：</span>you are 666', NULL, '2020-04-25 23:48:22', 'cus', NULL, NULL);

-- ----------------------------
-- Table structure for fav
-- ----------------------------
DROP TABLE IF EXISTS `fav`;
CREATE TABLE `fav`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NULL DEFAULT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of fav
-- ----------------------------
INSERT INTO `fav` VALUES (1, 3, 1);
INSERT INTO `fav` VALUES (2, 3, 2);
INSERT INTO `fav` VALUES (3, 2, 2);

-- ----------------------------
-- Table structure for invice
-- ----------------------------
DROP TABLE IF EXISTS `invice`;
CREATE TABLE `invice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `uid` int(11) NOT NULL COMMENT '用户编号',
  `mid` int(11) NULL DEFAULT NULL COMMENT '评论主题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `type` int(11) NULL DEFAULT 1 COMMENT '类型',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建时间',
  `updated` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NULL DEFAULT NULL COMMENT '状态',
  `reply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of invice
-- ----------------------------

-- ----------------------------
-- Table structure for members
-- ----------------------------
DROP TABLE IF EXISTS `members`;
CREATE TABLE `members`  (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `sex` tinyint(1) UNSIGNED NULL DEFAULT 0 COMMENT '性别',
  `birthday` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '生日',
  `address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '地址',
  `email` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `qq` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'qq',
  `tel` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `money` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '100' COMMENT '账户余额',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'uploadFile/u=555687113,2118800645&fm=74&app=80&f=JPEG&size=f121,121.jpg' COMMENT '头像',
  `grade` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `type` int(11) NULL DEFAULT 1 COMMENT '类型',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '注册时间',
  `updated` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态',
  `jf` decimal(10, 0) NULL DEFAULT 0,
  `age` int(11) NULL DEFAULT NULL,
  `maincontent` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `xx` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zy` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nj` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of members
-- ----------------------------
INSERT INTO `members` VALUES (1, 'admin', '111', 1, NULL, '1', 'admin@qq.com', '961903965', '15154810828', '1000199', 'uploadFile/2.png', '414532', 3, '2020-04-08 22:50:06', NULL, 1, NULL, NULL, '2', NULL, NULL, NULL, NULL);
INSERT INTO `members` VALUES (2, 'test', '111', 1, NULL, '云南省昆明市', '85756@qq.com', '961903965', '45845214', '993249', 'uploadFile/icon.png', NULL, 1, '2020-04-08 22:50:06', NULL, 1, NULL, NULL, '云南省昆明市22', NULL, '昆明理工大学', '电子工程', '2018');
INSERT INTO `members` VALUES (3, 'cus', '111', 1, NULL, '北京市三里屯', 'a21@cus.com', '57627444', '18788569865', '262', 'uploadFile/icon0.png', NULL, 1, '2020-04-08 22:50:06', NULL, 1, NULL, NULL, '云南省昆明市22', NULL, '云南财经大学', '网络工程', '2017');

-- ----------------------------
-- Table structure for morder
-- ----------------------------
DROP TABLE IF EXISTS `morder`;
CREATE TABLE `morder`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `order_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL,
  `total` decimal(10, 0) NULL DEFAULT NULL,
  `uid` int(11) NULL DEFAULT NULL COMMENT '用户编号',
  `pid` int(255) NULL DEFAULT NULL COMMENT '产品',
  `cuid` int(11) NULL DEFAULT NULL COMMENT '商家',
  `num` int(11) NULL DEFAULT NULL COMMENT '数量',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '--' COMMENT '备注',
  `step` int(11) NULL DEFAULT 1 COMMENT '订单状态',
  `updated` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态',
  `buyer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(11) NULL DEFAULT 1,
  `saler` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shopid` int(11) NULL DEFAULT NULL,
  `shopname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ordersn` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `y` int(11) NULL DEFAULT NULL,
  `m` int(11) NULL DEFAULT NULL,
  `d` int(11) NULL DEFAULT NULL,
  `express` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of morder
-- ----------------------------
INSERT INTO `morder` VALUES (1, NULL, 100, 100, 3, 3, NULL, 1, NULL, 2, NULL, '2020-04-25 23:57:56', 1, 'cus', '蓝色妖姬伴你同行-车载低音炮', 1, 'test', 2, NULL, '微信支付', 120, 3, 6, NULL);

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键编号',
  `uid` int(11) NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自行车名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '产品详情',
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `click` int(11) NULL DEFAULT 0,
  `category` int(255) NULL DEFAULT NULL COMMENT '所属分类',
  `store` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '100',
  `vpath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` decimal(10, 0) NULL DEFAULT NULL COMMENT '价格(￥)',
  `created` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建时间',
  `updated` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NULL DEFAULT 1 COMMENT '状态',
  `brandid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `brandname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `skuname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `jf` decimal(10, 0) NULL DEFAULT NULL,
  `shopname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `shopid` int(11) NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 2, NULL, 'MAD Gaze 智能眼鏡', '感谢您对MAD Gaze MR的支持，您将以众筹价99元获得预计市场价199元的MAD Gaze MR - 遊戲手柄 一个', 'uploadFile/11baf351f8848a97.jpg', '<p class=\"box-intro\" style=\"vertical-align:baseline;font-size:14px;color:#5E5E5E;font-family:&quot;background-color:#FFFFFF;\">\r\n	下单即得该商品【满599元减20元优惠券】。另参与抽奖，支持者每满【99】人，抽取【1】位幸运用户（不满足时也抽取1位），获得【游戏手柄 一个】。\r\n</p>\r\n<div class=\"box-imglist\" style=\"margin:0px;padding:0px 0px 10px;vertical-align:baseline;border:0px;color:#5E5E5E;font-family:&quot;background-color:#FFFFFF;\">\r\n	<ul style=\"vertical-align:baseline;\">\r\n	</ul>\r\n</div>', '科技', NULL, 1, '2020/08/10', NULL, 1680000, '2020-04-25 23:36:51', NULL, 1, '7', '高端智能眼睛1副', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` VALUES (2, 2, NULL, '视频直播的好帮手六合一支架', '下单即得该商品【满59元减5元优惠券】。', 'uploadFile/cb09dcc7180449d3.jpg', '另参与抽奖，支持者每满【59】人，抽取【1】位幸运用户（不满足时也抽取1位），获得【视频直播的好帮手六合一支架1台】。', '科技', NULL, 1, '2020/08/10', NULL, 160000, '2020-04-25 23:40:12', NULL, 1, '5', '六合一支架', NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `products` VALUES (3, 2, NULL, '蓝色妖姬伴你同行-车载低音炮', '洛克时代蓝色妖姬款10寸有源车载低音炮 1 台', 'uploadFile/62ac7cb4c5474dad.jpg', '<span style=\"color:#5E5E5E;font-family:\" font-size:14px;background-color:#ffffff;\"=\"\">洛克时代蓝色妖姬款10寸有源车载低音炮 1 台 + 车载高音喇叭一对</span>', '科技', NULL, 1, '2020/08/10', NULL, 80000, '2020-04-25 23:41:14', NULL, 1, '3', '车载低音炮', '1', NULL, 1, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for pt
-- ----------------------------
DROP TABLE IF EXISTS `pt`;
CREATE TABLE `pt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `thumb` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `userid` int(11) NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pt
-- ----------------------------

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '网站名称',
  `keywords` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `copyright` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `address` varchar(220) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `url` char(120) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `facebook` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `tel` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `fax` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `icp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weibo` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `count` int(10) NULL DEFAULT 0 COMMENT '点击次数',
  `other` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `master` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of setting
-- ----------------------------
INSERT INTO `setting` VALUES (1, '基于Java的众筹系统的设计与实现', '翻译自国外crowdfunding一词，即大众筹资或群众筹资，香港译作「群众集资」，台湾译作「群众募资」。由发起人、跟投人、平台构成。具有低门槛、多样性、依靠大众力量、注重创意的特征，是指一种向群众募资，以支持发起的个人或组织的行为。一般而言是透过网络上的平台连结起赞助者与提案者。群众募资被用来支持各种活动，包含灾害重建、民间集资、竞选活动、创业募资、艺术创作、自由软件、设计发明、科学研究以及公共专案等。', 'Massolution研究报告指出，2013年全球总募集资金已达51亿美元，其中90%集中在欧美市场。世界银行报告更预测2025年总金额将突破960亿美元，亚洲占比将大幅成长。', 'Copyright  2020', '云南省昆明市', 'kdhf.com', '0211-1542125', '151548754241', 'sch@cus.com', NULL, NULL, NULL, NULL, 115, NULL, 'KLZ');

SET FOREIGN_KEY_CHECKS = 1;
