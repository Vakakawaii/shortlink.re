package org.vakakawaii.shortlink.project.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkPageReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkPageRespDTO;

public interface LinkService extends IService<LinkDO> {
    LinkCreateRespDTO createLink(LinkCreateReqDTO linkCreateReqDTO);


    IPage<LinkPageRespDTO> pageLink(LinkPageReqDTO linkPageReqDTO);
}

