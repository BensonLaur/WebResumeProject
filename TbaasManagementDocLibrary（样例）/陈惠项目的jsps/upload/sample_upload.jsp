<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	md.ns("sampleData");
	$(function() {
		sampleData.editRow = undefined;
		sampleData.dataTable = $('#sampleData')
				.datagrid(
						{
							data : '',
							fit : true,
							border : false,
							fitColumns: false,
							idField : 'sampleAlias',
							columns : [ [
									{
										field : 'checkbox',
										checkbox : true
									},
									{
										title : '采样时间',
										field : 'sampleDate',
										sortable : true,
										width : 80,
										editor : {
											type : 'datebox',
											options : {
												required : true,
											}
										}
									},
									{
										title : '采样省份',
										field : 'sampleProvince',
										sortable : true,
										width : 60,
										editor : {
											type : 'combobox',
											options : {
												required : true,
												mode : 'remote',
												cache : false,
												editable : false,
												textField : 'label',
												valueField : 'label',
												url : '../suggestAction!getProvince.action'

											}
										}
									},
									{
										title : '采样地名称',
										field : 'farmName',
										width : 150,
										sortable : true,
										editor : {
											type : 'text',
											options : {
											/*    required: true,
											    mode: 'remote',
											    cache: false,
											    panelHeight: 'auto',
											    textField: 'farmName',
											    valueField: 'farmName',
											    url: '../suggestAction!getFarmName.action'
											 */
											}
										}
									},
									{
										title : '养殖场名称',
										field : 'sampleFarmAddr',
										width : 150,
										editor : {
											type : 'text',
											options : {}
										}
									},
									{
										title : '动物',
										field : 'animal',
										sortable : true,
										width : 80,
										editor : {
											type : 'combobox',
											options : {
												required : true,
												mode : 'remote',
												panelHeight : 'auto',
												textField : 'animalName',
												valueField : 'animalName',
												url : '../suggestAction!getAnimal.action'
											}
										}
									},
									{
										title : '日龄',
										field : 'sampleAnimalAge',
										width : 50,
										editor : {
											type : 'text',
											options : {}
										}
									},
									{
										title : '来源',
										field : 'sampleSource',
										width : 70,
										sortable : true,
										editor : {
											type : 'combobox',
											options : {
												required : true,
												mode : 'remote',
												textField : 'sourceName',
												valueField : 'sourceName',
												url : '../suggestAction!getSource.action'
											}
										}
									},
									{
										title : '部位',
										field : 'collectionpart',
										width : 50,
										sortable : true,
										editor : {
											type : 'text',
											options : {
											// required: true,
											// mode: 'remote',
											// panelHeight: 'auto',
											// textField: 'partName',
											// valueField: 'partName',
											// url: '../suggestAction!getCollectionpart.action'
											}
										}
									},
									{
										title : '采样人员',
										field : 'sampleCollector',
										width : 150,
										editor : {
											type : 'text',
											options : {

											}
										}
									},
									{
										title : '物用药史',
										field : 'sampleMedicalHistory',
										width : 80,
										editor : {
											type : 'validatebox',
											options : {}
										}
									},
									{
										title : '备注',
										field : 'sampleRemarks',
										width : 100,
										editor : {
											type : 'text',
											options : {
												required : true,
											}
										}
									},							
									{
										title : '失败原因',
										field : 'errorMsg',
										width : 100,
										editor : {
											type : 'text',
											options : {}
										}
									} ] ],
							toolbar : [
									{
										text : '删除',
										iconCls : 'icon-remove',
										handler : function() {
											var rows = sampleData.dataTable
													.datagrid('getSelections');
											if (rows.length > 0) {
												for ( var i = 0; i < rows.length; i++) {
													var ind = sampleData.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[i]);
													console.info(ind);
													sampleData.dataTable
															.datagrid(
																	'deleteRow',
																	ind);
												}
												sampleData.dataTable
														.datagrid('unselectAll');
											}
										}
									},
									{
										text : '修改',
										iconCls : 'icon-edit',
										handler : function() {
											var rows = sampleData.dataTable
													.datagrid('getSelections');
											if (rows.length == 1) {
												if (sampleData.editRow != undefined) {
													sampleData.dataTable
															.datagrid(
																	'endEdit',
																	sampleData.editRow);
												}
												if (sampleData.editRow == undefined) {
													var index = sampleData.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[0]);
													sampleData.dataTable
															.datagrid(
																	'beginEdit',
																	index);
													sampleData.editRow = index;
													sampleData.dataTable
															.datagrid('unselectAll');
												}
											}
										}
									},
									{
										text : '保存',
										iconCls : 'icon-save',
										handler : function() {
											sampleData.dataTable.datagrid('endEdit', sampleData.editRow);
										}
									}, 	
									{
										text : '关闭导入界面',
										iconCls : 'icon-no',
										handler : function() {
											$('#md_sample_exp').dialog('close');
										}
									} ],
							onAfterEdit : function(rowIndex, rowData, changes) {
								var updated = sampleData.dataTable.datagrid(
										'getChanges', 'updated');
								var url = '';
								if (updated.length > 0) {									
									url = '${pageContext.request.contextPath}/sampleAction!add.action';
								}
								if (updated.length < 1) {
									sampleData.editRow = undefined;
									sampleData.dataTable
											.datagrid('unselectAll');
									return;
								}
								$.ajax({
									url : url,
									data : rowData,
									dataType : 'json',
									success : function(r) {
										if (r && r.success) {
											sampleData.dataTable.datagrid(
													'deleteRow',
													sampleData.editRow);
											$.messager.show({
												msg : r.msg,
												title : 'success'
											});
											sampleData.editRow = undefined;
											sampleData.dataTable
													.datagrid('unselectAll');
										} else {
											sampleData.dataTable.datagrid(
													'beginEdit', rowIndex);
											sampleData.editRow = rowIndex;
											$.messager.alert('错误', r.msg,
													'error');

										}

									}
								});
							}
						});
		
		sampleData.exp = function() {
			$.ajaxFileUpload({
				url : '/new_drug/uploadAction!SampleUpload.action',
				secureuri : false,
				fileElementId : 'sampleFile',
				dataType : 'json',
				success : function(data, status) {
					$.messager.alert('提示', data.msg, 'warning');
					console.info("---------------");
					sampleData.dataTable.datagrid('loadData', data.obj);
				},
				error : function(data, status, e) {
				}
			});
		};
	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false">
		<table id="sampleData">
		</table>
	</div>
	<div data-options="region:'north',border:false"
		style="height:110px;background:#F4F4F4; overflow:hidden;padding-left:15px">
		<h4>请选择excel文件</h4>
		<p>
			<label> <input name="type" type="hidden" value="farm" /> </label>
		</p>
		<p>
			<label> <input name="excel" type="file" id="sampleFile"
				onchange="checkFileType(this)" /> </label>
		</p>
		<p>
			<a id="btn" href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'" onclick="sampleData.exp();">
				上传 </a> <a class="easyui-linkbutton" href="/new_drug/excelModel/sample.xls">
				下载导入模板 </a>
		</p>
	</div>
</div>