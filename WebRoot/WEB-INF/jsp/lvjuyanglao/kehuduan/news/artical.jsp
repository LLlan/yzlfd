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

    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">
    <link href="static/zhaoyiwang/zywkehuduan/css/index1.css" type="text/css" rel="stylesheet"/>
    <link href="static/zhaoyiwang/zywkehuduan/css/common1.css" type="text/css" rel="stylesheet"/>
    <title>文章详情</title>
    <style type="text/css">
    .artBox01>h2 {
	    width: 100%;
	    text-align: center;
	    color: #000;
	    font-size: 18px;
	    font-style: italic;
	    margin-top: 8px;
	    font-weight: 400;
	    overflow: hidden !important;
	}
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"><span style="position:relative;top:-4px;left:19px;color:#fff;font-size: 16px;">返回</span></a></div>
    <div class="wy-header-title">文章详情</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="artBox01">
    <h2>${xgData.title }</h2>
    
    <div class="time01">${xgData.addTime }</div>
    <p>${xgData.content}</p>
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
<script type="text/javascript">

</script>
</body>
</html>