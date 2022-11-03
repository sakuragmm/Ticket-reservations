package com.ruoyi.ticket.mapper;

import java.util.List;
import com.ruoyi.ticket.domain.TicketOrderInfo;

/**
 * 订单信息Mapper接口
 * 
 * @author gmm
 * @date 2022-09-21
 */

public interface TicketOrderInfoMapper 
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
     * @param ticketOrderInfo 订单信息
     * @return 结果
     */
    public int insertTicketOrderInfo(TicketOrderInfo ticketOrderInfo);

    /**
     * 修改订单信息
     * 
     * @param ticketOrderInfo 订单信息
     * @return 结果
     */
    public int updateTicketOrderInfo(TicketOrderInfo ticketOrderInfo);

    /**
     * 删除订单信息
     * 
     * @param id 订单信息主键
     * @return 结果
     */
    public int deleteTicketOrderInfoById(Long id);

    /**
     * 批量删除订单信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTicketOrderInfoByIds(Long[] ids);

    /**
     * 修改订单支付状态
     *
     * @param id 订单信息主键
     * @return 结果
     */
    public int updatePay(Long id);
}
