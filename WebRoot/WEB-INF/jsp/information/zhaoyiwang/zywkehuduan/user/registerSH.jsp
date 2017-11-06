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
   <link rel="stylesheet"  href="static/zhaoyiwang/zywkehuduan/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">
    <script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
    <title>注册成为商户引导说明</title>
    <style>
        body{
            background-color:#eee;
        }
        .main  .first_team{
            width: 100%;
            height: 30px;
            line-height: 30px;
            padding-left: 10px;
            color: #B0B0B0;
        }
        .team_list{
            width: 100%;
            overflow: hidden;
            padding: 10px 10px 15px 10px;
            background-color: #fff;
            border-bottom: 1px solid #ddd;
        }
        .team_list .moumou{
            width: 100%;
            margin-bottom: 5px;
        }
        .team_list .moumou b{
            margin-right: 10px;
            font-size: 18px;
        }

        .team_list .moumou span{
            color: #CACACA;
            font-size: 14px;
        }
        .team_list .dizhi{
            color: #CACACA;
        }
        .context{
        	font-size: 13px;
        	
        }
        
        .context>h2{
        	font-size: 16px;
        	text-align: center;
        }
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
	<div class="wy-header-icon-back" >
	   <a href="javascript:history.go(-1)" style="width: 32px">
	    	<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
	   </a>
    </div>    
    <div class="wy-header-title">注册成为商户</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="main context" style="margin-top: 50px;" >
	<h2>注册成为商户引导说明</h2>
    </br>1、请您先在首页底部APP下载处点击下载,安卓下载-选择"商户端"，然后下载即可。
      </br>2、注册时请选择身份（身份类型有医生，药商，机构等），如果您已经注册过了，请登录然后按提示完善信息提交相关资料即可。
      </br>3、成为商户需要提交资质认证资料（您的资质证书或成功治愈病人的案例图片等），提交完资料请等待后台人员审核通过，等待时间为1-2个工作日，审核通过后便可以正式成为平台的商户了。
</div>
<!--主体结束-->
</body>
</html>