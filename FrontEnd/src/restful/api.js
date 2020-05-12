// 导入axios
import Axios from 'axios'
Axios.create({
  headers: 'access_token'
});

import qs from 'qs'

// // 添加请求拦截器
// Axios.interceptors.request.use(function (config) {
//   // 在发送请求之前做些什么
//   if (localStorage.getItem('access_token')) {
//     config.headers['access_token'] = localStorage.getItem('access_token');
//   }
//   return config;
// }, function (error) {
//   // 对请求错误做些什么
//   return Promise.reject(error);
// });

// 登录
export const userLogin = (params) => {
  return Axios.post('http://127.0.0.1:8000/api/account/login', qs.stringify(params)).then(res => res.data);
}
// 退出
export const userLogout = () => {
  return Axios.get('http://127.0.0.1:8000/api/account/logout').then(res => res.data);
}

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
// 免费课程详情数据
export const courseDetail = (courseId) => {
  return Axios.get(`http://127.0.0.1:8000/api/free/${courseId}/detail`).then(res => res.data);
}

// 实战课程分类列表
export const getPracticalCategory = () => {
  return Axios.get("http://127.0.0.1:8000/api/practical/practicalcategory").then(res => res.data);
}
// 实战课程分类列表内的所有课程
export const getPracticalCategoryCourse = (id) => {
  return Axios.get(`http://127.0.0.1:8000/api/practical/practicalcourse/${id}`).then(res => res.data);
}
// 实战课程详情数据
export const practicalCourseDetail = (courseId) => {
  return Axios.get(`http://127.0.0.1:8000/api/practical/${courseId}/payment_info`).then(res => res.data);
}

// 就业班课程列表数据
export const getDegreeCourse = () => {
  return Axios.get(`http://127.0.0.1:8000/api/course/degreecourse/list`).then(res => res.data);
}
// 就业班课程详情数据
export const degreeCourseDetail = (courseId) => {
  return Axios.post(`http://127.0.0.1:8000/api/course/degreecourse/${courseId}`).then(res => res.data);
}

// 购物车页面列表
export const shopCarList = () => {
  return Axios.get(`http://127.0.0.1:8000/api/shopping/list`,
    {params:{'token': localStorage.getItem('access_token')}}).then(res => res.data);
}
// 商品课程添加到购物车
export const shopCartAdd = (goodsInfo) => {
  return Axios.post(`http://127.0.0.1:8000/api/shopping/add`, qs.stringify(goodsInfo)).then(res => res.data);
}
// 删除购物车中的商品
export const shopCarDeleteGoods = (deleteCourseList) => {
  return Axios.delete(`http://127.0.0.1:8000/api/shopping/delete`, deleteCourseList).then(res => res.data);
}

// 我的教室页面列表
export const classroomCourseList = () => {
  return Axios.get(`http://127.0.0.1:8000/api/v1/enroll/degree/1/`).then(res => res.data);
}
