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
	<script type="text/javascript">
	if(parent != null){
	   parent.window.location = "<%=basePath%>login.jsp";
	}
	if(window.opener != null){
	   if(window.opener.parent != null){
	       window.opener.parent.window.location = "<%=basePath%>login.jsp";
	   }else{
	       window.opener.location.href="<%=basePath%>login.jsp";
	   }
	   window.close();
	}else{
	     window.location.href="<%=basePath%>login.jsp";
	}
    </script>
	</head>
	<body></body>
</html>