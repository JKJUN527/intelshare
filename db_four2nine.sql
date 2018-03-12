/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : db_four2nine

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-03-12 20:38:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `tb_admin`
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `token` varchar(60) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(60) DEFAULT NULL,
  `is_active` int(1) unsigned DEFAULT NULL,
  `is_boss` int(1) unsigned DEFAULT NULL,
  `register_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES ('1', '0347beed60bb1f28e703c5987a76f18b', 'intelshare', '27ea61d786abb69a508b3c0695e24f65', '1', '1', '2018-03-12 20:18:43');
INSERT INTO `tb_admin` VALUES ('2', '804a3c78f39d5310079fa1adf43cf0a8', 'adminadmin', 'cbbe55a8baa6b5e13724331701f28ad0', '1', '0', '2018-03-12 20:18:21');

-- ----------------------------
-- Table structure for `tb_dailymes`
-- ----------------------------
DROP TABLE IF EXISTS `tb_dailymes`;
CREATE TABLE `tb_dailymes` (
  `did` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(10) unsigned DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `title` varchar(32) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `create_at` date DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `is_pass` int(1) unsigned DEFAULT NULL,
  `is_bord` int(1) unsigned DEFAULT NULL,
  `is_red` int(1) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_dailymes
-- ----------------------------
INSERT INTO `tb_dailymes` VALUES ('1', '1', 'admin', '房地产销售总额', '据2016年10月统计、房地产销售总额达到7145亿美元，2017年10月总额则增加到7614亿美元，同比增长6.60%。', '2017-12-16', null, '1', '1', '1');
INSERT INTO `tb_dailymes` VALUES ('2', '1', 'admin', '北京房产行情行情北京房产行情行情', '中原地产首席分析师张大伟接受证券时报记者采访时表示，过去一年，北京楼市政策发布密度创造全国及北京历史记录，一年内发布了近50次各种调控措施，随着政策进入平稳周期，市场逐渐进入低谷徘徊。北京二手房价格从4月开始到现在累计跌幅超过15%，部分区域房源价格累计跌幅接近20%，北京二手房价格已经接近2016年四季度。预计2017年全年北京二手房住宅成交大约在13.4万套，相比2016年的27万套暴跌51%，这一成交量也是2015年来这一轮最低值。预计2018年北京二手房市场成交量将继续低迷。', '2017-12-16', null, '1', '1', '1');
INSERT INTO `tb_dailymes` VALUES ('3', '1', 'admin', '北京最严调控调查二手房价量齐跌', '链家研究院也指出，从月度数据来看，调控后新增挂牌均价累计跌幅为12.9%，大于成交均价跌幅12.1%，表明业主预期松动，报价更趋理性。新增需求于低位企稳，调控后投资投机漏洞几乎堵死，刚性需求有序入市。', '2017-12-16', null, '1', '0', '1');

-- ----------------------------
-- Table structure for `tb_news`
-- ----------------------------
DROP TABLE IF EXISTS `tb_news`;
CREATE TABLE `tb_news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `publish_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `image_path` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_news
-- ----------------------------
INSERT INTO `tb_news` VALUES ('1', '全球领先，安全稳定的云计算服务', '计算、存储、网络、安全、大数据、人工智能，普惠科技助您飞跃发展。', 'http://www.baidu.com', '2018-03-12 20:25:02', '1491992923hero.jpg');
INSERT INTO `tb_news` VALUES ('2', '智享互联位列全球100强', '阿范德萨发斯蒂芬', null, '2018-03-12 20:25:59', null);

-- ----------------------------
-- Table structure for `tb_request`
-- ----------------------------
DROP TABLE IF EXISTS `tb_request`;
CREATE TABLE `tb_request` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) DEFAULT NULL,
  `scale` int(11) DEFAULT NULL,
  `industry` varchar(20) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `service_type` varchar(20) DEFAULT NULL,
  `budget` int(11) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_request
-- ----------------------------
INSERT INTO `tb_request` VALUES ('1', 'Four2Nine', '1', 'das', 'das', 'da', '123', '2018-03-12 20:28:32');
INSERT INTO `tb_request` VALUES ('2', 'dasd', '1', '互联网', '成都', '上门服务', '200', '2018-03-12 20:28:38');

-- ----------------------------
-- Table structure for `tb_service`
-- ----------------------------
DROP TABLE IF EXISTS `tb_service`;
CREATE TABLE `tb_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(100) DEFAULT NULL,
  `company_website` varchar(100) DEFAULT NULL,
  `contact_img` varchar(50) DEFAULT NULL,
  `contact_name` varchar(10) DEFAULT NULL,
  `contact_phone_number` varchar(20) DEFAULT NULL,
  `contact_email` varchar(100) DEFAULT NULL,
  `contact_desc` varchar(200) DEFAULT NULL,
  `contact2_img` varchar(50) DEFAULT NULL,
  `contact2_name` varchar(20) DEFAULT NULL,
  `contact2_desc` varchar(200) DEFAULT NULL,
  `service_description` text,
  `apply_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_pass` int(1) unsigned DEFAULT NULL,
  `service_type` varchar(20) DEFAULT NULL,
  `service_city` varchar(20) DEFAULT NULL,
  `industry` varchar(20) DEFAULT NULL,
  `company_logo` varchar(200) DEFAULT NULL,
  `service_price` int(11) DEFAULT NULL,
  `view_count` bigint(20) DEFAULT NULL,
  `request_count` bigint(20) DEFAULT NULL,
  `banner_image` varchar(200) DEFAULT NULL,
  `banner_text` varchar(5000) DEFAULT NULL,
  `service_detail_image` varchar(200) DEFAULT NULL,
  `additional` text,
  `is_complete` int(1) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_service
-- ----------------------------
INSERT INTO `tb_service` VALUES ('1', 'Four2Nine', 'www.four2nine.com', null, '刘洋', '110', 'liuyang@f2n.com', '毕业于电子科技大学，连续创业者，10年以上创业经历，微软认证工程师。美国格里集团（GLG）专家智库SaaS领域专家                                                     ，四川青年创业促进计划委员会（SYE）评审导师，成都市SaaS产业协会发起人兼首届轮值会长。家族有近30年传统商贸经营历史，深刻理解传统商贸流通行业。', null, null, null, null, null, null, '上门服务', '成都', '互联网', '1491891615logo2.jpg', '200', '32', '0', '1491891615满减活动.jpg', '满2000减50', '1491891615taobao-app.jpg', null, '0');

-- ----------------------------
-- Table structure for `tb_staff`
-- ----------------------------
DROP TABLE IF EXISTS `tb_staff`;
CREATE TABLE `tb_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `description` text,
  `duties` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `is_top` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_staff
-- ----------------------------
INSERT INTO `tb_staff` VALUES ('1', '1491983137author.jpg', '4', null, null, null, null, '2018-03-12 20:38:30', null);
INSERT INTO `tb_staff` VALUES ('2', '1491983170author2.jpg', '3', null, null, null, null, '2018-03-12 20:38:21', null);
INSERT INTO `tb_staff` VALUES ('3', '1491993786person1.jpg', '2', null, null, null, null, '2018-03-12 20:38:20', null);
INSERT INTO `tb_staff` VALUES ('4', '1491993913person3.jpg', '1', null, null, null, null, null, null);
