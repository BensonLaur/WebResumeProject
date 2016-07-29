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
		<link href="<%=basePath%>css/comm.css" rel="stylesheet"
			type="text/css" />
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta name="description" content="NeudeuSDD招聘管理系统" />
		<meta name="keywords" content="NeudeuSDD招聘管理系统" />
	</head>
<body>
<%@include file="/include/head.jsp" %>
	<script language="javascript">
        createTitle("系统错误信息");
     </script>
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="left" colspan="2" height="25">系统错误信息</th>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">错误原因<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong><font color="red">重复提交数据</font> <span class="TableRow1"></span></strong><br/>
           <a href="javaScript:history.go(-1);">返回</a></td>
    </tr>
  </tbody>
</table>
<%@include file="/include/foot.jsp" %>
	</body>
</html>