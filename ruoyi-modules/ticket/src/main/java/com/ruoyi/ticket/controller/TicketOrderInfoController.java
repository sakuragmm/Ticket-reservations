package com.ruoyi.ticket.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.ticket.domain.TicketFlightInfo;
import com.ruoyi.ticket.service.ITicketOrderRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.log.annotation.Log;
import com.ruoyi.common.log.enums.BusinessType;
import com.ruoyi.common.security.annotation.RequiresPermissions;
import com.ruoyi.ticket.domain.TicketOrderInfo;
import com.ruoyi.ticket.service.ITicketOrderInfoService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 订单信息Controller
 * 
 * @author gmm
 * @date 2022-09-21
 */
@RestController
@RequestMapping("/orderm")
public class TicketOrderInfoController extends BaseController
{
    @Autowired
    private ITicketOrderInfoService ticketOrderInfoService;

    @Autowired
    private ITicketOrderRecordService ticketOrderRecordService;

    /**
     * 查询订单信息列表
     */
    @RequiresPermissions("ticket:orderm:list")
    @GetMapping("/list")
    public TableDataInfo list(TicketOrderInfo ticketOrderInfo)
    {
        startPage();
        List<TicketOrderInfo> list = ticketOrderInfoService.selectTicketOrderInfoList(ticketOrderInfo);
        return getDataTable(list);
    }

    /**
     * 导出订单信息列表
     */
    @RequiresPermissions("ticket:orderm:export")
    @Log(title = "订单信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TicketOrderInfo ticketOrderInfo)
    {
        List<TicketOrderInfo> list = ticketOrderInfoService.selectTicketOrderInfoList(ticketOrderInfo);
        ExcelUtil<TicketOrderInfo> util = new ExcelUtil<TicketOrderInfo>(TicketOrderInfo.class);
        util.exportExcel(response, list, "订单信息数据");
    }

    /**
     * 获取订单信息详细信息
     */
    @RequiresPermissions("ticket:orderm:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(ticketOrderInfoService.selectTicketOrderInfoById(id));
    }

    /**
     * 新增订单信息
     */
    @RequiresPermissions("ticket:orderm:add")
    @Log(title = "订单信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TicketFlightInfo ticketFlightInfo)
    {
        return toAjax(ticketOrderInfoService.insertTicketOrderInfo(ticketFlightInfo,"0"));
    }

    /**
     * 改签新增订单信息
     */
    @RequiresPermissions("ticket:orderm:change")
    @Log(title = "订单信息", businessType = BusinessType.INSERT)
    @PostMapping("/change")
    public AjaxResult change(@RequestBody TicketFlightInfo ticketFlightInfo)
    {
        return toAjax(ticketOrderInfoService.insertTicketOrderInfo(ticketFlightInfo,"1"));
    }

    /**
     * 修改订单信息
     */
    @RequiresPermissions("ticket:orderm:edit")
    @Log(title = "订单信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TicketOrderInfo ticketOrderInfo)
    {
        return toAjax(ticketOrderInfoService.updateTicketOrderInfo(ticketOrderInfo));
    }

    /**
     * 删除订单
     */
    @RequiresPermissions("ticket:orderm:remove")
    @Log(title = "订单信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ticketOrderInfoService.deleteTicketOrderInfoByIds(ids,"2"));
    }

    /**
     * 退票
     */
    @RequiresPermissions("ticket:orderm:refund")
    @Log(title = "订单信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/refund/{ids}")
    public AjaxResult refund(@PathVariable Long[] ids)
    {
        return toAjax(ticketOrderInfoService.deleteTicketOrderInfoByIds(ids, "2"));
    }

    /**
     * 改签退票
     */
    @RequiresPermissions("ticket:orderm:refund")
    @Log(title = "订单信息", businessType = BusinessType.DELETE)
    @DeleteMapping("/change/{ids}")
    public AjaxResult delChange(@PathVariable Long[] ids)
    {
        //此处改签退票不需要生成订单记录，所以传值为null
        return toAjax(ticketOrderInfoService.deleteTicketOrderInfoByIds(ids, null));
    }

    /**
     * 支付订单
     */
    @RequiresPermissions("ticket:orderm:pay")
    @Log(title = "订单信息", businessType = BusinessType.UPDATE)
    @PutMapping("/pay/{id}")
    public AjaxResult pay(@PathVariable Long id){
        return toAjax(ticketOrderInfoService.updatePay(id));
    }
}
