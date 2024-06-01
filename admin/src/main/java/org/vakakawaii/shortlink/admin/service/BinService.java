package org.vakakawaii.shortlink.admin.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import org.vakakawaii.shortlink.admin.common.convention.result.Result;
import org.vakakawaii.shortlink.admin.remote.dto.req.BinPageReqDTO;
import org.vakakawaii.shortlink.admin.remote.dto.resp.LinkPageRespDTO;

public interface BinService {
    Result<IPage<LinkPageRespDTO>> pageBin(BinPageReqDTO binPageReqDTO);
}
