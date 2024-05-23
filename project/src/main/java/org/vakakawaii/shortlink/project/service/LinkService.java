package org.vakakawaii.shortlink.project.service;

import cn.hutool.http.server.HttpServerRequest;
import cn.hutool.http.server.HttpServerResponse;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkPageReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkUpdateReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCountQueryRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkPageRespDTO;

import java.util.List;

public interface LinkService extends IService<LinkDO> {


    void restoreUrl(String shortUri, ServletRequest request, ServletResponse response);

    LinkCreateRespDTO createLink(LinkCreateReqDTO linkCreateReqDTO);


    IPage<LinkPageRespDTO> pageLink(LinkPageReqDTO linkPageReqDTO);

    List<LinkCountQueryRespDTO> listCountLinkByGroupID(List<String> gids);

    void updateLink(LinkUpdateReqDTO linkUpdateReqDTO);
}

