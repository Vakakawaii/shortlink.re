package org.vakakawaii.shortlink.admin.remote.dto.req;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import lombok.Data;
import org.vakakawaii.shortlink.admin.dao.entity.LinkDO;

import java.util.List;

@Data
public class BinPageReqDTO extends Page<LinkDO> {

    /**
     * 分组标识
     */
    private List<String> gids;
}
