<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	md.ns("farmData");
	$(function() {
		farmData.editRow = undefined;
		farmData.dataTable = $('#farmdata')
				.datagrid(
						{
							data : '',
							fit : true,
							border : false,
							fitColumns : true,
							pageSize : 100,
							idField : 'farmName',
							columns : [ [
									{
										field : 'checkbox',
										checkbox : true
									},
									{
										title : '采样地名称',
										field : 'farmName',
										width : 100,
										sortable : true,
										editor : {
											type : 'validatebox',
											options : {
												required : true

											}
										}
									},
									{
										title : '详细地址',
										field : 'farmAddress',
										width : 100,

										editor : {
											type : 'validatebox',
											options : {}
										}
									},
									{
										title : '联系人',
										field : 'farmLinkman',
										width : 80,
										editor : {
											type : 'validatebox',
											options : {}
										}
									},
									{
										title : '联系电话',
										field : 'farmPhone',
										width : 80,
										editor : {
											type : 'validatebox',
											options : {}
										}
									},
									{
										title : '饲养方式',
										field : 'farmRaiseWay',
										width : 100,
										editor : {
											type : 'validatebox',
											options : {}
										}
									},
									{
										title : '养殖规模',
										field : 'farmRaiseScope',
										width : 100,
										editor : {
											type : 'validatebox',
											options : {}
										}
									},
									{
										title : '养殖模式',
										field : 'farmRaiseType',
										width : 100,
										editor : {
											type : 'combobox',
											options : {
												valueField : 'label',
												textField : 'value',
												data : [ {
													label : '农户',
													value : '农户'
												}, {
													label : '公司',
													value : '公司'
												}, {
													label : '公司+农户',
													value : '公司+农户'
												} ]
											}
										}
									},
									{
										title : '建厂时间',
										field : 'farmBuildDate',
										width : 100,
										editor : {
											type : 'datebox',
											options : {
												editable : false
											}
										}
									},
									{
										title : '备注',
										field : 'farmRemarks',
										width : 100,
										editor : {
											type : 'text',
											options : {}
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
									}] ],
							toolbar : [
									{
										text : '删除',
										iconCls : 'icon-remove',
										handler : function() {
											var rows = farmData.dataTable
													.datagrid('getSelections');
											if (rows.length > 0) {
												for ( var i = 0; i < rows.length; i++) {
													var ind = farmData.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[i]);
													console.info(ind);
													farmData.dataTable
															.datagrid(
																	'deleteRow',
																	ind);
												}
												farmData.dataTable
														.datagrid('unselectAll');
											}
										}
									},
									{
										text : '修改',
										iconCls : 'icon-edit',
										handler : function() {
											var rows = farmData.dataTable
													.datagrid('getSelections');
											if (rows.length == 1) {
												if (farmData.editRow != undefined) {
													farmData.dataTable
															.datagrid(
																	'endEdit',
																	farmData.editRow);
												}
												if (farmData.editRow == undefined) {
													var index = farmData.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[0]);
													farmData.dataTable
															.datagrid(
																	'beginEdit',
																	index);
													farmData.editRow = index;
													farmData.dataTable
															.datagrid('unselectAll');
												}
											}
										}
									},
									{
										text : '保存',
										iconCls : 'icon-save',
										handler : function() {
											farmData.dataTable.datagrid('endEdit', farmData.editRow);
										}
									}, 																	
									{
										text : '关闭导入界面',
										iconCls : 'icon-no',
										handler : function() {
											$('#md_farm_exp').dialog('close');
										}
									} ],
							onAfterEdit : function(rowIndex, rowData, changes) {
								var updated = farmData.dataTable.datagrid(
										'getChanges', 'updated');
								var url = '';
								if (updated.length > 0) {									
									url = '${pageContext.request.contextPath}/farmAction!add.action';
								}
								if (updated.length < 1) {
									farmData.editRow = undefined;
									farmData.dataTable.datagrid('unselectAll');
									return;
								}
								$.ajax({
									url : url,
									data : rowData,
									dataType : 'json',
									method : 'post',
									success : function(r) {
										if (r && r.success) {
											farmData.dataTable.datagrid(
													'deleteRow',
													farmData.editRow);
											$.messager.show({
												msg : r.msg,
												title : 'success'
											});
										} else {
											farmData.dataTable
													.datagrid('rejectChanges');
											$.messager.alert('error', r.msg,
													'error');

										}
										farmData.editRow = undefined;
										farmData.dataTable
												.datagrid('unselectAll');
									}
								});
							}
						});
		
		farmData.exp = function() {
			$.ajaxFileUpload({
				url : '/new_drug/uploadAction!FarmUpload.action',
				secureuri : false,
				fileElementId : 'farmFile',
				dataType : 'json',
				success : function(data, status) {
					$.messager.alert('提示', data.msg, 'warning');
					console.info(data.obj);
					farmData.dataTable.datagrid('loadData', data.obj);

				},
				error : function(data, status, e) {

				}
			});
		};

	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false" >
		<table id="farmdata">
		</table>
	</div>
	<div data-options="region:'north',border:false"
		style="height:110px;background: #F4F4F4;overflow:hidden;padding-left:15px">
		<h4>请选择excel文件</h4>	
		<p>
			<label> <input name="type" type="hidden" value="farm" /> </label>
		</p>
		<p>
			<label> <input name="excel" type="file" id="farmFile"
				onchange="checkFileType(this)" /> </label>
		</p>
		<p>
			<a id="btn" href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'" onclick="farmData.exp();"> 上传
			</a> <a class="easyui-linkbutton" href="/new_drug/excelModel/farm.xls">下载导入模板</a>
		</p>

	</div>
</div>