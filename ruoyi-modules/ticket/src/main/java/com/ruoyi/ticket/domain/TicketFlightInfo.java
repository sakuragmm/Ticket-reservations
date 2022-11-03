package com.ruoyi.ticket.domain;

import java.math.BigDecimal;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.ruoyi.common.core.annotation.Excel;
import com.ruoyi.common.core.web.domain.BaseEntity;

/**
 * 航班信息对象 ticket_flight_info
 * 
 * @author gmm
 * @date 2022-09-21
 */
public class TicketFlightInfo extends BaseEntity
{
    private static final long serialVersionUID = 1L;

    /** 主键 */
    private Long id;

    /** 航班编号 */
    private String code;

    /** 航班名称 */
    private String name;

    /** 航班类型 */
    private String type;

    /** 出发地 */
    private String startPlace;

    /** 目的地 */
    private String endPlace;

    /** 机型 */
    private String planType;

    /** 起飞时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date startTime;

    /** 降落时间 */
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date endTime;

    /** 经济舱票价 */
    private BigDecimal commonPrice;

    /** 头等舱票价 */
    private BigDecimal higherPrice;

    /** 经济舱总票数 */
    private Long commonNum;

    /** 头等舱总票数 */
    private Long higherNum;

    /** 经济舱剩余票数 */
    private Long commonSurplus;

    /** 头等舱剩余票数 */
    private Long higherSurplus;

    /** 删除状态(默认0删除1) */
    private String del;

    /** 是否晚点（0正常1晚点）*/
    private String isLate;

    /** 舱位等级 */
    private String seatLevel;

    /** 订票数量 */
    private Long buyNum;

    public String getIsLate() {
        return isLate;
    }

    public void setIsLate(String isLate) {
        this.isLate = isLate;
    }

    public String getSeatLevel() {
        return seatLevel;
    }

    public void setSeatLevel(String seatLevel) {
        this.seatLevel = seatLevel;
    }

    public Long getBuyNum() {
        return buyNum;
    }

    public void setBuyNum(Long buyNum) {
        this.buyNum = buyNum;
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
    public void setType(String type) 
    {
        this.type = type;
    }

    public String getType() 
    {
        return type;
    }
    public void setStartPlace(String startPlace) 
    {
        this.startPlace = startPlace;
    }

    public String getStartPlace() 
    {
        return startPlace;
    }
    public void setEndPlace(String endPlace) 
    {
        this.endPlace = endPlace;
    }

    public String getEndPlace() 
    {
        return endPlace;
    }
    public void setPlanType(String planType) 
    {
        this.planType = planType;
    }

    public String getPlanType() 
    {
        return planType;
    }
    public void setStartTime(Date startTime) 
    {
        this.startTime = startTime;
    }

    public Date getStartTime() 
    {
        return startTime;
    }
    public void setEndTime(Date endTime) 
    {
        this.endTime = endTime;
    }

    public Date getEndTime() 
    {
        return endTime;
    }
    public void setCommonPrice(BigDecimal commonPrice) 
    {
        this.commonPrice = commonPrice;
    }

    public BigDecimal getCommonPrice() 
    {
        return commonPrice;
    }
    public void setHigherPrice(BigDecimal higherPrice) 
    {
        this.higherPrice = higherPrice;
    }

    public BigDecimal getHigherPrice() 
    {
        return higherPrice;
    }
    public void setCommonNum(Long commonNum) 
    {
        this.commonNum = commonNum;
    }

    public Long getCommonNum() 
    {
        return commonNum;
    }
    public void setHigherNum(Long higherNum) 
    {
        this.higherNum = higherNum;
    }

    public Long getHigherNum() 
    {
        return higherNum;
    }
    public void setCommonSurplus(Long commonSurplus) 
    {
        this.commonSurplus = commonSurplus;
    }

    public Long getCommonSurplus() 
    {
        return commonSurplus;
    }
    public void setHigherSurplus(Long higherSurplus) 
    {
        this.higherSurplus = higherSurplus;
    }

    public Long getHigherSurplus() 
    {
        return higherSurplus;
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
            .append("type", getType())
            .append("startPlace", getStartPlace())
            .append("endPlace", getEndPlace())
            .append("planType", getPlanType())
            .append("startTime", getStartTime())
            .append("endTime", getEndTime())
            .append("commonPrice", getCommonPrice())
            .append("higherPrice", getHigherPrice())
            .append("commonNum", getCommonNum())
            .append("higherNum", getHigherNum())
            .append("commonSurplus", getCommonSurplus())
            .append("higherSurplus", getHigherSurplus())
            .append("del", getDel())
            .append("createBy", getCreateBy())
            .append("createTime", getCreateTime())
            .append("updateBy", getUpdateBy())
            .append("updateTime", getUpdateTime())
            .append("remark", getRemark())
            .append("seatLevel", getSeatLevel())
            .append("buyNum", getBuyNum())
            .append("isLate", getIsLate())
            .toString();
    }
}
