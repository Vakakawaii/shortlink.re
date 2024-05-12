package org.vakakawaii.shortlink.project.dto.resp;

import lombok.Data;

import java.util.Date;

@Data
public class LinkCreateRespDTO {
    /**
     * 分组标识
     */
    private String gid;

    /**
     * 短链接
     */
    private String shortUri;

    /**
     * 完整短链接
     */
    private String fullShortUrl;
}
