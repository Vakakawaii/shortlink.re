<template>
  <div class="common-layout">
    <el-container>
      <el-header height="54px" style="padding: 0">
        <div class="header">
<!--          XVII&#45;&#45;T H E  S T A R-->
          <div @click="toMySpace" class="logo">星星SEVENTEEN</div>
          <div style="display: flex; align-items: center ;padding-right: 20px">
            <a
              class="link-span"
              style="text-decoration: none"
              target="_blank"
              href="https://nageoffer.com/shortlink/"
              >什么是短连接服务？</a
            >
            <a
              class="link-span"
              style="text-decoration: none"
              target="_blank"
              href="https://gitee.com/vakakawaii"
              >🔥域名STAR17.CN备案中</a
            >
            <a
                class="link-span"
                style="text-decoration: none"
                target="_blank"
                href="https://gitee.com/vakakawaii"
            >管局审核辛苦了</a
            >
            <a
                class="link-span"
                style="text-decoration: none"
                target="_blank"
                href="https://gitee.com/vakakawaii"
            >此网站为个人学习saas系统。</a
            >
            <a
                class="link-span"
                style="text-decoration: none"
                target="_blank"
                href="https://gitee.com/vakakawaii"
            >Gitee本人</a
            >
            <a
                class="link-span"
                style="text-decoration: none"
                target="_blank"
                href="https://github.com/Vakakawaii"
            >GitHub本人</a
            >
<!--            <el-dropdown>-->
<!--              <div class="block">-->
<!--                <span-->
<!--                    class="name-span"-->
<!--                    style="text-decoration: none"-->
<!--                >{{username}}</span-->
<!--                >-->
<!--              </div>-->
<!--              <template #dropdown>-->
<!--                <el-dropdown-menu>-->
<!--                  <el-dropdown-item @click="toMine">个人信息</el-dropdown-item>-->
<!--                  <el-dropdown-item divided @click="logout">退出</el-dropdown-item>-->
<!--                </el-dropdown-menu>-->
<!--              </template>-->
<!--            </el-dropdown>-->


            <el-popover
                placement="bottom-end"
                trigger="hover"
                width="480px"
                v-if="Object.keys(username).length"
            >
              <div style="display: flex">
                <img src="@/assets/logo.png" height="200" width="200" />
                <el-descriptions title="管理员-CARD" style="width: 225px; margin-left: 25px;" column="1">
                  <el-descriptions-item label="ID:">{{ username }}</el-descriptions-item>
                  <el-descriptions-item label="名:">{{ userInfo?.data?.data?.realName  }}</el-descriptions-item>
                  <el-descriptions-item label="电话:">{{ userInfo?.data?.data?.phone  }}</el-descriptions-item>
                  <el-descriptions-item label="邮箱:">{{userInfo?.data?.data?.mail  }}</el-descriptions-item>
                  <el-descriptions-item label="信息変更:">
                    <el-tooltip effect="dark" content="点击变更信息或登入密码" placement="bottom">
                    <el-link :underline="false" type="info" @click="toMine">
                    <strong style="text-decoration: underline;color: gray;">可能&nbsp;</strong>
                    </el-link>
                    </el-tooltip>
                  </el-descriptions-item>
                </el-descriptions>
              </div>
              <el-divider></el-divider>
<!--              <span>&nbsp;</span>-->
              <span style="color: gray;">
                Hi~ 你好，管理员：
                <el-tooltip effect="dark" content="点击可以退出登录" placement="bottom">
                  <el-link :underline="false" type="info" @click="logout">
                    <strong style="text-decoration: underline;">{{ username }}</strong>
                  </el-link>
                </el-tooltip>
                &nbsp;(๑╹ヮ╹๑)ﾉ Studying makes me happy !
              </span>
              <template #reference>
                  <el-button circle style="background-color: transparent; border: 0">
                    <el-avatar>
                      <img src="@/assets/logo.png" />
                    </el-avatar>
                  </el-button>
              </template>
            </el-popover>

            <el-popover placement="bottom-end" trigger="hover"  width="280px" v-else>
              <el-card shadow="hover" @click.native="$router.push('/login')">
                <span style="color: gray;">
                  Hi~ 你现在是
                  <strong style="text-decoration: underline;">游客</strong>，点击登录吧~
                </span>
              </el-card>
            <template #reference>
              <el-button circle style="background-color: transparent; border: 0">
                <el-avatar>登录</el-avatar>
              </el-button>
            </template>
            </el-popover>


          </div>
        </div>
      </el-header>
      <el-main style="padding: 0">
        <div class="content-box">
          <RouterView class="content-space" />
        </div>
      </el-main>
      <!-- <el-container>
        <el-aside width="180px">
          <el-menu
            active-text-color="#073372"
            background-color="#0e5782"
            class="el-menu-vertical-demo"
            :default-active="getLasteRoute(route.path)"
            text-color="#fff"
            @select="handleSelect"
          >
            <template v-for="item in menuInfos" :key="item.name">
              <el-menu-item :index="item.path">
                <el-icon><icon-menu /></el-icon>
                <span>{{ item.name }}</span>
              </el-menu-item>
            </template>
          </el-menu></el-aside
        >

      </el-container> -->
    </el-container>
  </div>
