<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>���ݼ������</title>
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
<div style="width:800px; height:30px; line-height:30px; text-align:left; font-family:΢���ź�; font-size:16px; background-color:#EAEAEA; margin-left:1px;">�豸��������<div>
<div style="width:800px;  text-align:left; font-family:΢���ź�; font-size:16px; background-color:#F7F7F7; margin-left:1px;">
	<input  style="margin-left:10px; margin-top:10px; width:30px;" type="radio" value="local"  id="net"    name="netSet" />��̫��
	<input  style="margin-left:100px; margin-top:10px; width:30px;"  type="radio" value="wifi"  id="wifi"    name="netSet"/>WIFI
	<input  style="margin-left:100px; margin-top:10px; width:30px;"  type="radio" value="_4G"  id="_4G"    name="netSet"/>4G
	<fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid; text-align:right;">
		<legend style="color:#333333;font-size:16px; font-family:΢���ź�;  text-align:left;">
			��̫��
		</legend>
		<div style="margin:0; margin-right:400px;">
			�豸��ַ��
			<input id="device_addr"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			�������룺<input id="device_netmask"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			Ĭ�����أ�<input id = "gateway"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			MAC��ַ��<input id="device_mac"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			����2��ַ��
			<input id="device_addrb"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			����2�������룺<input id="device_netmaskb"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			����2Ĭ�����أ�<input id = "gatewayb"></input>
		</div>
	</fieldset>
	<fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid;text-align:right;">
		<legend style="color:#333333;font-size:16px; font-family:΢���ź�;text-align:left;">
			WIFI
		</legend>
		<div style="margin:0; margin-right:400px;">
			SSID��
			<input id ="wifi_ssid"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			���룺<input id="wifi_passwd" type="password"></input>
		</div>
	</fieldset>
	<fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid;text-align:right;">
		<legend style="color:#333333;font-size:16px; font-family:΢���ź�;text-align:left;">
			4G
		</legend>
		<div style="margin:0; margin-right:400px;">
			����/������
			<select>
				<option>�й�</option>
			</select>
		</div>
		<div style="margin:0; margin-right:400px;">
			��Ӫ�̣�
			<select id="_4g_company">
				<option>�й���ͨ</option>
				<option>�й��ƶ�</option>
				<option>�й�����</option>
			</select>
		</div>
		<div style="margin:0; margin-right:400px;">
			APN���ƣ�<input id="fourthnet_ap"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			�κź��룺<input id="fourthnet_number"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			�û�����<input id="fourthnet_username"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
			���룺<input id="fourthnet_passwd" type="password"></input>
		</div>
	</fieldset>
	
	<fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid;text-align:left;">
		<legend style="color:#333333;font-size:16px; font-family:΢���ź�;text-align:left;">
			����
		</legend>
		<div style="margin:0; margin-right:400px;">
			<input  style="margin-left:170px; margin-top: 15px; margin-bottom: 15px; width:80px; float:left;"  type="button" onClick="reboot_device()"  value="����"    name="rebootDevice"/>
		</div>
		<div style="margin:0; margin-right:400px;">
			<input  style="margin-left:170px; margin-top: 15px; margin-bottom: 15px; width:80px; float:left;"  type="button" onClick="reset_device()"  value="��λ"    name="resetDevice"/>
		</div>
	</fieldset>
	<input  style="margin-left:30px; margin-top: 15px; width:80px; float:right;"  type="button" onClick="save_param()"  value="����"    name="saveParam"/>
	<input  style="margin-left:30px; margin-top: 15px; width:80px; float:right;"  type="button" onClick="load_param()"  value="��ȡ"    name="readParam"/>
</div>

</body>
<html>

<script type="text/javascript">
$(document).ready(function(){
  load_param();
});

function reboot_device(){
	//alert(1);
	$.getJSON("goform/goahead_reboot_param", function(result){
		//alert(result.device_net_type);
		if( result.ret == "200" ){
			alert("�����ɹ�");
		}
	});
}

