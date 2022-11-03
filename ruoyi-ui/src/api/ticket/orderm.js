import request from '@/utils/request'

// 查询订单信息列表
export function listOrderm(query) {
  return request({
    url: '/ticket/orderm/list',
    method: 'get',
    params: query
  })
}

// 查询订单信息详细
export function getOrderm(id) {
  return request({
    url: '/ticket/orderm/' + id,
    method: 'get'
  })
}

// 新增订单信息
export function addOrderm(data) {
  return request({
    url: '/ticket/orderm',
    method: 'post',
    data: data
  })
}

// 改签新增订单信息
export function changeOrderm(data) {
  return request({
    url: '/ticket/orderm/change',
    method: 'post',
    data: data
  })
}

// 修改订单信息
export function updateOrderm(data) {
  return request({
    url: '/ticket/orderm',
    method: 'put',
    data: data
  })
}

// 删除订单信息
export function delOrderm(id) {
  return request({
    url: '/ticket/orderm/' + id,
    method: 'delete'
  })
}

// 退票
export function refundOrderm(id) {
  return request({
    url: '/ticket/orderm/refund/' + id,
    method: 'delete'
  })
}

//支付订单
export  function payOrderm(id) {
  return request({
    url: '/ticket/orderm/pay/' + id,
    method: 'put'
  })
}

// 改签退票（不产生退票记录）
export function delChangeOrderm(id) {
  return request({
    url: '/ticket/orderm/change/' + id,
    method: 'delete'
  })
}

