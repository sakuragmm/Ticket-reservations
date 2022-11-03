package com.ruoyi.ticket.mapper;

import java.util.List;
import com.ruoyi.ticket.domain.TicketFlightInfo;
import org.springframework.stereotype.Repository;

/**
 * 航班信息Mapper接口
 * 
 * @author gmm
 * @date 2022-09-21
 */

public interface TicketFlightInfoMapper
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
     * 修改航班信息
     * 
     * @param ticketFlightInfo 航班信息
     * @return 结果
     */
    public int updateTicketFlightInfo(TicketFlightInfo ticketFlightInfo);

    /**
     * 删除航班信息
     * 
     * @param id 航班信息主键
     * @return 结果
     */
    public int deleteTicketFlightInfoById(Long id);

    /**
     * 批量删除航班信息
     * 
     * @param ids 需要删除的数据主键集合
     * @return 结果
     */
    public int deleteTicketFlightInfoByIds(Long[] ids);
}
