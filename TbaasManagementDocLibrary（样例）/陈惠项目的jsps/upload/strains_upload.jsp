<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	md.ns("strainData");
	$(function() {
		strainData.editRow = undefined;
		strainData.dataTable = $('#strainData')
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
										title : '菌株编号',
										field : 'strainNo',
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
										title : '血清型',
										field : 'serotype',
										width : 100,
										editor : {
											type : 'text',
											options : {

											}
										}

									},
									{
										title : 'MLST分型',
										field : 'strainMlst',
										width : 100,
										editor : {
											type : 'text',
											options : {

											}
										}
									},
									{
										title : 'PLG',
										field : 'strainPlg',
										width : 100,
										editor : {
											type : 'text',
											options : {

											}
										}
									},
									{
										title : '备注',
										field : 'strainRemarks',
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
											var rows = strainData.dataTable
													.datagrid('getSelections');
											if (rows.length > 0) {
												for ( var i = 0; i < rows.length; i++) {
													var ind = strainData.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[i]);
													console.info(ind);
													strainData.dataTable
															.datagrid(
																	'deleteRow',
																	ind);
												}
												strainData.dataTable
														.datagrid('unselectAll');
											}
										}
									},
									{
										text : '修改',
										iconCls : 'icon-edit',
										handler : function() {
											var rows = strainData.dataTable
													.datagrid('getSelections');
											if (rows.length == 1) {
												if (strainData.editRow != undefined) {
													strainData.dataTable
															.datagrid(
																	'endEdit',
																	strainData.editRow);
												}
												if (strainData.editRow == undefined) {
													var index = strainData.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[0]);
													strainData.dataTable
															.datagrid(
																	'beginEdit',
																	index);
													strainData.editRow = index;
													strainData.dataTable
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
											strainData.dataTable.datagrid('endEdit', strainData.editRow);
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
								var updated = strainData.dataTable.datagrid(
										'getChanges', 'updated');
								var url = '';
								if (updated.length > 0) {								
									url = '${pageContext.request.contextPath}/strainCodingAction!updateType.action';
								}
								if (updated.length < 1) {
									strainData.editRow = undefined;
									strainData.dataTable
											.datagrid('unselectAll');
									return;
								}
								$.ajax({
									url : url,
									data : rowData,
									dataType : 'json',
									success : function(r) {
										if (r && r.success) {
											strainData.dataTable.datagrid(
													'deleteRow',
													strainData.editRow);
											$.messager.show({
												msg : r.msg,
												title : 'success'
											});
											strainData.editRow = undefined;
											strainData.dataTable
													.datagrid('unselectAll');
										} else {
											strainData.dataTable.datagrid(
													'beginEdit', rowIndex);
											strainData.editRow = rowIndex;
											$.messager.alert('error', r.msg,
													'error');
										}

									}
								});
							}
						});
		
		strainData.exp = function() {
			$.ajaxFileUpload({
				url : '/new_drug/uploadAction!StrainCodingUpload.action',
				secureuri : false,
				fileElementId : 'strainFile',
				dataType : 'json',
				success : function(data, status) {
					$.messager.alert('提示', data.msg, 'warning');
					strainData.dataTable.datagrid('loadData', data.obj);

				},
				error : function(data, status, e) {

				}
			});
		};

	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false">
		<table id="strainData">
		</table>
	</div>
	<div data-options="region:'north',border:false"
		style="height:110px;background:#F4F4F4;overflow:hidden;padding-left:15px">
		<form method="post" action="../UploadOperate"
			enctype="multipart/form-data">
			<p><h4>请选择excel文件</h4>
			<p>
				<label> <input name="type" type="hidden" value="farm" /> </label>
			</p>
			<p>
				<label> <input name="excel" type="file" id="strainFile"
					onchange="checkFileType(this)" />
				</label>
			</p>
			<p>
				<a id="btn" href="javascript:void(0);" class="easyui-linkbutton"
					data-options="iconCls:'icon-save'" onclick="strainData.exp();">
					上传 </a> <a class="easyui-linkbutton" href="/new_drug/excelModel/strain.xls">下载导入模板</a>
			</p>
		</form>
	</div>
</div> 