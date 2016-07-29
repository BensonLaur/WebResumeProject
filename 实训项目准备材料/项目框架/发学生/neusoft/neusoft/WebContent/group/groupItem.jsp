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
		<script type="text/javascript">
		$(document).ready(function() {     
		    $("input[name=checkItems]").each(function(n){
		      <s:iterator value="groupItemList" status="st">
		    	if($(this).val() == '<s:property value="itemId"/>') $(this).attr("checked", true);
		      </s:iterator>
		    });
		});
</script>
	</head>
	<body>
		<%@include file="/include/head.jsp"%>
		<script language="javascript">
		    createTitle("编辑组权限");   
		</script>
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
			    <tr>
					<td class="td_bg" align="center" colspan="3" height="25">
						<s:property value="groupEntity.name"/>
					</td>
				</tr>
				<tr>
					<th class="bg_tr" align="left" colspan="3" height="25">
						权限列表
					</th>
				</tr>
				<tr>
					<th class="bg_tr" align="center" width="40%" height="25">
						所属模块
					</th>
					<th class="bg_tr" align="center" width="40%" height="25">
						功能
					</th>
					<th class="bg_tr" align="center" width="20%" height="25">
						选择
					</th>
				</tr>
				<s:iterator value="menuItemList" status="st">
				<tr>
					<td class="td_bg" height="23">
						<s:property value="menuName"/>
					</td>  
					<td class="td_bg">
						<s:property value="itemName"/>
					</td>
					<td class="td_bg" align="center">
						 <input type="checkbox" value="<s:property value="itemId"/>" name="checkItems" class="input_checkbox"/>
					</td>
				</tr>
				 </s:iterator>
				 <tr>
					<td class="td_bg" colspan="3" height="23" align="center">
					    <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />
						<input type="button" class="ACT_btn" value="更新权限" onclick="editGroupItem()"/>
						<span class="TableRow2"></span>
						<input type="button" class="ACT_btn" value="返回" onclick="javascript:document.location.href = '<%=basePath%>group/getAllGroup.action?sessionId=<s:property value="sessionId"/>'"/>
						<span class="TableRow2"></span>
					</td>
				</tr>
			</tbody>
			
		</table>
     <form name="editGroupItemForm" method="post" action="<%=basePath%>group/updateGroupItem.action">			
	   <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />			
       <input type="hidden" name="id" value="<s:property value="groupEntity.id"/>"/>
       <input type="hidden" name="selItems" id="selItems"/>
    </form>
	<script language="javascript">
	   function editGroupItem(){
	      var  s='';    
          $('input[name="checkItems"]:checked').each(function(){    
            s+=$(this).val() + ",";    
          });   
	   
	       document.getElementById("selItems").value=s;
	       document.editGroupItemForm.submit();
	   }
	</script>
		<%@include file="/include/foot.jsp"%>
	</body>
</html>