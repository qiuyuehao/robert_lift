<!DOCTYPE html>   
<html lang="en">   
<head>   
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
    <title>电梯监控主机</title> 
	<script src="js/jquery-1.8.0.min.js" type="text/javascript" ></script>
</head> 

<style type="text/css">
html{    
    width: 100%;    
    height: 100%;    
    overflow: hidden;    
    font-style: sans-serif;    
}    
body{    
    width: 100%;    
    height: 100%;    
    font-family: 'Open Sans',sans-serif;    
    margin: 0;    
    background-color: #fff;    
}
#login{    
    position: absolute;    
    top: 35%;    
    left:75%;  
	border-top: 1px solid #312E3D;    
    border-left: 1px solid #312E3D;    
    border-right: 1px solid #312E3D;    
    border-bottom: 1px solid #56536A;	
    margin: -150px 0 0 -350px;    
    width: 350px;    
    height: 300px; 
	text-align: center;
	background-color: #fff; 	
}  
#rights{    
    position: absolute;    
    top: 75%;    
    left:55%;  

    margin: -150px 0 0 -350px;    
    width: 350px;    
    height: 300px; 
	color: #A0A0A0;
	text-align: center;
	background-color: #fff; 	
}  
#bgImage{    
    position: absolute;    
    top: 30%;    
    left:35%;  

    margin: -150px 0 0 -350px;    
    width: 350px;    
    height: 300px; 
	color: #A0A0A0;
	text-align: center;
	background-color: #fff; 	
} 
#login h1{    
    color: #fff;    
    text-shadow:0 0 0px;   
	font-family: 微软雅黑;
    text-align: center;
	margin: 0;
	margin-bottom: 50px;
	height: 5px;
	line-height: 50px;
	background-color: #29333F;	
}    
h1{    
    font-size: 25px;    
    margin: 0.67em 0;    
}   
h3{    
    font-size: 0.5em;    
    margin: 0.67em 0; 
	font-family: 微软雅黑;
} 
input{    
    width: 278px;    
    height: 18px;    
    margin-bottom: 10px;    
    outline: none;    
    padding: 10px;    
    font-size: 16px;    
    color: #757575;    
    text-shadow:1px 1px 1px;    
    border-top: 1px solid #312E3D;    
    border-left: 1px solid #312E3D;    
    border-right: 1px solid #312E3D;    
    border-bottom: 1px solid #56536A;    
    border-radius: 4px;    
    background-color: #EEEEEE;    
}    
.but{    
    width: 300px;    
    min-height: 20px;    
    display: block;    
    background-color: #4a77d4;    
    border: 1px solid #3762bc;    
    color: #fff;    
    padding: 9px 14px;  
	font-family: 微软雅黑;
    font-size: 15px;    
    line-height: normal;    
    border-radius: 5px;    
    margin: 0; 
	margin-top: 20px;
	margin-left: 25px;
	cursor: pointer;
}   

</style>
  
<body>   
	<div id="bgImage"><img src="./img/logoin.png" />
	</div>
   <div id="login">   
        <h1>&nbsp;&nbsp;&nbsp;&nbsp;</h1>   
 
            <input type="text" required="required" placeholder="用户名" id="signup_name"></input>   
            <input type="password" required="required" placeholder="密码" id="signup_password"></input>   
            <button class="but" type="submit" onClick="doLogin()">登录</button>   
  
		<h3 id="loginLog"></h3>
    </div>
	
	<div id="rights">
		All Rights Reserved
	</div>
</body>   
</html> 

<script type="text/javascript">
function doLogin(){
	//alert("lllll");
	var data = "";
	if( $('#signup_name').val() != "admin" )
	{
		$('#loginLog').html("错误！");
		return;
	}

	data = "name=" + $('#signup_name').val() + "&pwd=" + $('#signup_password').val();
	
	//alert(data);
	$.post("goform/login_check_form", data, function(result){

		if(isContains(result, "success") ){
			$('#loginLog').html("登录成功");
			window.location.href='home.asp'; 
		}
		else
			window.location.href='login.asp'; 
	});
}

function isContains(str, substr) {
     return str.indexOf(substr) >= 0;
 }
 
</script>
