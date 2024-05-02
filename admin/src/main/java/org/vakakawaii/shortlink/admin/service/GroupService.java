package org.vakakawaii.shortlink.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.vakakawaii.shortlink.admin.dao.entity.GroupDO;
import org.vakakawaii.shortlink.admin.dto.resp.GroupInfoRespDTO;

import java.util.List;

/**
 * 分组接口层
 */
public interface GroupService extends IService<GroupDO> {


    /**
     * @param name 分组名
     */
    void saveGroup(String name);

    List<GroupInfoRespDTO> listGroup();
}
