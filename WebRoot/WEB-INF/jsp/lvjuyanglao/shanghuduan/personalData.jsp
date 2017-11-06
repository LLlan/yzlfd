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
    <link rel="stylesheet" href="static/lvjuyanglao/lib/weui.min.css">
    <link rel="stylesheet" href="static/lvjuyanglao/css/jquery-weui.css">
    <link rel="stylesheet" href="static/lvjuyanglao/css/style.css">
    <link rel="stylesheet" href="static/lvjuyanglao/css/login.css">
    <title>个人资料</title>
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
		    background: #fff url(static/lvjuyanglao/images/arrow-r_03.png) no-repeat 95%;
		}
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <div class="wy-header-icon-back" >
    	<a href="javascript:void(0)" style="width: 32px;" onclick="window.location.href='api/ljylshangHu/toPersonCenter.do'">
    		<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
    	</a>
    </div>
    
    <div class="wy-header-title">个人资料</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="persDataBox">
    <a href="javascript:void(0)" onclick="toJump('1');">基本信息</a>
    <a href="javascript:void(0)" onclick="toJump('2');">简　　介</a>
    <a href="javascript:void(0)" onclick="toJump('3');">经营范围</a>
    <a href="javascript:void(0)" onclick="toJump('4');">提现密码</a>
 <!--    <a href="javascript:void(0)" onclick="toJump('4');">案例</a> -->
    <a href="javascript:void(0)" onclick="toJump('5');">退出账号</a>
</div>
<!--主体结束-->
<script src="static/lvjuyanglao/js/jquery-2.1.4.js"></script>
<script src="static/lvjuyanglao/layer/mobile/layer.js"></script>
<script type="text/javascript">
	//页面跳转
	function toJump(mark){
		if(mark=="1"){
			window.location.href="api/ljylshangHu/toSettingPersonInformation.do";
		}else if(mark=="2"){
			window.location.href="api/ljylshangHu/toSettingPersonIntroduct.do";
		}else if(mark=="3"){
			window.location.href="api/ljylshangHu/toSettingGoodField.do";
		}else if(mark=='4'){
			window.location.href="api/shangHu/toPayPassword1.do";
		}else{
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
	}
</script>
</body>
</html>