<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js">
<head>
	<script type="text/javascript">
	function CheckPass(){
	var pw = document.getElementById("register_password").value;
	var cpw = document.getElementById("register_Confirm_password").value;
	if(cpw!=pw){
		window.alert("两次输入的密码不一致");
	}
		
		
	}
	
	</script>
	<script> 
	//取出传回来的参数flag比较
	//already代表已经存在的用户名
	var a='am-active';
  	var flag ='<%=request.getParameter("flag")%>';
  	if(flag=='already'){
  		alert("用户名已经存在，请更换用户名!");
  	}
  	if(flag=='ok'){
  		alert("注册成功，即将跳转登录页面");
  	}
  	if(flag=='password_error'){
  		alert("两次密码不一致");
  	}
  	if(flag=='error'){
  		alert("注册失败，请尝试更换用户名");
  	}
  	if(flag=='no'){
  	alert("用户名或者密码错误");
  	}
 	</script>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="">
  <meta name="keywords" content="">
  <meta name="viewport"
        content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <title>Tomxin邮件提醒</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
  <link rel="stylesheet" href="css/amazeui.min.css">
  <link rel="stylesheet" href="css/app.css">
</head>
<body>
<div class="am-g myapp-login">
	<div class="myapp-login-bg">
		  <div data-am-widget="tabs"
	       class="am-tabs am-tabs-d2"
	        >
	      <ul class="am-tabs-nav am-cf">
	          <li class="am-active"><a href="[data-tab-panel-0]">用户登录</a></li>
	          <li class=""><a href="[data-tab-panel-1]">注册账号</a></li>
	      </ul>
	      <div class="am-tabs-bd">
	          <div data-tab-panel-0 class="am-tab-panel am-active">
					<fieldset>
						<form action = "login_servlet" method = "post">
						<div class="am-form-group">
						<label for="doc-vld-name">用户名</label>
						<input type="text" id="user_name" name="user_name" minlength="3" placeholder="User ID" class="am-form-field inputfield" required/>
						</div>
						<div class="am-form-group">
						<label for="doc-vld-name1">密码</label>
						<input type="password" id="password" name = "password" minlength="3" placeholder="Password" name="pw" class="am-form-field inputfield" required/>
						</div>
						<button class="myapp-login-button am-btn am-btn-secondary" type="submit">登录</button>
						</form>
					</fieldset>
					<legend>忘记密码?</legend>
	          </div>
	          <div data-tab-panel-1 class="am-tab-panel ">
					<fieldset>
						<form action = "register_servlet" method = "post">
						<div class="am-form-group">
						<label for="doc-vld-name">用户名</label>
						<input type="text" id="register_user_name" name="register_user_name" minlength="3" placeholder="User ID" class="am-form-field inputfield" required/>
						</div>
						<div class="am-form-group">
						<label for="doc-vld-name1">密码</label>
						<input type="password" id="register_password" name = "register_password" minlength="3" placeholder="Password" class="am-form-field inputfield" required/>
						</div>
						<div class="am-form-group">
						<label for="doc-vld-name">确认密码</label>
						<input type="password" id="register_Confirm_password" minlength="3" name="confirm_Password" placeholder="Confirm Password" class="am-form-field inputfield" onchange="CheckPass()" required/>
						</div>
						<div class="am-form-group myapp-login-treaty"><label class="am-form-label"></label><label class="am-checkbox-inline"> <input type="checkbox" value="橘子" name="docVlCb" minchecked="2" maxchecked="4" required="">已同意使用条约 </label></div>
						<button class="myapp-login-button am-btn am-btn-secondary" type="submit">注册</button>
					</form>
					</fieldset>
					<legend>忘记密码?</legend>
	          </div>
	      </div>
	  </div>
	</div>
</div>
<!--[if (gte IE 9)|!(IE)]><!-->
<script src="js/jquery.min.js"></script>
<!--<![endif]-->
<!--[if lte IE 8 ]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->
<script src="js/amazeui.min.js"></script>
<script src="js/app.js"></script>
</body>
</html>