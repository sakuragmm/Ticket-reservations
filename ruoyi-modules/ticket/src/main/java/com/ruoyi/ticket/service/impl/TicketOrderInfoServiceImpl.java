package com.ruoyi.ticket.service.impl;

import java.math.BigDecimal;
import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.system.api.domain.SysUser;
import com.ruoyi.system.api.model.LoginUser;
import com.ruoyi.ticket.domain.TicketFlightInfo;
import com.ruoyi.ticket.domain.TicketOrderRecord;
import com.ruoyi.ticket.mapper.TicketFlightInfoMapper;
import com.ruoyi.ticket.mapper.TicketOrderRecordMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ticket.mapper.TicketOrderInfoMapper;
import com.ruoyi.ticket.domain.TicketOrderInfo;
import com.ruoyi.ticket.service.ITicketOrderInfoService;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 订单信息Service业务层处理
 * 
 * @author gmm
 * @date 2022-09-21
 */
@Service
public class TicketOrderInfoServiceImpl implements ITicketOrderInfoService {
    @Resource
    private TicketOrderInfoMapper ticketOrderInfoMapper;

    @Resource
    private TicketFlightInfoMapper ticketFlightInfoMapper;

    @Resource
    private TicketOrderRecordMapper ticketOrderRecordMapper;

    /**
     * 管理员组id
     */
    private static final Long ADMIN_DEPT_ID = 103L;

    /**
     * 经济舱标识
     */
    private static final String ECONOMY_CLASS = "0";

    /**
     * 头等舱标识
     */
    private static final String FIRST_CLASS = "1";

    /**
     * 查询订单信息
     * 
     * @param id 订单信息主键
     * @return 订单信息
     */
    @Override
    public TicketOrderInfo selectTicketOrderInfoById(Long id)
    {
        return ticketOrderInfoMapper.selectTicketOrderInfoById(id);
    }

    /**
     * 查询订单信息列表
     * 
     * @param ticketOrderInfo 订单信息
     * @return 订单信息
     */
    @Override
    public List<TicketOrderInfo> selectTicketOrderInfoList(TicketOrderInfo ticketOrderInfo)
    {
        // 获取当前登录用户信息
        LoginUser loginUser = SecurityUtils.getLoginUser();
        // 判断对象是否为空
        if(StringUtils.isNotNull(loginUser)){
            SysUser user = loginUser.getSysUser();
            // 如果不是超级管理员，或者不属于管理员组（组id--103）则将当前用户id赋值给userId，如果是管理员则将当前userId置空
            if (StringUtils.isNotNull(user) && !user.isAdmin() && !ADMIN_DEPT_ID.equals(user.getDeptId())){
                ticketOrderInfo.setUserId(user.getUserId());
            }else{
                ticketOrderInfo.setUserId(null);
            }
        }
        return ticketOrderInfoMapper.selectTicketOrderInfoList(ticketOrderInfo);
    }

