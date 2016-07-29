<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	md.ns("detectionData");
	$(function() {
		detectionData.editRow = undefined;
		detectionData.dataTable = $('#detectionData')
				.datagrid(
						{
							data : '',
							fit : true,
							border : false,
							//pagination: true,
							fitColumns: false,
							idField : 'strainNo',
							columns : [ [

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
												url : '${pageContext.request.contextPath}/strainCodingAction!getStrainNo.action'
											}
										}
									},
									{
										title : '内部编号',
										field : 'micAlias',
										width : 50,
										align : 'center',

										editor : {
											type : 'text',
											options : {}
										}

									},
									{
										title : '<label title="氨苄西林" class="easyui-tooltip">AMP</lable>',
										field : 'amp',
										width : 52,

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
										title : '<label title="哌拉西林" class="easyui-tooltip">PIP</lable>',
										field : 'pip',
										width : 52,

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
										title : '<label title="他唑巴坦" class="easyui-tooltip">TZP</lable>',
										field : 'tzp',
										width : 52,

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
										title : '<label title="头孢他啶" class="easyui-tooltip">CAZ</lable>',
										field : 'caz',
										width : 52,

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
										title : '<label title="头孢噻呋" class="easyui-tooltip">CFZ</lable>',
										field : 'cfz',
										width : 52,

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
										title : '<label title="头孢曲松" class="easyui-tooltip">CRO</lable>',
										field : 'cro',
										width : 52,

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
										title : '<label title="头孢噻肟" class="easyui-tooltip">CTX</lable>',
										field : 'ctx',
										width : 52,

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
										title : '<label title="头孢吡肟" class="easyui-tooltip">FEP</lable>',
										field : 'fep',
										width : 52,

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
										title : '<label title="阿米卡星" class="easyui-tooltip">AMK</lable>',
										field : 'amk',
										width : 52,

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
										title : '<label title="安普霉素" class="easyui-tooltip">APR</lable>',
										field : 'apr',
										width : 52,

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
										title : '<label title="新霉素" class="easyui-tooltip">NEO</lable>',
										field : 'neo',
										width : 52,

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
										title : '<label title="奈替米星" class="easyui-tooltip">NET</lable>',
										field : 'net',
										width : 52,

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
										title : '<label title="链霉素" class="easyui-tooltip">STR</lable>',
										field : 'str',
										width : 52,

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
										title : '<label title="妥布霉素" class="easyui-tooltip">TOB</lable>',
										field : 'tob',
										width : 52,

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
										title : '<label title="多西环素" class="easyui-tooltip">DOX</lable>',
										field : 'dox',
										width : 52,

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
										title : '<label title="米诺环素" class="easyui-tooltip">MIN</lable>',
										field : 'min',
										width : 52,

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
										title : '<label title="氯霉素" class="easyui-tooltip">CHL</lable>',
										field : 'chl',
										width : 52,

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
										title : '<label title="阿奇霉素" class="easyui-tooltip">AZM</lable>',
										field : 'azm',
										width : 52,

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
										title : '<label title="替考拉宁" class="easyui-tooltip">TEC</lable>',
										field : 'tec',
										width : 52,

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
										title : '<label title="黏菌素" class="easyui-tooltip">CL</lable>',
										field : 'cl',
										width : 52,

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
										title : '<label title="亚胺培南" class="easyui-tooltip">IMP</lable>',
										field : 'imp',
										width : 52,

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
										title : '<label title="美罗培南" class="easyui-tooltip">MEM</lable>',
										field : 'mem',
										width : 52,

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
										title : '<label title="磷霉素" class="easyui-tooltip">FOS</lable>',
										field : 'fos',
										width : 52,

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
										title : '<label title="呋喃妥因" class="easyui-tooltip">NIT</lable>',
										field : 'nit',
										width : 52,

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
										title : '<label title="磺胺甲噁唑" class="easyui-tooltip">SXT</lable>',
										field : 'sxt',
										width : 52,

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
										title : '<label title="甲氧苄啶" class="easyui-tooltip">TMP</lable>',
										field : 'tmp',
										width : 52,

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
										title : '<label title="左氧氟沙星" class="easyui-tooltip">LEV</lable>',
										field : 'lev',
										width : 52,

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
										title : '<label title="萘啶酸" class="easyui-tooltip">NAL</lable>',
										field : 'nal',
										width : 52,

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
										title : '<label title="诺氟沙星" class="easyui-tooltip">NOR</lable>',
										field : 'nor',
										width : 52,

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
										title : '<label title="氧氟沙星" class="easyui-tooltip">OFX</lable>',
										field : 'ofx',
										width : 52,

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
										title : '<label title="OQX" class="easyui-tooltip">OQX</lable>',
										field : 'oqx',
										width : 52,

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
										field : 'micdetector',
										width : 60,
										editor : {
											type : 'text',
											options : {

											}
										}
									},
									{
										title : '实验方式',
										field : 'micdetectionType',
										width : 60,
										editor : {
											type : 'text',

										}

									},
									
									{
										title : '失败原因',
										field : 'errorMsg',
										width : 100,
										editor : {
											type : 'text',
											options : {}
										}
									}] ],
							toolbar : [
									{
										text : '删除',
										iconCls : 'icon-remove',
										handler : function() {
											var rows = detectionData.dataTable
													.datagrid('getSelections');
											if (rows.length > 0) {
												for ( var i = 0; i < rows.length; i++) {
													var ind = detectionData.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[i]);
													console.info(ind);
													detectionData.dataTable
															.datagrid(
																	'deleteRow',
																	ind);
												}
												detectionData.dataTable
														.datagrid('unselectAll');
											}
										}
									},
									{
										text : '修改',
										iconCls : 'icon-edit',
										handler : function() {
											var rows = detectionData.dataTable
													.datagrid('getSelections');
											if (rows.length == 1) {
												if (detectionData.editRow != undefined) {
													detectionData.dataTable
															.datagrid(
																	'endEdit',
																	detectionData.editRow);
												}
												if (detectionData.editRow == undefined) {
													var index = detectionData.dataTable
															.datagrid(
																	'getRowIndex',
																	rows[0]);
													detectionData.dataTable
															.datagrid(
																	'beginEdit',
																	index);
													detectionData.editRow = index;
													detectionData.dataTable
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
									{
										text : '保存',
										iconCls : 'icon-save',
										handler : function() {
											detectionData.dataTable.datagrid('endEdit', detectionData.editRow);
										}
									}, 		
									{
										text : '关闭导入界面',
										iconCls : 'icon-no',
										handler : function() {
											$('#md_mic_exp').dialog('close');
										}
									} ],
							onAfterEdit : function(rowIndex, rowData, changes) {
								var updated = detectionData.dataTable.datagrid(
										'getChanges', 'updated');
								var url = '';
								if (updated.length > 0) {									
									url = '${pageContext.request.contextPath}/strainMicAction!add.action';
								}
								if (updated.length < 1) {
									detectionData.editRow = undefined;
									detectionData.dataTable
											.datagrid('unselectAll');
									return;
								}
								$.ajax({
									url : url,
									data : rowData,
									dataType : 'json',
									success : function(r) {
										if (r && r.success) {
											detectionData.dataTable.datagrid(
													'deleteRow',
													detectionData.editRow);
											$.messager.show({
												msg : r.msg,
												title : 'success'
											});
											detectionData.editRow = undefined;
											detectionData.dataTable
													.datagrid('unselectAll');
										} else {
											detectionData.dataTable.datagrid(
													'beginEdit', rowIndex);
											detectionData.editRow = rowIndex;

											$.messager.alert('error', r.msg,
													'error');

										}
									}
								});
							}
						});
		
		detectionData.exp = function() {
			//alert("阴性上传！");
			$.ajaxFileUpload({
				url : '${pageContext.request.contextPath}/uploadAction!StrainMicUpload.action',
				secureuri : false,
				fileElementId : 'detectionFile',
				dataType : 'json',
				success : function(data, status) {
					$.messager.alert('提示', data.msg, 'warning');
					detectionData.dataTable.datagrid('loadData', data.obj);

				},
				error : function(data, status, e) {

				}
			});
		};

	});
</script>
<div class="easyui-layout" data-options="fit:true">
	<div data-options="region:'center',border:false">
		<table id="detectionData">
		</table>
	</div>
	<div data-options="region:'north',border:false"
		style="height:110px;background: #F4F4F4;overflow:hidden;padding-left:15px">
		<h4>请选择excel文件</h4>
		<p>
			<label> <input name="type" type="hidden" value="farm" /> </label>
		</p>
		<p>
			<label> <input name="excel" type="file" id="detectionFile"
				onchange="checkFileType(this)" /> </label>
		</p>
		<p>
			<a id="btn" href="javascript:void(0);" class="easyui-linkbutton"
				data-options="iconCls:'icon-save'" onclick="detectionData.exp();">
				上传 </a> <a class="easyui-linkbutton" href="/new_drug/excelModel/mic.xls">下载导入模板</a>
		</p>
	</div>
</div>