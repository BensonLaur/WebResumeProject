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
				var validator = $("#insertForm").validate( {
					rules : {
						"userEntity.id" :  {
							required : true,
							minlength : 2,
					        maxlength : 12
				         },
				         "userEntity.password" :  {
							required : true,
					        minlength : 6,
					        maxlength : 20
				         },
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
						"userEntity.id" :  {
							required : "请输入用户名",
							minlength : jQuery.format("用户名至少输入{0}位"),
					        maxlength : jQuery.format("用户名至多输入{0}位")
				         },
				         "userEntity.password" :  {
							required : "请输入密码",
					        minlength : jQuery.format("密码至少输入{0}位"),
					        maxlength : jQuery.format("密码至多输入{0}位")
				         },
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
		    createTitle("用户管理");   
		</script>
   
        <form id="insertForm" action="<%=basePath%>user/insertUser.action" style="margin: 0;padding: 0;" onsubmit="return true;" method="post">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						新增用户
					</th>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						用户名
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						  <input type="text" id="userEntity.id" value="" name="userEntity.id"/><label for="userEntity.id"></label>
					</td>
				</tr>
				<tr>
				<td class="td_bg" width="17%" height="23">
						用户密码
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						  <input type="password" id="userEntity.password" value="" name="userEntity.password"/><label for="userEntity.password"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						用户昵称
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="text" id="userEntity.name" value="" name="userEntity.name"/><label for="userEntity.name"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						用户真实姓名
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="text" id="userEntity.realName" value="" name="userEntity.realName"/><label for="userEntity.realName"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						用户电话号码
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="text" id="userEntity.telephone" value="" name="userEntity.telephone"/><label for="userEntity.telephone"></label>
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
					       <option value="<s:property value="id"/>"><s:property value="name"/></option>
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
					       <option value="<s:property value="id"/>"><s:property value="name"/></option>
					   </s:iterator>
					   </select><label for="userEntity.groupId"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" colspan="2" height="23" align="center">
					    <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />
						<input type="submit" class="ACT_btn" value="新增用户" />
						<span class="TableRow2"></span>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="8" height="25">
						用户列表
					</th>
				</tr>
				<tr>
					<th class="bg_tr" align="center" width="10%" height="25">
						用户名
					</th>
					<th class="bg_tr" align="center" width="10%" height="25">
						用户昵称
					</th>
					<th class="bg_tr" align="center" width="20%" height="25">
						用户真实姓名
					</th>
					<th class="bg_tr" align="center" width="10%" height="25">
						电话号码
					</th>
					<th class="bg_tr" align="center" width="10%" height="25">
						权限组
					</th>
					<th class="bg_tr" align="center" width="10%" height="25">
						所属开发部
					</th>
					<th class="bg_tr" align="center" width="10%" height="25">
						用户状态
					</th>
					<th class="bg_tr" align="center" width="20%" height="25">
						操作
					</th>
				</tr>
                <s:iterator value="userList" status="st">
				<tr>
					<td class="td_bg" height="23">
						<s:property value="id"/>
					</td>  
					<td class="td_bg">
						<s:property value="name"/>
					</td>
					<td class="td_bg">
						<s:property value="realName"/>
					</td>
					<td class="td_bg">
						<s:property value="telephone"/>
					</td>
					<td class="td_bg">
						<s:property value="groupName"/>
					</td>
					<td class="td_bg">
						<s:property value="branchName"/>
					</td>
					<td class="td_bg">
	                    <s:if test='%{isDel == "1"}'>冻结</s:if>
						<s:else>激活</s:else>
					</td>
				    <td class="td_bg">
						<a href="javascript:editUser('<s:property value="id"/>')"><img src="<%=basePath%>images/update.gif" alt="编辑用户" hspace="0" align="absmiddle" border="0"/>编辑用户</a>&nbsp;&nbsp;
						<a href="javascript:editUserPassword('<s:property value="id"/>')"><img src="<%=basePath%>images/update.gif" alt="修改密码" hspace="0" align="absmiddle" border="0"/>修改密码</a>
					</td>
				</tr>
				 </s:iterator>
			</tbody>
		</table>
    <form name="editForm" action="<%=basePath%>user/getUser.action" method="post">			
	   <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />			
       <input type="hidden" name="id" id="userId"/>
    </form>
    <form name="editPasswordForm" action="<%=basePath%>user/userUpdatePassword.jsp" method="post">			
	   <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />			
       <input type="hidden" name="id" id="userId1"/>
       <input type="hidden" name="sign" value="admin"/>
    </form>
	<script language="javascript">
	   function editUser(id){
	       document.getElementById("userId").value=id;
	       document.editForm.submit();
	   }
	   function editUserPassword(id){
	       document.getElementById("userId1").value=id;
	       document.editPasswordForm.submit();
	   }
	</script>
		<%@include file="/include/foot.jsp"%>
	</body>
</html>