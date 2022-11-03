package com.ruoyi.ticket.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ticket.mapper.TicketPaymentMapper;
import com.ruoyi.ticket.domain.TicketPayment;
import com.ruoyi.ticket.service.ITicketPaymentService;

/**
 * 制定航班Service业务层处理
 * 
 * @author gmm
 * @date 2022-10-12
 */
@Service
public class TicketPaymentServiceImpl implements ITicketPaymentService 
{
    @Autowired
    private TicketPaymentMapper ticketPaymentMapper;

    /**
     * 查询制定航班
     * 
     * @param id 制定航班主键
     * @return 制定航班
     */
    @Override
    public TicketPayment selectTicketPaymentById(Long id)
    {
        return ticketPaymentMapper.selectTicketPaymentById(id);
    }

    /**
     * 查询制定航班列表
     * 
     * @param ticketPayment 制定航班
     * @return 制定航班
     */
    @Override
    public List<TicketPayment> selectTicketPaymentList(TicketPayment ticketPayment)
    {
        return ticketPaymentMapper.selectTicketPaymentList(ticketPayment);
    }

    /**
     * 新增制定航班
     * 
     * @param ticketPayment 制定航班
     * @return 结果
     */
    @Override
    public int insertTicketPayment(TicketPayment ticketPayment)
    {
        ticketPayment.setCreateTime(DateUtils.getNowDate());
        return ticketPaymentMapper.insertTicketPayment(ticketPayment);
    }

    /**
     * 修改制定航班
     * 
     * @param ticketPayment 制定航班
     * @return 结果
     */
    @Override
    public int updateTicketPayment(TicketPayment ticketPayment)
    {
        ticketPayment.setUpdateTime(DateUtils.getNowDate());
        return ticketPaymentMapper.updateTicketPayment(ticketPayment);
    }

    /**
     * 批量删除制定航班
     * 
     * @param ids 需要删除的制定航班主键
     * @return 结果
     */
    @Override
    public int deleteTicketPaymentByIds(Long[] ids)
    {
        return ticketPaymentMapper.deleteTicketPaymentByIds(ids);
    }

    /**
     * 删除制定航班信息
     * 
     * @param id 制定航班主键
     * @return 结果
     */
    @Override
    public int deleteTicketPaymentById(Long id)
    {
        return ticketPaymentMapper.deleteTicketPaymentById(id);
    }
}
