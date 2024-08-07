package org.vakakawaii.shortlink.project.dto.req;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;

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
