package org.vakakawaii.shortlink.admin.dto.req;

import lombok.Data;

/**
 *排序DTO
 */
@Data
public class GroupSortReqDTO {

    /**
     * 分组标识
     */
    private String gid;

    /**
     * 排序
     */
    private Integer sortOrder;

}
