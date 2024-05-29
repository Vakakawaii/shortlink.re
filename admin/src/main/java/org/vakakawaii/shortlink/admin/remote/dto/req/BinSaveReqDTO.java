package org.vakakawaii.shortlink.admin.remote.dto.req;

import lombok.Data;

@Data
public class BinSaveReqDTO {
    /**
     * 分组标识
     */
    private String gid;

    /**
     * 完整短链接
     */
    private String fullShortUrl;

}
