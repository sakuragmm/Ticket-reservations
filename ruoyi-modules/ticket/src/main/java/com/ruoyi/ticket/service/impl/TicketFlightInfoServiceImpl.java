package com.ruoyi.ticket.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.ticket.domain.ArrangeInfo;
import com.ruoyi.ticket.domain.TicketPayment;
import com.ruoyi.ticket.mapper.TicketPaymentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ticket.mapper.TicketFlightInfoMapper;
import com.ruoyi.ticket.domain.TicketFlightInfo;
import com.ruoyi.ticket.service.ITicketFlightInfoService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 航班信息Service业务层处理
 * 
 * @author gmm
 * @date 2022-09-21
 */
@Service
public class TicketFlightInfoServiceImpl implements ITicketFlightInfoService 
{
    @Resource
    private TicketFlightInfoMapper ticketFlightInfoMapper;

    @Resource
    private TicketPaymentMapper ticketPaymentMapper;


    /**
     * 查询航班信息
     * @param id 航班信息主键
     * @return 航班信息
     */
    @Override
    public TicketFlightInfo selectTicketFlightInfoById(Long id)
    {
        return ticketFlightInfoMapper.selectTicketFlightInfoById(id);
    }

    /**
     * 查询航班信息列表
     * 
     * @param ticketFlightInfo 航班信息
     * @return 航班信息
     */
    @Override
    public List<TicketFlightInfo> selectTicketFlightInfoList(TicketFlightInfo ticketFlightInfo)
    {
        return ticketFlightInfoMapper.selectTicketFlightInfoList(ticketFlightInfo);
    }

    /**
     * 新增航班信息
     * 
     * @param ticketFlightInfo 航班信息
     * @return 结果
     */
    @Override
    public int insertTicketFlightInfo(TicketFlightInfo ticketFlightInfo)
    {
        //设置创建人、创建时间
        ticketFlightInfo.setCreateBy(SecurityUtils.getUsername());
        ticketFlightInfo.setCreateTime(DateUtils.getNowDate());

        //设置航班编号和航班名称
        ticketFlightInfo.setCode("JO-" + DateUtils.getDate() + "-" + ticketFlightInfo.getCode());
        ticketFlightInfo.setName("蕉♂航-"+ticketFlightInfo.getName());

        return ticketFlightInfoMapper.insertTicketFlightInfo(ticketFlightInfo);
    }

    /**
     * 安排航班
     *
     * @param arrangeInfo 航班信息
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int arrangeTicketFlightInfo(ArrangeInfo arrangeInfo) {
        int num = 0;
        //如果单个id值为空，则遍历id数组
        if (arrangeInfo.getId() == null){
            for (Long id : arrangeInfo.getIds()){
                //查询航班信息进行匹配
                num--;
                TicketPayment ticketPayment = ticketPaymentMapper.selectTicketPaymentById(id);
                num += setInfo(ticketPayment,arrangeInfo);
            }
        }else {
            num--;
            TicketPayment ticketPayment = ticketPaymentMapper.selectTicketPaymentById(arrangeInfo.getId());
            num += setInfo(ticketPayment,arrangeInfo);
        }
        if (num == 0){
            return 1;
        }
        return -1;
    }

    /**
     *
     * 用于匹配制定信息和航班信息
     *
     * */
    public int setInfo(TicketPayment ticketPayment,ArrangeInfo arrangeInfo){
        // 创建航班信息对象
        TicketFlightInfo flightInfo = new TicketFlightInfo();
        // 编码
        flightInfo.setCode(ticketPayment.getCode());
        // 航班名称
        flightInfo.setName(ticketPayment.getName());
        // 类型
        flightInfo.setType(ticketPayment.getType());
        // 出发地
        flightInfo.setStartPlace(ticketPayment.getStartPlace());
        // 目的地
        flightInfo.setEndPlace(ticketPayment.getEndPlace());
        // 飞机类型
        flightInfo.setPlanType(ticketPayment.getPlanType());
        // 起飞时间
        flightInfo.setStartTime(arrangeInfo.getStartTime());
        // 降落时间
        flightInfo.setEndTime(arrangeInfo.getEndTime());
        // 经济舱票价
        flightInfo.setCommonPrice(ticketPayment.getCommonPrice());
        // 头等舱票价
        flightInfo.setHigherPrice(ticketPayment.getHigherPrice());
        // 经济舱票数
        flightInfo.setCommonNum(ticketPayment.getCommonNum());
        // 头等舱票数
        flightInfo.setHigherNum(ticketPayment.getHigherNum());
        // 经济舱余票
        flightInfo.setCommonSurplus(ticketPayment.getCommonNum());
        // 头等舱余票
        flightInfo.setHigherSurplus(ticketPayment.getHigherNum());
        // 备注
        flightInfo.setRemark(ticketPayment.getRemark());
        // 插入航班信息表
        return insertTicketFlightInfo(flightInfo);
}

    /**
     * 修改航班信息
     * 
     * @param ticketFlightInfo 航班信息
     * @return 结果
     */
    @Override
    public int updateTicketFlightInfo(TicketFlightInfo ticketFlightInfo)
    {

        // 设置修改人和修改时间
        ticketFlightInfo.setUpdateBy(SecurityUtils.getUsername());
        ticketFlightInfo.setUpdateTime(DateUtils.getNowDate());

        return ticketFlightInfoMapper.updateTicketFlightInfo(ticketFlightInfo);
    }

    /**
     * 批量删除航班信息
     * 
     * @param ids 需要删除的航班信息主键
     * @return 结果
     */
    @Override
    public int deleteTicketFlightInfoByIds(Long[] ids)
    {
        return ticketFlightInfoMapper.deleteTicketFlightInfoByIds(ids);
    }

    /**
     * 删除航班信息信息
     * 
     * @param id 航班信息主键
     * @return 结果
     */
    @Override
    public int deleteTicketFlightInfoById(Long id)
    {
        return ticketFlightInfoMapper.deleteTicketFlightInfoById(id);
    }
}
