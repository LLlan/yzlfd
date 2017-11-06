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
    <link rel="stylesheet"  href="static/zhaoyiwang/zywkehuduan/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">
    <script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
    <title>二维码</title>
    <style>
        .Main{
            position: relative;
            width: 100%;
            height: 100%;
            margin-top: 50px;
           /* display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;*/
        }
        .colum{
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -100px;
            margin-top: -100px;
            width: 200px;
            height: 230px;
        }
        .Picture,img{
            position: absolute;
            top: 40%;
            left: 50%;
            margin-left: -100px;
            margin-top: -100px;
            width: 200px;
            height: 200px;
            border: none;
            text-align: center;
        }
        img{
            border: none;
        }
        .Main span{
            position: absolute;
            left: 0;
            bottom: -20px;
            /*width: 100%;
            height:30px;
            line-height: 30px;*/
            color: #333;
            font-size: 14px;
        }

    </style>
</head>
<body>
<!--头部开始-->
<!-- <div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a><span style="position:relative;top:-24px;left:35px;color:#fff;font-size: 16px;">返回</span></div>
    <div class="wy-header-title">我的二维码</div>
</div> -->
<div class="Main" style="">
    <div class="Picture">
        <img src="${pds.ewmImg}" alt=""/>
   		<span style="margin-top: 1px;">扫一扫上面的二维码，加入我们</span>
    </div>
    
<!--     <div class="-mob-share-ui-button -mob-share-open">分享</div>
<div class="-mob-share-ui" style="display: none">
    <ul class="-mob-share-list">
        <li class="-mob-share-weixin"><p>微信</p></li>
        <li class="-mob-share-weibo"><p>新浪微博</p></li>
        <li class="-mob-share-qzone"><p>QQ空间</p></li>
        <li class="-mob-share-qq"><p>QQ好友</p></li>
        <li class="-mob-share-douban"><p>豆瓣</p></li>
        <li class="-mob-share-facebook"><p>Facebook</p></li>
        <li class="-mob-share-twitter"><p>Twitter</p></li>
    </ul>
    <div class="-mob-share-close">取消</div>
</div> -->
<div class="-mob-share-ui-bg"></div>
<script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=你的appkey"></script>
</div>
<script>
    $(function(){
        $(".Main").height($(window).height()-50) ;
    })
</script>
</body>
</html>