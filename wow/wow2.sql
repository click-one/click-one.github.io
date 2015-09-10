/*
Navicat MySQL Data Transfer

Source Server         : lvlei
Source Server Version : 50027
Source Host           : localhost:3306
Source Database       : wow

Target Server Type    : MYSQL
Target Server Version : 50027
File Encoding         : 65001

Date: 2015-06-30 20:56:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_item
-- ----------------------------
DROP TABLE IF EXISTS `tb_item`;
CREATE TABLE `tb_item` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `detail` varchar(255) default NULL COMMENT '商品描述',
  `createTime` datetime default NULL COMMENT '上市时间',
  `discount` double default NULL COMMENT '打折信息',
  `keyWords` varchar(255) default NULL COMMENT '搜索关键字',
  `area` varchar(255) default NULL COMMENT '产地',
  `saleCount` int(11) default NULL COMMENT '销售总量',
  `classify_id` int(11) default NULL COMMENT '分类号id',
  `repertory` int(11) default NULL COMMENT '库存量',
  `recommend` varchar(255) default '' COMMENT '是否推荐',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item
-- ----------------------------
INSERT INTO `tb_item` VALUES ('1', '香蕉', '10', '高营养', '2015-06-09 00:00:00', '1', null, '陕西安康', '100', '25', '234', 'no');
INSERT INTO `tb_item` VALUES ('2', '黄瓜', '15', '富含维生素', '2015-06-08 00:00:00', '1', null, '哈尔滨', '90', '26', '122', 'no');
INSERT INTO `tb_item` VALUES ('3', '香菜', '3.3', '美容养颜', '2015-06-07 00:00:00', '1', null, '重庆', '89', '28', '362', 'no');
INSERT INTO `tb_item` VALUES ('4', '菠萝', '29', '开胃消化', '2015-06-07 00:00:00', '1', null, '重庆', '210', '30', '26', 'no');
INSERT INTO `tb_item` VALUES ('5', '榴莲', '25', '一般人吃不了', '2015-06-07 00:00:00', '1', null, '美国', '130', '31', '36', 'no');
INSERT INTO `tb_item` VALUES ('6', '牛肉', '36', '富含高蛋白', '2015-06-07 00:00:00', '1', null, '新疆', '189', '12', '69', 'no');
INSERT INTO `tb_item` VALUES ('7', '大虾', '50', '富含高蛋白', '2015-06-07 00:00:00', '1', null, '浙江', '237', '32', '25', 'no');
INSERT INTO `tb_item` VALUES ('8', '豆干', '50', '零食', '2015-06-07 00:00:00', '0.5', null, '大连', '390', '34', '87', 'no');
INSERT INTO `tb_item` VALUES ('9', '大米', '10', '东北大米', '2015-06-07 00:00:00', '0.8', null, '哈尔滨', '56', '35', '69', 'no');
INSERT INTO `tb_item` VALUES ('10', '小头菜', '16', '健康无毒药', '2015-06-07 00:00:00', '0.8', null, '哈尔滨', '13', '37', '369', 'no');
INSERT INTO `tb_item` VALUES ('11', '番茄', '12', '很好的营养', '2012-09-09 00:00:00', '0.5', null, '哈尔滨', '20', '39', '789', 'no');
INSERT INTO `tb_item` VALUES ('12', '乐事薯片', '4', '脆爽', '2015-06-09 00:00:00', '0.7', null, '浙江', '123', '53', '214', 'no');
INSERT INTO `tb_item` VALUES ('13', '好有趣薯片', '4.5', '百吃不厌', '2015-06-21 00:00:00', '0.8', null, '上海', '246', '54', '23', 'no');
INSERT INTO `tb_item` VALUES ('14', '鲶鱼', '20', '高蛋白', '2015-05-21 00:00:00', '1', null, '安康', '20', '55', '98', 'no');
INSERT INTO `tb_item` VALUES ('15', '绿葡萄干', '23', '美容养颜', '2015-06-12 00:00:00', '0.8', null, '大河镇', '36', '57', '23', 'no');
INSERT INTO `tb_item` VALUES ('16', '黑葡萄干', '26', '很好的', '2015-06-12 00:00:00', '0.8', null, '西安市', '25', '58', '58', 'no');
INSERT INTO `tb_item` VALUES ('17', '玉米', '3', '粗粮', '2015-05-12 00:00:00', '0.5', null, '延安市', '48', '59', '96', 'no');
INSERT INTO `tb_item` VALUES ('18', '高粱', '15', '粗粮', '2015-05-20 00:00:00', '0.8', null, '汉中市', '78', '60', '87', 'no');
INSERT INTO `tb_item` VALUES ('19', '芝麻油', '13.2', '好油', '2015-05-20 00:00:00', '0.5', null, '铜川市', '356', '61', '15', 'no');
INSERT INTO `tb_item` VALUES ('20', '玉米油', '13.2', '好油', '2015-05-20 00:00:00', '0.8', null, '渭南市', '245', '62', '69', 'no');
INSERT INTO `tb_item` VALUES ('21', '栗子', '13', '很好的', '2015-03-20 00:00:00', '0.8', null, '哈尔滨市', '152', '63', '98', 'no');
INSERT INTO `tb_item` VALUES ('22', '紫葡萄', '13', '酸甜可口', '2015-03-20 00:00:00', '1', null, '大连', '312', '65', '25', 'no');
INSERT INTO `tb_item` VALUES ('23', '西瓜', '13', '酸甜', '2015-06-25 19:52:20', '1', null, '大连', '66', '66', '97', 'no');
INSERT INTO `tb_item` VALUES ('24', '核桃', '16.2', '补脑', '2015-06-20 00:00:00', '0.8', null, '大连', '21', '67', '78', 'no');
INSERT INTO `tb_item` VALUES ('25', '鸡蛋', '8.8', '好吃', '2015-06-20 00:00:00', '0.8', null, '大庆', '25', '68', '79', 'no');
INSERT INTO `tb_item` VALUES ('26', '鸭蛋', '9.9', '好吃', '2015-05-20 00:00:00', '0.8', null, '大庆', '369', '69', '82', 'no');
INSERT INTO `tb_item` VALUES ('27', '羊肉', '25.9', '好吃你就多吃点', '2015-05-28 00:00:00', '0.99', null, '大庆', '321', '71', '25', 'no');
INSERT INTO `tb_item` VALUES ('28', '草鱼', '25.9', '好吃你就多吃点', '2015-05-23 00:00:00', '0.98', null, '宁波', '568', '72', '36', 'no');
INSERT INTO `tb_item` VALUES ('29', '螃蟹', '30.9', '营养', '2015-05-22 00:00:00', '0.89', null, '宁波', '214', '74', '87', 'no');
INSERT INTO `tb_item` VALUES ('30', '桃子', '20', '赞', '2015-05-22 00:00:00', '0.88', null, '重庆', '321', '75', '69', 'no');
INSERT INTO `tb_item` VALUES ('31', '苹果', '9.9', '好', '2015-05-22 00:00:00', '0.88', null, '渭南', '231', '76', '789', 'no');
INSERT INTO `tb_item` VALUES ('32', '菠萝蜜', '33.9', '好', '2015-06-22 00:00:00', '0.88', null, '美国', '21', '77', '687', 'no');
INSERT INTO `tb_item` VALUES ('33', '小麦', '0.5', '健康 天然', '2015-09-06 00:00:00', '0.8', null, '哈尔滨', '34', '79', '951', 'yes');
INSERT INTO `tb_item` VALUES ('34', '牛奶', '1', '伊利纯牛奶', '2015-07-06 00:00:00', '1', null, '内蒙古', '78', '81', '159', 'yes');
INSERT INTO `tb_item` VALUES ('35', '豇豆', '8.9', '绿色 天然', '2015-07-06 00:00:00', '0.8', null, '北京', '243', '83', '357', 'yes');
INSERT INTO `tb_item` VALUES ('36', '芒果', '12.3', '热带雨林水果', '2015-05-05 00:00:00', '0.9', null, '印度', '34', '84', '852', 'yes');
INSERT INTO `tb_item` VALUES ('37', '海贝', '19.9', '味美', '2015-05-05 00:00:00', '0.99', null, '浙江', '123', '86', '365', 'yes');
INSERT INTO `tb_item` VALUES ('38', '牛肉干', '25.5', '牛肉必备食品', '2015-06-05 00:00:00', '0.9', null, '新疆', '235', '87', '254', 'yes');
INSERT INTO `tb_item` VALUES ('39', '人心果', '18.9', 'vc丰富', '2015-06-06 00:00:00', '0.8', null, '海南', '235', '88', '256', 'yes');

-- ----------------------------
-- Table structure for tb_item_classify
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_classify`;
CREATE TABLE `tb_item_classify` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) default NULL,
  `parent_id` int(11) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item_classify
-- ----------------------------
INSERT INTO `tb_item_classify` VALUES ('1', '优选蔬菜', '', '0');
INSERT INTO `tb_item_classify` VALUES ('2', '进口水果', null, '0');
INSERT INTO `tb_item_classify` VALUES ('3', '国产水果', null, '0');
INSERT INTO `tb_item_classify` VALUES ('4', '休闲食品', null, '0');
INSERT INTO `tb_item_classify` VALUES ('5', '油粮副食', null, '0');
INSERT INTO `tb_item_classify` VALUES ('6', '水产海鲜', null, '0');
INSERT INTO `tb_item_classify` VALUES ('7', '肉禽蛋品', null, '0');
INSERT INTO `tb_item_classify` VALUES ('8', '荔枝类', null, '2');
INSERT INTO `tb_item_classify` VALUES ('9', '樱桃类', null, '2');
INSERT INTO `tb_item_classify` VALUES ('11', '肉类', null, '7');
INSERT INTO `tb_item_classify` VALUES ('12', '牛肉', null, '11');
INSERT INTO `tb_item_classify` VALUES ('13', '鸡肉', null, '11');
INSERT INTO `tb_item_classify` VALUES ('17', '瓜类', null, '1');
INSERT INTO `tb_item_classify` VALUES ('18', '桃类', null, '3');
INSERT INTO `tb_item_classify` VALUES ('19', '干脆面类', null, '4');
INSERT INTO `tb_item_classify` VALUES ('20', '大米类', null, '5');
INSERT INTO `tb_item_classify` VALUES ('21', '虾类', null, '6');
INSERT INTO `tb_item_classify` VALUES ('22', '蛋类', null, '7');
INSERT INTO `tb_item_classify` VALUES ('24', '香蕉类', null, '3');
INSERT INTO `tb_item_classify` VALUES ('25', '香蕉', null, '24');
INSERT INTO `tb_item_classify` VALUES ('26', '黄瓜', null, '17');
INSERT INTO `tb_item_classify` VALUES ('27', '调味品类', null, '1');
INSERT INTO `tb_item_classify` VALUES ('28', '香菜', null, '27');
INSERT INTO `tb_item_classify` VALUES ('29', '雨林水果类', null, '2');
INSERT INTO `tb_item_classify` VALUES ('30', '菠萝', null, '29');
INSERT INTO `tb_item_classify` VALUES ('31', '榴莲', null, '29');
INSERT INTO `tb_item_classify` VALUES ('32', '大虾', null, '21');
INSERT INTO `tb_item_classify` VALUES ('33', '零食类', null, '4');
INSERT INTO `tb_item_classify` VALUES ('34', '豆干', null, '33');
INSERT INTO `tb_item_classify` VALUES ('35', '大米', null, '20');
INSERT INTO `tb_item_classify` VALUES ('36', '白菜类', null, '1');
INSERT INTO `tb_item_classify` VALUES ('37', '大头菜', null, '36');
INSERT INTO `tb_item_classify` VALUES ('38', '番茄类', null, '1');
INSERT INTO `tb_item_classify` VALUES ('39', '小番茄', null, '38');
INSERT INTO `tb_item_classify` VALUES ('40', '小鱼类', null, '6');
INSERT INTO `tb_item_classify` VALUES ('41', '大鱼类', null, '6');
INSERT INTO `tb_item_classify` VALUES ('42', '油类', null, '5');
INSERT INTO `tb_item_classify` VALUES ('43', '干粮类', null, '5');
INSERT INTO `tb_item_classify` VALUES ('44', '苹果类', null, '3');
INSERT INTO `tb_item_classify` VALUES ('45', '猪肉类', null, '7');
INSERT INTO `tb_item_classify` VALUES ('46', '牛肉类', null, '7');
INSERT INTO `tb_item_classify` VALUES ('47', '饼干类', null, '4');
INSERT INTO `tb_item_classify` VALUES ('48', '薯片类', null, '4');
INSERT INTO `tb_item_classify` VALUES ('49', '坚果类', null, '4');
INSERT INTO `tb_item_classify` VALUES ('50', '梨类', null, '3');
INSERT INTO `tb_item_classify` VALUES ('51', '西瓜类', null, '3');
INSERT INTO `tb_item_classify` VALUES ('52', '哈密瓜类', null, '3');
INSERT INTO `tb_item_classify` VALUES ('53', '乐事薯片', null, '48');
INSERT INTO `tb_item_classify` VALUES ('54', '好有趣薯片', null, '48');
INSERT INTO `tb_item_classify` VALUES ('55', '鲶鱼', null, '40');
INSERT INTO `tb_item_classify` VALUES ('56', '葡萄干类', null, '4');
INSERT INTO `tb_item_classify` VALUES ('57', '绿葡萄干', null, '56');
INSERT INTO `tb_item_classify` VALUES ('58', '黑葡萄干', null, '56');
INSERT INTO `tb_item_classify` VALUES ('59', '玉米', null, '43');
INSERT INTO `tb_item_classify` VALUES ('60', '高粱', null, '43');
INSERT INTO `tb_item_classify` VALUES ('61', '芝麻油', null, '42');
INSERT INTO `tb_item_classify` VALUES ('62', '玉米油', null, '42');
INSERT INTO `tb_item_classify` VALUES ('63', '栗子', null, '33');
INSERT INTO `tb_item_classify` VALUES ('64', '葡萄类', null, '2');
INSERT INTO `tb_item_classify` VALUES ('65', '紫葡萄', null, '64');
INSERT INTO `tb_item_classify` VALUES ('66', '脆皮西瓜', null, '51');
INSERT INTO `tb_item_classify` VALUES ('67', '核桃', null, '49');
INSERT INTO `tb_item_classify` VALUES ('68', '鸡蛋', null, '22');
INSERT INTO `tb_item_classify` VALUES ('69', '鸭蛋', null, '22');
INSERT INTO `tb_item_classify` VALUES ('70', '羊肉类', null, '7');
INSERT INTO `tb_item_classify` VALUES ('71', '羊肉', null, '70');
INSERT INTO `tb_item_classify` VALUES ('72', '草鱼', null, '41');
INSERT INTO `tb_item_classify` VALUES ('73', '螃蟹类', null, '6');
INSERT INTO `tb_item_classify` VALUES ('74', '螃蟹', null, '73');
INSERT INTO `tb_item_classify` VALUES ('75', '桃子', null, '18');
INSERT INTO `tb_item_classify` VALUES ('76', '苹果类', null, '44');
INSERT INTO `tb_item_classify` VALUES ('77', '菠萝蜜', null, '29');
INSERT INTO `tb_item_classify` VALUES ('78', '小麦类', null, '5');
INSERT INTO `tb_item_classify` VALUES ('79', '小麦', null, '78');
INSERT INTO `tb_item_classify` VALUES ('80', '奶制品', null, '7');
INSERT INTO `tb_item_classify` VALUES ('81', '牛奶', null, '80');
INSERT INTO `tb_item_classify` VALUES ('82', '茎类', null, '1');
INSERT INTO `tb_item_classify` VALUES ('83', '豇豆', null, '82');
INSERT INTO `tb_item_classify` VALUES ('84', '芒果', null, '29');
INSERT INTO `tb_item_classify` VALUES ('85', '贝类', null, '6');
INSERT INTO `tb_item_classify` VALUES ('86', '海贝', null, '85');
INSERT INTO `tb_item_classify` VALUES ('87', '牛肉干', null, '33');
INSERT INTO `tb_item_classify` VALUES ('88', '人心果', null, '18');

-- ----------------------------
-- Table structure for tb_item_info_pic
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_info_pic`;
CREATE TABLE `tb_item_info_pic` (
  `id` int(11) NOT NULL auto_increment,
  `item_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item_info_pic
-- ----------------------------
INSERT INTO `tb_item_info_pic` VALUES ('1', '36', '/itemInfoPic/1.jpg', '2015-06-27 16:59:26');
INSERT INTO `tb_item_info_pic` VALUES ('2', '36', '/itemInfoPic/2.jpg', '2015-06-27 17:01:44');
INSERT INTO `tb_item_info_pic` VALUES ('3', '36', '/itemInfoPic/3.jpg', '2015-06-27 17:02:00');
INSERT INTO `tb_item_info_pic` VALUES ('4', '36', '/itemInfoPic/4.jpg', '2015-06-27 17:02:05');
INSERT INTO `tb_item_info_pic` VALUES ('5', '36', '/itemInfoPic/5.jpg', '2015-06-27 17:02:28');

-- ----------------------------
-- Table structure for tb_item_pic
-- ----------------------------
DROP TABLE IF EXISTS `tb_item_pic`;
CREATE TABLE `tb_item_pic` (
  `id` int(11) NOT NULL auto_increment,
  `item_id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_item_pic
-- ----------------------------
INSERT INTO `tb_item_pic` VALUES ('1', '1', '/wowPic/1e5417e9-37e7-4de6-81aa-f96bc9efb2d4.jpg');
INSERT INTO `tb_item_pic` VALUES ('2', '2', '/wowPic/b42577e0-8cf1-4657-95c2-134ce9a300b0.jpg');
INSERT INTO `tb_item_pic` VALUES ('3', '3', '/wowPic/94452f9e-1c89-4212-bcda-6701f28e0e19.jpg');
INSERT INTO `tb_item_pic` VALUES ('4', '4', '/wowPic/c3fa28b3-1ad5-4798-97ef-8aa6e2d37025.jpg');
INSERT INTO `tb_item_pic` VALUES ('5', '5', '/wowPic/43f813eb-176d-46de-8421-70de6939e690.jpg');
INSERT INTO `tb_item_pic` VALUES ('6', '6', '/wowPic/f3cf1796-ead3-454c-a5a5-daf847e4b6b6.jpg');
INSERT INTO `tb_item_pic` VALUES ('7', '7', '/wowPic/3b59c5a0-03c6-49dc-97a7-c2f769d910c9.jpg');
INSERT INTO `tb_item_pic` VALUES ('8', '8', '/wowPic/5cb9ebe7-43fa-4593-ac52-1c17c6ce020b.jpg');
INSERT INTO `tb_item_pic` VALUES ('9', '9', '/wowPic/2011d6c5-33f0-461a-815c-9516d09eccb7.jpg');
INSERT INTO `tb_item_pic` VALUES ('10', '10', '/wowPic/1a09d1f6-91ab-45de-a6dc-ee12538380bf.jpg');
INSERT INTO `tb_item_pic` VALUES ('11', '11', '/wowPic/eaf186ca-f158-48f3-8288-cbd00b8669fc.jpg');
INSERT INTO `tb_item_pic` VALUES ('12', '12', '/wowPic/4f2b75b1-bff8-473a-b79d-ca6a5613fc71.jpg');
INSERT INTO `tb_item_pic` VALUES ('13', '13', '/wowPic/b38c2217-cfbf-4e6c-aaa8-4ed6de10f0e1.jpg');
INSERT INTO `tb_item_pic` VALUES ('14', '14', '/wowPic/b373052b-fe88-4a71-95e3-0626497db0a6.jpg');
INSERT INTO `tb_item_pic` VALUES ('15', '15', '/wowPic/02d88605-1c51-4f5a-87d9-579d978bc683.jpg');
INSERT INTO `tb_item_pic` VALUES ('16', '16', '/wowPic/4c3abd61-c528-49ae-b0b8-03dc1f27ff50.jpg');
INSERT INTO `tb_item_pic` VALUES ('17', '17', '/wowPic/a31b9f4e-96c7-4f02-920c-b5f8dad3134a.jpg');
INSERT INTO `tb_item_pic` VALUES ('18', '18', '/wowPic/6e596d8d-bb1e-4478-8894-13e0d32a2a7e.jpg');
INSERT INTO `tb_item_pic` VALUES ('19', '19', '/wowPic/d70605c3-74c2-481a-9d37-8816d502c0dc.jpg');
INSERT INTO `tb_item_pic` VALUES ('20', '20', '/wowPic/ce952554-671c-49c4-8c6f-180e67a300da.jpg');
INSERT INTO `tb_item_pic` VALUES ('21', '21', '/wowPic/ed174798-9065-4812-b172-e51bf35ebb8d.jpg');
INSERT INTO `tb_item_pic` VALUES ('22', '22', '/wowPic/584a37bf-62fe-426d-9d91-7e18c1bc1c42.jpg');
INSERT INTO `tb_item_pic` VALUES ('23', '23', '/wowPic/286ce00a-2151-4db4-b0dd-c9e0498475b8.jpg');
INSERT INTO `tb_item_pic` VALUES ('24', '24', '/wowPic/865ff0ff-754c-4a01-9103-5afd2ab1cf5f.jpg');
INSERT INTO `tb_item_pic` VALUES ('25', '25', '/wowPic/b1027805-9222-4f73-98c6-6096ab1a2056.jpg');
INSERT INTO `tb_item_pic` VALUES ('26', '26', '/wowPic/b21a9714-1c19-46ac-b249-f00b9082c851.jpg');
INSERT INTO `tb_item_pic` VALUES ('27', '27', '/wowPic/104dc599-6a3e-4bf8-9b92-b79835dbb6f7.jpg');
INSERT INTO `tb_item_pic` VALUES ('28', '28', '/wowPic/ea45856f-fd65-4657-a6a9-5ca8a926ccdc.jpg');
INSERT INTO `tb_item_pic` VALUES ('29', '29', '/wowPic/da30cab9-0d81-4069-a7f2-16fb74aae0c7.jpg');
INSERT INTO `tb_item_pic` VALUES ('30', '30', '/wowPic/208691b1-f850-4b35-9b4f-00be657d3745.jpg');
INSERT INTO `tb_item_pic` VALUES ('31', '31', '/wowPic/79396825-d648-4110-89f6-1a04b7d29127.jpg');
INSERT INTO `tb_item_pic` VALUES ('32', '32', '/wowPic/d619492d-e36b-4829-83f9-1feb0f003e28.jpg');
INSERT INTO `tb_item_pic` VALUES ('33', '33', '/wowPic/834a4900-f3e9-46b4-9da8-259908a2bec5.jpg');
INSERT INTO `tb_item_pic` VALUES ('34', '34', '/wowPic/f86eab3e-7f9a-4177-974e-624ada0157fb.jpg');
INSERT INTO `tb_item_pic` VALUES ('35', '35', '/wowPic/4f234eb5-d370-4fe5-9bec-7572e1c9ad0d.jpg');
INSERT INTO `tb_item_pic` VALUES ('36', '36', '/wowPic/075e4605-a8aa-4e7b-b09c-9a159e111f2d.jpg');
INSERT INTO `tb_item_pic` VALUES ('37', '37', '/wowPic/ab23fd03-f256-44fc-a7c4-47827bbc9e23.jpg');
INSERT INTO `tb_item_pic` VALUES ('38', '38', '/wowPic/81d6610a-e14b-4e92-93be-451cec54de0c.jpg');
INSERT INTO `tb_item_pic` VALUES ('39', '39', '/wowPic/bbcefe7f-24ec-4de0-9062-f231f5e3e79c.jpg');

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `consignee` varchar(255) default NULL COMMENT '收货人',
  `note` varchar(255) NOT NULL,
  `telphone` varchar(255) NOT NULL,
  `totalPrice` double NOT NULL,
  `createTime` datetime NOT NULL,
  `address_id` int(11) NOT NULL,
  `state` varchar(255) NOT NULL COMMENT '支付的状态',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order
-- ----------------------------
INSERT INTO `tb_order` VALUES ('1', '6', '吕磊', '亲，快递快一点哦', '18745033503', '565', '2015-06-20 14:28:06', '1', '未支付');
INSERT INTO `tb_order` VALUES ('2', '6', '小杨', '好货', '123456789', '896', '2015-06-21 20:06:52', '2', '未支付');
INSERT INTO `tb_order` VALUES ('3', '6', '隔壁老王', '哈哈', '123654789654', '943', '2015-06-21 20:27:38', '3', '未支付');
INSERT INTO `tb_order` VALUES ('4', '6', 'asdfasdf', 'asdfasdf', 'asdfasdf', '798', '2015-06-21 21:14:58', '4', '未支付');
INSERT INTO `tb_order` VALUES ('5', '6', 'asdf', 'asdf', 'asdf', '448', '2015-06-21 21:16:30', '5', '未支付');
INSERT INTO `tb_order` VALUES ('6', '6', 'asdf', 'asdf', 'adsf', '448', '2015-06-21 21:19:37', '6', '未支付');
INSERT INTO `tb_order` VALUES ('7', '6', 'asdf', 'asdfa', 'asdf', '448', '2015-06-21 21:20:54', '7', '未支付');
INSERT INTO `tb_order` VALUES ('8', '6', 'asdf', 'asdf', 'asdf', '1041', '2015-06-21 21:21:22', '8', '未支付');
INSERT INTO `tb_order` VALUES ('9', '6', 'qwer', 'qwer', 'adsf', '130', '2015-06-21 21:22:42', '9', '未支付');

-- ----------------------------
-- Table structure for tb_order_details
-- ----------------------------
DROP TABLE IF EXISTS `tb_order_details`;
CREATE TABLE `tb_order_details` (
  `id` int(11) NOT NULL auto_increment,
  `order_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `item_num` int(11) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_order_details
-- ----------------------------
INSERT INTO `tb_order_details` VALUES ('1', '1', '1', '2');
INSERT INTO `tb_order_details` VALUES ('2', '1', '2', '3');
INSERT INTO `tb_order_details` VALUES ('3', '1', '5', '6');
INSERT INTO `tb_order_details` VALUES ('4', '1', '8', '7');
INSERT INTO `tb_order_details` VALUES ('5', '2', '3', '6');
INSERT INTO `tb_order_details` VALUES ('6', '2', '5', '6');
INSERT INTO `tb_order_details` VALUES ('7', '2', '6', '6');
INSERT INTO `tb_order_details` VALUES ('8', '2', '8', '7');
INSERT INTO `tb_order_details` VALUES ('9', '3', '4', '5');
INSERT INTO `tb_order_details` VALUES ('10', '3', '8', '7');
INSERT INTO `tb_order_details` VALUES ('11', '3', '9', '24');
INSERT INTO `tb_order_details` VALUES ('12', '3', '10', '13');
INSERT INTO `tb_order_details` VALUES ('13', '4', '8', '7');
INSERT INTO `tb_order_details` VALUES ('14', '4', '9', '24');
INSERT INTO `tb_order_details` VALUES ('15', '4', '10', '13');
INSERT INTO `tb_order_details` VALUES ('16', '5', '9', '24');
INSERT INTO `tb_order_details` VALUES ('17', '5', '10', '13');
INSERT INTO `tb_order_details` VALUES ('18', '6', '9', '24');
INSERT INTO `tb_order_details` VALUES ('19', '6', '10', '13');
INSERT INTO `tb_order_details` VALUES ('20', '7', '9', '24');
INSERT INTO `tb_order_details` VALUES ('21', '7', '10', '13');
INSERT INTO `tb_order_details` VALUES ('22', '8', '3', '6');
INSERT INTO `tb_order_details` VALUES ('23', '8', '4', '5');
INSERT INTO `tb_order_details` VALUES ('24', '8', '5', '6');
INSERT INTO `tb_order_details` VALUES ('25', '8', '6', '6');
INSERT INTO `tb_order_details` VALUES ('26', '8', '8', '7');
INSERT INTO `tb_order_details` VALUES ('27', '9', '1', '4');
INSERT INTO `tb_order_details` VALUES ('28', '9', '2', '6');

-- ----------------------------
-- Table structure for tb_roll_pic
-- ----------------------------
DROP TABLE IF EXISTS `tb_roll_pic`;
CREATE TABLE `tb_roll_pic` (
  `id` int(11) NOT NULL auto_increment,
  `url` varchar(255) NOT NULL,
  `link` varchar(255) default NULL,
  `createTime` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_roll_pic
-- ----------------------------
INSERT INTO `tb_roll_pic` VALUES ('1', '/rollPic/1.jpg', null, '2015-06-23 16:39:38');
INSERT INTO `tb_roll_pic` VALUES ('2', '/rollPic/2.jpg', null, '2015-06-23 16:39:44');
INSERT INTO `tb_roll_pic` VALUES ('3', '/rollPic/3.jpg', null, '2015-06-23 16:39:48');
INSERT INTO `tb_roll_pic` VALUES ('4', '/rollPic/4.jpg', null, '2015-06-23 16:39:53');
INSERT INTO `tb_roll_pic` VALUES ('5', '/rollPic/5.jpg', null, '2015-06-23 16:39:57');

-- ----------------------------
-- Table structure for tb_user
-- ----------------------------
DROP TABLE IF EXISTS `tb_user`;
CREATE TABLE `tb_user` (
  `id` int(255) NOT NULL auto_increment,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) default NULL,
  `gender` varchar(255) default NULL,
  `telphone` varchar(255) default NULL,
  `activeTime` datetime default NULL,
  `userType` varchar(255) default 'user',
  `activeState` varchar(255) default 'no',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user
-- ----------------------------
INSERT INTO `tb_user` VALUES ('1', '4567wewee', '123456789', '1330206111@qq.com', null, '15214412364', '2015-06-02 17:51:45', 'user', 'no');
INSERT INTO `tb_user` VALUES ('2', 'click_one', '123456', 'click_one@126.com', null, '18745033503', null, 'user', 'no');
INSERT INTO `tb_user` VALUES ('3', 'click', 'ycs1352667433', '1352667433@qq.com', null, '13956871236', null, 'user', 'no');
INSERT INTO `tb_user` VALUES ('4', 'xiaoming', '123654', 'click_one@qq.com', null, '13987453621', null, 'user', 'no');
INSERT INTO `tb_user` VALUES ('5', 'click_one1', '123456qwe', 'adfadf@qq.com', null, '13412345678', null, 'user', 'no');
INSERT INTO `tb_user` VALUES ('6', 'xiaoli', '123456', '133654789@qq.com', null, '13698745632', null, 'user', 'no');
INSERT INTO `tb_user` VALUES ('7', 'xiaoli1', '123456', '820042649@qq.com', null, '13567891234', null, 'user', 'no');

-- ----------------------------
-- Table structure for tb_user_address
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_address`;
CREATE TABLE `tb_user_address` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_address
-- ----------------------------
INSERT INTO `tb_user_address` VALUES ('1', '6', '黑龙江省哈尔滨市南岗区黑龙江大学C区地下创业园B8室');
INSERT INTO `tb_user_address` VALUES ('2', '6', '哈尔滨工业大学');
INSERT INTO `tb_user_address` VALUES ('3', '6', '哈尔冰');
INSERT INTO `tb_user_address` VALUES ('4', '6', 'asdfad');
INSERT INTO `tb_user_address` VALUES ('5', '6', 'adsf');
INSERT INTO `tb_user_address` VALUES ('6', '6', 'adsf');
INSERT INTO `tb_user_address` VALUES ('7', '6', 'adsf');
INSERT INTO `tb_user_address` VALUES ('8', '6', 'adsf');
INSERT INTO `tb_user_address` VALUES ('9', '6', 'asdf');

-- ----------------------------
-- Table structure for tb_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_collect`;
CREATE TABLE `tb_user_collect` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `collectTime` datetime default NULL,
  `collectPrice` double default NULL COMMENT '收藏价格',
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_collect
-- ----------------------------
INSERT INTO `tb_user_collect` VALUES ('1', '2', '1', '2015-06-06 11:04:00', null);
INSERT INTO `tb_user_collect` VALUES ('2', '2', '2', '2015-06-06 11:04:47', null);
INSERT INTO `tb_user_collect` VALUES ('3', '2', '3', '2015-06-06 11:04:50', null);
INSERT INTO `tb_user_collect` VALUES ('4', '2', '5', '2015-06-06 11:04:56', null);
INSERT INTO `tb_user_collect` VALUES ('5', '2', '4', '2015-06-06 11:04:58', null);
INSERT INTO `tb_user_collect` VALUES ('6', '2', '6', '2015-06-15 09:24:16', null);
INSERT INTO `tb_user_collect` VALUES ('7', '2', '8', '2015-06-15 09:24:57', null);
INSERT INTO `tb_user_collect` VALUES ('8', '6', '1', '2015-06-16 19:39:30', null);
INSERT INTO `tb_user_collect` VALUES ('9', '6', '2', '2015-06-16 19:39:36', null);
INSERT INTO `tb_user_collect` VALUES ('10', '6', '5', '2015-06-16 19:39:41', null);

-- ----------------------------
-- Table structure for tb_user_comment
-- ----------------------------
DROP TABLE IF EXISTS `tb_user_comment`;
CREATE TABLE `tb_user_comment` (
  `id` int(11) NOT NULL auto_increment,
  `user_id` int(11) NOT NULL,
  `item_id` int(11) default NULL,
  `information` varchar(255) default NULL,
  `visible` varchar(255) default NULL,
  `time` datetime default NULL,
  `score` varchar(255) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tb_user_comment
-- ----------------------------
INSERT INTO `tb_user_comment` VALUES ('1', '0', '25', '我是第0用户', '是', '2015-06-25 14:18:19', '1');
INSERT INTO `tb_user_comment` VALUES ('2', '1', '25', '我是第1用户', '否', '2015-06-25 14:18:19', '2');
INSERT INTO `tb_user_comment` VALUES ('3', '2', '25', '我是第2用户', '是', '2015-06-25 14:18:19', '3');
INSERT INTO `tb_user_comment` VALUES ('4', '3', '25', '我是第3用户', '否', '2015-06-25 14:18:19', '4');
INSERT INTO `tb_user_comment` VALUES ('5', '4', '25', '我是第4用户', '是', '2015-06-25 14:18:19', '5');
INSERT INTO `tb_user_comment` VALUES ('6', '5', '25', '我是第5用户', '否', '2015-06-25 14:18:19', '1');
INSERT INTO `tb_user_comment` VALUES ('7', '6', '25', '我是第6用户', '是', '2015-06-25 14:18:19', '2');
INSERT INTO `tb_user_comment` VALUES ('8', '0', '25', '我是第7用户', '否', '2015-06-25 14:18:19', '3');
INSERT INTO `tb_user_comment` VALUES ('9', '1', '25', '我是第8用户', '是', '2015-06-25 14:18:20', '4');
INSERT INTO `tb_user_comment` VALUES ('10', '2', '25', '我是第9用户', '否', '2015-06-25 14:18:20', '5');
INSERT INTO `tb_user_comment` VALUES ('11', '3', '25', '我是第10用户', '是', '2015-06-25 14:18:20', '1');
INSERT INTO `tb_user_comment` VALUES ('12', '4', '25', '我是第11用户', '否', '2015-06-25 14:18:20', '2');
INSERT INTO `tb_user_comment` VALUES ('13', '5', '25', '我是第12用户', '是', '2015-06-25 14:18:20', '3');
INSERT INTO `tb_user_comment` VALUES ('14', '6', '25', '我是第13用户', '否', '2015-06-25 14:18:20', '4');
INSERT INTO `tb_user_comment` VALUES ('15', '0', '25', '我是第14用户', '是', '2015-06-25 14:18:20', '5');
INSERT INTO `tb_user_comment` VALUES ('16', '1', '25', '我是第15用户', '否', '2015-06-25 14:18:20', '1');
INSERT INTO `tb_user_comment` VALUES ('17', '2', '25', '我是第16用户', '是', '2015-06-25 14:18:20', '2');
INSERT INTO `tb_user_comment` VALUES ('18', '3', '25', '我是第17用户', '否', '2015-06-25 14:18:20', '3');
INSERT INTO `tb_user_comment` VALUES ('19', '4', '25', '我是第18用户', '是', '2015-06-25 14:18:20', '4');
INSERT INTO `tb_user_comment` VALUES ('20', '5', '25', '我是第19用户', '否', '2015-06-25 14:18:20', '5');
INSERT INTO `tb_user_comment` VALUES ('21', '6', '25', '我是第20用户', '是', '2015-06-25 14:18:20', '1');
INSERT INTO `tb_user_comment` VALUES ('22', '0', '25', '我是第21用户', '否', '2015-06-25 14:18:20', '2');
INSERT INTO `tb_user_comment` VALUES ('23', '1', '25', '我是第22用户', '是', '2015-06-25 14:18:20', '3');
INSERT INTO `tb_user_comment` VALUES ('24', '2', '25', '我是第23用户', '否', '2015-06-25 14:18:20', '4');
INSERT INTO `tb_user_comment` VALUES ('25', '3', '25', '我是第24用户', '是', '2015-06-25 14:18:20', '5');
INSERT INTO `tb_user_comment` VALUES ('26', '4', '25', '我是第25用户', '否', '2015-06-25 14:18:20', '1');
INSERT INTO `tb_user_comment` VALUES ('27', '5', '25', '我是第26用户', '是', '2015-06-25 14:18:20', '2');
INSERT INTO `tb_user_comment` VALUES ('28', '6', '25', '我是第27用户', '否', '2015-06-25 14:18:20', '3');
INSERT INTO `tb_user_comment` VALUES ('29', '0', '25', '我是第28用户', '是', '2015-06-25 14:18:20', '4');
INSERT INTO `tb_user_comment` VALUES ('30', '1', '25', '我是第29用户', '否', '2015-06-25 14:18:20', '5');
INSERT INTO `tb_user_comment` VALUES ('31', '2', '25', '我是第30用户', '是', '2015-06-25 14:18:20', '1');
INSERT INTO `tb_user_comment` VALUES ('32', '3', '25', '我是第31用户', '否', '2015-06-25 14:18:20', '2');
INSERT INTO `tb_user_comment` VALUES ('33', '4', '25', '我是第32用户', '是', '2015-06-25 14:18:21', '3');
INSERT INTO `tb_user_comment` VALUES ('34', '5', '25', '我是第33用户', '否', '2015-06-25 14:18:21', '4');
INSERT INTO `tb_user_comment` VALUES ('35', '6', '25', '我是第34用户', '是', '2015-06-25 14:18:21', '5');
INSERT INTO `tb_user_comment` VALUES ('36', '0', '25', '我是第35用户', '否', '2015-06-25 14:18:21', '1');
INSERT INTO `tb_user_comment` VALUES ('37', '1', '25', '我是第36用户', '是', '2015-06-25 14:18:21', '2');
INSERT INTO `tb_user_comment` VALUES ('38', '2', '25', '我是第37用户', '否', '2015-06-25 14:18:21', '3');
INSERT INTO `tb_user_comment` VALUES ('39', '3', '25', '我是第38用户', '是', '2015-06-25 14:18:21', '4');
INSERT INTO `tb_user_comment` VALUES ('40', '4', '25', '我是第39用户', '否', '2015-06-25 14:18:21', '5');
INSERT INTO `tb_user_comment` VALUES ('41', '5', '25', '我是第40用户', '是', '2015-06-25 14:18:21', '1');
INSERT INTO `tb_user_comment` VALUES ('42', '6', '25', '我是第41用户', '否', '2015-06-25 14:18:21', '2');
INSERT INTO `tb_user_comment` VALUES ('43', '0', '25', '我是第42用户', '是', '2015-06-25 14:18:21', '3');
INSERT INTO `tb_user_comment` VALUES ('44', '1', '25', '我是第43用户', '否', '2015-06-25 14:18:21', '4');
INSERT INTO `tb_user_comment` VALUES ('45', '2', '25', '我是第44用户', '是', '2015-06-25 14:18:21', '5');
INSERT INTO `tb_user_comment` VALUES ('46', '3', '25', '我是第45用户', '否', '2015-06-25 14:18:21', '1');
INSERT INTO `tb_user_comment` VALUES ('47', '4', '25', '我是第46用户', '是', '2015-06-25 14:18:21', '2');
INSERT INTO `tb_user_comment` VALUES ('48', '5', '25', '我是第47用户', '否', '2015-06-25 14:18:21', '3');
INSERT INTO `tb_user_comment` VALUES ('49', '6', '25', '我是第48用户', '是', '2015-06-25 14:18:21', '4');
INSERT INTO `tb_user_comment` VALUES ('50', '0', '25', '我是第49用户', '否', '2015-06-25 14:18:21', '5');
INSERT INTO `tb_user_comment` VALUES ('51', '1', '25', '我是第50用户', '是', '2015-06-25 14:18:21', '1');
INSERT INTO `tb_user_comment` VALUES ('52', '2', '25', '我是第51用户', '否', '2015-06-25 14:18:21', '2');
INSERT INTO `tb_user_comment` VALUES ('53', '3', '25', '我是第52用户', '是', '2015-06-25 14:18:22', '3');
INSERT INTO `tb_user_comment` VALUES ('54', '4', '25', '我是第53用户', '否', '2015-06-25 14:18:22', '4');
INSERT INTO `tb_user_comment` VALUES ('55', '5', '25', '我是第54用户', '是', '2015-06-25 14:18:22', '5');
INSERT INTO `tb_user_comment` VALUES ('56', '6', '25', '我是第55用户', '否', '2015-06-25 14:18:22', '1');
INSERT INTO `tb_user_comment` VALUES ('57', '0', '25', '我是第56用户', '是', '2015-06-25 14:18:22', '2');
INSERT INTO `tb_user_comment` VALUES ('58', '1', '25', '我是第57用户', '否', '2015-06-25 14:18:22', '3');
INSERT INTO `tb_user_comment` VALUES ('59', '2', '25', '我是第58用户', '是', '2015-06-25 14:18:22', '4');
INSERT INTO `tb_user_comment` VALUES ('60', '3', '25', '我是第59用户', '否', '2015-06-25 14:18:22', '5');
INSERT INTO `tb_user_comment` VALUES ('61', '4', '25', '我是第60用户', '是', '2015-06-25 14:18:22', '1');
INSERT INTO `tb_user_comment` VALUES ('62', '5', '25', '我是第61用户', '否', '2015-06-25 14:18:22', '2');
INSERT INTO `tb_user_comment` VALUES ('63', '6', '25', '我是第62用户', '是', '2015-06-25 14:18:22', '3');
INSERT INTO `tb_user_comment` VALUES ('64', '0', '25', '我是第63用户', '否', '2015-06-25 14:18:22', '4');
INSERT INTO `tb_user_comment` VALUES ('65', '1', '25', '我是第64用户', '是', '2015-06-25 14:18:22', '5');
INSERT INTO `tb_user_comment` VALUES ('66', '2', '25', '我是第65用户', '否', '2015-06-25 14:18:22', '1');
INSERT INTO `tb_user_comment` VALUES ('67', '3', '25', '我是第66用户', '是', '2015-06-25 14:18:22', '2');
INSERT INTO `tb_user_comment` VALUES ('68', '4', '25', '我是第67用户', '否', '2015-06-25 14:18:22', '3');
INSERT INTO `tb_user_comment` VALUES ('69', '5', '25', '我是第68用户', '是', '2015-06-25 14:18:22', '4');
INSERT INTO `tb_user_comment` VALUES ('70', '6', '25', '我是第69用户', '否', '2015-06-25 14:18:22', '5');
INSERT INTO `tb_user_comment` VALUES ('71', '0', '25', '我是第70用户', '是', '2015-06-25 14:18:22', '1');
INSERT INTO `tb_user_comment` VALUES ('72', '1', '25', '我是第71用户', '否', '2015-06-25 14:18:22', '2');
INSERT INTO `tb_user_comment` VALUES ('73', '2', '25', '我是第72用户', '是', '2015-06-25 14:18:22', '3');
INSERT INTO `tb_user_comment` VALUES ('74', '3', '25', '我是第73用户', '否', '2015-06-25 14:18:22', '4');
INSERT INTO `tb_user_comment` VALUES ('75', '4', '25', '我是第74用户', '是', '2015-06-25 14:18:22', '5');
INSERT INTO `tb_user_comment` VALUES ('76', '5', '25', '我是第75用户', '否', '2015-06-25 14:18:22', '1');
INSERT INTO `tb_user_comment` VALUES ('77', '6', '25', '我是第76用户', '是', '2015-06-25 14:18:22', '2');
INSERT INTO `tb_user_comment` VALUES ('78', '0', '25', '我是第77用户', '否', '2015-06-25 14:18:23', '3');
INSERT INTO `tb_user_comment` VALUES ('79', '1', '25', '我是第78用户', '是', '2015-06-25 14:18:23', '4');
INSERT INTO `tb_user_comment` VALUES ('80', '2', '25', '我是第79用户', '否', '2015-06-25 14:18:23', '5');
INSERT INTO `tb_user_comment` VALUES ('81', '3', '25', '我是第80用户', '是', '2015-06-25 14:18:23', '1');
INSERT INTO `tb_user_comment` VALUES ('82', '4', '25', '我是第81用户', '否', '2015-06-25 14:18:23', '2');
INSERT INTO `tb_user_comment` VALUES ('83', '5', '25', '我是第82用户', '是', '2015-06-25 14:18:23', '3');
INSERT INTO `tb_user_comment` VALUES ('84', '6', '25', '我是第83用户', '否', '2015-06-25 14:18:23', '4');
INSERT INTO `tb_user_comment` VALUES ('85', '0', '25', '我是第84用户', '是', '2015-06-25 14:18:23', '5');
INSERT INTO `tb_user_comment` VALUES ('86', '1', '25', '我是第85用户', '否', '2015-06-25 14:18:23', '1');
INSERT INTO `tb_user_comment` VALUES ('87', '2', '25', '我是第86用户', '是', '2015-06-25 14:18:23', '2');
INSERT INTO `tb_user_comment` VALUES ('88', '3', '25', '我是第87用户', '否', '2015-06-25 14:18:23', '3');
INSERT INTO `tb_user_comment` VALUES ('89', '4', '25', '我是第88用户', '是', '2015-06-25 14:18:23', '4');
INSERT INTO `tb_user_comment` VALUES ('90', '5', '25', '我是第89用户', '否', '2015-06-25 14:18:23', '5');
INSERT INTO `tb_user_comment` VALUES ('91', '6', '25', '我是第90用户', '是', '2015-06-25 14:18:23', '1');
INSERT INTO `tb_user_comment` VALUES ('92', '0', '25', '我是第91用户', '否', '2015-06-25 14:18:23', '2');
INSERT INTO `tb_user_comment` VALUES ('93', '1', '25', '我是第92用户', '是', '2015-06-25 14:18:23', '3');
INSERT INTO `tb_user_comment` VALUES ('94', '2', '25', '我是第93用户', '否', '2015-06-25 14:18:23', '4');
INSERT INTO `tb_user_comment` VALUES ('95', '3', '25', '我是第94用户', '是', '2015-06-25 14:18:23', '5');
INSERT INTO `tb_user_comment` VALUES ('96', '4', '25', '我是第95用户', '否', '2015-06-25 14:18:23', '1');
INSERT INTO `tb_user_comment` VALUES ('97', '5', '25', '我是第96用户', '是', '2015-06-25 14:18:23', '2');
INSERT INTO `tb_user_comment` VALUES ('98', '6', '25', '我是第97用户', '否', '2015-06-25 14:18:23', '3');
INSERT INTO `tb_user_comment` VALUES ('99', '0', '25', '我是第98用户', '是', '2015-06-25 14:18:23', '4');
INSERT INTO `tb_user_comment` VALUES ('100', '1', '25', '我是第99用户', '否', '2015-06-25 14:18:24', '5');
INSERT INTO `tb_user_comment` VALUES ('101', '0', '25', '我是第0用户', '是', '2015-06-26 09:39:17', '1');
INSERT INTO `tb_user_comment` VALUES ('102', '1', '25', '我是第1用户', '否', '2015-06-26 09:39:18', '2');
INSERT INTO `tb_user_comment` VALUES ('103', '2', '25', '我是第2用户', '是', '2015-06-26 09:39:18', '3');
INSERT INTO `tb_user_comment` VALUES ('104', '3', '25', '我是第3用户', '否', '2015-06-26 09:39:18', '4');
INSERT INTO `tb_user_comment` VALUES ('105', '4', '25', '我是第4用户', '是', '2015-06-26 09:39:18', '5');
INSERT INTO `tb_user_comment` VALUES ('106', '5', '25', '我是第5用户', '否', '2015-06-26 09:39:18', '1');
INSERT INTO `tb_user_comment` VALUES ('107', '6', '25', '我是第6用户', '是', '2015-06-26 09:39:18', '2');
INSERT INTO `tb_user_comment` VALUES ('108', '0', '25', '我是第7用户', '否', '2015-06-26 09:39:18', '3');
INSERT INTO `tb_user_comment` VALUES ('109', '1', '25', '我是第8用户', '是', '2015-06-26 09:39:18', '4');
INSERT INTO `tb_user_comment` VALUES ('110', '2', '25', '我是第9用户', '否', '2015-06-26 09:39:18', '5');
INSERT INTO `tb_user_comment` VALUES ('111', '3', '25', '我是第10用户', '是', '2015-06-26 09:39:18', '1');
INSERT INTO `tb_user_comment` VALUES ('112', '4', '25', '我是第11用户', '否', '2015-06-26 09:39:18', '2');
INSERT INTO `tb_user_comment` VALUES ('113', '5', '25', '我是第12用户', '是', '2015-06-26 09:39:18', '3');
INSERT INTO `tb_user_comment` VALUES ('114', '6', '25', '我是第13用户', '否', '2015-06-26 09:39:18', '4');
INSERT INTO `tb_user_comment` VALUES ('115', '0', '25', '我是第14用户', '是', '2015-06-26 09:39:18', '5');
INSERT INTO `tb_user_comment` VALUES ('116', '1', '25', '我是第15用户', '否', '2015-06-26 09:39:18', '1');
INSERT INTO `tb_user_comment` VALUES ('117', '2', '25', '我是第16用户', '是', '2015-06-26 09:39:18', '2');
INSERT INTO `tb_user_comment` VALUES ('118', '3', '25', '我是第17用户', '否', '2015-06-26 09:39:18', '3');
INSERT INTO `tb_user_comment` VALUES ('119', '4', '25', '我是第18用户', '是', '2015-06-26 09:39:18', '4');
INSERT INTO `tb_user_comment` VALUES ('120', '5', '25', '我是第19用户', '否', '2015-06-26 09:39:18', '5');
INSERT INTO `tb_user_comment` VALUES ('121', '6', '25', '我是第20用户', '是', '2015-06-26 09:39:18', '1');
INSERT INTO `tb_user_comment` VALUES ('122', '0', '25', '我是第21用户', '否', '2015-06-26 09:39:18', '2');
INSERT INTO `tb_user_comment` VALUES ('123', '1', '25', '我是第22用户', '是', '2015-06-26 09:39:18', '3');
INSERT INTO `tb_user_comment` VALUES ('124', '2', '25', '我是第23用户', '否', '2015-06-26 09:39:18', '4');
INSERT INTO `tb_user_comment` VALUES ('125', '3', '25', '我是第24用户', '是', '2015-06-26 09:39:19', '5');
INSERT INTO `tb_user_comment` VALUES ('126', '4', '25', '我是第25用户', '否', '2015-06-26 09:39:19', '1');
INSERT INTO `tb_user_comment` VALUES ('127', '5', '25', '我是第26用户', '是', '2015-06-26 09:39:19', '2');
INSERT INTO `tb_user_comment` VALUES ('128', '6', '25', '我是第27用户', '否', '2015-06-26 09:39:19', '3');
INSERT INTO `tb_user_comment` VALUES ('129', '0', '25', '我是第28用户', '是', '2015-06-26 09:39:19', '4');
INSERT INTO `tb_user_comment` VALUES ('130', '1', '25', '我是第29用户', '否', '2015-06-26 09:39:19', '5');
INSERT INTO `tb_user_comment` VALUES ('131', '2', '25', '我是第30用户', '是', '2015-06-26 09:39:19', '1');
INSERT INTO `tb_user_comment` VALUES ('132', '3', '25', '我是第31用户', '否', '2015-06-26 09:39:19', '2');
INSERT INTO `tb_user_comment` VALUES ('133', '4', '25', '我是第32用户', '是', '2015-06-26 09:39:19', '3');
INSERT INTO `tb_user_comment` VALUES ('134', '5', '25', '我是第33用户', '否', '2015-06-26 09:39:19', '4');
INSERT INTO `tb_user_comment` VALUES ('135', '6', '25', '我是第34用户', '是', '2015-06-26 09:39:19', '5');
INSERT INTO `tb_user_comment` VALUES ('136', '0', '25', '我是第35用户', '否', '2015-06-26 09:39:19', '1');
INSERT INTO `tb_user_comment` VALUES ('137', '1', '25', '我是第36用户', '是', '2015-06-26 09:39:19', '2');
INSERT INTO `tb_user_comment` VALUES ('138', '2', '25', '我是第37用户', '否', '2015-06-26 09:39:19', '3');
INSERT INTO `tb_user_comment` VALUES ('139', '3', '25', '我是第38用户', '是', '2015-06-26 09:39:19', '4');
INSERT INTO `tb_user_comment` VALUES ('140', '4', '25', '我是第39用户', '否', '2015-06-26 09:39:19', '5');
INSERT INTO `tb_user_comment` VALUES ('141', '5', '25', '我是第40用户', '是', '2015-06-26 09:39:19', '1');
INSERT INTO `tb_user_comment` VALUES ('142', '6', '25', '我是第41用户', '否', '2015-06-26 09:39:19', '2');
INSERT INTO `tb_user_comment` VALUES ('143', '0', '25', '我是第42用户', '是', '2015-06-26 09:39:19', '3');
INSERT INTO `tb_user_comment` VALUES ('144', '1', '25', '我是第43用户', '否', '2015-06-26 09:39:19', '4');
INSERT INTO `tb_user_comment` VALUES ('145', '2', '25', '我是第44用户', '是', '2015-06-26 09:39:19', '5');
INSERT INTO `tb_user_comment` VALUES ('146', '3', '25', '我是第45用户', '否', '2015-06-26 09:39:19', '1');
INSERT INTO `tb_user_comment` VALUES ('147', '4', '25', '我是第46用户', '是', '2015-06-26 09:39:19', '2');
INSERT INTO `tb_user_comment` VALUES ('148', '5', '25', '我是第47用户', '否', '2015-06-26 09:39:19', '3');
INSERT INTO `tb_user_comment` VALUES ('149', '6', '25', '我是第48用户', '是', '2015-06-26 09:39:20', '4');
INSERT INTO `tb_user_comment` VALUES ('150', '0', '25', '我是第49用户', '否', '2015-06-26 09:39:20', '5');
INSERT INTO `tb_user_comment` VALUES ('151', '1', '25', '我是第50用户', '是', '2015-06-26 09:39:20', '1');
INSERT INTO `tb_user_comment` VALUES ('152', '2', '25', '我是第51用户', '否', '2015-06-26 09:39:20', '2');
INSERT INTO `tb_user_comment` VALUES ('153', '3', '25', '我是第52用户', '是', '2015-06-26 09:39:20', '3');
INSERT INTO `tb_user_comment` VALUES ('154', '4', '25', '我是第53用户', '否', '2015-06-26 09:39:20', '4');
INSERT INTO `tb_user_comment` VALUES ('155', '5', '25', '我是第54用户', '是', '2015-06-26 09:39:20', '5');
INSERT INTO `tb_user_comment` VALUES ('156', '6', '25', '我是第55用户', '否', '2015-06-26 09:39:20', '1');
INSERT INTO `tb_user_comment` VALUES ('157', '0', '25', '我是第56用户', '是', '2015-06-26 09:39:20', '2');
INSERT INTO `tb_user_comment` VALUES ('158', '1', '25', '我是第57用户', '否', '2015-06-26 09:39:20', '3');
INSERT INTO `tb_user_comment` VALUES ('159', '2', '25', '我是第58用户', '是', '2015-06-26 09:39:20', '4');
INSERT INTO `tb_user_comment` VALUES ('160', '3', '25', '我是第59用户', '否', '2015-06-26 09:39:20', '5');
INSERT INTO `tb_user_comment` VALUES ('161', '4', '25', '我是第60用户', '是', '2015-06-26 09:39:20', '1');
INSERT INTO `tb_user_comment` VALUES ('162', '5', '25', '我是第61用户', '否', '2015-06-26 09:39:20', '2');
INSERT INTO `tb_user_comment` VALUES ('163', '6', '25', '我是第62用户', '是', '2015-06-26 09:39:20', '3');
INSERT INTO `tb_user_comment` VALUES ('164', '0', '25', '我是第63用户', '否', '2015-06-26 09:39:20', '4');
INSERT INTO `tb_user_comment` VALUES ('165', '1', '25', '我是第64用户', '是', '2015-06-26 09:39:20', '5');
INSERT INTO `tb_user_comment` VALUES ('166', '2', '25', '我是第65用户', '否', '2015-06-26 09:39:20', '1');
INSERT INTO `tb_user_comment` VALUES ('167', '3', '25', '我是第66用户', '是', '2015-06-26 09:39:20', '2');
INSERT INTO `tb_user_comment` VALUES ('168', '4', '25', '我是第67用户', '否', '2015-06-26 09:39:20', '3');
INSERT INTO `tb_user_comment` VALUES ('169', '5', '25', '我是第68用户', '是', '2015-06-26 09:39:20', '4');
INSERT INTO `tb_user_comment` VALUES ('170', '6', '25', '我是第69用户', '否', '2015-06-26 09:39:20', '5');
INSERT INTO `tb_user_comment` VALUES ('171', '0', '25', '我是第70用户', '是', '2015-06-26 09:39:20', '1');
INSERT INTO `tb_user_comment` VALUES ('172', '1', '25', '我是第71用户', '否', '2015-06-26 09:39:20', '2');
INSERT INTO `tb_user_comment` VALUES ('173', '2', '25', '我是第72用户', '是', '2015-06-26 09:39:21', '3');
INSERT INTO `tb_user_comment` VALUES ('174', '3', '25', '我是第73用户', '否', '2015-06-26 09:39:21', '4');
INSERT INTO `tb_user_comment` VALUES ('175', '4', '25', '我是第74用户', '是', '2015-06-26 09:39:21', '5');
INSERT INTO `tb_user_comment` VALUES ('176', '5', '25', '我是第75用户', '否', '2015-06-26 09:39:21', '1');
INSERT INTO `tb_user_comment` VALUES ('177', '6', '25', '我是第76用户', '是', '2015-06-26 09:39:21', '2');
INSERT INTO `tb_user_comment` VALUES ('178', '0', '25', '我是第77用户', '否', '2015-06-26 09:39:21', '3');
INSERT INTO `tb_user_comment` VALUES ('179', '1', '25', '我是第78用户', '是', '2015-06-26 09:39:21', '4');
INSERT INTO `tb_user_comment` VALUES ('180', '2', '25', '我是第79用户', '否', '2015-06-26 09:39:21', '5');
INSERT INTO `tb_user_comment` VALUES ('181', '3', '25', '我是第80用户', '是', '2015-06-26 09:39:21', '1');
INSERT INTO `tb_user_comment` VALUES ('182', '4', '25', '我是第81用户', '否', '2015-06-26 09:39:21', '2');
INSERT INTO `tb_user_comment` VALUES ('183', '5', '25', '我是第82用户', '是', '2015-06-26 09:39:21', '3');
INSERT INTO `tb_user_comment` VALUES ('184', '6', '25', '我是第83用户', '否', '2015-06-26 09:39:21', '4');
INSERT INTO `tb_user_comment` VALUES ('185', '0', '25', '我是第84用户', '是', '2015-06-26 09:39:21', '5');
INSERT INTO `tb_user_comment` VALUES ('186', '1', '25', '我是第85用户', '否', '2015-06-26 09:39:21', '1');
INSERT INTO `tb_user_comment` VALUES ('187', '2', '25', '我是第86用户', '是', '2015-06-26 09:39:21', '2');
INSERT INTO `tb_user_comment` VALUES ('188', '3', '25', '我是第87用户', '否', '2015-06-26 09:39:21', '3');
INSERT INTO `tb_user_comment` VALUES ('189', '4', '25', '我是第88用户', '是', '2015-06-26 09:39:21', '4');
INSERT INTO `tb_user_comment` VALUES ('190', '5', '25', '我是第89用户', '否', '2015-06-26 09:39:21', '5');
INSERT INTO `tb_user_comment` VALUES ('191', '6', '25', '我是第90用户', '是', '2015-06-26 09:39:21', '1');
INSERT INTO `tb_user_comment` VALUES ('192', '0', '25', '我是第91用户', '否', '2015-06-26 09:39:21', '2');
INSERT INTO `tb_user_comment` VALUES ('193', '1', '25', '我是第92用户', '是', '2015-06-26 09:39:21', '3');
INSERT INTO `tb_user_comment` VALUES ('194', '2', '25', '我是第93用户', '否', '2015-06-26 09:39:21', '4');
INSERT INTO `tb_user_comment` VALUES ('195', '3', '25', '我是第94用户', '是', '2015-06-26 09:39:21', '5');
INSERT INTO `tb_user_comment` VALUES ('196', '4', '25', '我是第95用户', '否', '2015-06-26 09:39:21', '1');
INSERT INTO `tb_user_comment` VALUES ('197', '5', '25', '我是第96用户', '是', '2015-06-26 09:39:22', '2');
INSERT INTO `tb_user_comment` VALUES ('198', '6', '25', '我是第97用户', '否', '2015-06-26 09:39:22', '3');
INSERT INTO `tb_user_comment` VALUES ('199', '0', '25', '我是第98用户', '是', '2015-06-26 09:39:22', '4');
INSERT INTO `tb_user_comment` VALUES ('200', '1', '25', '我是第99用户', '否', '2015-06-26 09:39:22', '5');
