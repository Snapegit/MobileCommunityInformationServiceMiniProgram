<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="24">
						<el-form-item label="订单号" prop="dingdanhao">
							<el-input class="list_inp" v-model="form.dingdanhao" :readonly="true" placeholder="订单号" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="用户账号" prop="yonghuzhanghao">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.yonghuzhanghao?true:false"
								v-model="form.yonghuzhanghao" 
								placeholder="请选择用户账号"
								@change="yonghuzhanghaoChange">
								<el-option v-for="(item,index) in yonghuzhanghaoLists" :label="item" :value="item">
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="用户姓名" prop="yonghuxingming">
							<el-input class="list_inp" v-model="form.yonghuxingming" placeholder="用户姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.yonghuxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="家庭住址" prop="jiatingzhuzhi">
							<el-input class="list_inp" v-model="form.jiatingzhuzhi" placeholder="家庭住址"
								 type="text" 								:readonly="!isAdd||disabledForm.jiatingzhuzhi?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="用电量（度）" prop="yongdianliang">
							<el-input class="list_inp" v-model.number="form.yongdianliang" placeholder="用电量（度）"
								 type="number" 								:readonly="!isAdd||disabledForm.yongdianliang?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="电费单价" prop="dianfeidanjia">
							<el-input class="list_inp" v-model.number="form.dianfeidanjia" placeholder="电费单价"
								 type="number" 								:readonly="!isAdd||disabledForm.dianfeidanjia?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="用水量(m³)" prop="yongshuiliang">
							<el-input class="list_inp" v-model.number="form.yongshuiliang" placeholder="用水量(m³)"
								 type="number" 								:readonly="!isAdd||disabledForm.yongshuiliang?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="水费单价" prop="shuifeidanjia">
							<el-input class="list_inp" v-model.number="form.shuifeidanjia" placeholder="水费单价"
								 type="number" 								:readonly="!isAdd||disabledForm.shuifeidanjia?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="应收水电费" prop="yingshoushuidianfei">
							<el-input class="list_inp" v-model="yingshoushuidianfei" :readonly="true" placeholder="应收水电费" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="计费日期" prop="jifeiriqi">
							<el-date-picker
								class="list_date"
								v-model="form.jifeiriqi"
								format="YYYY 年 MM 月 DD 日"
								value-format="YYYY-MM-DD"
								type="datetime"
								:readonly="!isAdd||disabledForm.jifeiriqi?true:false"
								placeholder="请选择计费日期" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="截止日期" prop="jiezhiriqi">
							<el-date-picker
								class="list_date"
								v-model="form.jiezhiriqi"
								format="YYYY 年 MM 月 DD 日"
								value-format="YYYY-MM-DD"
								type="datetime"
								:readonly="!isAdd||disabledForm.jiezhiriqi?true:false"
								placeholder="请选择截止日期" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="缴费日期" prop="jiaofeiriqi">
							<el-date-picker
								class="list_date"
								v-model="form.jiaofeiriqi"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.jiaofeiriqi?true:false"
								placeholder="请选择缴费日期" />
						</el-form-item>
					</el-col>
				</el-row>
			</el-form>
			<template #footer v-if="isAdd||type=='logistics'||type=='reply'">
				<span class="formModel_btn_box">
					<el-button class="formModel_cancel" @click="closeClick">取消</el-button>
					<el-button class="formModel_confirm" type="primary" @click="save"
						>
						提交
					</el-button>
				</span>
			</template>
		</el-dialog>
	</div>
