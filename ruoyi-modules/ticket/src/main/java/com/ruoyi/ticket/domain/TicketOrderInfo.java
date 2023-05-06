package com.ruoyi.ticket.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.ruoyi.system.api.domain.SysUser;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 订单信息对象 ticket_order_info
 * 
 * @author gmm
 * @date 2022-09-21
 */
public class TicketOrderInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

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

    /** 票价 */
    private BigDecimal price;

    /** 航班主键 */
    private Long flightId;

    /** 总价 */
    private BigDecimal allPrice;

    /** 付款状态 （0未付款1已付款）*/
    private String paymentStatus;

    /** 客户id */
    private Long userId;

    /** 用户名 */
    private String nickName;

    /** 删除状态(默认0删除1) */
    private String del;

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public Long getFlightId() {
        return flightId;
    }

    public void setFlightId(Long flightId) {
        this.flightId = flightId;
    }

    public String getSeatLevel() {
        return seatLevel;
    }

    public void setSeatLevel(String seatLevel) {
        this.seatLevel = seatLevel;
    }

    public void setId(Long id)
    {
        this.id = id;
    }

    public Long getId() 
    {
        return id;
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
    public void setPrice(BigDecimal price) 
    {
        this.price = price;
    }

    public BigDecimal getPrice() 
    {
        return price;
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
            .append("code", getCode())
            .append("name", getName())
            .append("routes", getRoutes())
            .append("startTime", getStartTime())
            .append("buyTime", getBuyTime())
            .append("buyNum", getBuyNum())
            .append("price", getPrice())
            .append("allPrice", getAllPrice())
            .append("paymentStatus", getPaymentStatus())
            .append("userId", getUserId())
            .append("del", getDel())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("seatLevel", getSeatLevel())
            .append("flightId", getFlightId())
/*
            .append("sysUser", getSysUser())
*/
            .toString();
    }
}
