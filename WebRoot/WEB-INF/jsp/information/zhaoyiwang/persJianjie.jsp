<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <link rel="stylesheet" href="static/zhaoyiwang/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <title>个人简介</title>
    <style>
        .bgSelected{
            background: url(static/zhaoyiwang/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" >
    	<a href="javascript:history.go(-1)" style="width: 32px">
	    	<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
	    </a>
    </div>
    <div class="wy-header-title">个人简介</div>
</div>
<!--头部结束-->
<!--主体开始-->
<form action="<%=basePath %>api/shangHu/saveSettingPersonIntroduct.do" method="post" id="myForm">
	<input type="hidden" value="${pd.user_shanghu_id }" name="user_shanghu_id">
	<div class="dispBox">
	    <p>简　　介 : </p>
	    <textarea style="height: 250px;" name="introduct" id="introduct" placeholder="请输入你的个人简介，让别人更了解您...">${pd.introduct }</textarea>
	</div>
</form>
<a href="javascript:void(0)" class="save" onclick="save();">保存</a>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script type="text/javascript">
	function save(){
		if($("#introduct").val()==""){
			/*layer.msg("操作失败：个人简介不能为空",{
	            time:2000,//单位毫秒
	            shade: [0.8, '#393D49'], // 透明度  颜色
	            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
	        });*/
	        layer.open({
	        	content:'个人简介不能为空'
	        	,skin:'msg'
	        	,time:2
	        });
			return
		}
		$("#myForm").submit();
	}
</script>
</body>
</html>