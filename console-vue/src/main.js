import './assets/main.css'

import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import './style.scss'
import API from '@/api/index'
import store from './store'
// import ViewUIPlus from 'view-ui-plus'
// import 'view-ui-plus/dist/styles/viewuiplus.css'
import Particles from "@tsparticles/vue3";
import { loadSlim } from "@tsparticles/slim";

const app = createApp(App)

app.config.globalProperties.$API = API
// 屏蔽警告信息
app.config.warnHandler = () => null;
app.use(router)
app.use(ElementPlus)
app.use(store)
// app.use(ViewUIPlus)
app.use(Particles, {
      init: async engine => {
        await loadSlim(engine);
      },
    })

for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

app.mount('#app')
