/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80300
 Source Host           : localhost:3306
 Source Schema         : link

 Target Server Type    : MySQL
 Target Server Version : 80300
 File Encoding         : 65001

 Date: 09/08/2024 15:39:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_group_0
-- ----------------------------
DROP TABLE IF EXISTS `t_group_0`;
CREATE TABLE `t_group_0`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_1
-- ----------------------------
DROP TABLE IF EXISTS `t_group_1`;
CREATE TABLE `t_group_1`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_10
-- ----------------------------
DROP TABLE IF EXISTS `t_group_10`;
CREATE TABLE `t_group_10`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1792025678745559042 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_11
-- ----------------------------
DROP TABLE IF EXISTS `t_group_11`;
CREATE TABLE `t_group_11`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_12
-- ----------------------------
DROP TABLE IF EXISTS `t_group_12`;
CREATE TABLE `t_group_12`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_13
-- ----------------------------
DROP TABLE IF EXISTS `t_group_13`;
CREATE TABLE `t_group_13`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1810635395394719746 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_group_13
-- ----------------------------
INSERT INTO `t_group_13` VALUES (1804427526563532802, 'yRGcVO', '默认分组', 'tomoyo', 0, '2024-06-22 16:13:42', '2024-07-09 19:21:35', 0);
INSERT INTO `t_group_13` VALUES (1805120686893617153, 'aeeJEn', '美好回忆', 'tomoyo', 1, '2024-06-24 14:08:04', '2024-07-09 19:21:35', 0);
INSERT INTO `t_group_13` VALUES (1805125763855380481, 'vG6UQn', '释放', 'tomoyo', 2, '2024-06-24 14:28:14', '2024-07-09 19:21:35', 0);
INSERT INTO `t_group_13` VALUES (1810607280408870914, 'Pug0LA', '我爱你', 'tomoyo', 3, '2024-07-09 17:29:50', '2024-07-09 19:16:43', 1);
INSERT INTO `t_group_13` VALUES (1810634256666349570, '9meCAm', '收拾收拾出', 'tomoyo', 0, '2024-07-09 19:17:01', '2024-07-09 19:17:22', 1);
INSERT INTO `t_group_13` VALUES (1810635395394719746, 'o4l4da', '哈哈哈哈233', 'tomoyo', 3, '2024-07-09 19:21:33', '2024-07-09 19:21:43', 0);

-- ----------------------------
-- Table structure for t_group_14
-- ----------------------------
DROP TABLE IF EXISTS `t_group_14`;
CREATE TABLE `t_group_14`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_15
-- ----------------------------
DROP TABLE IF EXISTS `t_group_15`;
CREATE TABLE `t_group_15`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_2
-- ----------------------------
DROP TABLE IF EXISTS `t_group_2`;
CREATE TABLE `t_group_2`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_3
-- ----------------------------
DROP TABLE IF EXISTS `t_group_3`;
CREATE TABLE `t_group_3`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_4
-- ----------------------------
DROP TABLE IF EXISTS `t_group_4`;
CREATE TABLE `t_group_4`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_5
-- ----------------------------
DROP TABLE IF EXISTS `t_group_5`;
CREATE TABLE `t_group_5`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_6
-- ----------------------------
DROP TABLE IF EXISTS `t_group_6`;
CREATE TABLE `t_group_6`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_7
-- ----------------------------
DROP TABLE IF EXISTS `t_group_7`;
CREATE TABLE `t_group_7`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_8
-- ----------------------------
DROP TABLE IF EXISTS `t_group_8`;
CREATE TABLE `t_group_8`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_group_9
-- ----------------------------
DROP TABLE IF EXISTS `t_group_9`;
CREATE TABLE `t_group_9`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组名称',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建分组用户名',
  `sort_order` int(0) NULL DEFAULT NULL COMMENT '分组排序',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_gid_username`(`gid`, `username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_0
