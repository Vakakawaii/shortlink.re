package org.vakakawaii.shortlink.admin.dto.req;

import lombok.Data;

/**
 * 短连接分组更新参数
 */
@Data
public class GroupUpdateReqDTO {

    /**
     * 分组名
     */
    private String name;

    /**
     * 分组标识
     */
    private String gid;
}
