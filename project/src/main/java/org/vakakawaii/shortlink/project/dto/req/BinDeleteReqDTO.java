package org.vakakawaii.shortlink.project.dto.req;

import lombok.Data;

@Data
public class BinDeleteReqDTO {
    /**
     * 分组标识
     */
    private String gid;

    /**
     * 完整短链接
     */
    private String fullShortUrl;

}
