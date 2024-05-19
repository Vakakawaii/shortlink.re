package org.vakakawaii.shortlink.admin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import org.vakakawaii.shortlink.admin.dao.entity.GroupDO;
import org.vakakawaii.shortlink.admin.dto.req.GroupSortReqDTO;
import org.vakakawaii.shortlink.admin.dto.req.GroupUpdateReqDTO;
import org.vakakawaii.shortlink.admin.dto.resp.GroupInfoRespDTO;

import java.util.List;

/**
 * 分组接口层
 */
public interface GroupService extends IService<GroupDO> {


    /**
     * @param username 用户名
     * @param name 分组名
     */
    void saveGroup(String username,String name);

    /**
     * @param name 分组名
     */
    void saveGroup(String name);

    /**
     * 查询分组
     * @return 列表
     */
    List<GroupInfoRespDTO> listGroup();

    /**
     * 更新参数
     */
    void updateGroup(GroupUpdateReqDTO groupUpdateReqDTO);

    /**
     * 删除分组
     */
    void deleteGroup(String gid);

    /**
     * 排序group
     */
    void sortGroup(List<GroupSortReqDTO> groupSortReqDTOS);
}
