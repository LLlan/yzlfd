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
    <link rel="stylesheet" href="static/zhaoyiwang/css/index.css"/>
    <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/js/fastclick.js"></script>
    <script src="static/zhaoyiwang/js/jquery-weui.js"></script>
    <title>选择银行卡</title>
    <style>
        .weui-cell{
            padding: 20px 15px;
        }
    </style>
</head>
<body>
<div id="header" style="background-color: #068dff;">
    <h1 class="title">选择银行卡</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main" style="margin-top: 60px;">
    <div class="weui-cells__title">到账银行卡</div>
    <div class="weui-cells weui-cells_radio">
        <label class="weui-cell weui-check__label" for="x11">
            <div class="weui-cell__bd">
                <p>交通银行 <span>(1235)</span></p>
            </div>
            <div class="weui-cell__ft">
                <input type="radio" class="weui-check" name="radio1" id="x11">
                <span class="weui-icon-checked"></span>
            </div>
        </label>
        <label class="weui-cell weui-check__label" for="x12">

            <div class="weui-cell__bd">
                <p>建设银行 <span>(4235)</span></p>
            </div>
            <div class="weui-cell__ft">
                <input type="radio" name="radio1" class="weui-check" id="x12" checked="checked">
                <span class="weui-icon-checked"></span>
            </div>
        </label>
        <label class="weui-cell weui-check__label" for="x13">

            <div class="weui-cell__bd">
                <p>建设银行 <span>(3515)</span></p>
            </div>
            <div class="weui-cell__ft">
                <input type="radio" name="radio1" class="weui-check" id="x13" checked="checked">
                <span class="weui-icon-checked"></span>
            </div>
        </label>
        <div class="newka"><a href="javascript:void(0)" onclick="toJump();">使用新卡提现</a></div>
    </div>
</div>

<script>
    $(function () {
        FastClick.attach(document.body);
    });
    //点击使用新卡提现操作
    function toJump(){
    	window.location.href="api/shangHu/toXianJinAmountApplyAddBlankCard1.do";
    }
</script>
</body>
</html>