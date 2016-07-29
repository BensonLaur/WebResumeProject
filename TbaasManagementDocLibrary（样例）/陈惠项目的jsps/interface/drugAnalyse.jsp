<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>视图</title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>
<style type="text/css">
table.gridtable {
	font-family: verdana,arial,sans-serif;
	font-size:11px;
	color:#333333;
	border-width: 1px;
	border-color: #666666;
	border-collapse: collapse;
}
table.gridtable th {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #dedede;
}
table.gridtable td {
	border-width: 1px;
	padding: 8px;
	border-style: solid;
	border-color: #666666;
	background-color: #ffffff;
}
</style>
<script type="text/javascript">
	md.ns('md.drugView');
	$(function() {
		md.drugView.searchform = $('#md_drugView_searchform').form();
		md.drugView.editRow = undefined;
		md.drugView.datagrid = $('#md_drugView_datagrid')
				.datagrid(
						{
							url : '${pageContext.request.contextPath}/drugViewAction!show.action',
							iconCls : 'icon-save',
							pagination : true,
							pageSize : 100,
							pageList : [ 100, 500, 1000 ],
							fit : true,
							fitColumns : false,
							nowap : false,
							border : false,
							idField : 'strainNo',
							sortName : 'strainNo',
							sortOrder : 'desc',
							frozenColumns : [ [ {
								field : 'checkbox',
								checkbox : true
							}, {
								title : '菌株号',
								field : 'strainNo',
								sortable : true,
								width : 100
							}, {
								title : '内部编号',
								field : 'strainAlias',
								sortable : true,
								width : 100
							} ] ],
							columns : [ [
									{
										title : '样品编号',
										field : 'sampleNo',
										sortable : true,
										width : 100
									},
									{
										title : '采样时间',
										sortable : true,
										field : 'sampleDate',
										width : 150
									},
									{
										title : '采样省份',
										sortable : true,
										field : 'sampleProvince',
										width : 60
									},
									{
										title : '采样地名称',
										sortable : true,
										//field : 'sampleAddr',
										field : 'farmName',
										width : 150
									},
									{
										title : '养殖场名称',
										sortable : true,
										field : 'sampleFarmAddr',
										width : 150
									},
									{
										title : '动物',
										sortable : true,
										field : 'animalName',
										width : 80
									},
									{
										title : '日龄',
										sortable : true,
										field : 'sampleAnimalAge',
										width : 60
									},
									{
										title : '来源',
										sortable : true,
										field : 'sampleSource',
										width : 70
									},
									{
										title : '部位',
										sortable : true,
										field : 'sampleCollectionPart',
										width : 80
									},
									{
										title : '采样人员',
										sortable : true,
										field : 'sampleCollector',
										width : 150
									},
									{
										title : '动物用药史',
										sortable : true,
										field : 'sampleMedicalHistory',
										width : 150
									},
									{
										title : '样品备注',
										sortable : true,
										field : 'sampleRemarks',
										width : 100
									},
									{
										title : '菌属',
										sortable : true,
										field : 'strainCategory',
										width : 100
									},
									{
										title : '菌种',
										sortable : true,
										field : 'strainType',
										width : 100
									},
									{
										title : '保存时间',
										sortable : true,
										field : 'strainStorageDate',
										width : 150
									},
									{
										title : '血清型',
										sortable : true,
										field : 'serotype',
										width : 100
									},
									{
										title : 'MLST分型',
										sortable : true,
										field : 'strainMlst',
										width : 100
									},
									{
										title : 'PLG分型',
										sortable : true,
										field : 'strainPlg',
										width : 100
									},
									{
										title : '菌种鉴定人',
										sortable : true,
										//field : 'strainIdentifier',
										field : 'strainOperator',
										width : 100
									},
									{
										title : '细菌分型人',
										sortable : true,
										field : 'strainParter',
										width : 100
									},
									{
										title : '菌株基本信息备注',
										sortable : true,
										field : 'strainRemarks',
										width : 120
									},
									{
										title : '<label title="氨苄西林" class="easyui-tooltip">AMP</lable>',
										field : 'amp',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="苯唑西林" class="easyui-tooltip">OXA</lable>',
										field : 'oxa',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="青霉素" class="easyui-tooltip">PEN</lable>',
										field : 'pen',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="哌拉西林" class="easyui-tooltip">PIP</lable>',
										field : 'pip',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="他唑巴坦" class="easyui-tooltip">TZP</lable>',
										field : 'tzp',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="头孢他啶" class="easyui-tooltip">CAZ</lable>',
										field : 'caz',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="头孢噻呋" class="easyui-tooltip">CFZ</lable>',
										field : 'cfz',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="头孢喹肟" class="easyui-tooltip">CQM</lable>',
										field : 'cqm',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="头孢曲松" class="easyui-tooltip">CRO</lable>',
										field : 'cro',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="头孢噻肟" class="easyui-tooltip">CTX</lable>',
										field : 'ctx',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="头孢吡肟" class="easyui-tooltip">FEP</lable>',
										field : 'fep',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="头孢西丁" class="easyui-tooltip">FOX</lable>',
										field : 'fox',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="阿米卡星" class="easyui-tooltip">AMK</lable>',
										field : 'amk',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="安普霉素" class="easyui-tooltip">APR</lable>',
										field : 'apr',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="庆大霉素" class="easyui-tooltip">GEN</lable>',
										field : 'gen',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="新霉素" class="easyui-tooltip">NEO</lable>',
										field : 'neo',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="奈替米星" class="easyui-tooltip">NET</lable>',
										field : 'net',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="链霉素" class="easyui-tooltip">STR</lable>',
										field : 'str',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="妥布霉素" class="easyui-tooltip">TOB</lable>',
										field : 'tob',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="多西环素" class="easyui-tooltip">DOX</lable>',
										field : 'dox',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="米诺环素" class="easyui-tooltip">MIN</lable>',
										field : 'min',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="四环素" class="easyui-tooltip">TET</lable>',
										field : 'tet',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="氯霉素" class="easyui-tooltip">CHL</lable>',
										field : 'chl',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="氟甲砜霉素" class="easyui-tooltip">FFC</lable>',
										field : 'ffc',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="阿奇霉素" class="easyui-tooltip">AZM</lable>',
										field : 'azm',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="红霉素" class="easyui-tooltip">ERY</lable>',
										field : 'ery',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="利福平" class="easyui-tooltip">RIF</lable>',
										field : 'rif',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="替考拉宁" class="easyui-tooltip">TEC</lable>',
										field : 'tec',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="万古霉素" class="easyui-tooltip">VAN</lable>',
										field : 'van',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="克林霉素" class="easyui-tooltip">CLI</lable>',
										field : 'cli',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="黏菌素" class="easyui-tooltip">CL</lable>',
										field : 'cl',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="亚胺培南" class="easyui-tooltip">IMP</lable>',
										field : 'imp',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="美罗培南" class="easyui-tooltip">MEM</lable>',
										field : 'mem',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="泰妙菌素" class="easyui-tooltip">TIA</lable>',
										field : 'tia',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="沃尼妙林" class="easyui-tooltip">VAL</lable>',
										field : 'val',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="磷霉素" class="easyui-tooltip">FOS</lable>',
										field : 'fos',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="呋喃妥因" class="easyui-tooltip">NIT</lable>',
										field : 'nit',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="磺胺甲噁唑" class="easyui-tooltip">SXT</lable>',
										field : 'sxt',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="甲氧苄啶" class="easyui-tooltip">TMP</lable>',
										field : 'tmp',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="环丙沙星" class="easyui-tooltip">CIP</lable>',
										field : 'cip',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="左氧氟沙星" class="easyui-tooltip">LEV</lable>',
										field : 'lev',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="萘啶酸" class="easyui-tooltip">NAL</lable>',
										field : 'nal',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="诺氟沙星" class="easyui-tooltip">NOR</lable>',
										field : 'nor',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="氧氟沙星" class="easyui-tooltip">OFX</lable>',
										field : 'ofx',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="利奈唑胺" class="easyui-tooltip">LZD</lable>',
										field : 'lzd',
										width : 52,
										sortable : true,
										align : 'center'

									},
									{
										title : '<label title="OQX" class="easyui-tooltip">OQX</lable>',
										field : 'oqx',
										width : 52,
										sortable : true,
										align : 'center'

									}, {
										title : '实验人员',
										field : 'micdetector',
										sortable : true,
										width : 100
									}, {
										title : '实验方式',
										field : 'micdetectionType',
										sortable : true,
										width : 100

									}, {
										title : 'MIC备注',
										field : 'micRemarks',
										width : 100,
										sortable : true,
										align : 'center'
                                    }, {
										title : '耐药基因',
										field : 'genname',
										width : 100,
										sortable : true,
										align : 'center'
									}, {
										title : '插入元件',
										field : 'iseq',
										width : 100,
										sortable : true,
										align : 'center'
									}, {
										title : '复制子',
										field : 'replicon',
										width : 100,
										sortable : true,
										align : 'center'
									}, {
										title : '接合子',
										field : 'genTc',
										width : 100,
										sortable : true,
										align : 'center'
									}, {
										title : '操作人',
										field : 'genOperator',
										width : 100,
										sortable : true,
										align : 'center'//居中显示				
									} ] ],
							toolbar : [
									{
										text : '导出数据',
										iconCls : 'icon-redo',
										handler : function() {
											var rows = md.drugView.datagrid
													.datagrid('getSelections');
											if (rows.length > 0) {
												$.messager
														.confirm(
																'请确认',
																'您确定要导出当前所有选择的项目到excel吗？',
																function(b) {//将数据的总id放进数组ids，然后打开文件对话窗口
																	if (b) {
																		var ids = [];
																		for ( var i = 0; i < rows.length; i++) {
																			ids
																					.push(rows[i].strainNo);
																		}
																		;

																		(function() {
																			var temp = document
																					.createElement("form");
																			temp.action = '${pageContext.request.contextPath}/downloadAction!getDrugViewExcel.action';
																			temp.method = "post";
																			temp.style.display = "none";

																			var opt = document
																					.createElement("input");
																			opt.value = ids;
																			opt.name = 'ids';
																			//alert(opt.value);
																			temp
																					.appendChild(opt);

																			document.body
																					.appendChild(temp);
																			temp
																					.submit();

																		})();
																	}
																});
											} else {
												$.messager.alert('提示',
														'请选择要导出的数据', 'warning');
											}
										}
									},
									{
										text : '撤销选中',
										iconCls : 'icon-undo',
										handler : function() {
											md.drugView.datagrid
													.datagrid('unselectAll');
										}
									} ]

						});

		$("#md_drugView_searchform input[name='animalName']")//下拉框动物总类
				.combobox(
						{
							id : 'sampleAnimal_com',
							mode : 'remote',//下拉列表框从服务器加在数据，请求参数为p
							textField : 'animalName',
							valueField : 'animalName',
							url : '${pageContext.request.contextPath}/animalAction!getAnimal.action',

						});
		$("#md_drugView_searchform input[name='sampleSource']")//来源
				.combobox(
						{
							mode : 'remote',
							textField : 'sourceName',
							valueField : 'sourceName',
							url : '${pageContext.request.contextPath}/sourceAction!getSource.action',

						});
		$("#md_drugView_searchform input[name='sampleProvince']")//省份
				.combobox(
						{
							mode : 'remote',
							textField : 'label',
							valueField : 'label',
							url : '${pageContext.request.contextPath}/suggestAction!getProvince.action',

						});
		
		/* $("#province_jcl")//待加省份 time:2015-8-31;name:linjinxia;
				.combobox(
						{
							method : 'post',
							editable : false,
							multiple : true,
							maxsize:3,
							width : 148,
							panelWidth : 148,
							mode : 'remote',
							textField : 'label',
							valueField : 'label',
							url : '${pageContext.request.contextPath}/suggestAction!getProvince.action',

						}); */
						
        $("#hidCombobox").combobox({
            url: 'combobox_drugAnalyseHidCol.json',
			method: 'post',
			editable: false,
			multiple: true,
			valueField: 'field',
			textField: 'text',
			panelWidth: 100,	
			width: 120,				
			onSelect: function(record){	//选中		  
				  var field = record.field; 
				  var title = md.drugView.datagrid.datagrid('getColumnFields'); 
				  for (i in title){		
		              if(title[i] == field){
		                   md.drugView.datagrid.datagrid('hideColumn',title[i]);//隐藏该列	                        	  		              	                 		                  		                 	                		                      		                   		                        	                                         
		                   break;	                   		                                		                   		                 		                    		                          
		              }                    
		         }	
		         $("#hidCombobox").combobox(showPanel); //让下拉框不收缩回去				 
			},
            onUnselect: function(record){
				  var field = record.field; 
				  var title = md.drugView.datagrid.datagrid('getColumnFields');//返回列字段	 
				  for (i in title){		
		              if(title[i] == field){
		                  md.drugView.datagrid.datagrid('showColumn',title[i]);	  		                 	              	  		              	                 		                  		                                 		                      
		                  break;   		                 		                    		                          
		              }                    
		         }	
		         $("#hidCombobox").combobox(showPanel); 				 
			}
       });
       
		$("#medicalName").combobox({//图表——药物名字
			url : 'combobox_drugAnalyseDrug.json',
			method : 'post',
			multiple : true,
			editable : false,
			maxsize:3,
			valueField : 'id',
			textField : 'text',
			width : 148,//输入框宽度
			panelWidth : 100,	//下拉列表框宽度		
		});
		$("#medicalName1").combobox({//查询框——药物名字
			url : 'combobox_drugAnalyseDrug.json',
			method : 'post',
			editable : false,
			valueField : 'id',
			textField : 'text',
			width : 80,
			panelWidth : 80
				
		});
		$("#standardName").combobox(//标准名称
						{
							url : '${pageContext.request.contextPath}/standardMicAction!getStandardName.action',
							method : 'post',
							editable : false,
							valueField : 'standardName',
							textField : 'standardName',
							width : 148,
							panelWidth : 148,
						});
		$("#date").combobox({
			url : 'combobox_drugAnalyseDate.json',
			method : 'post',
			editable : false,
			valueField : 'id',
			textField : 'text',
			width : 148,
			panelWidth : 148,
		});
		$("#strainName")//菌种名
				.combobox(
						{
							url : '${pageContext.request.contextPath}/standardMicAction!getStrainName.action',
							method : 'post',
							editable : false,
							valueField : 'strainName',
							textField : 'strainName',
							width : 148,
							panelWidth : 148,
						});
		/* @author:linjinxia; reason:增加检出率的省份以及统计方式的下拉框; time:2015-8-6 */				
		$("#strainName_jcl").combobox(//检出率——菌种名
						{
							url : '${pageContext.request.contextPath}/drugViewAction!getStrainCategoryAndName.action',
							method : 'post',
							editable : false,
							valueField : 'strainName',
							textField : 'strainName',
							width : 148,
							panelWidth : 148,
						});
						
		$("#date_jcl").combobox(//检出率——统计方式
						{
							url : 'combobox_drugAnalyseDate.json',
							method : 'post',
							editable : false,
							valueField : 'id',
							textField : 'text',
							width : 148,
							panelWidth : 148,
						});
		
		/* 查询 button */
		md.drugView.search = function() {

		var strainNo1 = $("#strainNo").val(),//菌株号
			strainAlias1 = $("#strainAlias").val(),//内部编号
			beginDate1 = $("#beginDate").datebox('getValue'),//开始时间
			endDate1 = $("#endDate").datebox('getValue'),//结束时间
			sampleProvince1 = $("#sampleProvince_com").combobox('getValue'),//省份
			farmName1 = $("#farmName").val(),//采样地名称
			sampleFarmAddr1 = $("#sampleFarmAddr").val(),//养殖场名称
			animalName1 = $("#animalName").combobox('getValue'),//动物
			sampleAnimalAge1 = $("#sampleAnimalAge").val(),//日龄
			sampleSource1 = $("#sampleSource").combobox('getValue'),//来源
			sampleCollectionPart1 = $("#sampleCollectionPart").val();//部位
			var s = "";
			if(strainNo1 != ""){
				s += "菌株号" + strainNo1 + " ";
			}
			if(beginDate1 != "" && beginDate1 != ""){
				s += "时间从" + beginDate1 + "至" + endDate1 + " ";
			}
			else if(beginDate1 != ""){
				s += "时间从" + beginDate1 + "至今  ";
			}
			if(strainAlias1 != ""){
				s += "内部编号" + strainAlias1 + " ";
			}
			if (sampleProvince1 != "") {
				s += "省份：" + sampleProvince1 + " ";
			}
			if (farmName1 != "") {
				s += "采样地名称：" + farmName1 + " ";
			}
			if (sampleFarmAddr1 != "") {
				s += "养殖场名称：" + sampleFarmAddr1 + " ";
			}
			if (animalName1 != "") {
				s += "动物：" + animalName1 + " ";
			}
			if (sampleAnimalAge1 != "") {
				s += "日龄：" + sampleAnimalAge1 + " ";
			}
			if (sampleSource1 != "") {
				s += "来源：" + sampleSource1 + " ";
			}
			if (sampleCollectionPart1 != "") {
				s += "部位：" + sampleCollectionPart1;
			}

			$("#chartCondition").text(s);//耐药性分析界面
			$("#chartCondition_jcl").text(s);//检出率分析界面
			md.drugView.datagrid.datagrid('load', md
					.serializeObject(md.drugView.searchform));//将searchform表单内的元素序列转化成对象传给后台
		};

		/* 置空 button */
		md.drugView.cleanSearch = function() {
			/* $("#strainCategory_com").combobox('clear');
			$("#sampleProvince_com").combobox('clear');
			$("#animalName").combobox('clear');
			$("#sampleSource").combobox('clear');
			$("#columnRange").val("");
            $("#drugCondition").text(""); */
            s = s1 = "";
			md.drugView.datagrid.datagrid('load', {});//重新加载数据，无需读数据，传给后台的值为空
			md.drugView.searchform.find('input').val('');//找到searchform表单下的所有input标签，并清空
		};
		
		/* @author:linjinxia; reason:注释这个函数，因为这个函数没用到; time:2015-8-6 */
		/* md.drugView.excelExport = function() {
			$.messager.confirm('请确认', '您确定要删除当前所有选择的项目吗？', function(b) {

			});
			md.drugView.datagrid.datagrid('load', {});
			md.drugView.searchform.find('input').val('');
		}; */
		
        $.each(['column', 'spline'], function (i, type) {//监听按钮，生成柱形和折线的按钮
             $('#' + type).click(function () {
                  $("#chartContainer").css("display", "block");	//放图
                  $("#drugTable").css("display", "none");	 //放表格
                  $("#chartContainer").highcharts().series[0].update({//series代表的是药物，series[0]第一个药物
                     type: type
                  });
                  if($("#chartContainer").highcharts().series[1] != undefined){//series[1]第二个药物，如果存在显示
                      $("#chartContainer").highcharts().series[1].update({
                        type: type
                      });
                  }
                  if($("#chartContainer").highcharts().series[2] != undefined){
                      $("#chartContainer").highcharts().series[2].update({
                        type: type
                      });
                  }     
            });
        });
        var s = "", s1 = "";
        $("#drugSearchAdd").click(function(){//点击添加时，将已填的药物范围查找的内容添加到已选的范围里面
           var drugName = $("#medicalName1").combobox("getText");
           var drugHighVal = $("#drugHighVal").val();
           var drugLowVal = $("#drugLowVal").val();
           s += " and d." + drugName.toLowerCase() + " between " + drugLowVal + " and " + drugHighVal;
           s1 += drugLowVal + "<=" + drugName + "<=" + drugHighVal + " ";
           //alert(s);
           $("#columnRange").val(s);//隐藏了
           $("#drugCondition").text(s1);
        });
        $("#table").click(function(){           
	        $("#chartContainer").css("display", "none");	
	        $("#drugTable").css("display", "block");			   
        });
	});

	function chart() {

		var sampleProvince1 = $("#sampleProvince_com").combobox('getValue'),//省份
			farmName1 = $("#farmName").val(),//采样地名称
			sampleFarmAddr1 = $("#sampleFarmAddr").val(),//养殖场名称
			animalName1 = $("#animalName").combobox('getValue'),//动物
			sampleAnimalAge1 = $("#sampleAnimalAge").val(),//日龄
			sampleSource1 = $("#sampleSource").combobox('getValue'),//来源
			sampleCollectionPart1 = $("#sampleCollectionPart").val(),//部位
			medicalName1 = $("#medicalName").combobox('getText'),//药物名
			standardName1 = $("#standardName").combobox('getValue'),//标准名
			strainName1 = $("#strainName").combobox('getValue'),//菌株名
		    date1 = $("#date").combobox('getText'), date;//统计方式
		    
		if (date1 == '按年统计') {
			date = '1';
		} else if (date1 == '按半年统计') {
			date = '3';
		} else if (date1 == '按季度统计') {
			date = '4';
		} else if (date1 == '按省份统计') {
			date = '5';
		}else {
			date = '2';
		}
		var data1 = {
			sampleProvince : sampleProvince1,
			farmName : farmName1,
			sampleFarmAddr : sampleFarmAddr1,
			animalName : animalName1,
			sampleAnimalAge : sampleAnimalAge1,
			sampleSource : sampleSource1,
			sampleCollectionPart : sampleCollectionPart1,
			medicalName : medicalName1,
			standardName : standardName1,
			strainName : strainName1,
			date : date,
		};
		
		var s =false;

		$.ajax({

					url : '${pageContext.request.contextPath}/drugViewAction!getData.action',//将前台填入的数据传给后台
					data : data1,
					dataType : 'json',
					method : 'post',
					success : function(r) {//r代表生成列表的数据
                      //alert(JSON.stringify(r));    
                      if (r.success == undefined) {
                      //alert(JSON.stringify(medicalName1));                     
						var medicalLength=medicalName1.split(",").length;//分割成字符串数组
						if(medicalLength == 1){
						    var x0 = [],
						        y0 = []; 
						    var drug0 = r[0].drug0;
						    //alert(JSON.stringify(drug0));
						    var drugName0 = drug0[0].drugName;//drugName0药物名称
						    $.each(drug0,function(){
						       //alert(this.Date);
						       //alert(this.Number);
						       x0.push(this.Date);//日期，横坐标
						       y0.push(this.Part);//数据，纵坐标
						    });
						}else if(medicalLength == 2){
						    var x0 = [],y0 = [],
						        y1 = [];
						    var drug0 = r[0].drug0;
						    var drug1 = r[1].drug1;
						    var drugName0 = drug0[0].drugName;
						    var drugName1 = drug1[0].drugName;
						    $.each(drug0,function(){
						       //alert(this.Date);
						       //alert(this.Number);
						       x0.push(this.Date);
						       y0.push(this.Part);
						    });
						    $.each(drug1,function(){
						       //alert(this.Date);
						       //alert(this.Number);
						       y1.push(this.Part);
						    });
						}else if(medicalLength == 3){
						    var x0 = [],y0 = [],
						        y1 = [],y2 = [];
						    var drug0 = r[0].drug0;
						    var drug1 = r[1].drug1;
						    var drug2 = r[2].drug2;
						    var drugName0 = drug0[0].drugName;//第一个药物名
						    var drugName1 = drug1[0].drugName;//第二个药物名
						    var drugName2 = drug2[0].drugName;//第三个药物名
						    $.each(drug0,function(){
						       //alert(this.Date);
						       //alert(this.Number);
						       x0.push(this.Date);//时间
						       y0.push(this.Part);//量
						    });
						    $.each(drug1,function(){//jq遍历$.each()
						       //alert(this.Date);
						       //alert(this.Number);
						       y1.push(this.Part);
						    });
						    $.each(drug2,function(){
						       //alert(this.Date);
						       //alert(this.Number);
						       y2.push(this.Part);
						    });
						}
						
						/* for(var i in x0){
						  alert(x0[i]);
						}   
						for(var i in y0){
						  alert(y0[i]);
						} */
						var table = '<table id="tableData" class="gridtable" style="margin-top:100px"><thead><th></th>';
						for(var i in x0){
						   table +='<th>' + x0[i] +'</th>';
						}
						table += '</thead><tbody><tr><th>' + drugName0 +'</th>'; 
						for(var i in y0){
						   table +='<th>' + y0[i] +'</th>';
						}
						table += '</tr>'; 
						if(y1 != undefined){
						   table += '<tr><th>' + drugName1 +'</th>'; 
						   for(var i in y1){
						      table +='<th>' + y1[i] +'</th>';
						   }
						   table += '</tr>'; 
						}
						
						if(y2 != undefined){
						   table += '<tr><th>' + drugName2 +'</th>'; 
						   for(var i in y2){
						      table +='<th>' + y2[i] +'</th>';
						   }
						   table += '</tr>'; 
						}
						table += '</tbody><table>'; 
						//alert(table);
						$('#drugTable').append(table);//将table放进id为drugTable里面。
						$('#chartContainer')
								.highcharts(
										{
											
											chart : {
												type : 'column',
												 width: 1200,
                                                 height: 300,
												margin : [ 50, 20, 50, 80 ]
											},
											title :{
											
											},
											xAxis : {
												categories :x0
											},
											yAxis : {
												min : 0,
												title : {
													text : '百分比 '
												}
											},
											 tooltip: {
                                                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                                                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                                   '<td style="padding:0"><b>{point.y:.4f} </b></td></tr>',
                                                footerFormat: '</table>',
                                                shared: true,
                                                useHTML: true
                                            },
											plotOptions : {
												column : {
													pointPadding : 0.2,
													borderWidth : 0
													
												},
												pie: {
                                                    allowPointSelect: true,
                                                    cursor: 'pointer',
                                                    dataLabels: {
                                                        enabled: true,
                                                        color: '#000000',
                                                        connectorColor: '#000000',
                                                        format: '<b>{point.key}</b>: {point.percentage:.1f} %'
                                                    }
                                                }
											},
											series : [ {
												
											},{
											},{
											}]
						});
						
						var chart = $('#chartContainer').highcharts();			
						if(medicalLength == 1){
						    chart.setTitle({text : "药物" + drugName0 + "的分析图表"});
						    chart.series[0].update({
								     name:drugName0,
								     data:y0
							 });
							 chart.series[2].remove();
							 chart.series[1].remove();
							
						}else if(medicalLength == 2){
						    chart.setTitle({text : "药物" + drugName0 + "和" + drugName1 + "的分析图表"});
						    chart.series[0].update({
								     name:drugName0,
								     data:y0
							  });
							  chart.series[1].update({
								     name:drugName1,
								     data:y1
							  }); 
							   chart.series[2].remove();
						}else if(medicalLength == 3){
						     chart.setTitle({text : "药物" + drugName0 + "、" + drugName1 + "和" + drugName2 + "的分析图表"});
						      chart.series[0].update({
								     name:drugName0,
								     data:y0
							  });
							  chart.series[1].update({
								     name:drugName1,
								     data:y1
							  }); 
							  chart.series[2].update({
								     name:drugName2,
								     data:y2
							  }); 
						}
						
							            
						$("#chartData").css("display", "none");	
						$("#chartContainer").css("display", "block");		
						$("#back").css("display", "block");
						$("#table").css("display", "block");
						if(medicalLength == 1){
						     $("#column").css("display", "block");
						     $("#spline").css("display", "block");
						     //$("#pie").css("display", "block");
						}else{
						    $("#column").css("display", "block");
						    $("#spline").css("display", "block");
						}
						
					}else{
				      $.messager.alert('错误',r.msg,'error');
				     }
				}

				});
	}
	
