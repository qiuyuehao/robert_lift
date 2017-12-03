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
			width: 200px; 
			height: 25px;
        }
	select {  
			width: 200px; 
        }
</style>
<body>
<div style="width:800px; height:30px; line-height:30px; text-align:left; font-family:΢���ź�; font-size:16px; background-color:#EAEAEA; margin-left:1px;">����������</div>
<div style="width:800px; text-align:left;  font-family:΢���ź�; font-size:16px; background-color:#F7F7F7; margin-left:1px;">

		<div style="text-align:left;margin:0 auto; margin-left:10px; width:800px;height:30px;  line-height:30px; ">
			<input style="width:20px;" id="sensor_0" type="checkbox" value="" />
			����&nbsp;&nbsp;�����̽����
			<a style="float:right; margin-right:250px; height:20px;" id="infraredV">״̬��xx</a>
		</div>

		<div style="text-align:left;margin:0; margin-left:10px;width:800px;height:30px; line-height:30px;  ">
			<input style="width:20px;" id="sensor_1" type="checkbox" value="" />
			<font style="text-align:center; height:20px;line-height:20px;">����&nbsp;&nbsp;���Խӽ�����</font>
			<a style="float:right; margin-right:250px; height:20px;" id="magnetic">״̬��xx</a>
		</div>
		<div style="text-align:left;margin:0; margin-left:10px;width:800px;height:30px; line-height:30px;  ">
			<input style="width:20px;" id="sensor_2" type="checkbox" value="" />
			<font style="text-align:center; height:20px;line-height:20px;">����&nbsp;&nbsp;�������翪��</font>
			<a style="float:right; margin-right:250px; height:20px;" id="diffusereflection">״̬��xx</a>
		</div>
		<div style="text-align:left;margin:0; margin-left:10px;width:800px;height:30px; line-height:30px;  ">
			<input style="width:20px;" id="sensor_3" type="checkbox" value="" />
			����&nbsp;&nbsp;���ٶȴ�����
			<a style="float:right; margin-right:250px; height:20px;" id="axis">״̬��xx</a>
		</div>
		<div style="text-align:left;margin:0; margin-left:10px;width:800px;height:30px; line-height:30px;  ">
			<input style="width:20px;" id="sensor_4" type="checkbox" value="" />
			����&nbsp;&nbsp;U�͹�紫������
			<a style="float:right; margin-right:250px; height:20px;" id="direction">״̬��xx</a>
		</div>

	<hr style="width:800px;">
	<div style="margin:0px; ">���ö�ʱ�ϴ�ʱ�䣺<input value="100" id="time_space" style="width:60px;"></input>&nbsp;����</div>
	<fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid; text-align:right;">
		<legend style="color:#333333;font-size:16px; font-family:΢���ź�;  text-align:left;">
			����������
		</legend>
		<div style="margin:0; margin-right:400px; margin-top:10px;">
			��������ַ��
			<input id="mqtt_server_addr"></input>
		</div>
		<div style="margin:0; margin-right:400px; margin-top:10px;">
			�������˿ڣ�<input id="mqtt_server_port"></input>
		</div>
		<div style="margin:0; margin-right:400px; margin-top:10px;">
			<input style="width:20px;" id="enable_upload" type="checkbox" value="" />
			�����ϴ�
		</div>
	</fieldset>
	<fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid; text-align:right;">
		<legend style="color:#333333;font-size:16px; font-family:΢���ź�;  text-align:left;">
			�豸ID
		</legend>
		<div style="margin:0; margin-right:400px; margin-top:10px;">
			�豸ID��
			<input id="mqtt_id"></input>
		</div>
	</fieldset>
	<input  style="margin-left:30px; margin-top: 15px; width:80px; float:right;"  type="button"  onClick="save_param()"  value="����"    name="saveParam"/>
	<input  style="margin-left:30px; margin-top: 15px; width:80px; float:right;"  type="button"  onClick="load_param()" value="��ȡ"    name="readParam"/>
	
