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
    <link rel="stylesheet" href="static/css/zyw/page.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/index1.css"/>

    <link rel="stylesheet" href="static/css/zyw/my_service.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <script src="static/js/zyw/imgUp1.js"></script>
    <script src="static/js/zyw/page.js"></script>
    <title>我的服务</title>
    <style>
        .img-box {
             margin-top:0;
        }
        .amask {

            background:rgba(0,0,0,.5);
        }
        .amask .mask-content {
            width: 30%;
            margin: 200px auto auto;
            background: white;
            height: 160px;
            text-align: center;
            position: relative;
            border-radius: 10px;
        }
        .ser_add_top .ser_img1 p {
            color: #333;
            font-size: 12px;
            height: 30px;
            line-height: 30px;
        }
        .amask .mask-content .del-p {
            color: #555;
            height: 94px;
            line-height: 94px;
            font-size: 16px;
            border-bottom: 1px solid #ddd;
        }
        .mask-content .check-p span:first-child {
            border-right: 1px solid #ddd;
        }
        .ser_add_top .ser_img1 .check-p{
            height: 60px;
            line-height: 60px;
        }
        .mask-content .check-p span {
            cursor: pointer;
        }
        a {
            text-decoration: none;
            color: #7f7f7f;
        }

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
<!--主体-->
<div class="bg_xuqiu">
    <div class="service">
        <div class="ser_top">
            <span>您的位置 > </span><span>我的服务</span>
        </div>
        <div class="ser_fabu">
            <i></i>
            已发布
            <span>(<b>${serviceList.size() }</b>)</span><a href="<%=basePath %>api/keHuPc/toServiceAdd.do" class="tianjia hhh">发布服务</a>
        </div>
        <ul class="ser_messages">
        	<c:forEach items="${serviceList }" var="va">
        		<li>
	                <div class="ser_img">
	                    <img src="${identity=='1'?va.headImg:va.fwheadImg }" alt=""/>
	                </div>
	                <div class="ser_middle">
	                    <p>${va.fuwu_jibing_name }</p>
	                    <p>产品详情：<span>${va.jibing_introdaction }</span></p>
	                    <p>价格：<span>${va.price }</span>元</p>
	                </div>
	                <div class="ser_rt">
	                    <a class="edit" href="api/keHuPc/toServiceEdit.do?fuwu_id=${va.fuwu_id}">编辑</a>
	                    <a class="delete" href="javascript:void(0);" tid="${va.fuwu_id}">删除</a>
	                </div>
	            </li>
        	</c:forEach>
            <%--
            <div class="txt-center">
                <ul class="page" maxshowpageitem="5" pagelistcount="10"  id="page"></ul>
            </div>
            --%>
        </ul>

        <div class="cancelBox">
            <p>确认取消该项服务吗？</p>
            <p><a href="javascript:void(0)" class="cuol">取消</a><a href="javascript:void(0)" class="yes">确认</a></p>
        </div>
        <div class="mask"></div>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<!--标签页-->
<script>
    $(function(){
        function tt(dd){
            //alert(dd);
        }
        var GG = {
            "kk":function(mm){
                // alert(mm);
            }
        };
        $("#page").initPage(71,1,GG.kk);
    })
</script>
<!--添加服务-->
<script>
    $(function(){
        /*删除*/
        var del
        $(".delete").click(function(){
            del=$(this);
            $(".cancelBox").show();
            $(".mask").show();
            $(".cuol").click(function(){
                $(".cancelBox").hide();
                $(".mask").hide();
            });
            $(".yes").click(function(){
                $.post('api/keHuPc/serviceDelete.do',{fuwu_id:del.attr("tid")},function(data){
                	if(data.respCode=="01"){
                		del.parent().parent().remove();
                        $(".cancelBox").hide();
                        $(".mask").hide();
                	}else{
                		window.location.href="api/keHuPc/tosLogin.do";
                	}
                });
            });
        });
    });
</script>
</body>
</html>