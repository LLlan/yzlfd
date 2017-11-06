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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet"  href="static/lvjuyanglao/zywkehuduan/css/font-awesome.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/weui.min.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/login.css">
    <script src="static/lvjuyanglao/zywkehuduan/js/jquery-2.1.4.js"></script>
    <title>我的积分</title>
    <style>
        .bgSelected{
            background: url(../images/zys/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
        body{
            background-color: #eee;
        }
        
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a><span style="position:relative;top:-24px;left:35px;color:#fff;font-size: 16px;">返回</span></div>
    <div class="wy-header-title">我的积分</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="jifenBox">
    <span>${jifenData.jifen}分</span>
    <span>积分可以在平台上消费</span>
</div>
<!--主体结束-->

</body>
</html>