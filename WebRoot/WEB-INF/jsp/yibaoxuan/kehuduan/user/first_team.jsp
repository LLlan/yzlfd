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
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/weui.min.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/login.css">
    <link rel="stylesheet"  href="static/yibaoxuan/zywkehuduan/css/font-awesome.css">
    <title>一级团队</title>
    <style>
        body{
            background-color:#eee;
        }
       .main  .first_team{
           width: 100%;
           height: 30px;
           line-height: 30px;
           padding-left: 10px;
           color: #B0B0B0;
       }
        .team_list{
            width: 100%;
            overflow: hidden;
            padding: 10px 10px 15px 10px;
            background-color: #fff;
            border-bottom: 1px solid #ddd;
        }
        .team_list .moumou{
            width: 100%;
            margin-bottom: 5px;
        }
        .team_list .moumou b{
            margin-right: 10px;
            font-size: 18px;
        }

        .team_list .moumou span{
            color: #CACACA;
            font-size: 14px;
        }
        .team_list .dizhi{
            color: #CACACA;
        }
        .team_list img{
        	float:left;
        	width:80px;
        	height:80px;
      
        }
        .moumou,.dizhi{
        }
        .team_list{
        	margin-bottom:10px;
        }
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
   <div class="wy-header-icon-back" >
	   <a href="javascript:history.go(-1)" style="width: 32px">
	    	<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
	   </a>
    </div>
   <div class="wy-header-title">一级团队</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="main" style="margin-top: 50px;">
    <p class="first_team">我的一级团队${rpd.num}人</p>
    <c:forEach items="${yijiList}" var="yj">
    <div class="team_list">
        <div class="moumou">
            <b>${yj.userName }</b>
            <span>${yj.age }岁</span>
        </div>
        <div class="dizhi">
            <span>地址:</span>
            	${yj.address }
        </div>
   	 </div>
	</c:forEach>
</div>
<!--主体结束-->
    <script src="static/yibaoxuan/zywkehuduan/js/jquery-2.1.4.js"></script>
</body>
</html>