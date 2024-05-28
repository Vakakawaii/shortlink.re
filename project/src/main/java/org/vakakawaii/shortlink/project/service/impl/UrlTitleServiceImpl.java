package org.vakakawaii.shortlink.project.service.impl;

import lombok.SneakyThrows;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.project.service.UrlTitleService;

@Service
public class UrlTitleServiceImpl implements UrlTitleService {

    @SneakyThrows
    @Override
    public String getTitleByUrl(String url) {
        Document doc = Jsoup.connect(url).get();
        return doc.title();
    }
}
