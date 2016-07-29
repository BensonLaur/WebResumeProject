function reinitIframe(){
var iframe = document.getElementById("subpage");
try{
var bHeight = iframe.contentWindow.document.body.scrollHeight;
var dHeight = iframe.contentWindow.document.documentElement.scrollHeight;
var height = Math.max(bHeight, dHeight);
iframe.height =  height;
}catch (ex){}
}
window.setInterval("reinitIframe()", 200);
function changeIframe(tag){
var iframe = document.getElementById("subpage");
iframe.src = tag;
}
function changeIframe2(tag){
var iframe = parent.document.getElementById("subpage");
iframe.src = tag;
}

function $(tag){return document.getElementById(tag)}
function changeDiv(n){
	var tabs = $("fdiv").getElementsByTagName("table");
	//alert(tabs.length);
	for(var i=0;i<tabs.length;i++){
		tabs[i].style.display = "none"
	}
	tabs[n-1].style.display = "";
}
function changeTag(n,ftag,tag){
	var tabs = $(ftag).getElementsByTagName(tag);
	//alert(tabs.length);
	for(var i=0;i<tabs.length;i++){
		tabs[i].style.display = "none"
	}
	tabs[n-1].style.display = "";
}
function show(tag,t){
	var doms = $(tag).getElementsByTagName(t);
	for(var i=0;i<doms.length;i++){
		doms[i].style.display = "";
	}
}
function show2(tag){
	$(tag).style.display = ""
}
function hide(tag){
	$(tag).style.display = "none"
}

function showPop(tag){
	document.getElementById(tag).style.display = "block";
	document.getElementById("mask").style.display = "block";
	document.getElementById("mask").height = document.body.clientHeight;
	document.getElementById("mask").style.height = document.body.clientHeight;
}

function closePop(tag){
	document.getElementById(tag).style.display = "none";
	document.getElementById("mask").style.display = "none";
}

function nextNode(node){
	var x = node.nextSlbling;
	while (x.nodeType!=1)
   {
   x=x.nextSibling;
   }
  return x;
}
function showNote(node){
	node.nextSibling.style.display = 'block';
}

function delete_conf(delete_url){//利用对话框返回的值（true 或者 false）
    if(confirm("你确认要删除？"))
    {//如果是true ，那么就把页面url
         location.href=delete_url;
     }
    else
    {//否则说明下了
         alert("操作已取消！");
     }	
}

function checkAll() 
{ 
	var code_Values = document.getElementsByTagName("input"); 
	for(i = 0;i < code_Values.length;i++){ 
		if(code_Values[i].type == "checkbox") 
		{ 
			code_Values[i].checked = true; 
		} 
	} 
}
 
function uncheckAll() 
{ 
	var code_Values = document.getElementsByTagName("input"); 
	for(i = 0;i < code_Values.length;i++){ 
		if(code_Values[i].type == "checkbox") 
		{ 
			code_Values[i].checked = false; 
		} 
	} 
} 

function chkAllClick(tag){
 var arrChk = document.getElementsByName(tag);
 for(i=0;i<arrChk.length;i++) {
  if(arrChk[i].checked != true)
     arrChk[i].checked = true;
 }
}

function oppCheck() 
{ 
	var code_Values = document.getElementsByTagName("input"); 
	for(i = 0;i < code_Values.length;i++){ 
		if(code_Values[i].type == "checkbox") 
		{ 
			code_Values[i].click();
		} 
	} 
} 

var o;
function MoveTo(index)
{
  if (index!=undefined)
  {
    o=source.options[index];  
    distinct.options.add(new Option(o.text,o.value));
    source.remove(index);
  }
  else
  {
    for(var i=0;i<source.options.length;)
    {
      if(source.options[i].selected)
      {
         o=source.options[i];
         distinct.options.add(new Option(o.text,o.value));
         source.options.remove(i);
         i=0;
      }
      else
       i++;
    }
  }
}
function MoveBack(index)
{
  if (index!=undefined)
  {
    o=distinct.options[index];
    source.options.add(new Option(o.text,o.value));
    distinct.remove(index);    
  }
  else
  {
    for(var i=0;i<distinct.options.length;)
    {
      if(distinct.options[i].selected)
      {
         o=distinct.options[i];
         source.options.add(new Option(o.text,o.value));
         distinct.options.remove(i);
         i=0;
      }
      else
        i++;
    }
  }
}