<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>采样地信息</title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>

<script type="text/javascript">
	md.ns('md.farm');
	$(function() {
		md.farm.searchform = $('#md_farm_searchform').form();
		md.farm.editRow = undefined; //记录当前开启编辑状态的索引
		md.farm.datagrid = $('#md_farm_datagrid')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/farmAction!show.action',
							iconCls : 'icon-save',
							pagination : true,
							pageSize : 100,
							pageList : [ 10, 50, 100 ],
							fit : true,
							fitColumns : true,
							nowap : false,
							border : false,
							idField : 'farmName',
							sortName : 'addTime',
							sortOrder : 'desc',
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
										title : '省份',
										field : 'farmProvince',
										width : 50,
										sortable : true,
										editor : {
											type : 'combobox',
											options : {
												mode : 'remote',
												editable : false,
												textField : 'label',
												valueField : 'label',
												url : '${pageContext.request.contextPath}/suggestAction!getProvince.action',
                                                required : true
											}
										}
									}, {
										title : '详细地址',
										field : 'farmAddress',
										width : 100,
										sortable : true,
										editor : {
											type : 'validatebox',
											options : {}
										}
									}, {
										title : '联系人',
										field : 'farmLinkman',
										width : 80,
										sortable : true,
										editor : {
											type : 'validatebox',
											options : {}
										}
									}, {
										title : '联系电话',
										field : 'farmPhone',
										width : 80,
										editor : {
											type : 'text',
											options : {}
										}
									}, {
										title : '饲养方式',
										field : 'farmRaiseWay',
										width : 100,
										editor : {
											type : 'validatebox',
											options : {}
										}
									}, {
										title : '养殖规模',
										field : 'farmRaiseScope',
										width : 100,
										editor : {
											type : 'validatebox',
											options : {}
										}
									}, {
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
									}, {
										title : '建厂时间',
										field : 'farmBuildDate',
										width : 100,
										editor : {
											type : 'datebox',
											options : {
												editable : false
											}
										}
									}, {
										title : '备注',
										field : 'farmRemarks',
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
											if (md.farm.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}

											if (md.farm.editRow == undefined) {
												md.farm.datagrid
														.datagrid(
																'addEditor',
																{
																	field : 'farmName',
																	editor : {
																		type : 'validatebox',
																		options : {
																			
																			required : true
                                                                            
																		}
																	}
																});
												md.farm.datagrid.datagrid(
														'insertRow', {
															index : 0,
															row : {}
														});
												md.farm.datagrid.datagrid(
														'beginEdit', 0);
												md.farm.editRow = 0;
											}

										}
									},
									'-',
								
									{
										text : '删除',
										iconCls : 'icon-remove',
										handler : function() {
											if (md.farm.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}
											var rows = md.farm.datagrid
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
																					.push(rows[i].farmName);
																		}
																		;
																		$
																				.ajax({
																					url : '${pageContext.request.contextPath}/farmAction!delete.action',
																					//删除
																					data : {
																						ids : ids
																								.join(','),
																					},
																					dataType : 'json',
																					method : 'post',
																					success : function(
																							r) {
																						if (r
																								&& r.success) {
																							md.farm.datagrid
																									.datagrid('reload');
																							md.farm.datagrid
																									.datagrid('unselectAll');
																							$.messager
																									.show({
																										msg : r.msg,
																										title : '成功'
																									});
																						} else {
																							md.farm.datagrid
																									.datagrid('unselectAll');
																							$.messager
																									.alert(
																											'错误',
																											r.msg
																													+ "\n"
																													+ r.message,
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
											if (md.farm.editRow != undefined) {
												$.messager.alert('提示',
														'存在未保存的行，请保存', 'error');
												return;
											}
											var rows = md.farm.datagrid
													.datagrid('getSelections');
											if (rows.length == 1) {
												md.farm.datagrid.datagrid(
														'removeEditor',
														'farmName');
												if (md.farm.editRow == undefined) {
													var rowIndex = md.farm.datagrid
															.datagrid(
																	'getRowIndex',
																	rows[0]);
													md.farm.datagrid.datagrid(
															'beginEdit',
															rowIndex);
													md.farm.editRow = rowIndex;
													md.farm.datagrid
															.datagrid('unselectAll');
												}
											} else {
												$.messager.alert('提示',
														'只能同时修改一行数据！',
														'warning');
											}
										}
									},
									'-',
									{
										text : '保存',
										iconCls : 'icon-save',
										handler : function() {
											if(md.farm.datagrid.datagrid('validateRow',0)){
											    			 
											    md.farm.datagrid.datagrid(
													'endEdit',
													md.farm.editRow);
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
											md.farm.editRow = undefined;
											md.farm.datagrid
													.datagrid('rejectChanges');
											md.farm.datagrid
													.datagrid('unselectAll');
										}
									},
									'-',
									{
										text : '导入excel',
										iconCls : 'icon-save',
										handler : function() {
											$('#md_farm_exp')
													.dialog(
															{
																title : '导入',
																href : '../upload/addr_upload.jsp',
																cache : false,
																modal : true,
																fit : true,
																onClose : function() {
																	md.farm.datagrid.datagrid('load', {});  
																}
															});
										}
									},
									'-',
									{
										text : '导出excel',
										iconCls : 'icon-undo',
										handler : function() {
											var rows = md.farm.datagrid
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
																			//ids.push(rows[i].farmName);
																			
																			ids.push(rows[i].farmName);
																		}
																		;
																		
																		
																		(function(){
																		     var temp = document.createElement("form");        
                                                                             temp.action = '${pageContext.request.contextPath}/downloadAction!getFarmsExcel.action';        
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
									} ],
							onAfterEdit : function(rowIndex, rowData, changes) {

								if(isNaN(rowData.farmPhone)){
								    $.messager.alert('提示','联系电话应为纯数字', 'warning');
								     md.farm.datagrid.datagrid(
													'beginEdit',
													md.farm.editRow);
								}else{
								     var inserted = md.farm.datagrid.datagrid(
										'getChanges', 'inserted');
								     var updated = md.farm.datagrid.datagrid(
										'getChanges', 'updated');
								     if (inserted.length < 1 && updated.length < 1) {
									     md.farm.editRow = undefined;
									     md.farm.datagrid.datagrid('unselectAll');
									     return;
								     }

								     var url = '';
								     if (inserted.length > 0) {
									    url = '${pageContext.request.contextPath}/farmAction!add.action'; //增加
								     }
								     if (updated.length > 0) {
									    url = '${pageContext.request.contextPath}/farmAction!update.action'; //更新
								     }
							
								     $.ajax({
									     url : url,
									     data : rowData,
									     dataType : 'json',
							       		 method : 'post',
					   				     success : function(r) {
										    //alert("result: "+r);
										    //$.messager.alert("result: " + r);
										    if (r && r.success) {
											    md.farm.datagrid
													.datagrid('acceptChanges');
											    $.messager.show({
												   msg : r.msg,
												   title : '成功'
											    });

											    md.farm.editRow = undefined;
											    md.farm.datagrid.datagrid('unselectAll');
										    } else {
											    md.farm.datagrid.datagrid(
													'beginEdit', rowIndex);
											    md.farm.editRow = rowIndex;
											    $.messager.alert('错误', r.msg,'error');
										    }
									     }
								      });
								     
								}
								
							},
							onLoadSuccess : function() {
								md.farm.editRow = undefined;
								md.farm.datagrid.datagrid('unselectAll');
							}

						});

		/* 查询 button */
		md.farm.search = function() {
			md.farm.datagrid.datagrid('load', md
					.serializeObject(md.farm.searchform));
		};

		/* 置空 button */
		md.farm.cleanSearch = function() {
			md.farm.datagrid.datagrid('load', {});
			md.farm.searchform.find('input').val('');
		};

		md.farm.exp = function() {
			$.ajaxFileUpload({
				url : '../uploadAction!FarmUpload.action',
				secureuri : false,
				fileElementId : 'farmFile',
				dataType : 'json'
            });
        };

	});
	function search() {     
       if (event.keyCode == "13") {//keyCode=13回车键                  
          md.farm.search().click();               
       }
    }  
</script>
</head>

<body class="easyui-layout">
	<div data-options="region:'north',border:false"
		style="height:98px;width:100%;background: #F4F4F4;border-bottom:1px solid #dddddd"
		>
		<form id="md_farm_searchform">
			<table class="tableform" style="width:80%;height:100%">
				<tr >
					<td noWrap>名称</td>
					<td><input name="farmName" onkeydown="search();"/>
					</td>
					<td noWrap>详细地址</td>
					<td><input name="farmAddress" onkeydown="search();"/>
					</td>
					<td noWrap>联系电话</td>
					<td><input name="farmPhone" onkeydown="search();"/>
					</td>
				</tr>
				<tr>
					<td noWrap>联系人</td>
					<td><input name="farmLinkman" onkeydown="search();"/>
					</td>
					<td noWrap>养殖模式</td>
					<td><input name="farmRaiseType" onkeydown="search();"/>
					</td>
					<td noWrap>省份</td>
					<td><input name="farmProvince" onkeydown="search();"/>
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="javascript:void(0);" class="easyui-linkbutton"
						onclick="md.farm.search();"> 查询 </a> <a href="javascript:void(0);"
						class="easyui-linkbutton" onclick="md.farm.cleanSearch();"> 清空
					</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="md_farm_datagrid">
		</table>
	</div>
	<div id="md_farm_exp"></div>
	
</body>