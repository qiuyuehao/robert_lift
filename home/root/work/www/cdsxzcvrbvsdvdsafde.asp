<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>电梯监控主机</title>
<script src="js/jquery-1.8.0.min.js"></script> 
<link href="menu.css" rel="stylesheet" type="text/css" />
</head>

<style type="text/css">
	input {  
			width: 200px; 
			height: 25px;
        }
	select {  
			width: 200px; 
        }
</style>
<body>
<div style="width:800px; height:30px; line-height:30px; text-align:left; font-family:微软雅黑; font-size:16px; background-color:#EAEAEA; margin-left:1px;">系统设置<div>
<div style="width:800px;  text-align:left; font-family:微软雅黑; font-size:16px; background-color:#F7F7F7; margin-left:1px;">

	<fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid; text-align:right;">
		<legend style="color:#333333;font-size:16px; font-family:微软雅黑;  text-align:left;">
			设备升级
		</legend>
		<div style="margin:0; margin-right:400px;">
			升级包：
			<input type=file></input>
		</div>
		<input  style="margin-left:30px; margin-top: 15px; width:80px; float:right;"  type="button"   value="升级"    name="saveParam"/>
	</fieldset>
	
	<fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid; text-align:right;">
		<legend style="color:#333333;font-size:16px; font-family:微软雅黑;  text-align:left;">
			修改密码
		</legend>
		<div style="margin:0; margin-right:400px;">
			旧密码：
			<input></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			新密码：<input></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			新密码：<input></input>
		</div>
		<input  style="margin-left:30px; margin-top: 15px; width:80px; float:right;"  type="button"   value="修改"    name="saveParam"/>
	</fieldset>
	
	
</div>
</body>
<html>