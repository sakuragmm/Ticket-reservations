<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="订单号" prop="code">
        <el-input
          v-model="queryParams.code"
          placeholder="请输入订单号"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="航班名称" prop="name">
        <el-input
          v-model="queryParams.name"
          placeholder="请输入航班名称"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>-->
      <el-form-item label="航线" prop="routes">
        <el-input
          v-model="queryParams.routes"
          placeholder="请输入航线"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="舱位等级" prop="seatLevel">
        <el-select v-model="queryParams.seatLevel" placeholder="请选择舱位等级" clearable>
          <el-option
            v-for="dict in dict.type.seat_level"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="起飞时间" prop="startTime">
        <el-date-picker clearable
          v-model="queryParams.startTime"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择起飞时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="订购日期" prop="buyTime">
        <el-date-picker clearable
          v-model="queryParams.buyTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择订购日期">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="付款状态" prop="paymentStatus">
        <el-select v-model="queryParams.paymentStatus" placeholder="请选择付款状态" clearable>
          <el-option
            v-for="dict in dict.type.payment_status"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
<!--      <el-form-item label="订购数量" prop="buyNum">
        <el-input
          v-model="queryParams.buyNum"
          placeholder="请输入订购数量"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="票价" prop="price">
        <el-input
          v-model="queryParams.price"
          placeholder="请输入票价"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="总价" prop="allPrice">
        <el-input
          v-model="queryParams.allPrice"
          placeholder="请输入总价"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>-->
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
<!--      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['ticket:orderm:add']"
        >新增</el-button>
      </el-col>-->
<!--      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ticket:orderm:edit']"
        >修改</el-button>
      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ticket:orderm:remove']"
        >取消订单</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-s-release"
          size="mini"
          :disabled="multiple"
          @click="handleRefund"
          v-hasPermi="['ticket:orderm:refund']"
        >退票</el-button>
      </el-col>
<!--      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-shopping-cart-2"
          size="mini"
          :disabled="multiple"
          @click="handlePay"
          v-hasPermi="['ticket:orderm:pay']"
        >支付</el-button>
      </el-col>-->
<!--      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ticket:orderm:export']"
        >导出</el-button>
      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="ordermList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="订单号" align="center" prop="code" />
      <el-table-column label="航班名称" align="center" prop="name" />
      <el-table-column label="航线" align="center" prop="routes" />
      <el-table-column label="乘客" align="center" prop="sysUser.nickName" />
      <el-table-column label="起飞时间" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="订购日期" align="center" prop="buyTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.buyTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="舱位等级" align="center" prop="seatLevel">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.seat_level" :value="scope.row.seatLevel"/>
        </template>
      </el-table-column>
      <el-table-column label="订购数量" align="center" prop="buyNum" />
      <el-table-column label="票价" align="center" prop="price" />
      <el-table-column label="总价" align="center" prop="allPrice" />
      <el-table-column label="付款状态" align="center" prop="paymentStatus">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.payment_status" :value="scope.row.paymentStatus"/>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
