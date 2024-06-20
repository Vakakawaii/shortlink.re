package org.vakakawaii.shortlink.admin.test;

public class UserTableShardingTest {

    private static final String SQL =
            "ALTER TABLE t_link_%d " +
            "ADD COLUMN total_pv INT DEFAULT 0 COMMENT '历史pv'," +
            "ADD COLUMN total_uv INT DEFAULT 0 COMMENT '历史uv', " +
            " ADD COLUMN total_uip INT DEFAULT 0 COMMENT '历史uip';";

    public static void main(String[] args) {
        for (int i = 0; i < 16; i++) {
            System.out.printf((SQL) + "%n", i);
        }
    }
}
