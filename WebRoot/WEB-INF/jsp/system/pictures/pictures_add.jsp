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
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		
		<link rel="stylesheet" type="text/css" href="plugins/webuploader/webuploader.css" />
		<link rel="stylesheet" type="text/css" href="plugins/webuploader/style.css" />
		<link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
	</head>
	<style>
        .bgSelected{
            background: url(static/zhaoyiwang/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
        .danxuan1 {
		    display: block;
		    width: 15px;
		    height: 15px;
		    border: 1px solid #c1c1c1;
		}
		.bgSelected1{
            background: url(static/zhaoyiwang/images/select01.png) no-repeat;background-size: 15px 15px;border:none;
        }
        .visitor1 {
		    width: 93%;
		    height: 24px;
		    line-height: 24px;
		    margin: 16px auto auto auto;
		    font-size: 16px;
		    overflow: hidden;
		}
		.visitor1>span {
		    float: left;
		}
    </style>
<body>
<div class="visitor shangX" style="display: block;">
        <span class="danxuan bgSelected" tid="1"></span>
        <span style="margin-left:1%;">手机轮播图</span>
        <span class="danxuan" style="margin-left:6%;" tid="2"></span>
        <span style="margin-left:1%;">电脑轮播图</span>
</div>	
<div class="visitor1 shangX" style="display: block;">
        <span class="danxuan1 bgSelected1" tid="1"></span>
        <span style="margin-left:1%;">华夏郎中行</span>
        <span class="danxuan1" style="margin-left:1%;" tid="2"></span>
        <span style="margin-left:1%;">旅居养老</span>
        <span class="danxuan1" style="margin-left:1%;" tid="3"></span>
        <span style="margin-left:1%;">古玩字画苑</span>
        <span class="danxuan1" style="margin-left:1%;" tid="4"></span>
        <span style="margin-left:1%;">首页轮播图</span>
</div>
<input type="hidden" name="tidImg" id="tidImg" value="1"/>
<input type="hidden" name="type" id="type" value="1"/>
<input type="hidden" name="residence_dynamic_id" id="residence_dynamic_id" value=""/>
	<div id="zhongxin">
    <div id="wrapper">
        <div id="container">
            <!--头部，相册选择和格式选择-->

            <div id="uploader">
                <div class="queueList">
                    <div id="dndArea" class="placeholder">
                        <div id="filePicker"></div>
                        <p>或将照片拖到这里，单次最多可选300张</p>
                    </div>
                </div>
                <div class="statusBar" style="display:none;">
                    <div class="progress">
                        <span class="text">0%</span>
                        <span class="percentage"></span>
                    </div><div class="info"></div>
                    <div class="btns">
                        <div id="filePicker2"></div><div class="uploadBtn">开始上传</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

		</div>
		
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">提交中...</h4></div>
	
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
    	<script type="text/javascript" src="plugins/webuploader/webuploader.js"></script>
    	<script type="text/javascript" src="plugins/webuploader/upload_pictures.js"></script>
		
		<script type="text/javascript">
		$(top.hangge());
		$(".danxuan").click(function(){
	        $(this).addClass("bgSelected");
	        $(this).siblings(".danxuan").removeClass("bgSelected");
	        $("#tidImg").val($(this).attr("tid"));
	        if($(this).attr("tid")=='1'){
	        	$(".visitor1").css("display","block");
	        }else{
	        	$(".visitor1").css("display","none");
	        }
	    });
		$(".danxuan1").click(function(){
	        $(this).addClass("bgSelected1");
	        $(this).siblings(".danxuan1").removeClass("bgSelected1");
	        $("#type").val($(this).attr("tid"));
	    });
		</script>
</body>
</html>