<!--          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ticket:orderm:edit']"
          >修改</el-button>-->
          <el-button
            size="mini"
            type="text"
            icon="el-icon-s-goods"
            @click="handlePay(scope.row)"
            v-hasPermi="['ticket:orderm:pay']"
          >支付</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleChange(scope.row)"
            v-hasPermi="['ticket:orderm:change']"
          >改签</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-s-release"
            @click="handleRefund(scope.row)"
            v-hasPermi="['ticket:orderm:refund']"
          >退票</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ticket:orderm:remove']"
          >取消订单</el-button>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />

    <!-- 添加或修改订单信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="订单号" prop="code">
          <el-input v-model="form.code" placeholder="请输入订单号" />
        </el-form-item>
        <el-form-item label="航班名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入航班名称" />
        </el-form-item>
        <el-form-item label="航线" prop="routes">
          <el-input v-model="form.routes" placeholder="请输入航线" />
        </el-form-item>
        <el-form-item label="起飞时间" prop="startTime">
          <el-date-picker clearable
            v-model="form.startTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择起飞时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="订购日期" prop="buyTime">
          <el-date-picker clearable
            v-model="form.buyTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择订购日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="订购数量" prop="buyNum">
          <el-input v-model="form.buyNum" placeholder="请输入订购数量" />
        </el-form-item>
        <el-form-item label="票价" prop="price">
          <el-input v-model="form.price" placeholder="请输入票价" />
        </el-form-item>
        <el-form-item label="总价" prop="allPrice">
          <el-input v-model="form.allPrice" placeholder="请输入总价" />
        </el-form-item>
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 改签弹出列表 -->
    <el-dialog :title="title" :visible.sync="change" width="1000px" append-to-body>
      <el-table v-loading="loading1" :data="flightmList">
        <el-table-column label="航班编号" align="center" prop="code" />
        <el-table-column label="航班名称" align="center" prop="name" />
        <el-table-column label="航班类型" align="center" prop="type">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.ticket_type" :value="scope.row.type"/>
          </template>
        </el-table-column>
        <el-table-column label="出发地" align="center" prop="startPlace" />
        <el-table-column label="目的地" align="center" prop="endPlace" />
        <el-table-column label="机型" align="center" prop="planType">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.plan_type" :value="scope.row.planType"/>
          </template>
        </el-table-column>
        <el-table-column label="起飞时间" sortable align="center" prop="startTime" width="180">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="到达时间" sortable align="center" prop="endTime" width="180">
          <template slot-scope="scope">
            <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
          </template>
        </el-table-column>
        <el-table-column label="航班状态" align="center" prop="isLate">
          <template slot-scope="scope">
            <dict-tag :options="dict.type.is_late" :value="scope.row.isLate"/>
          </template>
        </el-table-column>
        <el-table-column label="经济舱" align="center">
          <el-table-column label="票价/￥" align="center" prop="commonPrice" />
          <el-table-column label="总票数" align="center" prop="commonNum" />
          <el-table-column label="余票数" align="center" prop="commonSurplus" />
        </el-table-column>
        <el-table-column label="头等舱" align="center">
          <el-table-column label="票价/￥" align="center" prop="higherPrice" />
          <el-table-column label="总票数" align="center" prop="higherNum" />
          <el-table-column label="余票数" align="center" prop="higherSurplus" />
        </el-table-column>
        <el-table-column label="备注" align="center" prop="remark" />
        <el-table-column label="操作" fixed="right" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button
              size="mini"
              type="text"
              icon="el-icon-edit"
              @click="reallyChange(scope.row)"
              v-hasPermi="['ticket:orderm:change']"
            >确认改签</el-button>
          </template>
        </el-table-column>
      </el-table>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>


    <!-- 客户改签对话框 -->
    <el-dialog :title="title" :visible.sync="buy" width="500px" append-to-body>
      <el-form ref="flightmform" :model="flightmform" :rules="rules" label-width="80px">
        <el-form-item label="航班编号" >
          <el-input v-model="flightmform.code" :readonly = "true" />
        </el-form-item>
        <el-form-item label="航班名称" >
          <el-input v-model="flightmform.name" :readonly = "true"/>
        </el-form-item>
        <el-form-item label="航班类型" >
          <el-select v-model="flightmform.type" :disabled = "true">
            <el-option
              v-for="dict in dict.type.ticket_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="航线" >
          <el-input v-model="flightmform.startPlace+'-'+flightmform.endPlace" :readonly = "true" />
        </el-form-item>
        <el-form-item label="机型" >
          <el-select v-model="flightmform.planType" :disabled = "true">
            <el-option
              v-for="dict in dict.type.plan_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="起飞时间" >
          <el-date-picker clearable
                          v-model="flightmform.startTime"
                          type="datetime"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          :readonly = "true">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="到达时间" >
          <el-date-picker clearable
                          v-model="flightmform.endTime"
                          type="datetime"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          :readonly = "true">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="座舱等级" prop="seatLevel">
          <el-radio-group v-model="flightmform.seatLevel">
            <el-radio
              v-for="dict in dict.type.seat_level"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="订票数量" prop="buyNum">
          <el-input-number v-model="flightmform.buyNum"  :min="1" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="buyForm">确 定</el-button>
        <el-button @click="cancel1">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import {listOrderm, getOrderm, delOrderm, delChangeOrderm, addOrderm, updateOrderm, refundOrderm, changeOrderm, payOrderm} from "@/api/ticket/orderm";
import { listFlightm, getFlightm } from "@/api/ticket/flightm";


