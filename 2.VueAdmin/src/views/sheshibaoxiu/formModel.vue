<template>
	<div>
		<el-dialog v-model="formVisible" :title="formTitle" width="80%" destroy-on-close :fullscreen='false'>
			<el-form class="formModel_form" ref="formRef" :model="form" label-width="$template2.back.add.form.base.labelWidth" :rules="rules">
				<el-row>
					<el-col :span="24">
						<el-form-item label="设施编号" prop="sheshibianhao">
							<el-input class="list_inp" v-model="form.sheshibianhao" placeholder="设施编号"
								 type="text" 								:readonly="!isAdd||disabledForm.sheshibianhao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="设施名称" prop="sheshimingcheng">
							<el-input class="list_inp" v-model="form.sheshimingcheng" placeholder="设施名称"
								 type="text" 								:readonly="!isAdd||disabledForm.sheshimingcheng?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item prop="sheshitupian"
									  label="设施图片"
						>
							<uploads
								:disabled="!isAdd||disabledForm.sheshitupian?true:false"
								action="file/upload"

								tip="请上传设施图片"
								:limit="3"
								style="width: 100%;text-align: left;"
								:fileUrls="form.sheshitupian?form.sheshitupian:''" 
								@change="sheshitupianUploadSuccess">
							</uploads>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="所在地点" prop="suozaididian">
							<el-input class="list_inp" v-model="form.suozaididian" placeholder="所在地点"
								 type="text" 								:readonly="!isAdd||disabledForm.suozaididian?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="用户账号" prop="yonghuzhanghao">
							<el-input class="list_inp" v-model="form.yonghuzhanghao" placeholder="用户账号"
								 type="text" 								:readonly="!isAdd||disabledForm.yonghuzhanghao?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="用户姓名" prop="yonghuxingming">
							<el-input class="list_inp" v-model="form.yonghuxingming" placeholder="用户姓名"
								 type="text" 								:readonly="!isAdd||disabledForm.yonghuxingming?true:false" />
						</el-form-item>
					</el-col>

					<el-col :span="24">
						<el-form-item label="申报时间" prop="shenbaoshijian">
							<el-date-picker
								class="list_date"
								v-model="form.shenbaoshijian"
								format="YYYY-MM-DD HH:mm:ss"
								value-format="YYYY-MM-DD HH:mm:ss"
								type="datetime"
								:readonly="!isAdd||disabledForm.shenbaoshijian?true:false"
								placeholder="请选择申报时间" />
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="报修状态" prop="baoxiuzhuangtai">
							<el-select
								class="list_sel"
								:disabled="!isAdd||disabledForm.baoxiuzhuangtai?true:false"
								v-model="form.baoxiuzhuangtai" 
								placeholder="请选择报修状态"
								>
								<el-option v-for="(item,index) in baoxiuzhuangtaiLists" :label="item"
									:value="item"
									>
								</el-option>
							</el-select>
						</el-form-item>
					</el-col>
					<el-col :span="24">
						<el-form-item label="故障描述" prop="guzhangmiaoshu">
							<el-input v-model="form.guzhangmiaoshu" placeholder="故障描述" type="textarea"
							:readonly="!isAdd||disabledForm.guzhangmiaoshu?true:false"
							/>
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
	const tableName = 'sheshibaoxiu'
	const formName = '设施报修'
	//基础信息
	//form表单
	const form = ref({})
	const disabledForm = ref({
		sheshibianhao : false,
		sheshimingcheng : false,
		sheshitupian : false,
		suozaididian : false,
		guzhangmiaoshu : false,
		yonghuzhanghao : false,
		yonghuxingming : false,
		shenbaoshijian : false,
		baoxiuzhuangtai : false,
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
		sheshibianhao: [
		],
		sheshimingcheng: [
		],
		sheshitupian: [
		],
		suozaididian: [
		],
		guzhangmiaoshu: [
		],
		yonghuzhanghao: [
		],
		yonghuxingming: [
		],
		shenbaoshijian: [
		],
		baoxiuzhuangtai: [
		],
	})
	//表单验证
	
	const formRef = ref(null)
	const id = ref(0)
	const type = ref('')
	//设施图片上传回调
	const sheshitupianUploadSuccess=(e)=>{
		form.value.sheshitupian = e
	}
	//报修状态列表
	const baoxiuzhuangtaiLists = ref([])
	//methods

	//获取唯一标识
	const getUUID =()=> {
      return new Date().getTime();
    }
	//重置
	const resetForm = () => {
		form.value = {
			sheshibianhao: '',
			sheshimingcheng: '',
			sheshitupian: '',
			suozaididian: '',
			guzhangmiaoshu: '',
			yonghuzhanghao: '',
			yonghuxingming: '',
			shenbaoshijian: '',
			baoxiuzhuangtai: '报修中',
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
			form.value.shenbaoshijian = context?.$toolUtil.getCurDateTime()
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
				if(x=='sheshibianhao'){
					form.value.sheshibianhao = row[x];
					disabledForm.value.sheshibianhao = true;
					continue;
				}
				if(x=='sheshimingcheng'){
					form.value.sheshimingcheng = row[x];
					disabledForm.value.sheshimingcheng = true;
					continue;
				}
				if(x=='sheshitupian'){
					form.value.sheshitupian = row[x];
					disabledForm.value.sheshitupian = true;
					continue;
				}
				if(x=='suozaididian'){
					form.value.suozaididian = row[x];
					disabledForm.value.suozaididian = true;
					continue;
				}
				if(x=='guzhangmiaoshu'){
					form.value.guzhangmiaoshu = row[x];
					disabledForm.value.guzhangmiaoshu = true;
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
				if(x=='shenbaoshijian'){
					form.value.shenbaoshijian = row[x];
					disabledForm.value.shenbaoshijian = true;
					continue;
				}
				if(x=='baoxiuzhuangtai'){
					form.value.baoxiuzhuangtai = row[x];
					disabledForm.value.baoxiuzhuangtai = true;
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
			form.value.baoxiuzhuangtai='报修中'
			formVisible.value = true
		}

		context?.$http({
			url: `${context?.$toolUtil.storageGet('sessionTable')}/session`,
			method: 'get'
		}).then(res => {
			var json = res.data.data
			if(json.hasOwnProperty('yonghuzhanghao')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.yonghuzhanghao = json.yonghuzhanghao
				disabledForm.value.yonghuzhanghao = true;
			}
			if(json.hasOwnProperty('yonghuxingming')&& context?.$toolUtil.storageGet("role")!="管理员"){
				form.value.yonghuxingming = json.yonghuxingming
				disabledForm.value.yonghuxingming = true;
			}
		})
		baoxiuzhuangtaiLists.value = "已处理,报修中".split(',')
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
	//富文本
	const editorChange = (e,name) =>{
		form.value[name] = e
	}
	//提交
	const save=()=>{
		if(form.value.sheshitupian!=null) {
			form.value.sheshitupian = form.value.sheshitupian.replace(new RegExp(context?.$config.url,"g"),"");
		}
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
				// 长文本
				.el-textarea__inner {
					border: 1px solid #ddd;
					padding: 12px;
					outline: none;
					color: #333;
					width: auto;
					font-size: 14px;
					min-height: 120px;
					outline-offset: 4px;
					min-width: 550px;
				}
				//图片上传样式
				.el-upload-list  {
					//提示语
					.el-upload__tip {
						margin: 7px 0 0;
						color: #999;
						display: flex;
						font-size: 14px;
						justify-content: flex-start;
						align-items: center;
					}
					//外部盒子
					.el-upload--picture-card {
						border: 1px solid #ddd;
						cursor: pointer;
						background-color: #fff;
						border-radius: 4px;
						width: 80px;
						line-height: 80px;
						text-align: center;
						height: 80px;
						//图标
						.el-icon{
							color: #999;
							font-size: 32px;
							line-height: 80px;
						}
					}
					.el-upload-list__item {
						border: 1px solid #ddd;
						cursor: pointer;
						background-color: #fff;
						border-radius: 4px;
						width: 80px;
						line-height: 80px;
						text-align: center;
						height: 80px;
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