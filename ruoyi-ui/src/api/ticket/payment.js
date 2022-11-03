import request from '@/utils/request'

// 查询制定航班列表
export function listPayment(query) {
  return request({
    url: '/ticket/payment/list',
    method: 'get',
    params: query
  })
}

// 查询制定航班详细
export function getPayment(id) {
  return request({
    url: '/ticket/payment/' + id,
    method: 'get'
  })
}

// 新增制定航班
export function addPayment(data) {
  return request({
    url: '/ticket/payment',
    method: 'post',
    data: data
  })
}

// 修改制定航班
export function updatePayment(data) {
  return request({
    url: '/ticket/payment',
    method: 'put',
    data: data
  })
}

// 删除制定航班
export function delPayment(id) {
  return request({
    url: '/ticket/payment/' + id,
    method: 'delete'
  })
}

//安排航班
export function arrangePayment(data) {
  return request({
    url: '/ticket/payment/arrange/',
    method: 'post',
    data: data
  })
}
