<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<script language="javascript">
var oldpathCols;
function changeWin(){
	var pathCols= parent.middleFrame.cols;
	var m=pathCols.split(",");
	if(m[0]!=0)	{
		oldpathCols=pathCols;
		parent.middleFrame.cols="0,*";
		document.all["imghref"].innerHTML="<img src='<%=basePath%>images/icon_wrap_01.gif' alt='展开功能菜单' border=0>";
	}else{
		parent.middleFrame.cols=oldpathCols;
		document.all["imghref"].innerHTML="<img src='<%=basePath%>images/icon_wrap_02.gif'alt='收起功能菜单' border=0>";
	}
}

</script>

<style type="text/css">
<!--

body{
background-color:#0878c8;
margin:0px 0px 0px 0px;
}
img{
border:0px solid #cccccc;
}

-->
</style>
</head>
<body >
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
  <td width="25" height="24" align="center" valign="middle"><a href="#" onclick="changeWin()" id="imghref"><img src="<%=basePath%>images/icon_wrap_02.gif" alt="收起功能菜单" width="16" height="16" hspace="0" align="absmiddle"/></a></td>
   <td  valign="middle" class="blueFont" id="path"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="83%" class="blueFont">当前位置:首页</td>
        </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
