import request from '@/utils/request'

// 查询订单记录列表
export function listRecord(query) {
  return request({
    url: '/ticket/record/list',
    method: 'get',
    params: query
  })
}

// 查询订单记录详细
export function getRecord(id) {
  return request({
    url: '/ticket/record/' + id,
    method: 'get'
  })
}

// 新增订单记录
export function addRecord(data) {
  return request({
    url: '/ticket/record',
    method: 'post',
    data: data
  })
}

// 修改订单记录
export function updateRecord(data) {
  return request({
    url: '/ticket/record',
    method: 'put',
    data: data
  })
}

// 删除订单记录
export function delRecord(id) {
  return request({
    url: '/ticket/record/' + id,
    method: 'delete'
  })
}
