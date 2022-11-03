package com.ruoyi.ticket.service;

import java.util.List;

import com.ruoyi.ticket.domain.ArrangeInfo;
import com.ruoyi.ticket.domain.TicketFlightInfo;

/**
 * 航班信息Service接口
 * 
 * @author gmm
 * @date 2022-09-21
 */
public interface ITicketFlightInfoService 
{
    /**
     * 查询航班信息
     * 
     * @param id 航班信息主键
     * @return 航班信息
     */
    public TicketFlightInfo selectTicketFlightInfoById(Long id);

    /**
     * 查询航班信息列表
     * 
     * @param ticketFlightInfo 航班信息
     * @return 航班信息集合
     */
    public List<TicketFlightInfo> selectTicketFlightInfoList(TicketFlightInfo ticketFlightInfo);

    /**
     * 新增航班信息
     * 
     * @param ticketFlightInfo 航班信息
     * @return 结果
     */
    public int insertTicketFlightInfo(TicketFlightInfo ticketFlightInfo);

    /**
     * 安排航班
     *
     * @param arrangeInfo 航班信息
     * @return 结果
     */
    public int arrangeTicketFlightInfo(ArrangeInfo arrangeInfo);

    /**
     * 修改航班信息
     * 
     * @param ticketFlightInfo 航班信息
     * @return 结果
     */
    public int updateTicketFlightInfo(TicketFlightInfo ticketFlightInfo);

    /**
     * 批量删除航班信息
     * 
     * @param ids 需要删除的航班信息主键集合
     * @return 结果
     */
    public int deleteTicketFlightInfoByIds(Long[] ids);

    /**
     * 删除航班信息信息
     * 
     * @param id 航班信息主键
     * @return 结果
     */
    public int deleteTicketFlightInfoById(Long id);
}
