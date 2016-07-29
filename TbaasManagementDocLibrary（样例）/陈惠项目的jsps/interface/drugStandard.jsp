<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title> 药品标准信息 </title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include> 
<script type="text/javascript">
	md.ns('md.standard');
	$(function(){
		md.standard.searchform=$('#md_standard_searchForm').form();
		
		md.standard.editRow=undefined;  //记录当前开启编辑状态的索引
		md.standard.datagrid=$('#md_standard_datagrid').datagrid({
			url:'${pageContext.request.contextPath}/standardMicAction!show.action',
			iconCls:'icon-save',
			pagination:true,
			pageSize:10,
			pageList:[10,50,100], 
			fit:true,
			fitColumns:true,
			nowap:false,
			border:false,
			sortName: 'standardName',
			sortOrder: 'asc',
			columns: [[{
				field : 'checkbox',
				checkbox:true
			},{ 
				title:'标准名称',
				field:'standardName',
				width:100,
				editor: {
					type:'validatebox',
					options:{
						required: true
					}
				}
			
			},{ 
				title:'药品名称',
				field:'medicalName',
				width:100,
				sortable:true,
				editor: {
					type:'validatebox',
					options:{
						required: true
					}
				}
			},{ 
				title:'细菌',
				field:'strainName',
				width:100,
				editor: {
					type:'validatebox',
					options:{
						required: true
					}
				}
			
			},{ 
				title:'折点',
				field:'medlimit',
				width:100,
				editor: {
					type:'numberbox',
					options:{
					     precision: 3,
						required: true
					}
				}
			
			},{ 
				title:'备注',
				field:'remark',
				width:100,
				editor: {
					type:'validatebox',
					options:{
						required: false
					}
				}
			}
			]],
			toolbar:[
			
			{
				text:'增加',
				iconCls:'icon-add',
				handler:function(){
					if(md.standard.editRow!=undefined){
					      $.messager.alert('提示', '存在未保存的行，请保存', 'error');
					      return;
					}
					
					if(md.standard.editRow == undefined){
				  md.standard.datagrid.datagrid('addEditor', [ {
                                    field: 'standardName',
                                    editor: {
                                        type: 'validatebox',
                                        options: {
                                            required: true,
                                        }
                                    }

                                },{
                                    field: 'medicalName',
                                    editor: {
                                        type: 'validatebox',
                                        options: {
                                            required: true,
                                        }
                                    }

                                },{
                                    field: 'strainName',
                                    editor: {
                                        type: 'validatebox',
                                        options: {
                                            required: true,
                                        }
                                    }

                                }]);
						md.standard.datagrid.datagrid('insertRow',{
						index:0,
						row:{}
					});
					md.standard.datagrid.datagrid('beginEdit',0);
					md.standard.editRow=0;
					}
					
				}
			},'-',
			
			{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
				if(md.standard.editRow!=undefined){
					      $.messager.alert('提示', '存在未保存的行，请保存', 'error');
					      return;
					}
					var rows=md.standard.datagrid.datagrid('getSelections');
					
					if(rows.length>0){
						$.messager.confirm('请确认','您确定要删除当前所有选择的项目吗？',function(b){
							if(b){
								var ids=[];
								for(var i=0;i<rows.length;i++){
									ids.push(rows[i].standardName+'|'+rows[i].medicalName+'|'+rows[i].strainName);
								};
							$.ajax({
									url:'${pageContext.request.contextPath}/standardMicAction!delete.action',//删除
									data:{
										ids:ids.join(','),
									},
									dataType:'json',
									success:function(r){
										if(r && r.success){
												md.standard.datagrid.datagrid('reload');
												md.standard.datagrid.datagrid('unselectAll');
												$.messager.show({
													msg:r.msg,
													title:'成功'
												});
											}else{
												md.standard.datagrid.datagrid('unselectAll');
												$.messager.alert('错误',r.msg,'error');
											}
									}
								});
							}
						});
					}else{
						$.messager.alert('提示','请选择要删除的记录！','warning');
					}
				}
			},'-',
			
			{
				text:'修改',
				iconCls:'icon-edit',
				handler:function(){
				if(md.standard.editRow!=undefined){
					      $.messager.alert('提示', '存在未保存的行，请保存', 'error');
					      return;
					}
					var rows=md.standard.datagrid.datagrid('getSelections');
					if(rows.length==1){
						md.standard.datagrid.datagrid('removeEditor',['standardName','medicalName','strainName']);
						if(md.standard.editRow==undefined){
							var rowIndex=md.standard.datagrid.datagrid('getRowIndex',rows[0]);
							md.standard.datagrid.datagrid('beginEdit',rowIndex);
							md.standard.editRow=rowIndex;
							md.standard.datagrid.datagrid('unselectAll');
					}
				}else{
						$.messager.alert('提示','请选择要修改的一行！','warning');
					}
				}
			},'-',
			 
			{
				text:'保存',
				iconCls:'icon-save',
				handler:function(){
				
				    if(md.standard.datagrid.datagrid('validateRow',0)){
						md.standard.datagrid.datagrid('endEdit',md.standard.editRow);
					}else{
						$.messager.alert('提示','请填全所有的必填项！','warning');
					}
					
				}
			},'-',{
				text:'撤销',
				iconCls:'icon-redo',
				handler:function(){
					md.standard.editRow=undefined;
					md.standard.datagrid.datagrid('rejectChanges');
					md.standard.datagrid.datagrid('unselectAll');
				}
			}],
			onAfterEdit:function(rowIndex, rowData, changes){
				
				var inserted=md.standard.datagrid.datagrid('getChanges','inserted');
				var updated=md.standard.datagrid.datagrid('getChanges','updated');
				if(inserted.length<1 && updated<1){
					md.standard.editRow=undefined;
					md.standard.datagrid.datagrid('unselectAll');
					return;
				}
				
				var url='';
				if(inserted.length>0){
					url='${pageContext.request.contextPath}/standardMicAction!add.action';//增加
				};
				if(updated.length>0){
					url='${pageContext.request.contextPath}/standardMicAction!update.action';//更新
				};
				
				$.ajax({
					url:url,
					data:rowData,
					dataType:'json',
					success:function(r){
						if(r && r.success){
							md.standard.datagrid.datagrid('acceptChanges');
							$.messager.show({
								msg:r.msg,
								title:'成功'
							});
							 md.standard.editRow = undefined;
                             md.standard.datagrid.datagrid('unselectAll');
						}else{
						   md.standard.datagrid.datagrid('beginEdit', rowIndex);
                           md.standard.editRow = rowIndex;
							$.messager.alert('错误',r.msg,'error');
						}
						
					}
				});
				
			}
			
		});
		
		/* 查询 button */
		md.standard.search=function(){
			md.standard.datagrid.datagrid('load',md.serializeObject(md.standard.searchform));
		};
		
		/* 置空 button */
		md.standard.cleanSearch=function(){
			md.standard.datagrid.datagrid('load',{});
			md.standard.searchform.find('input').val('');
		};
			
	});
</script>
 </head>

 <body class="easyui-layout" data-options="fit:true,border:false">
 	<div data-options="region:'north',border:false" style="height:88px;width:100%;background: #F4F4F4;border-bottom:1px solid #dddddd">
 		<form id="md_standard_searchForm">
 			<table class="tableform" style="width:50%;height:100%">
 				<tr>
 					<td noWrap>标准名称</td>
 					<td><input name="standardName"/></td>
 					<td noWrap>药品名称</td>
 					<td><input name="medicalName"/></td>
 				</tr>
  				<tr>
 					<td noWrap>细菌</td>
 					<td><input name="strainName"/></td>
 					<td></td>
 					<td></td>
 				</tr>
 				<tr>
 					<td></td><td></td><td></td>
 					<td noWrap><a href="javascript:void(0);" class="easyui-linkbutton" onclick="md.standard.search();">查询</a>
 					<a href="javascript:void(0);"  class="easyui-linkbutton"  onclick="md.standard.cleanSearch();">清空</a></td>
 				</tr>
 			</table>
 		</form>
 	</div>  
	<div data-options="region:'center',border:false">
		<table id="md_standard_datagrid"></table>
	</div>


 </body>

</html>