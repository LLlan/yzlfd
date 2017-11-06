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
    <title>账单详情</title>
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
    <div class="wy-header-title">账单详情</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="zhangdanBox">
    <p>流水号:<span>${pd.serial_number }</span></p>
    <p>类型:<span>提现</span></p>
    <p>支出:<span>${pd.amount }元</span></p>
    <p>时间:<span>${pd.shenqing_time }</span></p>
    <p>余额:<span>${pd.balance_amount }元</span></p>
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script type="text/javascript">

</script>
</body>
</html>