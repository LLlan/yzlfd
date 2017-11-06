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
    <link rel="stylesheet" href="static/zhaoyiwang/css/weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/index.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
    <title>付款成功</title>
    <style>
        body{
            background-color:#eee;
        }
        .wy-header-icon-back{
            width:120px;
        }
        .wy-header-icon-back>a{
            background: url(static/zhaoyiwang/images/dingwei01.png) no-repeat;background-size: 20px;;
        }
        .searchBox{
            margin-top: 0;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header">
    <div class="wy-header-title">付款成功</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="connectBox">

	<br>
    <div style="margin-left: 34%;">
    	<img src="static/zhaoyiwang/images/lvseduihao.png" style="width: 40px;">
    	<span style="margin-left: 10px;">付款成功</span>
    </div><br><br>
    <div style="margin-left: 20%;">
    	<a href="api/zywkehu/huiyuanzhongxin.do" style="color: #38c4ff;">订单详情</a>
    	<a href="api/zywkehu/index.do" style="margin-left: 25%;color: #38c4ff;">返回主页</a>
    </div>
    <input type="hidden" value="${order_xxx_id }" name="order_xxx_id">
    <input type="hidden" value="${type }" name="type">
    <br>
</div>
<!--主体结束-->
<script type="text/javascript">
	$(function(){
		var user_kuhu_id = "${user_kuhu_id}";
		var url = "api/zywkehu/createSession.do";
		   $.ajax({
	             type: "post",
	             url: url,
	             data: {user_kuhu_id:user_kuhu_id},
	             dataType: "json",
	             success: function(data){
	             	
	             }
	       });
	             
	})
</script>
</body>
</html>