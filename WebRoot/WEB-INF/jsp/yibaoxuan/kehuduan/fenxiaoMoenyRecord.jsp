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
    <title>金额明细记录</title>
    <style>
        body{
            background-color:#f0f0f0;
        }
        .tiMonBox>p:nth-child(1){
        	color: #000;
		    font-size: 14px;
		    padding-top: 20px;
        }
        
        .tiMonBox>p.ttt{
        	color: #000;
		    font-size: 14px;
		    padding-top: 20px;
        }
       .tiMonBox>p:last-child{
        	margin-bottom: 10px;
        }

    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index:999">
    <div class="wy-header-icon-back">
    	<a href="javascript:history.go(-1)" style="width: 32px">
    		<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
    	</a>
    </div>
    <div class="wy-header-title">金额明细记录</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="recordBox" style="margin-top:60px;">
	<c:forEach items="${fenxiaoMoneyList }" var="list">
		<a href="javascript:void(0)">
	        <div class="tiMonBox" style="margin-top: 10px">
	            <p>金额来源：${list.fenxiao_name }</p>
	            <span>${list.money }元</span>
	            <p class="ttt">${list.insert_time }</p>
	        </div>
    	</a>
	</c:forEach>
	
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