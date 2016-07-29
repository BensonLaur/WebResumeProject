<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>采样部位编号</title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>
<script type="text/javascript">
	md.ns('md.source');
	$(function(){
		md.source.searchform=$('#md_source_searchForm').form();
		
		md.source.editRow=undefined;  //记录当前开启编辑状态的索引
		md.source.datagrid=$('#md_source_datagrid').datagrid({
			url:'${pageContext.request.contextPath}/sourceAction!show.action',
			iconCls:'icon-save',
			pagination:true,
			pageSize:10,
			pageList:[10], 
			fit:true,
		    fitColumns: true,
			nowap:false,
			border:false,
			idField: 'sourceNo',
			sortName: 'sourceNo',
			sortOrder: 'asc',
			columns: [[{
				field : 'checkbox',
				checkbox:true
			},{ title:'来源号',
				field:'sourceNo',
				width:100,
				sortable:true,
				editor: {
					type: 'validatebox',
					options: {
					required: true,
					validType: 'number'  
					}
				}

			},{ title:'名称',
				field:'sourceName',
				width:100,
				editor: {
					type: 'validatebox',
					options: {
						required: true
					}
				}
			}
			]],
			toolbar:[
			
			{
				text:'增加',
				iconCls:'icon-add',
				handler:function(){
					if(md.source.editRow!=undefined){
						md.source.datagrid.datagrid('endEdit',md.source.editRow);
					}
					
					if(md.source.editRow == undefined){
						md.source.datagrid.datagrid('endEdit',md.source.editRow);
						md.source.datagrid.datagrid('insertRow',{
						index:0,
						row:{}
					});
					}
					
					md.source.datagrid.datagrid('beginEdit',0);
					md.source.editRow=0;
				}
			},'-',
			
			{
				text:'删除',
				iconCls:'icon-remove',
				handler:function(){
					var rows=md.source.datagrid.datagrid('getSelections');
					if(rows.length>0){
						$.messager.confirm('请确认','您确定要删除当前所有选择的项目吗？',function(b){
							if(b){
								var ids=[];
								for(var i=0;i<rows.length;i++){
									ids.push(rows[i].sourceNo);
								};
							$.ajax({
									url:'${pageContext.request.contextPath}/sourceAction!delete.action',//删除
									data:{
										ids:ids.join(','),
									},
									dataType:'json',
									success:function(r){
										if(r && r.success){
												md.source.datagrid.datagrid('reload');
												md.source.datagrid.datagrid('unselectAll');
												$.messager.show({
													msg:r.msg,
													title:'成功'
												});
											}else{
												md.source.datagrid.datagrid('unselectAll');
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
				text:'保存',
				iconCls:'icon-save',
				handler:function(){
				
				    if(md.source.datagrid.datagrid('validateRow',0)){
						md.source.datagrid.datagrid('endEdit',md.source.editRow);
					}else{
						$.messager.alert('提示','请填全所有的必填项！','warning');
					}
					
				}
			},'-',{
				text:'撤销',
				iconCls:'icon-redo',
				handler:function(){
					md.source.editRow=undefined;
					md.source.datagrid.datagrid('rejectChanges');
					md.source.datagrid.datagrid('unselectAll');
				}
			}],
			onAfterEdit:function(rowIndex, rowData, changes){			
				$.ajax({
					url:'${pageContext.request.contextPath}/sourceAction!add.action',
					data:rowData,
					dataType:'json',
					success:function(r){
						if(r && r.success){
							md.source.datagrid.datagrid('acceptChanges');
							$.messager.show({
								msg:r.msg,
								title:'成功'
							});
						}else{
							md.source.datagrid.datagrid('rejectChanges');
							$.messager.alert('错误',r.msg,'error');
						}
						md.source.editRow=undefined;
						md.source.datagrid.datagrid('unselectAll');
					}
				});
				
			}
			
		});
		
		
	});
</script>
 </head>

 <body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'center',border:false">
		<table id="md_source_datagrid"></table>
	</div>


 </body>

</html>