<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>¥������</title>
<script src="js/jquery-1.8.0.min.js"></script> 
<link href="menu.css" rel="stylesheet" type="text/css" />
</head>

<style type="text/css"> 
	input {   
			height: 25px;
        }
	select {  
			width: 200px; 
        }
</style>
<body>
<div style="width:800px; height:30px; line-height:30px; text-align:left; font-family:΢���ź�; font-size:16px; background-color:#EAEAEA; margin-left:1px;">¥������<div>
<div style="width:800px;  text-align:left; font-family:΢���ź�; font-size:16px; background-color:#F7F7F7; margin-left:1px;">
	
	<fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid; text-align:right;">
		<legend style="color:#333333;font-size:16px; font-family:΢���ź�;  text-align:left;">
			
		</legend>
		<div style="margin:0; margin-right:400px;">
			�����ܲ���<input id="total_floor"></input>
		</div>
		<div style="margin:0; margin-right:150px;">
			������ʾ��<input id="config_floor" style="width:400px;"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			��ǰ¥��<input id="current_floor" value="1" ></input>
		</div>
		<input  style="margin-left:30px; margin-top: 15px; width:80px; float:right;"  type="button"  onClick="save_param()"  value="����"    name="saveParam"/>
		<input  style="margin-left:30px; margin-top: 15px; width:80px; float:right;"  type="button"  onClick="load_param()" value="��ȡ"    name="readParam"/>
	</fieldset>
	
	
</div>
</body>
</html>

<script type="text/javascript">
$(document).ready(function(){

  load_param();
  //load_sensor_stat();
});

function load_param(){
	//alert(1);
	$.getJSON("goform/goahead_load_floor_param", function(result){
		//alert(result);
		$("#total_floor").val(result.total_floor);
		$("#config_floor").val(result.config_floor);
		$("#current_floor").val(result.current_floor);
	});
}

function save_param(){
	if($("#total_floor").val() < 2)
	{
		alert("maybe not building");
		return;
	}

	var data = "";

	data += ("total_floor=" + $("#total_floor").val()); 
	
	data += ("&config_floor=" + $("#config_floor").val());
	data += ("&current_floor=" + $("#current_floor").val());
	//alert(data);
	$.post("goform/goahead_save_floor_param", data, function(result){
		if(isContains(result, "success"))
			alert("����ɹ�!");
		else
			alert("����ʧ��!");
	});
}

function isContains(str, substr) {
     return str.indexOf(substr) >= 0;
 }
 
</script>
