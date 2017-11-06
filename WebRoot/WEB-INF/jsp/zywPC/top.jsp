<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html ng-app="demo">
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
     
    <link rel="stylesheet" type="text/css" href="static/rongcloud/vendor/jqueryrebox/jquery-rebox-0.1.0.css"/>
    <link rel="stylesheet" type="text/css" href="static/rongcloud/css/RongIMWidget.css"/>
    <link rel="stylesheet" type="text/css" href="static/rongcloud/demo/main.css"/>
    
    <script src="static/rongcloud/vendor/jquery-2.2.2.js"></script>
	<script src="static/rongcloud/vendor/angular-1.4.8.js"></script>
	
	<!-- 融云IMLib -->
	<script src="//cdn.ronghub.com/RongIMLib-2.2.5.min.js"></script>
	<script src="//cdn.ronghub.com/RongEmoji-2.2.5.min.js"></script>
	<script src="//cdn.ronghub.com/Libamr-2.2.5.min.js"></script>
	<script src="//cdn.ronghub.com/RongIMVoice-2.2.5.min.js"></script>
	
	<!-- 上传插件 -->
	<script src="static/rongcloud/vendor/plupload.full.min-2.1.1.js"></script>
	<script src="static/rongcloud/vendor/qiniu-1.0.17.js"></script>
	
	<!-- 增强体验插件 -->
	<script src="static/rongcloud/vendor/jqueryrebox/jquery-rebox-0.1.0.js"></script>
	
	<!-- IM插件 -->
	<script src="static/rongcloud/js/RongIMWidget.js"></script>
	<script src="static/rongcloud/demo/common.js"></script>
	<script src="static/rongcloud/demo/user1/index.js"></script>
    
</head>
	<style>
        .red1{
            background:#fff url(static/images/zyw/arrow02.png) 70px center no-repeat;background-size:16px 14px;
            border:1px solid #c1c1c1;border-bottom:none;
        }
        .red2{
            color:#38c4ff;border-bottom:2px solid #38c4ff;
        }
        .show{
            display: block;
        }
        .color1{
            color:#38c4ff;
        }
        .header>ul>li{
            cursor:pointer;
        }
        .header>ul>li:hover>a{
        	color:#38c4ff;
        }
        .vipCenter:hover>ul{
        	display:block;
        }
        .vipCenter>ul>li:hover>a{
        	color:#38c4ff;
        }
        .guquan,.xunibi{
            position: relative;height:30px;border:1px solid #f9f9f9;border-top:none;border-bottom:none;
            /*z-index: 1000;*/
            z-index: 99;
            background-color:#f9f9f9;;
        }
        .xunibi:hover>div{
        	display:block;
        }
        .xunibi:hover{
        	color:#38c4ff;
        }
        .guquan:hover>div{
        	display:block;
        }
        .guquan:hover{
        	color:#38c4ff;
        }
        .guquan>div{
            width:110px;height:52px;background:#fff url(static/images/zyw/guquan.png) no-repeat 5px center;line-height:52px;background-size:31px 31px;z-index: 999;;
        position: absolute;top:29px;right: -1px;border:1px solid #e5e5e5;text-align:right;color:#38c4ff;font-size:18px;;display: none;padding-right:8px;
        }
        .xunibi>div{
            width:110px;padding-right:10px;height:52px;background:#fff url(static/images/zyw/xunibi.png) no-repeat 10px center;line-height:52px;background-size:31px 31px;z-index: 999;;
            position: absolute;top:29px;right:-1px;border:1px solid #e5e5e5;text-align:right;color:#38c4ff;font-size:18px;;display: none;
        }
        .header>ul>.guquan span{
            color:#38c4ff;font-size:18px;!important;
        }
        .header>ul>.xunibi span{
            color:#38c4ff;font-size:18px;!important;
        }
        .erm {
		       width: 212px;
		    padding: 5px;
		    height: 230px;
		    position: absolute;
		    z-index: 100;
		    background-color: #fff;
		    top: 29px;
		    border: 1px solid #ddd;
		    box-shadow: 0 0 5px #ddd;
		    right: -131%;
		}
    </style>
