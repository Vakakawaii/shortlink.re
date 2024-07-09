package org.vakakawaii.shortlink.project.dto.req;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;

import java.util.List;

@Data
public class BinPageReqDTO extends Page<LinkDO> {

    /**
     * 分组标识
     */
    private List<String> gids;

    /**
     * 排序标识
     */
    private String orderTag;
}
