<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String url= request.getParameter("url");
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/login.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>找回密码</title>
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
        <p>客户找回密码 <a href="<%=basePath %>api/keHuPc/tosLogin.do">商户端登录</a><a href="<%=basePath %>api/keHuPc/toLogin.do">客户端登录</a><a href="<%=basePath %>api/keHuPc/index.do">返回首页</a></p>
    </div>
</div>
<div class="banBack">
    <div class="banner">
        <div class="loginBox">
            <p><img src="static/images/zyw/yisheng1.png" alt=""/></p>
            <p class="user">
            	<a href="javascript:void(0)">
            		<img src="static/images/zyw/tel1.png" alt=""/>
            	</a>
            	<input type="button" value="获取验证码" class="btnSec" id="yanzheng" onclick="clickButton(this)"/>
            	<input type="text" placeholder="手机号" id="phone"/>
            </p>
            <p class="pass">
            	<a href="javascript:void(0)">
            		<img src="static/images/zyw/pass1.png" alt=""/>
            	</a>
            	<input type="text" placeholder="验证码" id="shuruyzm"/>
            </p>
            <p class="rem"><a href="<%=basePath %>api/keHuPc/toLogin.do" class="red">登录</a><a href="javascript:void(0)">有账号</a></p>
            <a href="javascript:void(0)" class="login" onclick="yanzheng();">验证</a>
            <%-- 正确的验证码 --%>
    		<input type="hidden" id="zhengqueyzm" value="">
            <%-- 获取验证码时所使用的的手机号 --%>
    		<input type="hidden" id="yzmphone" value="">
        </div>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script>
    //验证手机格式的正则表达是
	var phoneReg=/^1[3-9]\d{9}$/;
    function clickButton(obj){
        var obj = $(obj);
        var phone=$("#phone").val();
        if(phoneReg.test(phone)){
        	 obj.attr("disabled","disabled");/*按钮倒计时*/
             var time = 60;
             var set=setInterval(function(){
                 obj.val(--time+"(s)");
             }, 1000);/*等待时间*/
             setTimeout(function(){
                 obj.attr("disabled",false).val("重新获取");/*倒计时*/
                 clearInterval(set);
             }, 60000);
             $.ajax({
           		type:"post",
           		url:"api/shangHu/getSms.do",
           		data:{
           			"phone":phone
           		},
           		dataType:"json",
           		success:function(data){
           			if(data.reqCode=='01'){
           				$("#zhengqueyzm").val(data.yanzhengma);
           				$("#yzmphone").val(data.phone);
           			}else{
           				console.log("获取验证码失败");
           			}
           		}
           	});
        }else{
        	layer.tips('手机号码格式不正确,请正确输入手机号', '#phone', {
        		  tips: [1, '#FF3E96'],
        		  time: 3000
        	});
        }
    }
    //验证
    function yanzheng(){
       var phone=$("#phone").val();//手机号
  	   var zhengqueyzm=$("#zhengqueyzm").val();//正确的验证码
  	   var shuruyzm=$("#shuruyzm").val();//输入的验证码
    	//判断手机号码是否合法
 	   if(!phoneReg.test(phone)){
 		   layer.tips('手机号码格式不正确,请正确输入手机号', '#phone', {
      		  tips: [1, '#FF3E96'],
      		  time: 3000
      		});
 		   return;
 	   }
 	  //判断是否获取验证码
 	  if(zhengqueyzm==''){
 		   layer.tips('您还没有获取验证码，请点击获取验证码', '#yanzheng', {
 	     		  tips: [1, '#FF3E96'],
 	     		  time: 3000
 	     	});
 			return;
 	   }
	   //判断验证码输入是否正确
	   if(zhengqueyzm!=shuruyzm){
		   layer.tips('验证码输入不正确,请重新输入', '#shuruyzm', {
	     		  tips: [1, '#FF3E96'],
	     		  time: 3000
	     	});
		   return;
	    }
	   window.location.href='api/keHuPc/toxinmima.do?phone='+$("#yzmphone").val();
    }
</script>
</body>
</html>