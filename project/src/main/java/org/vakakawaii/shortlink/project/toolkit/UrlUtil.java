package org.vakakawaii.shortlink.project.toolkit;

import cn.hutool.core.util.ObjectUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.core.util.URLUtil;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import java.net.URL;

public class UrlUtil {

    public static String getFaviconUrl(String link) {
        String urlJoinHttps = "";
        String faviconHref = "";
        String protocol = "";
        String host = "";
        int timeout = 2333; // 超时时间，单位为毫秒（例如5秒）
        try {
            String linkTrim = StrUtil.trimToEmpty(link);
            // 假设输入的参数不携带协议，则拼接协议
            urlJoinHttps = urlJoinHttps(linkTrim);

            URL url = new URL(urlJoinHttps);
            protocol = url.getProtocol();
            host = url.getHost();
            //忽略SSL证书
            SslUtil.ignoreSsl();
            // 发请求
            Document document = Jsoup.connect(urlJoinHttps)
                    .timeout(timeout)
                    .get();
            // 筛选包含favicon图标的link标签
            Elements title = document.select("link[type=image/x-icon]");
            title = ObjectUtil.isEmpty(title) ? document.select("link[rel$=icon]") : title;

            if (title.size() == 0) {
                System.out.println("[" + urlJoinHttps + "]找不到");
                return faviconJoinHttps(protocol, host, faviconHref) + "favicon.ico";
            }
            // 获取favicon路径
            faviconHref = title.attr("href");
            // 假设获取到的favicon路径已经包含了域名，则直接返回，没有则拼接
            String faviconJoinHttps = faviconJoinHttps(protocol, host, faviconHref);
            String img = URLUtil.normalize(isImg(protocol, host, faviconJoinHttps));
            return img;
        } catch (Exception e) {
            System.out.println("[" + urlJoinHttps + "]获取失败:" + e);
            return URLUtil.normalize(faviconJoinHttps(protocol, host, faviconHref) + "/favicon.ico");
        }
    }

    public static String urlJoinHttps(String url) {
        String lowerCaseStr = url.toLowerCase();
        if (!lowerCaseStr.startsWith("http:") && !lowerCaseStr.startsWith("https:")) {
            return "https://" + url;
        } else {
            return url;
        }
    }

    public static String faviconJoinHttps(String protocol, String host, String faviconHref) {
        if (faviconHref.contains("http") || faviconHref.contains("https") || faviconHref.contains(".com") || faviconHref.contains(".cn")) {
            return faviconHref;
        } else {
            if (faviconHref.startsWith("/")) {
                return protocol + "://" + host + faviconHref;
            } else {
                return protocol + "://" + host + "/" + faviconHref;
            }
        }
    }

    public static String isImg(String protocol, String host, String faviconJoinHttps) {
        if (faviconJoinHttps.contains(".jpg") || faviconJoinHttps.contains(".ico") || faviconJoinHttps.contains(".png") || faviconJoinHttps.contains(".jpeg") || faviconJoinHttps.contains(".svg") || faviconJoinHttps.contains(".webp")) {
            return faviconJoinHttps;
        } else {
            return faviconJoinHttps(protocol, host, faviconJoinHttps);
        }
    }

}
