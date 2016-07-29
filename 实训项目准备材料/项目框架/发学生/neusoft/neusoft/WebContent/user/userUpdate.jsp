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
			// validate signup form on keyup and submit
				var validator = $("#updateForm").validate( {
					rules : {
				         "userEntity.name" :  {
							maxlength : 15
				         },
						"userEntity.realName" : {
							maxlength : 15
				         },
						"userEntity.telephone" : {
							maxlength : 20
				         }
					},
					messages : {
				         "userEntity.name" :  {
							maxlength : jQuery.format("用户昵称至多输入{0}位")
				         },
						"userEntity.realName" : {
							maxlength : jQuery.format("真实姓名至多输入{0}位")
				         },
						"userEntity.telephone" : {
							maxlength : jQuery.format("电话号码至多输入{0}位")
				         }
					},
					// the errorPlacement has to take the layout into account
					errorPlacement : function(error, element) {
						error.insertAfter(element.parent().find('label:first'));
					},
					// set new class to error-labels to indicate valid fields
					success : function(label) {
						// set &nbsp; as text for IE
					label.html("&nbsp;").addClass("ok");
				}
				});
		
			});
</script>
	</head>
	<body>
		<%@include file="/include/head.jsp"%>
		<script language="javascript">
		    createTitle("编辑用户");   
		</script>
   
        <form id="updateForm" action="<%=basePath%>user/updateUser.action" style="margin: 0;padding: 0;" onsubmit="return true;" method="post">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						编辑用户
					</th>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						用户名
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						  <s:property value="userEntity.id"/>
						  <input type="hidden" name="userEntity.id" value="<s:property value="userEntity.id"/>" />
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						用户昵称
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="text" id="userEntity.name" value="<s:property value="userEntity.name"/>" name="userEntity.name"/><label for="userEntity.name"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						用户真实姓名
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="text" id="userEntity.realName" value="<s:property value="userEntity.realName"/>" name="userEntity.realName"/><label for="userEntity.realName"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						用户电话号码
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="text" id="userEntity.telephone" value="<s:property value="userEntity.telephone"/>" name="userEntity.telephone"/><label for="userEntity.telephone"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						所属开发部
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
					   <select id="userEntity.branchId" name="userEntity.branchId">
					   <option value="">所有开发部权限</option>
					   <s:iterator value="branchList" status="st">
					       <option value="<s:property value="id"/>" <s:if test="id == userEntity.branchId"> selected</s:if>><s:property value="name"/></option>
					   </s:iterator>
					   </select><label for="userEntity.branchId"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						权限组
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
					  <select id="userEntity.groupId" name="userEntity.groupId">
					   <s:iterator value="groupList" status="st">
					       <option value="<s:property value="id"/>" <s:if test="id == userEntity.groupId"> selected</s:if>><s:property value="name"/></option>
					   </s:iterator>
					   </select><label for="userEntity.groupId"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						用户状态
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
					    <select name="userEntity.isDel">
							   <option value="0"
									<s:if test='%{userEntity.isDel=="0"}'> selected</s:if>>
									激活
								</option>
								<option value="1"
									<s:if test='%{userEntity.isDel=="1"}'> selected</s:if>>
									冻结
								</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_bg" colspan="2" height="23" align="center">
					    <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />
						<input type="submit" class="ACT_btn" value="编辑用户" />
						<span class="TableRow2"></span>
						<input type="button" class="ACT_btn" value="返回" onclick="javascript:document.location.href = '<%=basePath%>user/getAllUser.action?sessionId=<s:property value="sessionId"/>'"/>
						<span class="TableRow2"></span>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<%@include file="/include/foot.jsp"%>
	</body>
</html>