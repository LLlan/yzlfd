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
    <title>添加银行卡</title>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">选择银行卡</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main" style="margin-top: 60px;">
    <!--添加银行卡号-->
    <form method="post" data-url="/login" id="formlogin">
        <div class="weui-cells weui-cells_form">
            <div class="weui-cell" style="padding: 10px 15px ;">
                <div class="weui-cell__hd">
                    <label class="weui-label" style="width: 80px;">卡号</label>
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <input class="weui-input" type="number"  placeholder="银行卡号" name="username" id="text" value="">
                </div>
            </div>
        </div>
        <p style="font-size: 12px;margin-left: 15px;color: #A9A9A9;">请添加本人实名认证银行卡号</p>
        <div class="weui-btn-area">
            <a href="javascript:void(0)" class="weui-btn weui-btn_yellow" id="conf" onclick="toJump();">下一步</a>
        </div>
    </form>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    //点击下一步操作
    function toJump(){
    	window.location.href="api/shangHu/toXianJinAmountApplyAddBlankCard2.do";
    }
</script>
</body>
</html>