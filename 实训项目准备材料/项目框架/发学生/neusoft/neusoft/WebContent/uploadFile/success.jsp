<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>上传附件</title>
		<link href="<%=basePath%>css/comm.css" rel="stylesheet"
			type="text/css" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta name="description" content="NeudeuSDD招聘管理系统" />
		<meta name="keywords" content="NeudeuSDD招聘管理系统" />
	</head>
	<body>
		<form id="uploadForm" name="sourceForm" action="upload.action"
			method="post" onsubmit="return true;"
			style="margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;"
			enctype="multipart/form-data">
			<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" height="25">
						上传文件
					</th>
				</tr>
				<tr>
					<td class="td_bg" height="23" align="center">
						<font color="red"><b>文件上传成功！</b></font>
						<span class="TableRow2"></span>
					</td>
				</tr>
				<tr class="td_bg" align="center">
					<td>
					<input name="button2" type="button" class="ACT_btn" value="关闭"
								onclick="javascript: window.close();"/>
					</td>
				</tr>
			   </tbody>
			</table>
		</form>
	</body>
</html>