/*
 Navicat Premium Data Transfer

 Source Server         : conn
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : ry-cloud

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 03/11/2022 20:44:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (4, 'ticket_flight_info', '航班信息表', NULL, NULL, 'TicketFlightInfo', 'crud', 'com.ruoyi.ticket', 'ticket', 'flightm', '航班信息', 'gmm', '0', '/', '{\"parentMenuId\":2016}', 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17', NULL);
INSERT INTO `gen_table` VALUES (5, 'ticket_order_info', '订单信息表', NULL, NULL, 'TicketOrderInfo', 'crud', 'com.ruoyi.ticket', 'ticket', 'orderm', '订单信息', 'gmm', '0', '/', '{\"parentMenuId\":2016}', 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52', NULL);
INSERT INTO `gen_table` VALUES (6, 'ticket_payment', '制定航班表', NULL, NULL, 'TicketPayment', 'crud', 'com.ruoyi.ticket', 'ticket', 'payment', '制定航班', 'gmm', '0', '/', '{\"parentMenuId\":\"2016\"}', 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04', NULL);
INSERT INTO `gen_table` VALUES (7, 'ticket_order_record', '订单记录表', NULL, NULL, 'TicketOrderRecord', 'crud', 'com.ruoyi.ticket', 'ticket', 'record', '订单记录', 'gmm', '0', '/', '{\"parentMenuId\":2033}', 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (34, '4', 'id', '主键', 'int', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (35, '4', 'code', '航班编号', 'varchar(255)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (36, '4', 'name', '航班名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (37, '4', 'type', '航班类型', 'char(1)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'ticket_type', 4, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (38, '4', 'start_place', '出发地', 'varchar(255)', 'String', 'startPlace', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (39, '4', 'end_place', '目的地', 'varchar(255)', 'String', 'endPlace', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (40, '4', 'plan_type', '机型', 'char(1)', 'String', 'planType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'plan_type', 7, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (41, '4', 'start_time', '起飞时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (42, '4', 'end_time', '降落时间', 'datetime', 'Date', 'endTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (43, '4', 'common_price', '经济舱票价', 'decimal(10,2)', 'BigDecimal', 'commonPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (44, '4', 'higher_price', '头等舱票价', 'decimal(10,2)', 'BigDecimal', 'higherPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (45, '4', 'common_num', '经济舱总票数', 'int', 'Long', 'commonNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (46, '4', 'higher_num', '头等舱总票数', 'int', 'Long', 'higherNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (47, '4', 'common_surplus', '经济舱剩余票数', 'int', 'Long', 'commonSurplus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (48, '4', 'higher_surplus', '头等舱剩余票数', 'int', 'Long', 'higherSurplus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (49, '4', 'del', '删除状态(默认0删除1)', 'char(1)', 'String', 'del', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (50, '4', 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (51, '4', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (52, '4', 'update_by', '更新者', 'varchar(255)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (53, '4', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (54, '4', 'remark', '备注', 'varchar(3000)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 21, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:28:17');
INSERT INTO `gen_table_column` VALUES (55, '5', 'id', '主键', 'int', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (56, '5', 'code', '订单号', 'varchar(255)', 'String', 'code', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (57, '5', 'name', '航班名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (58, '5', 'routes', '航线', 'varchar(255)', 'String', 'routes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (59, '5', 'start_time', '起飞时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (60, '5', 'buy_time', '订购日期', 'datetime', 'Date', 'buyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (61, '5', 'buy_num', '订购数量', 'int', 'Long', 'buyNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (62, '5', 'price', '票价', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (63, '5', 'all_price', '总价', 'decimal(10,2)', 'BigDecimal', 'allPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (64, '5', 'user_id', '客户id', 'int', 'Long', 'userId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (65, '5', 'del', '删除状态(默认0删除1)', 'char(1)', 'String', 'del', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (66, '5', 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (67, '5', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (68, '5', 'update_by', '更新者', 'varchar(255)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (69, '5', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (70, '5', 'remark', '备注', 'varchar(3000)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 16, 'admin', '2022-09-21 09:34:44', '', '2022-09-21 10:53:52');
INSERT INTO `gen_table_column` VALUES (71, '6', 'id', '主键', 'int', 'Long', 'id', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (72, '6', 'code', '航班编号', 'varchar(255)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (73, '6', 'name', '航班名称', 'varchar(255)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (74, '6', 'type', '航班类型', 'char(1)', 'String', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'ticket_type', 4, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (75, '6', 'start_place', '出发地', 'varchar(255)', 'String', 'startPlace', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (76, '6', 'end_place', '目的地', 'varchar(255)', 'String', 'endPlace', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (77, '6', 'plan_type', '机型', 'char(1)', 'String', 'planType', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'plan_type', 7, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (78, '6', 'start_time', '起飞时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (79, '6', 'end_time', '降落时间', 'datetime', 'Date', 'endTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (80, '6', 'common_price', '经济舱票价', 'decimal(10,2)', 'BigDecimal', 'commonPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (81, '6', 'higher_price', '头等舱票价', 'decimal(10,2)', 'BigDecimal', 'higherPrice', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (82, '6', 'common_num', '经济舱总票数', 'int', 'Long', 'commonNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 12, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (83, '6', 'higher_num', '头等舱总票数', 'int', 'Long', 'higherNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (84, '6', 'common_surplus', '经济舱剩余票数', 'int', 'Long', 'commonSurplus', '0', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (85, '6', 'higher_surplus', '头等舱剩余票数', 'int', 'Long', 'higherSurplus', '0', '0', '1', NULL, '1', '1', '1', 'EQ', 'input', '', 15, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (86, '6', 'del', '删除状态(默认0删除1)', 'char(1)', 'String', 'del', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (87, '6', 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (88, '6', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (89, '6', 'update_by', '更新者', 'varchar(255)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (90, '6', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (91, '6', 'remark', '备注', 'varchar(3000)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 21, 'admin', '2022-10-12 11:48:29', '', '2022-10-12 11:53:04');
INSERT INTO `gen_table_column` VALUES (92, '7', 'id', '主键', 'int', 'Long', 'id', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (93, '7', 'order_type', '记录类型', 'char(1)', 'String', 'orderType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'order_record_type', 2, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (94, '7', 'code', '订单号', 'varchar(255)', 'String', 'code', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (95, '7', 'name', '航班名称', 'varchar(255)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (96, '7', 'routes', '航线', 'varchar(255)', 'String', 'routes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (97, '7', 'start_time', '起飞时间', 'datetime', 'Date', 'startTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (98, '7', 'buy_time', '订购日期', 'datetime', 'Date', 'buyTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 7, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (99, '7', 'buy_num', '订购数量', 'int', 'Long', 'buyNum', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (100, '7', 'seat_level', '舱位等级', 'char(1)', 'String', 'seatLevel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'seat_level', 9, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (101, '7', 'all_price', '总价', 'decimal(10,2)', 'BigDecimal', 'allPrice', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (102, '7', 'user_id', '客户id', 'int', 'Long', 'userId', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (103, '7', 'del', '删除状态', 'char(1)', 'String', 'del', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (104, '7', 'create_by', '创建人', 'varchar(255)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (105, '7', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (106, '7', 'update_by', '更新人', 'varchar(255)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (107, '7', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');
INSERT INTO `gen_table_column` VALUES (108, '7', 'remark', '备注', 'varchar(3000)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 17, 'admin', '2022-10-14 16:18:07', '', '2022-10-14 16:21:51');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-09-20 14:17:53', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-09-20 14:17:53', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-09-20 14:17:53', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2022-09-20 14:17:53', 'admin', '2022-09-20 14:35:46', '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '一级队列', 0, '', '', '', '0', '0', 'admin', '2022-09-20 14:17:53', 'admin', '2022-09-20 22:29:46');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '组', 1, '', '', '', '0', '0', 'admin', '2022-09-20 14:17:53', 'admin', '2022-09-20 22:30:50');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-20 14:17:53', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '管理员', 1, '', '', '', '0', '0', 'admin', '2022-09-20 14:17:53', 'admin', '2022-09-22 20:31:05');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-20 14:17:53', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 103, '0,100,101,103', '客户', 3, '', '', '', '0', '0', 'admin', '2022-09-20 14:17:53', 'admin', '2022-10-14 18:26:33');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-20 14:17:53', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-20 14:17:53', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-20 14:17:53', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2022-09-20 14:17:53', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '国内航班', '0', 'ticket_type', NULL, 'default', 'N', '0', 'admin', '2022-09-21 09:41:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '国际航班', '1', 'ticket_type', NULL, 'default', 'N', '0', 'admin', '2022-09-21 09:41:11', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 0, '波音747-8', '0', 'plan_type', NULL, 'default', 'N', '0', 'admin', '2022-09-21 09:42:35', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 1, '波音747-400', '1', 'plan_type', NULL, 'default', 'N', '0', 'admin', '2022-09-21 09:42:53', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '经济舱', '0', 'seat_level', NULL, 'default', 'N', '0', 'admin', '2022-09-21 18:10:04', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (105, 2, '头等舱', '1', 'seat_level', NULL, 'default', 'N', '0', 'admin', '2022-09-21 18:10:14', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (106, 0, '订票', '0', 'order_record_type', NULL, 'primary', 'N', '0', 'admin', '2022-10-12 10:42:24', 'admin', '2022-10-12 10:44:51', NULL);
INSERT INTO `sys_dict_data` VALUES (107, 1, '改签', '1', 'order_record_type', NULL, 'warning', 'N', '0', 'admin', '2022-10-12 10:42:40', 'admin', '2022-10-12 10:44:56', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 2, '退票', '2', 'order_record_type', NULL, 'danger', 'N', '0', 'admin', '2022-10-12 10:42:50', 'admin', '2022-10-12 10:45:00', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 0, '未付款', '0', 'payment_status', NULL, 'warning', 'N', '0', 'admin', '2022-10-12 10:46:03', 'admin', '2022-10-12 10:46:32', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 1, '已付款', '1', 'payment_status', NULL, 'success', 'N', '0', 'admin', '2022-10-12 10:46:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 0, '正常', '0', 'is_late', NULL, 'primary', 'N', '0', 'admin', '2022-10-12 16:05:40', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 1, '晚点', '1', 'is_late', NULL, 'danger', 'N', '0', 'admin', '2022-10-12 16:05:54', 'admin', '2022-10-12 16:05:59', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '航班类型', 'ticket_type', '0', 'admin', '2022-09-21 09:35:36', '', NULL, '0国内航班1国际航班');
INSERT INTO `sys_dict_type` VALUES (101, '机型', 'plan_type', '0', 'admin', '2022-09-21 09:40:44', '', NULL, '飞机类型');
INSERT INTO `sys_dict_type` VALUES (102, '舱位等级', 'seat_level', '0', 'admin', '2022-09-21 18:09:42', '', NULL, '0经济舱1头等舱');
INSERT INTO `sys_dict_type` VALUES (103, '订单记录类型', 'order_record_type', '0', 'admin', '2022-10-12 10:42:06', '', NULL, '0订票1改签2退票');
INSERT INTO `sys_dict_type` VALUES (104, '付款状态', 'payment_status', '0', 'admin', '2022-10-12 10:45:41', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (105, '是否晚点', 'is_late', '0', 'admin', '2022-10-12 16:05:26', '', NULL, '0正常1晚点');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-09-20 14:17:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 356 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 14:35:28');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-20 14:35:51');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 14:36:03');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-20 14:38:00');
INSERT INTO `sys_logininfor` VALUES (104, '123', '127.0.0.1', '0', '注册成功', '2022-09-20 14:38:16');
INSERT INTO `sys_logininfor` VALUES (105, '123', '127.0.0.1', '0', '登录成功', '2022-09-20 14:38:25');
INSERT INTO `sys_logininfor` VALUES (106, '123', '127.0.0.1', '0', '退出成功', '2022-09-20 14:49:42');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 14:55:47');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-20 14:57:20');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 15:28:01');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-20 15:40:31');
INSERT INTO `sys_logininfor` VALUES (111, '123', '127.0.0.1', '0', '登录成功', '2022-09-20 15:40:38');
INSERT INTO `sys_logininfor` VALUES (112, '123', '127.0.0.1', '0', '退出成功', '2022-09-20 15:40:48');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 15:40:52');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-20 15:43:45');
INSERT INTO `sys_logininfor` VALUES (115, '123', '127.0.0.1', '0', '登录成功', '2022-09-20 15:43:52');
INSERT INTO `sys_logininfor` VALUES (116, '123', '127.0.0.1', '0', '退出成功', '2022-09-20 16:04:06');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 16:17:09');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-20 16:17:39');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 16:18:21');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 16:44:50');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 17:28:51');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 18:10:20');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-20 18:13:31');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 18:13:51');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-20 18:18:08');
INSERT INTO `sys_logininfor` VALUES (126, '123', '127.0.0.1', '0', '登录成功', '2022-09-20 18:18:16');
INSERT INTO `sys_logininfor` VALUES (127, '123', '127.0.0.1', '0', '退出成功', '2022-09-20 21:23:42');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 21:23:47');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-20 22:25:55');
INSERT INTO `sys_logininfor` VALUES (130, '123', '127.0.0.1', '0', '登录成功', '2022-09-20 22:26:08');
INSERT INTO `sys_logininfor` VALUES (131, '123', '127.0.0.1', '0', '退出成功', '2022-09-20 22:27:39');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-20 22:27:45');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-21 09:32:39');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-21 10:10:51');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-21 16:38:12');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-21 21:20:33');
INSERT INTO `sys_logininfor` VALUES (137, 'user1', '127.0.0.1', '1', '用户密码不在指定范围', '2022-09-21 21:20:42');
INSERT INTO `sys_logininfor` VALUES (138, 'user1', '127.0.0.1', '1', '密码输入错误1次', '2022-09-21 21:20:53');
INSERT INTO `sys_logininfor` VALUES (139, 'user1', '127.0.0.1', '1', '密码输入错误2次', '2022-09-21 21:21:28');
INSERT INTO `sys_logininfor` VALUES (140, '123', '127.0.0.1', '1', '登录用户不存在', '2022-09-21 21:22:23');
INSERT INTO `sys_logininfor` VALUES (141, 'user1', '127.0.0.1', '1', '密码输入错误3次', '2022-09-21 21:22:32');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-21 21:22:48');
INSERT INTO `sys_logininfor` VALUES (143, 'user1', '127.0.0.1', '0', '登录成功', '2022-09-21 21:23:05');
INSERT INTO `sys_logininfor` VALUES (144, 'user1', '127.0.0.1', '0', '退出成功', '2022-09-21 21:23:46');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-21 21:23:51');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-21 21:24:47');
INSERT INTO `sys_logininfor` VALUES (147, 'user1', '127.0.0.1', '0', '登录成功', '2022-09-21 21:25:02');
INSERT INTO `sys_logininfor` VALUES (148, 'user1', '127.0.0.1', '0', '退出成功', '2022-09-21 21:27:24');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-21 21:27:41');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-21 21:31:23');
INSERT INTO `sys_logininfor` VALUES (151, 'user1', '127.0.0.1', '0', '登录成功', '2022-09-21 21:31:33');
INSERT INTO `sys_logininfor` VALUES (152, 'user1', '127.0.0.1', '0', '退出成功', '2022-09-21 21:32:34');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-21 21:32:42');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-21 21:35:17');
INSERT INTO `sys_logininfor` VALUES (155, 'user1', '127.0.0.1', '0', '登录成功', '2022-09-21 21:35:26');
INSERT INTO `sys_logininfor` VALUES (156, 'user1', '127.0.0.1', '0', '退出成功', '2022-09-21 21:37:08');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-21 21:37:12');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-21 21:38:30');
INSERT INTO `sys_logininfor` VALUES (159, 'user1', '127.0.0.1', '0', '登录成功', '2022-09-21 21:38:45');
INSERT INTO `sys_logininfor` VALUES (160, 'user1', '127.0.0.1', '0', '退出成功', '2022-09-21 21:42:47');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-21 21:42:51');
INSERT INTO `sys_logininfor` VALUES (162, 'root', '127.0.0.1', '0', '登录成功', '2022-09-22 17:33:38');
INSERT INTO `sys_logininfor` VALUES (163, 'root', '127.0.0.1', '0', '退出成功', '2022-09-22 17:33:48');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 17:33:55');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-22 18:23:58');
INSERT INTO `sys_logininfor` VALUES (166, 'user1', '127.0.0.1', '0', '登录成功', '2022-09-22 18:24:07');
INSERT INTO `sys_logininfor` VALUES (167, 'user1', '127.0.0.1', '0', '退出成功', '2022-09-22 18:55:08');
INSERT INTO `sys_logininfor` VALUES (168, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 18:55:13');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-22 19:03:40');
INSERT INTO `sys_logininfor` VALUES (170, 'user1', '127.0.0.1', '0', '登录成功', '2022-09-22 19:03:53');
INSERT INTO `sys_logininfor` VALUES (171, 'user1', '127.0.0.1', '0', '退出成功', '2022-09-22 19:42:07');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 19:42:16');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-22 19:44:25');
INSERT INTO `sys_logininfor` VALUES (174, 'user2', '127.0.0.1', '0', '登录成功', '2022-09-22 19:44:34');
INSERT INTO `sys_logininfor` VALUES (175, 'user2', '127.0.0.1', '0', '退出成功', '2022-09-22 19:44:50');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 19:45:26');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-22 19:49:21');
INSERT INTO `sys_logininfor` VALUES (178, 'root', '127.0.0.1', '0', '登录成功', '2022-09-22 19:49:29');
INSERT INTO `sys_logininfor` VALUES (179, 'root', '127.0.0.1', '0', '退出成功', '2022-09-22 19:51:01');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 19:51:06');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-22 19:51:29');
INSERT INTO `sys_logininfor` VALUES (182, 'root', '127.0.0.1', '0', '登录成功', '2022-09-22 19:51:40');
INSERT INTO `sys_logininfor` VALUES (183, 'root', '127.0.0.1', '0', '退出成功', '2022-09-22 19:54:26');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 19:54:30');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-22 19:55:48');
INSERT INTO `sys_logininfor` VALUES (186, 'root', '127.0.0.1', '0', '登录成功', '2022-09-22 19:55:57');
INSERT INTO `sys_logininfor` VALUES (187, 'root', '127.0.0.1', '0', '退出成功', '2022-09-22 19:56:13');
INSERT INTO `sys_logininfor` VALUES (188, 'user3', '127.0.0.1', '0', '注册成功', '2022-09-22 20:29:14');
INSERT INTO `sys_logininfor` VALUES (189, 'user3', '127.0.0.1', '0', '登录成功', '2022-09-22 20:29:24');
INSERT INTO `sys_logininfor` VALUES (190, 'user3', '127.0.0.1', '0', '退出成功', '2022-09-22 20:30:45');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 20:30:49');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-22 20:31:57');
INSERT INTO `sys_logininfor` VALUES (193, 'root', '127.0.0.1', '0', '登录成功', '2022-09-22 20:32:04');
INSERT INTO `sys_logininfor` VALUES (194, 'root', '127.0.0.1', '0', '退出成功', '2022-09-22 20:33:25');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 20:33:29');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-22 20:35:44');
INSERT INTO `sys_logininfor` VALUES (197, 'root', '127.0.0.1', '0', '登录成功', '2022-09-22 20:35:53');
INSERT INTO `sys_logininfor` VALUES (198, 'root', '127.0.0.1', '0', '退出成功', '2022-09-22 20:36:07');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 20:36:11');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-22 20:36:46');
INSERT INTO `sys_logininfor` VALUES (201, 'user1', '127.0.0.1', '0', '登录成功', '2022-09-22 20:37:02');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 21:03:31');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-22 22:41:23');
INSERT INTO `sys_logininfor` VALUES (204, 'user4', '127.0.0.1', '0', '登录成功', '2022-09-23 10:37:56');
INSERT INTO `sys_logininfor` VALUES (205, 'user4', '127.0.0.1', '0', '退出成功', '2022-09-23 10:40:01');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-23 10:40:05');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-23 11:29:07');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-23 15:22:58');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-23 20:11:14');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-23 20:11:57');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-23 20:15:31');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-23 20:19:34');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-23 20:24:58');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-23 20:41:10');
INSERT INTO `sys_logininfor` VALUES (215, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-23 21:02:42');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-23 21:03:52');
INSERT INTO `sys_logininfor` VALUES (217, 'root', '127.0.0.1', '0', '登录成功', '2022-09-23 21:04:03');
INSERT INTO `sys_logininfor` VALUES (218, 'root', '127.0.0.1', '0', '退出成功', '2022-09-23 21:05:15');
INSERT INTO `sys_logininfor` VALUES (219, 'user1', '127.0.0.1', '0', '登录成功', '2022-09-23 21:05:24');
INSERT INTO `sys_logininfor` VALUES (220, 'user1', '127.0.0.1', '0', '退出成功', '2022-09-23 21:07:46');
INSERT INTO `sys_logininfor` VALUES (221, 'user2', '127.0.0.1', '0', '登录成功', '2022-09-23 21:07:57');
INSERT INTO `sys_logininfor` VALUES (222, 'user2', '127.0.0.1', '0', '退出成功', '2022-09-23 21:12:27');
INSERT INTO `sys_logininfor` VALUES (223, 'user5', '127.0.0.1', '0', '注册成功', '2022-09-23 21:13:24');
INSERT INTO `sys_logininfor` VALUES (224, 'user5', '127.0.0.1', '0', '登录成功', '2022-09-23 21:13:36');
INSERT INTO `sys_logininfor` VALUES (225, 'user5', '127.0.0.1', '0', '退出成功', '2022-09-23 21:15:19');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-23 21:20:56');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-23 21:25:54');
INSERT INTO `sys_logininfor` VALUES (228, 'root', '127.0.0.1', '0', '登录成功', '2022-09-23 21:26:07');
INSERT INTO `sys_logininfor` VALUES (229, 'root', '127.0.0.1', '0', '退出成功', '2022-09-23 21:27:43');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-23 21:27:51');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-23 21:30:59');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-26 16:11:31');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-26 16:14:22');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-26 16:15:26');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-26 16:15:35');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-26 16:15:55');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-26 16:16:39');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-26 16:39:20');
INSERT INTO `sys_logininfor` VALUES (239, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-26 19:21:54');
INSERT INTO `sys_logininfor` VALUES (240, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-26 19:34:58');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-26 19:36:04');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-26 19:41:06');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-26 19:52:41');
INSERT INTO `sys_logininfor` VALUES (244, 'user1', '127.0.0.1', '0', '登录成功', '2022-09-26 19:52:48');
INSERT INTO `sys_logininfor` VALUES (245, 'user1', '127.0.0.1', '0', '退出成功', '2022-09-26 19:53:20');
INSERT INTO `sys_logininfor` VALUES (246, 'root', '127.0.0.1', '0', '登录成功', '2022-09-26 19:53:29');
INSERT INTO `sys_logininfor` VALUES (247, 'root', '127.0.0.1', '0', '退出成功', '2022-09-26 19:54:57');
INSERT INTO `sys_logininfor` VALUES (248, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-27 09:03:22');
INSERT INTO `sys_logininfor` VALUES (249, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-27 10:22:15');
INSERT INTO `sys_logininfor` VALUES (250, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-27 10:40:17');
INSERT INTO `sys_logininfor` VALUES (251, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-27 10:40:23');
INSERT INTO `sys_logininfor` VALUES (252, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-30 10:11:42');
INSERT INTO `sys_logininfor` VALUES (253, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-30 10:14:57');
INSERT INTO `sys_logininfor` VALUES (254, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-30 16:17:16');
INSERT INTO `sys_logininfor` VALUES (255, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-10 08:35:47');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-10 08:42:34');
INSERT INTO `sys_logininfor` VALUES (257, 'root', '127.0.0.1', '0', '登录成功', '2022-10-10 08:42:40');
INSERT INTO `sys_logininfor` VALUES (258, 'root', '127.0.0.1', '0', '退出成功', '2022-10-10 08:45:41');
INSERT INTO `sys_logininfor` VALUES (259, 'root', '127.0.0.1', '0', '登录成功', '2022-10-10 08:46:36');
INSERT INTO `sys_logininfor` VALUES (260, 'root', '127.0.0.1', '0', '退出成功', '2022-10-10 10:33:40');
INSERT INTO `sys_logininfor` VALUES (261, 'root', '127.0.0.1', '0', '登录成功', '2022-10-10 10:35:11');
INSERT INTO `sys_logininfor` VALUES (262, 'root', '127.0.0.1', '0', '退出成功', '2022-10-10 10:48:55');
INSERT INTO `sys_logininfor` VALUES (263, 'user1', '127.0.0.1', '0', '登录成功', '2022-10-10 10:49:07');
INSERT INTO `sys_logininfor` VALUES (264, 'user1', '127.0.0.1', '0', '退出成功', '2022-10-10 10:52:59');
INSERT INTO `sys_logininfor` VALUES (265, 'user2', '127.0.0.1', '0', '登录成功', '2022-10-10 10:53:07');
INSERT INTO `sys_logininfor` VALUES (266, 'user2', '127.0.0.1', '0', '退出成功', '2022-10-10 10:53:23');
INSERT INTO `sys_logininfor` VALUES (267, 'root', '127.0.0.1', '0', '登录成功', '2022-10-10 10:53:26');
INSERT INTO `sys_logininfor` VALUES (268, 'root', '127.0.0.1', '0', '登录成功', '2022-10-10 11:35:47');
INSERT INTO `sys_logininfor` VALUES (269, 'root', '127.0.0.1', '0', '退出成功', '2022-10-10 11:36:05');
INSERT INTO `sys_logininfor` VALUES (270, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 10:24:25');
INSERT INTO `sys_logininfor` VALUES (271, 'root', '127.0.0.1', '0', '退出成功', '2022-10-11 10:26:21');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-11 10:26:30');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-11 10:31:10');
INSERT INTO `sys_logininfor` VALUES (274, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 10:31:23');
INSERT INTO `sys_logininfor` VALUES (275, 'root', '127.0.0.1', '0', '退出成功', '2022-10-11 10:48:55');
INSERT INTO `sys_logininfor` VALUES (276, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 11:39:26');
INSERT INTO `sys_logininfor` VALUES (277, 'user1', '127.0.0.1', '0', '登录成功', '2022-10-11 11:39:48');
INSERT INTO `sys_logininfor` VALUES (278, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 13:52:38');
INSERT INTO `sys_logininfor` VALUES (279, 'user1', '127.0.0.1', '1', '密码输入错误1次', '2022-10-11 13:53:02');
INSERT INTO `sys_logininfor` VALUES (280, 'user1', '127.0.0.1', '0', '登录成功', '2022-10-11 13:53:08');
INSERT INTO `sys_logininfor` VALUES (281, 'user1', '127.0.0.1', '0', '退出成功', '2022-10-11 13:55:37');
INSERT INTO `sys_logininfor` VALUES (282, 'user1', '127.0.0.1', '1', '用户已停用，请联系管理员', '2022-10-11 13:55:43');
INSERT INTO `sys_logininfor` VALUES (283, 'user1', '127.0.0.1', '0', '登录成功', '2022-10-11 13:55:53');
INSERT INTO `sys_logininfor` VALUES (284, 'root', '127.0.0.1', '0', '退出成功', '2022-10-11 14:15:19');
INSERT INTO `sys_logininfor` VALUES (285, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-11 14:15:29');
INSERT INTO `sys_logininfor` VALUES (286, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-11 14:16:58');
INSERT INTO `sys_logininfor` VALUES (287, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 14:17:02');
INSERT INTO `sys_logininfor` VALUES (288, 'root', '127.0.0.1', '0', '退出成功', '2022-10-11 14:18:30');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-11 14:18:44');
INSERT INTO `sys_logininfor` VALUES (290, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-11 14:20:11');
INSERT INTO `sys_logininfor` VALUES (291, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 14:20:16');
INSERT INTO `sys_logininfor` VALUES (292, 'root', '127.0.0.1', '0', '退出成功', '2022-10-11 14:35:13');
INSERT INTO `sys_logininfor` VALUES (293, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 14:45:06');
INSERT INTO `sys_logininfor` VALUES (294, 'root', '127.0.0.1', '0', '退出成功', '2022-10-11 14:45:30');
INSERT INTO `sys_logininfor` VALUES (295, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 14:45:39');
INSERT INTO `sys_logininfor` VALUES (296, 'root', '127.0.0.1', '0', '退出成功', '2022-10-11 14:45:49');
INSERT INTO `sys_logininfor` VALUES (297, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 14:45:57');
INSERT INTO `sys_logininfor` VALUES (298, 'root', '127.0.0.1', '0', '退出成功', '2022-10-11 14:52:44');
INSERT INTO `sys_logininfor` VALUES (299, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 14:57:02');
INSERT INTO `sys_logininfor` VALUES (300, 'root', '127.0.0.1', '0', '退出成功', '2022-10-11 15:11:03');
INSERT INTO `sys_logininfor` VALUES (301, 'root', '127.0.0.1', '0', '登录成功', '2022-10-11 15:11:20');
INSERT INTO `sys_logininfor` VALUES (302, 'root', '127.0.0.1', '0', '退出成功', '2022-10-11 15:52:56');
INSERT INTO `sys_logininfor` VALUES (303, 'root', '127.0.0.1', '0', '登录成功', '2022-10-12 10:32:41');
INSERT INTO `sys_logininfor` VALUES (304, 'root', '127.0.0.1', '0', '退出成功', '2022-10-12 10:32:49');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-12 10:32:59');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-13 14:21:28');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-13 17:14:26');
INSERT INTO `sys_logininfor` VALUES (308, 'root', '127.0.0.1', '0', '登录成功', '2022-10-13 17:14:36');
INSERT INTO `sys_logininfor` VALUES (309, 'root', '127.0.0.1', '0', '退出成功', '2022-10-13 17:15:20');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-13 17:15:37');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-14 14:28:55');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-14 18:22:12');
INSERT INTO `sys_logininfor` VALUES (313, 'root', '127.0.0.1', '0', '登录成功', '2022-10-14 18:22:25');
INSERT INTO `sys_logininfor` VALUES (314, 'root', '127.0.0.1', '0', '退出成功', '2022-10-14 18:24:02');
INSERT INTO `sys_logininfor` VALUES (315, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-14 18:24:05');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-14 18:25:36');
INSERT INTO `sys_logininfor` VALUES (317, 'root', '127.0.0.1', '0', '登录成功', '2022-10-14 18:25:46');
INSERT INTO `sys_logininfor` VALUES (318, 'root', '127.0.0.1', '0', '退出成功', '2022-10-14 18:26:07');
INSERT INTO `sys_logininfor` VALUES (319, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-14 18:26:15');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-14 18:27:02');
INSERT INTO `sys_logininfor` VALUES (321, 'root', '127.0.0.1', '0', '登录成功', '2022-10-14 18:27:10');
INSERT INTO `sys_logininfor` VALUES (322, 'root', '127.0.0.1', '0', '退出成功', '2022-10-14 18:28:11');
INSERT INTO `sys_logininfor` VALUES (323, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-14 18:28:16');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-14 18:28:22');
INSERT INTO `sys_logininfor` VALUES (325, 'user1', '127.0.0.1', '0', '登录成功', '2022-10-14 18:28:33');
INSERT INTO `sys_logininfor` VALUES (326, 'user1', '127.0.0.1', '0', '退出成功', '2022-10-14 18:29:10');
INSERT INTO `sys_logininfor` VALUES (327, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-14 18:29:13');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-14 18:32:40');
INSERT INTO `sys_logininfor` VALUES (329, 'user1', '127.0.0.1', '0', '登录成功', '2022-10-14 18:32:48');
INSERT INTO `sys_logininfor` VALUES (330, 'user1', '127.0.0.1', '0', '退出成功', '2022-10-14 18:33:15');
INSERT INTO `sys_logininfor` VALUES (331, 'root', '127.0.0.1', '0', '登录成功', '2022-10-14 18:33:26');
INSERT INTO `sys_logininfor` VALUES (332, 'root', '127.0.0.1', '0', '退出成功', '2022-10-14 18:34:38');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-14 18:34:42');
INSERT INTO `sys_logininfor` VALUES (334, 'admin', '127.0.0.1', '0', '退出成功', '2022-10-14 18:36:52');
INSERT INTO `sys_logininfor` VALUES (335, 'user1', '127.0.0.1', '0', '登录成功', '2022-10-14 18:37:01');
INSERT INTO `sys_logininfor` VALUES (336, 'user1', '127.0.0.1', '0', '退出成功', '2022-10-14 18:37:56');
INSERT INTO `sys_logininfor` VALUES (337, 'root', '127.0.0.1', '0', '登录成功', '2022-10-14 18:38:04');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-15 19:51:12');
INSERT INTO `sys_logininfor` VALUES (339, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-16 10:21:50');
INSERT INTO `sys_logininfor` VALUES (340, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-16 15:25:34');
INSERT INTO `sys_logininfor` VALUES (341, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-18 18:06:09');
INSERT INTO `sys_logininfor` VALUES (342, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-29 15:35:17');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '0', '登录成功', '2022-10-31 17:41:41');
INSERT INTO `sys_logininfor` VALUES (344, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-01 10:33:02');
INSERT INTO `sys_logininfor` VALUES (345, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-01 10:33:56');
INSERT INTO `sys_logininfor` VALUES (346, 'root', '127.0.0.1', '0', '登录成功', '2022-11-01 10:34:07');
INSERT INTO `sys_logininfor` VALUES (347, 'root', '127.0.0.1', '0', '退出成功', '2022-11-01 10:38:20');
INSERT INTO `sys_logininfor` VALUES (348, 'root', '127.0.0.1', '0', '退出成功', '2022-11-01 10:38:41');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-01 10:38:45');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '0', '退出成功', '2022-11-01 10:39:19');
INSERT INTO `sys_logininfor` VALUES (351, 'root', '127.0.0.1', '0', '登录成功', '2022-11-01 10:39:28');
INSERT INTO `sys_logininfor` VALUES (352, 'root', '127.0.0.1', '0', '退出成功', '2022-11-01 10:41:42');
INSERT INTO `sys_logininfor` VALUES (353, 'user2', '127.0.0.1', '0', '登录成功', '2022-11-01 10:41:53');
INSERT INTO `sys_logininfor` VALUES (354, 'admin', '127.0.0.1', '0', '登录成功', '2022-11-01 10:51:31');
INSERT INTO `sys_logininfor` VALUES (355, 'user1', '127.0.0.1', '0', '登录成功', '2022-11-02 08:35:31');
INSERT INTO `sys_logininfor` VALUES (356, 'root', '127.0.0.1', '0', '登录成功', '2022-11-02 08:35:45');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2037 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 11, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-09-20 14:17:53', 'admin', '2022-09-20 21:24:24', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 13, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-09-20 14:17:53', 'admin', '2022-09-20 21:24:35', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 12, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-09-20 14:17:53', 'admin', '2022-09-20 21:24:29', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-09-20 14:17:53', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-09-20 14:17:53', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-09-20 14:17:53', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-09-20 14:17:53', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-09-20 14:17:53', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-09-20 14:17:53', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-09-20 14:17:53', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-09-20 14:17:53', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-09-20 14:17:53', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-09-20 14:17:53', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-09-20 14:17:53', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 3, 'http://localhost:8718', '', '', 0, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2022-09-20 14:17:53', '', NULL, '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 4, 'http://localhost:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2022-09-20 14:17:53', '', NULL, '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'http://localhost:9100/login', '', '', 0, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-09-20 14:17:53', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-09-20 14:17:53', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-09-20 14:17:53', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (116, '系统接口', 3, 3, 'http://localhost:8080/swagger-ui/index.html', '', '', 0, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-09-20 14:17:53', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2022-09-20 14:17:53', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2022-09-20 14:17:53', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:unlock', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '航班信息', 2016, 2, 'flightm', 'ticket/flightm/index', NULL, 1, 0, 'C', '0', '0', 'ticket:flightm:list', 'build', '123', '2022-09-20 21:21:57', 'admin', '2022-10-12 11:45:30', '');
INSERT INTO `sys_menu` VALUES (2001, '客户管理', 2016, 3, 'custom', 'ticket/custom/index', NULL, 1, 0, 'C', '0', '0', 'system:user:list', 'peoples', 'admin', '2022-09-20 21:30:06', 'admin', '2022-10-12 11:45:26', '');
INSERT INTO `sys_menu` VALUES (2003, '订单管理', 2016, 4, 'orderm', 'ticket/orderm/index', NULL, 1, 0, 'C', '0', '0', 'ticket:orderm:list', 'documentation', 'admin', '2022-09-20 21:34:30', 'admin', '2022-10-12 11:45:22', '');
INSERT INTO `sys_menu` VALUES (2004, '航班新增', 2000, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:flightm:add', '#', 'admin', '2022-09-20 22:41:09', 'admin', '2022-09-21 21:34:34', '');
INSERT INTO `sys_menu` VALUES (2005, '航班查询', 2000, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:flightm:query', '#', 'admin', '2022-09-20 22:41:23', 'admin', '2022-09-21 21:34:10', '');
INSERT INTO `sys_menu` VALUES (2006, '航班删除', 2000, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:flightm:remove', '#', 'admin', '2022-09-20 22:41:36', 'admin', '2022-09-21 21:33:52', '');
INSERT INTO `sys_menu` VALUES (2007, '航班修改', 2000, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:flightm:edit', '#', 'admin', '2022-09-20 22:41:58', 'admin', '2022-09-21 21:34:17', '');
INSERT INTO `sys_menu` VALUES (2012, '订单新增', 2003, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:orderm:add', '#', 'admin', '2022-09-20 22:43:43', 'admin', '2022-09-21 21:37:50', '');
INSERT INTO `sys_menu` VALUES (2013, '订单查询', 2003, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:orderm:query', '#', 'admin', '2022-09-20 22:44:34', 'admin', '2022-09-21 21:38:03', '');
INSERT INTO `sys_menu` VALUES (2014, '订单修改', 2003, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:orderm:edit', '#', 'admin', '2022-09-20 22:44:48', 'admin', '2022-09-21 21:38:12', '');
INSERT INTO `sys_menu` VALUES (2015, '订单删除', 2003, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:orderm:remove', '#', 'admin', '2022-09-20 22:45:01', 'admin', '2022-09-21 21:38:21', '');
INSERT INTO `sys_menu` VALUES (2016, '系统目录', 0, 1, 'ticket', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'example', 'admin', '2022-09-21 10:27:21', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '客户增加', 2001, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-09-21 17:58:10', 'admin', '2022-09-21 17:58:22', '');
INSERT INTO `sys_menu` VALUES (2018, '客户查询', 2001, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-09-21 17:58:34', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '客户修改', 2001, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-09-21 17:58:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2020, '客户删除', 2001, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-09-21 17:59:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, '重置密码', 2001, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-09-21 17:59:29', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, '订票', 2000, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:flightm:buy', '#', 'admin', '2022-09-21 18:02:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, '退票', 2003, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:orderm:refund', '#', 'admin', '2022-09-22 17:37:09', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '付款', 2003, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:orderm:pay', '#', 'admin', '2022-10-12 11:07:15', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2026, '制定航班', 2016, 1, 'payment', 'ticket/payment/index', NULL, 1, 0, 'C', '0', '0', 'ticket:payment:list', 'edit', 'admin', '2022-10-12 11:46:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '制定添加', 2026, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:payment:add', '#', 'admin', '2022-10-12 15:43:01', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '制定修改', 2026, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:payment:edit', '#', 'admin', '2022-10-12 15:43:14', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '制定查询', 2026, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:payment:query', '#', 'admin', '2022-10-12 15:43:27', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '制定删除', 2026, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:payment:remove', '#', 'admin', '2022-10-12 15:43:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '安排航班', 2026, 5, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:payment:arrange', '#', 'admin', '2022-10-12 15:44:26', 'admin', '2022-10-12 15:44:35', '');
INSERT INTO `sys_menu` VALUES (2032, '改签', 2003, 7, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:orderm:change', '#', 'admin', '2022-10-14 14:39:03', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '订单记录', 2016, 5, 'record', 'ticket/record/index', NULL, 1, 0, 'C', '0', '0', 'ticket:record:list', 'education', 'admin', '2022-10-14 16:12:53', 'admin', '2022-10-14 16:13:04', '');
INSERT INTO `sys_menu` VALUES (2034, '记录新增', 2033, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:record:add', '#', 'admin', '2022-10-14 16:13:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '记录修改', 2033, 2, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:record:edit', '#', 'admin', '2022-10-14 16:13:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '记录查询', 2033, 3, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:record:query', '#', 'admin', '2022-10-14 16:14:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '记录删除', 2033, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'ticket:record:remove', '#', 'admin', '2022-10-14 16:14:16', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-09-20 14:17:53', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-09-20 14:17:53', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 436 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '参数管理', 2, 'com.ruoyi.system.controller.SysConfigController.edit()', 'PUT', 1, 'admin', NULL, '/config', '127.0.0.1', '', '{\"configId\":4,\"configKey\":\"sys.account.registerUser\",\"configName\":\"账号自助-是否开启用户注册功能\",\"configType\":\"Y\",\"configValue\":\"true\",\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"params\":{},\"remark\":\"是否开启注册用户功能（true开启，false关闭）\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 14:35:46');
INSERT INTO `sys_oper_log` VALUES (101, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"文件服务异常，请联系管理员\",\"code\":500}', 0, NULL, '2022-09-20 16:48:22');
INSERT INTO `sys_oper_log` VALUES (102, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2022/09/20/blob_20220920164943A001.jpeg\",\"code\":200}', 0, NULL, '2022-09-20 16:49:43');
INSERT INTO `sys_oper_log` VALUES (103, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2022/09/20/blob_20220920165736A002.jpeg\",\"code\":200}', 0, NULL, '2022-09-20 16:57:36');
INSERT INTO `sys_oper_log` VALUES (104, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@163.com\",\"loginDate\":\"2022-09-20 14:17:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 16:57:39');
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"test\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 17:29:13');
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 2, 'com.ruoyi.gen.controller.GenController.synchDb()', 'GET', 1, 'admin', NULL, '/gen/synchDb/test', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 17:39:30');
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 17:46:20');
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"test\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 17:46:27');
INSERT INTO `sys_oper_log` VALUES (109, '用户头像', 2, 'com.ruoyi.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', NULL, '/user/profile/avatar', '127.0.0.1', '', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"http://127.0.0.1:9300/statics/2022/09/20/blob_20220920181635A001.jpeg\",\"code\":200}', 0, NULL, '2022-09-20 18:16:35');
INSERT INTO `sys_oper_log` VALUES (110, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":true,\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"ry@163.com\",\"loginDate\":\"2022-09-20 14:17:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15888888888\",\"remark\":\"管理员\",\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":\"1\",\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 18:16:38');
INSERT INTO `sys_oper_log` VALUES (111, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, '123', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"flightm/flightm/index\",\"createBy\":\"123\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"flightm\",\"perms\":\"flightm:flightmlist\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:21:57');
INSERT INTO `sys_oper_log` VALUES (112, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 14:17:53\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:24:03');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 14:17:53\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:24:10');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 14:17:53\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":7,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:24:18');
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 14:17:53\",\"icon\":\"system\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1,\"menuName\":\"系统管理\",\"menuType\":\"M\",\"orderNum\":11,\"params\":{},\"parentId\":0,\"path\":\"system\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:24:24');
INSERT INTO `sys_oper_log` VALUES (116, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 14:17:53\",\"icon\":\"tool\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":3,\"menuName\":\"系统工具\",\"menuType\":\"M\",\"orderNum\":12,\"params\":{},\"parentId\":0,\"path\":\"tool\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:24:30');
INSERT INTO `sys_oper_log` VALUES (117, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 14:17:53\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":13,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:24:35');
INSERT INTO `sys_oper_log` VALUES (118, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"flightm/flight/index\",\"createTime\":\"2022-09-20 21:21:57\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"航班信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"flightm\",\"perms\":\"flightm:flight:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:25:10');
INSERT INTO `sys_oper_log` VALUES (119, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"flightm/flight/index\",\"createTime\":\"2022-09-20 21:21:57\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"航班信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"flightm\",\"perms\":\"flightm:flight:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:25:34');
INSERT INTO `sys_oper_log` VALUES (120, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"custom/custom/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"custom\",\"perms\":\"custom:custom:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:30:06');
INSERT INTO `sys_oper_log` VALUES (121, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"custom/custom/index\",\"createTime\":\"2022-09-20 21:30:06\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"custom\",\"perms\":\"custom:custom:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:30:26');
INSERT INTO `sys_oper_log` VALUES (122, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"routesm/routes/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航线管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"routes\",\"perms\":\"routesm:routes:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:32:40');
INSERT INTO `sys_oper_log` VALUES (123, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"routesm/routes/index\",\"createTime\":\"2022-09-20 21:32:40\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"航线管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"routes\",\"perms\":\"routesm:routes:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:32:52');
INSERT INTO `sys_oper_log` VALUES (124, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"routesm/routes/index\",\"createTime\":\"2022-09-20 21:32:40\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2002,\"menuName\":\"航线管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"routes\",\"perms\":\"routesm:routes:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:33:23');
INSERT INTO `sys_oper_log` VALUES (125, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"custom/custom/index\",\"createTime\":\"2022-09-20 21:30:06\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"custom\",\"perms\":\"custom:custom:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:33:30');
INSERT INTO `sys_oper_log` VALUES (126, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"orderm/order/index\",\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"orderm:order:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:34:30');
INSERT INTO `sys_oper_log` VALUES (127, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"orderm/order/index\",\"createTime\":\"2022-09-20 21:34:30\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"order\",\"perms\":\"orderm:order:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 21:34:38');
INSERT INTO `sys_oper_log` VALUES (128, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"sys_user\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:04:21');
INSERT INTO `sys_oper_log` VALUES (129, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"custom/custom/index\",\"createTime\":\"2022-09-20 21:30:06\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"custom\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:17:33');
INSERT INTO `sys_oper_log` VALUES (130, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,114,115,1055,1056,1058,1057,1059,1060,116,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通客户\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:21:14');
INSERT INTO `sys_oper_log` VALUES (131, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045,3,114,115,1055,1056,1058,1057,1059,1060,116,2,109,1046,1047,1048,110,1049,1050,1051,1052,1053,1054,111,112,113],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:21:36');
INSERT INTO `sys_oper_log` VALUES (132, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"deptId\":101,\"deptName\":\"客户\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:28:16');
INSERT INTO `sys_oper_log` VALUES (133, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/104', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:28:59');
INSERT INTO `sys_oper_log` VALUES (134, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/107', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:29:02');
INSERT INTO `sys_oper_log` VALUES (135, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/106', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:29:04');
INSERT INTO `sys_oper_log` VALUES (136, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"deptId\":100,\"deptName\":\"一级队列\",\"email\":\"\",\"leader\":\"\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:29:46');
INSERT INTO `sys_oper_log` VALUES (137, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"deptId\":103,\"deptName\":\"管理员组\",\"email\":\"\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:30:10');
INSERT INTO `sys_oper_log` VALUES (138, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"deptId\":105,\"deptName\":\"客户组\",\"email\":\"\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:30:22');
INSERT INTO `sys_oper_log` VALUES (139, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/102', '127.0.0.1', '', NULL, '{\"msg\":\"存在下级部门,不允许删除\",\"code\":500}', 0, NULL, '2022-09-20 22:30:25');
INSERT INTO `sys_oper_log` VALUES (140, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/108', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:30:27');
INSERT INTO `sys_oper_log` VALUES (141, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/109', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:30:29');
INSERT INTO `sys_oper_log` VALUES (142, '部门管理', 3, 'com.ruoyi.system.controller.SysDeptController.remove()', 'DELETE', 1, 'admin', NULL, '/dept/102', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:30:31');
INSERT INTO `sys_oper_log` VALUES (143, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"deptId\":101,\"deptName\":\"组\",\"email\":\"\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:30:50');
INSERT INTO `sys_oper_log` VALUES (144, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/user/resetPwd', '127.0.0.1', '', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:37:24');
INSERT INTO `sys_oper_log` VALUES (145, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"客户组\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginDate\":\"2022-09-20 14:17:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"root\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[2],\"remark\":\"管理员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:38:12');
INSERT INTO `sys_oper_log` VALUES (146, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"客户组\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginDate\":\"2022-09-20 14:17:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"管理员\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[2],\"remark\":\"管理员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:38:28');
INSERT INTO `sys_oper_log` VALUES (147, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"perms\":\"flightm:flight:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:41:09');
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班查询\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"perms\":\"flightm:flight:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:41:23');
INSERT INTO `sys_oper_log` VALUES (149, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"perms\":\"flightm:flight:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:41:36');
INSERT INTO `sys_oper_log` VALUES (150, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航班修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"perms\":\"flightm:flight:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:41:58');
INSERT INTO `sys_oper_log` VALUES (151, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航线新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2002,\"perms\":\"routesm:routes:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:42:40');
INSERT INTO `sys_oper_log` VALUES (152, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航线修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2002,\"perms\":\"routesm:routes:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:42:54');
INSERT INTO `sys_oper_log` VALUES (153, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航线查询\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2002,\"perms\":\"routesm:routes:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:43:09');
INSERT INTO `sys_oper_log` VALUES (154, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"航线删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2002,\"perms\":\"routesm:routes:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:43:20');
INSERT INTO `sys_oper_log` VALUES (155, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"perms\":\"orderm:order:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:43:43');
INSERT INTO `sys_oper_log` VALUES (156, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单查询\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"perms\":\"orderm:order:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:44:34');
INSERT INTO `sys_oper_log` VALUES (157, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2003,\"perms\":\"orderm:order:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:44:48');
INSERT INTO `sys_oper_log` VALUES (158, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2003,\"perms\":\"orderm:order:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-20 22:45:01');
INSERT INTO `sys_oper_log` VALUES (159, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2002', '127.0.0.1', '', NULL, '{\"msg\":\"存在子菜单,不允许删除\",\"code\":500}', 0, NULL, '2022-09-21 09:32:52');
INSERT INTO `sys_oper_log` VALUES (160, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2008', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:32:56');
INSERT INTO `sys_oper_log` VALUES (161, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2010', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:32:58');
INSERT INTO `sys_oper_log` VALUES (162, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2009', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:32:59');
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2011', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:33:01');
INSERT INTO `sys_oper_log` VALUES (164, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2002', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:33:03');
INSERT INTO `sys_oper_log` VALUES (165, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/2', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:33:52');
INSERT INTO `sys_oper_log` VALUES (166, '代码生成', 3, 'com.ruoyi.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', NULL, '/gen/3', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:33:53');
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"ticket_order_info,ticket_flight_info\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:34:44');
INSERT INTO `sys_oper_log` VALUES (168, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"航班类型\",\"dictType\":\"ticket_type\",\"params\":{},\"remark\":\"0国内航班1国际航班\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:35:36');
INSERT INTO `sys_oper_log` VALUES (169, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/flightm/index\",\"createTime\":\"2022-09-20 21:21:57\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"航班信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"flightm\",\"perms\":\"ticket:flightm:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:37:16');
INSERT INTO `sys_oper_log` VALUES (170, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/custom/index\",\"createTime\":\"2022-09-20 21:30:06\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":0,\"path\":\"custom\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:37:32');
INSERT INTO `sys_oper_log` VALUES (171, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/orderm/index\",\"createTime\":\"2022-09-20 21:34:30\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"orderm\",\"perms\":\"ticket:orderm:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:37:54');
INSERT INTO `sys_oper_log` VALUES (172, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"机型\",\"dictType\":\"plan_type\",\"params\":{},\"remark\":\"飞机类型\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:40:44');
INSERT INTO `sys_oper_log` VALUES (173, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"国内航班\",\"dictSort\":0,\"dictType\":\"ticket_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:41:03');
INSERT INTO `sys_oper_log` VALUES (174, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"国际航班\",\"dictSort\":1,\"dictType\":\"ticket_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:41:11');
INSERT INTO `sys_oper_log` VALUES (175, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"波音747-8\",\"dictSort\":0,\"dictType\":\"plan_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:42:35');
INSERT INTO `sys_oper_log` VALUES (176, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"波音747-400\",\"dictSort\":1,\"dictType\":\"plan_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 09:42:53');
INSERT INTO `sys_oper_log` VALUES (177, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-09-21 09:44:55');
INSERT INTO `sys_oper_log` VALUES (178, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-09-21 09:44:55');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"example\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"系统目录\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"ticket\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 10:27:22');
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/flightm/index\",\"createTime\":\"2022-09-20 21:21:57\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"航班信息\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"flightm\",\"perms\":\"ticket:flightm:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 10:27:30');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/custom/index\",\"createTime\":\"2022-09-20 21:30:06\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2016,\"path\":\"custom\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 10:27:36');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/orderm/index\",\"createTime\":\"2022-09-20 21:34:30\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2016,\"path\":\"orderm\",\"perms\":\"ticket:orderm:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 10:27:41');
INSERT INTO `sys_oper_log` VALUES (183, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-09-21 10:28:19');
INSERT INTO `sys_oper_log` VALUES (184, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-09-21 10:28:20');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/custom/index\",\"createTime\":\"2022-09-20 21:30:06\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2016,\"path\":\"custom\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 10:35:17');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/orderm/index\",\"createTime\":\"2022-09-20 21:34:30\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2016,\"path\":\"orderm\",\"perms\":\"ticket:orderm:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 10:35:22');
INSERT INTO `sys_oper_log` VALUES (187, '航班信息', 1, 'com.ruoyi.ticket.controller.TicketFlightInfoController.add()', 'POST', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21T10:46:18.759+08:00\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-23 00:00:00\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 00:00:00\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 10:46:18');
INSERT INTO `sys_oper_log` VALUES (188, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-09-21 10:54:06');
INSERT INTO `sys_oper_log` VALUES (189, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-09-21 10:54:06');
INSERT INTO `sys_oper_log` VALUES (190, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 00:00:00\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 00:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21T17:02:06.155+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:02:06');
INSERT INTO `sys_oper_log` VALUES (191, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21T17:03:17.138+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:03:17');
INSERT INTO `sys_oper_log` VALUES (192, '航班信息', 1, 'com.ruoyi.ticket.controller.TicketFlightInfoController.add()', 'POST', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"0001\",\"commonNum\":100,\"commonPrice\":1024,\"createBy\":\"admin\",\"createTime\":\"2022-09-21T17:21:15.142+08:00\",\"endPlace\":\"纽约\",\"endTime\":\"2022-09-23 00:00:00\",\"higherNum\":20,\"higherPrice\":10240,\"id\":2,\"name\":\"测试航班1\",\"params\":{},\"planType\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-22 00:00:00\",\"type\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:21:15');
INSERT INTO `sys_oper_log` VALUES (193, '航班信息', 3, 'com.ruoyi.ticket.controller.TicketFlightInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/flightm/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:24:29');
INSERT INTO `sys_oper_log` VALUES (194, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"0001\",\"commonNum\":100,\"commonPrice\":1024,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:21:15\",\"del\":\"0\",\"endPlace\":\"纽约\",\"endTime\":\"2022-09-23 00:00:00\",\"higherNum\":20,\"higherPrice\":10240,\"higherSurplus\":20,\"id\":2,\"name\":\"测试航班1\",\"params\":{},\"planType\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-22 00:00:00\",\"type\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21T17:24:58.531+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:24:58');
INSERT INTO `sys_oper_log` VALUES (195, '航班信息', 1, 'com.ruoyi.ticket.controller.TicketFlightInfoController.add()', 'POST', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"JO-2022-09-210103\",\"commonNum\":100,\"commonPrice\":150,\"createBy\":\"admin\",\"createTime\":\"2022-09-21T17:35:12.781+08:00\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-22 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"id\":3,\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:35:12');
INSERT INTO `sys_oper_log` VALUES (196, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"JO-2022-09-210103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-22 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21T17:35:32.727+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:35:32');
INSERT INTO `sys_oper_log` VALUES (197, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"JO-2022-09-210103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21T17:46:21.383+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:46:21');
INSERT INTO `sys_oper_log` VALUES (198, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21T17:49:45.358+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:49:45');
INSERT INTO `sys_oper_log` VALUES (199, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/custom/index\",\"createTime\":\"2022-09-20 21:30:06\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2016,\"path\":\"custom\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:57:48');
INSERT INTO `sys_oper_log` VALUES (200, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"用户增加\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"perms\":\"system:user:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:58:10');
INSERT INTO `sys_oper_log` VALUES (201, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-21 17:58:10\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2017,\"menuName\":\"客户增加\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2001,\"path\":\"\",\"perms\":\"system:user:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:58:22');
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户查询\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2001,\"perms\":\"system:user:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:58:34');
INSERT INTO `sys_oper_log` VALUES (203, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2001,\"perms\":\"system:user:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:58:45');
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"客户删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2001,\"perms\":\"system:user:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:59:00');
INSERT INTO `sys_oper_log` VALUES (205, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"重置密码\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2001,\"perms\":\"system:user:resetPwd\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 17:59:29');
INSERT INTO `sys_oper_log` VALUES (206, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订票\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2000,\"perms\":\"ticket:flightm:buy\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 18:02:49');
INSERT INTO `sys_oper_log` VALUES (207, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"舱位等级\",\"dictType\":\"seat_level\",\"params\":{},\"remark\":\"0经济舱1头等舱\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 18:09:42');
INSERT INTO `sys_oper_log` VALUES (208, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"经济舱\",\"dictSort\":1,\"dictType\":\"seat_level\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 18:10:04');
INSERT INTO `sys_oper_log` VALUES (209, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"头等舱\",\"dictSort\":2,\"dictType\":\"seat_level\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 18:10:14');
INSERT INTO `sys_oper_log` VALUES (210, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":5,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"0\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:03:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 20:30:26');
INSERT INTO `sys_oper_log` VALUES (211, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":10,\"code\":\"0001\",\"commonNum\":100,\"commonPrice\":1024,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:21:15\",\"del\":\"0\",\"endPlace\":\"纽约\",\"endTime\":\"2022-09-23 00:00:00\",\"higherNum\":20,\"higherPrice\":10240,\"higherSurplus\":20,\"id\":2,\"name\":\"测试航班1\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-22 00:00:00\",\"type\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:24:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 20:51:24');
INSERT INTO `sys_oper_log` VALUES (212, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":3,\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:49:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 20:56:00');
INSERT INTO `sys_oper_log` VALUES (213, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"0001\",\"commonNum\":100,\"commonPrice\":1024,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:21:15\",\"del\":\"0\",\"endPlace\":\"纽约\",\"endTime\":\"2022-09-23 00:00:00\",\"higherNum\":20,\"higherPrice\":10240,\"higherSurplus\":10,\"id\":2,\"name\":\"测试航班1\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-22 00:00:00\",\"type\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:24:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 20:59:58');
INSERT INTO `sys_oper_log` VALUES (214, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":100,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":995,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:03:17\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-09-21 21:05:44');
INSERT INTO `sys_oper_log` VALUES (215, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":10,\"code\":\"0001\",\"commonNum\":100,\"commonPrice\":1024,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:21:15\",\"del\":\"0\",\"endPlace\":\"纽约\",\"endTime\":\"2022-09-23 00:00:00\",\"higherNum\":20,\"higherPrice\":10240,\"higherSurplus\":9,\"id\":2,\"name\":\"测试航班1\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-22 00:00:00\",\"type\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:24:59\"}', '{\"msg\":\"操作失败\",\"code\":500}', 0, NULL, '2022-09-21 21:11:08');
INSERT INTO `sys_oper_log` VALUES (216, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":12,\"code\":\"0001\",\"commonNum\":100,\"commonPrice\":1024,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:21:15\",\"del\":\"0\",\"endPlace\":\"纽约\",\"endTime\":\"2022-09-23 00:00:00\",\"higherNum\":20,\"higherPrice\":10240,\"higherSurplus\":9,\"id\":2,\"name\":\"测试航班1\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"0\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-22 00:00:00\",\"type\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:24:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:12:07');
INSERT INTO `sys_oper_log` VALUES (217, '角色管理', 1, 'com.ruoyi.system.controller.SysRoleController.add()', 'POST', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2005,2022,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:17:39');
INSERT INTO `sys_oper_log` VALUES (218, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2005,2022,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:18:18');
INSERT INTO `sys_oper_log` VALUES (219, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:18:34');
INSERT INTO `sys_oper_log` VALUES (220, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-09-20 14:38:16\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"客户组\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"客户1\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"user1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:19:12');
INSERT INTO `sys_oper_log` VALUES (221, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:19:50');
INSERT INTO `sys_oper_log` VALUES (222, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"\",\"createTime\":\"2022-09-20 14:38:16\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"客户组\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginIp\":\"\",\"nickName\":\"客户1\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"roleIds\":[100],\"roles\":[{\"admin\":false,\"dataScope\":\"4\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":100,\"userName\":\"user1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:20:15');
INSERT INTO `sys_oper_log` VALUES (223, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', NULL, '/user/resetPwd', '127.0.0.1', '', '{\"admin\":false,\"params\":{},\"updateBy\":\"admin\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:22:58');
INSERT INTO `sys_oper_log` VALUES (224, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2005,2022,2012,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:24:40');
INSERT INTO `sys_oper_log` VALUES (225, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2005,2022,2012,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:29:05');
INSERT INTO `sys_oper_log` VALUES (226, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:30:11');
INSERT INTO `sys_oper_log` VALUES (227, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 22:41:36\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2006,\"menuName\":\"航班删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2000,\"path\":\"\",\"perms\":\"ticket:flightm:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:33:52');
INSERT INTO `sys_oper_log` VALUES (228, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 22:41:58\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"航班修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"\",\"perms\":\"ticket:flightm::edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:34:01');
INSERT INTO `sys_oper_log` VALUES (229, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 22:41:23\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2005,\"menuName\":\"航班查询\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"\",\"perms\":\"ticket:flightm:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:34:10');
INSERT INTO `sys_oper_log` VALUES (230, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 22:41:58\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2007,\"menuName\":\"航班修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"\",\"perms\":\"ticket:flightm:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:34:17');
INSERT INTO `sys_oper_log` VALUES (231, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 22:41:09\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2004,\"menuName\":\"航班新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"\",\"perms\":\"ticket:flightm:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:34:34');
INSERT INTO `sys_oper_log` VALUES (232, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2005,2022,2012,2013],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:35:11');
INSERT INTO `sys_oper_log` VALUES (233, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":10,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":995,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:03:17\"}', NULL, 1, 'ticket:orderm:add', '2022-09-21 21:35:42');
INSERT INTO `sys_oper_log` VALUES (234, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 22:43:43\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2012,\"menuName\":\"订单新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2003,\"path\":\"\",\"perms\":\"ticket:orderm:add\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:37:50');
INSERT INTO `sys_oper_log` VALUES (235, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 22:44:34\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"订单查询\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2003,\"path\":\"\",\"perms\":\"ticket:orderm:query\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:38:03');
INSERT INTO `sys_oper_log` VALUES (236, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 22:44:48\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2014,\"menuName\":\"订单修改\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2003,\"path\":\"\",\"perms\":\"ticket:orderm:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:38:12');
INSERT INTO `sys_oper_log` VALUES (237, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-09-20 22:45:01\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2015,\"menuName\":\"订单删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2003,\"path\":\"\",\"perms\":\"ticket:orderm:remove\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:38:21');
INSERT INTO `sys_oper_log` VALUES (238, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":10,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":995,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:03:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:38:58');
INSERT INTO `sys_oper_log` VALUES (239, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'user1', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"\",\"createTime\":\"2022-09-20 14:38:16\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"客户组\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"123456@qq.com\",\"loginIp\":\"\",\"nickName\":\"客户1\",\"params\":{},\"phonenumber\":\"15846894511\",\"roles\":[{\"admin\":false,\"dataScope\":\"5\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"user1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-21 21:42:25');
INSERT INTO `sys_oper_log` VALUES (240, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"退票\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2003,\"perms\":\"ticket:orderm:refund\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 17:37:10');
INSERT INTO `sys_oper_log` VALUES (241, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/orderm/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 18:16:07');
INSERT INTO `sys_oper_log` VALUES (242, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/orderm/1', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 18:17:44');
INSERT INTO `sys_oper_log` VALUES (243, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/orderm/3', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 18:20:09');
INSERT INTO `sys_oper_log` VALUES (244, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/orderm/4', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 18:20:42');
INSERT INTO `sys_oper_log` VALUES (245, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/orderm/2,5,6', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 18:20:49');
INSERT INTO `sys_oper_log` VALUES (246, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2005,2022,2012,2013,2023],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 18:23:50');
INSERT INTO `sys_oper_log` VALUES (247, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":10,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:03:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 18:24:41');
INSERT INTO `sys_oper_log` VALUES (248, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'user1', NULL, '/orderm/7', '127.0.0.1', '', NULL, NULL, 1, 'ticket:orderm:remove', '2022-09-22 18:24:53');
INSERT INTO `sys_oper_log` VALUES (249, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'user1', NULL, '/orderm/7', '127.0.0.1', '', NULL, NULL, 1, 'ticket:orderm:remove', '2022-09-22 18:54:45');
INSERT INTO `sys_oper_log` VALUES (250, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'user1', NULL, '/orderm/7', '127.0.0.1', '', NULL, NULL, 1, 'ticket:orderm:remove', '2022-09-22 18:54:57');
INSERT INTO `sys_oper_log` VALUES (251, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2005,2022,2012,2013,2023],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 18:57:03');
INSERT INTO `sys_oper_log` VALUES (252, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'user1', NULL, '/orderm/refund/7', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:04:03');
INSERT INTO `sys_oper_log` VALUES (253, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":10,\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"0\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:49:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:21:25');
INSERT INTO `sys_oper_log` VALUES (254, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'user1', NULL, '/orderm/refund/8', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:22:20');
INSERT INTO `sys_oper_log` VALUES (255, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"0\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:49:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:23:43');
INSERT INTO `sys_oper_log` VALUES (256, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"客户组\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"\",\"loginDate\":\"2022-09-20 14:17:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"管理员\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"管理员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:42:46');
INSERT INTO `sys_oper_log` VALUES (257, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"客户组\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":103,\"email\":\"\",\"loginDate\":\"2022-09-20 14:17:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"管理员\",\"params\":{},\"phonenumber\":\"\",\"postIds\":[],\"remark\":\"管理员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"root\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:43:00');
INSERT INTO `sys_oper_log` VALUES (258, '用户管理', 1, 'com.ruoyi.system.controller.SysUserController.add()', 'POST', 1, 'admin', NULL, '/user', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"deptId\":105,\"nickName\":\"张三\",\"params\":{},\"postIds\":[],\"roleIds\":[100],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"user2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:44:18');
INSERT INTO `sys_oper_log` VALUES (259, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2004,2005,2007,2006,2022,2001,2017,2018,2019,2020,2021,2003,2012,2013,2014,2015,2023],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:46:02');
INSERT INTO `sys_oper_log` VALUES (260, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,103,105],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:46:18');
INSERT INTO `sys_oper_log` VALUES (261, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:51:23');
INSERT INTO `sys_oper_log` VALUES (262, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'root', NULL, '/orderm/9', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:54:11');
INSERT INTO `sys_oper_log` VALUES (263, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,105],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 19:55:34');
INSERT INTO `sys_oper_log` VALUES (264, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"deptId\":103,\"deptName\":\"管理员\",\"email\":\"\",\"leader\":\"\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 20:31:05');
INSERT INTO `sys_oper_log` VALUES (265, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"deptId\":105,\"deptName\":\"客户\",\"email\":\"\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 20:31:11');
INSERT INTO `sys_oper_log` VALUES (266, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2004,2005,2007,2006,2022,2001,2017,2018,2019,2020,2021,2003,2012,2013,2014,2015,2023],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 20:33:59');
INSERT INTO `sys_oper_log` VALUES (267, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2004,2005,2007,2006,2001,2017,2018,2019,2020,2021,2012,2013,2014,2015],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 20:36:40');
INSERT INTO `sys_oper_log` VALUES (268, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":3,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:03:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-22 20:37:18');
INSERT INTO `sys_oper_log` VALUES (269, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":7,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":7,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:03:17\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-23 21:05:43');
INSERT INTO `sys_oper_log` VALUES (270, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'user1', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"\",\"createTime\":\"2022-09-20 14:38:16\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"客户\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"123456@qq.com\",\"loginIp\":\"\",\"nickName\":\"客户一\",\"params\":{},\"phonenumber\":\"15846894511\",\"roles\":[{\"admin\":false,\"dataScope\":\"5\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"user1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-23 21:06:28');
INSERT INTO `sys_oper_log` VALUES (271, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'user1', NULL, '/orderm/refund/10', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-23 21:07:00');
INSERT INTO `sys_oper_log` VALUES (272, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user2', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":10,\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"0\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:49:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-23 21:08:36');
INSERT INTO `sys_oper_log` VALUES (273, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user2', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":20,\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":90,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:49:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-23 21:09:21');
INSERT INTO `sys_oper_log` VALUES (274, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'user2', NULL, '/orderm/refund/12,13', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-23 21:10:35');
INSERT INTO `sys_oper_log` VALUES (275, '航班信息', 1, 'com.ruoyi.ticket.controller.TicketFlightInfoController.add()', 'POST', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"JO-2022-09-23-666666\",\"commonNum\":10,\"commonPrice\":100,\"commonSurplus\":10,\"createBy\":\"admin\",\"createTime\":\"2022-09-23T21:23:59.529+08:00\",\"endPlace\":\"西藏\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":10,\"higherPrice\":1000,\"higherSurplus\":10,\"id\":4,\"name\":\"蕉♂航-测试航班3\",\"params\":{},\"planType\":\"0\",\"startPlace\":\"上海\",\"startTime\":\"2022-09-14 13:06:12\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-23 21:23:59');
INSERT INTO `sys_oper_log` VALUES (276, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,1,105,2004,2005,2007,2006,2001,2017,2018,2019,2020,2021,2012,2013,2014,2015,1025,1026,1027,1028],\"params\":{},\"remark\":\"普通管理员\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-23 21:25:44');
INSERT INTO `sys_oper_log` VALUES (277, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2004,2005,2007,2006,2001,2017,2018,2019,2020,2021,2012,2013,2014,2015],\"params\":{},\"remark\":\"普通管理员\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-23 21:28:14');
INSERT INTO `sys_oper_log` VALUES (278, '航班信息', 3, 'com.ruoyi.ticket.controller.TicketFlightInfoController.remove()', 'DELETE', 1, 'root', NULL, '/flightm/4', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-26 19:53:45');
INSERT INTO `sys_oper_log` VALUES (279, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'root', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":3,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"gffff\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"root\",\"updateTime\":\"2022-09-26T19:54:09.759+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-09-26 19:54:09');
INSERT INTO `sys_oper_log` VALUES (280, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user2', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":10,\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:49:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-10 10:53:17');
INSERT INTO `sys_oper_log` VALUES (281, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'user1', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"\",\"createTime\":\"2022-09-20 14:38:16\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"客户\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"email\":\"123456@qq.com\",\"loginIp\":\"\",\"nickName\":\"客户1\",\"params\":{},\"phonenumber\":\"15846894511\",\"roles\":[{\"admin\":false,\"dataScope\":\"5\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":100,\"userName\":\"user1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-11 13:54:31');
INSERT INTO `sys_oper_log` VALUES (282, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'root', NULL, '/user/changeStatus', '127.0.0.1', '', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"root\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-11 13:55:29');
INSERT INTO `sys_oper_log` VALUES (283, '用户管理', 2, 'com.ruoyi.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'root', NULL, '/user/changeStatus', '127.0.0.1', '', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"root\",\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-11 13:55:47');
INSERT INTO `sys_oper_log` VALUES (284, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'user1', NULL, '/orderm/refund/11', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-11 15:15:33');
INSERT INTO `sys_oper_log` VALUES (285, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":2,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"gffff\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"root\",\"updateTime\":\"2022-09-26 19:54:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-11 15:30:58');
INSERT INTO `sys_oper_log` VALUES (286, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"订单记录类型\",\"dictType\":\"order_record_type\",\"params\":{},\"remark\":\"0订票1改签2退票\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:42:06');
INSERT INTO `sys_oper_log` VALUES (287, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"订票\",\"dictSort\":0,\"dictType\":\"order_record_type\",\"dictValue\":\"0\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:42:24');
INSERT INTO `sys_oper_log` VALUES (288, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"改签\",\"dictSort\":1,\"dictType\":\"order_record_type\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:42:40');
INSERT INTO `sys_oper_log` VALUES (289, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"退票\",\"dictSort\":2,\"dictType\":\"order_record_type\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:42:50');
INSERT INTO `sys_oper_log` VALUES (290, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-10-12 10:42:24\",\"default\":false,\"dictCode\":106,\"dictLabel\":\"订票\",\"dictSort\":0,\"dictType\":\"order_record_type\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:44:51');
INSERT INTO `sys_oper_log` VALUES (291, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-10-12 10:42:40\",\"default\":false,\"dictCode\":107,\"dictLabel\":\"改签\",\"dictSort\":1,\"dictType\":\"order_record_type\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:44:56');
INSERT INTO `sys_oper_log` VALUES (292, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-10-12 10:42:50\",\"default\":false,\"dictCode\":108,\"dictLabel\":\"退票\",\"dictSort\":2,\"dictType\":\"order_record_type\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:45:01');
INSERT INTO `sys_oper_log` VALUES (293, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"付款状态\",\"dictType\":\"payment_status\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:45:41');
INSERT INTO `sys_oper_log` VALUES (294, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"未付款\",\"dictSort\":0,\"dictType\":\"payment_status\",\"dictValue\":\"0\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:46:03');
INSERT INTO `sys_oper_log` VALUES (295, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"已付款\",\"dictSort\":1,\"dictType\":\"payment_status\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:46:18');
INSERT INTO `sys_oper_log` VALUES (296, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-10-12 10:46:03\",\"default\":false,\"dictCode\":109,\"dictLabel\":\"未付款\",\"dictSort\":0,\"dictType\":\"payment_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:46:27');
INSERT INTO `sys_oper_log` VALUES (297, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-10-12 10:46:03\",\"default\":false,\"dictCode\":109,\"dictLabel\":\"未付款\",\"dictSort\":0,\"dictType\":\"payment_status\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 10:46:32');
INSERT INTO `sys_oper_log` VALUES (298, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":8,\"id\":1,\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"gffff\",\"seatLevel\":\"0\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"root\",\"updateTime\":\"2022-09-26 19:54:10\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 11:01:04');
INSERT INTO `sys_oper_log` VALUES (299, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"付款\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2003,\"perms\":\"ticket:orderm:pay\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 11:06:20');
INSERT INTO `sys_oper_log` VALUES (300, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-10-12 11:06:20\",\"icon\":\"money\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2024,\"menuName\":\"付款\",\"menuType\":\"M\",\"orderNum\":6,\"params\":{},\"parentId\":2003,\"path\":\"分割后\",\"perms\":\"ticket:orderm:pay\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 11:06:50');
INSERT INTO `sys_oper_log` VALUES (301, '菜单管理', 3, 'com.ruoyi.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', NULL, '/menu/2024', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 11:07:06');
INSERT INTO `sys_oper_log` VALUES (302, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"付款\",\"menuType\":\"F\",\"orderNum\":6,\"params\":{},\"parentId\":2003,\"perms\":\"ticket:orderm:pay\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 11:07:15');
INSERT INTO `sys_oper_log` VALUES (303, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/orderm/index\",\"createTime\":\"2022-09-20 21:34:30\",\"icon\":\"documentation\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2003,\"menuName\":\"订单管理\",\"menuType\":\"C\",\"orderNum\":4,\"params\":{},\"parentId\":2016,\"path\":\"orderm\",\"perms\":\"ticket:orderm:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 11:45:22');
INSERT INTO `sys_oper_log` VALUES (304, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/custom/index\",\"createTime\":\"2022-09-20 21:30:06\",\"icon\":\"peoples\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"客户管理\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2016,\"path\":\"custom\",\"perms\":\"system:user:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 11:45:26');
INSERT INTO `sys_oper_log` VALUES (305, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/flightm/index\",\"createTime\":\"2022-09-20 21:21:57\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"航班信息\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2016,\"path\":\"flightm\",\"perms\":\"ticket:flightm:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 11:45:30');
INSERT INTO `sys_oper_log` VALUES (306, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/payment/index\",\"createBy\":\"admin\",\"icon\":\"edit\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"制定航班\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2016,\"path\":\"payment\",\"perms\":\"ticket:payment:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 11:46:57');
INSERT INTO `sys_oper_log` VALUES (307, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"ticket_payment\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 11:48:29');
INSERT INTO `sys_oper_log` VALUES (308, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-10-12 11:53:06');
INSERT INTO `sys_oper_log` VALUES (309, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-10-12 11:53:07');
INSERT INTO `sys_oper_log` VALUES (310, '制定航班', 1, 'com.ruoyi.ticket.controller.TicketPaymentController.add()', 'POST', 1, 'admin', NULL, '/payment', '127.0.0.1', '', '{\"code\":\"111\",\"commonNum\":20,\"commonPrice\":100,\"createTime\":\"2022-10-12T12:04:37.237+08:00\",\"endPlace\":\"上海\",\"higherNum\":10,\"higherPrice\":200,\"id\":5,\"name\":\"111\",\"params\":{},\"planType\":\"0\",\"startPlace\":\"北京\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 12:04:37');
INSERT INTO `sys_oper_log` VALUES (311, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"制定添加\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2026,\"perms\":\"ticket:payment:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 15:43:01');
INSERT INTO `sys_oper_log` VALUES (312, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"制定修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2026,\"perms\":\"ticket:payment:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 15:43:14');
INSERT INTO `sys_oper_log` VALUES (313, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"制定查询\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2026,\"perms\":\"ticket:payment:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 15:43:27');
INSERT INTO `sys_oper_log` VALUES (314, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"制定删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2026,\"perms\":\"ticket:payment:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 15:43:43');
INSERT INTO `sys_oper_log` VALUES (315, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"安排\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2026,\"perms\":\"ticket:payment:arrange\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 15:44:26');
INSERT INTO `sys_oper_log` VALUES (316, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createTime\":\"2022-10-12 15:44:26\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2031,\"menuName\":\"安排航班\",\"menuType\":\"F\",\"orderNum\":5,\"params\":{},\"parentId\":2026,\"path\":\"\",\"perms\":\"ticket:payment:arrange\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 15:44:35');
INSERT INTO `sys_oper_log` VALUES (317, '字典类型', 1, 'com.ruoyi.system.controller.SysDictTypeController.add()', 'POST', 1, 'admin', NULL, '/dict/type', '127.0.0.1', '', '{\"createBy\":\"admin\",\"dictName\":\"是否晚点\",\"dictType\":\"is_late\",\"params\":{},\"remark\":\"0正常1晚点\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 16:05:26');
INSERT INTO `sys_oper_log` VALUES (318, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"正常\",\"dictSort\":0,\"dictType\":\"is_late\",\"dictValue\":\"0\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 16:05:40');
INSERT INTO `sys_oper_log` VALUES (319, '字典数据', 1, 'com.ruoyi.system.controller.SysDictDataController.add()', 'POST', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"晚点\",\"dictSort\":1,\"dictType\":\"is_late\",\"dictValue\":\"1\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 16:05:54');
INSERT INTO `sys_oper_log` VALUES (320, '字典数据', 2, 'com.ruoyi.system.controller.SysDictDataController.edit()', 'PUT', 1, 'admin', NULL, '/dict/data', '127.0.0.1', '', '{\"createBy\":\"admin\",\"createTime\":\"2022-10-12 16:05:54\",\"default\":false,\"dictCode\":112,\"dictLabel\":\"晚点\",\"dictSort\":1,\"dictType\":\"is_late\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 16:05:59');
INSERT INTO `sys_oper_log` VALUES (321, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":999,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":8,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12T16:15:33.77+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 16:15:33');
INSERT INTO `sys_oper_log` VALUES (322, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":999,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":8,\"id\":1,\"isLate\":\"1\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12T16:20:17.374+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 16:20:17');
INSERT INTO `sys_oper_log` VALUES (323, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'admin', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":999,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":8,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12T16:20:23.673+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-12 16:20:23');
INSERT INTO `sys_oper_log` VALUES (324, '制定航班', 1, 'com.ruoyi.ticket.controller.TicketPaymentController.add()', 'POST', 1, 'admin', NULL, '/payment', '127.0.0.1', '', '{\"code\":\"222\",\"commonNum\":50,\"commonPrice\":100,\"createTime\":\"2022-10-13T14:25:12.21+08:00\",\"endPlace\":\"北京\",\"higherNum\":20,\"higherPrice\":1000,\"id\":6,\"name\":\"222\",\"params\":{},\"planType\":\"1\",\"startPlace\":\"合肥\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-13 14:25:12');
INSERT INTO `sys_oper_log` VALUES (325, '制定航班', 1, 'com.ruoyi.ticket.controller.TicketPaymentController.arrange()', 'POST', 1, 'admin', NULL, '/payment/arrange/', '127.0.0.1', '', '{\"endTime\":\"2022-10-13 15:41:16\",\"id\":5,\"ids\":[],\"startTime\":\"2022-10-01 00:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-13 15:41:18');
INSERT INTO `sys_oper_log` VALUES (326, '订单信息', 2, 'com.ruoyi.ticket.controller.TicketOrderInfoController.pay()', 'PUT', 1, 'admin', NULL, '/orderm/pay/15', '127.0.0.1', '', '15', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'}\' at line 2\r\n### The error may exist in file [E:\\1   大学\\大四上\\系统开发\\workhome\\RuoYi-Cloud-master\\ruoyi-modules\\ticket\\target\\classes\\mapper\\ticket\\TicketOrderInfoMapper.xml]\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: update ticket_order_info set payment_status = 1         where id = {id}\r\n### Cause: java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'}\' at line 2\n; bad SQL grammar []; nested exception is java.sql.SQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'}\' at line 2', '2022-10-13 16:28:45');
INSERT INTO `sys_oper_log` VALUES (327, '订单信息', 2, 'com.ruoyi.ticket.controller.TicketOrderInfoController.pay()', 'PUT', 1, 'admin', NULL, '/orderm/pay/15', '127.0.0.1', '', '15', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-13 16:29:43');
INSERT INTO `sys_oper_log` VALUES (328, '订单信息', 2, 'com.ruoyi.ticket.controller.TicketOrderInfoController.pay()', 'PUT', 1, 'admin', NULL, '/orderm/pay/16', '127.0.0.1', '', '16', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-13 16:29:48');
INSERT INTO `sys_oper_log` VALUES (329, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":10,\"code\":\"JO-2022-10-13-111\",\"commonNum\":20,\"commonPrice\":100,\"commonSurplus\":20,\"createBy\":\"admin\",\"createTime\":\"2022-10-13 15:41:18\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-10-13 15:41:16\",\"higherNum\":10,\"higherPrice\":200,\"higherSurplus\":10,\"id\":5,\"isLate\":\"0\",\"name\":\"蕉♂航-111\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-10-01 00:00:00\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 14:32:37');
INSERT INTO `sys_oper_log` VALUES (330, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"改签\",\"menuType\":\"F\",\"orderNum\":7,\"params\":{},\"parentId\":2003,\"perms\":\"ticket:orderm:change\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 14:39:03');
INSERT INTO `sys_oper_log` VALUES (331, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":8,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":999,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":8,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:20:01');
INSERT INTO `sys_oper_log` VALUES (332, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":999,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":0,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"0\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:21:14');
INSERT INTO `sys_oper_log` VALUES (333, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/19', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:21:43');
INSERT INTO `sys_oper_log` VALUES (334, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/18', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:21:56');
INSERT INTO `sys_oper_log` VALUES (335, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/17', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:22:10');
INSERT INTO `sys_oper_log` VALUES (336, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/16', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:22:16');
INSERT INTO `sys_oper_log` VALUES (337, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/15', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:22:21');
INSERT INTO `sys_oper_log` VALUES (338, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/14', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:22:24');
INSERT INTO `sys_oper_log` VALUES (339, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":4,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:26:48');
INSERT INTO `sys_oper_log` VALUES (340, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":6,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:27:05');
INSERT INTO `sys_oper_log` VALUES (341, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/20', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:29:58');
INSERT INTO `sys_oper_log` VALUES (342, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":3,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":5,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:29:58');
INSERT INTO `sys_oper_log` VALUES (343, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/21', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:34:11');
INSERT INTO `sys_oper_log` VALUES (344, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"isLate\":\"0\",\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:49:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:34:11');
INSERT INTO `sys_oper_log` VALUES (345, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/22', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:34:40');
INSERT INTO `sys_oper_log` VALUES (346, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":3,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:34:41');
INSERT INTO `sys_oper_log` VALUES (347, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/24', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:37:48');
INSERT INTO `sys_oper_log` VALUES (348, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":2,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:37:48');
INSERT INTO `sys_oper_log` VALUES (349, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/25', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:37:58');
INSERT INTO `sys_oper_log` VALUES (350, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"JO-2022-10-13-111\",\"commonNum\":20,\"commonPrice\":100,\"commonSurplus\":20,\"createBy\":\"admin\",\"createTime\":\"2022-10-13 15:41:18\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-10-13 15:41:16\",\"higherNum\":10,\"higherPrice\":200,\"higherSurplus\":10,\"id\":5,\"isLate\":\"0\",\"name\":\"蕉♂航-111\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-10-01 00:00:00\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:37:59');
INSERT INTO `sys_oper_log` VALUES (351, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/26', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:38:26');
INSERT INTO `sys_oper_log` VALUES (352, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/23', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:38:29');
INSERT INTO `sys_oper_log` VALUES (353, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:39:59');
INSERT INTO `sys_oper_log` VALUES (354, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/27', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:41:05');
INSERT INTO `sys_oper_log` VALUES (355, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"isLate\":\"0\",\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:49:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:41:05');
INSERT INTO `sys_oper_log` VALUES (356, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/28', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:41:26');
INSERT INTO `sys_oper_log` VALUES (357, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":9,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:41:41');
INSERT INTO `sys_oper_log` VALUES (358, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/29', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:41:54');
INSERT INTO `sys_oper_log` VALUES (359, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":1,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:41:54');
INSERT INTO `sys_oper_log` VALUES (360, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/30', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:42:24');
INSERT INTO `sys_oper_log` VALUES (361, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":4,\"code\":\"0001\",\"commonNum\":100,\"commonPrice\":1024,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:21:15\",\"del\":\"0\",\"endPlace\":\"纽约\",\"endTime\":\"2022-09-23 00:00:00\",\"higherNum\":20,\"higherPrice\":10240,\"higherSurplus\":20,\"id\":2,\"isLate\":\"0\",\"name\":\"测试航班1\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-22 00:00:00\",\"type\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:24:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:42:24');
INSERT INTO `sys_oper_log` VALUES (362, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/31', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:43:02');
INSERT INTO `sys_oper_log` VALUES (363, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":1,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:43:02');
INSERT INTO `sys_oper_log` VALUES (364, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/orderm/32', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:47:30');
INSERT INTO `sys_oper_log` VALUES (365, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":3,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:47:56');
INSERT INTO `sys_oper_log` VALUES (366, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":5,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":7,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:48:08');
INSERT INTO `sys_oper_log` VALUES (367, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/33', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:48:09');
INSERT INTO `sys_oper_log` VALUES (368, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":3,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":5,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:48:33');
INSERT INTO `sys_oper_log` VALUES (369, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/34', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:48:33');
INSERT INTO `sys_oper_log` VALUES (370, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":7,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:49:24');
INSERT INTO `sys_oper_log` VALUES (371, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/35', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:49:24');
INSERT INTO `sys_oper_log` VALUES (372, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":3,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":9,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:49:35');
INSERT INTO `sys_oper_log` VALUES (373, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/36', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 15:49:35');
INSERT INTO `sys_oper_log` VALUES (374, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/record/index\",\"createBy\":\"admin\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"订单记录\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2016,\"path\":\"record\",\"perms\":\"tiicket:record:list\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 16:12:53');
INSERT INTO `sys_oper_log` VALUES (375, '菜单管理', 2, 'com.ruoyi.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"component\":\"ticket/record/index\",\"createTime\":\"2022-10-14 16:12:53\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2033,\"menuName\":\"订单记录\",\"menuType\":\"C\",\"orderNum\":5,\"params\":{},\"parentId\":2016,\"path\":\"record\",\"perms\":\"ticket:record:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 16:13:04');
INSERT INTO `sys_oper_log` VALUES (376, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"记录新增\",\"menuType\":\"F\",\"orderNum\":1,\"params\":{},\"parentId\":2033,\"perms\":\"ticket:record:add\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 16:13:36');
INSERT INTO `sys_oper_log` VALUES (377, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"记录修改\",\"menuType\":\"F\",\"orderNum\":2,\"params\":{},\"parentId\":2033,\"perms\":\"ticket:record:edit\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 16:13:49');
INSERT INTO `sys_oper_log` VALUES (378, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"记录查询\",\"menuType\":\"F\",\"orderNum\":3,\"params\":{},\"parentId\":2033,\"perms\":\"ticket:record:query\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 16:14:04');
INSERT INTO `sys_oper_log` VALUES (379, '菜单管理', 1, 'com.ruoyi.system.controller.SysMenuController.add()', 'POST', 1, 'admin', NULL, '/menu', '127.0.0.1', '', '{\"children\":[],\"createBy\":\"admin\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"记录删除\",\"menuType\":\"F\",\"orderNum\":4,\"params\":{},\"parentId\":2033,\"perms\":\"ticket:record:remove\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 16:14:16');
INSERT INTO `sys_oper_log` VALUES (380, '代码生成', 6, 'com.ruoyi.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', NULL, '/gen/importTable', '127.0.0.1', '', '\"ticket_order_record\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 16:18:07');
INSERT INTO `sys_oper_log` VALUES (381, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-10-14 16:23:11');
INSERT INTO `sys_oper_log` VALUES (382, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-10-14 16:23:12');
INSERT INTO `sys_oper_log` VALUES (383, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-10-14 16:23:37');
INSERT INTO `sys_oper_log` VALUES (384, '代码生成', 8, 'com.ruoyi.gen.controller.GenController.batchGenCode()', 'GET', 1, 'admin', NULL, '/gen/batchGenCode', '127.0.0.1', '', NULL, NULL, 0, NULL, '2022-10-14 16:23:37');
INSERT INTO `sys_oper_log` VALUES (385, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":7,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 17:14:07');
INSERT INTO `sys_oper_log` VALUES (386, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":6,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 17:42:52');
INSERT INTO `sys_oper_log` VALUES (387, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/37', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 17:43:05');
INSERT INTO `sys_oper_log` VALUES (388, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/orderm/38,39', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 17:43:36');
INSERT INTO `sys_oper_log` VALUES (389, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 17:47:28');
INSERT INTO `sys_oper_log` VALUES (390, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"0001\",\"commonNum\":100,\"commonPrice\":1024,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:21:15\",\"del\":\"0\",\"endPlace\":\"纽约\",\"endTime\":\"2022-09-23 00:00:00\",\"higherNum\":20,\"higherPrice\":10240,\"higherSurplus\":20,\"id\":2,\"isLate\":\"0\",\"name\":\"测试航班1\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-22 00:00:00\",\"type\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:24:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 17:47:42');
INSERT INTO `sys_oper_log` VALUES (391, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/40', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 17:47:42');
INSERT INTO `sys_oper_log` VALUES (392, '订单记录', 3, 'com.ruoyi.ticket.controller.TicketOrderRecordController.remove()', 'DELETE', 1, 'admin', NULL, '/record/1,2,3,4,5,6,7,8', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:08:16');
INSERT INTO `sys_oper_log` VALUES (393, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:08:33');
INSERT INTO `sys_oper_log` VALUES (394, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"isLate\":\"0\",\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:49:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:08:54');
INSERT INTO `sys_oper_log` VALUES (395, '订单信息', 2, 'com.ruoyi.ticket.controller.TicketOrderInfoController.pay()', 'PUT', 1, 'admin', NULL, '/orderm/pay/41', '127.0.0.1', '', '41', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:09:05');
INSERT INTO `sys_oper_log` VALUES (396, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.change()', 'POST', 1, 'admin', NULL, '/orderm/change', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"JO-2022-10-13-111\",\"commonNum\":20,\"commonPrice\":100,\"commonSurplus\":20,\"createBy\":\"admin\",\"createTime\":\"2022-10-13 15:41:18\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-10-13 15:41:16\",\"higherNum\":10,\"higherPrice\":200,\"higherSurplus\":10,\"id\":5,\"isLate\":\"0\",\"name\":\"蕉♂航-111\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-10-01 00:00:00\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:09:16');
INSERT INTO `sys_oper_log` VALUES (397, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.delChange()', 'DELETE', 1, 'admin', NULL, '/orderm/change/41', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:09:17');
INSERT INTO `sys_oper_log` VALUES (398, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/42', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:09:43');
INSERT INTO `sys_oper_log` VALUES (399, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/orderm/43', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:09:53');
INSERT INTO `sys_oper_log` VALUES (400, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.change()', 'POST', 1, 'admin', NULL, '/orderm/change', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"0\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:10:38');
INSERT INTO `sys_oper_log` VALUES (401, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.delChange()', 'DELETE', 1, 'admin', NULL, '/orderm/change/44', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:10:38');
INSERT INTO `sys_oper_log` VALUES (402, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'admin', NULL, '/orderm/refund/45', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:10:56');
INSERT INTO `sys_oper_log` VALUES (403, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2026,2027,2028,2029,2030,2031,2004,2005,2007,2006,2001,2017,2018,2019,2020,2021,2012,2013,2014,2015,2033,2034,2035,2036,2037],\"params\":{},\"remark\":\"普通管理员\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:21:32');
INSERT INTO `sys_oper_log` VALUES (404, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2033,2005,2022,2012,2013,2023,2036],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:22:04');
INSERT INTO `sys_oper_log` VALUES (405, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[100,101,105],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通管理员\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:24:19');
INSERT INTO `sys_oper_log` VALUES (406, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'admin', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:24:38');
INSERT INTO `sys_oper_log` VALUES (407, '部门管理', 2, 'com.ruoyi.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', NULL, '/dept', '127.0.0.1', '', '{\"ancestors\":\"0,100,101,103\",\"children\":[],\"createBy\":\"admin\",\"createTime\":\"2022-09-20 14:17:53\",\"delFlag\":\"0\",\"deptId\":105,\"deptName\":\"客户\",\"email\":\"\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":103,\"phone\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:26:33');
INSERT INTO `sys_oper_log` VALUES (408, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', NULL, '/role/dataScope', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"deptIds\":[],\"flag\":false,\"menuCheckStrictly\":true,\"params\":{},\"remark\":\"普通管理员\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"roleSort\":\"2\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:26:50');
INSERT INTO `sys_oper_log` VALUES (409, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":9,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:28:48');
INSERT INTO `sys_oper_log` VALUES (410, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'user1', NULL, '/orderm/refund/47', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:29:03');
INSERT INTO `sys_oper_log` VALUES (411, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-21 21:17:39\",\"dataScope\":\"5\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2033,2005,2022,2012,2013,2023,2025,2032,2036],\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:29:38');
INSERT INTO `sys_oper_log` VALUES (412, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2026,2027,2028,2029,2030,2031,2004,2005,2007,2006,2001,2017,2018,2019,2020,2021,2013,2015,2033,2034,2035,2036,2037],\"params\":{},\"remark\":\"普通管理员\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:30:42');
INSERT INTO `sys_oper_log` VALUES (413, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'admin', NULL, '/orderm/46', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:32:35');
INSERT INTO `sys_oper_log` VALUES (414, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-10-12 16:20:24\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:33:06');
INSERT INTO `sys_oper_log` VALUES (415, '订单记录', 3, 'com.ruoyi.ticket.controller.TicketOrderRecordController.remove()', 'DELETE', 1, 'root', NULL, '/record/9,10,11,12,13,14,15,16', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:33:51');
INSERT INTO `sys_oper_log` VALUES (416, '订单记录', 3, 'com.ruoyi.ticket.controller.TicketOrderRecordController.remove()', 'DELETE', 1, 'root', NULL, '/record/19', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:33:57');
INSERT INTO `sys_oper_log` VALUES (417, '订单信息', 2, 'com.ruoyi.ticket.controller.TicketOrderInfoController.pay()', 'PUT', 1, 'user1', NULL, '/orderm/pay/48', '127.0.0.1', '', '48', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:37:12');
INSERT INTO `sys_oper_log` VALUES (418, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.change()', 'POST', 1, 'user1', NULL, '/orderm/change', '127.0.0.1', '', '{\"buyNum\":3,\"code\":\"0001\",\"commonNum\":100,\"commonPrice\":1024,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:21:15\",\"del\":\"0\",\"endPlace\":\"纽约\",\"endTime\":\"2022-09-23 00:00:00\",\"higherNum\":20,\"higherPrice\":10240,\"higherSurplus\":20,\"id\":2,\"isLate\":\"0\",\"name\":\"测试航班1\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-22 00:00:00\",\"type\":\"1\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:24:59\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:37:25');
INSERT INTO `sys_oper_log` VALUES (419, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.delChange()', 'DELETE', 1, 'user1', NULL, '/orderm/change/48', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-14 18:37:25');
INSERT INTO `sys_oper_log` VALUES (420, '制定航班', 1, 'com.ruoyi.ticket.controller.TicketPaymentController.arrange()', 'POST', 1, 'admin', NULL, '/payment/arrange/', '127.0.0.1', '', '{\"endTime\":\"2022-10-15 19:54:20\",\"ids\":[5,6],\"startTime\":\"2022-10-12 02:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-15 19:54:21');
INSERT INTO `sys_oper_log` VALUES (421, '订单信息', 2, 'com.ruoyi.ticket.controller.TicketOrderInfoController.pay()', 'PUT', 1, 'admin', NULL, '/orderm/pay/49', '127.0.0.1', '', '49', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-18 18:13:13');
INSERT INTO `sys_oper_log` VALUES (422, '订单信息', 2, 'com.ruoyi.ticket.controller.TicketOrderInfoController.pay()', 'PUT', 1, 'admin', NULL, '/orderm/pay/49', '127.0.0.1', '', '49', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-10-18 18:15:00');
INSERT INTO `sys_oper_log` VALUES (423, '制定航班', 1, 'com.ruoyi.ticket.controller.TicketPaymentController.add()', 'POST', 1, 'root', NULL, '/payment', '127.0.0.1', '', '{\"code\":\"333\",\"commonNum\":20,\"commonPrice\":500,\"createTime\":\"2022-11-01T10:34:59.902+08:00\",\"endPlace\":\"南京\",\"higherNum\":10,\"higherPrice\":1000,\"id\":7,\"name\":\"333\",\"params\":{},\"planType\":\"1\",\"startPlace\":\"北京\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-01 10:35:00');
INSERT INTO `sys_oper_log` VALUES (424, '制定航班', 1, 'com.ruoyi.ticket.controller.TicketPaymentController.arrange()', 'POST', 1, 'root', NULL, '/payment/arrange/', '127.0.0.1', '', '{\"endTime\":\"2022-11-02 11:00:00\",\"id\":7,\"ids\":[],\"startTime\":\"2022-11-01 08:00:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-01 10:35:21');
INSERT INTO `sys_oper_log` VALUES (425, '角色管理', 2, 'com.ruoyi.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/role', '127.0.0.1', '', '{\"admin\":false,\"createTime\":\"2022-09-20 14:17:53\",\"dataScope\":\"4\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2016,2000,2003,2033,2026,2027,2028,2029,2030,2031,2004,2005,2007,2006,2001,2017,2018,2019,2020,2021,2013,2015,2036,2037],\"params\":{},\"remark\":\"普通管理员\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通管理员\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-01 10:39:09');
INSERT INTO `sys_oper_log` VALUES (426, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user2', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":5,\"code\":\"JO-2022-11-01-333\",\"commonNum\":20,\"commonPrice\":500,\"commonSurplus\":20,\"createBy\":\"root\",\"createTime\":\"2022-11-01 10:35:22\",\"del\":\"0\",\"endPlace\":\"南京\",\"endTime\":\"2022-11-02 11:00:00\",\"higherNum\":10,\"higherPrice\":1000,\"higherSurplus\":10,\"id\":8,\"isLate\":\"0\",\"name\":\"蕉♂航-333\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"0\",\"startPlace\":\"北京\",\"startTime\":\"2022-11-01 08:00:00\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-01 10:42:05');
INSERT INTO `sys_oper_log` VALUES (427, '个人信息', 2, 'com.ruoyi.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'user2', NULL, '/user/profile', '127.0.0.1', '', '{\"admin\":false,\"createBy\":\"admin\",\"createTime\":\"2022-09-22 19:44:18\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101,103\",\"children\":[],\"deptId\":105,\"deptName\":\"客户\",\"leader\":\"\",\"orderNum\":3,\"params\":{},\"parentId\":103,\"status\":\"0\"},\"email\":\"148181@qq.com\",\"loginIp\":\"\",\"nickName\":\"客户2\",\"params\":{},\"phonenumber\":\"17328282828\",\"roles\":[{\"admin\":false,\"dataScope\":\"5\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":100,\"roleKey\":\"user\",\"roleName\":\"普通客户\",\"roleSort\":\"3\",\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":101,\"userName\":\"user2\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-01 10:43:16');
INSERT INTO `sys_oper_log` VALUES (428, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.change()', 'POST', 1, 'user2', NULL, '/orderm/change', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"JO-2022-10-15-111\",\"commonNum\":20,\"commonPrice\":100,\"commonSurplus\":20,\"createBy\":\"admin\",\"createTime\":\"2022-10-15 19:54:22\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-10-15 19:54:20\",\"higherNum\":10,\"higherPrice\":200,\"higherSurplus\":10,\"id\":6,\"isLate\":\"0\",\"name\":\"蕉♂航-111\",\"params\":{},\"planType\":\"0\",\"seatLevel\":\"1\",\"startPlace\":\"北京\",\"startTime\":\"2022-10-12 02:00:00\",\"type\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-01 10:44:14');
INSERT INTO `sys_oper_log` VALUES (429, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.delChange()', 'DELETE', 1, 'user2', NULL, '/orderm/change/50', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-01 10:44:14');
INSERT INTO `sys_oper_log` VALUES (430, '订单信息', 2, 'com.ruoyi.ticket.controller.TicketOrderInfoController.pay()', 'PUT', 1, 'user2', NULL, '/orderm/pay/51', '127.0.0.1', '', '51', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-01 10:44:17');
INSERT INTO `sys_oper_log` VALUES (431, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.refund()', 'DELETE', 1, 'user2', NULL, '/orderm/refund/51', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-01 10:44:39');
INSERT INTO `sys_oper_log` VALUES (432, '订单信息', 3, 'com.ruoyi.ticket.controller.TicketOrderInfoController.remove()', 'DELETE', 1, 'root', NULL, '/orderm/49', '127.0.0.1', '', NULL, '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-02 08:40:55');
INSERT INTO `sys_oper_log` VALUES (433, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'root', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"1\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"root\",\"updateTime\":\"2022-11-02T08:46:38.404+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-02 08:46:38');
INSERT INTO `sys_oper_log` VALUES (434, '航班信息', 2, 'com.ruoyi.ticket.controller.TicketFlightInfoController.edit()', 'PUT', 1, 'root', NULL, '/flightm', '127.0.0.1', '', '{\"code\":\"132\",\"commonNum\":1000,\"commonPrice\":1000,\"commonSurplus\":1000,\"createTime\":\"2022-09-21 10:46:19\",\"del\":\"0\",\"endPlace\":\"上海\",\"endTime\":\"2022-09-21 17:03:14\",\"higherNum\":10,\"higherPrice\":10000,\"higherSurplus\":10,\"id\":1,\"isLate\":\"0\",\"name\":\"123\",\"params\":{},\"planType\":\"0\",\"remark\":\"\",\"startPlace\":\"北京\",\"startTime\":\"2022-09-21 02:02:02\",\"type\":\"0\",\"updateBy\":\"root\",\"updateTime\":\"2022-11-02T08:48:43.353+08:00\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-02 08:48:43');
INSERT INTO `sys_oper_log` VALUES (435, '订单信息', 1, 'com.ruoyi.ticket.controller.TicketOrderInfoController.add()', 'POST', 1, 'user1', NULL, '/orderm', '127.0.0.1', '', '{\"buyNum\":1,\"code\":\"JO-2022-09-21-0103\",\"commonNum\":100,\"commonPrice\":150,\"commonSurplus\":100,\"createBy\":\"admin\",\"createTime\":\"2022-09-21 17:35:13\",\"del\":\"0\",\"endPlace\":\"北京\",\"endTime\":\"2022-09-24 00:00:00\",\"higherNum\":100,\"higherPrice\":300,\"higherSurplus\":100,\"id\":3,\"isLate\":\"0\",\"name\":\"蕉♂航-测试航班2\",\"params\":{},\"planType\":\"1\",\"seatLevel\":\"1\",\"startPlace\":\"合肥\",\"startTime\":\"2022-09-21 06:00:00\",\"type\":\"0\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-21 17:49:45\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-02 08:54:52');
INSERT INTO `sys_oper_log` VALUES (436, '订单信息', 2, 'com.ruoyi.ticket.controller.TicketOrderInfoController.pay()', 'PUT', 1, 'user1', NULL, '/orderm/pay/52', '127.0.0.1', '', '52', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2022-11-02 08:55:19');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-09-20 14:17:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-09-20 14:17:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-09-20 14:17:53', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通管理员', 'common', 2, '4', 1, 1, '0', '0', 'admin', '2022-09-20 14:17:53', 'admin', '2022-11-01 10:39:09', '普通管理员');
INSERT INTO `sys_role` VALUES (100, '普通客户', 'user', 3, '5', 1, 1, '0', '0', 'admin', '2022-09-21 21:17:39', 'admin', '2022-10-14 18:29:38', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2006);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (2, 2018);
INSERT INTO `sys_role_menu` VALUES (2, 2019);
INSERT INTO `sys_role_menu` VALUES (2, 2020);
INSERT INTO `sys_role_menu` VALUES (2, 2021);
INSERT INTO `sys_role_menu` VALUES (2, 2026);
INSERT INTO `sys_role_menu` VALUES (2, 2027);
INSERT INTO `sys_role_menu` VALUES (2, 2028);
INSERT INTO `sys_role_menu` VALUES (2, 2029);
INSERT INTO `sys_role_menu` VALUES (2, 2030);
INSERT INTO `sys_role_menu` VALUES (2, 2031);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (100, 2000);
INSERT INTO `sys_role_menu` VALUES (100, 2003);
INSERT INTO `sys_role_menu` VALUES (100, 2005);
INSERT INTO `sys_role_menu` VALUES (100, 2012);
INSERT INTO `sys_role_menu` VALUES (100, 2013);
INSERT INTO `sys_role_menu` VALUES (100, 2016);
INSERT INTO `sys_role_menu` VALUES (100, 2022);
INSERT INTO `sys_role_menu` VALUES (100, 2023);
INSERT INTO `sys_role_menu` VALUES (100, 2025);
INSERT INTO `sys_role_menu` VALUES (100, 2032);
INSERT INTO `sys_role_menu` VALUES (100, 2033);
INSERT INTO `sys_role_menu` VALUES (100, 2036);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 104 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '超级管理员', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-09-20 14:17:53', 'admin', '2022-09-20 14:17:53', '', '2022-09-20 18:16:37', '管理员');
INSERT INTO `sys_user` VALUES (2, 103, 'root', '管理员', '00', '', '', '0', '', '$2a$10$OheBUL3XxDBm3siSvWKXiOByFAgz6vji6IU/8VWA4XxiXYfWwaMm6', '0', '0', '127.0.0.1', '2022-09-20 14:17:53', 'admin', '2022-09-20 14:17:53', 'admin', '2022-09-22 19:43:00', '管理员');
INSERT INTO `sys_user` VALUES (100, 105, 'user1', '客户1', '00', '123456@qq.com', '15846894511', '0', '', '$2a$10$Rni/eDrpMDwUjE0WLI32ROky.7ZA9qYn/72RNKM.EMNWtuJq0O7lS', '0', '0', '', NULL, '', '2022-09-20 14:38:16', 'root', '2022-10-11 13:55:47', NULL);
INSERT INTO `sys_user` VALUES (101, 105, 'user2', '客户2', '00', '148181@qq.com', '17328282828', '0', '', '$2a$10$ZWXCRvBVyZ1GpHv74JgZCOaGXbWOOdDP0V.VLtz.L6GAuT/zXuW96', '0', '0', '', NULL, 'admin', '2022-09-22 19:44:18', '', '2022-11-01 10:43:16', NULL);
INSERT INTO `sys_user` VALUES (102, 105, 'user3', 'user3', '00', '', '', '0', '', '$2a$10$LP1BgcjAMS4y9VubcMF2jOfnttb8N3KGxutUa8dg88mFoSfoSYNzS', '0', '0', '', NULL, '', '2022-09-22 20:29:14', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (103, 105, 'user4', 'user4', '00', '', '', '0', '', '$2a$10$x3a2mFxs6iu/HpKIKGzIius7KFaDuuWSQpesO4av3.gpKHconZd.2', '0', '0', '', NULL, '', '2022-09-23 10:36:51', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (104, 105, 'user5', 'user5', '00', '', '', '0', '', '$2a$10$0NxuzdFJMT2UIRe4hNmZ5.cyAleQOIVqfwpPs7YJ7bKouCtNSjd/a', '0', '0', '', NULL, '', '2022-09-23 21:13:24', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (100, 100);
INSERT INTO `sys_user_role` VALUES (101, 100);
INSERT INTO `sys_user_role` VALUES (102, 100);
INSERT INTO `sys_user_role` VALUES (103, 100);
INSERT INTO `sys_user_role` VALUES (104, 100);

-- ----------------------------
-- Table structure for ticket_flight_info
-- ----------------------------
DROP TABLE IF EXISTS `ticket_flight_info`;
CREATE TABLE `ticket_flight_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '航班编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '航班名称',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '航班类型（0国内航班、1国际航班）',
  `start_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '出发地',
  `end_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目的地',
  `plan_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机型',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '起飞时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '降落时间',
  `common_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '经济舱票价',
  `higher_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '头等舱票价',
  `common_num` int(0) NULL DEFAULT NULL COMMENT '经济舱总票数',
  `higher_num` int(0) NULL DEFAULT NULL COMMENT '头等舱总票数',
  `common_surplus` int(0) NULL DEFAULT NULL COMMENT '经济舱剩余票数',
  `higher_surplus` int(0) NULL DEFAULT NULL COMMENT '头等舱剩余票数',
  `is_late` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '是否晚点(0正常1晚点)',
  `del` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除状态(默认0删除1)',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '航班信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_flight_info
-- ----------------------------
INSERT INTO `ticket_flight_info` VALUES (1, '132', '123', '0', '北京', '上海', '0', '2022-09-21 02:02:02', '2022-09-21 17:03:14', 1000.00, 10000.00, 1000, 10, 1000, 10, '0', '0', NULL, '2022-09-21 10:46:19', 'root', '2022-11-02 08:48:43', '');
INSERT INTO `ticket_flight_info` VALUES (2, '0001', '测试航班1', '1', '北京', '纽约', '1', '2022-09-22 00:00:00', '2022-09-23 00:00:00', 1024.00, 10240.00, 100, 20, 100, 20, '0', '0', 'admin', '2022-09-21 17:21:15', 'admin', '2022-09-21 17:24:59', NULL);
INSERT INTO `ticket_flight_info` VALUES (3, 'JO-2022-09-21-0103', '蕉♂航-测试航班2', '0', '合肥', '北京', '1', '2022-09-21 06:00:00', '2022-09-24 00:00:00', 150.00, 300.00, 100, 100, 100, 99, '0', '0', 'admin', '2022-09-21 17:35:13', 'admin', '2022-09-21 17:49:45', NULL);
INSERT INTO `ticket_flight_info` VALUES (4, 'JO-2022-09-23-666666', '蕉♂航-测试航班3', '0', '上海', '西藏', '0', '2022-09-14 13:06:12', '2022-09-24 00:00:00', 100.00, 1000.00, 10, 10, 10, 10, '0', '1', 'admin', '2022-09-23 21:24:00', NULL, NULL, NULL);
INSERT INTO `ticket_flight_info` VALUES (5, 'JO-2022-10-13-111', '蕉♂航-111', '0', '北京', '上海', '0', '2022-10-01 00:00:00', '2022-10-13 15:41:16', 100.00, 200.00, 20, 10, 20, 10, '0', '0', 'admin', '2022-10-13 15:41:18', NULL, NULL, NULL);
INSERT INTO `ticket_flight_info` VALUES (6, 'JO-2022-10-15-111', '蕉♂航-111', '0', '北京', '上海', '0', '2022-10-12 02:00:00', '2022-10-15 19:54:20', 100.00, 200.00, 20, 10, 20, 10, '0', '0', 'admin', '2022-10-15 19:54:22', NULL, NULL, NULL);
INSERT INTO `ticket_flight_info` VALUES (7, 'JO-2022-10-15-222', '蕉♂航-222', '0', '合肥', '北京', '1', '2022-10-12 02:00:00', '2022-10-15 19:54:20', 100.00, 1000.00, 50, 20, 50, 20, '0', '0', 'admin', '2022-10-15 19:54:22', NULL, NULL, NULL);
INSERT INTO `ticket_flight_info` VALUES (8, 'JO-2022-11-01-333', '蕉♂航-333', '0', '北京', '南京', '1', '2022-11-01 08:00:00', '2022-11-02 11:00:00', 500.00, 1000.00, 20, 10, 20, 10, '0', '0', 'root', '2022-11-01 10:35:22', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ticket_order_info
-- ----------------------------
DROP TABLE IF EXISTS `ticket_order_info`;
CREATE TABLE `ticket_order_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '航班名称',
  `routes` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '航线',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '起飞时间',
  `buy_time` datetime(0) NULL DEFAULT NULL COMMENT '订购日期',
  `buy_num` int(0) NULL DEFAULT NULL COMMENT '订购数量',
  `flight_id` int(0) NULL DEFAULT NULL COMMENT '航班主键',
  `seat_level` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '舱位等级（0经济舱1头等舱）',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '票价',
  `all_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `payment_status` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '付款状态（0未付款1已付款）',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '客户id',
  `del` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除状态(默认0删除1)',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_order_info
-- ----------------------------
INSERT INTO `ticket_order_info` VALUES (1, '蕉♂航-20220921203026-0', '123', '北京-上海', '2022-09-21 02:02:02', '2022-09-21 20:30:26', 5, 1, '0', 1000.00, 5000.00, NULL, 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (2, '蕉♂航-20220921205124-1', '测试航班1', '北京-纽约', '2022-09-22 00:00:00', '2022-09-21 20:51:25', 10, 2, '1', 10240.00, 102400.00, NULL, 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (3, '蕉♂航-20220921205600-1', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-09-21 20:56:01', 3, 3, '1', 300.00, 900.00, NULL, 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (4, '蕉♂航-20220921205958-1', '测试航班1', '北京-纽约', '2022-09-22 00:00:00', '2022-09-21 20:59:59', 1, 2, '1', 10240.00, 10240.00, NULL, 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (5, '蕉♂航-20220921211207-0', '测试航班1', '北京-纽约', '2022-09-22 00:00:00', '2022-09-21 21:12:08', 12, 2, '0', 1024.00, 12288.00, NULL, 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (6, '蕉♂航-20220921213858-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-09-21 21:38:58', 10, 1, '1', 10000.00, 100000.00, NULL, 100, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (7, '蕉♂航-20220922182441-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-09-22 18:24:42', 10, 1, '1', 10000.00, 100000.00, NULL, 100, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (8, '蕉♂航-20220922192125-0', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-09-22 19:21:25', 10, 3, '0', 150.00, 1500.00, NULL, 100, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (9, '蕉♂航-20220922192343-0', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-09-22 19:23:43', 1, 3, '0', 150.00, 150.00, NULL, 100, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (10, '蕉♂航-20220922203718-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-09-22 20:37:18', 3, 1, '1', 10000.00, 30000.00, NULL, 100, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (11, '蕉♂航-20220923210543-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-09-23 21:05:43', 7, 1, '1', 10000.00, 70000.00, NULL, 100, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (12, '蕉♂航-20220923210836-0', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-09-23 21:08:37', 10, 3, '0', 150.00, 1500.00, NULL, 101, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (13, '蕉♂航-20220923210921-1', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-09-23 21:09:21', 20, 3, '1', 300.00, 6000.00, NULL, 101, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (14, '蕉♂航-20221010105317-1', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-10-10 10:53:17', 10, 3, '1', 300.00, 3000.00, '0', 101, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (15, '蕉♂航-20221011153058-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-11 15:30:59', 2, 1, '1', 10000.00, 20000.00, '0', 100, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (16, '蕉♂航-20221012110104-0', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-12 11:01:04', 1, 1, '0', 1000.00, 1000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (17, '蕉♂航-20221014143237-1', '蕉♂航-111', '北京-上海', '2022-10-01 00:00:00', '2022-10-14 14:32:38', 10, 5, '1', 200.00, 2000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (18, '蕉♂航-20221014152001-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:20:01', 8, 1, '1', 10000.00, 80000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (19, '蕉♂航-20221014152114-0', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:21:14', 1, 1, '0', 1000.00, 1000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (20, '蕉♂航-20221014152648-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:26:49', 4, 1, '1', 10000.00, 40000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (21, '蕉♂航-20221014152705-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:27:05', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (22, '蕉♂航-20221014152958-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:29:58', 3, 1, '1', 10000.00, 30000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (23, '蕉♂航-20221014153411-1', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-10-14 15:34:12', 1, 3, '1', 300.00, 300.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (24, '蕉♂航-20221014153441-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:34:41', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (25, '蕉♂航-20221014153748-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:37:48', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (26, '蕉♂航-20221014153759-1', '蕉♂航-111', '北京-上海', '2022-10-01 00:00:00', '2022-10-14 15:37:59', 1, 5, '1', 200.00, 200.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (27, '蕉♂航-20221014153959-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:40:00', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (28, '蕉♂航-20221014154105-1', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-10-14 15:41:06', 1, 3, '1', 300.00, 300.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (29, '蕉♂航-20221014154141-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:41:41', 9, 1, '1', 10000.00, 90000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (30, '蕉♂航-20221014154154-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:41:55', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (31, '蕉♂航-20221014154224-1', '测试航班1', '北京-纽约', '2022-09-22 00:00:00', '2022-10-14 15:42:24', 4, 2, '1', 10240.00, 40960.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (32, '蕉♂航-20221014154302-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:43:02', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (33, '蕉♂航-20221014154756-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:47:57', 3, 1, '1', 10000.00, 30000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (34, '蕉♂航-20221014154808-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:48:09', 5, 1, '1', 10000.00, 50000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (35, '蕉♂航-20221014154833-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:48:33', 3, 1, '1', 10000.00, 30000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (36, '蕉♂航-20221014154924-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:49:24', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (37, '蕉♂航-20221014154935-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:49:35', 3, 1, '1', 10000.00, 30000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (38, '蕉♂航-20221014171406-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 17:14:07', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (39, '蕉♂航-20221014174252-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 17:42:53', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (40, '蕉♂航-20221014174728-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 17:47:29', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (41, '蕉♂航-20221014174742-1', '测试航班1', '北京-纽约', '2022-09-22 00:00:00', '2022-10-14 17:47:42', 1, 2, '1', 10240.00, 10240.00, '1', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (42, '蕉♂航-20221014180833-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:08:33', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (43, '蕉♂航-20221014180854-1', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-10-14 18:08:54', 1, 3, '1', 300.00, 300.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (44, '蕉♂航-20221014180916-1', '蕉♂航-111', '北京-上海', '2022-10-01 00:00:00', '2022-10-14 18:09:17', 1, 5, '1', 200.00, 200.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (45, '蕉♂航-20221014181038-0', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:10:38', 1, 1, '0', 1000.00, 1000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (46, '蕉♂航-20221014182438-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:24:39', 1, 1, '1', 10000.00, 10000.00, '0', 1, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (47, '蕉♂航-20221014182848-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:28:49', 1, 1, '1', 10000.00, 10000.00, '0', 100, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (48, '蕉♂航-20221014183306-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:33:07', 1, 1, '1', 10000.00, 10000.00, '1', 100, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (49, '蕉♂航-20221014183725-1', '测试航班1', '北京-纽约', '2022-09-22 00:00:00', '2022-10-14 18:37:25', 3, 2, '1', 10240.00, 30720.00, '1', 100, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (50, '蕉♂航-20221101104205-0', '蕉♂航-333', '北京-南京', '2022-11-01 08:00:00', '2022-11-01 10:42:06', 5, 8, '0', 500.00, 2500.00, '0', 101, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (51, '蕉♂航-20221101104414-1', '蕉♂航-111', '北京-上海', '2022-10-12 02:00:00', '2022-11-01 10:44:14', 1, 6, '1', 200.00, 200.00, '1', 101, '1', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `ticket_order_info` VALUES (52, '蕉♂航-20221102085452-1', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-11-02 08:54:52', 1, 3, '1', 300.00, 300.00, '1', 100, '0', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ticket_order_record
-- ----------------------------
DROP TABLE IF EXISTS `ticket_order_record`;
CREATE TABLE `ticket_order_record`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `order_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '类型(0订票1改签2退票)',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '订单号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '航班名称',
  `routes` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '航线',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '起飞时间',
  `buy_time` datetime(0) NULL DEFAULT NULL COMMENT '订购日期',
  `buy_num` int(0) NULL DEFAULT NULL COMMENT '订购数量',
  `seat_level` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '舱位等级（0经济舱1头等舱）',
  `all_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '总价',
  `user_id` int(0) NULL DEFAULT NULL COMMENT '客户id',
  `del` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除状态（默认0删除1）',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '订单记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_order_record
-- ----------------------------
INSERT INTO `ticket_order_record` VALUES (1, '0', '蕉♂航-20221014171406-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 17:14:07', 1, '1', 10000.00, 1, '1', NULL, '2022-10-14 17:14:07', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (2, '0', '蕉♂航-20221014174252-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 17:42:53', 1, '1', 10000.00, 1, '1', NULL, '2022-10-14 17:42:53', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (3, '2', '蕉♂航-20221014154935-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 15:49:35', 3, '1', 30000.00, 1, '1', NULL, '2022-10-14 17:43:05', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (4, '2', '蕉♂航-20221014171406-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 17:14:07', 1, '1', 10000.00, 1, '1', NULL, '2022-10-14 17:43:37', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (5, '2', '蕉♂航-20221014174252-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 17:42:53', 1, '1', 10000.00, 1, '1', NULL, '2022-10-14 17:43:37', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (6, '0', '蕉♂航-20221014174728-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 17:47:29', 1, '1', 10000.00, 1, '1', NULL, '2022-10-14 17:47:29', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (7, '0', '蕉♂航-20221014174742-1', '测试航班1', '北京-纽约', '2022-09-22 00:00:00', '2022-10-14 17:47:42', 1, '1', 10240.00, 1, '1', NULL, '2022-10-14 17:47:42', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (8, '2', '蕉♂航-20221014174728-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 17:47:29', 1, '1', 10000.00, 1, '1', NULL, '2022-10-14 17:47:42', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (9, '0', '蕉♂航-20221014180833-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:08:33', 1, '1', 10000.00, 1, '1', NULL, '2022-10-14 18:08:33', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (10, '0', '蕉♂航-20221014180854-1', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-10-14 18:08:54', 1, '1', 300.00, 1, '1', NULL, '2022-10-14 18:08:54', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (11, '1', '蕉♂航-20221014180916-1', '蕉♂航-111', '北京-上海', '2022-10-01 00:00:00', '2022-10-14 18:09:17', 1, '1', 200.00, 1, '1', NULL, '2022-10-14 18:09:17', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (12, '2', '蕉♂航-20221014180833-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:08:33', 1, '1', 10000.00, 1, '1', NULL, '2022-10-14 18:09:43', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (13, '2', '蕉♂航-20221014180854-1', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-10-14 18:08:54', 1, '1', 300.00, 1, '1', NULL, '2022-10-14 18:09:53', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (14, '1', '蕉♂航-20221014181038-0', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:10:38', 1, '0', 1000.00, 1, '1', NULL, '2022-10-14 18:10:38', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (15, '2', '蕉♂航-20221014181038-0', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:10:38', 1, '0', 1000.00, 1, '1', NULL, '2022-10-14 18:10:56', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (16, '0', '蕉♂航-20221014182438-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:24:39', 1, '1', 10000.00, 1, '1', NULL, '2022-10-14 18:24:39', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (17, '0', '蕉♂航-20221014182848-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:28:49', 1, '1', 10000.00, 100, '0', NULL, '2022-10-14 18:28:49', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (18, '2', '蕉♂航-20221014182848-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:28:49', 1, '1', 10000.00, 100, '0', NULL, '2022-10-14 18:29:03', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (19, '2', '蕉♂航-20221014182438-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:24:39', 1, '1', 10000.00, 1, '1', NULL, '2022-10-14 18:32:36', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (20, '0', '蕉♂航-20221014183306-1', '123', '北京-上海', '2022-09-21 02:02:02', '2022-10-14 18:33:07', 1, '1', 10000.00, 100, '0', NULL, '2022-10-14 18:33:07', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (21, '1', '蕉♂航-20221014183725-1', '测试航班1', '北京-纽约', '2022-09-22 00:00:00', '2022-10-14 18:37:25', 3, '1', 30720.00, 100, '0', NULL, '2022-10-14 18:37:25', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (22, '0', '蕉♂航-20221101104205-0', '蕉♂航-333', '北京-南京', '2022-11-01 08:00:00', '2022-11-01 10:42:06', 5, '0', 2500.00, 101, '0', NULL, '2022-11-01 10:42:06', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (23, '1', '蕉♂航-20221101104414-1', '蕉♂航-111', '北京-上海', '2022-10-12 02:00:00', '2022-11-01 10:44:14', 1, '1', 200.00, 101, '0', NULL, '2022-11-01 10:44:14', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (24, '2', '蕉♂航-20221101104414-1', '蕉♂航-111', '北京-上海', '2022-10-12 02:00:00', '2022-11-01 10:44:14', 1, '1', 200.00, 101, '0', NULL, '2022-11-01 10:44:39', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (25, '2', '蕉♂航-20221014183725-1', '测试航班1', '北京-纽约', '2022-09-22 00:00:00', '2022-10-14 18:37:25', 3, '1', 30720.00, 100, '0', NULL, '2022-11-02 08:40:55', NULL, NULL, NULL);
INSERT INTO `ticket_order_record` VALUES (26, '0', '蕉♂航-20221102085452-1', '蕉♂航-测试航班2', '合肥-北京', '2022-09-21 06:00:00', '2022-11-02 08:54:52', 1, '1', 300.00, 100, '0', NULL, '2022-11-02 08:54:52', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for ticket_payment
-- ----------------------------
DROP TABLE IF EXISTS `ticket_payment`;
CREATE TABLE `ticket_payment`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '航班编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '航班名称',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '航班类型（0国内航班、1国际航班）',
  `start_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '出发地',
  `end_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '目的地',
  `plan_type` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '机型',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '起飞时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '降落时间',
  `common_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '经济舱票价',
  `higher_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '头等舱票价',
  `common_num` int(0) NULL DEFAULT NULL COMMENT '经济舱总票数',
  `higher_num` int(0) NULL DEFAULT NULL COMMENT '头等舱总票数',
  `common_surplus` int(0) NULL DEFAULT NULL COMMENT '经济舱剩余票数',
  `higher_surplus` int(0) NULL DEFAULT NULL COMMENT '头等舱剩余票数',
  `del` char(1) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT '0' COMMENT '删除状态(默认0删除1)',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(3000) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_bin COMMENT = '制定航班表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_payment
-- ----------------------------
INSERT INTO `ticket_payment` VALUES (5, '111', '111', '0', '北京', '上海', '0', NULL, NULL, 100.00, 200.00, 20, 10, NULL, NULL, '0', NULL, '2022-10-12 12:04:37', NULL, NULL, NULL);
INSERT INTO `ticket_payment` VALUES (6, '222', '222', '0', '合肥', '北京', '1', NULL, NULL, 100.00, 1000.00, 50, 20, NULL, NULL, '0', NULL, '2022-10-13 14:25:12', NULL, NULL, NULL);
INSERT INTO `ticket_payment` VALUES (7, '333', '333', '0', '北京', '南京', '1', NULL, NULL, 500.00, 1000.00, 20, 10, NULL, NULL, '0', NULL, '2022-11-01 10:35:00', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
