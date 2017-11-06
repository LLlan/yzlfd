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
    <title>注册</title>
    <style>
        .logoBox>p{
            width:900px;height:40px;line-height: 40px;position: absolute;left:210px;top:25px;;;color:#000;font-size: 22px;
            border-left:1px solid #000;padding-left:20px;
        }
        .logoBox>p>a{
            color:#000;font-size: 14px;float:right;margin-right:40px;;
        }
        .banBack{
            height:645px;
        }
        .banner{
            height:645px;
        }
        .loginBox{
            height:544px;top:6px;
        }
        a {
            text-decoration: none;
            color: #7f7f7f;
        }
        .tel .btnSec {
            width: 128px;
            height: 24px;
            line-height: 24px;
            background-color: #fff;
            border-left: 1px solid #c1c1c1;
            color: #c1c1c1;
            float: right;
            margin-top: 7px;
        }
        .tel>input{
            width: 213px;
            height: 38px;
            line-height: 38px;
            padding-left: 10px;
            float: left;
            outline: none;
            border: none;
        }
        .bgSelected{
            background: url(static/images/zyw/select01.png) no-repeat;background-size: 15px 15px;border:none;
        }
        .visitor {
		    width: 250px;
		    height: 24px;
		    line-height: 24px;
		    font-size: 16px;
		    overflow: hidden;
		    margin-top: 10px;
		    float: left;
		    cursor: pointer;
		}
		.danxuan, .duoxuan {
		    display: block;
		    width: 15px;
		    height: 15px;
		    border: 1px solid #c1c1c1;
		    border-radius: 5px;
		}
		.visitor>span {
		    float: left;
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
        <p>商户注册 <a href="javascript:void(0)" style="color: #38c4ff;">商户端注册</a><a href="<%=basePath %>api/keHuPc/toRegister.do">客户端注册</a><a href="<%=basePath %>api/keHuPc/index.do">返回首页</a></p>
    </div>
</div>
<div class="banBack">
    <div class="banner">
        <div class="loginBox" style="top: 50px;">
            <p><img src="static/images/zyw/yisheng1.png" alt=""/></p>
            <%-- 正确的验证码 --%>
    		<input type="hidden" id="zhengqueyzm" name="zhengqueyzm" value="">
            <p class="user">
	            <a href="javascript:void(0)">
	            	<img src="static/images/zyw/user1.png" alt=""/>
	            </a>
	            <input type="text" placeholder="用户名(不能全为数字)" name="userName" id="userName"/>
            </p>
            <p class="pass">
            	<a href="javascript:void(0)">
            		<img src="static/images/zyw/pass1.png" alt=""/>
            	</a>
           		<input type="password" placeholder="设置密码(6~20位)" name="loginPassword" id="loginPassword"/>
            </p>
            <p class="pass">
	            <a href="javascript:void(0)">
	            	<img src="static/images/zyw/pass1.png" alt=""/>
	            </a>
	            <input type="password" placeholder="确认密码" id="pass"/>
            </p>
            <p class="user">
            	<a href="javascript:void(0)">
            		<img src="static/images/zyw/tel1.png" alt=""/>
            	</a>
            	<input type="button" value="获取验证码" class="btnSec" onclick="clickButton(this)" id="yanzheng"/>
            	<input type="text" placeholder="手机号" name="phone" id="phone"/>
            </p>
            <p class="security">
            	<a href="javascript:void(0)">
            		<img src="static/images/zyw/sec1.png" alt=""/>
            	</a>
            	<input type="text" placeholder="短信验证码" name="shuruyzm" id="shuruyzm"/>
            </p>
            <div class="rem">
                <div class="visitor shangX" style="display: block;">
	            	<input type="hidden" id="identity" name="identity" value="1">
	                <span class="danxuan bgSelected" tid="1"></span>
	                <span style="margin-left:2%;margin-top: -4px;color: #000;">医生</span>
	                <span  class="danxuan" style="margin-left:6%" tid="2"></span>
	                <span style="margin-left:2%;margin-top: -4px;color: #000;">机构</span>
	                <span  class="danxuan" style="margin-left:6%;" tid="3"></span>
	                <span style="margin-left:2%;margin-top: -4px;color: #000;">药商</span>
	            </div>
                <a href="<%=basePath %>api/keHuPc/tosLogin.do" class="red">登录</a><a href="javascript:void(0)">有账号</a>
            </div>
            <a href="javascript:void(0)" class="login" onclick="register();">注册</a>
        </div>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script>
/*选择医生、机构或者药商*/
$(".danxuan").click(function(){
    $(this).addClass("bgSelected");
    $(this).siblings(".danxuan").removeClass("bgSelected");
    $("#identity").val($(this).attr("tid"));
});
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
       			}else{
       				console.log("获取验证码失败");
       			}
       		}
       	})
    }else{
    	layer.tips('手机号码格式不正确,请正确输入手机号', '#phone', {
    		  tips: [1, '#FF3E96'],
    		  time: 3000
    	});
    }
}
	//点击注册
function register(){
   var phone=$("#phone").val();//手机号
   var userName=$("#userName").val();//用户名
   var loginPassword=$("#loginPassword").val();//登录密码
   var pass=$("#pass").val();//确认密码
   var zhengqueyzm=$("#zhengqueyzm").val();//正确的验证码
   var shuruyzm=$("#shuruyzm").val();//输入的验证码
   var identity=$("#identity").val();//身份
  
   //判断用户名是否合法
   if(!isNaN(userName) || userName.length>20 || userName.length<0 || userName==''){
	   layer.tips('请注意用户名格式:不能为空、不能全为数字、长度0-20', '#userName', {
     		  tips: [1, '#FF3E96'],
     		  time: 3000
     	});
		return;
   }
   //判断密码是否合法
   if(loginPassword.length>20 || loginPassword.length<6){
	   layer.tips('请注意密码长度:长度6-20', '#loginPassword', {
     		  tips: [1, '#FF3E96'],
     		  time: 2000
     	});
		return;
   }
   //判断确认密码是否合法
   if(loginPassword!=pass){
	   layer.tips('两次密码输入不一致,请重新输入', '#pass', {
     		  tips: [1, '#FF3E96'],
     		  time: 2000
     	});
		return;
   }
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
  
 //去注册
   $.ajax({
		type:"post",
		url:"api/shangHu/register.do",
		data:{
			"phone":phone,
			"userName":userName,
			"loginPassword":loginPassword,
			"identity":identity
		},
		dataType:"json",
		success:function(data){
			if(data.respCode=='01'){
				//注册成功后进入登录页面
				window.location.href='api/keHuPc/tosLogin.do';
			}else{
				layer.msg("注册失败："+data.respMsg,{
		            time:3000,//单位毫秒
		            shade: [0.8, '#393D49'],
		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
		        })
			}
		}
	})
}
</script>
</body>
</html>