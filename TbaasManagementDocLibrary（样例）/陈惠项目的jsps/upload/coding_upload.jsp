<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	md.ns("strainCoding");
	$(function() {
		strainCoding.editRow = undefined;
		strainCoding.dataTable = $('#strainCoding')
				.datagrid(
						{
							data : '',
							fit : true,
							border : false,
							fitColumns: false,
							idField : 'strainNo',
							columns : [ [
									{
										field : 'checkbox',
										checkbox : true
									},
									{
										title : '样品编号',
										field : 'sampleNo',
										width : 100,
										editor : {
											type : 'combobox',
											options : {
												required : true,
												mode : 'remote',
												panelHeight : 'auto',
												textField : 'sampleNo',
												valueField : 'sampleNo',
												url : '../suggestAction!getSampleNo.action'
											}
										}
									},
									{
										title : '内部编号',
										field : 'strainAlias',
										width : 100,
										editor : {
											type : 'text',
											options : {}
										}
									},
									{
										field : 'strainCategory',
										title : '菌属',
										width : 100,
										sortable : true,
										editor : {
											type : 'combobox',
											options : {
												required : true,
												editable : true,
												textField : 'label',
												valueField : 'label',
												url : '../suggestAction!getStrainCategory.action'
											}
										}
									},
									{
										title : '菌种',
										field : 'strainType',
										width : 100,
										editor : {
											type : 'combobox',
											options : {
												url : '../suggestAction!getStrainName.action',
												editable : true,
												valueField : 'label',
												textField : 'label'
											}
										}
									},
									{
										title : '保存时间',
										field : 'strainStorageDate',
										width : 100,
										editor : {
											type : 'datebox',
											options : {
												required : false,
											}
										}
									},
									{
										title : '菌种鉴定人',
										field : 'strainIdentifier',
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
									} ] ],
							toolbar : [
									{
										text : '删除',
										iconCls : 'icon-remove',
										handler : function() {
											var rows = strainCoding.dataTable
													.datagrid('getSelections');
											if (rows.length > 0) {
												for ( var i = 0; i < rows.length; i++) {
													var ind = strainCoding.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[i]);
													console.info(ind);
													strainCoding.dataTable
															.datagrid(
																	'deleteRow',
																	ind);
												}
												strainCoding.dataTable
														.datagrid('unselectAll');
											}
										}
									},
									{
										text : '修改',
										iconCls : 'icon-edit',
										handler : function() {
											var rows = strainCoding.dataTable
													.datagrid('getSelections');
											if (rows.length == 1) {
												if (strainCoding.editRow != undefined) {
													strainCoding.dataTable
															.datagrid(
																	'endEdit',
																	strainCoding.editRow);
												}
												if (strainCoding.editRow == undefined) {
													var index = strainCoding.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[0]);
													strainCoding.dataTable
															.datagrid(
																	'beginEdit',
																	index);
													strainCoding.editRow = index;
													strainCoding.dataTable
															.datagrid('unselectAll');
												}
											} else {
												$.messager
														.alert('提示',
																'请选择要修改的一行！',
																'warning');
											}
										}
									}, 
									{
										text : '保存',
										iconCls : 'icon-save',
										handler : function() {
											strainCoding.dataTable.datagrid('endEdit', strainCoding.editRow);
										}
									}, 	
									{
										text : '关闭导入界面',
										iconCls : 'icon-no',
										handler : function() {
                                            $('#md_parting_exp').dialog('close');
										}
									} ],
							onAfterEdit : function(rowIndex, rowData, changes) {
								var updated = strainCoding.dataTable.datagrid(
										'getChanges', 'updated');
								var url = '';
								if (updated.length > 0) {									
									url = '${pageContext.request.contextPath}/strainCodingAction!add.action';
								}
								if (updated.length < 1) {
									strainCoding.editRow = undefined;
									strainCoding.dataTable
											.datagrid('unselectAll');
									return;
								}
								$.ajax({
									url : url,
									data : rowData,
									dataType : 'json',
									success : function(r) {
										if (r && r.success) {
											strainCoding.dataTable.datagrid(
													'deleteRow',
													strainCoding.editRow);
											$.messager.show({
												msg : r.msg,
												title : 'success'
											});
											strainCoding.editRow = undefined;
											strainCoding.dataTable
													.datagrid('unselectAll');
										} else {
											strainCoding.dataTable.datagrid(
													'beginEdit', rowIndex);
											strainCoding.editRow = rowIndex;
											$.messager.alert('error', r.msg,
													'error');
										}

									}
								});
							}
						});
		
		strainCoding.exp = function() {
			$.ajaxFileUpload({
				url : '/new_drug/uploadAction!StrainCodingUploadForCoding.action',
				secureuri : false,
				fileElementId : 'strainFile',
				dataType : 'json',
				success : function(data, status) {
					$.messager.alert('提示', data.msg, 'warning');
					strainCoding.dataTable.datagrid('loadData', data.obj);

				},
				error : function(data, status, e) {
				}
			});
		};

	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false">
		<table id="strainCoding">
		</table>
	</div>
	<div data-options="region:'north',border:false"
		style="height:110px;background:#F4F4F4;overflow:hidden;padding-left:15px">
		<form method="post" action="../UploadOperate"
			enctype="multipart/form-data">
			<h4>请选择excel文件</h4>
			<p>
				<label> <input name="type" type="hidden" value="farm" /> </label>
			</p>
			<p>
				<label> <input name="excel" type="file" id="strainFile"
					onchange="checkFileType(this)" /> </label>
			</p>
			<p>
				<a id="btn" href="javascript:void(0);" class="easyui-linkbutton"
					data-options="iconCls:'icon-save'" onclick="strainCoding.exp();">
					上传 </a> <a class="easyui-linkbutton" href="/new_drug/excelModel/coding.xls">
					下载导入模板 </a>
			</p>
		</form>
	</div>
</div>