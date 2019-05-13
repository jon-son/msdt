import Vue from 'vue';
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import App from './App.vue';
import '../assets/css/main.css';
import router from './router/router';
import store from './store';
import httpRequest from '../utils/httpRequest';
import Store from '@/utils/storage';
// import '../assets/ueditor-1.4.3.3/ueditor.config';
// import '../assets/ueditor-1.4.3.3/ueditor.all.min';
// import '../assets/ueditor-1.4.3.3/lang/zh-cn/zh-cn';
// import '../assets/ueditor-1.4.3.3/ueditor.parse.min';
Vue.config.productionTip = false;
Vue.use(ElementUI);
// ajax请求方法
Vue.prototype.$http = httpRequest;
Vue.prototype.$Store = Store;
Vue.prototype.showPreview = false;
new Vue({
  router,
  store,
  render: h => h(App),
}).$mount('#app');
