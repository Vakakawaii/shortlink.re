import { createStore } from 'vuex'

// 创建一个新的 store 实例
const store = createStore({
  state() {
    return {
      // domain: 'nurl.ink'
      // domain: 's.nageoffer.com'
      // domain: 'v.star17.cn'
      domain: '47.100.32.85'
    }
  }
})

export default store
