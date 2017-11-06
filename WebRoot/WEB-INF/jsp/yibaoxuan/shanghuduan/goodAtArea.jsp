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

    <link rel="stylesheet" href="static/yibaoxuan/lib/weui.min.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/style.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/login.css">
    <title>经营范围</title>
    <style>
        .bgSelected{
            background: url(static/yibaoxuan/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
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
    <div class="wy-header-title">经营范围</div>
</div>
<!--头部结束-->
<!--主体开始-->
<form action="<%=basePath %>api/ybxshangHu/saveSettingGoodField.do" method="post" id="myForm">
	<div class="dispBox">
	    <p>经营范围 : </p>
	    <textarea style="height: 250px;" name="goodField" id="goodField" placeholder="请输入经营范围...">${pd.goodField }</textarea>
	</div>
</form>
<a href="javascript:void(0)" class="save" onclick="save();">保存</a>
<!--主体结束-->
<script src="static/yibaoxuan/js/jquery-2.1.4.js"></script>
<script src="static/yibaoxuan/layer/mobile/layer.js"></script>
<script type="text/javascript">
	function save(){
		if($("#goodField").val()==""){
			layer.open({
				content:'请输入经营范围'
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