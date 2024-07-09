package org.vakakawaii.shortlink.admin.remote;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.TypeReference;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.web.bind.annotation.RequestParam;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.common.convention.result.Results;
import org.vakakawaii.shortlink.admin.remote.dto.req.*;
import org.vakakawaii.shortlink.admin.remote.dto.resp.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 短连接中台远程调用服务
 */
public interface LinkRemoteService {

    default Result<LinkCreateRespDTO> createLink(LinkCreateReqDTO linkCreateReqDTO){
        String resultBodyStr = HttpUtil
                .post("http://127.0.0.1:8010/api/short_link/project/v1/link/create",
                        JSON.toJSONString(linkCreateReqDTO));
        return JSON.parseObject(resultBodyStr, new TypeReference<>() {
        });
    }

    default Result<Void> updateLink(LinkUpdateReqDTO linkUpdateReqDTO){
        HttpUtil.post("http://127.0.0.1:8010/api/short_link/project/v1/link/update",
                        JSON.toJSONString(linkUpdateReqDTO));
        return Results.success();
    }

    default Result<IPage<LinkPageRespDTO>> pageLink(LinkPageReqDTO linkPageReqDTO){
        Map<String,Object> requestMap = new HashMap<>();
        requestMap.put("gid",linkPageReqDTO.getGid());
        requestMap.put("current", linkPageReqDTO.getCurrent());
        requestMap.put("size", linkPageReqDTO.getSize());
        requestMap.put("orderTag",linkPageReqDTO.getOrderTag());
        String resultPageStr = HttpUtil
                .get("http://127.0.0.1:8010/api/short_link/project/v1/link/page",requestMap);
        return JSON.parseObject(resultPageStr, new TypeReference<>() {
        });
    }

    default Result<List<LinkCountQueryRespDTO>> listCountLinkByGroupID(List<String> gids){
        Map<String,Object> requestMap = new HashMap<>();
        requestMap.put("gids",gids);
        String resultListStr = HttpUtil
                .get("http://127.0.0.1:8010/api/short_link/project/v1/link/count",requestMap);
        return JSON.parseObject(resultListStr, new TypeReference<>() {
        });
    }

    default Result<String> getTitleByUrl(String url){
        String resultStr = HttpUtil
                .get("http://127.0.0.1:8010/api/short_link/v1/title?url="+url);
        return JSON.parseObject(resultStr, new TypeReference<>() {
        });
    }

    default Result<Void> saveBin(BinSaveReqDTO binSaveReqDTO){
        HttpUtil.post("http://127.0.0.1:8010/api/short_link/v1/bin/save",
                JSON.toJSONString(binSaveReqDTO));
        return Results.success();
    }

    default Result<IPage<BinPageRespDTO>> pageBin(BinPageReqDTO binPageReqDTO){
        Map<String,Object> requestMap = new HashMap<>();
        requestMap.put("gids",binPageReqDTO.getGids());
        requestMap.put("current", binPageReqDTO.getCurrent());
        requestMap.put("size", binPageReqDTO.getSize());
        requestMap.put("orderTag",binPageReqDTO.getOrderTag());
        String resultPageStr = HttpUtil
                .get("http://127.0.0.1:8010/api/short_link/v1/bin/page",requestMap);
        return JSON.parseObject(resultPageStr, new TypeReference<>() {
        });
    }

    default Result<Void> recoverBin(BinSaveReqDTO binSaveReqDTO){
        HttpUtil.post("http://127.0.0.1:8010/api/short_link/v1/bin/recover",
                JSON.toJSONString(binSaveReqDTO));
        return Results.success();
    }

    default Result<Void> delBin(BinDeleteReqDTO binDeleteReqDTO){
        HttpUtil.post("http://127.0.0.1:8010/api/short_link/v1/bin/delete",
                JSON.toJSONString(binDeleteReqDTO));
        return Results.success();
    }

    default Result<LinkStatsRespDTO> oneLinkStats(LinkStatsReqDTO linkStatsReqDTO){
        Map<String,Object> requestMap = new HashMap<>();
        requestMap.put("gid",linkStatsReqDTO.getGid());
        requestMap.put("fullShortUrl",linkStatsReqDTO.getFullShortUrl());
        requestMap.put("enableStatus", linkStatsReqDTO.getEnableStatus());
        requestMap.put("startDate", linkStatsReqDTO.getStartDate());
        requestMap.put("endDate", linkStatsReqDTO.getEndDate());
        String resultStr = HttpUtil
                .get("http://127.0.0.1:8010/api/short_link/v1/stats/one",
                        requestMap);
        return JSON.parseObject(resultStr, new TypeReference<>() {
        });
    }

    default Result<IPage<LinkStatsAccessRecordRespDTO>> logLinkAccess(LinkStatsAccessRecordReqDTO linkStatsAccessRecordReqDTO){
        Map<String,Object> requestMap = new HashMap<>();
        requestMap.put("gid",linkStatsAccessRecordReqDTO.getGid());
        requestMap.put("fullShortUrl",linkStatsAccessRecordReqDTO.getFullShortUrl());
        requestMap.put("startDate", linkStatsAccessRecordReqDTO.getStartDate());
        requestMap.put("endDate", linkStatsAccessRecordReqDTO.getEndDate());
        String resultStr = HttpUtil
                .get("http://127.0.0.1:8010/api/short_link/v1/stats/one/log",
                        requestMap);
        return JSON.parseObject(resultStr, new TypeReference<>() {
        });
    }

    default Result<LinkStatsRespDTO> groupLinkStats(LinkGroupStatsReqDTO linkGroupStatsReqDTO){
        Map<String,Object> requestMap = new HashMap<>();
        requestMap.put("gid",linkGroupStatsReqDTO.getGid());
        requestMap.put("startDate", linkGroupStatsReqDTO.getStartDate());
        requestMap.put("endDate", linkGroupStatsReqDTO.getEndDate());
        String resultStr = HttpUtil
                .get("http://127.0.0.1:8010/api/short_link/v1/stats/group",
                        requestMap);
        return JSON.parseObject(resultStr, new TypeReference<>() {
        });
    }

    default Result<IPage<LinkStatsAccessRecordRespDTO>> groupLogLinkAccess(LinkGroupStatsAccessRecordReqDTO linkGroupStatsAccessRecordReqDTO){
        Map<String,Object> requestMap = new HashMap<>();
        requestMap.put("gid",linkGroupStatsAccessRecordReqDTO.getGid());
        requestMap.put("startDate", linkGroupStatsAccessRecordReqDTO.getStartDate());
        requestMap.put("endDate", linkGroupStatsAccessRecordReqDTO.getEndDate());
        String resultStr = HttpUtil
                .get("http://127.0.0.1:8010/api/short_link/v1/stats/group/log",
                        requestMap);
        return JSON.parseObject(resultStr, new TypeReference<>() {
        });
    }
}
