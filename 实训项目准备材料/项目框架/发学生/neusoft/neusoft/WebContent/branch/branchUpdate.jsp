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
						"branchEntity.name" : {
							required : true,
							maxlength : 30
				         },
						"branchEntity.address" : {
							required : true,
							maxlength : 60
				         }
					},
					messages : {
						"branchEntity.name" :{
							required :  "请输入开发部名称",
							maxlength : jQuery.format("开发部名称至多输入{0}位")
				         },
						"branchEntity.address" :{
							required : "请输入开发部地址",
							maxlength : jQuery.format("开发部地址至多输入{0}位")
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
		    createTitle("编辑开发部");   
		</script>
   
        <form id="updateForm" action="<%=basePath%>branch/updateBranch.action" style="margin: 0;padding: 0;" onsubmit="return true;" method="post">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						编辑开发部
					</th>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						开发部编号
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						  <s:property value="branchEntity.id"/>
						  <input type="hidden" name="branchEntity.id" value="<s:property value="branchEntity.id"/>" />
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						开发部名称
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="text" id="branchEntity.name" value="<s:property value="branchEntity.name"/>" name="branchEntity.name"/><label for="branchEntity.name"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						开发部地址
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="text" id="branchEntity.address" value="<s:property value="branchEntity.address"/>" name="branchEntity.address"/><label for="branchEntity.address"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						开发部状态
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
					    <select name="branchEntity.isDel">
								<option value="0"
									<s:if test='%{branchEntity.isDel=="0"}'> selected</s:if>>
									激活
								</option>
								<option value="1"
									<s:if test='%{branchEntity.isDel=="1"}'> selected</s:if>>
									冻结
								</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_bg" colspan="2" height="23" align="center">
					    <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />
						<input type="submit" class="ACT_btn" value="编辑开发部" />
						<span class="TableRow2"></span>
						<input type="button" class="ACT_btn" value="返回" onclick="javascript:document.location.href = '<%=basePath%>branch/getAllBranch.action?sessionId=<s:property value="sessionId"/>'"/>
						<span class="TableRow2"></span>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<%@include file="/include/foot.jsp"%>
	</body>
</html>