</template>

<script setup>
import { ref, getCurrentInstance, onMounted } from 'vue'
import { useRouter } from 'vue-router'
import { removeKey, removeUsername, getToken, getUsername } from '@/core/auth.js'
import { ElMessage } from 'element-plus'
import {cloneDeep} from "lodash";
const { proxy } = getCurrentInstance()
const API = proxy.$API
// 当当前路径和菜单不匹配时，菜单不会被选中
const router = useRouter()
const squareUrl = ref('https://cube.elemecdn.com/9/c2/f0ee8a3c7c9638a54940382568c9dpng.png')
const toMine = () => {
  router.push('/home' + '/account')
}
// 登出
const logout = async () => {
  const token = getToken()
  const username = getUsername()
  // 请求登出的接口
  await API.user.logout({ token, username })
  // 删除cookies中的token和username
  removeUsername()
  removeKey()
  localStorage.removeItem('token')
  localStorage.removeItem('username')
  router.push('/login')
  ElMessage.success('成功退出！')
}
// 点击左上方的图片跳转到我的空间
const toMySpace = () => {
  router.push('/home' + '/space')
}
const username = ref('')

const userInfo = ref()
const userInfoForm = ref() // 修改信息
// const realname = ref('')
// const phone = ref('')
// const mail = ref('')
onMounted(async () => {
  const actualUsername = getUsername()
  const res = await API.user.queryUserInfo(actualUsername)

  userInfo.value = res
  userInfoForm.value = cloneDeep(userInfo.value.data?.data)
  // todo console.log('1')
  // if(res.data.status === '500'){
  //   await router.push("/login")
  // }

  // firstName.value = res?.data?.data?.realName?.split('')[0]
  username.value = truncateText(actualUsername, 8)
  // realname.value = truncateText(res.realName, 8)
  // phone.value = truncateText(res.phone, 11)
  // mail.value = truncateText(res.mail, 30)
})
const extractColorByName = (name) => {
  var temp = []
  temp.push('#')
  for (let index = 0; index < name.length; index++) {
    temp.push(parseInt(name[index].charCodeAt(0), 10).toString(16))
  }
  return temp.slice(0, 5).join('').slice(0, 4)
}

// 辅助函数，用于截断文本
const truncateText = (text, maxLength) => {
  return text.length > maxLength ? text.slice(0, maxLength) + '...' : text
}
</script>

<style lang="scss" scoped>
.el-container {
  height: 100vh;

  .el-aside {
    border: 0;
    background-color: #0e5782;

    ul {
      border: 0px;
    }
  }

  .el-main {
    background-color: #e8e8e8;
  }
}

.header {
  background-color: rgba(107, 79, 148, 0.86);
  padding: 0 0 0 20px;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;

  .block {
    cursor: pointer;
    display: flex;
    align-items: center;
    border: 0px;
  }
}

.content-box {
  height: calc(100vh - 50px);
  background-color: white;
}

:deep(.el-tooltip__trigger:focus-visible) {
  outline: unset;
}

.logo {
  font-size: 15px;
  font-weight: 600;
  color: #e8e8e8;
  font-family: Helvetica, Tahoma, Arial, 'PingFang SC', 'Hiragino Sans GB', 'Heiti SC',
    'Microsoft YaHei', 'WenQuanYi Micro Hei';
  // font-family: 'Helvetica Neue', Helvetica, STHeiTi, Arial, sans-serif;
  cursor: pointer;
}

.logo:hover {
  color: #fff;
}

.link-span {
  color: #fff;
  opacity: .6;
  margin-right: 30px;
  font-size: 16px;
  font-family: 'Helvetica Neue', Helvetica, STHeiTi, Arial, sans-serif;
  cursor: pointer;
  text-decoration: none;
}

.link-span:hover {
  text-decoration: underline !important;
  opacity: 1;
  color: #fff;
}

.name-span {
  color: #fff;
  opacity: .6;
  margin-right: 30px;
  font-size: 12px;
  font-family: 'Helvetica Neue', Helvetica, STHeiTi, Arial, sans-serif;
  cursor: pointer;
  text-decoration: none;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}

.avatar {
  transform: translateY(-2px);
}
</style>
