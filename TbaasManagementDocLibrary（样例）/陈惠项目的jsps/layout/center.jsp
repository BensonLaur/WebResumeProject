<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function addTab(v_title, v_closable, url) {
		var t = $('#layout_center_tabs');
		if (t.tabs('exists', v_title)) {
			t.tabs('select', v_title);
		} else {
			t
					.tabs(
							'add',
							{
								title : v_title,
								closable : v_closable,
								content : '<iframe src="'
										+ url
										+ '" frameborder="0" style="border:0;width:100%;height:99%;"></iframe>'
							});
		}
	}
</script>
<div id="layout_center_tabs" class="easyui-tabs"
	data-options="fit:true,border:false" style="overflow: hidden;">
	<div title="首页" style="padding:120px;">
		<div>
			<table border="1" width="500px">
				<thead>
					<tr>
						<td colspan="2" align="center">资源下载</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>用户手册</td>
						<td><a href="/new_drug/download/manul.doc">点击下载</a>
						</td>
					</tr>
					<tr>
						<td>打印机本地驱动</td>
						<td><a href="/new_drug/download/Argox_7.3.5_M-0.exe">点击下载</a>
						</td>
					</tr>
					<tr>
						<td>网页打印驱动</td>
						<td><a href="/new_drug/download/PPLB.zip">点击下载</a>
						</td>
					</tr>
					<tr>
						<td>打印机设置手册</td>
						<td><a href="/new_drug/download/printManul.doc">点击下载</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>