    /**
     * 新增订单信息
     * 
     * @param flightInfo 航线和订单信息
     * @param type 订单记录类型(0订票，1改签，2退票)
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int insertTicketOrderInfo(TicketFlightInfo flightInfo, String type)
    {
        // 订单信息类
        TicketOrderInfo orderInfo = new TicketOrderInfo();
        // 订单编号
        orderInfo.setCode("蕉♂航-" + DateUtils.dateTimeNow() + "-" + flightInfo.getSeatLevel());
        // 航班名称
        orderInfo.setName(flightInfo.getName());
        // 航线
        orderInfo.setRoutes(flightInfo.getStartPlace()+"-"+flightInfo.getEndPlace());
        // 起飞时间
        orderInfo.setStartTime(flightInfo.getStartTime());
        // 订购日期
        orderInfo.setBuyTime(DateUtils.getNowDate());
        // 订购数量
        orderInfo.setBuyNum(flightInfo.getBuyNum());
        // 舱位等级
        orderInfo.setSeatLevel(flightInfo.getSeatLevel());
        // 航班id
        orderInfo.setFlightId(flightInfo.getId());

        /**
         * 设置票价，同时修改航班信息表中对应票数量
         */
        // 如果是经济舱
        if (ECONOMY_CLASS.equals(flightInfo.getSeatLevel())){
            // 设置票价
            orderInfo.setPrice(flightInfo.getCommonPrice());
            // 修改票数
            TicketFlightInfo flight = new TicketFlightInfo();
            flight.setId(flightInfo.getId());
            flight.setCommonSurplus(flightInfo.getCommonSurplus()-orderInfo.getBuyNum());
            int a = ticketFlightInfoMapper.updateTicketFlightInfo(flight);
            if (a < 1){
                return -1;
            }
        }
        // 如果是头等舱
        else if (FIRST_CLASS.equals(flightInfo.getSeatLevel())){
            // 设置票价
            orderInfo.setPrice(flightInfo.getHigherPrice());
            // 修改票数
            TicketFlightInfo flight = new TicketFlightInfo();
            flight.setId(flightInfo.getId());
            flight.setHigherSurplus(flightInfo.getHigherSurplus()-orderInfo.getBuyNum());
            int a = ticketFlightInfoMapper.updateTicketFlightInfo(flight);
            if (a < 1){
                return -1;
            }
        }
        // 总价
        orderInfo.setAllPrice(orderInfo.getPrice().multiply(new BigDecimal(orderInfo.getBuyNum())));
        // 客户id
        orderInfo.setUserId(SecurityUtils.getLoginUser().getSysUser().getUserId());
        // 生成订票记录
        addOrderRecord(orderInfo,type);
        return ticketOrderInfoMapper.insertTicketOrderInfo(orderInfo);
    }

    /**
     * 生成订单记录
     * @param orderInfo 订单信息
     * @param type 订单记录类型(0订票，1改签，2退票)
     */
    public int addOrderRecord(TicketOrderInfo orderInfo,String type){
        TicketOrderRecord record = new TicketOrderRecord();
        //记录类型--根据传入的类型进行设置
        record.setOrderType(type);
        //订单号
        record.setCode(orderInfo.getCode());
        //航班名称
        record.setName(orderInfo.getName());
        //航线
        record.setRoutes(orderInfo.getRoutes());
        //起飞时间
        record.setStartTime(orderInfo.getStartTime());
        //订购日期
        record.setBuyTime(orderInfo.getBuyTime());
        //订购数量
        record.setBuyNum(orderInfo.getBuyNum());
        //舱位等级
        record.setSeatLevel(orderInfo.getSeatLevel());
        //总价
        record.setAllPrice(orderInfo.getAllPrice());
        //客户id
        record.setUserId(orderInfo.getUserId());
        //创建日期
        record.setCreateTime(DateUtils.getNowDate());

        return ticketOrderRecordMapper.insertTicketOrderRecord(record);
    }

    /**
     * 修改订单信息
     * 
     * @param ticketOrderInfo 订单信息
     * @return 结果
     */
    @Override
    public int updateTicketOrderInfo(TicketOrderInfo ticketOrderInfo)
    {
        ticketOrderInfo.setUpdateTime(DateUtils.getNowDate());
        return ticketOrderInfoMapper.updateTicketOrderInfo(ticketOrderInfo);
    }

    /**
     * 批量删除订单信息
     * 
     * @param ids 需要删除的订单信息主键
     * @return 结果
     */
    @Transactional(rollbackFor = Exception.class)
    @Override
    public int deleteTicketOrderInfoByIds(Long[] ids,String type)
    {
        int success = 0;
        //遍历循环取出主键查询
        for (Long id : ids){
            //取出订单信息
            TicketOrderInfo orderInfo = ticketOrderInfoMapper.selectTicketOrderInfoById(id);

            //购票数量
            Long num = orderInfo.getBuyNum();
            //航班主键
            Long flightId = orderInfo.getFlightId();

            //查询航班信息
            TicketFlightInfo f1 = ticketFlightInfoMapper.selectTicketFlightInfoById(flightId);
            if (f1 != null) {
                //创建航班信息对象
                TicketFlightInfo flightInfo = new TicketFlightInfo();
                //id赋值
                flightInfo.setId(flightId);
                if ("0".equals(orderInfo.getSeatLevel())) {
                    //如果是经济舱座票
                    flightInfo.setCommonSurplus(f1.getCommonSurplus()+num);
                }else if ("1".equals(orderInfo.getSeatLevel())) {
                    //如果是头等舱座票
                    flightInfo.setHigherSurplus(f1.getHigherSurplus()+num);
                }
                success += ticketFlightInfoMapper.updateTicketFlightInfo(flightInfo);
            }

            /**
             * 判断传入的订单类型是否为空 ，为空则说明是改签退票，不需要生成订单记录，否则需要生成订单记录
             */
            if (type!=null){
                success += addOrderRecord(orderInfo,type);
            }
            success += ticketOrderInfoMapper.deleteTicketOrderInfoById(id);
        }
        return success;
    }

    /**
     * 删除订单信息信息
     * 
     * @param id 订单信息主键
     * @return 结果
     */
    @Override
    public int deleteTicketOrderInfoById(Long id)
    {
        return ticketOrderInfoMapper.deleteTicketOrderInfoById(id);
    }

    /**
     * 修改订单支付状态
     *
     * @param id 订单信息主键
     * @return 结果
     */
    @Override
    public int updatePay(Long id) {
        return ticketOrderInfoMapper.updatePay(id);
    }
}
