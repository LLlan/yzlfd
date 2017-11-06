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
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/zhaoyiwang/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <title>选择身份</title>
    <style>
        body{
            background-color:#eee;
        }
         .persDataBox>a{
		    display: block;
		    width: 96%;
		    height: 50px;
		    line-height: 50px;
		    /* padding: 0 4%; */
		    padding-left: 4%;
		    padding-right: 0;
		    color: #000;
		    margin-top: 10px;
		    border-top: 1px solid #dadada;
		    font-size: 16px;
		    background: #fff url(static/zhaoyiwang/images/arrow-r_03.png) no-repeat 95%;
		}
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <!--<div class="wy-header-icon-back" >
    	<a href="api/shangHu/toLogin.do" style="width: 32px;">
    		<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
    	</a>
    </div>-->
    <div class="wy-header-title">选择身份</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="persDataBox">
    <a href="javascript:void(0)" onclick="toJump('1');">医生</a>
    <a href="javascript:void(0)" onclick="toJump('2');">机构</a>
    <a href="javascript:void(0)" onclick="toJump('3');">药商</a>
 	<a href="javascript:void(0)" onclick="toJump('4');">旅居养老</a> 
    <a href="javascript:void(0)" onclick="toJump('5');">古玩字画苑</a>
    <a href="javascript:void(0)" onclick="toJump1();">退出账号</a>
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script type="text/javascript">
	//页面跳转
	function toJump(mark){
		window.location.href="api/shangHu/toPersonCenterByIdentity.do?identity="+mark;
	}
	function toJump1(){
		layer.open({
        	content:'确认退出该账号吗?退出后将无法进行其他操作!'
        	,btn:['残忍退出','再想想']
        	,yes:function(){
        		window.location.href="api/shangHu/removeLogin.do";
        	}
        	,no:function(index){
        		layer.close(index);
        	}
        });
	}
</script>
</body>
</html>