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
        <p>客户设置新密码 <a href="<%=basePath %>api/keHuPc/tosLogin.do">商户端登录</a><a href="<%=basePath %>api/keHuPc/toLogin.do">客户端登录</a><a href="<%=basePath %>api/keHuPc/index.do">返回首页</a></p>
    </div>
</div>
<div class="banBack">
    <div class="banner">
        <div class="loginBox">
            <p><img src="static/images/zyw/yisheng1.png" alt=""/></p>
            <p class="user"><a href="javascript:void(0)"><img src="static/images/zyw/pass1.png" alt=""/></a><input type="password" placeholder="设置新密码(6~20位)" id="password"/></p>
            <p class="pass"><a href="javascript:void(0)"><img src="static/images/zyw/pass1.png" alt=""/></a><input type="password" placeholder="确认密码" id="password1"/></p>
            <p class="rem"><a href="<%=basePath %>api/keHuPc/toLogin.do" class="red">登录</a><a href="javascript:void(0)">有账号</a></p>
            <a href="javascript:void(0)" class="login" onclick="wancheng();">完成</a>
            <%-- 手机号 --%>
    		<input type="hidden" id="phone" value="${phone }">
        </div>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script>
    //完成
    function wancheng(){
    	var phone=$("#phone").val();
    	var password=$("#password").val();
    	var password1=$("#password1").val();
    	if(password.length<6 || password.length>20){
    		layer.tips('请输入6~20位密码', '#password', {
      		  tips: [1, '#FF3E96'],
      		  time: 3000
      		});
    		return;
    	}
    	if(password!=password1){
    		layer.tips('两次密码输入不一致', '#password1', {
      		  tips: [1, '#FF3E96'],
      		  time: 3000
      		});
    		return;
    	}
    	$.post('api/keHuPc/updatePassword',{phone:phone,password:password},function(data){
    		if(data.respCode=="00"){
    			layer.alert("该手机号还未注册!点击去注册一个吧",{
    	            title:"错误提示"//提示标题，默认为：信息
    	            ,skin: 'layui-layer-lan'
    	            ,anim: 0 //动画类型0-6，默认为：0
    	            ,closeBtn: 0//是否显示关闭按钮，0-不显示，1-显示，默认为1
    	            ,btn: ['再想想','去注册'] //按钮
    	            ,icon: 5    // icon
    	            ,yes:function(){
    	            	layer.closeAll();
    	            }
    	            ,btn2:function(){
    	            	window.location.href='api/keHuPc/toRegister.do';
    	            }
    			});
    		}else{
    			layer.msg("修改成功",{
    	            time:3000,//单位毫秒
    	            shade: [0.8, '#393D49'], // 透明度  颜色
    	            icon:6,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    	        })
    			setTimeout("window.location.href='api/keHuPc/toLogin.do'", 3000);
    		}
    	});
    }
</script>
</body>
</html>