</template>
<script setup>
	import {
		reactive,
		ref,
		getCurrentInstance,
		nextTick,
		computed,
		defineEmits
	} from 'vue'
	const context = getCurrentInstance()?.appContext.config.globalProperties;	
	const emit = defineEmits(['formModelChange'])
	//基础信息
	const tableName = 'shuidianfeixinxi'
	const formName = '水电费信息'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		dingdanhao : false,
		yonghuzhanghao : false,
		yonghuxingming : false,
		jiatingzhuzhi : false,
		yongdianliang : false,
		dianfeidanjia : false,
		yongshuiliang : false,
		shuifeidanjia : false,
		yingshoushuidianfei : false,
		jifeiriqi : false,
		jiezhiriqi : false,
		ispay : false,
		jiaofeiriqi : false,
	})
	const formVisible = ref(false)
	const isAdd = ref(false)
	const formTitle = ref('')
	//表单验证
	//匹配整数
	const validateIntNumber = (rule, value, callback) => {
		if (!value) {
			callback();
		} else if (!context?.$toolUtil.isIntNumer(value)) {
			callback(new Error("请输入整数"));
		} else {
			callback();
		}
	}
	//匹配数字
	const validateNumber = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isNumber(value)) {
			callback(new Error("请输入数字"));
		} else {
			callback();
		}
	}
	//匹配手机号码
	const validateMobile = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isMobile(value)) {
			callback(new Error("请输入正确的手机号码"));
		} else {
			callback();
		}
	}
	//匹配电话号码
	const validatePhone = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isPhone(value)) {
			callback(new Error("请输入正确的电话号码"));
		} else {
			callback();
		}
	}
	//匹配邮箱
	const validateEmail = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isEmail(value)) {
			callback(new Error("请输入正确的邮箱地址"));
		} else {
			callback();
		}
	}
	//匹配身份证
	const validateIdCard = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.checkIdCard(value)) {
			callback(new Error("请输入正确的身份证号码"));
		} else {
			callback();
		}
	}
	//匹配网站地址
	const validateUrl = (rule, value, callback) => {
		if(!value){
			callback();
		} else if (!context?.$toolUtil.isURL(value)) {
			callback(new Error("请输入正确的URL地址"));
		} else {
			callback();
		}
	}
	const rules = ref({
		dingdanhao: [
		],
		yonghuzhanghao: [
		],
		yonghuxingming: [
		],
		jiatingzhuzhi: [
		],
		yongdianliang: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		dianfeidanjia: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		yongshuiliang: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		shuifeidanjia: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		yingshoushuidianfei: [
			{ validator: validateNumber, trigger: 'blur' },
		],
		jifeiriqi: [
		],
		jiezhiriqi: [
		],
		ispay: [
		],
		jiaofeiriqi: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//用户账号列表
	const yonghuzhanghaoLists = ref([])
	const yingshoushuidianfei =computed(()=>{
		let c = form.value
		let a = c.yongdianliang*c.dianfeidanjia+c.yongshuiliang*c.shuifeidanjia
		form.value.yingshoushuidianfei = a?a.toFixed(2) : 0
		return a?a.toFixed(2) : 0
	})
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			dingdanhao: getUUID(),
			yonghuzhanghao: '',
			yonghuxingming: '',
			jiatingzhuzhi: '',
			yongdianliang: '',
			dianfeidanjia: '',
			yongshuiliang: '',
			shuifeidanjia: '',
			yingshoushuidianfei: '',
			jifeiriqi: '',
			jiezhiriqi: '',
			ispay: '未支付',
			jiaofeiriqi: '',
		}
	}
	//获取info
	const getInfo = ()=>{
		context?.$http({
			url: `${tableName}/info/${id.value}`,
			method: 'get'
		}).then(res => {
			let reg=new RegExp('../../../file','g')
			form.value = res.data.data
			formVisible.value = true
		})
	}
	const crossRow = ref('')
	const crossTable = ref('')
	const crossTips = ref('')
	const crossColumnName = ref('')
	const crossColumnValue = ref('')
	//初始化
	const init=(formId=null,formType='add',formNames='',row=null,table=null,statusColumnName=null,tips=null,statusColumnValue=null)=>{
		resetForm()
			form.value.jiaofeiriqi = context?.$toolUtil.getCurDateTime()
		if(formId){
			id.value = formId
			type.value = formType
		}
		if(formType == 'add'){
			isAdd.value = true
			formTitle.value = '新增' + formName
			formVisible.value = true
		}else if(formType == 'info'){
			isAdd.value = false
			formTitle.value = '查看' + formName
			getInfo()
		}else if(formType == 'edit'){
			isAdd.value = true
			formTitle.value = '修改' + formName
			getInfo()
		}
		else if(formType == 'cross'){
			isAdd.value = true
			formTitle.value = formNames
			// getInfo()
			for(let x in row){
				if(x=='dingdanhao'){
					form.value.dingdanhao = row[x];
					disabledForm.value.dingdanhao = true;
					continue;
				}
				if(x=='yonghuzhanghao'){
					form.value.yonghuzhanghao = row[x];
					disabledForm.value.yonghuzhanghao = true;
					continue;
				}
				if(x=='yonghuxingming'){
					form.value.yonghuxingming = row[x];
					disabledForm.value.yonghuxingming = true;
					continue;
				}
				if(x=='jiatingzhuzhi'){
					form.value.jiatingzhuzhi = row[x];
					disabledForm.value.jiatingzhuzhi = true;
					continue;
				}
				if(x=='yongdianliang'){
					form.value.yongdianliang = row[x];
					disabledForm.value.yongdianliang = true;
					continue;
				}
				if(x=='dianfeidanjia'){
					form.value.dianfeidanjia = row[x];
					disabledForm.value.dianfeidanjia = true;
					continue;
				}
				if(x=='yongshuiliang'){
					form.value.yongshuiliang = row[x];
					disabledForm.value.yongshuiliang = true;
					continue;
				}
				if(x=='shuifeidanjia'){
					form.value.shuifeidanjia = row[x];
					disabledForm.value.shuifeidanjia = true;
					continue;
				}
				if(x=='yingshoushuidianfei'){
					form.value.yingshoushuidianfei = row[x];
					disabledForm.value.yingshoushuidianfei = true;
					continue;
				}
				if(x=='jifeiriqi'){
					form.value.jifeiriqi = row[x];
					disabledForm.value.jifeiriqi = true;
					continue;
				}
				if(x=='jiezhiriqi'){
					form.value.jiezhiriqi = row[x];
					disabledForm.value.jiezhiriqi = true;
					continue;
				}
				if(x=='jiaofeiriqi'){
					form.value.jiaofeiriqi = row[x];
					disabledForm.value.jiaofeiriqi = true;
					continue;
				}
			}
			if(row){
				crossRow.value = row
			}
			if(table){
				crossTable.value = table
			}
			if(tips){
				crossTips.value = tips
			}
			if(statusColumnName){
				crossColumnName.value = statusColumnName
			}
			if(statusColumnValue){
				crossColumnValue.value = statusColumnValue
			}
			form.value.ispay='未支付'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
		})
		context?.$http({
			url: `option/yonghu/yonghuzhanghao`,
			method: 'get'
		}).then(res=>{
			yonghuzhanghaoLists.value = res.data.data
		})
		//由上级字段带出不可改
		disabledForm.value.yonghuxingming = true;
		//由上级字段带出不可改
		disabledForm.value.jiatingzhuzhi = true;
	}
	//初始化
	//声明父级调用
	defineExpose({
		init
	})
	//关闭
	const closeClick = () => {
		formVisible.value = false
	}
	const yonghuzhanghaoChange=()=>{
		context?.$http({
			url: `follow/yonghu/yonghuzhanghao?columnValue=` + form.value.yonghuzhanghao,
			method: 'get'
		}).then(res=>{
			if(res.data.data.yonghuxingming){
				form.value.yonghuxingming = res.data.data.yonghuxingming
			}
			if(res.data.data.jiatingzhuzhi){
				form.value.jiatingzhuzhi = res.data.data.jiatingzhuzhi
			}
		})
	}
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		var table = crossTable.value
		var objcross = JSON.parse(JSON.stringify(crossRow.value))
		let crossUserId = ''
		let crossRefId = ''
		let crossOptNum = ''
		if(type.value == 'cross'){
			if(crossColumnName.value!=''){
				if(!crossColumnName.value.startsWith('[')){
					for(let o in objcross){
						if(o == crossColumnName.value){
							objcross[o] = crossColumnValue.value
						}
					}
					//修改跨表数据
					changeCrossData(objcross)
				}else{
					crossUserId = context?.$toolUtil.storageGet('userid')
					crossRefId = objcross['id']
					crossOptNum = crossColumnName.value.replace(/\[/,"").replace(/\]/,"")
				}
			}
		}
		formRef.value.validate((valid)=>{
			if(valid){
				if(crossUserId&&crossRefId){
					form.value.crossuserid = crossUserId
					form.value.crossrefid = crossRefId
					let params = {
						page: 1,
						limit: 1000, 
						crossuserid:form.value.crossuserid,
						crossrefid:form.value.crossrefid,
					}
					context?.$http({
						url: `${tableName}/page`,
						method: 'get', 
						params: params 
					}).then(res=>{
						if(res.data.data.total>=crossOptNum){
							context?.$toolUtil.message(`${crossTips.value}`,'error')
							return false
						}else{
							context?.$http({
								url: `${tableName}/${!form.value.id ? "save" : "update"}`,
								method: 'post', 
								data: form.value 
							}).then(res=>{
								context?.$toolUtil.message(`操作成功`,'success',()=>{
									formVisible.value = false
									emit('formModelChange')
								})
							})
						}
					})
				}else{
					context?.$http({
						url: `${tableName}/${!form.value.id ? "save" : "update"}`,
						method: 'post', 
						data: form.value 
					}).then(res=>{
						context?.$toolUtil.message(`操作成功`,'success',()=>{
							formVisible.value = false
							emit('formModelChange')
						})
					})
				}
			}
		})
	}
	//修改跨表数据
	const changeCrossData=(row)=>{
		context?.$http({
			url: `${crossTable.value}/update`,
			method: 'post',
			data: row
		}).then(res=>{})
	}
