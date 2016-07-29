<%@ page language="java" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@page import="com.opensymphony.xwork2.ActionContext"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<script language=javascript>
var displayBar = true;
function switchBar(obj) {
	if (displayBar) {
		parent.frame.cols = "0,*,0";
		displayBar = false;
		obj.innerHTML = "<img src='<%=basePath%>images/icon_wrap_01.gif' alt='展开功能菜单' width='16' height='16' hspace='0' align='absmiddle' border='0'>";
	} else {
		parent.frame.cols = "195,*,195";
		displayBar = true;
		obj.innerHTML = "<img src='<%=basePath%>images/icon_wrap_02.gif' alt='收起功能菜单' width='16' height='16' hspace='0' align='absmiddle' border='0'>";
	}
}

function createTitle(titleName) {
	var strTable = "";
	strTable += '<table class="table" cellspacing="1" cellpadding="2" width="99%" align="center" border="0">';
	strTable += '<tbody>';
	strTable += '<tr>';
	strTable += '<th class="bg_tr" align="left" height="25"><a href="#" onclick="switchBar(this)" id="imghref"><img src="<%=basePath%>images/icon_wrap_02.gif" alt="收起功能树" width="16" height="16" hspace="0" align="absmiddle" border="0"/></a>';
	strTable += '当前位置：';
	strTable += titleName;
	strTable += '<span class="message" style="margin-left:33%;"><s:property value="message"/></span>&nbsp;';
	strTable += '</th>';
	strTable += '</tr>';
	strTable += '</tbody>';
	strTable += '</table>';
	document.write(strTable);
}
function uploadFile(id) {
	if(document.getElementById(id).value == '' ||document.getElementById(id).value == 'undefined' || document.getElementById(id).value.indexOf(".") < 0 ){
	     alert('请输入完整有效文件名！');
	}else{
	    window.open(
					"<%=basePath%>initUpload.action?fileName=" + document.getElementById(id).value,
					"文件上传",
					"height=300, width=800,top=50 ,left= 300, toolbar=no, menubar=no, scrollbars=no, resizable=no,location=no, status=no");
	}
}

function setSelectValue(id,value){
    var selectId=document.getElementById(id);
    for(var i=0;i<selectId.options.length;i++) 
     { 
          if(selectId.options[i].value == value) 
          { 
             selectId.options[i].selected = true;  
             return; 
          } 
     }  
}
</script>