</div>
</body>
</html>

<script type="text/javascript">
$(document).ready(function(){
  initParam();

});

function initParam(){
	load_param();
	//load_sensor_stat();
}

function load_sensor_stat(){
	$.get("sensorValue.json", function(result){
		//alert(result.device_net_type);
		//alert(result);
		var obj = jQuery.parseJSON(result);
		$("#infraredV").html("&nbsp;&nbsp;&nbsp;&nbsp;״̬:"+obj.infraredV);
		$("#magnetic").html("&nbsp;&nbsp;&nbsp;&nbsp;״̬:"+obj.magnetic);
		$("#diffusereflection").html("&nbsp;&nbsp;&nbsp;&nbsp;״̬:"+obj.diffusereflection);
		$("#direction").html("&nbsp;&nbsp;&nbsp;&nbsp;״̬:"+obj.direction);
		var axisStr = "&nbsp;&nbsp;&nbsp;&nbsp;״̬:x:"+obj.xAxis+",y:"+obj.yAxis+",z:"+obj.zAxis+"";
		$("#axis").html(axisStr);
		$("#axis").alt(axisStr);
	});
}

function load_param(){

	$.getJSON("goform/goahead_load_sensor_param", function(result){
		//alert(result);
		$('#sensor_0').attr("checked", false);
		$('#sensor_1').attr("checked", false);
		$('#sensor_2').attr("checked", false);
		$('#sensor_3').attr("checked", false);
		$('#sensor_4').attr("checked", false);
		$('#enable_upload').attr("checked", false);
		if( result.sensor_0 == "1" ){
			$('#sensor_0').attr("checked", true);
		}
		if( result.sensor_1 == "1" ){
			$('#sensor_1').attr("checked", true);
		}
		if( result.sensor_2 == "1" ){
			$('#sensor_2').attr("checked", true);
		}
		if( result.sensor_3 == "1" ){
			$('#sensor_3').attr("checked", true);
		}
		if( result.sensor_4 == "1" ){
			$('#sensor_4').attr("checked", true);
		}
		if( result.enable_upload == "1" ){
			$('#enable_upload').attr("checked", true);
		}
		
		$("#time_space").val(result.time_space);
		$("#mqtt_server_addr").val(result.mqtt_server_addr);
		$("#mqtt_server_port").val(result.mqtt_server_port);
		$("#mqtt_id").val(result.mqtt_id);
	});
}

function save_param(){
	if($("#time_space").val() < 100)
	{
		alert("�������С��100���룡");
		return;
	}
	var data = "";
	if($('#sensor_0').is(':checked')) {
		data += "sensor_0=1&";
	}
	else
		data += "sensor_0=0&";
	if($('#sensor_1').is(':checked')) {
		data += "sensor_1=1&";
	}
	else
		data += "sensor_1=0&";
	if($('#sensor_2').is(':checked')) {
		data += "sensor_2=1&";
	}
	else
		data += "sensor_2=0&";
	if($('#sensor_3').is(':checked')) {
		data += "sensor_3=1&";
	}
	else
		data += "sensor_3=0&";
	if($('#sensor_4').is(':checked')) {
		data += "sensor_4=1&";
	}
	else
		data += "sensor_4=0&";
	if($('#enable_upload').is(':checked')) {
		data += "enable_upload=1&";
	}
	else
		data += "enable_upload=0&";
	//return;
	data += ("time_space=" + $("#time_space").val()); 
	
	data += ("&mqtt_server_addr=" + $("#mqtt_server_addr").val());
	data += ("&mqtt_server_port=" + $("#mqtt_server_port").val());
	
	data += ("&mqtt_id=" + $("#mqtt_id").val());
	
	//alert(data);
	$.post("goform/goahead_save_sensor_param", data, function(result){
		if(isContains(result, "success"))
			alert("����ɹ�!");
		else
			alert("δ֪����!");
	});
}

function isContains(str, substr) {
     return str.indexOf(substr) >= 0;
 }
 
</script>
