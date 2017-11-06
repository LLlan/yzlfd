<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/login.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>登录</title>
    <style>
        .logoBox>p{
            width:84%;height:40px;line-height: 40px;position: absolute;left:210px;top:25px;;;color:#000;font-size: 22px;
            border-left:1px solid #000;padding-left:20px;
        }
        .logoBox>p>a{
            color:#000;font-size: 14px;float:right;margin-right:40px;;
        }
        a {
            text-decoration: none;
            color: #7f7f7f;
        }
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<div class="logo">
    <div class="logoBox" style="padding-top: 0px;">
        <a href="<%=basePath %>api/keHuPc/index.do"><img src="static/images/zyw/logo.jpg" alt="" width="160px" height="80px"/></a>
        <p>客户登录 <a href="<%=basePath %>api/keHuPc/tosLogin.do">商户端登录</a><a href="javascript:void(0)" style="color: #38c4ff;">客户端登录</a><a href="<%=basePath %>api/keHuPc/index.do">返回首页</a></p>
    </div>
</div>
<div class="banBack">
    <div class="banner">
        <div class="loginBox">
            <p><img src="static/images/zyw/yisheng1.png" alt=""/></p>
            <p class="user"><a href="javascript:void(0)"><img src="static/images/zyw/user1.png" alt=""/></a><input type="text" placeholder="用户名/手机号" name="userName" id="userName"/></p>
            <p class="pass"><a href="javascript:void(0)"><img src="static/images/zyw/pass1.png" alt=""/></a><input type="password" placeholder="密码" name="password" id="password"/></p>
            <p class="rem"><input type="checkbox" id="saveid" onclick="savePaw();"/><label for="rem">两周内自动登录</label><a href="<%=basePath %>api/keHuPc/towangjimima.do" class="red">忘记密码</a><a href="<%=basePath %>api/keHuPc/toRegister.do">注册</a></p>
            <a href="javascript:void(0)" class="login" onclick="checkLogin();">登录</a>
        </div>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script>
	$(document).keyup(function(event) {
		if (event.keyCode == 13) {
			$(".login").trigger("click");
		}
	});
</script>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script src="static/js/zyw/jquery.cookie.js"></script>
<script>
	//登录
	function checkLogin(){
		if($("#userName").val()==""){
			layer.tips('登录名不能为空', '#userName', {
      		  tips: [1, '#FF3E96'],
      		  time: 3000
      		});
			return;
		}
		if($("#password").val()==""){
			layer.tips('密码不能为空', '#password', {
      		  tips: [1, '#FF3E96'],
      		  time: 3000
      		});
			return;
		}
        $.ajax({
           type: "post",
           url: "api/zywkehu/login.do",
           data: {userName:$("#userName").val(),password:$("#password").val()},
           dataType: "json",
           success: function(data){
         		if(data.respCode=="01"){
        			saveCookie();
        			window.location.href='api/keHuPc/index.do';
         		}else if(data.respCode=="02"){
         			layer.msg("该用户未注册!请先去注册。",{
	  		            time:3000,//单位毫秒
	  		            shade: [0.8, '#393D49'], // 透明度  颜色
	  		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
 		       		 });
         		}else{
         			layer.msg("登录失败，用户名或密码错误",{
	  		            time:3000,//单位毫秒
	  		            shade: [0.8, '#393D49'], // 透明度  颜色
	  		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
 		       		 });
          		}
            }
       });
	}
	//保存cookie
	 function saveCookie() {
		if ($("#saveid").is(":checked")) {
			$.cookie('loginname1', $("#userName").val(), {
				expires : 7
			});
			$.cookie('password1', $("#password").val(), {
				expires : 7
			});
		}
	}

	function savePaw() {//loginName--password
		  
		if (!$("#saveid").is(":checked")) {
			$.cookie('loginname1', '', {
				expires : -1
			});
			$.cookie('password1', '', {
				expires : -1
			});
			$("#userName").val('');
			$("#password").val('');
		}
	}

	//读取cookie
	jQuery(function() {
		var loginname = $.cookie('loginname1');
		var password = $.cookie('password1');
		if (typeof(loginname) != "undefined"
				&& typeof(password) != "undefined") {
			$("#userName").val(loginname);
			$("#password").val(password);
			$("#saveid").attr("checked", true);
		}
	});
</script>
</body>
</html>