//@author:linjinxia; reason:添加检出率图表; time:2015-8-7	
function chart_jcl() {

		var strainNo1 = $("strainNo").val(),//菌株号
			strainAlias1 = $("strainAlias").val(),//内部编号
			beginDate1 = $("beginDate").val(),//开始时间
			endDate1 = $("endDate").val(),//结束时间
			sampleProvince1 = $("#sampleProvince_com").combobox('getValue'),//省份
			farmName1 = $("#farmName").val(),//采样地名称
			sampleFarmAddr1 = $("#sampleFarmAddr").val(),//养殖场名称
			animalName1 = $("#animalName").combobox('getValue'),//动物
			sampleAnimalAge1 = $("#sampleAnimalAge").val(),//日龄
			sampleSource1 = $("#sampleSource").combobox('getValue'),//来源
			sampleCollectionPart1 = $("#sampleCollectionPart").val(),//部位
			strainName1 = $("#strainName_jcl").combobox('getText'),//菌种名
		    date1 = $("#date_jcl").combobox('getText'), date,sampleProvince2="全国";//统计方式
		if(sampleProvince1 != ""){
			sampleProvince2 = sampleProvince1;
		}
			//alert(endDate1 instanceof String);
		if (date1 == '按年统计') {
			date = '1';
		} else if (date1 == '按半年统计') {
			date = '3';
		} else if (date1 == '按季度统计') {
			date = '4';
		} else if (date1 == '按省份统计') {
			date = '5';
		}else {
			date = '2';
		}
		var data1 = {
			strainNo:strainNo1,
			strainAlias:strainAlias1,
			beginDate:beginDate1,
			endDate:endDate1,
			sampleProvince : sampleProvince1,
			farmName : farmName1,
			sampleFarmAddr : sampleFarmAddr1,
			animalName : animalName1,
			sampleAnimalAge : sampleAnimalAge1,
			sampleSource : sampleSource1,
			sampleCollectionPart : sampleCollectionPart1,
			strainName : strainName1,
			date : date,
		};
		
		var s =false;

		$.ajax({

					url : '${pageContext.request.contextPath}/drugViewAction!getStatisticsData.action',//将前台填入的数据传给后台
					data : data1,
					dataType : 'json',
					method : 'post',
					success : function(r) {//r代表生成列表的数据
					//alert(JSON.stringify(r));    
                      if (r.success == undefined) {
						    var x0 = [],
						        y0 = []; 
						    var strain0 = r[0].drug0;  
						    var strainName0 = strain0[0].strainName;//strain0[0].strainName;//strainName菌种名
						    var provinceName0 = strain0[0].province;
						    //alert(JSON.stringify(strainName0));
						    $.each(strain0,function(){
						       x0.push(this.Date);//日期，横坐标
						       y0.push(this.Part);//数据，纵坐标
						    });
						
						
						var table = '<table id="tableData_jcl" class="gridtable" style="margin-top:100px"><thead><th></th>';
						for(var i in x0){
						   table +='<th>' + x0[i] +'</th>';
						}
						table += '</thead><tbody><tr><th>' + strainName0 +'</th>'; 
						for(var i in y0){
						   table +='<th>' + y0[i] +'</th>';
						}
						table += '</tr>'; 
						table += '</tbody><table>'; 
						
						$('#drugTable').append(table);//将table放进id为drugTable里面。
						$('#chartContainer')
								.highcharts(
										{
											
											chart : {
												type : 'column',
												 width: 1200,
                                                 height: 300,
												margin : [ 50, 20, 50, 80 ]
											},
											title :{
											
											},
											xAxis : {
												categories :x0
											},
											yAxis : {
												min : 0,
												title : {
													text : '百分比 '
												}
											},
											 tooltip: {
                                                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                                                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                                   '<td style="padding:0"><b>{point.y:.4f} </b></td></tr>',
                                                footerFormat: '</table>',
                                                shared: true,
                                                useHTML: true
                                            },
											plotOptions : {
												column : {
													pointPadding : 0.2,
													borderWidth : 0
													
												},
												pie: {
                                                    allowPointSelect: true,
                                                    cursor: 'pointer',
                                                    dataLabels: {
                                                        enabled: true,
                                                        color: '#000000',
                                                        connectorColor: '#000000',
                                                        format: '<b>{point.key}</b>: {point.percentage:.1f} %'
                                                    }
                                                }
											},
											series : [ {
												
											},{
											},{
											}]
						});
						
						
						var chart = $('#chartContainer').highcharts();
						    chart.setTitle({text : "来自" + provinceName0 + "菌种名为" + strainName0 + "的分析图表"});
						    chart.series[0].update({
								     name:strainName0,
								     data:y0
							 });
							 chart.series[2].remove();
							 chart.series[1].remove();
							
							            	
							$("#chartContainer").css("display", "block");		
							$("#back_jcl").css("display", "block");
							$("#table_jcl").css("display", "block");
						    $("#column_jcl").css("display", "block");
						    $("#spline_jcl").css("display", "block");
						    $("#chartData_jcl").css("display", "none");
						    //$("#check_div").css("display","block");
						    //$("#insist_div").css("display","none");
						  	//$("#pie").css("display", "block");
						
					}else{
				      $.messager.alert('错误',r.msg,'error');
				     }
				}

				});
	}
	//耐药性返回分析界面
	function back(){
	   $("#tableData").remove();
	   $("#chartData").css("display", "block");	
	   $("#chartContainer").css("display", "none");	
	   $("#check_div").css("display","none");
	   $("#drugTable").css("display", "none");	
	   $("#back").css("display", "none");		
	   $("#column").css("display", "none");
	   $("#spline").css("display", "none");
	   //$("#pie").css("display", "none");
	   $("#table").css("display", "none");
	}
	//检出率返回分析界面@author:linjinxia; time:2015-8-6
	function back_jcl(){
	   $("#tableData_jcl").remove();
	   $("#chartData_jcl").css("display", "block");	
	   $("#check_div").css("display","block");
	   $("#chartContainer").css("display", "none");	
	   $("#drugTable").css("display", "none");	
	   $("#back_jcl").css("display", "none");		
	   $("#column_jcl").css("display", "none");
	   $("#spline_jcl").css("display", "none");
	   //$("#pie").css("display", "none");
	   $("#table_jcl").css("display", "none");
	}
	//检出率@author:linjinxia; time:2015-8-6
	function check(){
	 	$("#insist_div").css("display", "none");
		$("#check_div").css("display","block");
		$("#chartData_jcl").css("display", "block");
		$("#tableData").remove();
		$("#chartContainer").css("display", "none");	
	   $("#drugTable").css("display", "none");	
	   $("#back").css("display", "none");		
	   $("#column").css("display", "none");
	   $("#spline").css("display", "none");
	   //$("#pie").css("display", "none");
	   $("#table").css("display", "none");
	   $("#back_jcl").css("display", "none");		
	   $("#column_jcl").css("display", "none");
	   $("#spline_jcl").css("display", "none");
	   //$("#pie").css("display", "none");
	   $("#table_jcl").css("display", "none");
	}
	//耐药性2015-8-6
	function insist(){
		$("#insist_div").css("display", "block");
		$("#chartData").css("display", "block");
		$("#check_div").css("display","none");
		$("#tableData_jcl").remove();
		$("#chartContainer").css("display", "none");	
	   $("#drugTable").css("display", "none");	
	   $("#back").css("display", "none");		
	   $("#column").css("display", "none");
	   $("#spline").css("display", "none");
	   //$("#pie").css("display", "none");
	   $("#table").css("display", "none");
	   $("#back_jcl").css("display", "none");		
	   $("#column_jcl").css("display", "none");
	   $("#spline_jcl").css("display", "none");
	   //$("#pie").css("display", "none");
	   $("#table_jcl").css("display", "none");
	}
	
	/* @author:linjinxia; reason:增加这个函数，汉化打印图片; time:2015-8-6 */
	$(function () {
         Highcharts.setOptions({
            lang: {
            	  printChart:"打印图表",
                  downloadJPEG: "下载JPEG 图片" , 
                  downloadPDF: "下载PDF文档"  ,
                  downloadPNG: "下载PNG 图片"  ,
                  downloadSVG: "下载SVG 矢量图" , 
                  exportButtonTitle: "导出图片" ,
            }
        });
    });
