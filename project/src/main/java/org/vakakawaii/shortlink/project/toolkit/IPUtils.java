package org.vakakawaii.shortlink.project.toolkit;

import jakarta.servlet.http.HttpServletRequest;

public class IPUtils {

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
