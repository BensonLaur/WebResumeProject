<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>菌株编号</title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>
<script type="text/javascript">
            md.ns('md.bacteria');
            $(function() {
                md.bacteria.searchform = $('#md_bacteria_searchForm').form();

                md.bacteria.editRow = undefined; //记录当前开启编辑状态的索引
                md.bacteria.datagrid = $('#md_bacteria_datagrid').datagrid({
                    url: '${pageContext.request.contextPath}/strainToNotesAction!show.action',
                    iconCls: 'icon-save',
                    pagination: true,
                    pageSize: 10,
                    pageList: [10, 20, 40],
                    fit: true,
                    fitColumns: true,
                    nowap: false,
                    border: false,
                    idField: 'id',
                    sortName: 'strainNotes',
                    sortOrder: 'asc',
                    columns: [[{
                        field: 'id',
                        checkbox: true
                    },
                    {
                        title: '菌种代号',
                        field: 'strainNotes',
                        width: 100,
                        sortable: true,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: true
                               
                            }
                        }
                    },
                    
                    {
                        title: '菌属名',
                        field: 'strainCategory',
                        width: 100,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: true
                            }
                        }

                    },
                    {
                        title: '菌种名',
                        field: 'strainName',
                        width: 100,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: false
                            }
                        }
                    },
                    {
                        title: '格兰氏阴阳性',
                        field: 'gramStain',
                        width: 100,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: false
                            }
                        }
                    },
                    {
                        title: '备注',
                        field: 'strainRemark',
                        width: 100,
                        editor: {
                            type: 'text',
                            options: {

                            }
                        }

                    }]],
                    toolbar: [
                   
                    {
                        text: '增加',
                        iconCls: 'icon-add',
                        handler: function() {
                            if (md.bacteria.editRow != undefined) {
                                $.messager.alert('提示', '存在未保存的行，请保存', 'error');
                            }

                            if (md.bacteria.editRow == undefined) {
                                md.bacteria.datagrid.datagrid('addEditor', [{
                                    field: 'strainNotes',
                                    editor: {
                                        type: 'validatebox',
                                        options: {
                                            required: true
                                            
                                        }
                                    }
                                },
                                {
                                    field: 'strainName',
                                    editor: {
                                        type: 'validatebox',
                                        options: {
                                            required: false
                                        }
                                    }
                                },
                                {
                                    field: 'strainCategory',
                                    editor: {
                                        type: 'validatebox',
                                        options: {
                                            required: true
                                        }
                                    }
                                }]);
                                md.bacteria.datagrid.datagrid('insertRow', {
                                    index: 0,
                                    row: {}
                                });
                                md.bacteria.datagrid.datagrid('beginEdit', 0);
                                md.bacteria.editRow = 0;
                            }

                        }
                    },
                    '-', 
                  
                    {
                        text: '删除',
                        iconCls: 'icon-remove',
                        handler: function() {
                            var rows = md.bacteria.datagrid.datagrid('getSelections');
                            var ids = [];
                            if (rows.length > 0) {
                                $.messager.confirm('请确认', '您确定要删除当前所有选择的项目吗？',
                                function(b) {
                                    if (b) {
                                        var ids = [];
                                        for (var i = 0; i < rows.length; i++) {
                                            ids.push(rows[i].id);
                                        };
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/strainToNotesAction!delete.action',
                                            //删除
                                            data: {
                                                ids: ids.join(','),
                                            },
                                            dataType: 'json',
                                            success: function(r) {
                                                if (r && r.success) {
                                                    md.bacteria.datagrid.datagrid('reload');
                                                    md.bacteria.datagrid.datagrid('unselectAll');
                                                    $.messager.show({
                                                        msg: r.msg,
                                                        title: '成功'
                                                    });
                                                } else {
                                                    md.bacteria.datagrid.datagrid('unselectAll');
                                                    $.messager.alert('错误', r.msg, 'error');
                                                }
                                            }
                                        });
                                    }
                                });
                            } else {
                                $.messager.alert('提示', '请选择要删除的记录！', 'warning');
                            }
                        }
                    },
                    '-',
                  
                     {
                        text: '修改',
                        iconCls: 'icon-edit',
                        handler: function() {
                            var rows = md.bacteria.datagrid.datagrid('getSelections');
                            if (rows.length == 1) {
                                md.bacteria.datagrid.datagrid('removeEditor', ['strainNotes', 'strainName', 'strainCategory']);
                                if (md.bacteria.editRow == undefined) {
                                    var rowIndex = md.bacteria.datagrid.datagrid('getRowIndex', rows[0]);
                                    md.bacteria.datagrid.datagrid('beginEdit', rowIndex);
                                    md.bacteria.editRow = rowIndex;
                                    md.bacteria.datagrid.datagrid('unselectAll');
                                }
                            } else {
                                $.messager.alert('提示', '请选择要修改的一行！', 'warning');
                            }
                        }
                    },
                    '-',
                    
                     {
                        text: '保存',
                        iconCls: 'icon-save',
                        handler: function() {
                            if(md.bacteria.datagrid.datagrid('validateRow',0)){
								md.bacteria.datagrid.datagrid('endEdit',md.bacteria.editRow);
							}else{
								$.messager.alert('提示','请填全所有的必填项！','warning');
							}
                           
                        }
                    },
                    '-', {
                        text: '撤销',
                        iconCls: 'icon-redo',
                        handler: function() {
                            md.bacteria.editRow = undefined;
                            md.bacteria.datagrid.datagrid('rejectChanges');
                            md.bacteria.datagrid.datagrid('unselectAll');
                        }
                    }],
                    onAfterEdit: function(rowIndex, rowData, changes) {

                        var inserted = md.bacteria.datagrid.datagrid('getChanges', 'inserted');
                        var updated = md.bacteria.datagrid.datagrid('getChanges', 'updated');
                        if (inserted.length < 1 && updated < 1) {
                            editRow = undefined;
                            md.bacteria.datagrid.datagrid('unselectAll');
                            return;
                        }

                        var url = '';
                        if (inserted.length > 0) {
                            url = '${pageContext.request.contextPath}/strainToNotesAction!add.action'; //增加
                        };
                        if (updated.length > 0) {
                            url = '${pageContext.request.contextPath}/strainToNotesAction!update.action'; //更新
                        };

                        $.ajax({
                            url: url,
                            data: rowData,
                            dataType: 'json',
                            success: function(r) {
                                if (r && r.success) {
                                    md.bacteria.datagrid.datagrid('acceptChanges');
                                    $.messager.show({
                                        msg: r.msg,
                                        title: '成功'
                                    });
                                } else {
                                    md.bacteria.datagrid.datagrid('rejectChanges');
                                    $.messager.alert('错误', r.msg, 'error');
                                }
                                md.bacteria.editRow = undefined;
                                md.bacteria.datagrid.datagrid('unselectAll');
                            }
                        });

                    },onLoadSuccess:function(){
							md.bacteria.editRow=undefined; 
							 md.bacteria.datagrid.datagrid('clearSelections');
							md.bacteria.datagrid
													.datagrid('unselectAll');
							}

                });

            });
        </script>
    </head>
    
    <body class="easyui-layout" data-options="fit:true,border:false">
        <div data-options="region:'center',border:false">
            <table id="md_bacteria_datagrid">
            </table>
        </div>
    </body>

</html>