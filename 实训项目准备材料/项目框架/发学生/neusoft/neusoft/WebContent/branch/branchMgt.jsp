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
						"branchEntity.id" :  {
							required : true,
							maxlength : 15
				         },
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
						"branchEntity.id" :  {
							required : "请输入开发部编号",
							maxlength : jQuery.format("开发部编号至多输入{0}位")
				         },
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
		    createTitle("开发部管理");   
		</script>
   
        <form id="insertForm" action="<%=basePath%>branch/insertBranch.action" style="margin: 0;padding: 0;" onsubmit="return true;" method="post">
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="2" height="25">
						新增开发部
					</th>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						开发部编号
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						  <input type="text" id="branchEntity.id" value="" name="branchEntity.id"/><label for="branchEntity.id"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						开发部名称
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="text" id="branchEntity.name" value="" name="branchEntity.name"/><label for="branchEntity.name"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" width="17%" height="23">
						开发部地址
						<span class="TableRow2"></span>
					</td>
					<td width="83%" class="td_bg">
						<input type="text" id="branchEntity.address" value="" name="branchEntity.address"/><label for="branchEntity.address"></label>
					</td>
				</tr>
				<tr>
					<td class="td_bg" colspan="2" height="23" align="center">
					    <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />
						<input type="submit" class="ACT_btn" value="新增开发部" />
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
					<th class="bg_tr" align="left" colspan="5" height="25">
						开发部列表
					</th>
				</tr>
				<tr>
					<th class="bg_tr" align="center" width="10%" height="25">
						开发部编号
					</th>
					<th class="bg_tr" align="center" width="20%" height="25">
						开发部名称
					</th>
					<th class="bg_tr" align="center" width="40%" height="25">
						开发部地址
					</th>
					<th class="bg_tr" align="center" width="10%" height="25">
						开发部状态
					</th>
					<th class="bg_tr" align="center" width="20%" height="25">
						操作
					</th>
				</tr>
                <s:iterator value="branchList" status="st">
				<tr>
					<td class="td_bg" height="23">
						<s:property value="id"/>
					</td>  
					<td class="td_bg">
						<s:property value="name"/>
					</td>
					<td class="td_bg">
						<s:property value="address"/>
					</td>
					<td class="td_bg">
						<s:if test='%{isDel == "1"}'>冻结</s:if>
						<s:else>激活</s:else>
					</td>
				    <td class="td_bg">
						<a href="javascript:editBranch('<s:property value="id"/>')"><img src="<%=basePath%>images/update.gif" alt="编辑开发部" hspace="0" align="absmiddle" border="0"/>编辑开发部</a>
					</td>
				</tr>
				 </s:iterator>
			</tbody>
		</table>
    <form name="editForm" action="<%=basePath%>branch/getBranch.action" method="post">			
	   <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />			
       <input type="hidden" name="id" id="branchId"/>
    </form>
	<script language="javascript">
	   function editBranch(id){
	       document.getElementById("branchId").value=id;
	       document.editForm.submit();
	   }
	</script>
		<%@include file="/include/foot.jsp"%>
	</body>
</html>