function reset_device(){
	//alert(1);
	$.getJSON("goform/goahead_reset_param", function(result){
		//alert(result.device_net_type);
		if( result.ret == "200" ){
			alert("��λ�ɹ�");
		}
	});
}

function load_param(){
	//alert(1);
	$.getJSON("goform/goahead_load_net_param", function(result){
		//alert(result.device_net_type);
		if( result.device_net_type == "LOCAL" ){
			$("#net").attr("checked",true);//
			$("#wifi").attr("checked",false);//
			$("#_4G").attr("checked",false);//
		}
		if( result.device_net_type == "WIFI" ){
			$("#net").attr("checked",false);//
			$("#wifi").attr("checked",true);//
			$("#_4G").attr("checked",false);//
		}
		if( result.device_net_type == "_4G" ){
			$("#net").attr("checked",false);//
			$("#wifi").attr("checked",false);//
			$("#_4G").attr("checked",true);//
		}
		$("#device_addr").val(result.ip_addr);
		$("#device_netmask").val(result.net_mask);
		$("#gateway").val(result.gateway);
		$("#device_mac").val(result.mac);
		
		$("#device_addrb").val(result.ip_addrb);
		$("#device_netmaskb").val(result.net_maskb);
		$("#gatewayb").val(result.gatewayb);
		
		$("#wifi_ssid").val(result.ssid);
		$("#wifi_passwd").val(result.ssid_passwd);
		
		$("#_4g_company").get(0).selectedIndex = result.fourthnet_company;
		
		$("#fourthnet_ap").val(result.fourthnet_ap);
		$("#fourthnet_number").val(result.fourthnet_number);
		$("#fourthnet_username").val(result.fourthnet_username);
		$("#fourthnet_passwd").val(result.fourthnet_passwd);
	});
}

function save_param(){
	var data = "";
	if( $("#wifi_passwd").val().length < 8)
	{
		alert("���볤��Ҫ8λ���ϡ�");
		return;
	}
	var isAutoSend = document.getElementsByName('netSet');
	for (var i = 0; i < isAutoSend.length; i++) {
		if (isAutoSend[i].checked == true) {
			//alert(i);
			switch(i)
			{
				case 0:
					data = "device_net_type=LOCAL&";
				break;
				case 1:
					data = "device_net_type=WIFI&";
				break;
				case 2:
					data = "device_net_type=_4G&";
				break;
				default:
					data = "device_net_type=LOCAL&";
				break;
			}
		}
	}
	
	data += ("ip_addr=" + $("#device_addr").val()); 
	data += ("&net_mask=" + $("#device_netmask").val());
	data += ("&gateway=" + $("#gateway").val());
	
	data += ("&ip_addrb=" + $("#device_addrb").val()); 
	data += ("&net_maskb=" + $("#device_netmaskb").val());
	data += ("&gatewayb=" + $("#gatewayb").val());
	
	data += ("&ssid=" + $("#wifi_ssid").val());
	data += ("&ssid_passwd=" + $("#wifi_passwd").val());
	//data += "\",\"fourthnet_company\":\"" + $("#_4g_company").get(0).selectedIndex;
	data += ("&fourthnet_ap=" + $("#fourthnet_ap").val());
	data += ("&fourthnet_number=" + $("#fourthnet_number").val());
	data += ("&fourthnet_username=" + $("#fourthnet_username").val());
	
	data += ("&fourthnet_passwd=" + $("#fourthnet_passwd").val());
	
	data += ("" );
	
	//alert(data);
	$.post("goform/goahead_save_net_param", data, function(result){
		if(isContains(result, "success") )
			alert("����ɹ�!");
		else
			alert("δ֪����!");
	});
}

function isContains(str, substr) {
     return str.indexOf(substr) >= 0;
 }
 
</script>