<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>用户列表</title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>       
<script type="text/javascript">
            md.ns('md.user');
            $(function() {
                md.user.editRow = undefined; 
                md.user.datagrid = $('#md_user_datagrid').datagrid({
                    url: '${pageContext.request.contextPath}/userAction!show.action',
                    iconCls: 'icon-save',
                    pagination: true,
                    pageSize: 20,
                    pageList: [20, 40, 80],
                    fit: true,
                    nowap: false,
                    border: false,
                    idField: 'username',
                    sortName: 'username',
                    sortOrder: 'asc',
                    columns: [[
                    {title:'',colspan:3},
                    {title:'数据汇总',colspan:1},
                    {title:'采样地信息',colspan:6},
                    {title:'样品信息',colspan:6},
                    {title:'菌株基本信息',colspan:6},
                    {title:'MIC耐药性信息',colspan:6},
                    {title:'耐药性基因信息',colspan:6},
                    {title:'药品标准信息',colspan:4},
                    {title:'来源编号',colspan:4},
                    {title:'采样动物编号',colspan:4},
                    {title:'菌种编号',colspan:4},
                    ],[
                    {
                        title: '用户名',
                        field: 'username',
                        width: 200,
                        sortable: true,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: true
                            }
                        }
                    },
                    {
                        title: '用户密码',
                        field: 'password',
                        formatter:function(value,row,index){
                        return '******';
                        },
                        width: 100,
                        editor: {
                            type: 'validatebox',
                            options: {
                                required: true
                            }
                        }
                    },
                    {
                        title: '角色',
                        field: 'role',
                        width: 100,
                        editor: {
                            panelHeight: 'auto',
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: '普通用户',
                                    value: '普通用户'
                                },
                                {
                                    label: '管理员',
                                    value: '管理员'
                                }],
                                editable: false,
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                required: true
                            }
                        }
                        
                    },{
                    title: '数据汇总查看权限',
                        field: 'dataSumFucView',
                        width: 100,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    }
                    ,{
                     title: '查看',
                     field: 'farmFucView',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '添加',
                        field: 'farmFucAdd',
                        width: 40,
                        editor: {
                             type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                   
                        }
                    },
                    {
                    title: '删除',
                        field: 'farmFucDelete',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '修改',
                        field: 'farmFucChange',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '导入',
                        field: 'farmFucImport',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '导出',
                        field: 'farmFucExport',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },{
                     title: '查看',
                     field: 'sampleFucView',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '添加',
                        field: 'sampleFucAdd',
                        width: 40,
                        editor: {
                             type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                   
                        }
                    },
                    {
                    title: '删除',
                        field: 'sampleFucDelete',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '修改',
                        field: 'sampleFucChange',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '导入',
                        field: 'sampleFucImport',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '导出',
                        field: 'sampleFucExport',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },{
                     title: '查看',
                     field: 'strainFucView',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '添加',
                        field: 'strainFucAdd',
                        width: 40,
                        editor: {
                             type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                   
                        }
                    },
                    {
                    title: '删除',
                        field: 'strainFucDelete',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '修改',
                        field: 'strainFucChange',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '导入',
                        field: 'strainFucImport',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '导出',
                        field: 'strainFucExport',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },{
                     title: '查看',
                     field: 'micFucView',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '添加',
                        field: 'micFucAdd',
                        width: 40,
                        editor: {
                             type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                   
                        }
                    },
                    {
                    title: '删除',
                        field: 'micFucDelete',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '修改',
                        field: 'micFucChange',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '导入',
                        field: 'micFucImport',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '导出',
                        field: 'micFucExport',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },{
                     title: '查看',
                     field: 'genFucView',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '添加',
                        field: 'genFucAdd',
                        width: 40,
                        editor: {
                             type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                   
                        }
                    },
                    {
                    title: '删除',
                        field: 'genFucDelete',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '修改',
                        field: 'genFucChange',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '导入',
                        field: 'genFucImport',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '导出',
                        field: 'genFucExport',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },{
                     title: '查看',
                     field: 'standardFucView',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '添加',
                        field: 'standardFucAdd',
                        width: 40,
                        editor: {
                             type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                   
                        }
                    },
                    {
                    title: '删除',
                        field: 'standardFucDelete',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '修改',
                        field: 'standardFucChange',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },{
                     title: '查看',
                     field: 'sourceFucView',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '添加',
                        field: 'sourceFucAdd',
                        width: 40,
                        editor: {
                             type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                   
                        }
                    },
                    {
                    title: '删除',
                        field: 'sourceFucDelete',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '修改',
                        field: 'sourceFucChange',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },{
                     title: '查看',
                     field: 'animalFucView',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '添加',
                        field: 'animalFucAdd',
                        width: 40,
                        editor: {
                             type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                   
                        }
                    },
                    {
                    title: '删除',
                        field: 'animalFucDelete',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '修改',
                        field: 'animalFucChange',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },{
                     title: '查看',
                     field: 'strainTypeFucView',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '添加',
                        field: 'strainTypeFucAdd',
                        width: 40,
                        editor: {
                             type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                   
                        }
                    },
                    {
                    title: '删除',
                        field: 'strainTypeFucDelete',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false,
                                 panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    },
                    {
                    title: '修改',
                        field: 'strainTypeFucChange',
                        width: 40,
                        editor: {
                            type: 'combobox',
                            options: {
                                data: [{
                                    label: 'Y',
                                    value: 'Y'
                                },
                                {
                                    label: 'N',
                                    value: 'N'
                                }],
                                editable: false, 
                                panelHeight: 'auto',
                                valueField: 'value',
                                textField: 'label',
                                 required: true
                        }
                        }
                    }
                    ]],
                    toolbar: [{
                        text: '增加',
                        iconCls: 'icon-add',
                        handler: function() {
                            if (md.user.editRow != undefined) {
                                $.messager.alert('提示', '存在未保存的行，请保存', 'error');
                            }

                            if (md.user.editRow == undefined) {
                                md.user.datagrid.datagrid('addEditor', [{
                                    field: 'username',
                                    editor: {
                                        type: 'validatebox',
                                        options: {
                                            required: true,
                                        }
                                    }
                                }]);
                                md.user.datagrid.datagrid('insertRow', {
                                    index: 0,
                                    row: {farmFucView:'Y',
                                          farmFucAdd:'Y',
                                          farmFucDelete:'Y',
                                          farmFucChange:'Y',
                                          farmFucImport:'Y',
                                          farmFucExport:'Y',
                                          sampleFucView:'Y',
                                          sampleFucAdd:'Y',
                                          sampleFucDelete:'Y',
                                          sampleFucChange:'Y',
                                          sampleFucImport:'Y',
                                          sampleFucExport:'Y',
                                          strainFucView:'Y',
                                          strainFucAdd:'Y',
                                          strainFucDelete:'Y',
                                          strainFucChange:'Y',
                                          strainFucImport:'Y',
                                          strainFucExport:'Y',
                                          micFucView:'Y',
                                          micFucAdd:'Y',
                                          micFucDelete:'Y',
                                          micFucChange:'Y',
                                          micFucImport:'Y',
                                          micFucExport:'Y',
                                          genFucView:'Y',
                                          genFucAdd:'Y',
                                          genFucDelete:'Y',
                                          genFucChange:'Y',
                                          genFucImport:'Y',
                                          genFucExport:'Y',
                                          standardFucView:'Y',
                                          standardFucAdd:'Y',
                                          standardFucDelete:'Y',
                                          standardFucChange:'Y',
                                          sourceFucView:'Y',
                                          sourceFucAdd:'Y',
                                          sourceFucDelete:'Y',
                                          sourceFucChange:'Y',
                                          animalFucView:'Y',
                                          animalFucAdd:'Y',
                                          animalFucDelete:'Y',
                                          animalFucChange:'Y',
                                          strainTypeFucView:'Y',
                                          strainTypeFucAdd:'Y',
                                          strainTypeFucDelete:'Y',
                                          strainTypeFucChange:'Y',
                                         }
                                });
                                md.user.datagrid.datagrid('beginEdit', 0);
                                md.user.editRow = 0;
                            }

                        }
                    },
                    '-', {
                        text: '删除',
                        iconCls: 'icon-remove',
                        handler: function() {
                            var rows = md.user.datagrid.datagrid('getSelections');
                            var ids = [];
                            if (rows.length > 0) {
                                $.messager.confirm('请确认', '您确定要删除当前所有选择的项目吗？',
                                function(b) {
                                    if (b) {
                                        var ids = [];
                                        for (var i = 0; i < rows.length; i++) {
                                            ids.push(rows[i].username);
                                        };
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/userAction!delete.action',
                                            data: {
                                                username: ids.join(','),
                                            },
                                            dataType: 'json',
                                            success: function(r) {
                                                if (r && r.success) {
                                                    md.user.datagrid.datagrid('load');
                                                    md.user.datagrid.datagrid('unselectAll');
                                                    $.messager.show({
                                                        msg: r.msg,
                                                        title: '成功'
                                                    });
                                                } else {
                                                    md.user.datagrid.datagrid('unselectAll');
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
                    '-', {
                        text: '修改',
                        iconCls: 'icon-edit',
                        handler: function() {
                            var rows = md.user.datagrid.datagrid('getSelections');
                            if (rows.length == 1) {

                                md.user.datagrid.datagrid('removeEditor', ['username']);

                                if (md.user.editRow != undefined) {
                                    md.user.datagrid.datagrid('endEdit', md.user.editRow);
                                }
                                if (md.user.editRow == undefined) {
                                    var rowIndex = md.user.datagrid.datagrid('getRowIndex', rows[0]);
                                    md.user.datagrid.datagrid('beginEdit', rowIndex);
                                    md.user.editRow = rowIndex;
                                    md.user.datagrid.datagrid('unselectAll');
                                }
                            } else {
                                $.messager.alert('提示', '请选择要修改的一行！', 'warning');
                            }
                        }
                    },
                    '-', {
                        text: '保存',
                        iconCls: 'icon-save',
                        handler: function() {
                            md.user.datagrid.datagrid('endEdit', md.user.editRow);
                        }
                    },
                    '-', {
                        text: '撤销',
                        iconCls: 'icon-redo',
                        handler: function() {
                            md.user.editRow = undefined;
                            md.user.datagrid.datagrid('rejectChanges');
                            md.user.datagrid.datagrid('unselectAll');
                        }
                    }],
                    onAfterEdit: function(rowIndex, rowData, changes) {

                        var inserted = md.user.datagrid.datagrid('getChanges', 'inserted');
                        var updated = md.user.datagrid.datagrid('getChanges', 'updated');
                        if (inserted.length < 1 && updated < 1) {
                            md.user.editRow = undefined;
                            md.user.datagrid.datagrid('unselectAll');
                            return;
                        }

                        var url = '';
                        if (inserted.length > 0) {
                            url = '${pageContext.request.contextPath}/userAction!add.action'; //增加
                        };
                        if (updated.length > 0) {
                            url = '${pageContext.request.contextPath}/userAction!update.action'; //更新
                        };

                        $.ajax({
                            url: url,
                            data: rowData,
                            dataType: 'json',
                            success: function(r) {
                                if (r && r.success) {
                                    md.user.datagrid.datagrid('acceptChanges');
                                    $.messager.show({
                                        msg: r.msg,
                                        title: '成功'
                                    });
                                } else {
                                    md.user.datagrid.datagrid('rejectChanges');
                                    $.messager.alert('错误', r.msg, 'error');
                                }
                                md.user.editRow = undefined;
                                md.user.datagrid.datagrid('unselectAll');
                            }
                        });

                    },onLoadSuccess:function(){
							md.user.editRow=undefined; 
							md.user.datagrid
													.datagrid('unselectAll');
							}

                });

            });
        </script>
    </head>
    
    <body class="easyui-layout" data-options="fit:true,border:false">
        <div data-options="region:'center',border:false">
            <table id="md_user_datagrid">
            </table>
        </div>
    </body>

</html>