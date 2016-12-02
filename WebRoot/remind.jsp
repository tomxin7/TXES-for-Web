<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!doctype html>
<style>
form p label {
float: left;
width: 40%;
font: bold 0.9em Arial, Helvetica, sans-serif;
}
.blue {
background-color: #ADD8E6;
color: #000000;
}
</style>

<html class="no-js">
<head>
	<script>
	//获得当前日期 
	function data(){
	var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate1 = date.getFullYear() + seperator1 + month + seperator1 + strDate;
    var date = document.getElementById("remind_date");
    date.value=currentdate1;
	}
	</script>
	<script> 
	//获得当前时分秒时间
	function time(){
	var date = new Date();
    var seperator1 = "/";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate2 = date.getHours() + seperator2 + date.getMinutes() ;
    var time = document.getElementById("remind_time");
    time.value=currentdate2;
	}
	</script>
	<script> 
	//取出传回来的参数flag比较
	//already代表已经存在的用户名
	var a='am-active';
  	var flag ='<%=request.getParameter("flag")%>';
  	if(flag=='ok'){
  		alert("提醒添加成功!");
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
	      	<%String name =(String)request.getSession().getAttribute("name");%>
	          <li class="am-active"><p>尊敬的:<%out.println(name);%></p></li>
	         <% session.setAttribute("add_name",name);%>
	      </ul>
	      <div class="am-tabs-bd">
	          <div data-tab-panel-0 class="am-tab-panel am-active">
					<fieldset>
						<form action = "remind_servlet" method = "post">
						<div class="am-form-group">
						<label for="doc-vld-name">活动类型</label>
						<select id="remind_type" name ="remind_type" class="am-form-field inputfield" required> 
						<option value="学习提醒" class="blue">学习提醒</option>
						<option value="生活提醒" class="blue">生活提醒</option>	
						<option value="活动提醒" class="blue">活动提醒</option>	
						</select>
						</div>		
						<div class="am-form-group">
						<label for="doc-vld-name1">提醒标题</label>
						<input type="text" id="remind_title"  name = "remind_title" minlength="3" class="am-form-field inputfield" onclick="data();time()" required/>
						</div>
						<input  type="hidden" id="remind_name"  name = "remind_name" minlength="3" value="<%=name%>" class="am-form-field inputfield" required/>
						<div class="am-form-group">	
						<label for="doc-vld-name">提醒内容</label>						
						<textarea id="remind_content" rows="5" cols="20" name="remind_content" class="am-form-field inputfield" required></textarea><br>																			
						</div>
						<div class="am-form-group">
						<label for="doc-vld-name1">提醒日期</label>
						<input id="remind_date" name="remind_date" type="date" class="am-form-field inputfield" required/>
						</div>
						<div class="am-form-group">
						<label for="doc-vld-name1">提醒时间</label>
						<input id="remind_time" name="remind_time" type="time" class="am-form-field inputfield" required/>
						</div>
						<div class="am-form-group">
						<label for="doc-vld-name1">提醒邮箱</label>
						<input type="text" id="mail_content"  name = "mail_content" minlength="3" class="am-form-field inputfield" required/>
						</div>
						<div class="am-form-group">
						<label for="doc-vld-name">邮箱类型</label>
						<select name ="mail_pyte" class="am-form-field inputfield" required> 
						<option value="@qq.com" class="blue">@qq.com</option>
						<option value="@163.com" class="blue">@163.com</option>	
						<option value="@139.com" class="blue">@139.com</option>	
						</select>
						</div>
						<br>
						<button class="myapp-login-button am-btn am-btn-secondary" type="submit">添加提醒</button>
						</form>
						</fieldset>
						
					

					<legend>Tomxin版权所有</legend>
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