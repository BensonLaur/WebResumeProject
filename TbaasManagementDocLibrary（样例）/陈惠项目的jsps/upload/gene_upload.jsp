<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	md.ns("geneData");
	$(function() {
		geneData.editRow = undefined;
		geneData.dataTable = $('#geneData')
				.datagrid(
						{
							data : '',
							fit : true,
							fitColumns: false,
							border : false,
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
											type : 'combobox',
											options : {
												required : true,
												mode : 'remote',
												panelHeight : 'auto',
												textField : 'strainNo',
												valueField : 'strainNo',
												url : '../suggestAction!getStrainNo.action'
											}
										}
									},
									{
										title : '内部编号',
										field : 'genAlias',
										width : 100,
										editor : {
											type : 'text',
											options : {}
										}
									},
									{
										title : '耐药基因',
										field : 'genName',
										width : 100,
										editor : {
											type : 'validatebox',
											options : {
												required : false
											}
										}
									},
									{
										title : '插入元件（ISeq）',
										field : 'iseq',
										width : 100,
										editor : {
											type : 'text',
											options : {}
										}
									},
									{
										title : '复制子（Replicon）',
										field : 'replicon',
										width : 100,
										editor : {
											type : 'text',
											options : {}
										}
									},
									{
										title : '接合子',
										field : 'genTC',
										width : 100,
										editor : {
											type : 'text',
											options : {}
										}
									},
									{
										title : '操作人',
										field : 'genWhoAdd',
										width : 100,
										editor : {
											type : 'text',
											options : {}
										}
									},
									{
										title : '备注',
										field : 'genRemarks',
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
											var rows = geneData.dataTable
													.datagrid('getSelections');
											if (rows.length > 0) {
												for ( var i = 0; i < rows.length; i++) {
													var ind = geneData.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[i]);

													geneData.dataTable
															.datagrid(
																	'deleteRow',
																	ind);
												}
												geneData.dataTable
														.datagrid('unselectAll');
											}
										}
									},
									{
										text : '修改',
										iconCls : 'icon-edit',
										handler : function() {
											var rows = geneData.dataTable
													.datagrid('getSelections');
											if (rows.length == 1) {
												if (geneData.editRow != undefined) {
													geneData.dataTable
															.datagrid(
																	'endEdit',
																	geneData.editRow);
												}
												if (geneData.editRow == undefined) {
													var index = geneData.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[0]);
													geneData.dataTable
															.datagrid(
																	'beginEdit',
																	index);
													geneData.editRow = index;
													geneData.dataTable
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
											geneData.dataTable.datagrid('endEdit', geneData.editRow);
										}
									}, 	
									{
										text : '关闭导入界面',
										iconCls : 'icon-no',
										handler : function() {
											$('#md_gen_exp').dialog('close');
										}
									} ],
							onAfterEdit : function(rowIndex, rowData, changes) {
								var updated = geneData.dataTable.datagrid(
										'getChanges', 'updated');
								var url = '';
								if (updated.length > 0) {									
									url = '${pageContext.request.contextPath}/strainCharaterAction!add.action';
								}
								if (updated.length < 1) {
									geneData.editRow = undefined;
									geneData.dataTable.datagrid('unselectAll');
									return;
								}
								$.ajax({
									url : url,
									data : rowData,
									dataType : 'json',
									success : function(r) {
										if (r && r.success) {
											geneData.dataTable.datagrid(
													'deleteRow',
													geneData.editRow);
											$.messager.show({
												msg : r.msg,
												title : 'success'
											});
											geneData.editRow = undefined;
											geneData.dataTable
													.datagrid('unselectAll');
										} else {
											geneData.dataTable.datagrid(
													'beginEdit', rowIndex);
											geneData.editRow = rowIndex;

											$.messager.alert('error', r.msg,
													'error');

										}
									}
								});
							}
						});
		
		geneData.exp = function() {
			$.ajaxFileUpload({
				url : '/new_drug/uploadAction!StrainCharaterUpload.action',
				secureuri : false,
				fileElementId : 'geneFile',
				dataType : 'json',
				success : function(data, status) {
					$.messager.alert('提示', data.msg, 'warning');
					geneData.dataTable.datagrid('loadData', data.obj);

				},
				error : function(data, status, e) {

				}
			});
		};

	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false">
		<table id="geneData">
		</table>
	</div>
	<div data-options="region:'north',border:false"
		style="height:110px;background: #F4F4F4;overflow:hidden;padding-left:15px">
		<h4>请选择excel文件</h4>
		<p>
			<label> <input name="type" type="hidden" value="farm" /> </label>
		</p>
		<p>
			<label> <input name="excel" type="file" id="geneFile"
				onchange="checkFileType(this)" /> </label>
		</p>
		<p>
			<a id="btn" href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'" onclick="geneData.exp();"> 上传
			</a> <a class="easyui-linkbutton" href="/new_drug/excelModel/gens.xls">下载导入模板</a>
		</p>

	</div>
</div>