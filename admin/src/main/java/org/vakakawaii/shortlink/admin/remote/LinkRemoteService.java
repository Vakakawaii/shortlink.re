package org.vakakawaii.shortlink.admin.remote;

import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson2.JSON;
import com.alibaba.fastjson2.TypeReference;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.springframework.web.bind.annotation.RequestParam;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.common.convention.result.Results;
import org.vakakawaii.shortlink.admin.remote.dto.req.LinkCreateReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.req.LinkPageReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkCountQueryRespDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkCreateRespDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkPageRespDTO;

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

    default Result<IPage<LinkPageRespDTO>> pageLink(LinkPageReqDTO linkPageReqDTO){
        Map<String,Object> requestMap = new HashMap<>();
        requestMap.put("gid",linkPageReqDTO.getGid());
        requestMap.put("current", linkPageReqDTO.getCurrent());
        requestMap.put("size", linkPageReqDTO.getSize());
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
}