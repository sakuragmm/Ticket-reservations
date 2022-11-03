import request from '@/utils/request'

// 查询航班信息列表
export function listFlightm(query) {
  return request({
    url: '/ticket/flightm/list',
    method: 'get',
    params: query
  })
}

// 查询航班信息详细
export function getFlightm(id) {
  return request({
    url: '/ticket/flightm/' + id,
    method: 'get'
  })
}

// 新增航班信息
export function addFlightm(data) {
  return request({
    url: '/ticket/flightm',
    method: 'post',
    data: data
  })
}

// 修改航班信息
export function updateFlightm(data) {
  return request({
    url: '/ticket/flightm',
    method: 'put',
    data: data
  })
}

// 删除航班信息
export function delFlightm(id) {
  return request({
    url: '/ticket/flightm/' + id,
    method: 'delete'
  })
}
