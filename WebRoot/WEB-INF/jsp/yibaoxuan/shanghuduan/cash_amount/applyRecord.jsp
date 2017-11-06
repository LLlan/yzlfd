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
    <link rel="stylesheet" href="static/yibaoxuan/lib/weui.min.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/style.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/login.css">
    <title>申请记录</title>
    <style>
        body{
            background-color:#f0f0f0;
        }

    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back">
    	<a href="javascript:history.go(-1)" style="width: 32px">
    		<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
    	</a>
    </div>
    <div class="wy-header-title">申请提现记录</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="recordBox">
	<c:forEach items="${list }" var="list" end="0">
		<a href="javascript:void(0)" onclick="toDetail('${list.withdraw_cash_id }');">
	        <div class="tiMonBox" style="margin-top:60px;">
	            <p>提现</p>
	            <p>${list.shenqing_time }</p>
	            <span>-${list.amount }</span>
	        </div>
    	</a>
	</c:forEach>
	<c:if test="${list.size()>1 }">
		<c:forEach items="${list }" var="list" begin="1">
		<a href="javascript:void(0)" onclick="toDetail('${list.withdraw_cash_id }');">
	        <div class="tiMonBox">
	            <p>提现</p>
	            <p>${list.shenqing_time }</p>
	            <span>-${list.amount }</span>
	        </div>
    	</a>
	</c:forEach>
	</c:if>
</div>
<!--主体结束-->
<script src="static/yibaoxuan/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
	//进入明细页面
	function toDetail(id){
		window.location.href="api/ybxshangHu/toXianJinAmountApplyRecordDetail.do?withdraw_cash_id="+id;
	}
</script>
</body>
</html>