</script>
</head>

<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',border:false"
		style="height:150px;width:100%;background: #F4F4F4;border-bottom:1px solid #dddddd">
		<form id="md_drugView_searchform">
			<table class="tableform" style="width:90%;">
				<tr>
					<td noWrap>菌株号</td>
					<td><input name="strainNo" id="strainNo"/>
					</td>
					<td noWrap>内部编号</td>
					<td><input name="strainAlias" id="strainAlias"/>
					</td>

					<td noWrap>采样时间</td>
					<td colspan="3"><input name="beginDate" class="easyui-datebox"
						data-options="editable:false" style="width:125px;" id="beginDate"/> 至 <input
						name="endDate" class="easyui-datebox"
						data-options="editable:false" style="width:125px;" id="endDate"/>
					</td>
				</tr>
				<tr>
					<td noWrap>省份</td>
					<td><input name="sampleProvince" id="sampleProvince_com" />
					</td>
					<td noWrap>采样地名称</td>
					<td><input name="farmName" id="farmName" /></td>
					<td noWrap>养殖场名称</td>
					<td><input name="sampleFarmAddr" id="sampleFarmAddr" /></td>
					<td noWrap>菌属</td>
					<td><input name="strainCategory" id="strainCategory_com"
						 class="easyui-combobox"
						data-options="
                            mode: 'remote',
                            textField: 'strainCategory',
                            valueField: 'strainCategory',
                            url: '${pageContext.request.contextPath}/strainToNotesAction!getStrainCategory.action',
                            multiple: true
                            " />
					</td>
					
				</tr>
				<tr>

					<td noWrap>动物</td>
					<td><input name="animalName" id="animalName" /></td>
					<td noWrap>部位</td>
					<td><input name="sampleCollectionPart"
						id="sampleCollectionPart" /></td>
					<td noWrap>来源</td>
					<td><input name="sampleSource" id="sampleSource" /></td>
					<td noWrap>日龄</td>
					<td><input name="sampleAnimalAge" id="sampleAnimalAge" /></td>
					
				</tr>
				
			</table>
			<span> 药品范围值查找：药品名<input name="medicalName1" id="medicalName1"/>
					从<input id="drugLowVal" style="width:50px"/>到<input id="drugHighVal" style="width:50px"/>
                    <a id="drugSearchAdd" href="javascript:void(0);" class="easyui-linkbutton" > 添加 </a>
                    &nbsp;&nbsp;<label>隐藏列</label><input class="easyui-combobox" id="hidCombobox" /><br>
                    <input id="columnRange" name="columnRange" value="" style="display:none"/></span>
			 <span> 已选的药物查询范围：<span id="drugCondition"></span></span>	  
				
			<p style="text-align: center;">
				<a href="javascript:void(0);" class="easyui-linkbutton"
						onclick="md.drugView.search();"> 查询 </a>
						&nbsp;&nbsp;&nbsp;&nbsp;
						 <a href="javascript:void(0);" class="easyui-linkbutton"
						onclick="md.drugView.cleanSearch();"> 清空 </a>
			</p>
		</form>
	</div>
	<div data-options="region:'center',border:false,split:true">
		<table id="md_drugView_datagrid">
		</table>
	</div>
	<div  data-options="region:'east',collapsed:true,split:true"
		title="分析页面" style="width:500px;">
		<div id="insist_div" style="margin-top: 10%;">
		<a id="check" href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: block;float: left; margin-top: -10%;" onclick="check()">检出率分析界面</a>
		<form id="chartData">
			已选择的条件：
			<p id="chartCondition"></p>
			<p>待选择的条件：</p>
			<table style="text-align: center;">
				<tr>
					<td>药物</td>
					<td><input name="medicalName" id="medicalName" /></td>
					<td>标准名称</td>
					<td><input name="standardName" id="standardName" /></td>
				</tr>
				<tr>
					<td>菌种名</td>
					<td><input name="strainName" id="strainName" /></td>
					<td>统计方式</td>
					<td><input name="date" id="date" /></td>
				</tr>

			</table>
			<a href="javascript:void(0);" class="easyui-linkbutton"
				style="margin-left: 30%;margin-top: 5%" onclick="chart();">生成报表</a>
		</form>
		</div>
		
		<!-- @author:林锦霞;reason:增加检出率分析界面;time:2015-8-6 --> 
		<!-- 检出率分析界面 -->
		<div id="check_div" style="margin-top: 10%; display:none;">
		<a id="" href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: block;float: left; margin-top: -10%;" onclick="insist()">返回耐药性分析界面</a>
		<form id="chartData_jcl">
			已选择的条件：
			<p id="chartCondition_jcl"></p>
			<p>待选择的条件：</p>
			<table style="text-align: center;">
				<tr>
					<td>菌种名</td>
					<td><input name="strainName_jcl" id="strainName_jcl" /></td>
					<td>统计方式</td>
					<td><input name="date_jcl" id="date_jcl" /></td>
				</tr>
				<!-- <tr>   time:2015-8-31;name:linjinxia; 待加
					<td>省份</td>
					<td><input name="province_jcl" id="province_jcl" /></td>
				</tr> -->

			</table>
			<a href="javascript:void(0);" class="easyui-linkbutton"
				style="margin-left: 20%;margin-top: 5%" onclick="chart_jcl();">生成报表</a>
		</form>
		</div>
		<!--  耐药性的界面  -->
		<a id="back" href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" onclick="back()">返回分析界面</a>
		<a id="column"href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为柱形图</a>
		<a id="spline"href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为折线图</a>	
		 <a id="pie"href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为饼状图</a>	
	    <a id="table" href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为数据表格</a>
		<!-- 检出率的界面，time:2015-8-6 -->
		<a id="back_jcl" href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" onclick="back_jcl()">返回分析界面</a>
		<a id="column_jcl"href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为柱形图</a>
		<a id="spline_jcl"href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为折线图</a>	
		 <a id="pie_jcl"href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为饼状图</a>	
	    <a id="table_jcl" href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为数据表格</a>								
		<div id="chartContainer" style="display: none;width: 1000px;height: 400px;clear:left;"></div><!-- 放图表 -->
		<div id="drugTable" style="display: none;width: 1400px;height: 400px;clear:left;"> </div><!-- 放表格 -->
	</div>
