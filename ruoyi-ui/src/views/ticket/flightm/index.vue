<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
<!--      <el-form-item label="航班编号" prop="code">
        <el-input
          v-model="queryParams.code"
          placeholder="请输入航班编号"
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
      <el-form-item label="航班类型" prop="type">
        <el-select v-model="queryParams.type" placeholder="请选择航班类型" clearable>
          <el-option
            v-for="dict in dict.type.ticket_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="出发地" prop="startPlace">
        <el-input
          v-model="queryParams.startPlace"
          placeholder="请输入出发地"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="目的地" prop="endPlace">
        <el-input
          v-model="queryParams.endPlace"
          placeholder="请输入目的地"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="机型" prop="planType">
        <el-select v-model="queryParams.planType" placeholder="请选择机型" clearable>
          <el-option
            v-for="dict in dict.type.plan_type"
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
      <el-form-item label="降落时间" prop="endTime">
        <el-date-picker clearable
          v-model="queryParams.endTime"
          type="datetime"
          value-format="yyyy-MM-dd HH:mm:ss"
          placeholder="请选择降落时间">
        </el-date-picker>
      </el-form-item>
<!--      <el-form-item label="航班状态" prop="isLate">
        <el-select v-model="queryParams.isLate" placeholder="请选择航班状态" clearable>
          <el-option
            v-for="dict in dict.type.is_late"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>-->
      <!--
      <el-form-item label="经济舱票价" prop="commonPrice">
        <el-input
          v-model="queryParams.commonPrice"
          placeholder="请输入经济舱票价"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="头等舱票价" prop="higherPrice">
        <el-input
          v-model="queryParams.higherPrice"
          placeholder="请输入头等舱票价"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="经济舱总票数" prop="commonNum">
        <el-input
          v-model="queryParams.commonNum"
          placeholder="请输入经济舱总票数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="头等舱总票数" prop="higherNum">
        <el-input
          v-model="queryParams.higherNum"
          placeholder="请输入头等舱总票数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="经济舱剩余票数" prop="commonSurplus">
        <el-input
          v-model="queryParams.commonSurplus"
          placeholder="请输入经济舱剩余票数"
          clearable
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="头等舱剩余票数" prop="higherSurplus">
        <el-input
          v-model="queryParams.higherSurplus"
          placeholder="请输入头等舱剩余票数"
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
          v-hasPermi="['ticket:flightm:add']"
        >新增</el-button>
      </el-col>-->
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ticket:flightm:edit']"
        >修改</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['ticket:flightm:remove']"
        >删除</el-button>
      </el-col>
<!--      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ticket:flightm:export']"
        >导出</el-button>
      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="flightmList" @selection-change="handleSelectionChange"
              :default-sort = "{prop: 'startTime', order: 'ascending'}"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="航班编号" align="center" prop="code" />
      <el-table-column label="航班名称" align="center" prop="name" />
      <el-table-column label="航班类型" align="center" prop="type">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.ticket_type" :value="scope.row.type"/>
        </template>
      </el-table-column>
      <el-table-column label="出发地" align="center" prop="startPlace" />
      <el-table-column label="目的地" align="center" prop="endPlace" />
      <el-table-column label="机型" align="center" prop="planType" width="110">
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
      <el-table-column label="创建时间" sortable align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" fixed="right" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-thumb"
            @click="handleBuy(scope.row)"
            v-hasPermi="['ticket:flightm:buy']"
          >订票</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ticket:flightm:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ticket:flightm:remove']"
          >删除</el-button>
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

    <!-- 添加或修改航班信息对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="航班编号" prop="code">
          <el-input v-model="form.code" placeholder="请输入航班编号" />
        </el-form-item>
        <el-form-item label="航班名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入航班名称" />
        </el-form-item>
        <el-form-item label="航班类型" prop="type">
          <el-select v-model="form.type" placeholder="请选择航班类型">
            <el-option
              v-for="dict in dict.type.ticket_type"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="出发地" prop="startPlace">
          <el-input v-model="form.startPlace" placeholder="请输入出发地" />
        </el-form-item>
        <el-form-item label="目的地" prop="endPlace">
          <el-input v-model="form.endPlace" placeholder="请输入目的地" />
        </el-form-item>
        <el-form-item label="机型" prop="planType">
          <el-select v-model="form.planType" placeholder="请选择机型">
            <el-option
              v-for="dict in dict.type.plan_type"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="起飞时间" prop="startTime">
          <el-date-picker clearable
            v-model="form.startTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择起飞时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="到达时间" prop="endTime">
          <el-date-picker clearable
            v-model="form.endTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择到达时间">
          </el-date-picker>
        </el-form-item>-->
        <el-form-item label="航班状态" prop="isLate">
          <el-radio-group v-model="form.isLate">
            <el-radio
              v-for="dict in dict.type.is_late"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
