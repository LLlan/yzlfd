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
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/index.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/font-awesome.css">
    <title>联系我们</title>
    <style>
        body{
            background-color:#eee;
        }
        .wy-header-icon-back{
            width:120px;
        }
        .wy-header-icon-back>a{
            background: url(static/zhaoyiwang/zywkehuduan/images/dingwei01.png) no-repeat;background-size: 20px;;
        }
        .searchBox{
            margin-top: 0;
        }
        .noneBox>p:nth-child(2)>a, .noneBox02>p:nth-child(2)>a, .noneBox03>p:nth-child(2)>a {
            padding: 17px 35px;
            border-right: 1px solid #ddd;
            color: #71b2d0;
        }
        .noneBox>p:nth-child(2)>a:last-child{
            border-right: none;
        }
        .weui-tabbar__label {
		    text-align: center;
		    color: #999;
		    font-size: 12px;
		    line-height: 1.2;
		    margin-bottom: 3px;
		}
    </style>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">联系我们</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<!--头部结束-->
<!--主体开始-->
<!--
<div class="searchBox">
    <div class="searchBlock">
        <form action="">
            <input type="text" placeholder="请输入关键词" class="keyWords"/>
            <input type="button" value="搜索" class="searchBtn"/>
        </form>
    </div>
</div>
-->
<ul class="connectBox" style="margin-top:50px;">
    <li>电话:${pd.tel_phone }<a href="javascript:void(0)" class="callKefu">联系客服</a></li>
    <li>QQ:${pd.koukou }</li>
    <li>微信:${pd.weixin }</li>
    <li>公众号:${pd.weixinpublic }</li>
    <li>邮箱:${pd.email }</li>
</ul>



<div class="mask"></div>
<div class="noneBox">
    <p>tel:${pd.tel_phone }</p>
    <p><a href="javascript:void(0)" class="cancel" style="color:#000;">取消</a> <a href="tel:${pd.tel_phone }" class="sure">确定</a></p>
</div>
<!--底部导航-->
<%@ include file="../diLan.jsp"%>
<!--主体结束-->
<script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script type="text/javascript">
    $(".callKefu").click(function(){
        $(".mask").fadeIn();
        $(".noneBox").fadeIn();
        $(".cancel").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
        });

    })
</script>
<script>
  	$(function(){
     	abc();
     	//checkSession();
     })
     
     function abc(e1){
			$("#lxwm").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
		}
		
		
		//判断session是否存在 做相应的提示
		function checkSession(){
			var respCode = "${respCode}";
			if(respCode=="01"){
				
			}else{
				layer.confirm('您还没有登录，马上去？', {
   			                btn: ['确定'],
   			                title:'温馨提示',
   			            	},function () {
   			            		window.location.href='api/zywkehu/toLogin.do';
   			            	}
   			       );
			}
		}
</script>
</body>
</html>