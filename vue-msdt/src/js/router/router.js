import Vue from 'vue';
import Router from 'vue-router';
import Index from '@/pages/index.vue';
import Product from '@/pages/products.vue';
import Detail from '@/pages/detail.vue';
import Common from '@/components/public/com.vue';
import Login from '@/pages/login.vue';
import Register from '@/pages/register.vue';


Vue.use(Router);

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'com',
      component: Common,
      redirect: '/index',
      children: [
        {
          path: '/index',
          name: 'index',
          component: Index,
        },
        {
          path: '/products',
          name: 'product',
          component: Product,
        },
        {
          path: '/detail',
          name: 'detail',
          component: Detail,
        },
      ]
    },
    {
      path: '/login',
      name: 'login',
      component: Login,
    },
    {
      path: '/register',
      name: 'register',
      component: Register,
    },
  ],
});