<!--        <el-form-item label="经济舱票价" prop="commonPrice">
          <el-input v-model="form.commonPrice" placeholder="请输入经济舱票价" />
        </el-form-item>
        <el-form-item label="头等舱票价" prop="higherPrice">
          <el-input v-model="form.higherPrice" placeholder="请输入头等舱票价" />
        </el-form-item>
        <el-form-item label="经济舱总票数" prop="commonNum">
          <el-input v-model="form.commonNum" placeholder="请输入经济舱总票数" />
        </el-form-item>
        <el-form-item label="头等舱总票数" prop="higherNum">
          <el-input v-model="form.higherNum" placeholder="请输入头等舱总票数" />
        </el-form-item>
        <el-form-item label="经济舱剩余票数" prop="commonSurplus">
          <el-input v-model="form.commonSurplus" placeholder="请输入经济舱剩余票数" />
        </el-form-item>
        <el-form-item label="头等舱剩余票数" prop="higherSurplus">
          <el-input v-model="form.higherSurplus" placeholder="请输入头等舱剩余票数" />
        </el-form-item>-->
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 客户订票对话框 -->
    <el-dialog :title="title" :visible.sync="buy" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="航班编号" >
          <el-input v-model="form.code" :readonly = "true" />
        </el-form-item>
        <el-form-item label="航班名称" >
          <el-input v-model="form.name" :readonly = "true"/>
        </el-form-item>
        <el-form-item label="航班类型" >
          <el-select v-model="form.type" :disabled = "true">
            <el-option
              v-for="dict in dict.type.ticket_type"
              :key="dict.value"
              :label="dict.label"
              :value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="航线" >
          <el-input v-model="form.startPlace+'-'+form.endPlace" :readonly = "true" />
        </el-form-item>
        <el-form-item label="机型" >
          <el-select v-model="form.planType" :disabled = "true">
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
                          v-model="form.startTime"
                          type="datetime"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          :readonly = "true">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="到达时间" >
          <el-date-picker clearable
                          v-model="form.endTime"
                          type="datetime"
                          value-format="yyyy-MM-dd HH:mm:ss"
                          :readonly = "true">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="座舱等级" prop="seatLevel">
          <el-radio-group v-model="form.seatLevel">
            <el-radio
              v-for="dict in dict.type.seat_level"
              :key="dict.value"
              :label="dict.value"
            >{{dict.label}}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="订票数量" prop="buyNum">
          <el-input-number v-model="form.buyNum"  :min="1" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="buyForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

  </div>
</template>

<script>
import { listFlightm, getFlightm, delFlightm, addFlightm, updateFlightm } from "@/api/ticket/flightm";
import {  addOrderm } from "@/api/ticket/orderm";

export default {
  name: "Flightm",
  dicts: ['plan_type', 'ticket_type', 'seat_level', 'is_late'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 航班信息表格数据
      flightmList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示订票弹出层
      buy: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
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
        commonSurplus: null,
        higherSurplus: null,
        isLate: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
        code: [
          { required: true, message: "航班编号不能为空", trigger: "blur" }
        ],
        name: [
          { required: true, message: "航班名称不能为空", trigger: "blur" }
        ],
        type: [
          { required: true, message: "航班类型不能为空", trigger: "change" }
        ],
        startPlace: [
          { required: true, message: "出发地不能为空", trigger: "blur" }
        ],
        endPlace: [
          { required: true, message: "目的地不能为空", trigger: "blur" }
        ],
        planType: [
          { required: true, message: "机型不能为空", trigger: "change" }
        ],
        seatLevel: [
          { required: true, message: "座舱类型不能为空", trigger: "blur"}
        ],
        buyNum: [
          { required: true, message: "订票数量不能为空", trigger: "blur"}
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询航班信息列表 */
    getList() {
      this.loading = true;
      listFlightm(this.queryParams).then(response => {
        this.flightmList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.buy = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
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
      this.resetForm("form");
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
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加航班信息";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getFlightm(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改航班信息";
      });
    },
    /** 订票 */
    handleBuy(row) {
      this.reset();
      const id = row.id
      getFlightm(id).then(response => {
        this.form = response.data;
        this.buy = true;
        this.title = "客户订票";
      });
    },

    buyForm() {
      //表单验证
      this.$refs["form"].validate(valid => {
        if (valid) {
          if ((this.form.seatLevel=="0" && this.form.buyNum > this.form.commonSurplus)
            ||(this.form.seatLevel=="1" && this.form.buyNum > this.form.higherSurplus)){
            this.$modal.msgError("订票失败-余票不足！")
          }
          else {
            addOrderm(this.form).then(response => {
              this.$modal.msgSuccess("订票成功");
              this.buy = false;
              this.getList();
            })
          }
        }
      });

    },

    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateFlightm(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addFlightm(this.form).then(response => {
              this.$modal.msgSuccess("新增成功");
              this.open = false;
              this.getList();
            });
          }
        }
      });
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const ids = row.id || this.ids;
      this.$modal.confirm('是否确认删除航班信息编号为"' + ids + '"的数据项？').then(function() {
        return delFlightm(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    /*handleExport() {
      this.download('ticket/flightm/export', {
        ...this.queryParams
      }, `flightm_${new Date().getTime()}.xlsx`)
    }*/
  }
};
</script>
