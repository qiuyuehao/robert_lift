<% Web_ChkUser(); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>电梯监控主机</title>
<script src="js/jquery-1.8.0.min.js"></script> 
<script src="js/jquery.cookie.js"></script> 
<link href="css/menu.css" rel="stylesheet" type="text/css" />
</head>
<!--设计一级菜单-->
<body>
<div id="box" class="easyui-layout" style="width: 100%; height:800px"> 
<div data-options="  
             region:'north',  
             title:'上北',  
             split:true,  
             iconCls:'icon-save',  
             noheader:true  
             "  
             style="height: 60px; background-color: #29333F;">  
   
            <!--div class="logo">后台管理</div -->  
            <div class="logout"> 欢迎！admin | <a onClick="eraseCookie()">退出</a></div>  
        </div>
<div style="height: 700px; width:100%; margin: 0 auto;">		
<!--第一步，写列表项和链接的代码-->
<div id="menu">
    <ul>
        <li><img src="./img/1.png" style="margin-right:5px;"><a onclick="javascript:turn2page(1);">首页</a></li>
        <li><img src="./img/net.gif" style="margin-right:5px;"><a onclick="javascript:turn2page(2);">设备网络</a></li>
        <li><img src="./img/safe.gif" style="margin-right:5px;"><a onclick="javascript:turn2page(3);">摄像机</a></li>
        <li><img src="./img/2.png" style="margin-right:5px;"><a onclick="javascript:turn2page(4);">传感器</a></li>
        <li><img src="./img/2.png" style="margin-right:5px;"><a onclick="javascript:turn2page(5);">楼层设置</a></li>
        <!--li><img src="./img/bm.gif" style="margin-right:5px;"><a onclick="javascript:turn2page(6);">设置</a></li-->
    </ul>
</div>
<div id="content"></div>
</div>
 
<div id="bottom">电梯监控 2017</div>
</div>
</body>
</html>

<script>
$(document).ready(function(){ 
	document.getElementById("content").innerHTML='<iframe style="width:100%; height:100%;" frameborder="no" border="0"  src="rdrdyrdcytcyctcytcgcfcf.asp"/>';
}) 

function turn2page(obj){ 
//alert(obj); //[object HTMLInputElement] 
	if(1 == obj )
		document.getElementById("content").innerHTML='<iframe style="width:100%; height:100%;" frameborder="no" border="0"  src="rdrdyrdcytcyctcytcgcfcf.asp"/>';
	if(2 == obj )
		document.getElementById("content").innerHTML='<iframe style="width:100%; height:100%;" frameborder="no" border="0"   src="efrvsvdewfefcdsavcrewfdsac.asp"/>';
	if(3 == obj )
		document.getElementById("content").innerHTML='<iframe style="width:100%; height:100%;" frameborder="no" border="0"   src="kmoijinbytvvtvujnnnnnjn.asp"/>';
	if(4 == obj )
		document.getElementById("content").innerHTML='<iframe style="width:100%; height:100%;" frameborder="no" border="0"   src="qjiwqjicnnwiefjijeidnvciwe.asp"/>';
	if(5 == obj )
		document.getElementById("content").innerHTML='<iframe style="width:100%; height:100%;" frameborder="no" border="0"   src="floor.asp"/>';
	if(6 == obj )
		document.getElementById("content").innerHTML='<iframe style="width:100%; height:100%;" frameborder="no" border="0"   src="cdsxzcvrbvsdvdsafde.asp"/>';
} 

function setCookie(name,value,time)
{
	var strsec = getsec(time);
	var exp = new Date();
	exp.setTime(exp.getTime() + strsec*1);
	document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}

function eraseCookie() {
	
    $.cookie("username","1");
	//alert(1212);
	window.location.href='login.asp';
}

</script>
