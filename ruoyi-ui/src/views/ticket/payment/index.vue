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
<!--      <el-form-item label="起飞时间" prop="startTime">
        <el-date-picker clearable
          v-model="queryParams.startTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择起飞时间">
        </el-date-picker>
      </el-form-item>
      <el-form-item label="降落时间" prop="endTime">
        <el-date-picker clearable
          v-model="queryParams.endTime"
          type="date"
          value-format="yyyy-MM-dd"
          placeholder="请选择降落时间">
        </el-date-picker>
      </el-form-item>-->
<!--      <el-form-item label="经济舱票价" prop="commonPrice">
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
      <el-col :span="1.5">
        <el-button
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          v-hasPermi="['ticket:payment:add']"
        >新增</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="success"
          plain
          icon="el-icon-edit"
          size="mini"
          :disabled="single"
          @click="handleUpdate"
          v-hasPermi="['ticket:payment:edit']"
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
          v-hasPermi="['ticket:payment:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-thumb"
          size="mini"
          :disabled="multiple"
          @click="handleArrange"
          v-hasPermi="['ticket:payment:arrange']"
        >安排航班</el-button>
      </el-col>
<!--      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['ticket:payment:export']"
        >导出</el-button>
      </el-col>-->
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="paymentList" @selection-change="handleSelectionChange">
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
      <el-table-column label="机型" align="center" prop="planType">
        <template slot-scope="scope">
          <dict-tag :options="dict.type.plan_type" :value="scope.row.planType"/>
        </template>
      </el-table-column>
<!--      <el-table-column label="起飞时间" align="center" prop="startTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.startTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>
      <el-table-column label="降落时间" align="center" prop="endTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.endTime, '{y}-{m}-{d}') }}</span>
        </template>
      </el-table-column>-->
      <el-table-column label="经济舱" align="center">
        <el-table-column label="票价" align="center" prop="commonPrice" />
        <el-table-column label="总票数" align="center" prop="commonNum" />
      </el-table-column>
      <el-table-column label="头等舱" align="center">
        <el-table-column label="票价" align="center" prop="higherPrice" />
        <el-table-column label="总票数" align="center" prop="higherNum" />
      </el-table-column>

<!--      <el-table-column label="经济舱剩余票数" align="center" prop="commonSurplus" />
      <el-table-column label="头等舱剩余票数" align="center" prop="higherSurplus" />-->
      <el-table-column label="备注" align="center" prop="remark" />
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-thumb"
            @click="handleArrange(scope.row)"
            v-hasPermi="['ticket:payment:arrange']"
          >安排航班</el-button><br>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['ticket:payment:edit']"
          >修改</el-button><br>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['ticket:payment:remove']"
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

    <!-- 添加或修改制定航班对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="航班编号" prop="code">
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
        <el-form-item label="经济舱票价" prop="commonPrice">
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
        <el-form-item label="备注" prop="remark">
          <el-input v-model="form.remark" type="textarea" placeholder="请输入内容" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

    <!-- 安排航班对话框 -->
    <el-dialog :title="title" :visible.sync="arrange" width="500px" append-to-body>
      <el-form ref="arrangeForm" :model="arrangeForm" :rules="rules" label-width="80px">
        <el-form-item label="起飞时间" prop="startTime">
          <el-date-picker clearable
            v-model="arrangeForm.startTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择起飞时间">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="降落时间" prop="endTime">
          <el-date-picker clearable
            v-model="arrangeForm.endTime"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            placeholder="请选择降落时间">
          </el-date-picker>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitArrange">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>



  </div>
</template>

<script>
import { listPayment, getPayment, delPayment, addPayment, updatePayment, arrangePayment } from "@/api/ticket/payment";

export default {
  name: "Payment",
  dicts: ['plan_type', 'ticket_type'],
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // 选中名称
      names: [],
      // 非单个禁用
      single: true,
      // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 制定航班表格数据
      paymentList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 是否显示安排航班对话框
      arrange: false,
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
      },
      // 表单参数
      form: {},
      // 安排航班表单
      arrangeForm: {},
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
        commonPrice: [
          { required: true, message: "经济舱票价不能为空", trigger: "blur" }
        ],
        higherPrice: [
          { required: true, message: "头等舱票价不能为空", trigger: "blur" }
        ],
        commonNum: [
          { required: true, message: "经济舱总票数不能为空", trigger: "blur" }
        ],
        higherNum: [
          { required: true, message: "头等舱总票数不能为空", trigger: "blur" }
        ],
        commonSurplus: [
          { required: true, message: "经济舱剩余票数不能为空", trigger: "blur" }
        ],
        higherSurplus: [
          { required: true, message: "头等舱剩余票数不能为空", trigger: "blur" }
        ],
      }
    };
  },
  created() {
    this.getList();
  },
  methods: {
    /** 查询制定航班列表 */
    getList() {
      this.loading = true;
      listPayment(this.queryParams).then(response => {
        this.paymentList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.arrange = false;
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
        commonSurplus: null,
        higherSurplus: null,
        del: null,
        createBy: null,
        createTime: null,
        updateBy: null,
        updateTime: null,
        remark: null
      };
      this.resetForm("form");
      this.arrangeForm = {
        id: null,
        ids: null,
        startTime: null,
        endTime: null,
      },
      this.resetForm("arrangeForm");
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
      this.names = selection.map(item => item.name)
      this.single = selection.length!==1
      this.multiple = !selection.length
    },
    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.title = "添加制定航班";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id || this.ids
      getPayment(id).then(response => {
        this.form = response.data;
        this.open = true;
        this.title = "修改制定航班";
      });
    },
    /** 安排航班按钮 */
    handleArrange(row){
      this.reset();
      this.arrangeForm.id = row.id
      this.arrangeForm.ids = this.ids
      const names = row.name || this.names
      this.arrange = true;
      this.title = "安排航班["+names+"]";
    },
    /** 安排航班提交按钮 */
    submitArrange(){
      // alert(this.arrangeForm.id+"   "+this.arrangeForm.ids+"   "+this.arrangeForm.startTime+"  "+this.arrangeForm.endTime)
      this.$refs["arrangeForm"].validate(valid => {
          if (valid) {
            arrangePayment(this.arrangeForm).then(response => {
              this.$modal.msgSuccess("安排航班成功");
              this.arrange = false;
              this.getList();
            })
          }
      });
    },
    /** 提交按钮 */
    submitForm() {
      this.$refs["form"].validate(valid => {
        if (valid) {
          if (this.form.id != null) {
            updatePayment(this.form).then(response => {
              this.$modal.msgSuccess("修改成功");
              this.open = false;
              this.getList();
            });
          } else {
            addPayment(this.form).then(response => {
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
      this.$modal.confirm('是否确认删除制定航班编号为"' + ids + '"的数据项？').then(function() {
        return delPayment(ids);
      }).then(() => {
        this.getList();
        this.$modal.msgSuccess("删除成功");
      }).catch(() => {});
    },
    /** 导出按钮操作 */
    handleExport() {
      this.download('ticket/payment/export', {
        ...this.queryParams
      }, `payment_${new Date().getTime()}.xlsx`)
    }
  }
};
</script>
