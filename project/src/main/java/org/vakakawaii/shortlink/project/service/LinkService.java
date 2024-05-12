package org.vakakawaii.shortlink.project.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;

public interface LinkService extends IService<LinkDO> {
    void createLink(LinkCreateReqDTO linkCreateReqDTO);
}
