package org.vakakawaii.shortlink.project.service.impl;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.vakakawaii.shortlink.project.dao.entity.LinkDO;
import org.vakakawaii.shortlink.project.dao.mapper.LinkMapper;
import org.vakakawaii.shortlink.project.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.project.service.LinkService;
import org.vakakawaii.shortlink.project.toolkit.HashUtil;


@Service
@Slf4j
@RequiredArgsConstructor
public class LinkServiceImpl extends ServiceImpl<LinkMapper, LinkDO> implements LinkService {


    @Override
    public LinkCreateRespDTO createLink(LinkCreateReqDTO linkCreateReqDTO) {
        String suffix = generateSuffix(linkCreateReqDTO);
        LinkDO linkDO = BeanUtil.toBean(linkCreateReqDTO, LinkDO.class);
        linkDO.setFullShortUrl(linkCreateReqDTO.getDomain() + "/" + suffix);
        linkDO.setShortUri(suffix);
        linkDO.setEnableStatus(0);
        baseMapper.insert(linkDO);
        return LinkCreateRespDTO.builder()
                .gid(linkDO.getGid())
                .fullShortUrl(linkDO.getFullShortUrl())
                .shortUri(linkDO.getShortUri())
                .build();
    }

    private String generateSuffix(LinkCreateReqDTO linkCreateReqDTO) {
        String originUrl = linkCreateReqDTO.getOriginUrl();
        return HashUtil.hashToBase62(originUrl);
    }
}
