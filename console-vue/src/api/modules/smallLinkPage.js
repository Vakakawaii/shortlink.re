import http from '../axios'
export default {
  // 分页查询短连接
  queryPage(data) {
    return http({
      url: '/link/page',
      method: 'get',
      params: data
    })
  },
  // 创建新短连接
  addSmallLink(data) {
    return http({
      url: '/link/create',
      method: 'post',
      data
    })
  },
  // todo 批量创建短连接
  addLinks(data) {
    return http({
      responseType: 'arraybuffer',
      url: '/create/batch',
      method: 'post',
      data,
      // responseType: 'blob'
    })
  },
  // 编辑短连接
  editSmallLink(data) {
    return http({
      url: '/link/update',
      method: 'post',
      data
    })
  },
  // 通过链接查询标题
  queryTitle(data) {
    return http({
      method: 'get',
      url: '/title',
      params: data
    })
  },
  // 移动到回收站
  toRecycleBin(data) {
    return http({
      url: '/bin/save',
      method: 'post',
      data
    })
  },
  // 查询回收站数据
  queryRecycleBin(data) {
    return http({
      url: '/bin/page',
      method: 'get',
      params: data
    })
  },
  // 恢复短链接
  recoverLink(data) {
    return http({
      method: 'post',
      url: '/bin/recover',
      data
    })
  },
  // 删除短连接
  removeLink(data) {
    return http({
      method: 'post',
      url: '/bin/delete',
      data
    })
  },
  // 查询单链的图表数据
  queryLinkStats(data) {
    return http({
      method: 'get',
      params: data,
      url: '/stats/one'
    })
  },
  // 查询分组的访问记录
  queryLinkTable(data) {
    return http({
      method: 'get',
      params: data,
      url: '/stats/one/log'
    })
  }
}
