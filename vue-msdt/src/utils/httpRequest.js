import axios from 'axios';
import { Message } from 'element-ui';
import router from '../js/router/router';
import urlConfig from './config';
import Store from '@/utils/storage';

const http = axios.create({
  timeout: 1000 * 30,
  withCredentials: true,
  baseURL: `${urlConfig.URL || 'localhost'}`,
  headers: {
    'Content-Type': 'application/json; charset=utf-8',
  },
});

/**
 * 请求拦截
 */
http.interceptors.request.use((config) => {
  // eslint-disable-next-line no-param-reassign
  config.headers.token = Store.localGet('token'); // 请求头带上token
  // console.log('config is ', config);
  return config;
}, error => Promise.reject(error));

// http response 拦截器
http.interceptors.response.use(
  (response) => {
    // console.log('response is ', response);
    // MessageBox.alert('123');
    const { code } = response.data;
    if (code === 401) {
      Message({
        message: '登陆信息过期，请重新登陆',
        type: 'error',
      });
      router.replace('/login');
    }
    return response;
  },
  error => Promise.reject(error),
);

export default http;
