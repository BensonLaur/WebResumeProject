<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>菌株耐药基因数据</title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>
<script type="text/javascript">
	md.ns('md.gene');
	$(function() {
		md.gene.searchform = $('#md_gene_searchForm').form();

		md.gene.editRow = undefined; //记录当前开启编辑状态的索引
		md.gene.datagrid = $('#md_gene_datagrid')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/strainCharacterAction!show.action',
							iconCls : 'icon-save',
							pagination : true,
							pageSize : 100,
							pageList : [ 100, 500, 1000 ],
							fit : true,
							fitColumns : true,
							nowap : false,
							border : false,
							idField : 'id',
							sortName : 'addTime',
							sortOrder : 'desc',
							columns : [ [
									{
										field : 'checkbox',
										checkbox : true
									},
									{
										title : 'id',
										field : 'id',
										width : 100,
										sortable : true,
										hidden : true,
										editor : {
											type : 'text',
											options : {}
										}
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
												url : '${pageContext.request.contextPath}/strainCodingAction!getStrainNoForGen.action'
											}
										}
									}, {
										title : '菌株内部编号',
										field : 'genAlias',
										sortable : true,
										width : 80,
										editor : {
											type : 'text',
											options : {
												editable : true,
												mode : 'remote',
												textField : 'genAlias',
												valueField : 'genAlias',
											}
										}
									}, {
										title : '耐药基因',
										field : 'genName',
										width : 100,
										sortable : true,
										editor : {
											type : 'validatebox',
											options : {
												required : false
											}
										}
									}, {
										title : '插入元件',
										field : 'iseq',
										width : 100,
										sortable : true,
										editor : {
											type : 'text',
											options : {}
										}
									}, {
										title : '复制子',
										field : 'replicon',
										width : 100,
										sortable : true,
										editor : {
											type : 'text',
											options : {}
										}
									}, {
										title : '接合子',
										field : 'genTc',
										width : 100,
										sortable : true,
										editor : {
											type : 'text',
											options : {}
										}
									}, {
										title : '操作人',
										field : 'operator',
										width : 150,
										sortable : true,
										editor : {
											type : 'text',
											options : {}
										}
									}, {
										title : '备注',
										field : 'genRemarks',
										width : 100,
										editor : {
											type : 'text',
											options : {}
										}
									} ] ],
							toolbar : [

									{
										text : '增加',
										iconCls : 'icon-add',
										handler : function() {
											if (md.gene.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}

											if (md.gene.editRow == undefined) {
												//md.gene.datagrid.datagrid(
													//	'removeEditor',
														//[ 'strainAlias' ]);
												md.gene.datagrid
														.datagrid(
																'addEditor',
																{
																	field : 'strainNo',
																	editor : {
																		type : 'combobox',
																		options : {
																			required : true,
																			mode : 'remote',
																			panelHeight : 'auto',
																			textField : 'strainNo',
																			valueField : 'strainNo',
																			url : '${pageContext.request.contextPath}/strainCodingAction!getStrainNoForGen.action',
																			onSelect : function(
																					record) {
																				var row = md.gene.datagrid
																						.datagrid('getSelected');
																				var target = md.gene.datagrid
																						.datagrid(
																								'getEditor',
																								{
																									'index' : 0,
																									'field' : 'strainAlias'
																								}).target;
																				target
																						.text('clear');
																				var url = '${pageContext.request.contextPath}/strainCodingAction!getStrainAliasBystrainNo.action?strainNo='
																						+ record.strainNo;
																				alert(record.strainNo);
																				target
																						.text(
																								'reload',
																								url);
																			}
																		}
																	}
																});
												md.gene.datagrid.datagrid(
														'insertRow', {
															index : 0,
															row : {}
														});
												md.gene.datagrid.datagrid(
														'beginEdit', 0);
												md.gene.editRow = 0;
											}

										}
									},
									'-',

									{
										text : '删除',
										iconCls : 'icon-remove',
										handler : function() {
											if (md.gene.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}
											var rows = md.gene.datagrid
													.datagrid('getSelections');
											if (rows.length > 0) {
												$.messager
														.confirm(
																'请确认',
																'您确定要删除当前所有选择的项目吗？',
																function(b) {
																	if (b) {
																		var ids = [];
																		for ( var i = 0; i < rows.length; i++) {
																			ids
																					.push(rows[i].id);
																		}
																		;
																		$
																				.ajax({
																					url : '${pageContext.request.contextPath}/strainCharacterAction!delete.action',
																					//删除
																					data : {
																						ids : ids
																								.join(','),
																					},
																					dataType : 'json',
																					success : function(
																							r) {
																						if (r
																								&& r.success) {
																							md.gene.datagrid
																									.datagrid('reload');
																							md.gene.datagrid
																									.datagrid('unselectAll');
																							$.messager
																									.show({
																										msg : r.msg,
																										title : '成功'
																									});
																						} else {
																							md.gene.datagrid
																									.datagrid('unselectAll');
																							$.messager
																									.alert(
																											'错误',
																											r.msg,
																											'error');
																						}
																					}
																				});
																	}
																});
											} else {
												$.messager
														.alert('提示',
																'请选择要删除的记录！',
																'warning');
											}
										}
									},
									'-',

									{
										text : '修改',
										iconCls : 'icon-edit',
										handler : function() {
											if (md.gene.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}
											var rows = md.gene.datagrid
													.datagrid('getSelections');
											if (rows.length == 1) {

												md.gene.datagrid
														.datagrid(
																'removeEditor',
																[ 'strainNo',
																		'strainAlias' ]);

												if (md.gene.editRow == undefined) {
													var rowIndex = md.gene.datagrid
															.datagrid(
																	'getRowIndex',
																	rows[0]);
													md.gene.datagrid.datagrid(
															'beginEdit',
															rowIndex);
													md.gene.editRow = rowIndex;
													md.gene.datagrid
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
									'-',

									{
										text : '保存',
										iconCls : 'icon-save',
										handler : function() {
										
											if(md.gene.datagrid.datagrid('validateRow',0)){
						                        md.gene.datagrid.datagrid('endEdit',md.gene.editRow);
					                        }else{
						                        $.messager.alert('提示','请填全所有的必填项！','warning');
					                        }
										
										}
									},
									'-',
									{
										text : '撤销',
										iconCls : 'icon-redo',
										handler : function() {
											md.gene.editRow = undefined;
											md.gene.datagrid
													.datagrid('rejectChanges');
											md.gene.datagrid
													.datagrid('unselectAll');
										}
									},
									'-',

									{
										text : '导入excel',
										iconCls : 'icon-save',
										handler : function() {
											$('#md_gen_exp')
													.dialog(
															{
																title : '导入',
																href : '../upload/gene_upload.jsp',
																fit : true,
																cache : false,
																onClose : function() {
																	md.gene.datagrid
																			.datagrid(
																					'load',
																					{});
																}

															});
										}
									},
									'-',

									{
										text : '导出excel',
										iconCls : 'icon-undo',
										handler : function() {
											var rows = md.gene.datagrid
													.datagrid('getSelections');
												
											if (rows.length > 0) {
												$.messager
														.confirm(
																'请确认',
																'您确定要导出当前所有选择的项目到excel吗？',
																function(b) {
																	if (b) {
																		var ids = [];
																		for ( var i = 0; i < rows.length; i++) {
																			ids
																					.push(rows[i].id);
																		}
																		;
																		//alert(ids.length);
																				
																		(function(){
																		     var temp = document.createElement("form");        
                                                                             temp.action = '${pageContext.request.contextPath}/downloadAction!getGenExcel.action';        
                                                                             temp.method = "post";        
                                                                             temp.style.display = "none";  
                                                                             
                                                                             var opt = document.createElement("input");
                                                                             opt.value = ids;
                                                                             opt.name = 'ids';
                                                                             //alert(opt.value);
                                                                             temp.appendChild(opt);      
                                                                                  
                                                                             document.body.appendChild(temp);        
                                                                             temp.submit();
                                                                                   
																		})();					
																	}
																});
											} else {
												$.messager.alert('提示',
														'请选择要导出的数据', 'warning');
											}
										}
									}

							],
							onAfterEdit : function(rowIndex, rowData, changes) {

								var inserted = md.gene.datagrid.datagrid(
										'getChanges', 'inserted');
								var updated = md.gene.datagrid.datagrid(
										'getChanges', 'updated');
								if (inserted.length < 1 && updated.length < 1) {
									md.gene.editRow = undefined;
									md.gene.datagrid.datagrid('unselectAll');
									return;
								}

								var url = '';
								if (inserted.length > 0) {
									url = '${pageContext.request.contextPath}/strainCharacterAction!add.action'; //增加
								}
								;
								if (updated.length > 0) {
									url = '${pageContext.request.contextPath}/strainCharacterAction!update.action'; //更新
								}
								;

								$
										.ajax({
											url : url,
											data : rowData,
											dataType : 'json',
											success : function(r) {
												if (r && r.success) {
													md.gene.datagrid
															.datagrid('acceptChanges');
													$.messager.show({
														msg : r.msg,
														title : '成功'
													});
													md.gene.editRow = undefined;
													md.gene.datagrid
															.datagrid('unselectAll');
													md.gene.datagrid
															.datagrid('reload');
												} else {
													md.gene.datagrid.datagrid(
															'beginEdit',
															rowIndex);
													md.gene.editRow = rowIndex;
													md.gene.datagrid
															.datagrid('rejectChanges');
													$.messager.alert('错误',
															r.msg, 'error');
												}
											}
										});

							},
							onLoadSuccess : function() {
								md.gene.editRow = undefined;
								md.gene.datagrid.datagrid('clearSelections');
								md.gene.datagrid.datagrid('unselectAll');
							}

						});

		/* 查询 button */
		md.gene.search = function() {
			md.gene.datagrid.datagrid('load', md
					.serializeObject(md.gene.searchform));
		};

		/* 置空 button */
		md.gene.cleanSearch = function() {
			md.gene.datagrid.datagrid('load', {});
			md.gene.searchform.find('input').val('');
		};

	});
	function search() {
		if (event.keyCode == "13") {//keyCode=13回车键                  
			md.gene.search().click();
		}
	}
