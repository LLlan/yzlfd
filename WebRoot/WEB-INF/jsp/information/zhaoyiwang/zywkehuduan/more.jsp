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
	s<base href="<%=basePath%>">	
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">
    <title>æ´å¤</title>
    <style>
        body{
            background-color:#eee;
        }
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a><span style="position:relative;top:-24px;left:35px;color:#fff;font-size: 16px;">返回</span></div>
    <div class="wy-header-title">更多</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="searchBox">
    <div class="searchBlock">
        <form action="">
            <input type="text" placeholder="请输入关键词" class="keyWords"/>
            <input type="button" value="搜索" class="searchBtn"/>
        </form>
    </div>
</div>
<div class="moreBox">
    <div>-超链接-</div>
    <p><a href="">法务</a><a href="">养老院</a><a href="">法务</a><a href="">养老院</a></p>
    <p><a href="">找法网</a><a href="">村里医生</a><a href="">房天下</a><a href="">找医网</a></p>
    <p><a href="">法务</a><a href="">养老院</a><a href="">法务</a><a href="">养老院</a></p>
    <p><a href="">找法网</a><a href="">村里医生</a><a href="">房天下</a><a href="">找医网</a></p>
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
<script type="text/javascript">

</script>
</body>
</html>