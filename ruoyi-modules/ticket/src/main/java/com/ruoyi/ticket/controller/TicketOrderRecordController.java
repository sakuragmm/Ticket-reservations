package com.ruoyi.ticket.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
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
import com.ruoyi.ticket.domain.TicketOrderRecord;
import com.ruoyi.ticket.service.ITicketOrderRecordService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 订单记录Controller
 * 
 * @author gmm
 * @date 2022-10-14
 */
@RestController
@RequestMapping("/record")
public class TicketOrderRecordController extends BaseController
{
    @Autowired
    private ITicketOrderRecordService ticketOrderRecordService;

    /**
     * 查询订单记录列表
     */
    @RequiresPermissions("ticket:record:list")
    @GetMapping("/list")
    public TableDataInfo list(TicketOrderRecord ticketOrderRecord)
    {
        startPage();
        List<TicketOrderRecord> list = ticketOrderRecordService.selectTicketOrderRecordList(ticketOrderRecord);
        return getDataTable(list);
    }

    /**
     * 导出订单记录列表
     */
    @RequiresPermissions("ticket:record:export")
    @Log(title = "订单记录", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TicketOrderRecord ticketOrderRecord)
    {
        List<TicketOrderRecord> list = ticketOrderRecordService.selectTicketOrderRecordList(ticketOrderRecord);
        ExcelUtil<TicketOrderRecord> util = new ExcelUtil<TicketOrderRecord>(TicketOrderRecord.class);
        util.exportExcel(response, list, "订单记录数据");
    }

    /**
     * 获取订单记录详细信息
     */
    @RequiresPermissions("ticket:record:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(ticketOrderRecordService.selectTicketOrderRecordById(id));
    }

    /**
     * 新增订单记录
     */
    @RequiresPermissions("ticket:record:add")
    @Log(title = "订单记录", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TicketOrderRecord ticketOrderRecord)
    {
        return toAjax(ticketOrderRecordService.insertTicketOrderRecord(ticketOrderRecord));
    }

    /**
     * 修改订单记录
     */
    @RequiresPermissions("ticket:record:edit")
    @Log(title = "订单记录", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TicketOrderRecord ticketOrderRecord)
    {
        return toAjax(ticketOrderRecordService.updateTicketOrderRecord(ticketOrderRecord));
    }

    /**
     * 删除订单记录
     */
    @RequiresPermissions("ticket:record:remove")
    @Log(title = "订单记录", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ticketOrderRecordService.deleteTicketOrderRecordByIds(ids));
    }
}
