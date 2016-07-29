<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="com.neusoft.comon.init.PropertiesUtil"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String version = PropertiesUtil.get("version");
	String copyright = PropertiesUtil.get("copyright");
	String client = PropertiesUtil.get("clientCompany");
	String contact = PropertiesUtil.get("contact.information");
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
        createTitle("首页");
     </script>
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="left" colspan="2" height="25">当日系统访问情况</th>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">会员访问量<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong><font color="red"><s:property value="clientVisitCount"/></font> <span class="TableRow1"></span></strong></td>
    </tr>
        <tr>
      <td class="td_bg" width="17%" height="23">非会员访问量<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong><font color="red"><s:property value="clientVisitCount"/></font> <span class="TableRow1"></span></strong></td>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">用户访问量<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong><font color="red"><s:property value="clientVisitCount"/></font> <span class="TableRow1"></span></strong></td>
    </tr>
   <tr>
      <td class="td_bg" width="17%" height="23">本服务器在线用户数<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong><font color="red"><s:property value="curUserCount"/></font> <span class="TableRow1"></span></strong></td>
    </tr>
  </tbody>
</table>
<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" 
border="0">
  <tbody>
    <tr>
      <th class="bg_tr" align="left" colspan="2" height="25">系统信息 </th>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">授权客户<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong><%= client%></strong></td>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">版权所有<span class="TableRow2"></span></td>
      <td width="83%" class="td_bg"><strong><%= copyright %></strong></td>
    </tr>
    <tr>
      <td class="td_bg" height="23">联系方式<span class="TableRow2"></span></td>
      <td class="td_bg"><%= contact%></td>
    </tr>
    <tr>
      <td class="td_bg" height="23">当前系统版本<span class="TableRow2"></span></td>
      <td class="td_bg"><%= version%></td>
    </tr>
    <tr>
      <td class="td_bg" width="17%" height="23">版权声明<span class="TableRow2"></span></td>
      <td class="td_bg" width="83%">
        1、本软件未经书面授权，不得向任何第三方提供本软件系统; <br/>        
        2、由服务器运营商和客户误或恶意操作造成的一切损失版权所有方将不承担任何责任; <br/>      
        3、本软件未经书面授权不可以对任何程序进行修改操作;  　<br/>
        4、本软件受中华人民共和国《著作权法》《计算机软件保护条例》等相关法律、法规保护，作者保留一切权利。</td>
    </tr>
  </tbody>
</table>
<%@include file="/include/foot.jsp" %>
	</body>
</html>