</script>
<style lang="scss" scoped>
	// 表单
	.formModel_form{
		border: 1px solid #ddd;
		border-radius: 4px;
		padding: 30px;
		margin: 0;
		background: #fff;
		// form item
		:deep(.el-form-item) {
			margin: 0 0 20px 0;
			display: flex;
			//label
			.el-form-item__label {
			 background: none;
			 display: block;
			 width: 150px;
			 min-width: 150px;
			 text-align: right;
			}
			// 内容盒子
			.el-form-item__content {
				display: flex;
				width: calc(100% - 120px);
				justify-content: flex-start;
				align-items: center;
				flex-wrap: wrap;
				// 输入框
				.list_inp {
					border: 1px solid #ddd;
					border-radius: 4px;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					height: 36px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
						padding: 0;
					}
					.is-focus {
						box-shadow: none !important;
					}
				}
				//日期选择器
				.list_date {
					border: 1px solid #ddd;
					border-radius: 4px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					//去掉默认样式
					.el-input__wrapper{
						border: none;
						box-shadow: none;
						background: none;
						border-radius: 0;
						height: 100%;
					}
				}
				// 下拉框
				.list_sel {
					border: 1px solid #ddd;
					border-radius: 4px;
					padding: 0 10px;
					width: auto;
					line-height: 36px;
					box-sizing: border-box;
					min-width: 350px;
					//去掉默认样式
					.select-trigger{
						height: 100%;
						.el-input{
							height: 100%;
							.el-input__wrapper{
								border: none;
								box-shadow: none;
								background: none;
								border-radius: 0;
								height: 100%;
								padding: 0;
							}
							.is-focus {
								box-shadow: none !important;
							}
						}
					}
				}
			}
		}
	}
	// 按钮盒子
	.formModel_btn_box {
		display: flex;
		width: 100%;
		justify-content: center;
		align-items: center;
		.formModel_cancel {
			border: 0;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #313131;
			background: #EED7B3;
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_cancel:hover {
			color: #fff;
			background: #D09D7D;
		}
		
		.formModel_confirm {
			border: 0;
			cursor: pointer;
			border-radius: 4px;
			padding: 0 24px;
			margin: 0 20px 0 0;
			outline: none;
			color: #313131;
			background: #EED7B3;
			width: auto;
			font-size: 14px;
			min-width: 100px;
			height: 36px;
		}
		.formModel_confirm:hover {
			color: #fff;
			background: #D09D7D;
		}
	}
</style>