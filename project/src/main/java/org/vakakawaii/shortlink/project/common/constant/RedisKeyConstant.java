package org.vakakawaii.shortlink.project.common.constant;

/**
 * Redis Key 常量类
 */
public class RedisKeyConstant {

    /**
     * 短连接跳转前缀 Key
     */
    public static final String GOTO_SHORT_LINK_KEY = "short_link_goto_%s";

    /**
     * 短连接跳转前缀 Key
     */
    public static final String GOTO_IS_NULL_SHORT_LINK_KEY = "short_link_goto_is_null_%s";

    /**
     * 短连接跳转 锁前缀
     */
    public static final String LOCK_GOTO_SHORT_LINK_KEY = "short_link_lock_goto_%s";


}
