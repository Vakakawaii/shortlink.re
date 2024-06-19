package org.vakakawaii.shortlink.project.service;

import org.vakakawaii.shortlink.project.dao.mapper.LinkAccessStatsMapper;
import org.vakakawaii.shortlink.project.dto.req.LinkStatsReqDTO;
import org.vakakawaii.shortlink.project.dto.resp.LinkStatsRespDTO;

import java.util.List;

public interface LinkStatsService {


    LinkStatsRespDTO oneLinkStats(LinkStatsReqDTO linkStatsReqDTO);
}
