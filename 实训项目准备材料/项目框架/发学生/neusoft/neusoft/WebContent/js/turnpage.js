/**
*=================================================================
*名称:			
*Name:			ShowoPage With JavaScript
*RCSfile:		
*Revision:		
*Author:		
*Date:			
*Description:	js分页样式，显示上一页下一页的翻页结果
*=================================================================
*/

var CurrPage,re,iurl,FirstPageUrl,PrevPageUrl,NextPageUrl,LastPageUrl,PageCount,prevpage,nextpage,PageStart,PageEnd,i,ipage;	

function FromatPage(str,StartNum,EndNum) {
	str+="";
	if (str.length>=1) {
		mynum=parseInt(str,10);
		if (isNaN(mynum)) {
			mynum=StartNum;
		}
		else {
			if (EndNum>-1) {
				mynum=(mynum<StartNum)?StartNum:mynum;
				mynum=(mynum>EndNum)?EndNum:mynum;
			}
			else {
				mynum=(mynum<StartNum)?StartNum:mynum;
			}
		}
	}
	else {
		mynum=StartNum;
	}
	return (mynum);
}
function CheckPage(iPageCount) {
	ipage=pageNum.value;
	toPage(FromatPage(ipage,1,iPageCount));
}
function ShowoPage(Tabstart,Tabend,CurrPageFont1,CurrPageFont2,PageCountFont1,PageCountFont2,PrePageFont1,PrePageFont2,RecCountFont1,RecCountFont2,FirstFont,PrevFont,NextFont,LastFont,Jump,PageNumFont1,PageNumFont2,PageNumFont3,PageNumFont4,iRecCount,iRecPerPage,iPageNum,CurrentPage) {
	RecCount=FromatPage(iRecCount,0,-1);
	RecPerPage=FromatPage(iRecPerPage,1,-1);
	PageNum=FromatPage(iPageNum,0,-1);
	PageCount=(RecCount%RecPerPage==0)?(RecCount/RecPerPage):(FromatPage((RecCount/RecPerPage),0,RecCount)+1);
	CurrPage=(PageCount>0)?(FromatPage(CurrentPage,1,PageCount)):(FromatPage(CurrentPage,0,PageCount));
	prevpage=FromatPage((CurrPage-1),1,PageCount);  
	nextpage=FromatPage((CurrPage+1),1,PageCount);  
	
	if (CurrPage<=1&&PageCount<=1) {
		FirstPageUrl="&nbsp;"+FirstFont+"&nbsp;";
		PrevPageUrl="&nbsp;" +PrevFont+ "&nbsp;";
		NextPageUrl="&nbsp;" +NextFont+ "&nbsp;";
		LastPageUrl="&nbsp;" +LastFont+ "&nbsp;";
	}
	else if (CurrPage==1&&PageCount>1) {
		FirstPageUrl="&nbsp;" + FirstFont+ "&nbsp;";
		PrevPageUrl="&nbsp;" +PrevFont+"&nbsp;";
		NextPageUrl="&nbsp;<a href=\"javascript:toPage("+nextpage+")\">"+NextFont+"</a>&nbsp;"
		LastPageUrl="&nbsp;<a href=\"javascript:toPage("+PageCount+")\">"+LastFont+"</a>&nbsp;";
	}
	else if (CurrPage==PageCount) {
		FirstPageUrl="&nbsp;<a href=\"javascript:toPage(1)\">"+FirstFont+"</A>&nbsp;";
		PrevPageUrl="&nbsp;<a href=\"javascript:toPage("+prevpage+")\">"+PrevFont+"</A>&nbsp;";
		NextPageUrl="&nbsp;"+NextFont+"&nbsp;";
		LastPageUrl="&nbsp;"+LastFont+"&nbsp;";
	}
	else {
	    FirstPageUrl="&nbsp;<a href=\"javascript:toPage(1)\">"+FirstFont+"</a>&nbsp;";
		PrevPageUrl="&nbsp;<a href=\"javascript:toPage("+prevpage+")\">"+PrevFont+"</a>&nbsp;";
		NextPageUrl="&nbsp;<A href=\"javascript:toPage("+nextpage+")\">"+NextFont+"</a>&nbsp;";
		LastPageUrl="&nbsp;<A href=\"javascript:toPage("+PageCount+")\">"+LastFont+"</a>&nbsp;";
	}
	PageStart=FromatPage((CurrPage-PageNum),1,PageCount);  
	PageEnd=FromatPage((CurrPage+PageNum),1,PageCount);  
	document.write ("<div align='center' style='padding-bottom:5px'>"+CurrPageFont1+CurrPage+CurrPageFont2+PageCountFont1+PageCount+PageCountFont2+PrePageFont1);
	document.write (RecPerPage+PrePageFont2+RecCountFont1+RecCount+RecCountFont2+FirstPageUrl+PrevPageUrl);
	if (CurrPage>=1) {
		for (i=PageStart;i<=PageEnd;i++) {
			if (i!=CurrPage) {
				document.write ("&nbsp;<a href=\"javascript:toPage("+i+")\">"+PageNumFont1+i+PageNumFont2+"</A>&nbsp;");
			}
			else {
				document.write ("&nbsp;"+PageNumFont3+i+PageNumFont4+"&nbsp;");
			}
		}
	}
	document.write (NextPageUrl+LastPageUrl+Jump);
	document.write ("<INPUT type=\"text\" id=\"pageNum\" style=\"width:30px;\" size=\"5\" maxlength=\"10\" onkeydown=\"if (event.keyCode==13) CheckPage("+PageCount+")\">&nbsp;&nbsp;<INPUT type=\"button\" style=\"width:50px;height:20px\"  value=\"跳转\" onClick=\"CheckPage("+PageCount+")\">"+Tabend+"</div>");
}

function toPage(pageNum){
	document.getElementById("pageNumId").value = pageNum;
	document.searchPagerForm.submit();
}