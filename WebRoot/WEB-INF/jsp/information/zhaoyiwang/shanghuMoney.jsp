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
    <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
	<script src="static/zhaoyiwang/js/jquery-weui.js"></script>
    <title>成交金额</title>
    <style>
        body{
            background-color: #eee;
        }
         .picker-calendar-day.picker-calendar-day-selected span {
            background: #38c4ff;
            color: #fff;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" >
    	<a href="javascript:history.go(-1)" style="width: 32px;">
    		<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
    	</a>
    </div>
    <div class="wy-header-title">成交金额</div>
</div>
<!--头部结束-->
<!--主体开始-->
<form action="api/shangHu/toChengJiaoInformation.do" method="post">
<div class="moneyBox">
    <h2>${pd.chengjiaoAmount }</h2>
    <p>成交金额</p>
    <p>
    <%--
    	<input type="text" placeholder="请输时间查询记录" name="searchTime"/><input type="submit" value="搜索"/>
    --%>
    	<input type="text" name="searchTime" placeholder="1992-12-02" class="yesc weui-input" id="date"/><input type="submit" value="搜索"/>
    </p>
</div>
</form>
<div class="fabu" style="margin-top:10px;">
    <a href="javascript:void(0)" style="border-top:1px solid #d8d8d8;border-bottom: none;" onclick="toJump();">成交记录</a>
</div>
<!--主体结束-->
<script type="text/javascript">
	function toJump(){
		window.location.href="api/shangHu/toChengJiaoInformation.do";
	}
	 $("#date").calendar({
        onChange: function (p, values, displayValues) {
            console.log(values, displayValues);
        }
    });
</script>
</body>
</html>