-- ----------------------------
DROP TABLE IF EXISTS `t_link_0`;
CREATE TABLE `t_link_0`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1806509693758205954 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_0
-- ----------------------------
INSERT INTO `t_link_0` VALUES (1806509693758205954, 'ZVaDd5', 'nurl.ink', '4C6Gn9', 'nurl.ink/4C6Gn9', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/512.png', 'https://www.bilibili.com/', NULL, 0, 0, 0, NULL, '', '2024-06-28 10:07:29', '2024-06-28 10:07:29', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for t_link_1
-- ----------------------------
DROP TABLE IF EXISTS `t_link_1`;
CREATE TABLE `t_link_1`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1817400919357153282 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_1
-- ----------------------------
INSERT INTO `t_link_1` VALUES (1817400487989866497, 'siCwZo', 'nurl.ink', '4COX0W', 'nurl.ink/4COX0W', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:23:37', '2024-07-28 11:23:37', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400487989866499, 'siCwZo', 'nurl.ink', '2ZWUI9', 'nurl.ink/2ZWUI9', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:23:37', '2024-07-28 11:23:37', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911346032642, 'siCwZo', 'nurl.ink', '1T48Zi', 'nurl.ink/1T48Zi', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911346032643, 'siCwZo', 'nurl.ink', '3hYtor', 'nurl.ink/3hYtor', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911346032654, 'siCwZo', 'nurl.ink', '3AgNEO', 'nurl.ink/3AgNEO', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911346032655, 'siCwZo', 'nurl.ink', '49BGz1', 'nurl.ink/49BGz1', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911346032656, 'siCwZo', 'nurl.ink', '1a6to5', 'nurl.ink/1a6to5', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911346032657, 'siCwZo', 'nurl.ink', '3wGf3s', 'nurl.ink/3wGf3s', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911346032676, 'siCwZo', 'nurl.ink', 'kBr9E', 'nurl.ink/kBr9E', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004162, 'siCwZo', 'nurl.ink', '482c2R', 'nurl.ink/482c2R', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004163, 'siCwZo', 'nurl.ink', '1joGE7', 'nurl.ink/1joGE7', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004174, 'siCwZo', 'nurl.ink', '3AIhrM', 'nurl.ink/3AIhrM', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004178, 'siCwZo', 'nurl.ink', '2THIbJ', 'nurl.ink/2THIbJ', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004179, 'siCwZo', 'nurl.ink', 'cbvhw', 'nurl.ink/cbvhw', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004180, 'siCwZo', 'nurl.ink', 'BuxIp', 'nurl.ink/BuxIp', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004181, 'siCwZo', 'nurl.ink', '1NMUA', 'nurl.ink/1NMUA', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004182, 'siCwZo', 'nurl.ink', '1nqDPL', 'nurl.ink/1nqDPL', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004183, 'siCwZo', 'nurl.ink', 'hj0CE', 'nurl.ink/hj0CE', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004184, 'siCwZo', 'nurl.ink', '3GJtcG', 'nurl.ink/3GJtcG', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911367004185, 'siCwZo', 'nurl.ink', '4IJwC1', 'nurl.ink/4IJwC1', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911371198466, 'siCwZo', 'nurl.ink', '1Zccmj', 'nurl.ink/1Zccmj', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911371198467, 'siCwZo', 'nurl.ink', 'boSm3', 'nurl.ink/boSm3', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911371198468, 'siCwZo', 'nurl.ink', 'GfZg2', 'nurl.ink/GfZg2', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911371198469, 'siCwZo', 'nurl.ink', '2O9MOW', 'nurl.ink/2O9MOW', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911371198470, 'siCwZo', 'nurl.ink', '4HLdQn', 'nurl.ink/4HLdQn', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911371198471, 'siCwZo', 'nurl.ink', '3fa0av', 'nurl.ink/3fa0av', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911413141505, 'siCwZo', 'nurl.ink', '2lzLy0', 'nurl.ink/2lzLy0', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911568330754, 'siCwZo', 'nurl.ink', 'BHbzn', 'nurl.ink/BHbzn', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911576719362, 'siCwZo', 'nurl.ink', '13n4T5', 'nurl.ink/13n4T5', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911597690883, 'siCwZo', 'nurl.ink', '3CcHZw', 'nurl.ink/3CcHZw', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400911895486465, 'siCwZo', 'nurl.ink', 'Ac4m0', 'nurl.ink/Ac4m0', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400912121978881, 'siCwZo', 'nurl.ink', '4R4zyN', 'nurl.ink/4R4zyN', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400912184893442, 'siCwZo', 'nurl.ink', '2mLt5X', 'nurl.ink/2mLt5X', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400912457523202, 'siCwZo', 'nurl.ink', '3Vfmxs', 'nurl.ink/3Vfmxs', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400912520437762, 'siCwZo', 'nurl.ink', '1FMl1h', 'nurl.ink/1FMl1h', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400913220886530, 'siCwZo', 'nurl.ink', '44NQ5n', 'nurl.ink/44NQ5n', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400913304772610, 'siCwZo', 'nurl.ink', '4mEMR', 'nurl.ink/4mEMR', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400913438990337, 'siCwZo', 'nurl.ink', '1iEYT2', 'nurl.ink/1iEYT2', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400913438990338, 'siCwZo', 'nurl.ink', '2dv225', 'nurl.ink/2dv225', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400913518682114, 'siCwZo', 'nurl.ink', '3Rc3op', 'nurl.ink/3Rc3op', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400913694842882, 'siCwZo', 'nurl.ink', '83SA1', 'nurl.ink/83SA1', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400913900363778, 'siCwZo', 'nurl.ink', '2kmFDq', 'nurl.ink/2kmFDq', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:18', '2024-07-28 11:25:18', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400917385830402, 'siCwZo', 'nurl.ink', '34Fg2c', 'nurl.ink/34Fg2c', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:19', '2024-07-28 11:25:19', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400917394219010, 'siCwZo', 'nurl.ink', '3rfNAl', 'nurl.ink/3rfNAl', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:19', '2024-07-28 11:25:19', 0, 0, 0, 0);
INSERT INTO `t_link_1` VALUES (1817400917402607618, 'siCwZo', 'nurl.ink', '1FdGv0', 'nurl.ink/1FdGv0', 'https://nageoffer.com/img/logo6.png', 'https://nageoffer.com/', NULL, 0, 1, 0, NULL, 'consequat quis nisi nulla', '2024-07-28 11:25:19', '2024-07-28 11:25:19', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for t_link_10
-- ----------------------------
DROP TABLE IF EXISTS `t_link_10`;
CREATE TABLE `t_link_10`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_11
-- ----------------------------
DROP TABLE IF EXISTS `t_link_11`;
CREATE TABLE `t_link_11`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_12
-- ----------------------------
DROP TABLE IF EXISTS `t_link_12`;
CREATE TABLE `t_link_12`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1792016306996862978 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_13
-- ----------------------------
DROP TABLE IF EXISTS `t_link_13`;
CREATE TABLE `t_link_13`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_14
-- ----------------------------
DROP TABLE IF EXISTS `t_link_14`;
CREATE TABLE `t_link_14`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1810634574456279042 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_14
-- ----------------------------
INSERT INTO `t_link_14` VALUES (1805125502483099650, 'aeeJEn', 'nurl.ink', '1A6JZu', 'nurl.ink/1A6JZu', 'https://www.baidu.com/favicon.ico', 'https://www.baidu.com/', NULL, 1, 1, 0, NULL, '百度一下，你就知道', '2024-06-24 14:27:12', '2024-07-09 19:17:44', 1, 0, 0, 0);
INSERT INTO `t_link_14` VALUES (1810634327214641154, '9meCAm', 'nurl.ink', 'Wz2Vn', 'nurl.ink/Wz2Vn', 'https://www.baidu.com/favicon.ico', 'https://www.baidu.com/', NULL, 0, 1, 0, NULL, '百度一下，你就知道', '2024-07-09 19:17:18', '2024-07-09 19:17:18', 0, 0, 0, 0);
INSERT INTO `t_link_14` VALUES (1810634574456279042, 'aeeJEn', 'nurl.ink', '1Gbkiy', 'nurl.ink/1Gbkiy', 'https://www.baidu.com/favicon.ico', 'https://www.baidu.com/', NULL, 0, 1, 0, NULL, '百度一下，你就知道', '2024-07-09 19:18:17', '2024-07-09 19:18:17', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for t_link_15
-- ----------------------------
DROP TABLE IF EXISTS `t_link_15`;
CREATE TABLE `t_link_15`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_2
-- ----------------------------
DROP TABLE IF EXISTS `t_link_2`;
CREATE TABLE `t_link_2`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1818302225374543873 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_2
-- ----------------------------
INSERT INTO `t_link_2` VALUES (1804430150289350657, 'yRGcVO', 'nurl.ink', '1igHsq', 'nurl.ink/1igHsq', NULL, 'https://www.bilibili.com/video/BV1gY4y1h7em', NULL, 0, 1, 0, NULL, '【雫るる】姐姐的first love_哔哩哔哩_bilibili', '2024-06-22 16:24:07', '2024-06-22 16:24:07', 0, 4, 2, 1);
INSERT INTO `t_link_2` VALUES (1804431441048670209, 'yRGcVO', 'nurl.ink', '47LHFj', 'nurl.ink/47LHFj', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV1gY4y1h7em', NULL, 1, 1, 0, NULL, '【雫るる】姐姐的first love_哔哩哔哩_bilibili', '2024-06-22 16:29:15', '2024-06-24 15:00:59', 0, 2, 1, 1);
INSERT INTO `t_link_2` VALUES (1805125024202420225, 'yRGcVO', 'nurl.ink', '3bwx2S', 'nurl.ink/3bwx2S', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/512.png', 'https://www.bilibili.com/', NULL, 0, 1, 0, NULL, '哔哩哔哩 (゜-゜)つロ 干杯~-bilibili2', '2024-06-24 14:25:18', '2024-07-09 19:22:04', 0, 4, 1, 1);
INSERT INTO `t_link_2` VALUES (1810180915427643393, 'yRGcVO', 'v.star17.cn', 'AqNc8', 'v.star17.cn/AqNc8', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV15P411V7zz/?spm_id_from=pageDriver&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 1, 1, 0, NULL, '爷青回！【樱桃小丸子】主题曲《大家来跳舞》，你的青春回来啦！_哔哩哔哩_bilibili', '2024-07-08 13:15:36', '2024-07-08 13:16:41', 1, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1810182924818026498, 'yRGcVO', 'v.star17.cn', 'vWtHj', 'v.star17.cn/vWtHj', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV15P411V7zz/?spm_id_from=pageDriver&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 1, 1, 0, NULL, '爷青回！【樱桃小丸子】主题曲《大家来跳舞》，你的青春回来啦！_哔哩哔哩_bilibili', '2024-07-08 13:23:36', '2024-07-08 13:35:52', 1, 1, 1, 1);
INSERT INTO `t_link_2` VALUES (1810186201840324609, 'yRGcVO', 'v.star17.cn', 'bQzqs', 'v.star17.cn/bQzqs', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV1Uv4y197x6/?spm_id_from=333.788&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 1, 1, 0, NULL, 'HIRES 96/24｜一番の宝物 ～Yui Final Ver～. LiSA （DRV重制版）_哔哩哔哩_bilibili', '2024-07-08 13:36:37', '2024-07-08 13:37:01', 1, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1810186504882982913, 'yRGcVO', 'v.star17.cn', '4PjQqu', 'v.star17.cn/4PjQqu', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV1Uv4y197x6/?spm_id_from=333.788&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 1, 1, 0, NULL, 'HIRES 96/24｜一番の宝物 ～Yui Final Ver～. LiSA （DRV重制版）_哔哩哔哩_bilibili', '2024-07-08 13:37:49', '2024-07-08 13:39:39', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1810186744058974209, 'yRGcVO', 'v.star17.cn', '2KRoKB', 'v.star17.cn/2KRoKB', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV1Uv4y197x6/?spm_id_from=333.788&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 1, 1, 0, NULL, 'HIRES 96/24｜一番の宝物 ～Yui Final Ver～. LiSA （DRV重制版）_哔哩哔哩_bilibili', '2024-07-08 13:38:46', '2024-07-08 13:39:38', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1810186932383223810, 'yRGcVO', 'v.star17.cn', '4RpBkQ', 'v.star17.cn/4RpBkQ', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV1Uv4y197x6/?spm_id_from=333.788&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 1, 1, 0, NULL, 'HIRES 96/24｜一番の宝物 ～Yui Final Ver～. LiSA （DRV重制版）_哔哩哔哩_bilibili', '2024-07-08 13:39:31', '2024-07-08 13:39:36', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1810187572551454722, 'yRGcVO', 'nurl.ink', '4DITuN', 'nurl.ink/4DITuN', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV1Uv4y197x6/?spm_id_from=333.788&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 0, 1, 0, NULL, 'HIRES 96/24｜一番の宝物 ～Yui Final Ver～. LiSA （DRV重制版）_哔哩哔哩_bilibili', '2024-07-08 13:42:04', '2024-07-08 13:42:04', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1810190581658390529, 'yRGcVO', 'v.star17.cn', '3n9eZc', 'v.star17.cn/3n9eZc', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV1mU4y1E7bU/?spm_id_from=333.788.recommend_more_video.5&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 1, 1, 0, NULL, 'Wands【4K60帧高清修复字幕版】一定比世界上任何人(世界中の誰よりきっと)_哔哩哔哩_bilibili', '2024-07-08 13:54:01', '2024-07-08 14:03:27', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1810190955014361090, 'yRGcVO', 'v.star17.cn', '2E7oLE', 'v.star17.cn/2E7oLE', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV1mU4y1E7bU/?spm_id_from=333.788.recommend_more_video.5&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 1, 1, 0, NULL, 'Wands【4K60帧高清修复字幕版】一定比世界上任何人(世界中の誰よりきっと)_哔哩哔哩_bilibili', '2024-07-08 13:55:30', '2024-07-08 14:01:25', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1810192054626652162, 'yRGcVO', 'nurl.ink', '4JP9z', 'nurl.ink/4JP9z', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV1mU4y1E7bU/?spm_id_from=333.788.recommend_more_video.5&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 0, 1, 0, NULL, 'Wands【4K60帧高清修复字幕版】一定比世界上任何人(世界中の誰よりきっと)_哔哩哔哩_bilibili', '2024-07-08 13:59:52', '2024-07-08 13:59:52', 0, 6, 1, 1);
INSERT INTO `t_link_2` VALUES (1811421146403422209, 'yRGcVO', 'nurl.ink', '3kezQR', 'nurl.ink/3kezQR', 'https://static.zhihu.com/heifetz/favicon.ico', 'https://www.zhihu.com/question/620875117/answer/3547340461', NULL, 1, 1, 0, NULL, '知乎', '2024-07-11 23:23:51', '2024-07-30 21:15:43', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811421206516187137, 'yRGcVO', 'nurl.ink', 'plBvY', 'nurl.ink/plBvY', 'https://www.bilibili.com/https://i0.hdslb.com/bfs/static/jinkela/long/images/512.png', 'https://www.bilibili.com/', NULL, 1, 1, 0, NULL, '哔哩哔哩 (゜-゜)つロ 干杯~-bilibili', '2024-07-11 23:24:05', '2024-07-30 21:15:41', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811421331120570369, 'yRGcVO', 'nurl.ink', '3OzVWQ', 'nurl.ink/3OzVWQ', 'https://ms.bdstatic.com/se/static/wiseindex/img/favicon64_587c374.ico', 'https://mbd.baidu.com/newspage/data/landingsuper?context=%7B%22nid%22%3A%22news_9227507965778275641%22%7D&n_type=-1&p_from=-1', NULL, 1, 1, 0, NULL, '方法', '2024-07-11 23:24:35', '2024-07-30 21:15:39', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811421439165841409, 'yRGcVO', 'nurl.ink', '4fnmmI', 'nurl.ink/4fnmmI', 'https://g.csdnimg.cn/static/logo/favicon32.ico', 'https://blog.csdn.net/qq_44231797/article/details/121343892', NULL, 1, 1, 0, NULL, 'Java如何快速获取网站图片_java加载网络图片-CSDN博客', '2024-07-11 23:25:00', '2024-07-30 21:15:37', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811421535483838466, 'yRGcVO', 'nurl.ink', '2ifVGr', 'nurl.ink/2ifVGr', 'https://www.mojidict.com/favicon.ico', 'https://www.mojidict.com/reading', NULL, 0, 1, 0, NULL, '阅读 - MOJi辞書', '2024-07-11 23:25:23', '2024-07-11 23:25:23', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811421676009799682, 'yRGcVO', 'nurl.ink', '3yr8g4', 'nurl.ink/3yr8g4', 'https://www.bing.com/sa/simg/favicon-trans-bg-blue-mg-png.png', 'https://www.bing.com/search?pglt=2081&q=%E5%B0%8F%E7%BA%A2%E4%B9%A6&cvid=22cbfb84ded04a51960f18f401a5217f&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIGCAEQABhAMgYIAhAAGEAyBggDEAAYQDIGCAQQABhAMgYIBRAAGEAyBggGEAAYQDIGCAcQRRg9MgYICBBFGD3SAQgxODEzajBqMagCCLACAQ&FORM=ANNTA1&adppc=EdgeStart&PC=NMTS&mkt=zh-CN', NULL, 0, 1, 0, NULL, '必应', '2024-07-11 23:25:57', '2024-07-11 23:25:57', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811421730443476994, 'yRGcVO', 'nurl.ink', 'LBTUi', 'nurl.ink/LBTUi', 'https://www.xiaohongshu.com/favicon.ico', 'https://creator.xiaohongshu.com/login?redirectReason=401', NULL, 0, 1, 0, NULL, '小红书创作服务平台', '2024-07-11 23:26:10', '2024-07-11 23:26:10', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811421870172520450, 'yRGcVO', 'nurl.ink', '4MTk3k', 'nurl.ink/4MTk3k', 'https://www.xiaohongshu.com/https://fe-video-qc.xhscdn.com/fe-platform/ed8fe781ce9e16c1bfac2cd962f0721edabe2e49.ico', 'https://www.xiaohongshu.com/explore/64069f2b00000000130096ba?xsec_token=ABMophdrHqojSQrCPlElAe_Qli_JDXuMkUWTsbIsaKiAY=&xsec_source=pc_feed', NULL, 0, 1, 0, NULL, '完了，我完全被老婆看穿了 - 小红书', '2024-07-11 23:26:43', '2024-07-12 00:03:18', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811424546780200961, 'yRGcVO', 'nurl.ink', 'm41bm', 'nurl.ink/m41bm', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/favicon.ico', 'https://www.bilibili.com/video/BV1TP41147Hu/?spm_id_from=333.1007.top_right_bar_window_history.content.click&vd_source=4b61bde2f90f84bdc49394f6e30bcf31', NULL, 0, 1, 0, NULL, '【阿梓歌】《倒带》（2023.8.13）_哔哩哔哩_bilibili', '2024-07-11 23:37:21', '2024-07-11 23:37:21', 0, 11, 1, 1);
INSERT INTO `t_link_2` VALUES (1811424656427696130, 'yRGcVO', 'nurl.ink', '3Y4CMm', 'nurl.ink/3Y4CMm', 'https://fe-video-qc.xhscdn.com/fe-platform/ed8fe781ce9e16c1bfac2cd962f0721edabe2e49.ico', 'https://www.xiaohongshu.com/explore/64069f2b00000000130096ba?xsec_token=ABMophdrHqojSQrCPlElAe_Qli_JDXuMkUWTsbIsaKiAY=&xsec_source=pc_feed', NULL, 0, 1, 0, NULL, '完了，我完全被老婆看穿了 - 小红书2', '2024-07-11 23:37:47', '2024-07-12 09:19:47', 0, 1, 1, 1);
INSERT INTO `t_link_2` VALUES (1811424851211173890, 'yRGcVO', 'nurl.ink', '34WD9d', 'nurl.ink/34WD9d', 'https://www.zhihu.com/favicon.ico', 'https://www.zhihu.com/question/263741552/answer/3558391639', NULL, 1, 1, 0, NULL, '哈哈', '2024-07-11 23:38:34', '2024-07-30 21:15:25', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811425347502194689, 'yRGcVO', 'nurl.ink', '3Qp05j', 'nurl.ink/3Qp05j', 'https://www.zhihu.com/favicon.ico', 'https://www.zhihu.com/question/263741552/answer/3558391639', NULL, 1, 1, 0, NULL, '指针1', '2024-07-11 23:40:32', '2024-07-30 21:15:24', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811444854706741249, 'yRGcVO', 'nurl.ink', '1NlDFo', 'nurl.ink/1NlDFo', 'https://static.zhihu.com/heifetz/favicon.ico', 'https://www.zhihu.com', NULL, 1, 1, 1, '2024-07-13 00:00:00', '知乎 - 有问题，就会有答案', '2024-07-12 00:58:03', '2024-07-30 21:15:21', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811573339227947009, 'yRGcVO', 'nurl.ink', 'kkgKh', 'nurl.ink/kkgKh', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/512.png', 'https://www.bilibili.com/', NULL, 0, 1, 1, '2024-07-13 09:29:11', '哔哩哔哩 (゜-゜)つロ 干杯~-bilibili', '2024-07-12 09:28:36', '2024-07-30 21:07:16', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811573341807443969, 'yRGcVO', 'nurl.ink', '2JHHzS', 'nurl.ink/2JHHzS', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/512.png', 'https://www.bilibili.com/', NULL, 0, 1, 1, '2024-07-12 09:29:11', '哔哩哔哩 (゜-゜)つロ 干杯~-bilibili', '2024-07-12 09:28:37', '2024-07-12 09:28:37', 0, 1, 1, 1);
INSERT INTO `t_link_2` VALUES (1811616777348591618, 'yRGcVO', 'nurl.ink', '3BVCBj', 'nurl.ink/3BVCBj', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/512.png', 'https://www.bilibili.com/', NULL, 0, 1, 0, NULL, '哔哩哔哩 (゜-゜)つロ 干杯~-bilibili', '2024-07-12 12:21:13', '2024-07-30 21:06:47', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811617012535799810, 'yRGcVO', 'nurl.ink', '2taq4e', 'nurl.ink/2taq4e', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/512.png', 'https://www.bilibili.com/', NULL, 0, 1, 0, NULL, '哔哩哔哩 (゜-゜)つロ 干杯~-bilibili', '2024-07-12 12:22:09', '2024-07-30 21:06:43', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1811618929722798082, 'yRGcVO', 'nurl.ink', '1hwUDM', 'nurl.ink/1hwUDM', 'https://i0.hdslb.com/bfs/static/jinkela/long/images/512.png', 'https://www.bilibili.com/121', NULL, 1, 1, 0, NULL, '哔哩哔哩 (゜-゜)つロ 干杯~-bilibili', '2024-07-12 12:29:46', '2024-07-30 21:08:58', 0, 1, 1, 1);
INSERT INTO `t_link_2` VALUES (1818289788441182209, 'yRGcVO', '47.100.32.85', '1z75bD', '47.100.32.85/1z75bD', 'https://www.youtube.com//favicon.ico', 'https://www.youtube.com/', NULL, 1, 1, 0, NULL, '获取网页标题失败💦💦💦，国家长城防火墙为您保驾护航😊(doge)', '2024-07-30 22:17:22', '2024-07-30 22:44:11', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818289870557265921, 'yRGcVO', '47.100.32.85', '2qEqRK', '47.100.32.85/2qEqRK', 'https://www.youtube.com//favicon.ico', 'https://www.youtube.com/', NULL, 1, 1, 0, NULL, '获取网页标题失败💦💦💦，国家长城防火墙为您保驾护航😊(doge)', '2024-07-30 22:17:42', '2024-07-30 22:44:09', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818296071567306753, 'yRGcVO', '47.100.32.85', '3V8SkN', '47.100.32.85/3V8SkN', 'https://www.youtube.com//favicon.ico', 'https://www.youtube.com/', NULL, 0, 1, 0, NULL, '获取网页标题失败😊，国家长城防火墙为您保驾护航🤣🤣🤣(doge)', '2024-07-30 22:42:20', '2024-07-30 22:42:20', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818298626837921793, 'yRGcVO', '47.100.32.85', '1u2EW4', '47.100.32.85/1u2EW4', 'https://github.com/fluidicon.png', 'https://github.com/Vakakawaii/shortlink.re', NULL, 0, 1, 0, NULL, 'GitHub - Vakakawaii/shortlink.re', '2024-07-30 22:52:30', '2024-07-30 22:52:30', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818298727484440577, 'yRGcVO', '47.100.32.85', '2VPdZ2', '47.100.32.85/2VPdZ2', 'https://www.youtube.com//favicon.ico', 'https://www.youtube.com/', NULL, 0, 1, 0, NULL, '获取网页标题失败😊，国家长城防火墙为您保驾护航🤣🤣🤣(doge)', '2024-07-30 22:52:54', '2024-07-30 22:52:54', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818298816785367042, 'yRGcVO', '47.100.32.85', '4MN5KH', '47.100.32.85/4MN5KH', 'http://activity.hdslb.com/blackboard/static/45ec9793948132a2da6214616bd9d517/favicon.ico', 'https://www.bilibili.com/blackboard/era/SD1WyAhaIqHA1W16.html?spm_id_from=333.788.0.0', NULL, 0, 1, 0, NULL, '夏日运动派对', '2024-07-30 22:53:15', '2024-07-30 22:53:15', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818298932258750465, 'yRGcVO', '47.100.32.85', '3ibUVf', '47.100.32.85/3ibUVf', 'https://wx.zsxq.com/assets/images/favicon_32.ico', 'https://wx.zsxq.com/dweb2/index/topic_detail/811442288828512', NULL, 0, 1, 0, NULL, '知识星球 | 深度连接铁杆粉丝，运营高品质社群，知识变现的工具', '2024-07-30 22:53:42', '2024-07-30 22:53:42', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818299215827255297, 'yRGcVO', '47.100.32.85', '4SmSSu', '47.100.32.85/4SmSSu', 'https://www.ets.org//favicon.ico', 'https://www.ets.org/', NULL, 0, 1, 0, NULL, 'ETS | Global education and talent solutions', '2024-07-30 22:54:50', '2024-07-30 22:54:50', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818299491829268481, 'yRGcVO', '47.100.32.85', 'lMfE', '47.100.32.85/lMfE', 'https://www.youtube.com//favicon.ico', 'https://www.youtube.com/', NULL, 0, 1, 0, NULL, '获取网页标题失败😊，国家长城防火墙为您保驾护航🤣🤣🤣(doge)', '2024-07-30 22:55:56', '2024-07-30 22:55:56', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818299584280117249, 'yRGcVO', '47.100.32.85', '4Cy0Nq', '47.100.32.85/4Cy0Nq', 'https://www.ets.org//favicon.ico', 'https://www.ets.org/contact.html', NULL, 0, 1, 0, NULL, 'ETS Contact Information', '2024-07-30 22:56:18', '2024-07-30 22:56:18', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818300204852559874, 'yRGcVO', '47.100.32.85', '3wm8hb', '47.100.32.85/3wm8hb', 'https://static.zhihu.com/heifetz/favicon.ico', 'https://www.zhihu.com/signin?next=%2F', NULL, 0, 1, 0, NULL, '知乎 - 有问题，就会有答案', '2024-07-30 22:58:46', '2024-07-30 22:58:46', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818300315468939265, 'yRGcVO', '47.100.32.85', '1PjLgx', '47.100.32.85/1PjLgx', 'https://xcrh.top//favicon.ico', 'https://xcrh.top/', NULL, 0, 1, 0, NULL, 'XCRH = 小春日和', '2024-07-30 22:59:12', '2024-07-30 22:59:12', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818300516044750849, 'yRGcVO', '47.100.32.85', '2tnJNa', '47.100.32.85/2tnJNa', 'https://xcrh.top//favicon.ico', 'https://xcrh.top/', NULL, 0, 1, 0, NULL, 'XCRH = 小春日和', '2024-07-30 23:00:00', '2024-07-30 23:00:00', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818300698857684994, 'yRGcVO', '47.100.32.85', '3zLozu', '47.100.32.85/3zLozu', 'https://jwzx.jhun.edu.cn/favicon.ico', 'https://jwzx.jhun.edu.cn/80/3b/c3825a163899/page.htm', NULL, 0, 1, 0, NULL, '关于选拔优秀全日制本科生暑期赴香港学习交流的通知', '2024-07-30 23:00:44', '2024-07-30 23:00:44', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818301009684856833, 'yRGcVO', '47.100.32.85', '3V94sT', '47.100.32.85/3V94sT', 'https://jwzx.jhun.edu.cn/favicon.ico', 'https://jwzx.jhun.edu.cn/80/3b/c3825a163899/page.htm', NULL, 0, 1, 0, NULL, '关于选拔优秀全日制本科生暑期赴香港学习交流的通知', '2024-07-30 23:01:58', '2024-07-30 23:01:58', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818301375688228865, 'yRGcVO', '47.100.32.85', '4DnY5s', '47.100.32.85/4DnY5s', 'https://jwzx.jhun.edu.cn/favicon.ico', 'https://jwzx.jhun.edu.cn/80/3b/c3825a163899/page.htm', NULL, 0, 1, 0, NULL, '关于选拔优秀全日制本科生暑期赴香港学习交流的通知', '2024-07-30 23:03:25', '2024-07-30 23:03:25', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818302048232308737, 'yRGcVO', '47.100.32.85', '1OLzk0', '47.100.32.85/1OLzk0', 'https://xcrh.top/images/apple-touch-icon.png', 'https://xcrh.top/', NULL, 0, 1, 0, NULL, 'XCRH = 小春日和', '2024-07-30 23:06:05', '2024-07-30 23:06:05', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1818302225374543873, 'yRGcVO', '47.100.32.85', '1umzDt', '47.100.32.85/1umzDt', 'https://chatgpt.com//favicon.ico', 'https://chatgpt.com/', NULL, 0, 1, 0, NULL, '获取网页标题失败😊，国家长城防火墙为您保驾护航🤣🤣🤣(doge)', '2024-07-30 23:06:48', '2024-07-30 23:06:48', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1821547392109912066, 'yRGcVO', 'v.star17.cn', '1t58xo', 'v.star17.cn/1t58xo', 'https://www.tiktok.com//favicon.ico', 'https://www.tiktok.com/', NULL, 0, 1, 0, NULL, '获取网页标题失败😊.', '2024-08-08 22:01:56', '2024-08-08 22:01:56', 0, 0, 0, 0);
INSERT INTO `t_link_2` VALUES (1821779156027879426, 'yRGcVO', 'v.star17.cn', '2Q5amL', 'v.star17.cn/2Q5amL', 'https://nookipedia.com/favicon.ico', 'https://nookipedia.com/wiki/Category:New_Horizons_character_icons', NULL, 0, 1, 0, NULL, 'Category:New Horizons character icons - Animal Crossing Wiki - Nookipedia', '2024-08-09 13:22:52', '2024-08-09 13:22:52', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for t_link_3
-- ----------------------------
DROP TABLE IF EXISTS `t_link_3`;
CREATE TABLE `t_link_3`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1811420906006888449 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_3
-- ----------------------------
INSERT INTO `t_link_3` VALUES (1811420906006888449, 'vG6UQn', 'nurl.ink', '1rWSzl', 'nurl.ink/1rWSzl', 'https://www.bilibili.com/https://i0.hdslb.com/bfs/static/jinkela/long/images/512.png', 'https://www.bilibili.com/video/BV1TP41147Hu/?spm_id_from=333.1007.top_right_bar_window_history.content.click', NULL, 0, 1, 0, NULL, '【阿梓歌】《倒带》（2023.8.13）_哔哩哔哩_bilibili', '2024-07-11 23:22:53', '2024-07-11 23:22:53', 0, 0, 0, 0);

-- ----------------------------
-- Table structure for t_link_4
-- ----------------------------
DROP TABLE IF EXISTS `t_link_4`;
CREATE TABLE `t_link_4`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1790215054239559682 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_5
-- ----------------------------
DROP TABLE IF EXISTS `t_link_5`;
CREATE TABLE `t_link_5`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1792016381277986817 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_6
-- ----------------------------
DROP TABLE IF EXISTS `t_link_6`;
CREATE TABLE `t_link_6`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_7
-- ----------------------------
DROP TABLE IF EXISTS `t_link_7`;
CREATE TABLE `t_link_7`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_8
-- ----------------------------
DROP TABLE IF EXISTS `t_link_8`;
CREATE TABLE `t_link_8`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_9
-- ----------------------------
DROP TABLE IF EXISTS `t_link_9`;
CREATE TABLE `t_link_9`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `domain` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '域名',
  `short_uri` varchar(8) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT '短链接',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `favicon` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '网页图标',
  `origin_url` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '原始链接',
  `click_num` int(0) NULL DEFAULT NULL COMMENT '点击量',
  `enable_status` tinyint(1) NULL DEFAULT NULL COMMENT '启用标识 0:启用 1:未启用',
  `created_type` tinyint(1) NULL DEFAULT NULL COMMENT '创建类型 0:接口创建 1:控制台创建',
  `valid_date_type` tinyint(1) NULL DEFAULT NULL COMMENT '有效期类型 0:永久有效 1:自定义',
  `valid_date` datetime(0) NULL DEFAULT NULL COMMENT '有效期',
  `describe` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  `total_pv` int(0) NULL DEFAULT 0 COMMENT '历史pv',
  `total_uv` int(0) NULL DEFAULT 0 COMMENT '历史uv',
  `total_uip` int(0) NULL DEFAULT 0 COMMENT '历史uip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_full_short_url`(`full_short_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1792016420926742529 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_access_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_link_access_logs`;
CREATE TABLE `t_link_access_logs`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `user` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户信息',
  `ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'IP',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `network` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问网络',
  `device` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问设备',
  `locate` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问地区',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 63 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_access_logs
-- ----------------------------
INSERT INTO `t_link_access_logs` VALUES (34, 'nurl.ink/47LHFj', 'yRGcVO', '3bc8cc3d-dac3-438e-a70b-c19d9b1ca538', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-06-22 16:29:41', '2024-06-22 16:29:41', 0);
INSERT INTO `t_link_access_logs` VALUES (35, 'nurl.ink/47LHFj', 'yRGcVO', '3bc8cc3d-dac3-438e-a70b-c19d9b1ca538', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-06-22 20:38:53', '2024-06-22 20:38:53', 0);
INSERT INTO `t_link_access_logs` VALUES (36, 'nurl.ink/3bwx2S', 'yRGcVO', '442aa1e4-e86c-4f12-aadf-70131dad497a', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-06-24 14:25:34', '2024-06-24 14:25:34', 0);
INSERT INTO `t_link_access_logs` VALUES (37, 'nurl.ink/1igHsq', 'yRGcVO', '11511a72-342b-498c-ba34-bf067fd37ed6', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-06-24 23:57:15', '2024-06-24 23:57:15', 0);
INSERT INTO `t_link_access_logs` VALUES (38, 'nurl.ink/1igHsq', 'yRGcVO', '11511a72-342b-498c-ba34-bf067fd37ed6', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-06-24 23:57:24', '2024-06-24 23:57:24', 0);
INSERT INTO `t_link_access_logs` VALUES (39, 'nurl.ink/3bwx2S', 'yRGcVO', '442aa1e4-e86c-4f12-aadf-70131dad497a', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-06-25 09:23:14', '2024-06-25 09:23:14', 0);
INSERT INTO `t_link_access_logs` VALUES (40, 'nurl.ink/1igHsq', 'yRGcVO', '11511a72-342b-498c-ba34-bf067fd37ed6', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-06-25 09:24:43', '2024-06-25 09:24:43', 0);
INSERT INTO `t_link_access_logs` VALUES (41, 'nurl.ink/3bwx2S', 'yRGcVO', '442aa1e4-e86c-4f12-aadf-70131dad497a', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-06-25 09:30:01', '2024-06-25 09:30:01', 0);
INSERT INTO `t_link_access_logs` VALUES (42, 'nurl.ink/3bwx2S', 'yRGcVO', '442aa1e4-e86c-4f12-aadf-70131dad497a', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-08 13:11:57', '2024-07-08 13:11:57', 0);
INSERT INTO `t_link_access_logs` VALUES (43, 'v.star17.cn/vWtHj', 'yRGcVO', '407adb75-05a5-48f6-91d6-22f0bc98edbc', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-08 13:25:32', '2024-07-08 13:25:32', 0);
INSERT INTO `t_link_access_logs` VALUES (44, 'nurl.ink/4JP9z', 'yRGcVO', '52378b1b-79b9-40c8-be20-320a8e2106d7', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-08 14:00:05', '2024-07-08 14:00:05', 0);
INSERT INTO `t_link_access_logs` VALUES (45, 'nurl.ink/4JP9z', 'yRGcVO', '52378b1b-79b9-40c8-be20-320a8e2106d7', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-09 15:23:02', '2024-07-09 15:23:02', 0);
INSERT INTO `t_link_access_logs` VALUES (46, 'nurl.ink/4JP9z', 'yRGcVO', '52378b1b-79b9-40c8-be20-320a8e2106d7', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-11 12:15:41', '2024-07-11 12:15:41', 0);
INSERT INTO `t_link_access_logs` VALUES (47, 'nurl.ink/4JP9z', 'yRGcVO', '52378b1b-79b9-40c8-be20-320a8e2106d7', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-11 12:18:19', '2024-07-11 12:18:19', 0);
INSERT INTO `t_link_access_logs` VALUES (48, 'nurl.ink/4JP9z', 'yRGcVO', '52378b1b-79b9-40c8-be20-320a8e2106d7', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-11 12:34:33', '2024-07-11 12:34:33', 0);
INSERT INTO `t_link_access_logs` VALUES (49, 'nurl.ink/4JP9z', 'yRGcVO', '52378b1b-79b9-40c8-be20-320a8e2106d7', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-北京市-北京市', '2024-07-11 12:38:32', '2024-07-11 12:38:32', 0);
INSERT INTO `t_link_access_logs` VALUES (50, 'nurl.ink/3Y4CMm', 'yRGcVO', '05135eb1-3928-48e7-8753-48ada91b41bf', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-12 09:26:30', '2024-07-12 09:26:30', 0);
INSERT INTO `t_link_access_logs` VALUES (51, 'nurl.ink/2JHHzS', 'yRGcVO', 'bd0e4846-0c86-47a1-94aa-e818d4f512a3', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-12 09:29:01', '2024-07-12 09:29:01', 0);
INSERT INTO `t_link_access_logs` VALUES (52, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 16:09:59', '2024-07-30 16:09:59', 0);
INSERT INTO `t_link_access_logs` VALUES (53, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 16:16:20', '2024-07-30 16:16:20', 0);
INSERT INTO `t_link_access_logs` VALUES (54, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 16:21:08', '2024-07-30 16:21:08', 0);
INSERT INTO `t_link_access_logs` VALUES (55, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 16:36:43', '2024-07-30 16:36:43', 0);
INSERT INTO `t_link_access_logs` VALUES (56, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 19:24:15', '2024-07-30 19:24:15', 0);
INSERT INTO `t_link_access_logs` VALUES (57, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 19:32:14', '2024-07-30 19:32:14', 0);
INSERT INTO `t_link_access_logs` VALUES (58, 'nurl.ink/1hwUDM', 'yRGcVO', '21bca9a8-aa75-4c7c-bb98-7abdb7f30798', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 21:03:40', '2024-07-30 21:03:40', 0);
INSERT INTO `t_link_access_logs` VALUES (59, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 21:20:28', '2024-07-30 21:20:28', 0);
INSERT INTO `t_link_access_logs` VALUES (60, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 21:20:31', '2024-07-30 21:20:31', 0);
INSERT INTO `t_link_access_logs` VALUES (61, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 21:20:34', '2024-07-30 21:20:34', 0);
INSERT INTO `t_link_access_logs` VALUES (62, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 21:20:35', '2024-07-30 21:20:35', 0);
INSERT INTO `t_link_access_logs` VALUES (63, 'nurl.ink/m41bm', 'yRGcVO', '6407df48-534e-4d01-94e5-90b4ae4b30b2', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-07-30 21:20:38', '2024-07-30 21:20:38', 0);
INSERT INTO `t_link_access_logs` VALUES (64, 'nurl.ink/1igHsq', 'yRGcVO', 'f8caab9c-9ec4-4838-9609-9a87c3b2adda', '127.0.0.1', 'Microsoft Edge', 'Windows', 'Mobile', 'PC', '中国-未知-未知', '2024-08-09 13:17:04', '2024-08-09 13:17:04', 0);

-- ----------------------------
-- Table structure for t_link_access_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_access_stats`;
CREATE TABLE `t_link_access_stats`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `pv` int(0) NULL DEFAULT NULL COMMENT '访问量',
  `uv` int(0) NULL DEFAULT NULL COMMENT '独立访客数',
  `uip` int(0) NULL DEFAULT NULL COMMENT '独立IP数',
  `hour` int(0) NULL DEFAULT NULL COMMENT '小时',
  `weekday` int(0) NULL DEFAULT NULL COMMENT '星期',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_access_stats`(`full_short_url`, `gid`, `date`, `hour`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_access_stats
-- ----------------------------
INSERT INTO `t_link_access_stats` VALUES (62, 'nurl.ink/47LHFj', 'yRGcVO', '2024-06-22', 1, 1, 1, 16, 7, '2024-06-22 16:29:41', '2024-06-22 16:29:41', 0);
INSERT INTO `t_link_access_stats` VALUES (63, 'nurl.ink/47LHFj', 'yRGcVO', '2024-06-22', 1, 0, 0, 20, 7, '2024-06-22 20:38:52', '2024-06-22 20:38:52', 0);
INSERT INTO `t_link_access_stats` VALUES (64, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-24', 1, 1, 1, 14, 2, '2024-06-24 14:25:33', '2024-06-24 14:25:33', 0);
INSERT INTO `t_link_access_stats` VALUES (65, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-24', 2, 1, 1, 23, 2, '2024-06-24 23:57:13', '2024-06-24 23:57:13', 0);
INSERT INTO `t_link_access_stats` VALUES (67, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-25', 2, 0, 0, 9, 3, '2024-06-25 09:22:53', '2024-06-25 09:22:53', 0);
INSERT INTO `t_link_access_stats` VALUES (68, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-25', 1, 0, 0, 9, 3, '2024-06-25 09:23:53', '2024-06-25 09:23:53', 0);
INSERT INTO `t_link_access_stats` VALUES (70, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-07-08', 1, 0, 0, 13, 2, '2024-07-08 13:11:56', '2024-07-08 13:11:56', 0);
INSERT INTO `t_link_access_stats` VALUES (71, 'v.star17.cn/vWtHj', 'yRGcVO', '2024-07-08', 1, 1, 1, 13, 2, '2024-07-08 13:25:32', '2024-07-08 13:25:32', 0);
INSERT INTO `t_link_access_stats` VALUES (72, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-08', 1, 1, 1, 14, 2, '2024-07-08 14:00:04', '2024-07-08 14:00:04', 0);
INSERT INTO `t_link_access_stats` VALUES (73, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-09', 1, 0, 0, 15, 3, '2024-07-09 15:22:57', '2024-07-09 15:22:57', 0);
INSERT INTO `t_link_access_stats` VALUES (74, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-11', 4, 0, 0, 12, 5, '2024-07-11 12:14:30', '2024-07-11 12:14:30', 0);
INSERT INTO `t_link_access_stats` VALUES (78, 'nurl.ink/3Y4CMm', 'yRGcVO', '2024-07-12', 1, 1, 1, 9, 6, '2024-07-12 09:26:29', '2024-07-12 09:26:29', 0);
INSERT INTO `t_link_access_stats` VALUES (79, 'nurl.ink/2JHHzS', 'yRGcVO', '2024-07-12', 1, 1, 1, 9, 6, '2024-07-12 09:29:01', '2024-07-12 09:29:01', 0);
INSERT INTO `t_link_access_stats` VALUES (80, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 1, 1, 16, 2, '2024-07-30 16:09:58', '2024-07-30 16:09:58', 0);
INSERT INTO `t_link_access_stats` VALUES (81, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 0, 0, 16, 2, '2024-07-30 16:16:18', '2024-07-30 16:16:18', 0);
INSERT INTO `t_link_access_stats` VALUES (82, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 0, 0, 16, 2, '2024-07-30 16:21:07', '2024-07-30 16:21:07', 0);
INSERT INTO `t_link_access_stats` VALUES (83, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 0, 0, 16, 2, '2024-07-30 16:36:42', '2024-07-30 16:36:42', 0);
INSERT INTO `t_link_access_stats` VALUES (84, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 0, 0, 19, 2, '2024-07-30 19:24:14', '2024-07-30 19:24:14', 0);
INSERT INTO `t_link_access_stats` VALUES (85, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 0, 0, 19, 2, '2024-07-30 19:32:13', '2024-07-30 19:32:13', 0);
INSERT INTO `t_link_access_stats` VALUES (86, 'nurl.ink/1hwUDM', NULL, '2024-07-30', 1, 1, 1, 21, 2, '2024-07-30 21:03:39', '2024-07-30 21:03:39', 0);
INSERT INTO `t_link_access_stats` VALUES (87, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 0, 0, 21, 2, '2024-07-30 21:20:28', '2024-07-30 21:20:28', 0);
INSERT INTO `t_link_access_stats` VALUES (88, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 0, 0, 21, 2, '2024-07-30 21:20:31', '2024-07-30 21:20:31', 0);
INSERT INTO `t_link_access_stats` VALUES (89, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 0, 0, 21, 2, '2024-07-30 21:20:33', '2024-07-30 21:20:33', 0);
INSERT INTO `t_link_access_stats` VALUES (90, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 0, 0, 21, 2, '2024-07-30 21:20:35', '2024-07-30 21:20:35', 0);
INSERT INTO `t_link_access_stats` VALUES (91, 'nurl.ink/m41bm', NULL, '2024-07-30', 1, 0, 0, 21, 2, '2024-07-30 21:20:37', '2024-07-30 21:20:37', 0);
INSERT INTO `t_link_access_stats` VALUES (92, 'nurl.ink/1igHsq', NULL, '2024-08-09', 1, 1, 0, 13, 5, '2024-08-09 13:17:03', '2024-08-09 13:17:03', 0);

-- ----------------------------
-- Table structure for t_link_browser_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_browser_stats`;
CREATE TABLE `t_link_browser_stats`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `cnt` int(0) NULL DEFAULT NULL COMMENT '访问量',
  `browser` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '浏览器',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_browser_stats`(`full_short_url`, `gid`, `date`, `browser`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_browser_stats
-- ----------------------------
INSERT INTO `t_link_browser_stats` VALUES (36, 'nurl.ink/47LHFj', 'yRGcVO', '2024-06-22', 2, 'Microsoft Edge', '2024-06-22 16:29:41', '2024-06-22 16:29:41', 0);
INSERT INTO `t_link_browser_stats` VALUES (38, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-24', 1, 'Microsoft Edge', '2024-06-24 14:25:34', '2024-06-24 14:25:34', 0);
INSERT INTO `t_link_browser_stats` VALUES (39, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-24', 2, 'Microsoft Edge', '2024-06-24 23:57:15', '2024-06-24 23:57:15', 0);
INSERT INTO `t_link_browser_stats` VALUES (41, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-25', 2, 'Microsoft Edge', '2024-06-25 09:22:54', '2024-06-25 09:22:54', 0);
INSERT INTO `t_link_browser_stats` VALUES (42, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-25', 1, 'Microsoft Edge', '2024-06-25 09:23:54', '2024-06-25 09:23:54', 0);
INSERT INTO `t_link_browser_stats` VALUES (44, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-07-08', 1, 'Microsoft Edge', '2024-07-08 13:11:56', '2024-07-08 13:11:56', 0);
INSERT INTO `t_link_browser_stats` VALUES (45, 'v.star17.cn/vWtHj', 'yRGcVO', '2024-07-08', 1, 'Microsoft Edge', '2024-07-08 13:25:32', '2024-07-08 13:25:32', 0);
INSERT INTO `t_link_browser_stats` VALUES (46, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-08', 1, 'Microsoft Edge', '2024-07-08 14:00:05', '2024-07-08 14:00:05', 0);
INSERT INTO `t_link_browser_stats` VALUES (47, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-09', 1, 'Microsoft Edge', '2024-07-09 15:23:02', '2024-07-09 15:23:02', 0);
INSERT INTO `t_link_browser_stats` VALUES (48, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-11', 4, 'Microsoft Edge', '2024-07-11 12:15:41', '2024-07-11 12:15:41', 0);
INSERT INTO `t_link_browser_stats` VALUES (52, 'nurl.ink/3Y4CMm', 'yRGcVO', '2024-07-12', 1, 'Microsoft Edge', '2024-07-12 09:26:30', '2024-07-12 09:26:30', 0);
INSERT INTO `t_link_browser_stats` VALUES (53, 'nurl.ink/2JHHzS', 'yRGcVO', '2024-07-12', 1, 'Microsoft Edge', '2024-07-12 09:29:01', '2024-07-12 09:29:01', 0);
INSERT INTO `t_link_browser_stats` VALUES (54, 'nurl.ink/m41bm', 'yRGcVO', '2024-07-30', 11, 'Microsoft Edge', '2024-07-30 16:09:59', '2024-07-30 16:09:59', 0);
INSERT INTO `t_link_browser_stats` VALUES (60, 'nurl.ink/1hwUDM', 'yRGcVO', '2024-07-30', 1, 'Microsoft Edge', '2024-07-30 21:03:39', '2024-07-30 21:03:39', 0);
INSERT INTO `t_link_browser_stats` VALUES (66, 'nurl.ink/1igHsq', 'yRGcVO', '2024-08-09', 1, 'Microsoft Edge', '2024-08-09 13:17:04', '2024-08-09 13:17:04', 0);

-- ----------------------------
-- Table structure for t_link_device_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_device_stats`;
CREATE TABLE `t_link_device_stats`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `cnt` int(0) NULL DEFAULT NULL COMMENT '访问量',
  `device` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问设备',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_browser_stats`(`full_short_url`, `gid`, `date`, `device`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_device_stats
-- ----------------------------
INSERT INTO `t_link_device_stats` VALUES (28, 'nurl.ink/47LHFj', 'yRGcVO', '2024-06-22', 2, 'PC', '2024-06-22 16:29:41', '2024-06-22 16:29:41', 0);
INSERT INTO `t_link_device_stats` VALUES (30, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-24', 1, 'PC', '2024-06-24 14:25:34', '2024-06-24 14:25:34', 0);
INSERT INTO `t_link_device_stats` VALUES (31, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-24', 2, 'PC', '2024-06-24 23:57:15', '2024-06-24 23:57:15', 0);
INSERT INTO `t_link_device_stats` VALUES (33, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-25', 2, 'PC', '2024-06-25 09:22:54', '2024-06-25 09:22:54', 0);
INSERT INTO `t_link_device_stats` VALUES (34, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-25', 1, 'PC', '2024-06-25 09:23:54', '2024-06-25 09:23:54', 0);
INSERT INTO `t_link_device_stats` VALUES (36, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-07-08', 1, 'PC', '2024-07-08 13:11:56', '2024-07-08 13:11:56', 0);
INSERT INTO `t_link_device_stats` VALUES (37, 'v.star17.cn/vWtHj', 'yRGcVO', '2024-07-08', 1, 'PC', '2024-07-08 13:25:32', '2024-07-08 13:25:32', 0);
INSERT INTO `t_link_device_stats` VALUES (38, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-08', 1, 'PC', '2024-07-08 14:00:05', '2024-07-08 14:00:05', 0);
INSERT INTO `t_link_device_stats` VALUES (39, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-09', 1, 'PC', '2024-07-09 15:23:02', '2024-07-09 15:23:02', 0);
INSERT INTO `t_link_device_stats` VALUES (40, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-11', 4, 'PC', '2024-07-11 12:15:41', '2024-07-11 12:15:41', 0);
INSERT INTO `t_link_device_stats` VALUES (44, 'nurl.ink/3Y4CMm', 'yRGcVO', '2024-07-12', 1, 'PC', '2024-07-12 09:26:30', '2024-07-12 09:26:30', 0);
INSERT INTO `t_link_device_stats` VALUES (45, 'nurl.ink/2JHHzS', 'yRGcVO', '2024-07-12', 1, 'PC', '2024-07-12 09:29:01', '2024-07-12 09:29:01', 0);
INSERT INTO `t_link_device_stats` VALUES (46, 'nurl.ink/m41bm', 'yRGcVO', '2024-07-30', 11, 'PC', '2024-07-30 16:09:59', '2024-07-30 16:09:59', 0);
INSERT INTO `t_link_device_stats` VALUES (52, 'nurl.ink/1hwUDM', 'yRGcVO', '2024-07-30', 1, 'PC', '2024-07-30 21:03:40', '2024-07-30 21:03:40', 0);
INSERT INTO `t_link_device_stats` VALUES (58, 'nurl.ink/1igHsq', 'yRGcVO', '2024-08-09', 1, 'PC', '2024-08-09 13:17:04', '2024-08-09 13:17:04', 0);

-- ----------------------------
-- Table structure for t_link_goto_0
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_0`;
CREATE TABLE `t_link_goto_0`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1818300698878656513 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_0
-- ----------------------------
INSERT INTO `t_link_goto_0` VALUES (1817400937099059201, 'siCwZo', 'nurl.ink/1iEYT2');
INSERT INTO `t_link_goto_0` VALUES (1817400937614958593, 'siCwZo', 'nurl.ink/cbvhw');
INSERT INTO `t_link_goto_0` VALUES (1817400937694650370, 'siCwZo', 'nurl.ink/GfZg2');
INSERT INTO `t_link_goto_0` VALUES (1818300698878656513, 'yRGcVO', '47.100.32.85/3zLozu');
INSERT INTO `t_link_goto_0` VALUES (1821779156111765505, 'yRGcVO', 'v.star17.cn/2Q5amL');

-- ----------------------------
-- Table structure for t_link_goto_1
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_1`;
CREATE TABLE `t_link_goto_1`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1817400939057799169 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_1
-- ----------------------------
INSERT INTO `t_link_goto_1` VALUES (1806509695016497154, 'ZVaDd5', 'nurl.ink/4C6Gn9');
INSERT INTO `t_link_goto_1` VALUES (1810634327394996226, '9meCAm', 'nurl.ink/Wz2Vn');
INSERT INTO `t_link_goto_1` VALUES (1817400937233276931, 'siCwZo', 'nurl.ink/1FMl1h');
INSERT INTO `t_link_goto_1` VALUES (1817400937459769345, 'siCwZo', 'nurl.ink/kBr9E');
INSERT INTO `t_link_goto_1` VALUES (1817400939057799169, 'siCwZo', 'nurl.ink/2THIbJ');

-- ----------------------------
-- Table structure for t_link_goto_10
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_10`;
CREATE TABLE `t_link_goto_10`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1818301010179784706 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_10
-- ----------------------------
INSERT INTO `t_link_goto_10` VALUES (1810187572622757889, 'yRGcVO', 'nurl.ink/4DITuN');
INSERT INTO `t_link_goto_10` VALUES (1810190955077275650, 'yRGcVO', 'v.star17.cn/2E7oLE');
INSERT INTO `t_link_goto_10` VALUES (1811616777646387201, 'yRGcVO', 'nurl.ink/3BVCBj');
INSERT INTO `t_link_goto_10` VALUES (1817400937841451011, 'siCwZo', 'nurl.ink/1a6to5');
INSERT INTO `t_link_goto_10` VALUES (1817400938013417474, 'siCwZo', 'nurl.ink/hj0CE');
INSERT INTO `t_link_goto_10` VALUES (1817400938663534594, 'siCwZo', 'nurl.ink/BHbzn');
INSERT INTO `t_link_goto_10` VALUES (1818301010179784705, 'yRGcVO', '47.100.32.85/3V94sT');

-- ----------------------------
-- Table structure for t_link_goto_11
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_11`;
CREATE TABLE `t_link_goto_11`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1818299492072538115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_11
-- ----------------------------
INSERT INTO `t_link_goto_11` VALUES (1811424656465444866, 'yRGcVO', 'nurl.ink/3Y4CMm');
INSERT INTO `t_link_goto_11` VALUES (1817400937283608579, 'siCwZo', 'nurl.ink/4mEMR');
INSERT INTO `t_link_goto_11` VALUES (1817400937346523137, 'siCwZo', 'nurl.ink/3Vfmxs');
INSERT INTO `t_link_goto_11` VALUES (1817400937724010497, 'siCwZo', 'nurl.ink/482c2R');
INSERT INTO `t_link_goto_11` VALUES (1818298727564132353, 'yRGcVO', '47.100.32.85/2VPdZ2');
INSERT INTO `t_link_goto_11` VALUES (1818299492072538114, 'yRGcVO', '47.100.32.85/lMfE');

-- ----------------------------
-- Table structure for t_link_goto_12
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_12`;
CREATE TABLE `t_link_goto_12`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1818302225420681218 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_12
-- ----------------------------
INSERT INTO `t_link_goto_12` VALUES (1810186932479692802, 'yRGcVO', 'v.star17.cn/4RpBkQ');
INSERT INTO `t_link_goto_12` VALUES (1811421730531557377, 'yRGcVO', 'nurl.ink/LBTUi');
INSERT INTO `t_link_goto_12` VALUES (1817400488937779203, 'siCwZo', 'nurl.ink/2ZWUI9');
INSERT INTO `t_link_goto_12` VALUES (1817400937392660482, 'siCwZo', 'nurl.ink/2mLt5X');
INSERT INTO `t_link_goto_12` VALUES (1817400937770147842, 'siCwZo', 'nurl.ink/1Zccmj');
INSERT INTO `t_link_goto_12` VALUES (1817400940207038466, 'siCwZo', 'nurl.ink/1T48Zi');
INSERT INTO `t_link_goto_12` VALUES (1818296071772827650, 'yRGcVO', '47.100.32.85/3V8SkN');
INSERT INTO `t_link_goto_12` VALUES (1818300516078305281, 'yRGcVO', '47.100.32.85/2tnJNa');
INSERT INTO `t_link_goto_12` VALUES (1818302048462995457, 'yRGcVO', '47.100.32.85/1OLzk0');
INSERT INTO `t_link_goto_12` VALUES (1818302225420681218, 'yRGcVO', '47.100.32.85/1umzDt');

-- ----------------------------
-- Table structure for t_link_goto_13
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_13`;
CREATE TABLE `t_link_goto_13`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1818300315502493698 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_13
-- ----------------------------
INSERT INTO `t_link_goto_13` VALUES (1804430150461317121, 'yRGcVO', 'nurl.ink/1igHsq');
INSERT INTO `t_link_goto_13` VALUES (1810180915503140866, 'yRGcVO', 'v.star17.cn/AqNc8');
INSERT INTO `t_link_goto_13` VALUES (1810186504924925954, 'yRGcVO', 'v.star17.cn/4PjQqu');
INSERT INTO `t_link_goto_13` VALUES (1817400938604814338, 'siCwZo', 'nurl.ink/3fa0av');
INSERT INTO `t_link_goto_13` VALUES (1818300315502493698, 'yRGcVO', '47.100.32.85/1PjLgx');

-- ----------------------------
-- Table structure for t_link_goto_14
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_14`;
CREATE TABLE `t_link_goto_14`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1817400936998395906 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_14
-- ----------------------------
INSERT INTO `t_link_goto_14` VALUES (1811421870268989442, 'yRGcVO', 'nurl.ink/4MTk3k');
INSERT INTO `t_link_goto_14` VALUES (1811573339446050817, 'yRGcVO', 'nurl.ink/kkgKh');
INSERT INTO `t_link_goto_14` VALUES (1817400936998395906, 'siCwZo', 'nurl.ink/3AIhrM');

-- ----------------------------
-- Table structure for t_link_goto_15
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_15`;
CREATE TABLE `t_link_goto_15`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1818298627320266753 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_15
-- ----------------------------
INSERT INTO `t_link_goto_15` VALUES (1810182924897718274, 'yRGcVO', 'v.star17.cn/vWtHj');
INSERT INTO `t_link_goto_15` VALUES (1811421676051742722, 'yRGcVO', 'nurl.ink/3yr8g4');
INSERT INTO `t_link_goto_15` VALUES (1811424546927001602, 'yRGcVO', 'nurl.ink/m41bm');
INSERT INTO `t_link_goto_15` VALUES (1811424851248922626, 'yRGcVO', 'nurl.ink/34WD9d');
INSERT INTO `t_link_goto_15` VALUES (1817400937413632002, 'siCwZo', 'nurl.ink/4R4zyN');
INSERT INTO `t_link_goto_15` VALUES (1817400937422020610, 'siCwZo', 'nurl.ink/Ac4m0');
INSERT INTO `t_link_goto_15` VALUES (1817400937908559874, 'siCwZo', 'nurl.ink/4HLdQn');
INSERT INTO `t_link_goto_15` VALUES (1817400938399293441, 'siCwZo', 'nurl.ink/13n4T5');
INSERT INTO `t_link_goto_15` VALUES (1817400940588720129, 'siCwZo', 'nurl.ink/2O9MOW');
INSERT INTO `t_link_goto_15` VALUES (1818289870590820353, 'yRGcVO', '47.100.32.85/2qEqRK');
INSERT INTO `t_link_goto_15` VALUES (1818298627320266753, 'yRGcVO', '47.100.32.85/1u2EW4');

-- ----------------------------
-- Table structure for t_link_goto_2
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_2`;
CREATE TABLE `t_link_goto_2`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1818299215844032514 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_2
-- ----------------------------
INSERT INTO `t_link_goto_2` VALUES (1817400937061310465, 'siCwZo', 'nurl.ink/83SA1');
INSERT INTO `t_link_goto_2` VALUES (1817400937283608578, 'siCwZo', 'nurl.ink/44NQ5n');
INSERT INTO `t_link_goto_2` VALUES (1817400937518489602, 'siCwZo', 'nurl.ink/1nqDPL');
INSERT INTO `t_link_goto_2` VALUES (1818299215844032514, 'yRGcVO', '47.100.32.85/4SmSSu');

-- ----------------------------
-- Table structure for t_link_goto_3
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_3`;
CREATE TABLE `t_link_goto_3`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1811421439249727489 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_3
-- ----------------------------
INSERT INTO `t_link_goto_3` VALUES (1810186744134471681, 'yRGcVO', 'v.star17.cn/2KRoKB');
INSERT INTO `t_link_goto_3` VALUES (1811421206616850433, 'yRGcVO', 'nurl.ink/plBvY');
INSERT INTO `t_link_goto_3` VALUES (1811421439249727489, 'yRGcVO', 'nurl.ink/4fnmmI');
INSERT INTO `t_link_goto_3` VALUES (1821547392281878529, 'yRGcVO', 'v.star17.cn/1t58xo');

-- ----------------------------
-- Table structure for t_link_goto_4
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_4`;
CREATE TABLE `t_link_goto_4`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1818301375885361153 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_4
-- ----------------------------
INSERT INTO `t_link_goto_4` VALUES (1811421146462142465, 'yRGcVO', 'nurl.ink/3kezQR');
INSERT INTO `t_link_goto_4` VALUES (1811444855101005826, 'yRGcVO', 'nurl.ink/1NlDFo');
INSERT INTO `t_link_goto_4` VALUES (1811618929802489858, 'yRGcVO', 'nurl.ink/1hwUDM');
INSERT INTO `t_link_goto_4` VALUES (1818289788764143618, 'yRGcVO', '47.100.32.85/1z75bD');
INSERT INTO `t_link_goto_4` VALUES (1818298932296499202, 'yRGcVO', '47.100.32.85/3ibUVf');
INSERT INTO `t_link_goto_4` VALUES (1818299584317865986, 'yRGcVO', '47.100.32.85/4Cy0Nq');
INSERT INTO `t_link_goto_4` VALUES (1818300204881920002, 'yRGcVO', '47.100.32.85/3wm8hb');
INSERT INTO `t_link_goto_4` VALUES (1818301375885361153, 'yRGcVO', '47.100.32.85/4DnY5s');

-- ----------------------------
-- Table structure for t_link_goto_5
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_5`;
CREATE TABLE `t_link_goto_5`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1817400937623347202 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_5
-- ----------------------------
INSERT INTO `t_link_goto_5` VALUES (1805125502550208513, 'aeeJEn', 'nurl.ink/1A6JZu');
INSERT INTO `t_link_goto_5` VALUES (1810192054668595201, 'yRGcVO', 'nurl.ink/4JP9z');
INSERT INTO `t_link_goto_5` VALUES (1810634574535970818, 'aeeJEn', 'nurl.ink/1Gbkiy');
INSERT INTO `t_link_goto_5` VALUES (1811420906199826433, 'vG6UQn', 'nurl.ink/1rWSzl');
INSERT INTO `t_link_goto_5` VALUES (1817400488937779202, 'siCwZo', 'nurl.ink/4COX0W');
INSERT INTO `t_link_goto_5` VALUES (1817400937136807937, 'siCwZo', 'nurl.ink/2kmFDq');
INSERT INTO `t_link_goto_5` VALUES (1817400937623347202, 'siCwZo', 'nurl.ink/3AgNEO');

-- ----------------------------
-- Table structure for t_link_goto_6
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_6`;
CREATE TABLE `t_link_goto_6`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1817400940588720130 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_6
-- ----------------------------
INSERT INTO `t_link_goto_6` VALUES (1810190581738082306, 'yRGcVO', 'v.star17.cn/3n9eZc');
INSERT INTO `t_link_goto_6` VALUES (1817400937031950338, 'siCwZo', 'nurl.ink/3Rc3op');
INSERT INTO `t_link_goto_6` VALUES (1817400937761759233, 'siCwZo', 'nurl.ink/BuxIp');
INSERT INTO `t_link_goto_6` VALUES (1817400937803702274, 'siCwZo', 'nurl.ink/1NMUA');
INSERT INTO `t_link_goto_6` VALUES (1817400937946308609, 'siCwZo', 'nurl.ink/4IJwC1');
INSERT INTO `t_link_goto_6` VALUES (1817400940588720130, 'siCwZo', 'nurl.ink/boSm3');

-- ----------------------------
-- Table structure for t_link_goto_7
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_7`;
CREATE TABLE `t_link_goto_7`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1817400937841451010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_7
-- ----------------------------
INSERT INTO `t_link_goto_7` VALUES (1805125024332443650, 'yRGcVO', 'nurl.ink/3bwx2S');
INSERT INTO `t_link_goto_7` VALUES (1810186201907433474, 'yRGcVO', 'v.star17.cn/bQzqs');
INSERT INTO `t_link_goto_7` VALUES (1811573341849387009, 'yRGcVO', 'nurl.ink/2JHHzS');
INSERT INTO `t_link_goto_7` VALUES (1817400937073893377, 'siCwZo', 'nurl.ink/2dv225');
INSERT INTO `t_link_goto_7` VALUES (1817400937841451010, 'siCwZo', 'nurl.ink/49BGz1');

-- ----------------------------
-- Table structure for t_link_goto_8
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_8`;
CREATE TABLE `t_link_goto_8`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1818298816852475905 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_8
-- ----------------------------
INSERT INTO `t_link_goto_8` VALUES (1811421331196067841, 'yRGcVO', 'nurl.ink/3OzVWQ');
INSERT INTO `t_link_goto_8` VALUES (1811421535555141634, 'yRGcVO', 'nurl.ink/2ifVGr');
INSERT INTO `t_link_goto_8` VALUES (1817400936998395905, 'siCwZo', 'nurl.ink/1FdGv0');
INSERT INTO `t_link_goto_8` VALUES (1817400937233276930, 'siCwZo', 'nurl.ink/3rfNAl');
INSERT INTO `t_link_goto_8` VALUES (1817400937442992130, 'siCwZo', 'nurl.ink/3GJtcG');
INSERT INTO `t_link_goto_8` VALUES (1817400938965524481, 'siCwZo', 'nurl.ink/3CcHZw');
INSERT INTO `t_link_goto_8` VALUES (1818298816852475905, 'yRGcVO', '47.100.32.85/4MN5KH');

-- ----------------------------
-- Table structure for t_link_goto_9
-- ----------------------------
DROP TABLE IF EXISTS `t_link_goto_9`;
CREATE TABLE `t_link_goto_9`  (
  `id` bigint unsigned NOT NULL COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1817400938558676994 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_goto_9
-- ----------------------------
INSERT INTO `t_link_goto_9` VALUES (1804431441665232898, 'yRGcVO', 'nurl.ink/47LHFj');
INSERT INTO `t_link_goto_9` VALUES (1811425347590275073, 'yRGcVO', 'nurl.ink/3Qp05j');
INSERT INTO `t_link_goto_9` VALUES (1811617012573548546, 'yRGcVO', 'nurl.ink/2taq4e');
INSERT INTO `t_link_goto_9` VALUES (1817400937031950339, 'siCwZo', 'nurl.ink/34Fg2c');
INSERT INTO `t_link_goto_9` VALUES (1817400937564626945, 'siCwZo', 'nurl.ink/2lzLy0');
INSERT INTO `t_link_goto_9` VALUES (1817400937573015553, 'siCwZo', 'nurl.ink/3wGf3s');
INSERT INTO `t_link_goto_9` VALUES (1817400937577209857, 'siCwZo', 'nurl.ink/3hYtor');
INSERT INTO `t_link_goto_9` VALUES (1817400938558676994, 'siCwZo', 'nurl.ink/1joGE7');

-- ----------------------------
-- Table structure for t_link_locate_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_locate_stats`;
CREATE TABLE `t_link_locate_stats`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `cnt` int(0) NULL DEFAULT NULL COMMENT '访问量',
  `province` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省份名称',
  `city` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市名称',
  `adcode` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市编码',
  `country` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '国家标识',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0表示删除 1表示未删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_locate_stats`(`full_short_url`, `gid`, `date`, `adcode`, `province`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_locate_stats
-- ----------------------------
INSERT INTO `t_link_locate_stats` VALUES (49, 'nurl.ink/47LHFj', 'yRGcVO', '2024-06-22', 2, '未知', '未知', '未知', '中国', '2024-06-22 16:29:41', '2024-06-22 16:29:41', 0);
INSERT INTO `t_link_locate_stats` VALUES (51, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-24', 1, '未知', '未知', '未知', '中国', '2024-06-24 14:25:34', '2024-06-24 14:25:34', 0);
INSERT INTO `t_link_locate_stats` VALUES (52, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-24', 2, '未知', '未知', '未知', '中国', '2024-06-24 23:57:15', '2024-06-24 23:57:15', 0);
INSERT INTO `t_link_locate_stats` VALUES (54, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-25', 2, '未知', '未知', '未知', '中国', '2024-06-25 09:22:54', '2024-06-25 09:22:54', 0);
INSERT INTO `t_link_locate_stats` VALUES (55, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-25', 1, '未知', '未知', '未知', '中国', '2024-06-25 09:23:54', '2024-06-25 09:23:54', 0);
INSERT INTO `t_link_locate_stats` VALUES (57, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-07-08', 1, '未知', '未知', '未知', '中国', '2024-07-08 13:11:56', '2024-07-08 13:11:56', 0);
INSERT INTO `t_link_locate_stats` VALUES (58, 'v.star17.cn/vWtHj', 'yRGcVO', '2024-07-08', 1, '未知', '未知', '未知', '中国', '2024-07-08 13:25:32', '2024-07-08 13:25:32', 0);
INSERT INTO `t_link_locate_stats` VALUES (59, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-08', 1, '未知', '未知', '未知', '中国', '2024-07-08 14:00:05', '2024-07-08 14:00:05', 0);
INSERT INTO `t_link_locate_stats` VALUES (60, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-09', 1, '未知', '未知', '未知', '中国', '2024-07-09 15:23:02', '2024-07-09 15:23:02', 0);
INSERT INTO `t_link_locate_stats` VALUES (61, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-11', 3, '未知', '未知', '未知', '中国', '2024-07-11 12:15:41', '2024-07-11 12:15:41', 0);
INSERT INTO `t_link_locate_stats` VALUES (64, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-11', 1, '北京市', '北京市', '110000', '中国', '2024-07-11 12:38:32', '2024-07-11 12:38:32', 0);
INSERT INTO `t_link_locate_stats` VALUES (65, 'nurl.ink/3Y4CMm', 'yRGcVO', '2024-07-12', 1, '未知', '未知', '未知', '中国', '2024-07-12 09:26:30', '2024-07-12 09:26:30', 0);
INSERT INTO `t_link_locate_stats` VALUES (66, 'nurl.ink/2JHHzS', 'yRGcVO', '2024-07-12', 1, '未知', '未知', '未知', '中国', '2024-07-12 09:29:01', '2024-07-12 09:29:01', 0);
INSERT INTO `t_link_locate_stats` VALUES (67, 'nurl.ink/m41bm', 'yRGcVO', '2024-07-30', 11, '未知', '未知', '未知', '中国', '2024-07-30 16:09:59', '2024-07-30 16:09:59', 0);
INSERT INTO `t_link_locate_stats` VALUES (73, 'nurl.ink/1hwUDM', 'yRGcVO', '2024-07-30', 1, '未知', '未知', '未知', '中国', '2024-07-30 21:03:39', '2024-07-30 21:03:39', 0);
INSERT INTO `t_link_locate_stats` VALUES (79, 'nurl.ink/1igHsq', 'yRGcVO', '2024-08-09', 1, '未知', '未知', '未知', '中国', '2024-08-09 13:17:04', '2024-08-09 13:17:04', 0);

-- ----------------------------
-- Table structure for t_link_network_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_network_stats`;
CREATE TABLE `t_link_network_stats`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `cnt` int(0) NULL DEFAULT NULL COMMENT '访问量',
  `network` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问网络',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_browser_stats`(`full_short_url`, `gid`, `date`, `network`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_network_stats
-- ----------------------------
INSERT INTO `t_link_network_stats` VALUES (25, 'nurl.ink/47LHFj', 'yRGcVO', '2024-06-22', 2, 'Mobile', '2024-06-22 16:29:41', '2024-06-22 16:29:41', 0);
INSERT INTO `t_link_network_stats` VALUES (27, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-24', 1, 'Mobile', '2024-06-24 14:25:34', '2024-06-24 14:25:34', 0);
INSERT INTO `t_link_network_stats` VALUES (28, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-24', 2, 'Mobile', '2024-06-24 23:57:15', '2024-06-24 23:57:15', 0);
INSERT INTO `t_link_network_stats` VALUES (30, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-25', 2, 'Mobile', '2024-06-25 09:22:54', '2024-06-25 09:22:54', 0);
INSERT INTO `t_link_network_stats` VALUES (31, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-25', 1, 'Mobile', '2024-06-25 09:23:54', '2024-06-25 09:23:54', 0);
INSERT INTO `t_link_network_stats` VALUES (33, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-07-08', 1, 'Mobile', '2024-07-08 13:11:57', '2024-07-08 13:11:57', 0);
INSERT INTO `t_link_network_stats` VALUES (34, 'v.star17.cn/vWtHj', 'yRGcVO', '2024-07-08', 1, 'Mobile', '2024-07-08 13:25:32', '2024-07-08 13:25:32', 0);
INSERT INTO `t_link_network_stats` VALUES (35, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-08', 1, 'Mobile', '2024-07-08 14:00:05', '2024-07-08 14:00:05', 0);
INSERT INTO `t_link_network_stats` VALUES (36, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-09', 1, 'Mobile', '2024-07-09 15:23:02', '2024-07-09 15:23:02', 0);
INSERT INTO `t_link_network_stats` VALUES (37, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-11', 4, 'Mobile', '2024-07-11 12:15:41', '2024-07-11 12:15:41', 0);
INSERT INTO `t_link_network_stats` VALUES (41, 'nurl.ink/3Y4CMm', 'yRGcVO', '2024-07-12', 1, 'Mobile', '2024-07-12 09:26:30', '2024-07-12 09:26:30', 0);
INSERT INTO `t_link_network_stats` VALUES (42, 'nurl.ink/2JHHzS', 'yRGcVO', '2024-07-12', 1, 'Mobile', '2024-07-12 09:29:01', '2024-07-12 09:29:01', 0);
INSERT INTO `t_link_network_stats` VALUES (43, 'nurl.ink/m41bm', 'yRGcVO', '2024-07-30', 11, 'Mobile', '2024-07-30 16:09:59', '2024-07-30 16:09:59', 0);
INSERT INTO `t_link_network_stats` VALUES (49, 'nurl.ink/1hwUDM', 'yRGcVO', '2024-07-30', 1, 'Mobile', '2024-07-30 21:03:40', '2024-07-30 21:03:40', 0);
INSERT INTO `t_link_network_stats` VALUES (55, 'nurl.ink/1igHsq', 'yRGcVO', '2024-08-09', 1, 'Mobile', '2024-08-09 13:17:04', '2024-08-09 13:17:04', 0);

-- ----------------------------
-- Table structure for t_link_os_stats
-- ----------------------------
DROP TABLE IF EXISTS `t_link_os_stats`;
CREATE TABLE `t_link_os_stats`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '完整短链接',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `cnt` int(0) NULL DEFAULT NULL COMMENT '访问量',
  `os` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0表示删除 1表示未删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_locale_stats`(`full_short_url`, `gid`, `date`, `os`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 67 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '短链接监控操作系统访问状态' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_os_stats
-- ----------------------------
INSERT INTO `t_link_os_stats` VALUES (38, 'nurl.ink/47LHFj', 'yRGcVO', '2024-06-22', 2, 'Windows', '2024-06-22 16:29:41', '2024-06-22 16:29:41', 0);
INSERT INTO `t_link_os_stats` VALUES (40, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-24', 1, 'Windows', '2024-06-24 14:25:34', '2024-06-24 14:25:34', 0);
INSERT INTO `t_link_os_stats` VALUES (41, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-24', 2, 'Windows', '2024-06-24 23:57:15', '2024-06-24 23:57:15', 0);
INSERT INTO `t_link_os_stats` VALUES (43, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-06-25', 2, 'Windows', '2024-06-25 09:22:54', '2024-06-25 09:22:54', 0);
INSERT INTO `t_link_os_stats` VALUES (44, 'nurl.ink/1igHsq', 'yRGcVO', '2024-06-25', 1, 'Windows', '2024-06-25 09:23:54', '2024-06-25 09:23:54', 0);
INSERT INTO `t_link_os_stats` VALUES (46, 'nurl.ink/3bwx2S', 'yRGcVO', '2024-07-08', 1, 'Windows', '2024-07-08 13:11:56', '2024-07-08 13:11:56', 0);
INSERT INTO `t_link_os_stats` VALUES (47, 'v.star17.cn/vWtHj', 'yRGcVO', '2024-07-08', 1, 'Windows', '2024-07-08 13:25:32', '2024-07-08 13:25:32', 0);
INSERT INTO `t_link_os_stats` VALUES (48, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-08', 1, 'Windows', '2024-07-08 14:00:05', '2024-07-08 14:00:05', 0);
INSERT INTO `t_link_os_stats` VALUES (49, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-09', 1, 'Windows', '2024-07-09 15:23:02', '2024-07-09 15:23:02', 0);
INSERT INTO `t_link_os_stats` VALUES (50, 'nurl.ink/4JP9z', 'yRGcVO', '2024-07-11', 4, 'Windows', '2024-07-11 12:15:41', '2024-07-11 12:15:41', 0);
INSERT INTO `t_link_os_stats` VALUES (54, 'nurl.ink/3Y4CMm', 'yRGcVO', '2024-07-12', 1, 'Windows', '2024-07-12 09:26:30', '2024-07-12 09:26:30', 0);
INSERT INTO `t_link_os_stats` VALUES (55, 'nurl.ink/2JHHzS', 'yRGcVO', '2024-07-12', 1, 'Windows', '2024-07-12 09:29:01', '2024-07-12 09:29:01', 0);
INSERT INTO `t_link_os_stats` VALUES (56, 'nurl.ink/m41bm', 'yRGcVO', '2024-07-30', 11, 'Windows', '2024-07-30 16:09:59', '2024-07-30 16:09:59', 0);
INSERT INTO `t_link_os_stats` VALUES (62, 'nurl.ink/1hwUDM', 'yRGcVO', '2024-07-30', 1, 'Windows', '2024-07-30 21:03:39', '2024-07-30 21:03:39', 0);
INSERT INTO `t_link_os_stats` VALUES (68, 'nurl.ink/1igHsq', 'yRGcVO', '2024-08-09', 1, 'Windows', '2024-08-09 13:17:04', '2024-08-09 13:17:04', 0);

-- ----------------------------
-- Table structure for t_link_stats_today_0
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_0`;
CREATE TABLE `t_link_stats_today_0`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_1
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_1`;
CREATE TABLE `t_link_stats_today_1`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_10
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_10`;
CREATE TABLE `t_link_stats_today_10`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_11
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_11`;
CREATE TABLE `t_link_stats_today_11`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_12
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_12`;
CREATE TABLE `t_link_stats_today_12`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_13
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_13`;
CREATE TABLE `t_link_stats_today_13`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_14
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_14`;
CREATE TABLE `t_link_stats_today_14`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_15
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_15`;
CREATE TABLE `t_link_stats_today_15`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_2
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_2`;
CREATE TABLE `t_link_stats_today_2`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_link_stats_today_2
-- ----------------------------
INSERT INTO `t_link_stats_today_2` VALUES (3, 'yRGcVO', 'nurl.ink/47LHFj', '2024-06-22', 2, 1, 1, '2024-06-22 16:29:41', '2024-06-22 16:29:41', 0);
INSERT INTO `t_link_stats_today_2` VALUES (5, 'yRGcVO', 'nurl.ink/3bwx2S', '2024-06-24', 1, 1, 1, '2024-06-24 14:25:34', '2024-06-24 14:25:34', 0);
INSERT INTO `t_link_stats_today_2` VALUES (6, 'yRGcVO', 'nurl.ink/1igHsq', '2024-06-24', 2, 1, 1, '2024-06-24 23:57:15', '2024-06-24 23:57:15', 0);
INSERT INTO `t_link_stats_today_2` VALUES (8, 'yRGcVO', 'nurl.ink/3bwx2S', '2024-06-25', 2, 0, 0, '2024-06-25 09:23:14', '2024-06-25 09:23:14', 0);
INSERT INTO `t_link_stats_today_2` VALUES (9, 'yRGcVO', 'nurl.ink/1igHsq', '2024-06-25', 1, 0, 0, '2024-06-25 09:24:43', '2024-06-25 09:24:43', 0);
INSERT INTO `t_link_stats_today_2` VALUES (11, 'yRGcVO', 'nurl.ink/3bwx2S', '2024-07-08', 1, 0, 0, '2024-07-08 13:11:57', '2024-07-08 13:11:57', 0);
INSERT INTO `t_link_stats_today_2` VALUES (12, 'yRGcVO', 'v.star17.cn/vWtHj', '2024-07-08', 1, 1, 1, '2024-07-08 13:25:32', '2024-07-08 13:25:32', 0);
INSERT INTO `t_link_stats_today_2` VALUES (13, 'yRGcVO', 'nurl.ink/4JP9z', '2024-07-08', 1, 1, 1, '2024-07-08 14:00:05', '2024-07-08 14:00:05', 0);
INSERT INTO `t_link_stats_today_2` VALUES (14, 'yRGcVO', 'nurl.ink/4JP9z', '2024-07-09', 1, 0, 0, '2024-07-09 15:23:02', '2024-07-09 15:23:02', 0);
INSERT INTO `t_link_stats_today_2` VALUES (15, 'yRGcVO', 'nurl.ink/4JP9z', '2024-07-11', 4, 0, 0, '2024-07-11 12:15:41', '2024-07-11 12:15:41', 0);
INSERT INTO `t_link_stats_today_2` VALUES (19, 'yRGcVO', 'nurl.ink/3Y4CMm', '2024-07-12', 1, 1, 1, '2024-07-12 09:26:30', '2024-07-12 09:26:30', 0);
INSERT INTO `t_link_stats_today_2` VALUES (20, 'yRGcVO', 'nurl.ink/2JHHzS', '2024-07-12', 1, 1, 1, '2024-07-12 09:29:01', '2024-07-12 09:29:01', 0);
INSERT INTO `t_link_stats_today_2` VALUES (21, 'yRGcVO', 'nurl.ink/m41bm', '2024-07-30', 11, 1, 1, '2024-07-30 16:09:59', '2024-07-30 16:09:59', 0);
INSERT INTO `t_link_stats_today_2` VALUES (27, 'yRGcVO', 'nurl.ink/1hwUDM', '2024-07-30', 1, 1, 1, '2024-07-30 21:03:40', '2024-07-30 21:03:40', 0);
INSERT INTO `t_link_stats_today_2` VALUES (33, 'yRGcVO', 'nurl.ink/1igHsq', '2024-08-09', 1, 1, 0, '2024-08-09 13:17:04', '2024-08-09 13:17:04', 0);

-- ----------------------------
-- Table structure for t_link_stats_today_3
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_3`;
CREATE TABLE `t_link_stats_today_3`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_4
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_4`;
CREATE TABLE `t_link_stats_today_4`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_5
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_5`;
CREATE TABLE `t_link_stats_today_5`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_6
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_6`;
CREATE TABLE `t_link_stats_today_6`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_7
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_7`;
CREATE TABLE `t_link_stats_today_7`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_8
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_8`;
CREATE TABLE `t_link_stats_today_8`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_link_stats_today_9
-- ----------------------------
DROP TABLE IF EXISTS `t_link_stats_today_9`;
CREATE TABLE `t_link_stats_today_9`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `gid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'default' COMMENT '分组标识',
  `full_short_url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短链接',
  `date` date NULL DEFAULT NULL COMMENT '日期',
  `today_pv` int(0) NULL DEFAULT 0 COMMENT '今日PV',
  `today_uv` int(0) NULL DEFAULT 0 COMMENT '今日UV',
  `today_uip` int(0) NULL DEFAULT 0 COMMENT '今日IP数',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_today_stats`(`full_short_url`, `gid`, `date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_0
-- ----------------------------
DROP TABLE IF EXISTS `t_user_0`;
CREATE TABLE `t_user_0`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB AUTO_INCREMENT = 1786989037672747010 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_1
-- ----------------------------
DROP TABLE IF EXISTS `t_user_1`;
CREATE TABLE `t_user_1`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_10
-- ----------------------------
DROP TABLE IF EXISTS `t_user_10`;
CREATE TABLE `t_user_10`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB AUTO_INCREMENT = 1792025677034283009 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_11
-- ----------------------------
DROP TABLE IF EXISTS `t_user_11`;
CREATE TABLE `t_user_11`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB AUTO_INCREMENT = 1792021079665975297 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_12
-- ----------------------------
DROP TABLE IF EXISTS `t_user_12`;
CREATE TABLE `t_user_12`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB AUTO_INCREMENT = 1792020564571889665 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_13
-- ----------------------------
DROP TABLE IF EXISTS `t_user_13`;
CREATE TABLE `t_user_13`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB AUTO_INCREMENT = 1804427524017590274 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_13
-- ----------------------------
INSERT INTO `t_user_13` VALUES (1804427524017590274, 'tomoyo', '1234', '大道寺知世', 'AgckMg+CMvDw1o9zRXhbLQ==', 'S4ZaXfTLgg0WwPhkhC51UolwzzGi7PmNM8Op7T/TutA=', NULL, '2024-06-22 16:13:41', '2024-06-24 14:32:20', 0);

-- ----------------------------
-- Table structure for t_user_14
-- ----------------------------
DROP TABLE IF EXISTS `t_user_14`;
CREATE TABLE `t_user_14`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB AUTO_INCREMENT = 1790313292611211265 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_15
-- ----------------------------
DROP TABLE IF EXISTS `t_user_15`;
CREATE TABLE `t_user_15`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_2
-- ----------------------------
DROP TABLE IF EXISTS `t_user_2`;
CREATE TABLE `t_user_2`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_3
-- ----------------------------
DROP TABLE IF EXISTS `t_user_3`;
CREATE TABLE `t_user_3`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_4
-- ----------------------------
DROP TABLE IF EXISTS `t_user_4`;
CREATE TABLE `t_user_4`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_5
-- ----------------------------
DROP TABLE IF EXISTS `t_user_5`;
CREATE TABLE `t_user_5`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_6
-- ----------------------------
DROP TABLE IF EXISTS `t_user_6`;
CREATE TABLE `t_user_6`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_7
-- ----------------------------
DROP TABLE IF EXISTS `t_user_7`;
CREATE TABLE `t_user_7`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_8
-- ----------------------------
DROP TABLE IF EXISTS `t_user_8`;
CREATE TABLE `t_user_8`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for t_user_9
-- ----------------------------
DROP TABLE IF EXISTS `t_user_9`;
CREATE TABLE `t_user_9`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `real_name` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `phone` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `mail` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `deletion_time` bigint(0) NULL DEFAULT NULL COMMENT '注销时间戳',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `del_flag` tinyint(1) NULL DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_unique_username`(`username`) USING BTREE COMMENT '用户名不可重复'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
