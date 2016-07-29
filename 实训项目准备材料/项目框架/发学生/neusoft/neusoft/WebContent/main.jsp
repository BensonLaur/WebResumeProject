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
		<title>NeudeuSDD招聘管理系统</title>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta name="description" content="NeudeuSDD招聘管理系统" />
		<meta name="keywords" content="NeudeuSDD招聘管理系统" />
	</head>
	<frameset rows="72,*" frameborder="no" border="0" framespacing="0">
		<frame src="<%=basePath%>user/topBar.action?sessionId=<s:property value="sessionId"/>" noresize="noresize" frameborder="0" name="topFrame" marginwidth="0" marginheight="0" scrolling="no"/>
		<frameset rows="*" cols="195,*" id="frame">
			<frame src="<%=basePath%>user/getMenu.action?sessionId=<s:property value="sessionId"/>" name="leftFrame" noresize="noresize" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes"/>
			<frame src="<%=basePath%>user/index.action?sessionId=<s:property value="sessionId"/>" name="main" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes"/>
		</frameset>
	</frameset>
	<noframes>
		<body bgcolor="#FFFFFF" text="#000000">
			此系统需要浏览器支持框架，请确认您的浏览器是支持框架显示的。
		</body>
	</noframes>
</html>