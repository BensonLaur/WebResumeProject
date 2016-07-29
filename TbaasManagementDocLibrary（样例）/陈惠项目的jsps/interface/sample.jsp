﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>样品信息</title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>
<script type="text/javascript">
	md.ns('md.sample');
	$(function() {
		md.sample.searchform = $('#md_sample_searchForm').form();
		md.sample.editRow = undefined; //记录当前开启编辑状态的索引
		md.sample.datagrid = $('#md_sample_datagrid')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/sampleAction!show.action',
							pagination : true,
							pageSize : 100,
							pageList : [ 100, 500, 1000 ],
							fit : true,
							fitColumns : true,
							nowap : false,
							border : false,
							idField : 'sampleNo',
							sortName : 'addTime',
							sortOrder : 'desc',
							columns : [ [
									{
										field : 'checkbox',
										checkbox : true
									},
									{
										title : '样品编号',
										field : 'sampleNo',
										width : 100,
										sortable : true
									},
									{
										title : '采样时间',
										field : 'sampleDateOFString',
										sortable : true,
										width : 80,
										editor : {
											type : 'datebox',
											options : {
												editable : false,
												required : true
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
												editable : false,
												textField : 'label',
												valueField : 'label',
												url : '${pageContext.request.contextPath}/suggestAction!getProvince.action',
											}
										}
									},
									{
										title : '采样地名称',
										field : 'farmName',
										width : 150,
										sortable : true,
										editor : {
											type : 'combobox',
											options : {
												editable : true,
												required : true,
												mode : 'remote',
												textField : 'farmName',
												valueField : 'farmName',
												url : '${pageContext.request.contextPath}/farmAction!getFarmName.action'
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
												textField : 'animalName',
												valueField : 'animalName',
												url : '${pageContext.request.contextPath}/animalAction!getAnimal.action'
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
												url : '${pageContext.request.contextPath}/sourceAction!getSource.action'
											}
										}
									}, {
										title : '部位',
										field : 'sampleCollectionPart',
										width : 50,
										sortable : true,
										editor : {
											type : 'text',
											options : {}
										}
									}, {
										title : '采样人员',
										field : 'sampleCollector',
										width : 150,
										sortable : true,
										editor : {
											type : 'text',
											options : {}
										}
									}, {
										title : '动物用药史',
										field : 'sampleMedicalHistory',
										width : 80,
										editor : {
											type : 'validatebox',
											options : {}
										}
									}, {
										title : '备注',
										field : 'sampleRemarks',
										width : 100,
										editor : {
											type : 'text',
											options : {
												required : true,
											}
										}
									} ] ],
							toolbar : [

									{
										text : '增加',
										iconCls : 'icon-add',
										handler : function() {
											if (md.sample.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}

											if (md.sample.editRow == undefined) {
												md.sample.datagrid
														.datagrid(
																'addEditor',
																[
																		{
																			field : 'sampleDateOFString',
																			editor : {
																				type : 'datebox',
																				options : {
																					editable : false,
																					required : true,
																				}
																			}
																		},
																		{
																			field : 'sampleProvince',
																			editor : {
																				type : 'combobox',
																				options : {
																					editable : false,
																					required : true,
																					mode : 'remote',
																					textField : 'label',
																					valueField : 'label',
																					url : '${pageContext.request.contextPath}/suggestAction!getProvince.action',
																					onSelect : function(
																							record) {
																						var row = md.sample.datagrid
																								.datagrid('getSelected');
																						var target = md.sample.datagrid
																								.datagrid(
																										'getEditor',
																										{
																											'index' : 0,
																											'field' : 'farmName'
																										}).target;
																						//alert(target);
																						target
																								.combobox('clear');
																						var url = '${pageContext.request.contextPath}/farmAction!getFarmName.action?farmProvince='
																								+ record.value;
																						//alert(record.value);
																						target
																								.combobox(
																										'reload',
																										url);
																					}
																				}
																			}

																		},
																		{
																			field : 'animal',
																			editor : {
																				type : 'combobox',
																				options : {
																					required : true,
																					mode : 'remote',
																					textField : 'animalName',
																					valueField : 'animalName',
																					url : '${pageContext.request.contextPath}/animalAction!getAnimal.action'
																				}
																			}
																		},
																		{
																			field : 'sampleSource',
																			editor : {
																				type : 'combobox',
																				options : {
																					required : true,
																					mode : 'remote',
																					textField : 'sourceName',
																					valueField : 'sourceName',
																					url : '${pageContext.request.contextPath}/sourceAction!getSource.action'
																				}
																			}

																		} ]);
												md.sample.datagrid.datagrid(
														'insertRow', {
															index : 0,
															row : {}
														});

												md.sample.datagrid.datagrid(
														'beginEdit', 0);
												md.sample.editRow = 0;
											}

										}
									},
									'-',

									{
										text : '删除',
										iconCls : 'icon-remove',
										handler : function() {
											if (md.sample.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}
											var rows = md.sample.datagrid
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
																					.push(rows[i].sampleNo);
																		}
																		;
																		$
																				.ajax({
																					url : '${pageContext.request.contextPath}/sampleAction!delete.action',
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
																							md.sample.datagrid
																									.datagrid('reload');
																							md.sample.datagrid
																									.datagrid('unselectAll');
																							$.messager
																									.show({
																										msg : r.msg,
																										title : '成功'
																									});
																						} else {
																							md.sample.datagrid
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
											if (md.sample.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}
											var rows = md.sample.datagrid
													.datagrid('getSelections');
											if (rows.length == 1) {
												md.sample.datagrid
														.datagrid(
																'removeEditor',
																[
																		'sampleNo',
																		'sampleDateOFString',
																		'sampleProvince',
																		'sampleSource',
																		'animal' ]);

												if (md.sample.editRow == undefined) {

													var rowIndex = md.sample.datagrid
															.datagrid(
																	'getRowIndex',
																	rows[0]);
													md.sample.datagrid
															.datagrid(
																	'beginEdit',
																	rowIndex);
													md.sample.editRow = rowIndex;
													md.sample.datagrid
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
													
											if(md.sample.datagrid.datagrid('validateRow',0)){
											    md.sample.datagrid.datagrid('endEdit',md.sample.editRow);
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
											md.sample.editRow = undefined;
											md.sample.datagrid
													.datagrid('rejectChanges');
											md.sample.datagrid
													.datagrid('unselectAll');
										}
									},
									'-',

									{
										text : '导入excel',
										iconCls : 'icon-save',
										handler : function() {
											$('#md_sample_exp')
													.dialog(
															{
																title : '导入',
																href : '../upload/sample_upload.jsp',
																cache : false,
																fit : true,
																onClose : function() {
																	md.sample.datagrid
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
											var rows = md.sample.datagrid
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
																					.push(rows[i].sampleNo);
																		}
																		;
																		
																		(function(){
																		     var temp = document.createElement("form");        
                                                                             temp.action = '${pageContext.request.contextPath}/downloadAction!getSampleExcel.action';        
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

								
								var inserted = md.sample.datagrid.datagrid(
										'getChanges', 'inserted');
								var updated = md.sample.datagrid.datagrid(
										'getChanges', 'updated');
								if (inserted.length < 1 && updated < 1) {
									md.sample.editRow = undefined;
									md.sample.datagrid.datagrid('unselectAll');
									return;
								}
                                                        
								var url = '';
								if (inserted.length > 0) {
									url = '${pageContext.request.contextPath}/sampleAction!add.action'; //增加
								}
								;
								if (updated.length > 0) {
									url = '${pageContext.request.contextPath}/sampleAction!update.action'; //更新
								}
								;

								$.ajax({
									url : url,
									data : rowData,
									dataType : 'json',
									success : function(r) {
										if (r && r.success) {
											md.sample.datagrid
													.datagrid('acceptChanges');
											md.sample.datagrid.datagrid(
													'reload', {});
											$.messager.show({
												msg : r.msg,
												title : '成功'
											});
											md.sample.editRow = undefined;
											md.sample.datagrid
													.datagrid('unselectAll');
										} else {
											md.sample.datagrid.datagrid(
													'beginEdit', rowIndex);
											md.sample.editRow = rowIndex;
											$.messager.alert('错误', r.msg,
													'error');
										}

									}
								});

							},
							onLoadSuccess : function() {
								md.sample.editRow = undefined;
								md.sample.datagrid.datagrid('clearSelections');
								md.sample.datagrid.datagrid('unselectAll');
							}

						});

		/* 查询 button */
		md.sample.search = function() {
			md.sample.datagrid.datagrid('load', md
					.serializeObject(md.sample.searchform));
		};

		/* 置空 button */
		md.sample.cleanSearch = function() {
			$("#sampleSource_com").combobox('clear');
			$("#sampleProvince_com").combobox('clear');
			$("#sampleAnimal_com").combobox('clear');
			md.sample.datagrid.datagrid('load', {});
			md.sample.searchform.find('input').val('');
		};

		$("#md_sample_searchForm input[name='animal']")
				.combobox(
						{
							id : 'sampleAnimal_com',
							mode : 'remote',
							textField : 'animalName',
							valueField : 'animalName',
							url : '${pageContext.request.contextPath}/animalAction!getAnimal.action',
							multiple : true
						});
		$("#md_sample_searchForm input[name='sampleProvince']")
				.combobox(
						{
							mode : 'remote',
							textField : 'label',
							valueField : 'label',
							url : '${pageContext.request.contextPath}/suggestAction!getProvince.action',
							multiple : true
						});
		$("#md_sample_searchForm input[name='sampleSource']")
				.combobox(
						{
							mode : 'remote',
							textField : 'sourceName',
							valueField : 'sourceName',
							url : '${pageContext.request.contextPath}/sourceAction!getSource.action',
							multiple : true
						});

	});

	function search() {
		if (event.keyCode == "13") {//keyCode=13回车键                  
			md.sample.search().click();
		}
	}
</script>
</head>

<body class="easyui-layout" data-options="border:false">
	<div data-options="region:'north',border:false"
		style="height:100px;width:100%;background: #F4F4F4;border-bottom:1px solid #dddddd">
		<form id="md_sample_searchForm">
			<table class="tableform" style="width:100%;height:100%">
				<tr>
					<td noWrap>样品编号</td>
					<td><input name="sampleNo" onkeydown="search();" /></td>
					<td noWrap>采样省份</td>
					<td><input name="sampleProvince" id='sampleProvince_com'
						onkeydown="search();" /></td>
					<td noWrap>采样地名称</td>
					<td><input name="farmName" onkeydown="search();" /></td>
					<td noWrap>养殖场名称</td>
					<td><input name="sampleFarmAddr" onkeydown="search();" /></td>
					<td noWrap>日龄</td>
					<td><input name="sampleAnimalAge" onkeydown="search();" /></td>
				</tr>
				<tr>
					<td noWrap>动物</td>
					<td><input name="animal" id='sampleAnimal_com'
						onkeydown="search();" /></td>
					<td noWrap>来源</td>
					<td><input name="sampleSource" id='sampleSource_com'
						onkeydown="search();" /></td>
					<td noWrap>部位</td>
					<td><input name="sampleCollectionPart" onkeydown="search();" />
					</td>
					<td noWrap>采集时间</td>
					<td noWrap colspan="3"><input name="beginDate" class="easyui-datebox"
						style="width:125px;" onkeydown="search();" /> 至 <input
						name="endDate" class="easyui-datebox"
						data-options="editable:false" style="width:125px;"
						onkeydown="search();" /></td>
				</tr>

				<tr>
					<td></td>
					<td></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td noWrap><a href="javascript:void(0);" class="easyui-linkbutton"
						onclick="md.sample.search();"> 查询 </a> <a
						href="javascript:void(0);" class="easyui-linkbutton"
						onclick="md.sample.cleanSearch();"> 清空 </a></td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="md_sample_datagrid">
		</table>
	</div>
	<div id="md_sample_exp"></div>
</body>
</html>