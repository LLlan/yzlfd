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
    <title>设置新密码</title>
    <style>
        body{
            background-color: #f4f4f4;
        }

        .weui-cells{
            margin-top: 0;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #068dff;">
    <h1 class="title">设置新密码</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>


<div class="main" style="margin-top: 60px;">
    <!--添加银行卡号-->
    <form method="post" data-url="/login" id="formlogin" style="background-color: #fff;">
        <div class="weui-cells weui-cells_form" >
            <div class="weui-cell" >
                <div class="weui-cell__hd">
                    <label class="weui-label" style="width: 80px;">新密码</label>
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="number"  placeholder="输入新密码" name="username" id="text" value="">
                </div>
            </div>
        </div>
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell" style="padding: 10px 15px ;">
                <div class="weui-cell__hd">
                    <label class="weui-label" style="width: 80px;">确认密码</label>
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="number"  placeholder="再次输入密码" name="username"  value="">
                </div>
            </div>
        </div>
    </form>
    <p style="font-size: 12px;margin-left: 10px;color: #A9A9A9;">密码由6-20位英文字母或数字组成</p>
    <div class="weui-btn-area">
        <a href="javascript:void(0)" class="weui-btn weui-btn_yellow" id="conf">确认</a>
    </div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
  	//点击确认操作
    function queren(){
    	window.location.href="api/shangHu/toXianJinAmountApplyMissPassword3.do";
    }
</script>
</body>
</html>