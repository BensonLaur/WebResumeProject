<%@ page language="java" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
    String id = request.getParameter("id");
    String sessionId = request.getParameter("sessionId");
    String sign = request.getParameter("sign");
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
					    userPassword : {
					        required : true,
				        	minlength : 6,
					        maxlength : 40
				        },
				        repassword : {
					        required : true,
					        minlength : 6,
					        maxlength : 40,
					        equalTo : "#userPassword"
				        }
					},
					messages : {
				        userPassword : {
							required : "请输入密码",
							minlength : jQuery.format("密码至少输入{0}位"),
							maxlength : jQuery.format("密码至多输入{0}位")
						},
						repassword : {
							required : "请重新输入密码",
							minlength : jQuery.format("密码至少输入{0}位"),
							maxlength : jQuery.format("密码至多输入{0}位"),
							equalTo:"两次密码输入不一致"
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
		    createTitle("修改用户密码");   
		</script>
   
        <form id="updateForm" action="<%=basePath%>user/updateUserPassword.action" style="margin: 0;padding: 0;" onsubmit="return true;" method="post">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						修改用户密码
					</th>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						用户名
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						  <%=id %>
						  <input type="hidden" name="userEntity.id" value="<%=id %>" />
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						新密码
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="password" id="userPassword" value="" name="userPassword"/><label for="userPassword"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						重复输入密码
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="password" id="repassword" value="" name="repassword"/><label for="repassword"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" colspan="2" height="23" align="center">
					    <input type="hidden" name="sessionId" value="<%=sessionId %>" />
					    <input type="hidden" name="sign" value="<%=sign %>" />
						<input type="submit" class="ACT_btn" value="修改密码" />
						<% if("admin".equals(sign)){ %>
						<span class="TableRow2"></span>
						<input type="button" class="ACT_btn" value="返回" onclick="javascript:document.location.href = '<%=basePath%>user/getAllUser.action?sessionId=<%=sessionId %>'"/>
						<% } %>
						<span class="TableRow2"></span>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<%@include file="/include/foot.jsp"%>
	</body>
</html>