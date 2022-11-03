<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" size="small" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="记录类型" prop="orderType">
        <el-select v-model="queryParams.orderType" placeholder="请选择记录类型" clearable>
          <el-option
            v-for="dict in dict.type.order_record_type"
            :key="dict.value"
            :label="dict.label"
            :value="dict.value"
          />
        </el-select>
      </el-form-item>
<!--      <el-form-item label="航班名称" prop="name">
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
      <el-form-item label="起飞时间" prop="startTime">
        <el-date-picker clearable
          v-model="queryParams.startTime"
          type="date"
          value-format="yyyy-MM-dd"
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
          v-hasPermi="['ticket:record:add']"
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
          v-hasPermi="['ticket:record:edit']"
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
          v-hasPermi="['ticket:record:remove']"
        >删除</el-button>
      </el-col>
<!--      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ticket:record:export']"
        >导出</el-button>
      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="recordList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="记录类型" align="center" prop="orderType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.order_record_type" :value="scope.row.orderType"/>
        </template>
      </el-table-column>
      <el-table-column label="订单客户" align="center" prop="sysUser.nickName" />
      <el-table-column label="订单号" align="center" prop="code" />
      <el-table-column label="航班名称" align="center" prop="name" />
      <el-table-column label="航线" align="center" prop="routes" />
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
      <el-table-column label="订购数量" align="center" prop="buyNum" />
      <el-table-column label="舱位等级" align="center" prop="seatLevel">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.seat_level" :value="scope.row.seatLevel"/>
        </template>
      </el-table-column>
      <el-table-column label="总价" align="center" prop="allPrice" />
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime, '{y}-{m}-{d} {h}:{i}:{s}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" fixed="right" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ticket:record:edit']"
          >修改</el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ticket:record:remove']"
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

    <!-- 添加或修改订单记录对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
<!--        <el-form-item label="记录类型" prop="orderType">
          <el-select v-model="form.orderType" placeholder="请选择记录类型">
            <el-option
              v-for="dict in dict.type.order_record_type"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
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
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择起飞时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="订购日期" prop="buyTime">
          <el-date-picker clearable
            v-model="form.buyTime"
            type="date"
            value-format="yyyy-MM-dd"
            placeholder="请选择订购日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="订购数量" prop="buyNum">
          <el-input v-model="form.buyNum" placeholder="请输入订购数量" />
        </el-form-item>
        <el-form-item label="舱位等级" prop="seatLevel">
          <el-select v-model="form.seatLevel" placeholder="请选择舱位等级">
            <el-option
              v-for="dict in dict.type.seat_level"
              :key="dict.value"
              :label="dict.label"
:value="dict.value"
            ></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="总价" prop="allPrice">
          <el-input v-model="form.allPrice" placeholder="请输入总价" />
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
  </div>
</template>

<script>
import { listRecord, getRecord, delRecord, addRecord, updateRecord } from "@/api/ticket/record";

export default {
  name: "Record",
  dicts: ['order_record_type', 'seat_level'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 选中记录订单号
      codes: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 订单记录表格数据
      recordList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        orderType: null,
        code: null,
        name: null,
        routes: null,
        startTime: null,
        buyTime: null,
        buyNum: null,
        seatLevel: null,
        allPrice: null,
      },
      // 表单参数
      form: {},
      // 表单校验
      rules: {
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询订单记录列表 */
    getList() {
      this.loading = true;
      listRecord(this.queryParams).then(response => {
        this.recordList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: null,
        orderType: null,
        code: null,
        name: null,
        routes: null,
        startTime: null,
        buyTime: null,
        buyNum: null,
        seatLevel: null,
        allPrice: null,
        userId: null,
        del: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
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
      this.codes = selection.map(item => item.code)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加订单记录";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getRecord(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改订单记录";
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updateRecord(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addRecord(this.form).then(response => {
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
      const codes = row.code || this.codes
      this.$modal.confirm('是否确认删除订单编号为"' + codes + '"的数据项？').then(function() {
        return delRecord(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ticket/record/export', {
        ...this.queryParams
      }, `record_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
