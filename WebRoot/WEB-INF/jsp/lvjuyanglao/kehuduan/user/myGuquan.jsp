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
        .jifenBox>span:nth-child(1) {
		   
		     border-right: none; 
		}
		.jifenBox>span {
		    width: 100%;
		}
		
		.jifenBox>span:nth-child(1){
		    font-size:24px;color:#ffb528;background: url(../../images/zys/jifen.png) no-repeat 28% center;
		    background-size:44px 44px;border-right:1px solid #d8d8d8;
		}
		.guchuan{
			width:100%;
			height:100%;
			padding:20px 0;
			display:flex;
			background-color:#fff;
			justify-content: center;
			margin-top:60px;
		}
		.guchuan span{
			display:block;
			/* width:20%; */
			height:60px;
			line-height:60px;
			padding-left:70px;
			background: url(static/lvjuyanglao/zywkehuduan/images/zys/jifen.png) no-repeat left center;
			background-size:60px;
			margin:0 auto;
			color:#ffb528;
			font-size: 24px;
		}
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"><span style="position:relative;top:-4px;left:19px;color:#fff;font-size: 15px;">返回</span></a></div>
    <div class="wy-header-title">我的股权</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="guchuan">
   
    <span>${ppData.guquan}股</span>
</div>
<!--主体结束-->

</body>
</html>