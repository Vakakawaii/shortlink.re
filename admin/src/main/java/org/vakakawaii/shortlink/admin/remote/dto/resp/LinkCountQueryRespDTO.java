package org.vakakawaii.shortlink.admin.remote.dto.resp;

import lombok.Data;

/**
 * 短连接分组查询返回参数
 */
@Data
public class LinkCountQueryRespDTO {

    private String gid;

    private  Integer count;
}
