package com.ruoyi.ticket.controller;

import java.util.List;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

import io.swagger.annotations.ApiOperation;
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
import com.ruoyi.ticket.domain.TicketFlightInfo;
import com.ruoyi.ticket.service.ITicketFlightInfoService;
import com.ruoyi.common.core.web.controller.BaseController;
import com.ruoyi.common.core.web.domain.AjaxResult;
import com.ruoyi.common.core.utils.poi.ExcelUtil;
import com.ruoyi.common.core.web.page.TableDataInfo;

/**
 * 航班信息Controller
 * 
 * @author gmm
 * @date 2022-09-21
 */
@RestController
@RequestMapping("/flightm")
public class TicketFlightInfoController extends BaseController
{
    @Autowired
    private ITicketFlightInfoService ticketFlightInfoService;

    /**
     * 查询航班信息列表
     */
    @ApiOperation(value = "查询航班信息列表")
    @RequiresPermissions("ticket:flightm:list")
    @GetMapping("/list")
    public TableDataInfo list(TicketFlightInfo ticketFlightInfo)
    {
        startPage();
        List<TicketFlightInfo> list = ticketFlightInfoService.selectTicketFlightInfoList(ticketFlightInfo);
        return getDataTable(list);
    }

    /**
     * 导出航班信息列表
     */
    @RequiresPermissions("ticket:flightm:export")
    @Log(title = "航班信息", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, TicketFlightInfo ticketFlightInfo)
    {
        List<TicketFlightInfo> list = ticketFlightInfoService.selectTicketFlightInfoList(ticketFlightInfo);
        ExcelUtil<TicketFlightInfo> util = new ExcelUtil<TicketFlightInfo>(TicketFlightInfo.class);
        util.exportExcel(response, list, "航班信息数据");
    }

    /**
     * 获取航班信息详细信息
     */
    @RequiresPermissions("ticket:flightm:query")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return AjaxResult.success(ticketFlightInfoService.selectTicketFlightInfoById(id));
    }

    /**
     * 新增航班信息
     */
    @RequiresPermissions("ticket:flightm:add")
    @Log(title = "航班信息", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody TicketFlightInfo ticketFlightInfo)
    {
        return toAjax(ticketFlightInfoService.insertTicketFlightInfo(ticketFlightInfo));
    }

    /**
     * 修改航班信息
     */
    @RequiresPermissions("ticket:flightm:edit")
    @Log(title = "航班信息", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody TicketFlightInfo ticketFlightInfo)
    {
        return toAjax(ticketFlightInfoService.updateTicketFlightInfo(ticketFlightInfo));
    }

    /**
     * 删除航班信息
     */
    @RequiresPermissions("ticket:flightm:remove")
    @Log(title = "航班信息", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable Long[] ids)
    {
        return toAjax(ticketFlightInfoService.deleteTicketFlightInfoByIds(ids));
    }
}
