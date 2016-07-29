<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>药物敏感性数据</title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>
<script type="text/javascript">
	md.ns('md.detection');

	$(function() {
	   	alert("这里是阴性界面！");
		md.detection.searchform = $('#md_detection_searchForm').form();
		md.detection.editRow = undefined; //记录当前开启编辑状态的索引
		
		md.detection.datagrid = $('#md_detection_datagrid')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/strainMicAction!show.action',
							iconCls : 'icon-save',
							queryParams: {
		                       gramStain:'阴性'
	                        },
							pagination : true,
							pageSize : 100,
							pageList : [ 100, 500, 1000 ],
							fit : true,
							fitColumns : false,
							nowap : false,
							border : false,
							idField : 'strainNo',
							sortName : 'addTime',
							sortOrder : 'desc',
                            
                            frozenColumns : [ [ 
                                    {
										field : 'checkbox',
										checkbox : true
									},
									{
										title : '菌株号',
										field : 'strainNo',
										width : 100,
										sortable : true,
										align : 'center',
										editor : {
											type : 'combobox',
											options : {
												required : true,
												mode : 'remote',
												panelHeight : 'auto',
												textField : 'strainNo',
												valueField : 'strainNo',
												url : '${pageContext.request.contextPath}/strainCodingAction!getStrainNoForMic.action'
											}
										}
									},
									{
										title : '内部编号',
										field : 'micAlias',
										width : 80,
										sortable : true,
										align : 'center',
										editor : {
											type : 'text',
											options : {}
										}

									}
                            
                            ] ],
                            
							columns : [ [
									
									{
										title : '<label title="哌拉西林" class="easyui-tooltip">PIP</lable>',
										field : 'pip',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="他唑巴坦" class="easyui-tooltip">TZP</lable>',
										field : 'tzp',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="头孢他啶" class="easyui-tooltip">CAZ</lable>',
										field : 'caz',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="头孢噻呋" class="easyui-tooltip">CFZ</lable>',
										field : 'cfz',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="头孢曲松" class="easyui-tooltip">CRO</lable>',
										field : 'cro',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="头孢噻肟" class="easyui-tooltip">CTX</lable>',
										field : 'ctx',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="头孢吡肟" class="easyui-tooltip">FEP</lable>',
										field : 'fep',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="阿米卡星" class="easyui-tooltip">AMK</lable>',
										field : 'amk',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="安普霉素" class="easyui-tooltip">APR</lable>',
										field : 'apr',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="新霉素" class="easyui-tooltip">NEO</lable>',
										field : 'neo',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="奈替米星" class="easyui-tooltip">NET</lable>',
										field : 'net',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="链霉素" class="easyui-tooltip">STR</lable>',
										field : 'str',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="妥布霉素" class="easyui-tooltip">TOB</lable>',
										field : 'tob',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="多西环素" class="easyui-tooltip">DOX</lable>',
										field : 'dox',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="米诺环素" class="easyui-tooltip">MIN</lable>',
										field : 'min',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="氯霉素" class="easyui-tooltip">CHL</lable>',
										field : 'chl',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="阿奇霉素" class="easyui-tooltip">AZM</lable>',
										field : 'azm',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="替考拉宁" class="easyui-tooltip">TEC</lable>',
										field : 'tec',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="黏菌素" class="easyui-tooltip">CL</lable>',
										field : 'cl',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="亚胺培南" class="easyui-tooltip">IMP</lable>',
										field : 'imp',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="美罗培南" class="easyui-tooltip">MEM</lable>',
										field : 'mem',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="磷霉素" class="easyui-tooltip">FOS</lable>',
										field : 'fos',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="呋喃妥因" class="easyui-tooltip">NIT</lable>',
										field : 'nit',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="磺胺甲噁唑" class="easyui-tooltip">SXT</lable>',
										field : 'sxt',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="甲氧苄啶" class="easyui-tooltip">TMP</lable>',
										field : 'tmp',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="左氧氟沙星" class="easyui-tooltip">LEV</lable>',
										field : 'lev',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="萘啶酸" class="easyui-tooltip">NAL</lable>',
										field : 'nal',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="诺氟沙星" class="easyui-tooltip">NOR</lable>',
										field : 'nor',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="氧氟沙星" class="easyui-tooltip">OFX</lable>',
										field : 'ofx',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="OQX" class="easyui-tooltip">OQX</lable>',
										field : 'oqx',
										width : 52,
										sortable : true,
										align : 'center',
										hidden: true,
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									}, 
									{
										title : '<label title="氨苄西林" class="easyui-tooltip">AMP</lable>',
										field : 'amp',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="苯唑西林" class="easyui-tooltip">OXA</lable>',
										field : 'oxa',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="青霉素" class="easyui-tooltip">PEN</lable>',
										field : 'pen',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},										
									{
										title : '<label title="头孢喹肟" class="easyui-tooltip">CQM</lable>',
										field : 'cqm',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="头孢西丁" class="easyui-tooltip">FOX</lable>',
										field : 'fox',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="庆大霉素" class="easyui-tooltip">GEN</lable>',
										field : 'gen',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="四环素" class="easyui-tooltip">TET</lable>',
										field : 'tet',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="氟甲砜霉素" class="easyui-tooltip">FFC</lable>',
										field : 'ffc',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},	
									{
										title : '<label title="红霉素" class="easyui-tooltip">ERY</lable>',
										field : 'ery',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="利福平" class="easyui-tooltip">RIF</lable>',
										field : 'rif',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="万古霉素" class="easyui-tooltip">VAN</lable>',
										field : 'van',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="克林霉素" class="easyui-tooltip">CLI</lable>',
										field : 'cli',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="泰妙菌素" class="easyui-tooltip">TIA</lable>',
										field : 'tia',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '<label title="沃尼妙林" class="easyui-tooltip">VAL</lable>',
										field : 'val',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},	
									{
										title : '<label title="环丙沙星" class="easyui-tooltip">CIP</lable>',
										field : 'cip',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},			
									{
										title : '<label title="利奈唑胺" class="easyui-tooltip">LZD</lable>',
										field : 'lzd',
										width : 52,
										sortable : true,
										align : 'center',
										editor : {
											type : 'numberbox',
											options : {
												precision : 3,
												required : false,
											}
										}
									},
									{
										title : '实验人员',
										field : 'operator',
										width : 60,
										editor : {
											type : 'text',
											options : {}
										}
									}, {
										title : '实验方式',
										field : 'micdetectionType',
										width : 60,
										editor : {
											type : 'text',

										}

									}, {
										title : '备注',
										field : 'micRemarks',
										width : 100,
										align : 'center',
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
											if (md.detection.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}

											if (md.detection.editRow == undefined) {
												md.detection.datagrid
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
																			url : '${pageContext.request.contextPath}/strainCodingAction!getStrainNoForMic.action'
																		}
																	}
																});
												md.detection.datagrid.datagrid(
														'insertRow', {
															index : 0,
															row : {}
														});

												md.detection.datagrid.datagrid(
														'beginEdit', 0);
												md.detection.editRow = 0;
											}
										}
									},
									'-',

									{
										text : '删除',
										iconCls : 'icon-remove',
										handler : function() {
											if (md.detection.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}
											var rows = md.detection.datagrid
													.datagrid('getChecked');
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
																					.push(rows[i].strainNo);
																		}
																		$
																				.ajax({
																					url : '${pageContext.request.contextPath}/strainMicAction!delete.action',
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
																							md.detection.datagrid
																									.datagrid('reload');
																							md.detection.datagrid
																									.datagrid('unselectAll');
																							$.messager
																									.show({
																										msg : r.msg,
																										title : '成功'
																									});
																						} else {
																							md.detection.datagrid
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
											if (md.detection.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}
											var rows = md.detection.datagrid
													.datagrid('getSelections');

											if (rows.length == 1) {

												md.detection.datagrid.datagrid(
														'removeEditor',
														'strainNo');

												if (md.detection.editRow == undefined) {
													var rowIndex = md.detection.datagrid
															.datagrid(
																	'getRowIndex',
																	rows[0]);
													md.detection.datagrid
															.datagrid(
																	'beginEdit',
																	rowIndex);
													md.detection.editRow = rowIndex;
													md.detection.datagrid
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
											
											if(md.detection.datagrid.datagrid('validateRow',0)){
								                 md.detection.datagrid.datagrid('endEdit',md.detection.editRow);
								                 if (editRow.length != 0) {
												    for ( var i = 0; i < editRow.length; i++) {
													    md.detection.datagrid.datagrid('endEdit',editRow[i]);
												    }
											     }
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
											md.detection.editRow = undefined;
											md.detection.datagrid
													.datagrid('rejectChanges');
											md.detection.datagrid
													.datagrid('unselectAll');
										}
									},
									'-',

									{
										text : '导入excel',
										iconCls : 'icon-save',
										handler : function() {
											$('#md_mic_exp')
													.dialog(
															{
																title : '导入',
																href : '../upload/detection_upload.jsp',
																fit : true,
																cache : true,
																onClose : function() {
																	md.detection.datagrid
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
											var rows = md.detection.datagrid
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
																			ids.push(rows[i].strainNo);
																		}
                                                                         var title = md.detection.datagrid.datagrid('getColumnFields'); 
                                                                         var columnNames = new Array();     
				                                                         for (var i in title){	
				                                                         	 var a = title[i];
				                                                         	 var result = $("td[field=" + a + "]").is(":hidden");
				                                                         	 //alert(result);
		                                                                     if(result != true){
		                                                                        if(a != 'operator' && a != 'micdetectionType' && a != 'micRemarks'){
		                                                                            columnNames.push(a); 
		                                                                        }
		                                                                                       		                                		                   		                 		                    		                          
		                                                                     }                    
		                                                                 }
		                                                                 /*for (var i in columnNames){	
		                                                                      alert(columnNames[i]);
		                                                                 }
		                                                                 alert(columnNames.length);*/
																		
																	    
																	   
																		(function(){
																		     var temp = document.createElement("form");        
                                                                             temp.action = '${pageContext.request.contextPath}/downloadAction!getMicExcel.action';        
                                                                             temp.method = "post";        
                                                                             temp.style.display = "none";  
                                                                             
                                                                             var opt = document.createElement("input");
                                                                             opt.value = ids;
                                                                             opt.name = 'ids';
                                                                             //alert(opt.value);
                                                                             temp.appendChild(opt);      
                                                                               
                                                                             var opt1 = document.createElement("input");
                                                                             opt1.value = columnNames;
                                                                             opt1.name = 'columnNames';
                                                                              //alert(opt1.value);
                                                                             temp.appendChild(opt1);   
                                                                               
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

								var inserted = md.detection.datagrid.datagrid(
										'getChanges', 'inserted');
								var updated = md.detection.datagrid.datagrid(
										'getChanges', 'updated');
								if (inserted.length < 1 && updated.length < 1) {
									md.detection.editRow = undefined;
									md.detection.datagrid
											.datagrid('unselectAll');
									return;
								}

								var url = '';
								if (inserted.length > 0) {
									url = '${pageContext.request.contextPath}/strainMicAction!add.action'; //增加
								}
								;
								if (updated.length > 0) {
									url = '${pageContext.request.contextPath}/strainMicAction!update.action'; //更新
								}
								;

								$.ajax({
									url : url,
									data : rowData,
									dataType : 'json',
									success : function(r) {
										if (r && r.success) {
											md.detection.datagrid
													.datagrid('acceptChanges');
											$.messager.show({
												msg : r.msg,
												title : '成功'
											});
											md.detection.editRow = undefined;
											md.detection.datagrid
													.datagrid('unselectAll');
										} else {
											md.detection.datagrid.datagrid(
													'beginEdit', rowIndex);
											md.detection.editRow = rowIndex;
											$.messager.alert('错误', r.msg,
													'error');
										}
									}
								});

							},
							onLoadSuccess : function() {
								md.detection.editRow = undefined;
								md.detection.datagrid
										.datagrid('clearSelections');
								md.detection.datagrid.datagrid('unselectAll');
							},
						
						});

		/* 查询 button */
		md.detection.search = function() {

			md.detection.datagrid.datagrid('load', md
					.serializeObject(md.detection.searchform));

		};

		/* 置空 button */
		md.detection.cleanSearch = function() {
		
		    $("#columnRange").val("");
            $("#drugCondition").text("");
            s = s1 = "";
			md.detection.datagrid.datagrid('load', {});
			md.detection.searchform.find('input').val('');
		};
		
       $("#medicalName").combobox({
			url : 'combobox_drugAnalyseDrug.json',
			method : 'post',
			editable : false,
			valueField : 'id',
			textField : 'text',
			width : 80,
			panelWidth : 80,
				
		});
		
       $("#drugCombobox").combobox({
            url: 'combobox_detectionHidCol.json',
			method: 'post',
			editable: false,
			multiple: true,
			valueField: 'id',
			textField: 'text',
			panelWidth: 100,	
			width: 120,				
			onSelect: function(record){			  
				  var field = record.text; 
				  var title = md.detection.datagrid.datagrid('getColumnFields'); 
				  for (i in title){		
		              var title1 = title[i].toUpperCase(); 
		              if(title1 == field){
		                   md.detection.datagrid.datagrid('showColumn',title[i]);	                               	  		              	                 		                  		                 	                		                      		                   		                        	                                         
		                   break;	                   		                                		                   		                 		                    		                          
		              }                    
		         }	
		         $("#drugCombobox").combobox(showPanel); 				 
			},
            onUnselect: function(record){
				  var field = record.text; 
				  var title = md.detection.datagrid.datagrid('getColumnFields');	 
				  for (i in title){		
		              var title1 = title[i].toUpperCase(); 
		              if(title1 == field){		                 	              	  		              	                 		                  		                                 		                      
		                  md.detection.datagrid.datagrid('hideColumn',title[i]);	
		                  break;   		                 		                    		                          
		              }                    
		         }	
		         $("#drugCombobox").combobox(showPanel); 				 
			}
       });
		var s = "", s1 = "";
        $("#drugSearchAdd").click(function(){
           var drugName = $("#medicalName").combobox("getText");
           var drugHighVal = $("#drugHighVal").val();
           var drugLowVal = $("#drugLowVal").val();
           s += " and " + drugName + " between " + drugLowVal + " and " + drugHighVal;
           s1 += drugLowVal + "<=" + drugName + "<=" + drugHighVal + " ";
           $("#columnRange").val(s);
           $("#drugCondition").text(s1);
        });
       
	});
	function search() {
		if (event.keyCode == "13") {//keyCode=13回车键                  
			md.detection.search().click();
		}
	}

</script>
</head>

<body id="md_detection_body" class="easyui-layout"
	data-options="border:false">
	<div data-options="region:'north',border:false"
		style="background: #F4F4F4;border-bottom:1px solid #dddddd;height: 120px;">
		<form id="md_detection_searchForm">
			<table class="tableform">
				<tr>
					<td noWrap>菌株编号 <input name="strainNo" onkeydown="search();" /></td>
					<td noWrap>内部编号 <input name="micAlias" onkeydown="search();" /></td>
					<td noWrap>隐藏列显示<input class="easyui-combobox" id="drugCombobox" /></td>   
               </tr>	
				<tr>
				    <td noWrap>药品范围值查找：药品名<input name="medicalName" id="medicalName"/></td>
					<td noWrap>从<input id="drugLowVal" style="width:50px"/>到<input id="drugHighVal" style="width:50px"/><a id="drugSearchAdd" href="javascript:void(0);" class="easyui-linkbutton" > 添加 </a></td>
                    <td noWrap><input id="columnRange" name="columnRange" value="" style="display:none"/></td>
                    <td noWrap><input name="gramStain" value="阴性" style="display:none"/></td>
				</tr>	
                <tr>
                    <td colspan="5"></td>
                </tr>
           </table>
           <span> 已选的药物查询范围：<span id="drugCondition"></span></span>
						
			<p style="text-align:center">
				<a href="javascript:void(0);" class="easyui-linkbutton"
					onclick="md.detection.search();"> 查询 </a> <a
					href="javascript:void(0);" class="easyui-linkbutton"
					onclick="md.detection.cleanSearch();"> 清空 </a>
			</p>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="md_detection_datagrid">
		</table>
	</div>
	<div id="md_mic_exp" style="overflow: auto;"></div>
</body>

</html>