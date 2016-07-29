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
		<title>新增客户</title>
		<link href="<%=basePath%>css/comm.css" rel="stylesheet"
			type="text/css" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<script type="text/javascript"
			src="<%=basePath%>js/jquery-1.4.2.min.js">
		</script>
		<script type="text/javascript"
			src="<%=basePath%>js/jquery.validate_pack.js">
		</script>
		<script language="javascript" type="text/javascript" src="<%=basePath%>js/My97DatePicker/WdatePicker.js"></script>
		<script language="JavaScript" type="text/JavaScript" src="<%=basePath%>js/turnpage.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {     
		var tipCon="内容不为空！";   
			// validate signup form on keyup and submit
				var validator = $("#insertForm").validate( {
					rules : {
						"managerEntity.managerName" : {
				           required : true,
				           maxlength : 20
					  	 },
						"managerEntity.managerAge" : {
							required : true,
							digits : true,
							minlength : 1,
							maxlength : 3
				         },
						"managerEntity.managerPwd" : {
							required : true,
							rangelength : [8,12]
						 }
					},
					messages : {
					    "managerEntity.realName" :{
							required :  tipCon,
							maxlength : $.format("姓名长度最大为{0}位!")
				         },
						"managerEntity.managerAge" :{
				        	required :  tipCon,
				        	digits : "请输入数字!",
				        	minlength : $.format("请输入{0}位数字!"),
							maxlength : $.format("请输入{0}位数字!")
				         },
						
						"managerEntity.managerPwd" : {
							required :  tipCon,
				        	rangelength : $.format("密码长度必须为{0}-{1}位!")
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
<!--<style type="text/css">
select{
height:20px;padding-top:2px;border:1px solid #7F9DB9;color:#1E5494;width:200px;max-width: 205px;
}

</style>-->
	</head>
	<body>
		<%@include file="/include/head.jsp"%>
		<script language="javascript">
		    createTitle("新增客户");   
		</script>
   
        <form id="insertForm" action="<%=basePath%>manager/updateManager.action" style="margin: 0;padding: 0;" onsubmit="return true;" method="post">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="4" height="25">
						编辑客户信息
					</th>
				</tr>
				<tr>
					<td class="td_bg" width="10%" height="23">
						姓名<span style="color:red">*</span>
						<span class="TableRow2"></span>
					</td>
					<td width="40%" class="td_bg" colspan="3">
						<input type="text" id="managerEntity.managerName" value="<s:property value="managerEntity.managerName"/>" name="managerEntity.managerName"/><label for="managerEntity.managerName"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="10%" height="23">
						性别
						<span class="TableRow2"></span>
					</td>
					<td width="40%" class="td_bg" colspan="3">
						<select id="managerEntity.managerSex" name="managerEntity.managerSex">
		      				  <option value="0" <s:if test="managerEntity.managerSex==0">selected</s:if>>男</option>
		      				  <option value="1" <s:if test="managerEntity.managerSex==1">selected</s:if>>女</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="10%" height="23">
						年龄
						<span class="TableRow2"></span>
					</td>
					<td width="30%" class="td_bg">
						<input type="text" id="managerEntity.managerAge" value="" name="managerEntity.managerAge"/><label for="managerEntity.managerAge"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="10%" height="23">
						密码
						<span class="TableRow2"></span>
					</td>
					<td width="40%" class="td_bg" colspan="3">
						<input type="password" id="managerEntity.managerPwd" value="" name="managerEntity.managerPwd"/><label for="managerEntity.managerPwd"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" colspan="4" height="23" align="center">
					    <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />
						<input type="submit" class="ACT_btn" value="确定" name="submitButton"/>
						<span class="TableRow2"></span>
					</td>
				</tr>
			</tbody>
		</table>
		</form>
		<%@include file="/include/foot.jsp"%>
	</body>
</html>