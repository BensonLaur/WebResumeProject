/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50162
Source Host           : localhost:3306
Source Database       : neusoft

Target Server Type    : MYSQL
Target Server Version : 50162
File Encoding         : 65001

Date: 2015-11-12 17:29:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `branch`
-- ----------------------------
DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `id` varchar(50) NOT NULL COMMENT '机构id号',
  `name` varchar(100) DEFAULT NULL COMMENT '机构名称',
  `address` varchar(200) DEFAULT NULL COMMENT '机构地址',
  `is_del` char(1) DEFAULT NULL COMMENT '是否已删除 1删除 0存在',
  `insert_user_id` varchar(50) DEFAULT NULL COMMENT '插入用户ID',
  `insert_date` datetime DEFAULT NULL COMMENT ' 插入时间',
  `last_modify_user_id` varchar(50) DEFAULT NULL COMMENT '最后更新用户ID',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of branch
-- ----------------------------

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cityName` varchar(200) DEFAULT NULL COMMENT '城市名称',
  `parentId` int(11) DEFAULT NULL COMMENT '所属父机构id',
  `cityNo` varchar(20) DEFAULT NULL COMMENT '城市编号',
  `isDel` char(1) DEFAULT '0' COMMENT '是否删除0,正常，1删除',
  `cityType` char(1) DEFAULT 'L' COMMENT '类型：L连连；F富有',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4539 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of city
-- ----------------------------

-- ----------------------------
-- Table structure for `dict`
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict` (
  `code` varchar(20) NOT NULL COMMENT '代码',
  `id` varchar(10) NOT NULL COMMENT 'id',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `desc` varchar(200) DEFAULT NULL COMMENT '描述',
  `isDel` char(1) DEFAULT '0' COMMENT '是否删除  1删除 0正常',
  `num` int(11) DEFAULT NULL COMMENT '顺序号',
  PRIMARY KEY (`code`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES ('age', '1', '20岁以下', '客户年龄', '0', '1');
INSERT INTO `dict` VALUES ('age', '2', '20岁-29岁', '客户年龄', '0', '2');
INSERT INTO `dict` VALUES ('age', '3', '30岁-39岁', '客户年龄', '0', '3');
INSERT INTO `dict` VALUES ('age', '4', '40岁-49岁', '客户年龄', '0', '4');
INSERT INTO `dict` VALUES ('age', '5', '50岁-59岁', '客户年龄', '0', '5');
INSERT INTO `dict` VALUES ('age', '6', '60岁以上(含60岁)', '客户年龄', '0', '6');
INSERT INTO `dict` VALUES ('authState', '0', '未认证', '客户经理认证状态', '0', '1');
INSERT INTO `dict` VALUES ('authState', '1', '待一级审核', '客户经理认证状态', '0', '2');
INSERT INTO `dict` VALUES ('authState', '2', '一级审核不通过', '客户经理认证状态一级审核不通过', '0', '3');
INSERT INTO `dict` VALUES ('authState', '3', '待二级审核', '客户经理认证状态,一级审核通过待二级审核', '0', '4');
INSERT INTO `dict` VALUES ('authState', '4', '二级审核不通过', '客户经理认证状态,二级审核不通过待一级审核', '0', '5');
INSERT INTO `dict` VALUES ('authState', '5', '审核通过', '客户经理认证状态', '0', '6');
INSERT INTO `dict` VALUES ('captchaType', '1', '注册验证码', '验证码类型', '0', '1');
INSERT INTO `dict` VALUES ('captchaType', '2', '取现验证码', '验证码类型', '0', '2');
INSERT INTO `dict` VALUES ('captchaType', '3', '修改登录密码验证码', '验证码类型', '0', '3');
INSERT INTO `dict` VALUES ('captchaType', '4', '找回登录密码验证码', '验证码类型', '0', '4');
INSERT INTO `dict` VALUES ('captchaType', '5', '修改取现密码', '验证码类型', '0', '5');
INSERT INTO `dict` VALUES ('captchaType', '6', '找回取现密码', '验证码类型', '0', '6');
INSERT INTO `dict` VALUES ('captchaType', '7', '献花验证码', '验证码类型', '0', '7');
INSERT INTO `dict` VALUES ('freeTime', '5', '9点-17点', '方便接听电话时间', '1', '1');
INSERT INTO `dict` VALUES ('freeTime', 'A', '9点-11点', '方便接听电话时间', '0', '2');
INSERT INTO `dict` VALUES ('freeTime', 'B', '11点-13点', '方便接听电话时间', '0', '3');
INSERT INTO `dict` VALUES ('freeTime', 'C', '13点-15点', '方便接听电话时间', '0', '4');
INSERT INTO `dict` VALUES ('freeTime', 'D', '15点-17点', '方便接听电话时间', '0', '5');
INSERT INTO `dict` VALUES ('moduleParam', 'account', '账号', '账号', '0', '11');
INSERT INTO `dict` VALUES ('moduleParam', 'checkCode', '验证码', '验证码', '0', '8');
INSERT INTO `dict` VALUES ('moduleParam', 'datetime', '日期', '日期', '0', '3');
INSERT INTO `dict` VALUES ('moduleParam', 'expirtime', ' 到期日', '到期日', '0', '12');
INSERT INTO `dict` VALUES ('moduleParam', 'fans', '粉丝', '粉丝', '0', '4');
INSERT INTO `dict` VALUES ('moduleParam', 'friend', '好友', '好友', '0', '1');
INSERT INTO `dict` VALUES ('moduleParam', 'income', '收益', '收益', '0', '6');
INSERT INTO `dict` VALUES ('moduleParam', 'incomeRate', '收益率，返佣率', '收益率，返佣率', '0', '7');
INSERT INTO `dict` VALUES ('moduleParam', 'phone', '手机号', '手机号', '0', '10');
INSERT INTO `dict` VALUES ('moduleParam', 'product', '产品', '产品', '0', '5');
INSERT INTO `dict` VALUES ('moduleParam', 'sysdate', '系统时间', '系统时间', '0', '9');
INSERT INTO `dict` VALUES ('moduleParam', 'time', '时间', '时间', '0', '2');
INSERT INTO `dict` VALUES ('month', '01', '一月 ', '月份（收支记录月份）', '0', '1');
INSERT INTO `dict` VALUES ('month', '02', '二月', '月份（收支记录月份）', '0', '2');
INSERT INTO `dict` VALUES ('month', '03', '三月', '月份（收支记录月份）', '0', '3');
INSERT INTO `dict` VALUES ('month', '04', '四月', '月份（收支记录月份）', '0', '4');
INSERT INTO `dict` VALUES ('month', '05', '五月', '月份（收支记录月份）', '0', '5');
INSERT INTO `dict` VALUES ('month', '06', '六月', '月份（收支记录月份）', '0', '6');
INSERT INTO `dict` VALUES ('month', '07', '七月', '月份（收支记录月份）', '0', '7');
INSERT INTO `dict` VALUES ('month', '08', '八月', '月份（收支记录月份）', '0', '8');
INSERT INTO `dict` VALUES ('month', '09', '九月', '月份（收支记录月份）', '0', '9');
INSERT INTO `dict` VALUES ('month', '10', '十月', '月份（收支记录月份）', '0', '10');
INSERT INTO `dict` VALUES ('month', '11', '十一月', '月份（收支记录月份）', '0', '11');
INSERT INTO `dict` VALUES ('month', '12', '十二月', '月份（收支记录月份）', '0', '12');
INSERT INTO `dict` VALUES ('payState', '1', '待处理', '提现状态', '0', '1');
INSERT INTO `dict` VALUES ('payState', '2', '提现中', '提现状态', '0', '2');
INSERT INTO `dict` VALUES ('payState', '3', '提现失败', '提现状态', '0', '3');
INSERT INTO `dict` VALUES ('payState', '4', '提现成功', '提现状态', '0', '4');

-- ----------------------------
-- Table structure for `group`
-- ----------------------------
DROP TABLE IF EXISTS `group`;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '权限组id号',
  `name` varchar(100) DEFAULT NULL COMMENT '权限组名称',
  `is_del` char(1) DEFAULT '0' COMMENT '是否删除 1 删除 0存在',
  `insert_user_id` varchar(50) DEFAULT NULL COMMENT '插入用户ID',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `last_modify_user_id` varchar(50) DEFAULT NULL COMMENT '最后更新用户ID',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group
-- ----------------------------
INSERT INTO `group` VALUES ('1', '超级管理员', '0', null, null, null, null);

-- ----------------------------
-- Table structure for `group_item_rel`
-- ----------------------------
DROP TABLE IF EXISTS `group_item_rel`;
CREATE TABLE `group_item_rel` (
  `item_id` varchar(50) NOT NULL COMMENT '菜单项id号',
  `group_id` int(11) NOT NULL COMMENT '权限组id号',
  PRIMARY KEY (`item_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of group_item_rel
-- ----------------------------
INSERT INTO `group_item_rel` VALUES ('I001002', '1');
INSERT INTO `group_item_rel` VALUES ('I001003', '1');
INSERT INTO `group_item_rel` VALUES ('I001004', '1');
INSERT INTO `group_item_rel` VALUES ('I002001', '1');
INSERT INTO `group_item_rel` VALUES ('I002002', '1');
INSERT INTO `group_item_rel` VALUES ('I002003', '1');

-- ----------------------------
-- Table structure for `item`
-- ----------------------------
DROP TABLE IF EXISTS `item`;
CREATE TABLE `item` (
  `id` varchar(50) NOT NULL COMMENT '菜单项id号',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单项名称',
  `url` varchar(200) DEFAULT NULL COMMENT '菜单项链接地址',
  `is_del` char(1) DEFAULT '0' COMMENT '是否删除 1删除 0存在',
  `order_num` int(11) DEFAULT NULL COMMENT '排序号',
  `type` char(1) DEFAULT '1',
  `bean` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of item
-- ----------------------------
INSERT INTO `item` VALUES ('I001001', '开发部管理', 'branch/getAllBranch.action', '1', '1', '1', null);
INSERT INTO `item` VALUES ('I001002', '用户管理', 'user/getAllUser.action', '0', '3', '1', null);
INSERT INTO `item` VALUES ('I001003', '权限组管理', 'group/getAllGroup.action', '0', '2', '1', null);
INSERT INTO `item` VALUES ('I001004', '参数配置', 'param/getAllParameter.action', '0', '4', '1', null);
INSERT INTO `item` VALUES ('I002001', '新增客户', 'manager/insertManagerInit.action', '0', '1', '1', null);
INSERT INTO `item` VALUES ('I002002', '客户管理', 'manager/getAllManagerList.action', '0', '2', '1', null);
INSERT INTO `item` VALUES ('I002003', '客户归属管理', 'cust/getAllCustBelongList.action', '0', '3', '1', null);

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id号',
  `content` varchar(4000) DEFAULT NULL COMMENT '日志内容',
  `operationUserId` varchar(50) DEFAULT 'admin' COMMENT '插入用户ID',
  `operationDate` datetime DEFAULT NULL COMMENT '插入时间',
  `logTypeId` int(11) DEFAULT NULL COMMENT '日志类型id号',
  `operationKey` varchar(200) DEFAULT NULL COMMENT '交易主键',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注(预留，联合主键可使用)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for `log_type`
-- ----------------------------
DROP TABLE IF EXISTS `log_type`;
CREATE TABLE `log_type` (
  `id` int(11) NOT NULL COMMENT '日志类型id号',
  `name` varchar(200) DEFAULT NULL COMMENT '日志类型',
  `description` varchar(4000) DEFAULT NULL COMMENT '日志类型说明',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_type
-- ----------------------------
INSERT INTO `log_type` VALUES ('1', '申请认证', '客户经理认证');
INSERT INTO `log_type` VALUES ('2', '一级审核不通过', '客户经理认证');
INSERT INTO `log_type` VALUES ('3', '一级审核通过', '客户经理认证');
INSERT INTO `log_type` VALUES ('4', '二级审核不通过', '客户经理认证');
INSERT INTO `log_type` VALUES ('5', '二级审核通过', '客户经理认证');
INSERT INTO `log_type` VALUES ('6', '提现申请审核通过', '提现申请审核');
INSERT INTO `log_type` VALUES ('7', '提现申请审核不通过', '提现申请审核');
INSERT INTO `log_type` VALUES ('8', '提现成功', '提现申请审核');
INSERT INTO `log_type` VALUES ('9', '佣金发放成功', '佣金发放成功');

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `managerId` int(50) NOT NULL AUTO_INCREMENT COMMENT '客户id',
  `managerName` varchar(100) DEFAULT NULL COMMENT '客户名称',
  `managerSex` char(1) DEFAULT '0' COMMENT '客户性别0男；1女',
  `managerAge` int(11) DEFAULT '0' COMMENT '客户年龄',
  `managerPwd` varchar(50) DEFAULT NULL COMMENT '客户密码',
  `isDel` char(1) DEFAULT 'F' COMMENT '是否删除T删除；F正常',
  `createTime` datetime DEFAULT NULL COMMENT '创建时间',
  `createUser` varchar(50) DEFAULT NULL COMMENT '创建人',
  `lstModifyTime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `lstModifyUser` varchar(50) DEFAULT NULL COMMENT '最后修改人',
  PRIMARY KEY (`managerId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('1', 'test', '0', '34', '22222222', 'F', '2015-03-02 16:01:24', null, '2015-03-02 16:01:24', null);

-- ----------------------------
-- Table structure for `menu`
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` varchar(50) NOT NULL COMMENT '菜单id号',
  `name` varchar(100) DEFAULT NULL COMMENT '菜单名称',
  `is_del` char(1) DEFAULT '0' COMMENT '是否删除 1 删除 0存在',
  `order_num` int(11) DEFAULT NULL COMMENT '排序号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('M001', '系统管理', '0', '99');
INSERT INTO `menu` VALUES ('M002', '客户管理', '0', '1');

-- ----------------------------
-- Table structure for `menu_item_rel`
-- ----------------------------
DROP TABLE IF EXISTS `menu_item_rel`;
CREATE TABLE `menu_item_rel` (
  `item_id` varchar(50) NOT NULL COMMENT '菜单项id号',
  `menu_id` varchar(50) NOT NULL COMMENT '菜单id号',
  PRIMARY KEY (`item_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_item_rel
-- ----------------------------
INSERT INTO `menu_item_rel` VALUES ('I001001', 'M001');
INSERT INTO `menu_item_rel` VALUES ('I001002', 'M001');
INSERT INTO `menu_item_rel` VALUES ('I001003', 'M001');
INSERT INTO `menu_item_rel` VALUES ('I001004', 'M001');
INSERT INTO `menu_item_rel` VALUES ('I002001', 'M002');
INSERT INTO `menu_item_rel` VALUES ('I002002', 'M002');
INSERT INTO `menu_item_rel` VALUES ('I002003', 'M002');

-- ----------------------------
-- Table structure for `parameter`
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `param_key` varchar(200) NOT NULL COMMENT '参数主键',
  `param_value` varchar(500) DEFAULT NULL COMMENT '参数值',
  `description` varchar(4000) DEFAULT NULL COMMENT '参数说明',
  `is_del` char(1) DEFAULT NULL COMMENT '是否已删除',
  `insert_user_id` varchar(50) DEFAULT NULL COMMENT '插入用户ID',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  PRIMARY KEY (`param_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of parameter
-- ----------------------------
INSERT INTO `parameter` VALUES ('captchaTime', '120', '验证码获取间隔时间（秒）多少秒后可重新获取', '0', null, null);
INSERT INTO `parameter` VALUES ('captchaValidTime', '10', '验证码有效时间（分钟）', '0', null, null);
INSERT INTO `parameter` VALUES ('flowerCount', '50', '开业献花数量', '0', null, null);
INSERT INTO `parameter` VALUES ('giftBagBoss', '50', 'boss返现红包金额', '0', null, null);
INSERT INTO `parameter` VALUES ('giftBagBossFlag', '1', 'boss返现红包开关（0关闭；1开启）', '0', null, null);
INSERT INTO `parameter` VALUES ('giftBagCust', '10000', '客户注册后红包金额', '0', null, null);
INSERT INTO `parameter` VALUES ('giftBagCustFlag', '1', '客户注册后红包开关（0关闭；1开启）', '0', null, null);
INSERT INTO `parameter` VALUES ('hotLink', '2', '公司主推产品的编号（boss提升固定返佣率分享的产品编号）', '0', null, null);
INSERT INTO `parameter` VALUES ('invitationComOnOff', 'on', '邀请开公司开关，on开，off关', '0', null, null);
INSERT INTO `parameter` VALUES ('invitationPacketOnOff', 'on', '邀请领取粉丝福利理财红包开发，on开，off关', '0', null, null);
INSERT INTO `parameter` VALUES ('invitationVisitOnOff', 'on', '邀请朋友参观公司开关，on开，off关', '0', null, null);
INSERT INTO `parameter` VALUES ('jd_counter', '4', '需求技术器', '0', null, null);
INSERT INTO `parameter` VALUES ('passwordErrorCount', '5', '取现密码允许错误次数', '0', null, null);
INSERT INTO `parameter` VALUES ('passwordLockTime', '24', '取现密码错误后锁定时长（小时）', '0', null, null);
INSERT INTO `parameter` VALUES ('presentFlowerCount', '3', '每人献花次数上限', '0', null, null);

-- ----------------------------
-- Table structure for `province`
-- ----------------------------
DROP TABLE IF EXISTS `province`;
CREATE TABLE `province` (
  `id` int(1) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `provinceName` varchar(200) DEFAULT NULL COMMENT '名称',
  `provinceNo` int(11) DEFAULT NULL COMMENT '省份编号',
  `isDel` char(1) DEFAULT '0' COMMENT '是否删除0有效，1删除',
  `provinceType` char(1) DEFAULT 'F' COMMENT '类型：L连连；F富有',
  PRIMARY KEY (`id`),
  KEY `num` (`provinceNo`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of province
-- ----------------------------
INSERT INTO `province` VALUES ('1', '北京市', '110', '0', 'F');
INSERT INTO `province` VALUES ('2', '天津市', '120', '0', 'F');
INSERT INTO `province` VALUES ('3', '上海市   ', '310', '0', 'F');
INSERT INTO `province` VALUES ('4', '重庆市', '500', '0', 'F');
INSERT INTO `province` VALUES ('5', '河北省', '130', '0', 'F');
INSERT INTO `province` VALUES ('6', '山西省', '140', '0', 'F');
INSERT INTO `province` VALUES ('7', '内蒙古', '150', '0', 'F');
INSERT INTO `province` VALUES ('8', '辽宁省', '210', '0', 'F');
INSERT INTO `province` VALUES ('9', '吉林省', '220', '0', 'F');
INSERT INTO `province` VALUES ('10', '黑龙江省', '230', '0', 'F');
INSERT INTO `province` VALUES ('11', '江苏省', '320', '0', 'F');
INSERT INTO `province` VALUES ('12', '浙江省', '330', '0', 'F');
INSERT INTO `province` VALUES ('13', '安徽省', '340', '0', 'F');
INSERT INTO `province` VALUES ('14', '福建省', '350', '0', 'F');
INSERT INTO `province` VALUES ('15', '江西省', '360', '0', 'F');
INSERT INTO `province` VALUES ('16', '山东省', '370', '0', 'F');
INSERT INTO `province` VALUES ('17', '河南省', '410', '0', 'F');
INSERT INTO `province` VALUES ('18', '湖北省', '420', '0', 'F');
INSERT INTO `province` VALUES ('19', '湖南省', '430', '0', 'F');
INSERT INTO `province` VALUES ('20', '广东省', '440', '0', 'F');
INSERT INTO `province` VALUES ('21', '广西壮族自治区', '450', '0', 'F');
INSERT INTO `province` VALUES ('22', '海南省', '460', '0', 'F');
INSERT INTO `province` VALUES ('23', '四川省', '510', '0', 'F');
INSERT INTO `province` VALUES ('24', '贵州省', '520', '0', 'F');
INSERT INTO `province` VALUES ('25', '云南省', '530', '0', 'F');
INSERT INTO `province` VALUES ('26', '西藏自治区', '540', '0', 'F');
INSERT INTO `province` VALUES ('27', '陕西省', '610', '0', 'F');
INSERT INTO `province` VALUES ('28', '甘肃省', '620', '0', 'F');
INSERT INTO `province` VALUES ('29', '青海省', '630', '0', 'F');
INSERT INTO `province` VALUES ('30', '宁夏回族自治区', '640', '0', 'F');
INSERT INTO `province` VALUES ('31', '新疆维吾尔自治区', '650', '0', 'F');
INSERT INTO `province` VALUES ('32', '安徽省', '340000', '0', 'L');
INSERT INTO `province` VALUES ('33', '北京市', '110000', '0', 'L');
INSERT INTO `province` VALUES ('34', '福建省', '350000', '0', 'L');
INSERT INTO `province` VALUES ('35', '甘肃省', '620000', '0', 'L');
INSERT INTO `province` VALUES ('36', '广东省', '440000', '0', 'L');
INSERT INTO `province` VALUES ('37', '广西省', '450000', '0', 'L');
INSERT INTO `province` VALUES ('38', '贵州省', '520000', '0', 'L');
INSERT INTO `province` VALUES ('39', '海南省', '460000', '0', 'L');
INSERT INTO `province` VALUES ('40', '河北省', '130000', '0', 'L');
INSERT INTO `province` VALUES ('41', '河南省', '410000', '0', 'L');
INSERT INTO `province` VALUES ('42', '黑龙江省', '230000', '0', 'L');
INSERT INTO `province` VALUES ('43', '湖北省', '420000', '0', 'L');
INSERT INTO `province` VALUES ('44', '湖南省', '430000', '0', 'L');
INSERT INTO `province` VALUES ('45', '吉林省', '220000', '0', 'L');
INSERT INTO `province` VALUES ('46', '江苏省', '320000', '0', 'L');
INSERT INTO `province` VALUES ('47', '江西省', '360000', '0', 'L');
INSERT INTO `province` VALUES ('48', '辽宁省', '210000', '0', 'L');
INSERT INTO `province` VALUES ('49', '内蒙古', '150000', '0', 'L');
INSERT INTO `province` VALUES ('50', '宁夏', '640000', '0', 'L');
INSERT INTO `province` VALUES ('51', '青海省', '630000', '0', 'L');
INSERT INTO `province` VALUES ('52', '山东省', '370000', '0', 'L');
INSERT INTO `province` VALUES ('53', '山西省', '140000', '0', 'L');
INSERT INTO `province` VALUES ('54', '陕西省', '610000', '0', 'L');
INSERT INTO `province` VALUES ('55', '上海市', '310000', '0', 'L');
INSERT INTO `province` VALUES ('56', '四川省', '510000', '0', 'L');
INSERT INTO `province` VALUES ('57', '天津市', '120000', '0', 'L');
INSERT INTO `province` VALUES ('58', '西藏', '540000', '0', 'L');
INSERT INTO `province` VALUES ('59', '新疆', '650000', '0', 'L');
INSERT INTO `province` VALUES ('60', '云南省', '530000', '0', 'L');
INSERT INTO `province` VALUES ('61', '浙江省', '330000', '0', 'L');
INSERT INTO `province` VALUES ('62', '重庆市', '500000', '0', 'L');

-- ----------------------------
-- Table structure for `systemlog`
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志id号',
  `content` text COMMENT '日志内容',
  `operationDate` datetime DEFAULT NULL COMMENT '插入时间',
  `sessionId` varchar(200) DEFAULT NULL COMMENT 'sessionId',
  `ip` varchar(50) DEFAULT NULL COMMENT '用户ip地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5917 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemlog
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` varchar(50) NOT NULL COMMENT '用户id号',
  `name` varchar(100) DEFAULT NULL COMMENT '用户名称',
  `realName` varchar(100) DEFAULT NULL COMMENT '用户真实姓名',
  `telephone` varchar(50) DEFAULT NULL COMMENT '电话号码',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `branch_Id` varchar(50) DEFAULT NULL COMMENT '机构id号',
  `group_Id` int(11) DEFAULT NULL COMMENT '权限组id号',
  `insert_date` datetime DEFAULT NULL COMMENT '插入时间',
  `insert_user_id` varchar(50) DEFAULT NULL COMMENT '插入用户id',
  `last_modify_user_id` varchar(50) DEFAULT NULL COMMENT '最后更新用户ID',
  `last_modify_date` datetime DEFAULT NULL COMMENT '最后更新时间',
  `is_del` char(1) DEFAULT NULL COMMENT '是否删除  1删除 0存在',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', '管理员', '管理员', '管理员', '0192023a7bbd73250516f069df18b500', null, '1', '2014-11-18 23:54:21', 'zhangsb', null, null, '0');
INSERT INTO `user` VALUES ('jiaji', '贾骥', '贾骥', '18301667889', '781ac1764ee1aac9e908c971839383e0', '', '1', '2014-10-12 20:41:40', 'zhangsb', null, null, '0');
INSERT INTO `user` VALUES ('wanggsh', 'wanggsh', '王国胜', '18510237650', 'b90a82ea0e38ac430df544cba8b0cf33', 'B001', '1', '2014-09-18 01:04:42', 'zhangsb', 'zhangsb', '2014-10-12 18:05:32', '0');
INSERT INTO `user` VALUES ('wangwg', 'wangwg', '王文刚', '13621020136', '0ac8199e82f26073f54ea19e6b0fa28b', 'B001', '1', '2014-09-15 22:08:54', 'zhangsb', 'zhangsb', '2014-10-12 18:06:00', '0');
INSERT INTO `user` VALUES ('yansw', '闫尚文', '闫尚文', '15011439094', 'e6e7f1b78581818a296d2078d51d497b', '', '1', '2014-10-12 20:40:17', 'zhangsb', null, null, '0');
INSERT INTO `user` VALUES ('zhangsb', '张生波', '张生波', '', '36f3760107faccbd30422faaaabda0ba', 'B001', '1', '2013-03-06 23:48:41', 'admin', null, null, '0');
INSERT INTO `user` VALUES ('zhouq', '周强', '周强', '110', '7215ee9c7d9dc229d2921a40e899ec5f', '', '1', '2014-09-16 21:49:57', 'zhangsb', 'zhangsb', '2014-10-12 18:05:40', '0');
INSERT INTO `user` VALUES ('孙永飞', '孙永飞', '孙永飞', '', '96e79218965eb72c92a549dd5a330112', '', '2', '2013-11-26 10:15:09', 'zhangsb', null, null, '0');
INSERT INTO `user` VALUES ('潘秀艳', '111111', '潘秀艳', '', '96e79218965eb72c92a549dd5a330112', 'B003', '3', '2013-11-26 13:34:09', 'zhangsb', 'zhangsb', '2014-10-12 18:06:07', '1');
INSERT INTO `user` VALUES ('赵常', '赵常', '赵常', '13521620418', 'e10adc3949ba59abbe56e057f20f883e', 'B003', '1', '2014-09-22 20:44:04', 'zhangsb', 'zhangsb', '2014-10-12 18:05:52', '0');
