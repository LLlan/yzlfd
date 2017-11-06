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
    <link rel="stylesheet" href="static/css/zyw/jigou_home.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>机构主页</title>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<jsp:include page="../top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
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
            <li class="fl"><a class="hover" href="<%=basePath %>api/keHuPc/searchJiGouList.do">找机构</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYaoShangList.do">找药商</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div style="border-top: 1px solid #38c4ff;"></div>
<!--机构介绍-->
<div class="yisheng">
    <div class="location">
        你的位置&gt;<span>首页</span>&gt;<span>找机构</span>&gt;<span class="xuwei">${xqData.youName }</span>
    </div>
    <div class="ys_conter">
        <div class="ys_lf">
            <div class="ys_img"><img src="static/images/zyw/yisheng1.png" alt=""/></div>
            <p>医&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;院：<span class="xuwei">${xqData.youName }</span></p>
            <p>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型：<span class="xuwei">${xqData.dengji }</span></p>
            <p>个人成就：<span>帮助过<span class="num">${xqData.num }</span>人</span></p>
            <p>经营范围：<span>${xqData.goodField }</span></p>
            <p>就医地址：<span>${xqData.address }</span></p>
            <p><button class="btn6" ng-click="setconversation('${xqData.user_shanghu_id}')">立即咨询</button></p>
        </div>
    </div>
</div>
<!--机构详情介绍-->
<div class="detail_info">
    <div class="expert">
        <div class="expert_top">
            <i></i>
            机构简介
        </div>
        <div class="expert_bottom">
            <p>${xqData.introduct }</p>
        </div>
    </div>
    <div class="service">
        <div class="service_top">
            <i></i>
            服务项目
            <span>(<b>${fuwuList.size() }</b>)</span>
        </div>
        <div class="expert_bottom">
            <ul>
            	<c:forEach items="${fuwuList }" var="list" varStatus="vars">
            		<li>
	                    <div class="xiadan">服务项目<span>${vars.index+1 }</span></div>
	                    <div class="item_info">
	                        <p>${list.fuwu_jibing_name }</p>
	                        <p class="price">${list.price }<span>元</span></p>
	                        <div class="pro_detail">
	                            <b>产品详情：</b>${list.jibing_introdaction }
	                        </div>
	                    </div>
	                    <a onclick="toCreateOrder('${list.fuwu_id }');" class="m_order" target="_blank">
	                        <button class="btn5">立即下单</button>
	                    </a>
	                </li>
            	</c:forEach>
            </ul>
        </div>
    </div>
    <div class="Case">
        <div class="case_top">
            <i></i>
            案例展示
            <span>(<b>${anliList.size() }</b>)</span>
        </div>
        <c:forEach items="${anliList }" var="list">
        	<div class="case_bottom">
	            <p>${list.title }</p>
	            <p>${list.detailContent }</p>
	            <p>发布日期<span>${list.addTime }</span></p>
	        </div>
        </c:forEach>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script>
	function toCreateOrder(id){
		$.post('api/keHuPc/InforPerfectIsOrNo.do',{},function(date){
			if(date.respCode=="01"){
				window.location.href='api/keHuPc/toCreateOrder.do?fuwu_id='+id;
			}else if(date.respCode=="02"){
				window.open("api/keHuPc/toLogin.do");
			}else{
				layer.alert("您的信息还未完善,无法下单,点击去完善信息!",{
		            title:"提示"//提示标题，默认为：信息
		            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
		            ,anim: 0 //动画类型0-6，默认为：0
		            ,closeBtn: 0//是否显示关闭按钮，0-不显示，1-显示，默认为1
		            ,btn: ['退出','去完善'] //按钮
		            ,icon: 5    // icon
		            ,yes:function(){
		            	layer.closeAll();
		            }
		            ,btn2:function(){
		            	window.open("api/keHuPc/personInformation.do");
		            }
				});
			}
		});
	}
</script>
</body>
</html>