<!-- 	<div  data-options="region:'east',collapsed:true,split:true"
		title="分析页面" style="width:500px;display:none;" id="check_div">
		<a id="" href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: block;float: left;" onclick="">返回耐药性分析界面</a>
		
		<form id="chartData_jcl" style="margin-top: 10%;">
			已选择的条件：
			<p id="chartCondition_jcl"></p>
			<p>待选择的条件：</p>
			<table style="text-align: center;">
				<tr>
					<td>统计方式</td>
					<td><input name="date" id="date_jcl" /></td>
				</tr>

			</table>
			<a href="javascript:void(0);" class="easyui-linkbutton"
				style="margin-left: 30%;margin-top: 5%" onclick="chart_jcl();">生成报表</a>

		</form>
		<a id="back_jcl"href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" onclick="back()">返回分析界面</a>
		<a id="column_jcl"href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为柱形图</a>
		<a id="spline_jcl"href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为折线图</a>	
		 <a id="pie_jcl"href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为饼状图</a>	
	    <a id="table_jcl" href="javascript:void(0);" class="easyui-linkbutton" 
				style="display: none;float: left;" >切换为数据表格</a>							
		<div id="chartContainer_jcl" style="display: none;width: 1000px;height: 400px;clear:left;"></div>
		<div id="drugTable_jcl" style="display: none;width: 1400px;height: 400px;clear:left;"> </div>
	</div> -->
</body>