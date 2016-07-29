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
			 <tr>
    <td height="5" style="background:url(<%=basePath%>images/tableline_top.jpg) no-repeat" bgcolor="#9BC2ED"></td>
  </tr>
  <tr>
    <td height="8">
     <table class=leftframetable cellSpacing=1 cellPadding=1 width="97%" align=right border=0>
      <tbody>
        <tr>
          <td height="25" style="background:url(<%=basePath%>images/left_tt.gif) no-repeat"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="20"></td>
          <td class=STYLE1 height=25>系统信息</td>
            </tr>
          </table></td>
          </tr>
        <tr>
          <td height=105>
		     <span class="STYLE2">
		      <img src="<%=basePath%>images/closed.gif"/>版权所有:<%=copyright %><br/>
              <img src="<%=basePath%>images/closed.gif"/>设计制作:<%=copyright %><br/>
              <img src="<%=basePath%>images/closed.gif"/>技术支持:<%=copyright %><br/>
              <img src="<%=basePath%>images/closed.gif"/>帮助中心:<%=copyright %><br/>
              <img src="<%=basePath%>images/closed.gif"/>系统版本:<%=version %>
             </span>
          </td>
        </tr>
      </tbody>
    </table>	
    </td>
  </tr>
  <tr>
     <td height="5" style="background:url(<%=basePath%>images/tableline_bottom.jpg) no-repeat" bgcolor="#9BC2ED"></td>
  </tr>
</table>

<script language="JavaScript"> 
function myrefresh() 
{ 
       window.location.href = window.location.href; 
} 
setTimeout('myrefresh()',60000); //指定1分钟刷新一次 
</script>
</body></html>