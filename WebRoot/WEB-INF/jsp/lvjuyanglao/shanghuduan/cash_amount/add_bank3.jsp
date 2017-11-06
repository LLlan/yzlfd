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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/zhaoyiwang/css/yahu.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/weui.min.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/index.css"/>
    <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/js/fastclick.js"></script>
    <script src="static/zhaoyiwang/js/jquery-weui.js"></script>
    <title>身份验证</title>
    <style>
        .main_box>input {
            display: block;
            width: 100%;
            height: 42px;
            line-height: 42px;
            outline: none;
            border-radius: 0;
            border: none;
            border-top: 1px solid #ddd;
            margin: 11px auto 0 auto;
            padding-left: 5%;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">选择银行卡</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main" style="margin-top: 60px;">
    <p style="font-size: 12px;margin-left: 15px;color: #A9A9A9;">请输入手机号<span>155****32135</span>收到的短信验证码</p>
    <form class="main_box" action="">
        <input type="text" placeholder="短信验证码" name="telNumber">
        <input type="button" value="获取验证码" class="yanzheng"  onclick="clickButton(this)" style="top:0;"/>
    </form>


    <div class="login"><a href="javascript:void(0)" onclick="toJump();">下一步</a></div>

</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    //点击下一步操作
    function toJump(){
    	window.location.href="api/shangHu/toXianJinAmountApplyAddBlankCard4.do";
    }
</script>
<script type="text/javascript">
    function clickButton(obj){
        var obj = $(obj);
        obj.attr("disabled","disabled");/*按钮倒计时*/
        var time = 60;
        var set=setInterval(function(){
            obj.val(--time+"(s)");
        }, 1000);/*等待时间*/
        setTimeout(function(){
            obj.attr("disabled",false).val("重新获取");/*倒计时*/
            clearInterval(set);
        }, 60000);
    }
</script>
</body>
</html>