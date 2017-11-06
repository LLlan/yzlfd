<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
	<base href="<%=basePath%>">	
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/yahu.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/index.css"/>
    <script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/zywkehuduan/js/fastclick.js"></script>
    <title>案例详情</title>
    <style>
        body{
            background-color: #fff;
            font-size: 15px;
        }
        .Title{
            font-size: 16px;
            font-weight: bold;
            width: 100%;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .content{
            width: 100%;
            padding: 10px;
            overflow: hidden;
            text-indent: 2em;
            text-align: justify;
        }
    </style>
</head>
<body>
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">案例详情</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<!--主体-->
<div class="main">
    <p class="Title">标题：<span>${anliData.title }</span></p>
    <div class="content">
        <p>
        ${anliData.detailContent}
    </div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>