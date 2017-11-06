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
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet"  href="static/yibaoxuan/zywkehuduan/css/font-awesome.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/weui.min.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/login.css">
    <script src="static/yibaoxuan/zywkehuduan/js/jquery-2.1.4.js"></script>
    <title>我的团队</title>
    <style>
        body{
            background-color:#eee;
        }
        .persDataBox>a {
            margin-top: 0px;
        }
         .backlast{
      	  position:relative;top:-4px;left:19px;color:#fff;font-size: 15px;
        }
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"><span class="backlast">返回</span></a></div>
    <div class="wy-header-title">我的团队</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="persDataBox">
    <a href="api/ybxkehu/getYijiTeamList.do?user_kuhu_id=${pd.user_kuhu_id}">一级团队</a>
    <a href="api/ybxkehu/getErjiTeamList.do?user_kuhu_id=${pd.user_kuhu_id}">二级团队</a>
</div>
<!--主体结束-->
</body>
</html>