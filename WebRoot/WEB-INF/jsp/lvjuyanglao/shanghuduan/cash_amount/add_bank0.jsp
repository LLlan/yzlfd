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
    <link rel="stylesheet" href="static/zhaoyiwang/css/weui1.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/index.css"/>
    <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/js/fastclick.js"></script>
    <script src="static/zhaoyiwang/js/jquery-weui.js"></script>
    <title>我的银行卡</title>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">我的银行卡</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main" style="margin-top: 60px;">
    <!--中国建设银行-->
    <div class="weui_cells weui_cells_access">
        <a class="weui_cell" href="javascript:void(0)">
            <div class="weui_cell_hd"><img src="static/zhaoyiwang/images/jiansheyinhang.png" style="width: 40px;height: 40px;" alt="" ></div>
            <div class="weui_cell_bd weui_cell_primary turn_left" style="margin-left: 10px;">
                <p>中国建设银行</p>
                <p style="color: #ddd;font-size: 0.75em" class="huise">尾号1234 存蓄卡</p>
            </div>
            <%-- <div class="weui_cell_ft"></div> --%>
        </a>
    </div>
    <!--添加银行-->
    <div class="weui_cells weui_cells_access" style="margin-top: 5px">
        <a class="weui_cell" href="javascript:void(0)" onclick="toJump();">
            <div class="weui_cell_hd">
                <label  class="weui_label" style="width: 40px;"><img src="static/zhaoyiwang/images/add2.png" style="width: 40px;height: 40px;vertical-align: middle;margin-right: -10px;" alt=""/></label>
            </div>
            <div class="weui_cell_bd weui_cell_primary " style="margin-left: 10px">
                添加银行卡
            </div>
            <div class="weui_cell_ft"></div>
        </a>
    </div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    //点击添加银行卡操作
    function toJump(){
    	window.location.href="api/shangHu/toXianJinAmountApplyAddBlankCard1.do";
    }
</script>
</body>
</html>