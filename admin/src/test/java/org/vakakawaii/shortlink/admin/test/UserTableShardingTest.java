package org.vakakawaii.shortlink.admin.test;

public class UserTableShardingTest {

    private static final String SQL = "CREATE TABLE `t_group_%d` (\n" +
            "  `id` bigint unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',\n" +
            "  `gid` varchar(32) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组标识',\n" +
            "  `name` varchar(64) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '分组名称',\n" +
            "  `username` varchar(256) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '创建分组用户名',\n" +
            "  `sort_order` int DEFAULT NULL COMMENT '分组排序',\n" +
            "  `create_time` datetime DEFAULT NULL COMMENT '创建时间',\n" +
            "  `update_time` datetime DEFAULT NULL COMMENT '修改时间',\n" +
            "  `del_flag` tinyint(1) DEFAULT NULL COMMENT '删除标识 0：未删除 1：已删除',\n" +
            "  PRIMARY KEY (`id`),\n" +
            "  UNIQUE KEY `idx_unique_gid_username` (`gid`,`username`) USING BTREE\n" +
            ") ENGINE=InnoDB AUTO_INCREMENT=1786990330600509443 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;";

    public static void main(String[] args) {
        for (int i = 0; i < 16; i++) {
            System.out.printf((SQL) + "%n", i);
        }
    }
}
