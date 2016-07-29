<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>采样动物编号</title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>
        <script type="text/javascript">
            md.ns('md.animal');
            $(function() {
                md.animal.searchform = $('#md_animal_searchForm').form();

                md.animal.editRow = undefined; //记录当前开启编辑状态的索引
                md.animal.datagrid = $('#md_animal_datagrid').datagrid({
                    url: '${pageContext.request.contextPath}/animalAction!show.action',
                    iconCls: 'icon-save',
                    pagination: true,
                    pageSize: 20,
                    pageList: [20, 40, 80],
                    fit: true,
                    fitColumns: true,
                    nowap: false,
                    border: false,
                    idField: 'animalNo',
                    sortName: 'animalNo',
                    sortOrder: 'asc',
                    columns: [[{

                        field : 'checkbox',
                        checkbox: true
                    },
                    {
                        title: '采样动物代号',
                        field: 'animalNo',
                        width: 100,
                        sortable: true,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: true,
                                validType: 'number'
                            }
                        }
                    },
                    {
                        title: '采样动物名称',
                        field: 'animalName',
                        width: 100,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: true
                            }
                        }
                    },
                    {
                        title: '备注',
                        field: 'animalRemarks',
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
                            if (md.animal.editRow != undefined) {
                                $.messager.alert('提示', '存在未保存的行，请保存', 'error');
                            }

                            if (md.animal.editRow == undefined) {
                                md.animal.datagrid.datagrid('addEditor', [{
                                    field: 'animalNo',
                                    editor: {
                                        type: 'validatebox',
                                        options: {
                                            required: true,
                                            validType: 'number'
                                        }
                                    }
                                },
                                {
                                    field: 'animalName',
                                    editor: {
                                        type: 'validatebox',
                                        options: {
                                            required: true
                                        }
                                    }

                                }]);
                                md.animal.datagrid.datagrid('insertRow', {
                                    index: 0,
                                    row: {}
                                });
                                md.animal.datagrid.datagrid('beginEdit', 0);
                                md.animal.editRow = 0;
                            }

                        }
                    },
                    '-',
                 
                     {
                        text: '删除',
                        iconCls: 'icon-remove',
                        handler: function() {
                            var rows = md.animal.datagrid.datagrid('getSelections');
                            var ids = [];
                            if (rows.length > 0) {
                                $.messager.confirm('请确认', '您确定要删除当前所有选择的项目吗？',
                                function(b) {
                                    if (b) {
                                        var ids = [];
                                        for (var i = 0; i < rows.length; i++) {
                                            ids.push(rows[i].animalNo);
                                        };
    
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/animalAction!delete.action',
                                            //删除
                                            data: {
                                                ids: ids.join(','),
                                            },
                                            dataType: 'json',
                                            success: function(r) {
                                                if (r && r.success) {
                                                    md.animal.datagrid.datagrid('reload');
                                                    md.animal.datagrid.datagrid('unselectAll');
                                                    $.messager.show({
                                                        msg: r.msg,
                                                        title: '成功'
                                                    });
                                                } else {
                                                    md.animal.datagrid.datagrid('unselectAll');
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
                            var rows = md.animal.datagrid.datagrid('getSelections');
                            if (rows.length == 1) {

                                md.animal.datagrid.datagrid('removeEditor', ['animalNo', 'animalName']);

                                if (md.animal.editRow != undefined) {
                                    md.animal.datagrid.datagrid('endEdit', md.animal.editRow);
                                }
                                if (md.animal.editRow == undefined) {
                                    var rowIndex = md.animal.datagrid.datagrid('getRowIndex', rows[0]);
                                    md.animal.datagrid.datagrid('beginEdit', rowIndex);
                                    md.animal.editRow = rowIndex;
                                    md.animal.datagrid.datagrid('unselectAll');
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
                            if(md.animal.datagrid.datagrid('validateRow',0)){
								md.animal.datagrid.datagrid('endEdit',md.animal.editRow);
							}else{
								$.messager.alert('提示','请填全所有的必填项！','warning');
							}
                           
                        }
                    },
                    '-', {
                        text: '撤销',
                        iconCls: 'icon-redo',
                        handler: function() {
                            md.animal.editRow = undefined;
                            md.animal.datagrid.datagrid('rejectChanges');
                            md.animal.datagrid.datagrid('unselectAll');
                        }
                    }],
                    onAfterEdit: function(rowIndex, rowData, changes) {

                        var inserted = md.animal.datagrid.datagrid('getChanges', 'inserted');
                        var updated = md.animal.datagrid.datagrid('getChanges', 'updated');
                        if (inserted.length < 1 && updated < 1) {
                            editRow = undefined;
                            md.animal.datagrid.datagrid('unselectAll');
                            return;
                        }

                        var url = '';
                        if (inserted.length > 0) {
                            url = '${pageContext.request.contextPath}/animalAction!add.action'; //增加
                        };
                        if (updated.length > 0) {
                            url = '${pageContext.request.contextPath}/animalAction!update.action'; //更新
                        };

                        $.ajax({
                            url: url,
                            data: rowData,
                            dataType: 'json',
                            success: function(r) {
                                if (r && r.success) {
                                    md.animal.datagrid.datagrid('acceptChanges');
                                    $.messager.show({
                                        msg: r.msg,
                                        title: '成功'
                                    });
                                } else {
                                    md.animal.datagrid.datagrid('rejectChanges');
                                    $.messager.alert('错误', r.msg, 'error');
                                }
                                md.animal.editRow = undefined;
                                md.animal.datagrid.datagrid('unselectAll');
                            }
                        });

                    },onLoadSuccess:function(){
							md.animal.editRow=undefined; 
							md.animal.datagrid
													.datagrid('unselectAll');
							}

                });

            });
        </script>
    </head>
    
    <body class="easyui-layout" data-options="fit:true,border:false">
        <div data-options="region:'center',border:false">
            <table id="md_animal_datagrid">
            </table>
        </div>
    </body>

</html>