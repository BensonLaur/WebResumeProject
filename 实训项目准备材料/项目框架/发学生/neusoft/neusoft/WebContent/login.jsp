<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
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
		<link href="<%=basePath%>css/login.css" rel="stylesheet"
			type="text/css"/>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta name="description" content="NeudeuSDD招聘管理系统" />
		<meta name="keywords" content="NeudeuSDD招聘管理系统" />
		<script type="text/javascript">

//change the pic
function changepic() {
	document.getElementById("img").src = "<%=basePath%>randNum.action?checkKey=loginRanNum&temp="
			+ Math.random();
}
</script>
	</head>
	<body onload="javascript:document.getElementById('userEntity.id').focus()">
		<form id="loginform" name="loginform" method="post"
							action="<%=basePath%>user/login.action" style="margin: 0;padding: 0;" onsubmit="return true;">
		<div class="loginbg">
			<table width="579" height="315" border="0" cellpadding="0"
				cellspacing="0">
				<tr valign="bottom">
					<td width="82" height="190">&nbsp;</td>
					<td width="56">&nbsp;</td>
					<td width="208" valign="bottom">&nbsp;</td>
					<td width="95">&nbsp;</td>
					<td width="138">&nbsp;</td>
				</tr>
				<tr>
					<td height="31" colspan="4" align="center" valign="center">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<s:actionerror />
					</td>
				</tr>
				<tr>
					<td colspan="3">
							<table border="0" width="100%">
								<tr>
									<td height="30" style="width:82px;">&nbsp;</td>
									<td align="left" valign="middle" height="30" width="56">用户名：</td>
									<td align="left" valign="middle" width="208">
										<span id="jr_login_input1"> 
											<input type="text" id="userEntity.id" class="login_input1"
													value='<s:property value="userEntity.id"/>'
													name="userEntity.id" /> 
										</span>
									</td>
								</tr>
								<tr>
									<td height="30">&nbsp;</td>
									<td align="left" valign="middle" height="30">密&nbsp;&nbsp;&nbsp;&nbsp;码：
									</td>
									<td align="left" valign="middle">
										<span id="jr_login_input1">
											<input type="password" id="userEntity.password" value=""
												name="userEntity.password" class="login_input1" /> 
										</span>
									</td>
								</tr>
								<tr>
									<td height="30">&nbsp;</td>
									<td height="30" align="left" valign="middle">验证码：</td>
									<td align="left" valign="middle">
										<span id="jr_login_input2"> 
											<input type="text" name="checkCode" id="checkCode" class="login_input2" />
										</span>
										 <img id="img" src="<%=basePath%>randNum.action?temp=<%=new Date().getTime()%>&checkKey=loginRanNum"
											onclick="changepic()" title="点击图片，换一张" />
										<input type="hidden" name="checkKey" value="loginRanNum" />
									</td>
								</tr>
							</table>
					</td>
					<td colapan="2">
						<table border="0" width="100%">
							<tr height="90" width="100%">
								<td align="left" valign="middle" width="100%">
									<label>
										<input type="submit" value="" name="button" id="button" class="login_but"/>
									</label>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="20" colspan="4" align="center" valign="center">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;技术支持：北京分部
					</td>
				</tr>
			</table>
		</div>
		</form>
	</body>
</html>