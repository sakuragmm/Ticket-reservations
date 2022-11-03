package com.ruoyi.ticket.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.ticket.domain.ArrangeInfo;
import com.ruoyi.ticket.service.ITicketFlightInfoService;
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
import com.ruoyi.ticket.domain.TicketPayment;
import com.ruoyi.ticket.service.ITicketPaymentService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 制定航班Controller
 * 
 * @author gmm
 * @date 2022-10-12
 */
@RestController
@RequestMapping("/payment")
public class TicketPaymentController extends BaseController
{
    @Autowired
    private ITicketPaymentService ticketPaymentService;

    @Autowired
    private ITicketFlightInfoService ticketFlightInfoService;

    /**
     * 查询制定航班列表
     */
    @RequiresPermissions("ticket:payment:list")
    @GetMapping("/list")
    public TableDataInfo list(TicketPayment ticketPayment)
    {
        startPage();
        List<TicketPayment> list = ticketPaymentService.selectTicketPaymentList(ticketPayment);
        return getDataTable(list);
    }

    /**
     * 导出制定航班列表
     */
    @RequiresPermissions("ticket:payment:export")
    @Log(title = "制定航班", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TicketPayment ticketPayment)
    {
        List<TicketPayment> list = ticketPaymentService.selectTicketPaymentList(ticketPayment);
        ExcelUtil<TicketPayment> util = new ExcelUtil<TicketPayment>(TicketPayment.class);
        util.exportExcel(response, list, "制定航班数据");
    }

    /**
     * 获取制定航班详细信息
     */
    @RequiresPermissions("ticket:payment:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(ticketPaymentService.selectTicketPaymentById(id));
    }

    /**
     * 新增制定航班
     */
    @RequiresPermissions("ticket:payment:add")
    @Log(title = "制定航班", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TicketPayment ticketPayment)
    {
        return toAjax(ticketPaymentService.insertTicketPayment(ticketPayment));
    }

    /**
     * 修改制定航班
     */
    @RequiresPermissions("ticket:payment:edit")
    @Log(title = "制定航班", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TicketPayment ticketPayment)
    {
        return toAjax(ticketPaymentService.updateTicketPayment(ticketPayment));
    }

    /**
     * 删除制定航班
     */
    @RequiresPermissions("ticket:payment:remove")
    @Log(title = "制定航班", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ticketPaymentService.deleteTicketPaymentByIds(ids));
    }

    /**
     * 安排航班
     */
    @RequiresPermissions("ticket:payment:arrange")
    @Log(title = "制定航班", businessType = BusinessType.INSERT)
    @PostMapping("/arrange")
    public AjaxResult arrange(@RequestBody ArrangeInfo arrangeInfo)
    {
        return toAjax(ticketFlightInfoService.arrangeTicketFlightInfo(arrangeInfo));
    }
}
