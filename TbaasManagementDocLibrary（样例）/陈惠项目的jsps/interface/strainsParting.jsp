﻿<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>菌株信息</title>
<object id="ArgoxWebPrint"
	classid="clsid:AEFC7183-44DE-463c-ACEF-8CAF33B96701"
	codebase="ArgoxWebPrint.cab"> </object>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>
<script type="text/javascript">
            md.ns('md.parting');
            $(function() {
                md.parting.searchform = $('#md_parting_searchForm').form();
                md.parting.editRow = undefined;
                md.parting.datagrid = $('#md_parting_datagrid').datagrid({
                    url: '${pageContext.request.contextPath}/strainCodingAction!show.action',
                    pagination: true,
                    pageSize: 100,
                    pageList: [100, 500, 1000],
                    fit: true,
                    fitColumns: false,
                    nowap: false,
                    border: false,
                    idField: 'strainNo',
                    sortName: 's.addTime',
                    sortOrder: 'desc',
                    frozenColumns : [ [ {
                        field : 'checkbox',
                        checkbox: true
                    },
                    {
                        title: '菌株编号',
                        field: 'strainNo',
                        width: 100,
                        sortable: true,
                    },
                    
                    {
                        title: '内部编号',
                        field: 'strainAlias',
                        width: 100,
                        sortable: true,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    },
                    {
                        title: '样品编号',
                        field: 'sampleNo',
                        width: 100,
                        sortable: true,
                        editor: {
                            type: 'combobox',
                            options: {
                                mode: 'remote',
                                editable: false,
                                textField: 'sampleNo',
                                valueField: 'sampleNo',
                                url: '${pageContext.request.contextPath}/sampleAction!getSampleNo.action'
                            }
                        }
                    }] ],
                    columns: [[
                    {
                        field: 'strainCategory',
                        title: '菌属',
                        width: 100,
                        sortable: true,
                        editor: {
                            type: 'combobox',
                              options: {
                                            required: true,
                                            editable: true,
                                            mode: 'remote',
                                            textField: 'strainCategory',
                                            valueField: 'strainCategory',
                                            url: '${pageContext.request.contextPath}/strainToNotesAction!getStrainCategory.action',
                                           onSelect:function(record){
                                var row = md.parting.datagrid.datagrid('getSelected');
                                var target = md.parting.datagrid.datagrid('getEditor', {'index':rowIndex+1,'field':'strainType'}).target;
								target.combobox('clear'); 
								var url = '${pageContext.request.contextPath}/strainToNotesAction!getStrainNameByStrainCategory.action?strainCategory='+record.strainCategory;
								alert(record.strainCategory);
								target.combobox('reload', url);
                                }
                            }
                        }
                    },
                   {
                        title: '菌种',
                        field: 'strainType',
                        width: 100,
                        sortable: true,
                        editor: {
                            type: 'combobox',
                            options: {
                                mode: 'remote',
                                editable: true,
                                url: '${pageContext.request.contextPath}/strainToNotesAction!getStrainName.action',
                                valueField: 'strainName',
                                textField: 'strainName'
                            }
                        }
                    },                   
                     {
                        title: '保存时间',
                        field: 'strainStorageDateOFString',
                        width: 100,
                        sortable: true,
                        editor: {
                            type: 'datebox',
                            options: {
                            }
                        }
                    },
                    {
                        title: '血清型',
                        field: 'serotype',
                        width: 100,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    },
                    {
                        title: 'MLST分型',
                        field: 'strainMlst',
                        width: 100,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    },
                    {
                        title: 'PLG分型',
                        field: 'strainPlg',
                        width: 100,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    },
                    {
                        title: '菌种鉴定人',
                        field: 'operator',
                        width: 100,
                        sortable: true,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    },
                    {
                        title: '细菌分型人',
                        field: 'strainParter',
                        width: 100,
                        sortable: true,
                        editor: {
                            type: 'text',
                            options: {}
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
                        title: '养殖场名称',
                        field: 'sampleFarmAddr',
                        width: 200,
                        sortable: true,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    },
                    {
                        title: '日龄',
                        field: 'sampleAnimalAge',
                        width: 100,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    },
                    {
                    	title: '来源',
                        field: 'sampleSource',
                        width: 100,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    },
                    {
                        title: '部位',
                        field: 'sampleCollectionPart',
                        width: 50,
                        sortable: true,
                        editor: {
                            type: 'text',
                            options: {
                            }
                        }
                    },
                    {
                        title: '采样人员',
                        field: 'sampleCollector',
                        width: 150,
                        sortable: true,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    },
                    {
                        title: '动物用药史',
                        field: 'sampleMedicalHistory',
                        width: 150,
                        sortable: true,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    },
                    {
                        title: '菌株备注',
                        field: 'strainRemarks',
                        width: 100,
                        editor: {
                            type: 'text',
                            options: {}
                        }
                    }]],
                    toolbar: [
                    
                    {
                        text: '增加',
                        iconCls: 'icon-add',
                        handler: function() {
                            if (md.parting.editRow != undefined) {
                                $.messager.alert('提示', '存在未保存的行，请保存', 'error');
                                return;
                            }
                            if (md.parting.editRow == undefined) {
                                //md.parting.datagrid.datagrid('removeEditor', ['serotype', 'strainMlst', 'strainPlg']);
                                md.parting.datagrid.datagrid('removeEditor', ['strainNo',  'sampleNo','sampleFarmAddr','sampleAnimalAge','sampleSource','sampleCollectionPart','sampleCollector','sampleMedicalHistory']);

                                var rows = md.parting.datagrid.datagrid('getSelections');
                                var rowIndex; 
                                 //alert(rows[0].sampleFarmAddr);

                                 if(rows.length==0){
                                  rowIndex=-1;
                                 }else{
                                   rowIndex = md.parting.datagrid.datagrid('getRowIndex', rows[0]); 
                                 }       
                                
                                 md.parting.datagrid.datagrid('addEditor', [{
                                    field: 'sampleNo',
                                    editor: {
                                        type: 'combobox',
                                        options: {
                                            required: true,
                                            mode: 'remote',
                                            textField: 'sampleNo',
                                            valueField: 'sampleNo',
                                            url: '${pageContext.request.contextPath}/sampleAction!getSampleNo.action',
                                            onSelect : function(record) {
													
													var url = '${pageContext.request.contextPath}/sampleAction!getSample.action?sampleNo='
														 + record.sampleNo;
													//alert(record.sampleNo);
													 $.ajax({
                                                          url: url,                                           
                                                          dataType: 'json',
                                                          success: function(r) {
                                                                                       
                                                              $(".datagrid-row-editing >td[field=sampleFarmAddr]").text(r.sampleFarmAddr);
                                                              $(".datagrid-row-editing >td[field=sampleAnimalAge]").text(r.sampleAnimalAge);
                                                              $(".datagrid-row-editing >td[field=sampleSource]").text(r.sampleSource);
                                                              $(".datagrid-row-editing >td[field=sampleCollectionPart]").text(r.sampleCollectionPart);
                                                              $(".datagrid-row-editing >td[field=sampleCollector]").text(r.sampleCollector);
                                                              $(".datagrid-row-editing >td[field=sampleMedicalHistory]").text(r.sampleMedicalHistory);
                                                              
																 										
                                                          }
                                                     });
													
											}
                                        }
                                    }
                                },
                                {
                                    field: 'strainCategory',
                                    editor: {
                                        type: 'combobox',
                                        options: {
                                            required: true,
                                            editable: true,
                                            mode: 'remote',
                                            textField: 'strainCategory',
                                            valueField: 'strainCategory',
                                            url: '${pageContext.request.contextPath}/strainToNotesAction!getStrainCategory.action',
                                           onSelect:function(record){
                                var row = md.parting.datagrid.datagrid('getSelected');
                                var target = md.parting.datagrid.datagrid('getEditor', {'index':rowIndex+1,'field':'strainType'}).target;
								target.combobox('clear'); 
								var url = '${pageContext.request.contextPath}/strainToNotesAction!getStrainNameByStrainCategory.action?strainCategory='+record.strainCategory;
								//alert(record.strainCategory);
								target.combobox('reload', url);
                                }
                                        }
                                    }
                                },
                                {
                                    field: 'strainType',
                                    editor: {
                                        id:'strainType_combobox',
                                        type: 'combobox',
                                        options: {
                                            url: '${pageContext.request.contextPath}/strainToNotesAction!getStrainName.action',
                                            valueField: 'strainName',
                                            textField: 'strainName'
                                        }
                                    }
                                }]);
                                
                                 if (rows.length == 1) {
                                     
                                     var sampleNo1 = rows[0].sampleNo;
                                     var sampleFarmAddr1 = rows[0].sampleFarmAddr;
                                     var sampleAnimalAge1 = rows[0].sampleAnimalAge;
                                     var sampleSource1 = rows[0].sampleSource;
                                     var sampleCollectionPart1 = rows[0].sampleCollectionPart;
                                     var sampleCollector1 = rows[0].sampleCollector;
                                     var sampleMedicalHistory1 = rows[0].sampleMedicalHistory;
                                     
                                     md.parting.datagrid.datagrid('unselectAll');                           
                                     md.parting.datagrid.datagrid('insertRow', {
                                        index: rowIndex+1,
                                        
                                        row: {sampleNo: sampleNo1,sampleFarmAddr:sampleFarmAddr1,sampleAnimalAge:sampleAnimalAge1,sampleSource:sampleSource1,sampleCollectionPart:sampleCollectionPart1,sampleCollector:sampleCollector1,sampleMedicalHistory:sampleMedicalHistory1}
                                     });
                                  
                                     md.parting.datagrid.datagrid('beginEdit', rowIndex+1);
                                     md.parting.editRow = rowIndex+1;
                                          
                                     } else if (rows.length == 0) {
                     
     
                                     md.parting.datagrid.datagrid('insertRow', {
                                         index: 0,
                                         row: {}
                                     });

                                     md.parting.datagrid.datagrid('beginEdit', 0);
                                     md.parting.editRow = 0;
                     
                                     }else {
                                     $.messager.alert('提示', '请选择要在其下面添加的一行！', 'warning');
                                     }
                            }
                        }
                    },
                    '-', 
                   
                    {
                        text: '删除',
                        iconCls: 'icon-remove',
                        handler: function() {
                        if (md.parting.editRow != undefined) {
                                $.messager.alert('提示', '存在未保存的行，请保存', 'error');
                                return;
                            }
                            var rows = md.parting.datagrid.datagrid('getSelections');
                            if (rows.length > 0) {
                                $.messager.confirm('请确认', '您确定要删除当前所有选择的项目吗？',
                                function(b) {
                                    if (b) {
                                        var ids = [];
                                        for (var i = 0; i < rows.length; i++) {
                                            ids.push(rows[i].strainNo);
                                        };
                                        $.ajax({
                                            url: '${pageContext.request.contextPath}/strainCodingAction!delete.action',
                                            data: {
                                                ids: ids.join(','),
                                            },
                                            dataType: 'json',
                                            success: function(r) {
                                                if (r && r.success) {
                                                    md.parting.datagrid.datagrid('reload');
                                                    md.parting.datagrid.datagrid('unselectAll');
                                                    $.messager.show({
                                                        msg: r.msg,
                                                        title: '成功'
                                                    });
                                                } else {
                                                    md.parting.datagrid.datagrid('unselectAll');
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
                        if (md.parting.editRow != undefined) {
                                $.messager.alert('提示', '存在未保存的行，请保存', 'error');
                                return;
                            }
                            var rows = md.parting.datagrid.datagrid('getSelections');
                            if (rows.length == 1) {
                                md.parting.datagrid.datagrid('removeEditor', ['strainNo', 'sampleNo','sampleFarmAddr','sampleAnimalAge','sampleSource','sampleCollectionPart','sampleCollector','sampleMedicalHistory']);
                                md.parting.datagrid.datagrid('addEditor', [{
                                    field: 'serotype',
                                    editor: {
                                        type: 'text',
                                        options: {}
                                    }
                                },
                                {
                                    field: 'strainMlst',
                                    editor: {
                                        type: 'text',
                                        options: {}
                                    }
                                },
                                {
                                    field: 'strainPlg',
                                    editor: {
                                        type: 'text',
                                        options: {}
                                    }
                                }

                                ]);
                                if (md.parting.editRow == undefined) {
                                    var rowIndex = md.parting.datagrid.datagrid('getRowIndex', rows[0]);
                                    md.parting.datagrid.datagrid('beginEdit', rowIndex);
                                    md.parting.editRow = rowIndex;
                                    md.parting.datagrid.datagrid('unselectAll');
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
                        
                            if(md.parting.datagrid.datagrid('validateRow',0)){
						         md.parting.datagrid.datagrid('endEdit',md.parting.editRow);
					        }else{
						         $.messager.alert('提示','请填全所有的必填项！','warning');
					        }
                            
                        }
                    },
                    '-', {
                        text: '撤销',
                        iconCls: 'icon-redo',
                        handler: function() {
                            md.parting.editRow = undefined;
                            md.parting.datagrid.datagrid('rejectChanges');
                            md.parting.datagrid.datagrid('unselectAll');
                        }
                    },
                    '-',
                    
                     {
                        text: '导入编号',
                        iconCls: 'icon-tip',
                        handler: function() {
                            $('#md_parting_exp').dialog({
                                title: '编号导入',
                                href: '../upload/coding_upload.jsp',
                                cache: false,
                                fit: true,
                                 onClose:function(){
                                    md.parting.datagrid.datagrid('load', {});
                            }
                            });
                        }
                    },
                    '-', {
                        text: '导入分型信息',
                        iconCls: 'icon-sum',
                        handler: function() {
                            $('#md_parting_exp').dialog({
                                title: '导入',
                                href: '../upload/strains_upload.jsp',
                                cache: false,
                                fit: true,
                                 onClose:function(){
                                    md.parting.datagrid.datagrid('load', {});
                            }
                            });
                        }
                    },
                    '-',
                   
					 {
                        text: '导出excel',
                        iconCls: 'icon-undo',
                        handler: function() {
                            var rows = md.parting.datagrid.datagrid('getSelections');
                            if (rows.length > 0) {
                                $.messager.confirm('请确认', '您确定要导出当前所有选择的项目到excel吗？',
                                function(b) {
                                    if (b) {
                                        var ids = [];
                                        for (var i = 0; i < rows.length; i++) {
                                            ids.push(rows[i].strainNo);
                                        };
                                        
                                        
                                        (function(){
												var temp = document.createElement("form");        
                                                temp.action = '${pageContext.request.contextPath}/downloadAction!getStrainExcel.action';        
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
                                $.messager.alert('提示', '请选择要导出的数据', 'warning');
                            }
                        }
                    },
                    '-', 
                   
                    {
                        text: '打印标签',
                        iconCls: 'icon-print',
                        handler: function() {
                            var rows = md.parting.datagrid.datagrid('getSelections');
                            if (rows.length >0) {
                            for(var i=0;i<rows.length;i++)
                            Print(rows[i].strainStorageDate==undefined?"":rows[i].strainStorageDate,rows[i].strainAlias==undefined?"":rows[i].strainAlias, rows[i].strainNo,rows[i].strainIdentifier==undefined?"":rows[i].strainIdentifier);
                            } else {
                                $.messager.alert('提示', '请选择要打印的标签', 'warning');
                            }
                        }
                    }],
                    onAfterEdit: function(rowIndex, rowData, changes) {
                        var inserted = md.parting.datagrid.datagrid('getChanges', 'inserted');
                        var updated = md.parting.datagrid.datagrid('getChanges', 'updated');
                        if (inserted.length < 1 && updated.length < 1) {
                            editRow = undefined;
                            md.parting.datagrid.datagrid('unselectAll');
                            return
                        }
                        var url = '';
                        if (inserted.length > 0) {
                            url = '${pageContext.request.contextPath}/strainCodingAction!add.action';
                        };
                        if (updated.length > 0) {
                            url = '${pageContext.request.contextPath}/strainCodingAction!update.action';
                        };
                        $.ajax({
                            url: url,
                            data: rowData,
                            dataType: 'json',
                            success: function(r) {
                                if (r && r.success) {
                                    md.parting.datagrid.datagrid('acceptChanges');
                                    md.parting.datagrid.datagrid('reload', {});
                                    $.messager.show({
                                        msg: r.msg,
                                        title: '成功'
                                    });
                                    md.parting.editRow = undefined;
                                    md.parting.datagrid.datagrid('unselectAll');
                                } else {
                                    md.parting.datagrid.datagrid('beginEdit', rowIndex);
                                    md.parting.editRow = rowIndex;
                                    $.messager.alert('错误', r.msg, 'error');
                                }
                            }
                        });
                    },
                    onLoadSuccess: function() {
                        md.parting.editRow = undefined;
                        md.parting.datagrid.datagrid('clearSelections');
                        md.parting.datagrid.datagrid('unselectAll');
                    }
                });
                md.parting.search = function() {
                    md.parting.datagrid.datagrid('load', md.serializeObject(md.parting.searchform));
                };
                md.parting.cleanSearch = function() {
                    $("#strainType_com").combobox('clear');
                    $("#strainCategory_com").combobox('clear');
                    md.parting.datagrid.datagrid('load', {});
                    md.parting.searchform.find('input').val('');
                };
                function Print(date,innerNo,no,people) {
                  //  console.info(date+innerNo+no+people);
                 ArgoxWebPrint.B_EnumUSB();
                 ArgoxWebPrint.B_CreateUSBPort(1);
                 ArgoxWebPrint.B_Set_Darkness(14);
	             ArgoxWebPrint.B_Set_Backfeed("F");
                 ArgoxWebPrint.B_Set_Speed(3);
	             ArgoxWebPrint.B_Bar2d_QR(20, 15, 2, 6, 'M', 'M', 12, 15, 30, "B0070http://202.116.161.88:8080/DrugDetail?strainNo="+no);
	             ArgoxWebPrint.B_Prn_Text_TrueType(250, 80, 30, "宋体", 4, 700, 0, 0, 0, "A3", innerNo);
	             ArgoxWebPrint.B_Prn_Text_TrueType(300, 60, 30, "宋体", 4, 700, 0, 0, 0, "A4", date);
                 ArgoxWebPrint.B_Prn_Text_TrueType(350, 60, 30, "宋体", 4, 700, 0, 0, 0, "A5", no);
	             ArgoxWebPrint.B_Prn_Text_TrueType(400, 80, 30, "宋体", 4, 700, 0, 0, 0, "A6", people);
                 ArgoxWebPrint.B_Print_Out(1);
                 ArgoxWebPrint.B_ClosePrn();  
                }
            });
            function search() {     
                if (event.keyCode == "13") {//keyCode=13回车键                  
                    md.parting.search().click();               
                }
            }          
</script>
</head>

<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',border:false"
		style="height:117px;width:100%;background: #F4F4F4;border-bottom:1px solid #dddddd">
		<form id="md_parting_searchForm">
			<table class="tableform" style="width:80%;height:100%">
				<tr>
					<td noWrap>菌株编号</td>
					<td><input name="strainNo" onkeydown="search();" />
					</td>
					<td noWrap>样品编号</td>
					<td><input name="sampleNo" onkeydown="search();" />
					</td>
					<td noWrap>菌属</td>
					<td><input name="strainCategory" id="strainCategory_com"
						onkeydown="search();" class="easyui-combobox"
						data-options="
                            mode: 'remote',
                            textField: 'strainCategory',
                            valueField: 'strainCategory',
                            url: '${pageContext.request.contextPath}/strainToNotesAction!getStrainCategory.action',
                            multiple: true
                            " />
					</td>
					<td noWrap>菌种</td>
					<td><input name="strainType" id="strainType_com"
						class="easyui-combobox"
						data-options="
                            url: '${pageContext.request.contextPath}/strainToNotesAction!getStrainName.action',
                            valueField: 'strainName',
                            textField: 'strainName',
                            multiple: true
                            " />
					</td>
				</tr>
				<tr>
					<td noWrap>内部编号</td>
					<td><input name="strainAlias" onkeydown="search();" /></td>
					<td noWrap>血清型</td>
					<td><input name="serotype" onkeydown="search();" />
					</td>
					<td noWrap>MLST分型</td>
					<td><input name="strainMlst" onkeydown="search();" />
					</td>
					<td noWrap>PLG分型</td>
					<td><input name="strainPlg" onkeydown="search();" />
					</td>
				</tr>
				<tr>
					<td noWrap>菌种鉴定人</td>
					<td><input name="operator" onkeydown="search();" />
					</td>
					<td noWrap>细菌分型人</td>
					<td><input name="strainParter" onkeydown="search();" />
					</td>
					<td noWrap>保菌时间</td>
					<td noWrap colspan="3"><input name="beginDate" class="easyui-datebox"
						style="width:125px;" onkeydown="search();" /> 至 <input
						name="endDate" class="easyui-datebox"
						data-options="editable:false" style="width:125px;"
						onkeydown="search();" />
					</td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td noWrap><a href="javascript:void(0);" class="easyui-linkbutton"
						onclick="md.parting.search();"> 查询 </a> <a
						href="javascript:void(0);" class="easyui-linkbutton"
						onclick="md.parting.cleanSearch();"> 清空 </a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="md_parting_datagrid">
		</table>
	</div>
	<div id="md_parting_exp"></div>
	<div id="md_parting_print"></div>
</body>
</html>