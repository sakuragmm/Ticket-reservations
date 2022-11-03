package com.ruoyi.ticket.service;

import java.util.List;

import com.ruoyi.ticket.domain.TicketFlightInfo;
import com.ruoyi.ticket.domain.TicketOrderInfo;

/**
 * 订单信息Service接口
 * 
 * @author gmm
 * @date 2022-09-21
 */
public interface ITicketOrderInfoService 
{
    /**
     * 查询订单信息
     * 
     * @param id 订单信息主键
     * @return 订单信息
     */
    public TicketOrderInfo selectTicketOrderInfoById(Long id);

    /**
     * 查询订单信息列表
     * 
     * @param ticketOrderInfo 订单信息
     * @return 订单信息集合
     */
    public List<TicketOrderInfo> selectTicketOrderInfoList(TicketOrderInfo ticketOrderInfo);

    /**
     * 新增订单信息
     * 
     * @param ticketFlightInfo 订单信息
     * @param type 订单记录类型(0订票，1改签，2退票)
     * @return 结果
     */
    public int insertTicketOrderInfo(TicketFlightInfo ticketFlightInfo, String type);

    /**
     * 修改订单信息
     * 
     * @param ticketOrderInfo 订单信息
     * @return 结果
     */
    public int updateTicketOrderInfo(TicketOrderInfo ticketOrderInfo);

    /**
     * 批量删除订单信息
     * 
     * @param ids 需要删除的订单信息主键集合
     * @param type 订单记录类型(0订票1改签2退票)
     *
     * @return 结果
     */
    public int deleteTicketOrderInfoByIds(Long[] ids, String type);

    /**
     * 删除订单信息信息
     * 
     * @param id 订单信息主键
     * @return 结果
     */
    public int deleteTicketOrderInfoById(Long id);

    /**
     * 修改订单支付状态
     *
     * @param id 订单信息主键
     * @return 结果
     */
    public int updatePay(Long id);


}
