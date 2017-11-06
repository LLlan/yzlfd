<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/zyw/common.css"/>
    <link rel="stylesheet" href="static/css/zyw/toubu.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/lijiXiadan.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>支付成功</title>
    <style>
        .show{
            display: block;
        }
        .hide{
            display: none;
        }
        .colmain>.sure{
            background-color:#38c4ff;color:#fff;border:1px solid #38c4ff;
        }
        .logo {
            width: 100%;
            margin-bottom: 30px;
        }
        .logoBox {
            width: 1160px;
            height: 80px;
            line-height: 80px;
            margin: 0 auto;
            padding-top: 20px;
            position: relative;
        }
        .red1{
            background:#fff url(static/images/zyw/arrow02.png) 60px center no-repeat;background-size:16px 14px;
            border:1px solid #c1c1c1;border-bottom:none;
        }
        .red2{
            color:#38c4ff;border-bottom:2px solid #38c4ff;
        }
        .show{
            display: block;
        }
        .address {
            font-size: 14px;
        }
        a {
            text-decoration: none;
            color: #7f7f7f;
        }
    </style>
</head>
<body>
<header>
    <div class="header">
        <p>您好!欢迎来到找医网!</p>
        <ul>
        	<c:choose>
        		<c:when test="${topPd.userName=='' || topPd.userName==null }">
        			<li class="denglu"><a href="<%=basePath %>api/keHuPc/toLogin.do">登录</a><span>|</span></li>
            		<li class="zhuce"><a href="<%=basePath %>api/keHuPc/toRegister.do">注册</a><span>|</span></li>
        		</c:when>
        		<c:otherwise>
        			<li class="tuichu"><a href="<%=basePath %>api/keHuPc/tuichu.do">退出</a></li>
		            <li style="color:#38c4ff;margin-right:10px;" class="xingming" onclick="window.location.href='api/keHuPc/personCenter.do'">${topPd.userName }</li>
		            <li style="color:#fea01a;padding-left:15px;margin-right:10px;background:url(static/images/zyw/jifen.png) left no-repeat;background-size:12px 12px;" class="jifen">${topPd.jifen }分</li>
		            <li style="padding:0 10px;" class="guquan">股权
		                <div>每股<span>${topPd.guquan }</span>元</div>
		            </li>
		            <li style="padding:0 10px;" class="xunibi">虚拟币
		                <div>￥<span>${topPd.xunibi }</span></div>
		            </li>
        		</c:otherwise>
        	</c:choose>
            <li class="vipCenter"><a href="javascript:void(0)" class="vipbg" style="padding-right:25px;">会员中心</a><span>|</span>
                <ul class="subVip">
                    <li><a href="<%=basePath %>api/keHuPc/personCenter.do">个人中心 ></a></li>
                    <li><a href="javascript:void(0)">申请开店 ></a></li>
                    <li><a href="javascript:void(0)">我的订单 ></a></li>
                    <li><a href="javascript:void(0)">我的服务 ></a></li>
                    <li><a href="javascript:void(0)">成交记录 ></a></li>
                    <li><a href="javascript:void(0)">现金金额 ></a></li>
                </ul>
            </li>
            <li><a href="javascript:void(0)">关于我们</a><span>|</span></li>
            <li><a href="javascript:void(0)">联系我们</a><span>|</span></li>
            <li><a href="javascript:void(0)">手机版</a></li>
        </ul>
    </div>
</header>
<div class="logo">
    <div class="logoBox">
        <a href="<%=basePath %>api/keHuPc/index.do"><img src="static/images/zyw/logo.jpg" alt="" width="181px" height="60px"/></a>
        <a class="address">
            <span>|</span>全国
        </a>
        <div class="addressBox">
            <p>猜你可能在 <span>海口</span></p>
            <div class="city">
                <ul>
                    <li><a href="javascript:void(0)" class="red2">热门城市</a></li>
                    <li><a href="javascript:void(0)">ABCDEF</a></li>
                    <li><a href="javascript:void(0)">GHIJK</a></li>
                    <li><a href="javascript:void(0)">LMNO</a></li>
                    <li><a href="javascript:void(0)">PQRST</a></li>
                    <li><a href="javascript:void(0)">UVWXYZ</a></li>
                </ul>
                <div class="city01">
                    <p style="display:block;"><a href="javascript:void(0)">全国1</a><a href="javascript:void(0)">北京</a><a href="javascript:void(0)">上海</a><a href="javascript:void(0)">广州</a><a href="javascript:void(0)">成都</a><a href="javascript:void(0)">深圳</a><a href="javascript:void(0)">杭州</a><a href="javascript:void(0)">重庆</a><a href="javascript:void(0)">武汉</a><a href="javascript:void(0)">郑州</a><a href="javascript:void(0)">西安</a><a href="javascript:void(0)">南京</a></p>
                    <p style="display:none;"><a href="javascript:void(0)">全国2</a><a href="javascript:void(0)">北京</a><a href="javascript:void(0)">上海</a><a href="javascript:void(0)">广州</a><a href="javascript:void(0)">成都</a><a href="javascript:void(0)">深圳</a><a href="javascript:void(0)">杭州</a><a href="javascript:void(0)">重庆</a><a href="javascript:void(0)">武汉</a><a href="javascript:void(0)">郑州</a><a href="javascript:void(0)">西安</a><a href="javascript:void(0)">南京</a></p>
                    <p style="display:none;"><a href="javascript:void(0)">全国3</a><a href="javascript:void(0)">北京</a><a href="javascript:void(0)">上海</a><a href="javascript:void(0)">广州</a><a href="javascript:void(0)">成都</a><a href="javascript:void(0)">深圳</a><a href="javascript:void(0)">杭州</a><a href="javascript:void(0)">重庆</a><a href="javascript:void(0)">武汉</a><a href="javascript:void(0)">郑州</a><a href="javascript:void(0)">西安</a><a href="javascript:void(0)">南京</a></p>
                    <p style="display:none;"><a href="javascript:void(0)">全国4</a><a href="javascript:void(0)">北京</a><a href="javascript:void(0)">上海</a><a href="javascript:void(0)">广州</a><a href="javascript:void(0)">成都</a><a href="javascript:void(0)">深圳</a><a href="javascript:void(0)">杭州</a><a href="javascript:void(0)">重庆</a><a href="javascript:void(0)">武汉</a><a href="javascript:void(0)">郑州</a><a href="javascript:void(0)">西安</a><a href="javascript:void(0)">南京</a></p>
                    <p style="display:none;"><a href="javascript:void(0)">全国5</a><a href="javascript:void(0)">北京</a><a href="javascript:void(0)">上海</a><a href="javascript:void(0)">广州</a><a href="javascript:void(0)">成都</a><a href="javascript:void(0)">深圳</a><a href="javascript:void(0)">杭州</a><a href="javascript:void(0)">重庆</a><a href="javascript:void(0)">武汉</a><a href="javascript:void(0)">郑州</a><a href="javascript:void(0)">西安</a><a href="javascript:void(0)">南京</a></p>
                    <p style="display:none;"><a href="javascript:void(0)">全国6</a><a href="javascript:void(0)">北京</a><a href="javascript:void(0)">上海</a><a href="javascript:void(0)">广州</a><a href="javascript:void(0)">成都</a><a href="javascript:void(0)">深圳</a><a href="javascript:void(0)">杭州</a><a href="javascript:void(0)">重庆</a><a href="javascript:void(0)">武汉</a><a href="javascript:void(0)">郑州</a><a href="javascript:void(0)">西安</a><a href="javascript:void(0)">南京</a></p>
                </div>
            </div>
        </div>
        <div class="searchBox">
            <input type="text" placeholder="大家正在搜索：腰间盘突出治疗"/><input type="button" value="搜索"/>
        </div>
        <a href="<%=basePath %>api/keHuPc/toAddFaBuXuQiu.do" class="fabu">发布需求</a>
    </div>
