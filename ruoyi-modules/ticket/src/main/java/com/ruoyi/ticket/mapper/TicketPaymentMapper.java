package com.ruoyi.ticket.mapper;

import java.util.List;
import com.ruoyi.ticket.domain.TicketPayment;

/**
 * 制定航班Mapper接口
 * 
 * @author gmm
 * @date 2022-10-12
 */
public interface TicketPaymentMapper 
{
    /**
     * 查询制定航班
     * 
     * @param id 制定航班主键
     * @return 制定航班
     */
    public TicketPayment selectTicketPaymentById(Long id);

    /**
     * 查询制定航班列表
     * 
     * @param ticketPayment 制定航班
     * @return 制定航班集合
     */
    public List<TicketPayment> selectTicketPaymentList(TicketPayment ticketPayment);

    /**
     * 新增制定航班
     * 
     * @param ticketPayment 制定航班
     * @return 结果
     */
    public int insertTicketPayment(TicketPayment ticketPayment);

    /**
     * 修改制定航班
     * 
     * @param ticketPayment 制定航班
     * @return 结果
     */
    public int updateTicketPayment(TicketPayment ticketPayment);

    /**
     * 删除制定航班
     * 
     * @param id 制定航班主键
     * @return 结果
     */
    public int deleteTicketPaymentById(Long id);

    /**
     * 批量删除制定航班
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTicketPaymentByIds(Long[] ids);
}
