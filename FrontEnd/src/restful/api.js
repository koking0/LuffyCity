// 导入axios
import Axios from 'axios'

import qs from 'qs'

// 添加请求拦截器
Axios.interceptors.request.use(function (config) {
  // 在发送请求之前做些什么
  if (localStorage.getItem('access_token')) {
    config.headers.Authorization = localStorage.getItem('access_token')
  }
  return config;
}, function (error) {
  // 对请求错误做些什么
  return Promise.reject(error);
});

// 分类列表API
export const getContent = (url) => {
  console.log("https://www.luffycity.com/api/v1/" + url);
  return Axios.get("https://www.luffycity.com/api/v1/" + url).then(res => res.data);
}
// 免费课程详情数据
export const courseDetail = (courseId) => {
  return Axios.get(`https://www.luffycity.com/api/v1/free/${courseId}/detail/`).then(res => res.data);
}
// 免费课程大纲数据
export const CourseOutline = (courseId) => {
  return Axios.get(`https://www.luffycity.com/api/v1/course/${courseId}/sections/`).then(res => res.data);
}
// 实战课程详情数据
export const practicalCourseDetail = (courseId) => {
  return Axios.get(`https://www.luffycity.com/api/v1/course/${courseId}/payment_info/`).then(res => res.data);
}
// 登录
export const userLogin = (params) => {
  return Axios.post('http://127.0.0.1:8000/api/account/login', qs.stringify(params)).then(res => res.data);
}
// 退出
export const userLogout = () => {
  return Axios.get('http://127.0.0.1:8000/api/account/logout').then(res => res.data);
}
