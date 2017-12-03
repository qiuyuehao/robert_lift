<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>电梯监控主机</title>
<script src="js/jquery-1.8.0.min.js"></script> 
<script src="js/base64.js"></script> 
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
<div style="width:800px; height:30px; line-height:30px; text-align:left; font-family:微软雅黑; font-size:16px; background-color:#EAEAEA; margin-left:1px;">摄像机设置<div>
<div style="width:800px;  text-align:left; font-family:微软雅黑; font-size:16px; background-color:#F7F7F7; margin-left:1px;">
	<div id="player" style=" margin:10px; width:600px; height:400px; background-color:#C0C0C0;">

		<object type='application/x-vlc-plugin' id='vlc' events='True' classid='clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921' width="720" height="540">
			<param name='mrl' value='' />
			<param name='volume' value='50' />
			<param name='autoplay' value='false' />
			<param name='loop' value='false' />
			<param name='fullscreen' value='false' />
		</object>
		
	</div>
	<fieldset style="border-color:#E2DED6;border-width:1px;border-style:Solid; text-align:right;">
		<legend style="color:#333333;font-size:16px; font-family:微软雅黑;  text-align:left;">
			参数设置
		</legend>
		<div style="margin:0; margin-right:400px;">
			地址：
                        <input id="addr"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
                        端口：<input id="port"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
                        用户：<input id="username"></input>
		</div>
		<div style="margin:0; margin-right:400px;">
                        密码：<input id="passwd" type="password"></input>
		</div>
	</fieldset>
	
        <input  style="margin-left:30px; margin-top: 15px; width:80px; float:right;"  type="button"   value="保存"    name="saveParam" onClick="save_param()"/>
        <input  style="margin-left:30px; margin-top: 15px; width:80px; float:right;"  type="button"   value="读取"    name="readParam" onClick="load_param()"/>
	
</div>
</body>
<html>

<script type="text/javascript">
$(document).ready(function(){
  load_param();
});

function load_param(){
        //alert(1);
        $.getJSON("goform/goahead_load_ipc_param", function(result){
                //alert(result.device_net_type);

                $("#addr").val(result.ipc_addr);
                $("#port").val(result.ipc_port);
                $("#username").val(result.ipc_username);
                $("#passwd").val(result.ipc_passwd);
				
				var b = new Base64();
				var auth = b.encode(result.ipc_username + ":" + result.ipc_passwd);
				// rtsp://192.168.8.39:554/ISAPI/streaming/channels/101?auth=YWRtaW46YWRtaW4xMjM0NQ==
				var video_url = "rtsp://" + result.ipc_addr + ":" + result.ipc_port + "/ISAPI/streaming/channels/101?auth=" + auth;
				
				var tabplayer = document.getElementById("player");
				var vlcplayer = document.getElementById("vlc");
				var htmlInner = "";
				var  itemId= vlc.playlist.add(video_url);
				vlc.playlist.playItem(itemId);
				/*
				//htmlInner = '<object class="vlc" type="application/x-vlc-plugin" id="vlcc"  events="True" width="600" height="400" classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" codebase="http://comic.sjtu.edu.cn/vlc/cab/axvlc.cab">';
				htmlInner += '<object type="application/x-vlc-plugin" id="vlcc" events="True" classid="clsid:9BE31822-FDAD-461B-AD51-BE1D1C159921" width="600" height="400">';
				htmlInner += '<param name="mrl" value=' + video_url + ' />';
				htmlInner += '<param name="autoplay" value="true" />';
				htmlInner += '<param name="loop" value="false"/>';
				htmlInner += '<param name="fullscreen" value="false" />/>';
				//htmlInner += '<EMBED target=' + video_url + ' autostart="true" width="600" height="400" type="application/x-vlc-plugin" pluginspage="http://www.videolan.org" version="VideoLAN.VLCPlugin.2"></EMBED>';
				htmlInner += '</object>';
				tabplayer.innerHTML = htmlInner;
				*/
				
        });
		
}

function save_param(){
        var data = "";

        data += ("ipc_addr=" + $("#addr").val());

        data += ("&ipc_port=" + $("#port").val());
        data += ("&ipc_username=" + $("#username").val());

        data += ("&ipc_passwd=" + $("#passwd").val());

        //alert(data);
        $.post("goform/goahead_save_ipc_param", data, function(result){
                if(isContains(result, "success"))
				{
                        alert("保存成功!");
						load_param();
				}
                else
                        alert("保存失败!");
        });
}

function isContains(str, substr) {
     return str.indexOf(substr) >= 0;
 }

</script>
