package org.vakakawaii.shortlink.project.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import org.vakakawaii.shortlink.project.dao.mapper.LinkAccessStatsMapper;
import org.vakakawaii.shortlink.project.dto.req.LinkGroupStatsAccessRecordReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkGroupStatsReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsAccessRecordReqDTO;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkStatsAccessRecordRespDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkStatsRespDTO;

import java.util.List;

public interface LinkStatsService {


    LinkStatsRespDTO oneLinkStats(LinkStatsReqDTO linkStatsReqDTO);

    IPage<LinkStatsAccessRecordRespDTO> logLinkAccess(LinkStatsAccessRecordReqDTO linkStatsAccessRecordReqDTO);

    LinkStatsRespDTO groupLinkStats(LinkGroupStatsReqDTO linkGroupStatsReqDTO);

    IPage<LinkStatsAccessRecordRespDTO> groupLogLinkAccess(LinkGroupStatsAccessRecordReqDTO linkGroupStatsAccessRecordReqDTO);
}
