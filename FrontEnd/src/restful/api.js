// 导入axios
import Axios from 'axios'
// 设置基础URL
Axios.defaults.baseURL = 'https://www.luffycity.com/api/v1/'

// 分类列表API
export const categoryList = ()=>{
  return Axios.get('free/category/').then(res=>res.data);
}
// 免费课程详情数据
export const courseDetail = (courseId) => {
  return Axios.get(`free/${courseId}/detail/`).then(res=>res.data);
}
// 免费课程大纲数据
export const CourseOutline = (courseId) => {
  return Axios.get(`course/${courseId}/sections/`).then(res=>res.data);
}