</script>
</head>

<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',border:false"
		style="height:90px;width:100%;background: #F4F4F4;border-bottom:1px solid #dddddd">
		<form id="md_gene_searchForm">
			<table class="tableform" style="width:80%;height:100%">
				<tr>
					<td noWrap>菌株编号</td>
					<td><input name="strainNo" onkeydown="search();" /></td>
					<td noWrap>菌株内部编号</td>
					<td><input name="strainAlias" onkeydown="search();" /></td>
					<td noWrap>耐药基因</td>
					<td><input name="genName" onkeydown="search();" /></td>
				</tr>
				<tr>
					<td noWrap>插入元件</td>
					<td><input name="iseq" onkeydown="search();" /></td>
					<td noWrap>复制子</td>
					<td><input name="replicon" onkeydown="search();" /></td>
					<td noWrap>操作人</td>
					<td><input name="genTC" onkeydown="search();" /></td>
					<td noWrap>操作人</td>
					<td><input name="genWhoAdd" onkeydown="search();" /></td>
				</tr>
				<tr>
					<td></td>
					<td></td>

					<td noWrap><a href="javascript:void(0);" class="easyui-linkbutton"
						onclick="md.gene.search();"> 查询 </a> <a href="javascript:void(0);"
						class="easyui-linkbutton" onclick="md.gene.cleanSearch();"> 清空
					</a></td>
					<td></td>
				</tr>

			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="md_gene_datagrid">
		</table>
	</div>
	<div id="md_gen_exp"></div>
</body>

</html>