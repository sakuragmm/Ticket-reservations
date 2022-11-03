package com.ruoyi.ticket.mapper;

import java.util.List;
import com.ruoyi.ticket.domain.TicketOrderRecord;

/**
 * 订单记录Mapper接口
 * 
 * @author gmm
 * @date 2022-10-14
 */
public interface TicketOrderRecordMapper 
{
    /**
     * 查询订单记录
     * 
     * @param id 订单记录主键
     * @return 订单记录
     */
    public TicketOrderRecord selectTicketOrderRecordById(Long id);

    /**
     * 查询订单记录列表
     * 
     * @param ticketOrderRecord 订单记录
     * @return 订单记录集合
     */
    public List<TicketOrderRecord> selectTicketOrderRecordList(TicketOrderRecord ticketOrderRecord);

    /**
     * 新增订单记录
     * 
     * @param ticketOrderRecord 订单记录
     * @return 结果
     */
    public int insertTicketOrderRecord(TicketOrderRecord ticketOrderRecord);

    /**
     * 修改订单记录
     * 
     * @param ticketOrderRecord 订单记录
     * @return 结果
     */
    public int updateTicketOrderRecord(TicketOrderRecord ticketOrderRecord);

    /**
     * 删除订单记录
     * 
     * @param id 订单记录主键
     * @return 结果
     */
    public int deleteTicketOrderRecordById(Long id);

    /**
     * 批量删除订单记录
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTicketOrderRecordByIds(Long[] ids);
}
