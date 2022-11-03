package com.ruoyi.ticket.service.impl;

import java.util.List;
import com.ruoyi.common.core.utils.DateUtils;
import com.ruoyi.common.core.utils.StringUtils;
import com.ruoyi.common.security.utils.SecurityUtils;
import com.ruoyi.system.api.domain.SysUser;
import com.ruoyi.system.api.model.LoginUser;
import com.ruoyi.ticket.domain.TicketOrderInfo;
import com.ruoyi.ticket.mapper.TicketOrderInfoMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.ruoyi.ticket.mapper.TicketOrderRecordMapper;
import com.ruoyi.ticket.domain.TicketOrderRecord;
import com.ruoyi.ticket.service.ITicketOrderRecordService;

import javax.annotation.Resource;

/**
 * 订单记录Service业务层处理
 * 
 * @author gmm
 * @date 2022-10-14
 */
@Service
public class TicketOrderRecordServiceImpl implements ITicketOrderRecordService 
{
    @Resource
    private TicketOrderRecordMapper ticketOrderRecordMapper;

    @Resource
    private TicketOrderInfoMapper ticketOrderInfoMapper;

    /**
     * 查询订单记录
     * 
     * @param id 订单记录主键
     * @return 订单记录
     */
    @Override
    public TicketOrderRecord selectTicketOrderRecordById(Long id)
    {
        return ticketOrderRecordMapper.selectTicketOrderRecordById(id);
    }

    /**
     * 查询订单记录列表
     * 
     * @param ticketOrderRecord 订单记录
     * @return 订单记录
     */
    @Override
    public List<TicketOrderRecord> selectTicketOrderRecordList(TicketOrderRecord ticketOrderRecord)
    {
        //获取当前登录用户信息
        LoginUser loginUser = SecurityUtils.getLoginUser();
        //判断对象是否为空
        if(StringUtils.isNotNull(loginUser)){
            SysUser user = loginUser.getSysUser();
            //如果不是超级管理员，或者不属于管理员组（组id--103）则将当前用户id赋值给userId，如果是管理员则将当前userId置空
            if (StringUtils.isNotNull(user) && !user.isAdmin() && user.getDeptId() != 103){
                ticketOrderRecord.setUserId(user.getUserId());
            }else{
                ticketOrderRecord.setUserId(null);
            }
        }
        return ticketOrderRecordMapper.selectTicketOrderRecordList(ticketOrderRecord);
    }

    /**
     * 新增订单记录
     * 
     * @param ticketOrderRecord 订单记录
     * @return 结果
     */
    @Override
    public int insertTicketOrderRecord(TicketOrderRecord ticketOrderRecord)
    {
        ticketOrderRecord.setCreateTime(DateUtils.getNowDate());
        return ticketOrderRecordMapper.insertTicketOrderRecord(ticketOrderRecord);
    }

    /**
     * 修改订单记录
     * 
     * @param ticketOrderRecord 订单记录
     * @return 结果
     */
    @Override
    public int updateTicketOrderRecord(TicketOrderRecord ticketOrderRecord)
    {
        ticketOrderRecord.setUpdateTime(DateUtils.getNowDate());
        return ticketOrderRecordMapper.updateTicketOrderRecord(ticketOrderRecord);
    }

    /**
     * 批量删除订单记录
     * 
     * @param ids 需要删除的订单记录主键
     * @return 结果
     */
    @Override
    public int deleteTicketOrderRecordByIds(Long[] ids)
    {
        return ticketOrderRecordMapper.deleteTicketOrderRecordByIds(ids);
    }

    /**
     * 删除订单记录信息
     * 
     * @param id 订单记录主键
     * @return 结果
     */
    @Override
    public int deleteTicketOrderRecordById(Long id)
    {
        return ticketOrderRecordMapper.deleteTicketOrderRecordById(id);
    }
}
