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
    <title>填写银行卡信息</title>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">选择银行卡</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main" style="margin-top: 60px;">
    <div class="weui-cells">
        <div class="weui-cell" style="padding: 10px 15px ;">
            <div class="weui-cell__hd">
                <label class="weui-label">卡类型</label>
            </div>
            <div class="weui-cell__bd weui-cell_primary">
                <label class="weui-label">工商银行</label>
            </div>
        </div>
    </div>
    <div class="weui-cells" style="margin-top: 10px;">
        <div class="weui-cell" style="padding: 10px 15px ;">
            <div class="weui-cell__hd">
                <label class="weui-label" style="width: 80px;">手机号</label>
            </div>
            <div class="weui-cell__bd weui-cell_primary">
                <input class="weui-input" type="number"   placeholder="请填写银行预留手机号" name="username" id="text" value="">
            </div>
        </div>
    </div>
    <div class="weui-cell" style="padding: 10px 15px">
        <label for="weuiAgree" class="weui-agree">
            <input id="weuiAgree" type="checkbox" class="weui-agree__checkbox">
                <span class="weui-agree__text">
                    阅读并同意<a href="javascript:;">《相关条款》</a>
                </span>
        </label>
    </div>
    <div class="weui-btn-area">
        <a href="javascript:void(0)" class="weui-btn weui-btn_yellow" id="conf" onclick="toJump();">下一步</a>
    </div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    //点击下一步操作
    function toJump(){
    	window.location.href="api/shangHu/toXianJinAmountApplyAddBlankCard3.do";
    }
</script>
</body>
</html>