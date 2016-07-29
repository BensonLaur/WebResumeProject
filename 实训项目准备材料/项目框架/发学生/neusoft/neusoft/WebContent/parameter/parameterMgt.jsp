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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta name="description" content="NeudeuSDD招聘管理系统" />
		<meta name="keywords" content="NeudeuSDD招聘管理系统" />
		<script type="text/javascript"
			src="<%=basePath%>js/jquery-1.4.2.min.js">
		</script>
		<script type="text/javascript"
			src="<%=basePath%>js/jquery.validate_pack.js">
		</script>
	</head>
	<body>
		<%@include file="/include/head.jsp"%>
		<script language="javascript">
		    createTitle("参数管理");   
		</script>
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="5" height="25">
						参数列表
					</th>
				</tr>
				<tr>
					<th class="bg_tr" align="center" width="20%" height="25">
						参数编号
					</th>
					<th class="bg_tr" align="center" width="20%" height="25">
						参数描述
					</th>
					<th class="bg_tr" align="center" width="30%" height="25">
						参数值
					</th>
					<th class="bg_tr" align="center" width="30%" height="25">
						操作
					</th>
				</tr>
                <s:iterator value="parameterList" status="st">
				<tr>
					<td class="td_bg" height="23">
						<s:property value="paramKey"/>
					</td>  
					<td class="td_bg" height="23">
						<s:property value="description"/>
					</td>  
					<td class="td_bg">
						<form name="<s:property value="paramKey"/>Form" action="<%=basePath%>param/updateParameter.action" style="margin: 0;padding: 0;" onsubmit="return true;" method="post">
							<input type="text"  name="parameterEntity.paramValue"  value="<s:property value="paramValue"/>"/>
							<input type="hidden"  name="parameterEntity.paramKey" value="<s:property value="paramKey"/>"/>
							<input type="hidden"  name="sessionId" value="<s:property value="sessionId"/>"/>
						</form>
					</td>
				    <td class="td_bg">
						<a href="javascript:updateParameter('<s:property value="paramKey"/>')"><img src="<%=basePath%>images/update.gif" alt="更新" hspace="0" align="absmiddle" border="0"/>更新参数</a> 
					</td>
				</tr>
				 </s:iterator>
			</tbody>
		</table>
    
	<script language="javascript">
	   function updateParameter(paramKey){
	   	   if(null==paramKey){
	   	   		alert('参数为空，无法完成操作！');
	   	   		return;
	   	   }
	       eval("document." + paramKey + "Form.submit()");
	   }
	</script>
		<%@include file="/include/foot.jsp"%>
	</body>
</html>