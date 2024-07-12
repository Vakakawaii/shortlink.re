package org.vakakawaii.shortlink.admin.remote.dto.req;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import org.vakakawaii.shortlink.admin.dao.entity.LinkDO;

@Data
public class LinkPageReqDTO extends Page<LinkDO> {

    /**
     * 分组标识
     */
    private String gid;

    /**
     * 排序标识
     */
    private String orderTag;

    /**
     * 搜索关键字
     */
    private String input;
}
