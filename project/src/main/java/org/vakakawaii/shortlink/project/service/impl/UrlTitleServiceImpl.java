package org.vakakawaii.shortlink.project.service.impl;

import lombok.SneakyThrows;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.project.service.UrlTitleService;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.SocketTimeoutException;
import java.net.URL;

@Service
public class UrlTitleServiceImpl implements UrlTitleService {

    private static final int TIMEOUT_MS = 2333; // 7.777 seconds

    @SneakyThrows
    @Override
    public String getTitleByUrl(String url) {
        try {
            URL targetUrl = new URL(url);
            HttpURLConnection connection = (HttpURLConnection) targetUrl.openConnection();
            connection.setRequestMethod("GET");
            connection.setConnectTimeout(TIMEOUT_MS);
            connection.setReadTimeout(TIMEOUT_MS);
            connection.connect();
            int responseCode = connection.getResponseCode();
            if (responseCode == HttpURLConnection.HTTP_OK) {
                Document document = Jsoup.connect(url).timeout(TIMEOUT_MS).get();
                return document.title();
            }
            return "获取网页标题失败\uD83D\uDE0A.";
        } catch (SocketTimeoutException e) {
            return "获取网页标题失败\uD83D\uDE0A，国家长城防火墙为您保驾护航(doge)";
        } catch (IOException e) {
            return "获取网页标题失败\uD83D\uDE0A.";
        }
    }
}
