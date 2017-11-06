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
    <link rel="stylesheet" href="static/css/zyw/yinanzazheng.css"/>
    <link rel="stylesheet" href="static/css/zyw/page.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <script src="static/js/zyw/page.js"></script>
    <title>常见疾病</title>
    <style>
        .page{
            overflow: hidden;
        }
        .txt-center{
            width:550px;height:50px;margin:0 auto;
        }
        .doctor_detail>div.txt-center{
            width: 500px;
            height: 50px;
            margin: 10px auto;
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
<div class="yinanzaBack">
    <div class="yinanza">
        <p><span>您的位置</span><span> > </span><span>首页</span><span> > </span><span>常见疾病</span></p>
        <div class="yinansBox">
        	<c:forEach items="${cjjbList }" var="list">
        		<div>
	                <h3>${list.jibing_name }</h3>
	                <div style="width: 86%;margin: 0 auto;max-height: 150px;line-height: 30px;display: -webkit-box;/* -webkit-box-orient: block-axis; *//* -webkit-line-clamp: 5; */overflow: hidden;">
	                	${list.context }
	                </div>
	                <a target="_blank" href="<%=basePath %>api/keHuPc/showCjjbDetail.do?changjianjibing_id=${list.changjianjibing_id }" style="float:right;margin-right: 46px;text-decoration: none;font-size: 12px;color: #fea01a;">[详情]</a>
	                <%--
	                <p>
	                	${list.ynzz_context }
	                	<a href="<%=basePath %>api/keHuPc/showYnzzDetail.do?ynzz_id=${list.ynzz_id }">[详情]</a>
	                </p>
	            	--%>
	            </div>
        	</c:forEach>
        </div>
    </div>
    <div class="txt-center">
        <ul class="page" maxshowpageitem="5" pagelistcount="16"  id="page"></ul>
    </div>
    <form action="<%=basePath %>api/keHuPc/showCjjbMore.do" method="post" id="pageForm">
    	<input type="hidden" name="pageSize" id="pageSize" value=""><%-- 页面显示信息条数 --%>
    	<c:choose>
    		<c:when test="${pd.currentPage=='' || pd.currentPage==null }">
    			<input type="hidden" name="currentPage" id="currentPage" value="1"><%-- 当前页码数 --%>
    		</c:when>
    		<c:otherwise>
    			<input type="hidden" name="currentPage" id="currentPage" value="${pd.currentPage }"><%-- 当前页码数 --%>
    		</c:otherwise>
    	</c:choose>
    </form>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script>
	//分页start
    $(function(){
        function tt(dd){
            //alert(dd);
        }
        var GG = {
            "kk":function(mm){
                // alert(mm);
            }
        };
        $("#page").initPage("${pageCount }",$("#currentPage").val(),GG.kk);//第一个参数代表总的信息数，第二个参数代表着当前页
    });
	function toPage(obj,currentPage){
		if($(obj).attr("class")!="pageItemDisable"){
			if(currentPage!=$("#currentPage").val()){
				$("#currentPage").val(currentPage);
				$("#pageSize").val($("#page").attr("pagelistcount"));
				$("#pageForm").submit();
			}
		}
	}
</script>
</body>
</html>