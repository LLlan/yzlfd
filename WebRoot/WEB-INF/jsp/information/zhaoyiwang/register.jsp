<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/zhaoyiwang/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <title>注册</title>
    <style>
        .bgSelected{
            background: url(static/zhaoyiwang/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header"  style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back"><a href="javascript:history.go(-1)"></a></div>
    <div class="wy-header-title">注册</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="main">
	<form class="main_box">
    	<%-- 身份角色 --%>
    	<!--  
    	<input type="hidden" id="identity" name="identity" value="1">
    	-->
    	<%-- 正确的验证码 --%>
    	<input type="hidden" id="zhengqueyzm" name="zhengqueyzm" value="">
        <input type="text" placeholder="用户名(不能全为数字)" name="userName" id="userName">
        <input type="password" placeholder="设置密码(6-20位)" name="loginPassword" id="loginPassword">
        <input type="password" placeholder="确认密码" id="pass">
        <input type="number" placeholder="手机号" name="phone" id="phone">
        <input type="button" value="获取验证码" class="yanzheng"  onclick="clickButton(this)" id="yanzheng"/>
        <input type="text" placeholder="短信验证码" name="shuruyzm" id="shuruyzm">
    </form>
    <%-- 现在只做医生的，其他的先不做，默认即为医生 --%>
    <!--  
    <div class="visitor shangX" style="display: block;">
        <span class="danxuan bgSelected" title="1"></span>
        <span style="margin-left:1%">医生</span>
        <span  class="danxuan" style="margin-left:6%;" title="2"></span>
        <span style="margin-left:1%;">机构</span>
        <span  class="danxuan" style="margin-left:6%" title="3"></span>
        <span style="margin-left:1%">药商</span>
    </div>
    -->
    <%-- 协议部分 --%>
    <div style="width: 93%;height: 24px;line-height: 24px;margin: 16px auto auto auto;font-size: 16px;overflow: hidden;">
    	<input id="checkbox" type="checkbox" style="width: 17px;height: 17px;position: absolute;margin-top: 4px;">
    	<span style="margin-left: 20px;font-size: 15px;">请阅读并接受</span>
    	<a href="javascript:void(0);" id="yuedu" style="margin-left: -10px;color: #38c4ff;font-size: 15px;">《华夏郎中行商户协议》</a>
    </div>
    
    
    <div class="login" onclick="register();">
    	<a href="javascript:void(0)">注册</a>
    </div>
    
    
    <div class="log-reg" style="margin-top:35px;">
        <span>
            <a href="javascript:void(0)" class="bor-right" id="toLogin">登录</a><span>|</span><a href="javascript:void(0)" id="toRegister">注册</a>
        </span>
    </div>
</div>
<%-- 协议主体 --%>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script type="text/javascript">
	//阅读协议
	$("#yuedu").click(function(){
		layer.open({
            type: 2
            ,title: "商户注册协议" //不显示标题栏   title : false/标题
            ,closeBtn: 0//是否显示关闭按钮0和1
            ,area:['100%', '100%']//宽高
            ,shade: 0.5//透明度
            ,style:'background:gray;'
            ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
            ,resize: false
            ,skin: 'layui-layer-lan'
            ,btn: ['我已阅读']
            ,btnAlign: 'c'
            ,moveType: 0 //拖拽模式，0或者1
            ,shadeClose: false //开启遮罩关闭
            ,content: 'api/shangHu/getXieYi.do?type=2'
            ,success: function(){
            	
            }
        });
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
        		  tips: [1, '#D9006C'],
        		  time: 3000
        	});
        }
    }
    $(".danxuan").click(function(){
        $(this).addClass("bgSelected");
        $(this).siblings(".danxuan").removeClass("bgSelected");
        $("#identity").val($(this).attr("title"));
    });
    //点击注册
    function register(){
	   var phone=$("#phone").val();//手机号
	   var userName=$("#userName").val();//用户名
	   var loginPassword=$("#loginPassword").val();//登录密码
	   var pass=$("#pass").val();//确认密码
	   var zhengqueyzm=$("#zhengqueyzm").val();//正确的验证码
	   var shuruyzm=$("#shuruyzm").val();//输入的验证码
	   //var identity=$("#identity").val();//身份
	   //判断是否获取验证码
	  if(!$("input[type='checkbox']").is(':checked')){
		   layer.tips('您还未接受华夏郎中行商户协议', '#checkbox', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
	   }
	   //判断是否获取验证码
	  if(zhengqueyzm==''){
		   layer.tips('您还没有获取验证码，请点击获取验证码', '#yanzheng', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
	   }
	   //判断用户名是否合法
	   if(!isNaN(userName) || userName.length>20 || userName.length<0 || userName==''){
		   layer.tips('请注意用户名格式:不能为空、不能全为数字、长度6-20', '#userName', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
	   }
	   //判断密码是否合法
	   if(loginPassword.length>20 || loginPassword.length<6){
		   layer.tips('请注意密码长度:长度6-20', '#loginPassword', {
	     		  tips: [1, '#D9006C'],
	     		  time: 2000
	     	});
			return;
	   }
	   //判断确认密码是否合法
	   if(loginPassword!=pass){
		   layer.tips('两次密码输入不一致,请重新输入', '#pass', {
	     		  tips: [1, '#D9006C'],
	     		  time: 2000
	     	});
			return;
	   }
	   //判断手机号码是否合法
	   if(!phoneReg.test(phone)){
		   layer.tips('手机号码格式不正确,请正确输入手机号', '#phone', {
     		  tips: [1, '#D9006C'],
     		  time: 3000
     		});
		   return;
	   }
	   //判断验证码输入是否正确
	   if(zhengqueyzm!=shuruyzm){
		   layer.tips('验证码输入不正确,请重新输入', '#shuruyzm', {
	     		  tips: [1, '#D9006C'],
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
    			"loginPassword":loginPassword
    			//"identity":identity
    		},
    		dataType:"json",
    		success:function(data){
    			if(data.respCode=='01'){
    				console.log(data.accid)
    				console.log(data.token)
    				//注册成功后进入登录页面
    				window.location.href='api/shangHu/toLogin.do';
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
   //进入登录页面
   $("#toLogin").click(function(){
	   window.location.href='api/shangHu/toLogin.do';
   });
   //进入注册页面
   $("#toRegister").click(function(){
	   window.location.href='api/shangHu/toRegister.do';
   });
</script>
</body>
</html>