export default {
  name: "Orderm",
  dicts: ['seat_level','plan_type', 'ticket_type', 'payment_status', 'is_late'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 航班信息表遮罩层
      loading1: true,
      // 选中数组
      ids: [],
      //选中编码数组
      codes: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 订单信息表格数据
      ordermList: [],
      // 航班信息表格数据
      flightmList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示改签弹框
      change: false,
      // 改签订票弹出层
      buy: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        code: null,
        name: null,
        routes: null,
        startTime: null,
        buyTime: null,
        buyNum: null,
        price: null,
        allPrice: null,
        seatLevel: null,
        paymentStatus: null,
      },
      // 表单参数
      form: {},
      // 航班信息表单参数
      flightmform: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询订单信息列表 */
    getList() {
      this.loading = true;
      listOrderm(this.queryParams).then(response => {
        this.ordermList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.change = false;
      this.reset();
    },
    // 改签框取消
    cancel1() {
      this.buy = false;
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        code: null,
        name: null,
        routes: null,
        startTime: null,
        buyTime: null,
        buyNum: null,
        price: null,
        allPrice: null,
        userId: null,
        seatLevel: null,
        del: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        paymentStatus: null,
      };
      this.resetForm("form");
      this.flightmform = {
        id: null,
        code: null,
        name: null,
        type: null,
        startPlace: null,
        endPlace: null,
        planType: null,
        startTime: null,
        endTime: null,
        commonPrice: null,
        higherPrice: null,
        commonNum: null,
        higherNum: null,
        seatLevel: null,
        buyNum: null,
        commonSurplus: null,
        higherSurplus: null,
        del: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null,
        isLate: null,
      };
      this.resetForm("flightmform");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.id)
      this.codes = selection.map(item => item.code)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加订单信息";
    },
    /** 改签按钮 */
    handleChange(row) {
      this.ids = row.id
      this.loading1 = true;
      listFlightm().then(response => {
        this.flightmList = response.rows;
        this.loading1 = false;
      });
      this.change = true;
      this.title = "客户改签"
    },
    /** 确认改签 */
    reallyChange(row){
      getFlightm(row.id).then(response => {
        this.flightmform = response.data;
        this.buy = true;
        this.title = "客户改签";
      });
    },
    /** 提交改签 */
    buyForm() {
      //表单验证
      this.$refs["flightmform"].validate(valid => {
        if (valid) {
          if ((this.flightmform.seatLevel=="0" && this.flightmform.buyNum > this.flightmform.commonSurplus)
            ||(this.flightmform.seatLevel=="1" && this.flightmform.buyNum > this.flightmform.higherSurplus)){
            this.$modal.msgError("改签失败-余票不足！")
          }
          else {
            changeOrderm(this.flightmform).then(response => {
              this.$modal.msgSuccess("改签成功");
              this.buy = false;
              this.change = false;
              this.getList();
              delChangeOrderm(this.ids).then(response => {
                this.getList();
              })
            })
          }
        }
      });
    },
    /** 支付按钮 */
    handlePay(row){
      const id = row.id
      const code = row.code
      if (row.paymentStatus == 1){
        this.$modal.msgError('订单编号"' + code + '"已支付，无需重复付款')
      }else {
        this.$modal.confirm('订单编号为"' + code + '"，是否付款？').then(function () {
          return payOrderm(id);
        }).then(() => {
          this.getList();
          this.$modal.msgSuccess("付款成功");
        }).catch(() => {});
      }
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getOrderm(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单信息";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateOrderm(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addOrderm(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },

    /** 退票操作 */
    handleRefund(row) {
      const ids = row.id || this.ids;
      const codes = row.code || this.codes
      this.$modal.confirm('订单编号为"' + codes + '"，是否退票？').then(function() {
        return refundOrderm(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("退票成功");
      }).catch(() => {});
    },

    /** 取消订单按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      const codes = row.code || this.codes
      this.$modal.confirm('订单编号为"' + codes + '"，是否取消订单？').then(function() {
        return delOrderm(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("取消订单成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    /*handleExport() {
      this.download('ticket/orderm/export', {
        ...this.queryParams
      }, `orderm_${new Date().getTime()}.xlsx`)
    }*/
  }
};
</script>
