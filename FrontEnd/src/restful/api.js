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
  console.log("http://127.0.0.1:8000/api/" + url);
  return Axios.get("http://127.0.0.1:8000/api/" + url).then(res => res.data);
}
// 免费课程分类列表
export const getFreeCategory = () => {
  return Axios.get("http://127.0.0.1:8000/api/free/category").then(res => res.data);
}
// 免费课程分类列表内的所有课程
export const getFreeCategoryCourse = (id) => {
  return Axios.get(`http://127.0.0.1:8000/api/free/course/${id}`).then(res => res.data);
}
// 实战课程分类列表
export const getPracticalCategory = () => {
  return Axios.get("http://127.0.0.1:8000/api/practical/practicalcategory").then(res => res.data);
}
// 实战课程分类列表内的所有课程
export const getPracticalCategoryCourse = (id) => {
  return Axios.get(`http://127.0.0.1:8000/api/practical/practicalcourse/${id}`).then(res => res.data);
}

// 免费课程详情数据
export const courseDetail = (courseId) => {
  return Axios.get(`http://127.0.0.1:8000/api/free/${courseId}/detail`).then(res => res.data);
}

// 实战课程详情数据
export const practicalCourseDetail = (courseId) => {
  return Axios.get(`http://127.0.0.1:8000/api/practical/${courseId}/payment_info`).then(res => res.data);
}
// 登录
export const userLogin = (params) => {
  return Axios.post('http://127.0.0.1:8000/api/account/login', qs.stringify(params)).then(res => res.data);
}
// 退出
export const userLogout = () => {
  return Axios.get('http://127.0.0.1:8000/api/account/logout').then(res => res.data);
}
