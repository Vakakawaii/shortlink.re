package org.vakakawaii.shortlink.project.dto.resp;

import lombok.Data;

import java.util.Date;

@Data
public class LinkPageRespDTO {

    /**
     * id
     */
    private Long id;

    /**
     * 分组标识
     */
    private String gid;

    /**
     * 域名
     */
    private String domain;

    /**
     * 短链接
     */
    private String shortUri;

    /**
     * 完整短链接
     */
    private String fullShortUrl;

    /**
     * 原始链接
     */
    private String originUrl;




    /**
     * 有效期类型 0:永久有效 1:自定义
     */
    private Integer validDateType;

    /**
     * 有效期
     */
    private Date validDate;

    /**
     * 描述
     */
    private String describe;

    /**
     *  图标
     */
    private String favicon;
}
