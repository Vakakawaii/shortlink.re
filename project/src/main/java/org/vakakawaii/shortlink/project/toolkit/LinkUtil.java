package org.vakakawaii.shortlink.project.toolkit;

import cn.hutool.core.date.DateUnit;
import cn.hutool.core.date.DateUtil;
import jakarta.servlet.http.HttpServletRequest;

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


    /**
     * 获取用户访问操作系统
     *
     * @param request 请求
     * @return 访问操作系统
     */
    public static String getOs(HttpServletRequest request) {
        String userAgent = request.getHeader("User-Agent");
        if (userAgent.toLowerCase().contains("windows")) {
            return "Windows";
        } else if (userAgent.toLowerCase().contains("mac")) {
            return "Mac OS";
        } else if (userAgent.toLowerCase().contains("linux")) {
            return "Linux";
        } else if (userAgent.toLowerCase().contains("unix")) {
            return "Unix";
        } else if (userAgent.toLowerCase().contains("android")) {
            return "Android";
        } else if (userAgent.toLowerCase().contains("iphone")) {
            return "iOS";
        } else {
            return "Unknown";
        }
    }

    /**
     * 获取用户真实IP地址，不使用request.getRemoteAddr();的原因是有可能用户使用了代理软件方式避免真实IP地址,
     *
     * @param request HttpServletRequest
     * @return 真实的用户IP地址
     */
    public static String getRealIp(HttpServletRequest request) {
        String ip = null;
        String[] headers = {
                "X-Forwarded-For",
                "Proxy-Client-IP",
                "WL-Proxy-Client-IP",
                "HTTP_CLIENT_IP",
                "HTTP_X_FORWARDED_FOR"
        };

        for (String header : headers) {
            ip = request.getHeader(header);
            if (ip != null && ip.length() != 0 && !"unknown".equalsIgnoreCase(ip)) {
                // 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
                if (ip.contains(",")) {
                    ip = ip.split(",")[0];
                }
                break;
            }
        }

        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }

        return ip;
    }
}
