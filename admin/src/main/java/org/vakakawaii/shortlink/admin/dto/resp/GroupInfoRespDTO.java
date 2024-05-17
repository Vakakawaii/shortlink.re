package org.vakakawaii.shortlink.admin.dto.resp;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;
import org.vakakawaii.shortlink.admin.common.serialize.PhoneDesensitizationSerializer;

/**
 * 分组信息响应实体
 */
@Data
public class GroupInfoRespDTO {

    /**
     * 分组标识
     */
    private String gid;

    /**
     * 分组名称
     */
    private String name;

    /**
     * 排序
     */
    private Integer sortOrder;
}
