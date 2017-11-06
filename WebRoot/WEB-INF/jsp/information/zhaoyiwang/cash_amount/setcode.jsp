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
    <link rel="stylesheet" href="static/zhaoyiwang/css/yahu.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/weui.min.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/index.css"/>
    <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/js/fastclick.js"></script>
    <script src="static/zhaoyiwang/js/jquery-weui.js"></script>
    <title>修改密码</title>
    <style>

        .weui-cells{
            margin-top: 0;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #068dff;">
    <h1 class="title">修改密码</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main" style="margin-top: 60px;">
    <!--添加银行卡号-->
    <form method="post" data-url="/login" id="formlogin" style="background-color: #fff;">
        <div class="weui-cells weui-cells_form" >
            <div class="weui-cell" >
                <div class="weui-cell__hd">
                    <label class="weui-label" style="width: 80px;">手机号</label>
                </div>
                <div class="weui-cell__bd weui-cell_primary" style="position: relative;">
                    <input class="weui-input" type="number"  placeholder="输入手机号" name="username" id="text" value="">
                    <input type="button" value="获取验证码" class="yanzheng"  onclick="clickButton(this)" style="top:0;"/>
                </div>
            </div>
        </div>
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell" style="padding: 10px 15px ;">
                <div class="weui-cell__hd">
                    <label class="weui-label" style="width: 80px;">验证码</label>
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="number"  placeholder="输入短信验证码" name="username"  value="">
                </div>
            </div>
        </div>
    </form>
    <div class="weui-btn-area">
        <a href="javascript:void(0)" class="weui-btn weui-btn_yellow" id="conf" onclick="toJump();">下一步</a>
    </div>
</div>
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
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
  	//点击下一步操作
    function toJump(){
    	window.location.href="api/shangHu/toXianJinAmountApplyMissPassword2.do";
    }
</script>
</body>
</html>