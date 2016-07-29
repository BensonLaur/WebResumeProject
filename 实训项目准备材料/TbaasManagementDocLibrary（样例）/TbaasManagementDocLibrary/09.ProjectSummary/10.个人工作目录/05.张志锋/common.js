


//全选   传入参数 复选框的名字
function selectAll(checkName) 
{ 

	var code_Values = document.getElementsByName(checkName); 
	for(i = 0;i < code_Values.length;i++){ 
			code_Values[i].checked = true; 	
	} 	   	
}


function unSelect(checkName) 
{ 
	var code_Values = document.getElementsByName(checkName); 
	for(i = 0;i < code_Values.length;i++){ 
			code_Values[i].checked = false; 		
	} 	   	
}

function selectReverse(checkName) 
{ 
	var code_Values = document.getElementsByName(checkName); 
	for(i = 0;i < code_Values.length;i++){ 
		if(code_Values[i].checked == false)	
			{
			   code_Values[i].checked = true;	
			}
		else
		code_Values[i].checked = false;	 		
	} 	   	
}
