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
		<title>客户信息管理</title>
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
	</head>
	<body>
		<%@include file="/include/head.jsp"%>
		<script language="javascript">
		    createTitle("客户信息管理"); 
		</script>
   		
		<table class="table" cellspacing="1" cellpadding="2" width="99%"
			align="center" border="0">
			<tbody>
				<tr>
					<th class="bg_tr" align="left" colspan="7" height="25">
						客户信息列表
					</th>
				</tr>
				<tr>
					<th class="bg_tr" align="center" width="15%" height="25">
						姓名
					</th>
					<th class="bg_tr" align="center" width="10%" height="25">
						性别
					</th>
					<th class="bg_tr" align="center" width="10%" height="25">
						年龄
					</th>
					<th class="bg_tr" align="center" width="15%" height="25">
						密码
					</th>
					<th class="bg_tr" align="center" width="10%" height="25">
						是否删除
					</th>
					<th class="bg_tr" align="center" width="20%" height="25">
						创建时间
					</th>
					<th class="bg_tr" align="center" width="20%" height="25">
						操作
					</th>
				</tr>
                <s:iterator value="managerList" status="manager">
				<tr>
					<td class="td_bg" height="23">
						<s:property value="managerName"/>
					</td>  
					<td class="td_bg">
						<s:if test="managerSex==0">
						男
						</s:if>
						<s:elseif test="managerSex==1">
						女
						</s:elseif>
						<s:else>
						未填写
						</s:else>
					</td>
				 	<td class="td_bg">
				 		<s:property value="managerAge"/>
					</td>
					<td class="td_bg">
						<s:property value="managerPwd"/>
					</td>
					<td class="td_bg">
						<s:if test="isDel==T">
						是
						</s:if>
						<s:else>
						否
						</s:else>
					</td>
					<td class="td_bg">
						<s:property value="createTimeStr"/>
					</td>
				    <td class="td_bg">
						<a href="javascript:editManager('<s:property value="managerId"/>')"><img src="<%=basePath%>images/update.gif" alt="编辑" hspace="0" align="absmiddle" border="0"/>编辑</a>
						<a href="javascript:detailManager('<s:property value="id"/>')"><img src="<%=basePath%>images/update.gif" alt="详细" hspace="0" align="absmiddle" border="0"/>详细</a>
					</td>
				</tr>
				 </s:iterator>
			</tbody>
		</table>
    <form name="editForm" action="<%=basePath%>manager/getManager.action" method="post">			
	   <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />			
       <input type="hidden" name="managerId" id="editId"/>
    </form>
   
    <form name="deleteForm" action="<%=basePath%>manager/deleteManager.action" method="post">			
	   <input type="hidden" name="sessionId" value="<s:property value="sessionId"/>" />
       <input type="hidden" name="managerId" id="deleteId"/>
    </form>
   
	<script language="javascript">
	   function editManager(id){
	       document.getElementById("editId").value=id;
	       document.editForm.submit();
	   }
	   function detailManager(id){
	       document.getElementById("detailId").value=id;
	       document.detailForm.submit();
	   }
	</script>
		<%@include file="/include/foot.jsp"%>
	</body>
</html>