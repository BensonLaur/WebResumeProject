<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.neusoft.comon.init.PropertiesUtil"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String version = PropertiesUtil.get("version");
	String copyright = PropertiesUtil.get("copyright");
%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>NeudeuSDD招聘管理系统</title>
		<link href="<%=basePath%>css/left_css.css" rel="stylesheet"
			type="text/css" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta name="description" content="NeudeuSDD招聘管理系统" />
		<meta name="keywords" content="NeudeuSDD招聘管理系统" />
		<script language="javascript">
			function showsubmenu(sid)
			{
				whichEl = eval("submenu" + sid);
				if (whichEl.style.display == "none")
				{
				eval("submenu" + sid + ".style.display=\"\";");
				}
				else
				{
				eval("submenu" + sid + ".style.display=\"none\";");
				}
			}
		</script>
	</head>
	<body bgcolor="16ACFF">
		<table width="98%" border="0" cellpadding="0" cellspacing="0"
			style="background: url(<%=basePath%>images/tablemde.jpg)">
			 <s:property value="menuStr" escape="false"/>
</table>
</body></html>