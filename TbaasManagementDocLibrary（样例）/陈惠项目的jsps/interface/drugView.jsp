<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<title>视图</title>
<jsp:include page="/jsps/headFile.jsp"></jsp:include>
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
										width : 80
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
										width : 50
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
										width : 50
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
										width : 80
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
										width : 100
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
										width : 100
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
										width : 60
									}, {
										title : '实验方式',
										field : 'micdetectionType',
										width : 60

									}, {
										title : 'MIC备注',
										field : 'micRemarks',
										width : 100,
										align : 'center'

									} ] ],
							toolbar : [
									{
										text : '导出数据',
										iconCls : 'icon-redo',
										handler : function() {
											var rows = md.drugView.datagrid
													.datagrid('getSelections');
											if (rows.length > 0) {
												$.messager.confirm('请确认','您确定要导出当前所有选择的项目到excel吗？',
																function(b) {
																	if (b) {
																		var ids = [];
																		for ( var i = 0; i < rows.length; i++) {
																			ids.push(rows[i].strainNo);
																		};
																		
																				
																		(function(){
																		     var temp = document.createElement("form");        
                                                                             temp.action = '${pageContext.request.contextPath}/downloadAction!getDrugViewExcel.action';        
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

		$("#md_drugView_searchform input[name='animalName']")
				.combobox(
						{
							id : 'sampleAnimal_com',
							mode : 'remote',
							textField : 'animalName',
							valueField : 'animalName',
							url : '${pageContext.request.contextPath}/animalAction!getAnimal.action',
							multiple : true
		});
		$("#md_drugView_searchform input[name='sampleSource']")
				.combobox(
						{
							mode : 'remote',
							textField : 'sourceName',
							valueField : 'sourceName',
							url : '${pageContext.request.contextPath}/sourceAction!getSource.action',
							multiple : true
		});
		$("#md_drugView_searchform input[name='sampleProvince']")
				.combobox(
						{
							mode : 'remote',
							textField : 'label',
							valueField : 'label',
							url : '${pageContext.request.contextPath}/suggestAction!getProvince.action',
							multiple : true
		});
		/* 查询 button */
		md.drugView.search = function() {
			md.drugView.datagrid.datagrid('load', md
					.serializeObject(md.drugView.searchform));
		};

		/* 置空 button */
		md.drugView.cleanSearch = function() {
			$("#drugView_sampleProvince").combobox('clear');
			md.drugView.datagrid.datagrid('load', {});
			md.drugView.searchform.find('input').val('');
		};
		md.drugView.excelExport = function() {
			$.messager.confirm('请确认', '您确定要删除当前所有选择的项目吗？', function(b) {

			});
			md.drugView.datagrid.datagrid('load', {});
			md.drugView.searchform.find('input').val('');
		};

	});
</script>
</head>

<body class="easyui-layout" data-options="fit:true,border:false">
	<div data-options="region:'north',border:false"
		style="height:150px;width:100%;overflow:hidden;background: #F4F4F4;border-bottom:1px solid #dddddd">
		<form id="md_drugView_searchform">
			<table class="tableform" style="width:90%;height:100%">
				<tr>
					<td>菌株号</td>
					<td><input name="strainNo" />
					</td>
					<td>内部编号</td>
					<td><input name="strainAlias" />
					</td>
					
					<td>采样时间</td>
					<td><input name="beginDate" class="easyui-datebox" data-options="editable:false"
						 style="width:125px;" /> 至 <input name="endDate"
						class="easyui-datebox" data-options="editable:false" style="width:125px;" />
					</td>
				</tr>
				<tr>
					<td>采样地名称</td>
					<td><input name="farmName" /></td>
					<td>养殖场名称 </td>
					<td><input name="sampleFarmAddr" /></td>
					<td>动物</td>
					<td><input name="animalName" /></td>
					<td>日龄</td>
					<td><input name="sampleAnimalAge" /></td>
				</tr>
				<tr>
					
					<td>部位</td>
					<td><input name="sampleCollectionPart" /></td>
					<td>来源</td>
					<td><input name="sampleSource" /></td>
					<td>省份</td>
					<td><input name="sampleProvince" id="sampleProvince_com"/>
					</td>					
				</tr>				
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="javascript:void(0);" class="easyui-linkbutton"
						onclick="md.drugView.search();"> 查询 </a> <a
						href="javascript:void(0);" class="easyui-linkbutton"
						onclick="md.drugView.cleanSearch();"> 清空 </a>
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div data-options="region:'center',border:false">
		<table id="md_drugView_datagrid">
		</table>
	</div>
</body>