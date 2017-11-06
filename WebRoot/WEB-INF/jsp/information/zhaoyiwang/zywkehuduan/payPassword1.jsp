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
    <title>修改提现密码</title>
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
    <div class="wy-header-title">修改提现密码</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="main">
    <form class="main_box" action="<%=basePath %>api/zywkehu/toPayPassword2.do" method="post" id="myForm">
    	<!-- <input type="hidden" id="identity" name="identity" value="1"> -->
    	<%-- 正确的验证码 --%>
    	<input type="hidden" id="zhengqueyzm" name="zhengqueyzm" value="">
        <input type="number" placeholder="手机号" name="phone" value="${pd.phone }" id="phone" readonly="readonly">
        <input type="button" value="获取验证码" class="yanzheng" id="yanzheng"  onclick="clickButton(this)" style="top:0;"/>
        <input type="text" placeholder="短信验证码" name="shuruyzm" id="shuruyzm">
    </form>
    <!--  
    <div class="visitor shangX" style="display: block;">
        <span class="danxuan bgSelected" title="1"></span>
        <span style="margin-left:1%">医生</span>
   		<span class="danxuan" style="margin-left:6%;" title="2"></span>
        <span style="margin-left:1%;">机构</span>
        <span class="danxuan" style="margin-left:6%" title="3"></span>
        <span style="margin-left:1%">药商</span>
    </div>
    -->
    <div class="login"><a href="javascript:void(0)" onclick="yanzheng();">下一步</a></div>
    <!--
    <div class="log-reg" style="margin-top:35px;">
        <span>
            <a href="javascript:void(0)" class="bor-right" id="toLogin">登录</a><span>|</span><a href="javascript:void(0)" id="toRegister">注册</a>
        </span>
    </div>
    -->
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script type="text/javascript">
$(".danxuan").click(function(){
    $(this).addClass("bgSelected");
    $(this).siblings(".danxuan").removeClass("bgSelected");
    $("#identity").val($(this).attr("title"));
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
          				/*layer.tips('获取验证码失败,倒计时结束后,点击重新获取', '#yanzheng', {
                  		  tips: [1, '#D9006C'],
                  		  time: 3000
                  		});*/
                  		layer.open({
                  			content:'获取验证码失败,倒计时结束后,点击重新获取'
                  			,skin:'msg'
                  			,time:2
                  		});
          			}
          		}
          	});
        }else{
        	layer.open({
      			content:'请正确输入手机号码'
      			,skin:'msg'
      			,time:2
      		});
        }
    }
 	//点击验证
	function yanzheng(){
 		var zhengqueyzm=$("#zhengqueyzm").val();
 		var shuruyzm=$("#shuruyzm").val();
 		var phone=$("#phone").val();
 		if(!phoneReg.test(phone)){
 			layer.open({
      			content:'请正确输入手机号码'
      			,skin:'msg'
      			,time:2
      		});
 			return;
 		}
 		if(zhengqueyzm==''){
 			layer.open({
      			content:'请先获取验证码'
      			,skin:'msg'
      			,time:2
      		});
 			return;
 		}
		if(shuruyzm!=zhengqueyzm){
			layer.open({
      			content:'验证码输入不正确'
      			,skin:'msg'
      			,time:2
      		});
			return;
		}
		$("#myForm").submit();
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