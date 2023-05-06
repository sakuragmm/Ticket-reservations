package com.ruoyi.ticket.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.system.api.domain.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;
import org.springframework.stereotype.Component;

/**
 * 订单记录对象 ticket_order_record
 * 
 * @author gmm
 * @date 2022-10-14
 */
public class TicketOrderRecord extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 记录类型 */
    private String orderType;

    /** 订单号 */
    private String code;

    /** 航班名称 */
    private String name;

    /** 航线 */
    private String routes;

    /** 起飞时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 订购日期 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date buyTime;

    /** 订购数量 */
    private Long buyNum;

    /** 舱位等级 */
    private String seatLevel;

    /** 总价 */
    private BigDecimal allPrice;

    /** 客户id */
    private Long userId;

    /** 删除状态 */
    private String del;

    /** 用户名称 */
    private String nickName;

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
    }
    public void setOrderType(String orderType) 
    {
        this.orderType = orderType;
    }

    public String getOrderType() 
    {
        return orderType;
    }
    public void setCode(String code) 
    {
        this.code = code;
    }

    public String getCode() 
    {
        return code;
    }
    public void setName(String name) 
    {
        this.name = name;
    }

    public String getName() 
    {
        return name;
    }
    public void setRoutes(String routes) 
    {
        this.routes = routes;
    }

    public String getRoutes() 
    {
        return routes;
    }
    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }
    public void setBuyTime(Date buyTime) 
    {
        this.buyTime = buyTime;
    }

    public Date getBuyTime() 
    {
        return buyTime;
    }
    public void setBuyNum(Long buyNum) 
    {
        this.buyNum = buyNum;
    }

    public Long getBuyNum() 
    {
        return buyNum;
    }
    public void setSeatLevel(String seatLevel) 
    {
        this.seatLevel = seatLevel;
    }

    public String getSeatLevel() 
    {
        return seatLevel;
    }
    public void setAllPrice(BigDecimal allPrice) 
    {
        this.allPrice = allPrice;
    }

    public BigDecimal getAllPrice() 
    {
        return allPrice;
    }
    public void setUserId(Long userId) 
    {
        this.userId = userId;
    }

    public Long getUserId() 
    {
        return userId;
    }
    public void setDel(String del) 
    {
        this.del = del;
    }

    public String getDel() 
    {
        return del;
    }

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("orderType", getOrderType())
            .append("code", getCode())
            .append("name", getName())
            .append("routes", getRoutes())
            .append("startTime", getStartTime())
            .append("buyTime", getBuyTime())
            .append("buyNum", getBuyNum())
            .append("seatLevel", getSeatLevel())
            .append("allPrice", getAllPrice())
            .append("userId", getUserId())
            .append("del", getDel())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .toString();
    }
}
