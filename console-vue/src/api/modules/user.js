import http from '../axios'
export default {
  // 注册
  addUser(data) {
    return http({
      url: '/user/register',
      method: 'post',
      data
    })
  },
  // 编辑信息
  editUser(data) {
    return http({
      url: '/user/update',
      method: 'put',
      data
    })
  },
  // 登录
  login(data) {
    return http({
      url: '/user/login',
      method: 'post',
      data
    })
  },
  // 退出登录
  logout(data) {
    return http({
      url: '/user/logout?token=' + data.token + '&username=' + data.username,
      method: 'delete'
    })
  },
  // 检查用户名是否可用
  hasUsername(data) {
    return http({
      url: '/user/is_username_exist',
      method: 'get',
      params: data
    })
  },
  // 根据用户名查找用户信息
  queryUserInfo(data) {
    return http({
      url: '/user/info/' + data,
      method: 'get'
    })
  }
}
