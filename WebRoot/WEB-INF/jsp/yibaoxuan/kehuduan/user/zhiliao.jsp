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
    <title>个人信息</title>
    <style>
        body{
            background-color:#eee;
        }
        
        .wy-header-icon-back a {
		    width: 35px;
		    height: 20px;
		    margin: 7px 0 0 10px;
		    background: url(static/yibaoxuan/images/zys/icon-back.png) no-repeat;
		    background-size: 20px;
		    display: block;
		}
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"><span style="position:relative;top:-4px;left:19px;color:#fff;font-size: 16px;">返回</span></a></div>
    <div class="wy-header-title">个人信息</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="persDataBox">

    <a href="api/ybxkehu/gerenziliao.do?user_kuhu_id=${pd.user_kuhu_id}">个人信息</a>
    <a href="api/ybxkehu/myEwm.do?user_kuhu_id=${pd.user_kuhu_id}">我的二维码</a>
    <a href="api/ybxkehu/myTeam.do?user_kuhu_id=${pd.user_kuhu_id}">我的团队</a>
    <a href="api/ybxkehu/myJifen.do?user_kuhu_id=${pd.user_kuhu_id}">我的积分</a>
    <a href="api/ybxkehu/myGuquan.do?user_kuhu_id=${pd.user_kuhu_id}">我的股权</a>
    <a href="api/ybxkehu/myXunibi.do?user_kuhu_id=${pd.user_kuhu_id}">我的虚拟币</a>
    <a href="api/ybxshangHu/getCunKuanList.do?user_id=${pd.user_kuhu_id}">存款管理</a>
    <!-- <a href="api/ybxkehu/registerSH.do">注册成为商户</a> -->
    <a href="api/ybxkehu/shangjiaRegister.do">注册成为商户</a>
</div>
<!--主体结束-->

</body>
</html>