</div>
<!--头部-->
<div class="seem">
    <div class="sidbar fl">
        <div class="all clearfix">
            <a href="<%=basePath %>api/keHuPc/index.do"><b>所有分类</b></a>
        </div>
    </div>
    <div class="navmain fl">
        <ul>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/index.do">首页</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYiShengList.do">找医生</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchJiGouList.do">找机构</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYaoShangList.do">找药商</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div class="xiadanBack">
    <div class="xiadanBox">
        <div class="xiadanTop">您的位置 > 首页 > <span>支付成功</span></div>
        <%--<div class="xiadanMain01" style="height: 110px;">
            <div class="colOne">
                <span>收货人信息</span>
                <p><span>陈欣怡</span><span>13878656543</span><span>龙昆北路18号幸福大厦B座快乐大本营</span></p>
            </div>
            <div class="colTwo">
                <span>产品信息</span>
                <p><span>${tempfuwu.fuwu_jibing_name }</span><span>${tempfuwu.jibing_introdaction }</span><span>上海市灵昆北路120号华山医院</span></p>
            </div>
        </div>--%>
    </div>
</div>
</body>
<!--底部-->
<footer>
    <div class="footer1Box">
        <div class="footer1">
            <div>
                <ul>
                    <li><a href="javascript:void(0)">友情链接</a></li>
                    <li><a href="javascript:void(0)">找法务</a></li>
                    <li><a href="javascript:void(0)">养老院</a></li>
                </ul>
                <ul style="margin-top:10px;">
                    <li><a href="javascript:void(0)" style="padding:0;">联系我们</a></li>
                    <li><a href="javascript:void(0)">QQ：${bottomPd.koukou }</a></li>
                    <li><a href="javascript:void(0)">微信：${bottomPd.weixin }</a></li>
                    <li><a href="javascript:void(0)">公众号：${bottomPd.weixinpublic }</a></li>
                    <li><a href="javascript:void(0)">邮箱：${bottomPd.email }</a></li>
                    <li><a href="javascript:void(0)">电话：${bottomPd.tel_phone }</a></li>
                </ul>
            </div>
            <a href="javascript:void(0)" class="clean" title="扫一扫"><img src="static/images/zyw/clean_03.png" alt="扫一扫"/></a>
        </div>
    </div>
    <div class="footer2Box">
        <div class="footer2">
            <p>Copyright &copy; 2011120健康网 &nbsp;&nbsp;&nbsp;粤ICP备13009187号-3</p>
        </div>
    </div>
</footer>
<script>
    $(function(){
        $(".header li").click(function(){
            $(this).children("a").css("color","#38c4ff");
            $(this).siblings().children("a").css("color","#7f7f7f");
        });
        $(".address").click(function(){
            if($(this).hasClass("red1")){
                $(this).removeClass("red1");
                $(this).children("span").css("color","#000");
                $(".addressBox").css("display","none");
            }else{
                $(this).addClass("red1");
                $(this).children("span").css("color","#fff");
                $(".addressBox").css("display","block");
            }
        });
        $(".city>ul>li").click(function(){
            $(this).children("a").addClass("red2");
            $(this).siblings().children("a").removeClass("red2");
            var check=$(this).index();
            $(".city01").children("p").eq(check).css("display","block");
            $(".city01").children("p").eq(check).siblings().css("display","none");
        });
        $(".city01>p>a").click(function(){
            $(this).css("color","#38c4ff");
            $(this).siblings().css("color","#000");
            $(".address").text($(this).html());
            $(".address").css("text-align","center");
        })
    });

</script>
</html>