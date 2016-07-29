<%@ page language="java" pageEncoding="UTF-8"%>
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
		<link href="<%=basePath%>css/style.css" rel="stylesheet"
			type="text/css" />
		<script language="javascript">
function exitSys() {
	if (confirm("您确认要退出本系统？")) {
		parent.window.location = "<%=basePath%>user/loginOff.action?sessionId=<s:property value="sessionId"/>";
	}
}
</script>
		<link href="<%=basePath%>css/top.css" rel="stylesheet" type="text/css">
	</head>
	<style>
td {
	padding: 0px 0px 0px 0px;
}
</style>
	<body class="nomargin">
		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			background="<%=basePath%>images/top_bg.gif" style="background-repeat: repeat-x">
			<tr>
				<td width="40%" height="72" align="left" valign="top">
					<img src="<%=basePath%>images/top_bar_logo3.gif" width="360" height="72" />
				</td>
				<td width="60%" align="right" valign="bottom" class="banner">
					<table width="100%" border="0" cellspacing="0" cellpadding="0"
						>
						<tr>
							<td width="100%" height="40" align="right" valign="middle"
								class="blueFont" align="right" nowrap="nowrap">
								<s:property value="message" escape="false"/>
								<a href="<%=basePath%>user/index.action?sessionId=<s:property value="sessionId"/>" target="main" class="fonta"><img src="<%=basePath%>images/icon_home.gif" style="border:0;margin-top: 12px;" width="16" height="16" />首页</a>
								<a href="<%=basePath%>user/userUpdatePassword.jsp?sessionId=<s:property value="sessionId"/>&id=<s:property value="userId"/>&sign=self" target="main"  class="fonta"><img src="<%=basePath%>images/icon_help.gif" style="border:0;margin-top: 12px;" width="16" height="16" />修改密码</a>
								<a href="javascript:exitSys();" class="fonta"><img src="<%=basePath%>images/icon_exit.gif" style="border:0;margin-bottom: 0px;" width="16" height="16" />退出系统</a>
							</td>
						</tr>
					</table>

				</td>
			</tr>
			<tr>
				<td colspan="2" background="<%=basePath%>images/top_bar_bg02.jpg"
					style="background-repeat: repeat-x"></td>
			</tr>
			<tr>
				<td height="2" colspan="2" bgcolor="#ffffff"></td>
			</tr>
		</table>
	</body>
</html>