<body ng-controller="main">
<header>
    <div class="header">
        <p>您好!欢迎来到华夏郎中行!</p>
        <ul style="margin-right: -10px;">
        	<c:choose>
        		<c:when test="${topPd.userName=='' || topPd.userName==null }">
        			<li class="denglu"><a href="<%=basePath %>api/keHuPc/toLogin.do">登录</a><span>|</span></li>
            		<li class="zhuce"><a href="<%=basePath %>api/keHuPc/toRegister.do">注册</a><span>|</span></li>
        		</c:when>
        		<c:otherwise>
        			<li class="tuichu"><a href="<%=basePath %>api/keHuPc/tuichu.do">退出</a></li>
		            <li style="color:#38c4ff;margin-right:10px;" class="xingming" onclick="window.location.href='api/keHuPc/personCenter1.do'">
		            <c:choose>
		            	<c:when test="${shanghuUser.identity!=null && shanghuUser.identity!='' }">
		            		商户:
		            	</c:when>
		            	<c:otherwise>
		            		客户:
		            	</c:otherwise>
		            </c:choose>
		            ${topPd.userName }
		            </li>
		            <li style="color:#fea01a;padding-left:15px;margin-right:10px;background:url(static/images/zyw/jifen.png) left no-repeat;background-size:12px 12px;" class="jifen">${topPd.jifen }分</li>
		            <li style="padding:0 10px;" class="guquan">股权
		                <div><span>${topPd.guquan }</span>股</div>
		            </li>
		            <li style="padding:0 10px;" class="xunibi">虚拟币
		                <div><span>￥${topPd.xunibi }</span></div>
		            </li>
        		</c:otherwise>
        	</c:choose>
            <li class="vipCenter"><a href="javascript:void(0)" class="vipbg" style="padding-right:25px;">我的郎中行</a><span>|</span>
                <ul class="subVip">
                    <li><a href="<%=basePath %>api/keHuPc/personCenter.do">我的订单 ></a></li>
                    <li><a href="<%=basePath %>api/keHuPc/personInformation.do">个人资料 ></a></li>
                    <li><a href="<%=basePath %>api/keHuPc/personCenter1.do">会员中心 ></a></li>
                    <c:if test="${shanghuUser.identity!=null && shanghuUser.identity!='' }">
                    	<li><a href="<%=basePath %>api/keHuPc/toMyService.do">我的服务 ></a></li>
                    </c:if>
                    <c:if test="${kehuUser!=null }">
                    	<li><a href="<%=basePath %>api/keHuPc/myXuQiuList.do">我的需求 ></a></li>
                    </c:if>
                </ul>
            </li>
            <%--<li><a href="javascript:void(0)">关于我们</a><span>|</span></li>
            <li><a href="javascript:void(0)">联系我们</a><span>|</span></li>--%>
            <li class="phone_ban" style="position: relative;">
            	<a href="javascript:void(0)" id="shouji">手机版</a>
            	<div class="erm" style="display: none;">
                    <div class="erm_lg">
                        <img src="static/images/zyw/langzhonghang-apk.jpg" style="width: 200px;height: 200px;"/>
                    </div>
                    <p style="margin-top: -20px;margin-left: 7px;">打开QQ扫一扫,扫描二维码即可下载</p>
                </div>
            </li>
        </ul>
    </div>
</header>
<rong-widget id="zjh" style="position: fixed;left: 0;bottom: 0;z-index: 99999999999;"></rong-widget>
<script src="static/js/zyw/jquery.SuperSlide.2.1.1.js"></script>
<script>
$(function(){
	
	//登陆、注册、找回密码等页面不显示聊天界面
	var title=document.title;
	if(title=="登录" || title=="注册" || title=="找回密码"){
		$("#zjh").css("display","none");
	}//end
	
	//鼠标聚焦显示二维码
    $(".phone_ban").hover(function(){
        if($(this).hasClass("hhh")){
            $(this).removeClass("hhh");
            $(this).children("a").css("color","#7f7f7f");
            $(".erm").hide();
        }else{
            $(this).addClass("hhh");
            $(".erm").show();
            $(this).children("a").css("color","#38c4ff");
        }
    });//end
});
</script>
</body>
</html>