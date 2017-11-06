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
    <title>我的订单</title>
    <link rel="stylesheet" href="static/css/zyw/common.css"/>
    <link rel="stylesheet" href="static/css/zyw/toubu.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/myOrder.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <style>
        .bg_xuqiu{
            width: 100%;
            overflow: hidden;
            border-top: 1px solid #38C4FF;
        }
    </style>

</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<jsp:include page="../top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<!--导航栏-->
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
<div class="bg_xuqiu">
    <div class="orderBack">
        <div class="orderBox">
            <div class="orderTop">您的位置 > <span>会员中心</span> > <span>我的订单</span></div>
            <div class="orderMainA">
                <p class="pMainA"><a href="javascript:void(0)" class="sure" tid="2">待执行</a><a href="javascript:void(0)" tid="1">已完成</a></p>
                <div class="xuanBox">
                    <div class="show">
                    	<%-- 
                        <div class="headerXuan"><span>患者资料</span><span>患者电话</span><span>服务项目</span><span>价格</span></div>
                        --%>
                        <input type="hidden" id="identity" value="${identity }">
                        <c:forEach items="${orderList }" var="va">
                        	<div class="colmain" style="margin-top:20px;">
	                            <p>
	                            <span class="spn1">
	                                <img src="static/images/zyw/u132.png" alt=""/>
	                                <span>${va.realName }</span>
	                                <span>${va.sex }</span>
	                                <span>|</span>
	                                <span>${va.age }岁</span>
	                                <span>|</span>
	                                <span>${va.address }</span>
	                            </span>
	                                <span>${va.phone }</span>
	                                <span>${va.fuwu_name }</span>
	                                <span>${va.price }元</span>
	                            </p>
	                            <a href="javascript:void(0)">待执行</a>
	                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="cancelBox" style="top: 30%;">
        <p>确认执行已就诊操作吗？</p>
        <p>
        	<a href="javascript:void(0)" class="cuol" style="border-right: 1px solid #e5e5e5;">点错了</a>
        	<a href="javascript:void(0)" class="yes">确认</a>
        </p>
    </div>
    <div class="mask"></div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
</body>
<script src="static/js/zyw/jquery-2.1.4.js"></script>
<script type="text/javascript">
    $('.pMainA>a').click(function(){
       // $('.xuanBox').children().eq($(this).index()).attr('class','show').siblings().attr('class','hide');
        if(!$(this).hasClass("sure")){
        	$(this).addClass("sure");
            $(this).siblings().removeClass("sure");
        	//console.log($(this).attr("tid"));
        	var order_state=$(this).attr("tid");
        	$.post('api/shangHu/personMyOrderYesOrNo.do',{order_state:order_state},function(data){
        		
        		var str='';
        		var list=data.list;
        		$.each(list,function(){
        			str+='<div class="colmain" style="margin-top:20px;">';
        			str+='<p>';
        			str+='<span class="spn1">';
        			str+='<img src="static/images/zyw/u132.png" alt=""/>';
        			str+='<span>'+this.realName+'</span>';
        			str+='<span>'+this.sex+'</span>';
        			str+='<span>|</span>';
        			str+='<span>'+this.age+'岁</span>';
        			str+='<span>|</span>';
        			str+='<span>'+this.address+'</span>';
        			str+='</span>';
        			str+='<span>'+this.phone+'</span>';
        			str+='<span>'+this.fuwu_name+'</span>';
        			str+='<span>'+this.price+'元</span>';
        			str+='</p>';
        			if(order_state=="2"){
        				//str+="<a href='javascript:void(0)' onclick='qryjz(this,\""+this.order_id+"\")'>已就诊</a>";
        				str+="<a href='javascript:void(0)'>待执行</a>";
        			}else{
        				str+='<a href="javascript:void(0)">已完成</a>';
        			}
        			str+='</div>';
        			str+='';
        		});
        		$(".show").html(str);
        		$("#identity").html(data.identity);
        	});
        }
    });
    function qryjz(obj,order_id){
    	$(obj).addClass("sure");
        $(".mask").css("display","block");
        $(".cancelBox").css("display","block");
        $(".cuol").click(function(){
            $(".cancelBox").css("display","none");
            $(".mask").css("display","none");
            $(obj).removeClass("sure");
        });
        $(".yes").click(function(){
            $(".cancelBox").css("display","none");
            $(".mask").css("display","none");
            $(obj).removeClass("sure");
        });
    }
</script>
</html>