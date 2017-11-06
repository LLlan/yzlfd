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
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">
    <title>平台公告</title>
    <style>
        body{
            background-color:#fff;
        }

    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;z-index: 100;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"><span style="position:relative;top:-4px;left:19px;color:#fff;font-size: 16px;">返回</span></a></div>
    <div class="wy-header-title">平台公告</div>
</div>
<!--头部结束-->
<!--主体开始-->
<!-- <div class="searchBox" style="border-bottom: 1px solid #dedede;margin-top:50px;">
    <div class="searchBlock">
        <form action="">
            <input type="text" placeholder="请输入关键词" class="keyWords"/>
            <input type="button" value="搜索" class="searchBtn"/>
        </form>
    </div>
</div> -->

<div class="mainBox02">
    <p class="artList">-文章列表-</p>
    <c:forEach items="${gonggaolist }" var="gg">
    <div class="padBox">
        <a href="<%=basePath%>/api/zywkehu/getXinwenDetail.do?new_id=${gg.newsandnotice_id}&category=2" ><div>
            <div class="aleft">
                <p>${gg.title }</p>
                <p><span>热</span><span>来源 : ${gg.origin }</span><span>${gg.addTime }</span></p>
            </div>
            <img src="${gg.imgPth }" alt="" class="aright"/>
        </div></a>
    </div>
 </c:forEach>
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
    $(function(){

    })
</script>
</body>
</html>