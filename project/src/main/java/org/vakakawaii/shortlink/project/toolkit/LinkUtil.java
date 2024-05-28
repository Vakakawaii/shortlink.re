package org.vakakawaii.shortlink.project.toolkit;

import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;

import java.util.Date;
import java.util.Optional;

import static org.vakakawaii.shortlink.project.common.constant.LinkConstant.DEFAULT_CACHE_VALID_TIME;

/**
 * 短连接工具类
 */
public class LinkUtil {

    public static long getLinkCacheValidTime(Date validDate){
        return Optional.ofNullable(validDate)
                .map(each -> DateUtil.between(new Date(),each, DateUnit.MS))
                .orElse(DEFAULT_CACHE_VALID_TIME);
    }

}
