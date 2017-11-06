<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link rel="stylesheet" href="static/css/zyw/jiuzhenXiangQ.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>我的订单</title>
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
        .yiwanchegn {
		    display: block;
		    width: 97px;
		    height: 46px;
		    text-align: center;
		    line-height: 46px;
		    border: 1px solid #e5e5e5;
		    margin-left: 10px;
		    float: left;
		    color: #000;
		}
    </style>
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
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchJiGouList.do">找机构</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYaoShangList.do">找药商</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div style="border-top: 1px solid #38c4ff;"></div>
<div class="jiuzhenBack">
        <div class="jiuzhenBox">
            <p class="jiuzhenTop">您的位置 > 首页 > <span>我的订单</span></p>
            <div class="jiuzhenMain">
                <div class="main01">
                    <img src="static/images/zyw/clean_03.png" alt=""/>
                    <p style="width: 80%;"><span style="color:#38c4ff">${pd.realName }</span><span class="fenge">|</span><span>${pd.sex }</span><span class="fenge">|</span><span style="color:#38c4ff">${pd.age }岁</span><span class="fenge">|</span><span>${pd.address }</span></p>
                    <p class="telNum">${pd.phone }</p>
                    <a href="<%=basePath %>api/keHuPc/personInformation.do">编辑</a>
                </div>
                <div class="main02">
                    <p class="pmain">
                    	<a href="javascript:void(0)" class="sure" id="daizhixing" tid="2">待执行</a>
                    	<a href="javascript:void(0)" id="yiwancheng" tid="1">已完成</a>
                    </p>
                    <div class="xuanBox">
                        <div class="show">
                        	<%-- 待执行 --%>
                        	<c:if test="${order_state=='2' }">
                        		<c:forEach items="${yishengOrderList }" var="yisheng">
                        		<div class="colmain">
	                                <p><span>${yisheng.youName }</span><span>${yisheng.mark }</span><span>${yisheng.fuwu_jibing_name }</span><span>${yisheng.kehuPrice }元</span></p>
	                                <%--<a href="javascript:void(0)" tid="${yisheng.order_yisheng_id }">取消</a>--%>
	                                <a href="javascript:void(0)" class="sure" tid="${yisheng.order_yisheng_id },${yisheng.user_shanghu_fid },${yisheng.price },1">已就诊</a>
	                            </div>
	                        	</c:forEach>
	                        	<c:forEach items="${jigouOrderList }" var="jigou">
	                        		<div class="colmain">
		                                <p><span>${jigou.youName }</span><span>${jigou.mark }</span><span>${jigou.fuwu_name }</span><span>${jigou.kehuPrice }元</span></p>
		                                <%--<a href="javascript:void(0)" tid="${jigou.order_yisheng_id }">取消</a>--%>
		                                <a href="javascript:void(0)" class="sure" tid="${jigou.order_jigou_id },${jigou.user_shanghu_fid },${jigou.price },2">已就诊</a>
		                            </div>
	                        	</c:forEach>
	                        	<c:forEach items="${yaoshangOrderList }" var="yaoshang">
	                        		<div class="colmain">
		                                <p><span>${yaoshang.youName }</span><span>${yaoshang.mark }</span><span>${yaoshang.fuwu_name }</span><span>${yaoshang.kehuPrice }元</span></p>
		                                <%--<a href="javascript:void(0)" tid="${yaoshang.order_yisheng_id }">取消</a>--%>
		                                <a href="javascript:void(0)" class="sure" tid="${yaoshang.order_yaoshang_id },${yaoshang.user_shanghu_fid },${yaoshang.price },3">已就诊</a>
		                            </div>
	                        	</c:forEach>
                        	</c:if>
                        	<%-- 已完成 --%>
                        	<c:if test="${order_state=='1' }">
                        		<c:forEach items="${yishengOrderList }" var="yisheng">
                        		<div class="colmain">
	                                <p><span>${yisheng.youName }</span><span>${yisheng.mark }</span><span>${yisheng.fuwu_jibing_name }</span><span>${yisheng.kehuPrice }元</span></p>
	                                <span class="yiwanchegn" href="javascript:void(0)">已完成</span>
	                            </div>
	                        	</c:forEach>
	                        	<c:forEach items="${jigouOrderList }" var="jigou">
	                        		<div class="colmain">
		                                <p><span>${jigou.youName }</span><span>${jigou.mark }</span><span>${jigou.fuwu_name }</span><span>${jigou.kehuPrice }元</span></p>
		                                <span class="yiwanchegn" href="javascript:void(0)">已完成</span>
		                            </div>
	                        	</c:forEach>
	                        	<c:forEach items="${yaoshangOrderList }" var="yaoshang">
	                        		<div class="colmain">
		                                <p><span>${yaoshang.youName }</span><span>${yaoshang.mark }</span><span>${yaoshang.fuwu_name }</span><span>${yaoshang.kehuPrice }元</span></p>
		                                <span class="yiwanchegn" href="javascript:void(0)">已完成</span>
		                            </div>
	                        	</c:forEach>
                        	</c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="cancelBox" style="top:35%">
    <p>确认执行已就诊吗？</p>
    <p><a href="javascript:void(0)" class="cuol" style="border-right: 1px solid #e5e5e5;">点错了</a><a href="javascript:void(0)" class="yes">确认</a></p>
</div>
<div class="mask"></div>
</body>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script>
	$(function(){
		var state="${order_state}";
		if(state=="2"){
			$("#daizhixing").addClass("sure").siblings().removeClass("sure");
		}else{
			$("#yiwancheng").addClass("sure").siblings().removeClass("sure");
		}
	});
	
    $('.pmain>a').click(function(){
        $(this).addClass("sure");
        $(this).siblings().removeClass("sure");
        var order_state=$(this).attr("tid");
        window.location.href='api/keHuPc/personCenter.do?order_state='+order_state;
    });
    $(".show>.colmain>a").click(function(){
    	 var canshu=$(this).attr("tid");
    	 
    	 $(".cancelBox").css("display","block");
         $(".cuol").click(function(){
             $(".cancelBox").css("display","none");
         });
         $(".yes").click(function(){
             $(".cancelBox").css("display","none");
           	 //已就诊
           	 var mycars=new Array();
           	 mycars=canshu.split(",");
           	 //alert(mycars)
           	 location.href='api/keHuPc/yiJiuZhen.do?order_id='+mycars[0]+'&user_shanghu_id='+mycars[1]+'&price='+mycars[2]+'&type='+mycars[3];
         });
    });
</script>
</html>