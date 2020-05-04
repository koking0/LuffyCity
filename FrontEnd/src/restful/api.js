// 导入axios
import Axios from 'axios'
// 设置基础URL
Axios.defaults.baseURL = 'https://www.luffycity.com/api/v1/'

// 分类列表API
export const getContent = (url)=>{
  console.log(url);
  return Axios.get(url).then(res=>res.data);
}
// 免费课程详情数据
export const courseDetail = (courseId) => {
  return Axios.get(`free/${courseId}/detail/`).then(res=>res.data);
}
// 免费课程大纲数据
export const CourseOutline = (courseId) => {
  return Axios.get(`course/${courseId}/sections/`).then(res=>res.data);
}
// 实战课程详情数据
export const practicalCourseDetail = (courseId) => {
  return Axios.get(`course/${courseId}/payment_info/`).then(res=>res.data);
}
