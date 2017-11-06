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
    <link rel="stylesheet" href="static/css/zyw/page.css"/>
    <link rel="stylesheet" href="static/css/zyw/xuqiu.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <script src="static/js/zyw/page.js"></script>
    <script src="static/js/zyw/jquery.SuperSlide.2.1.1.js"></script>
    <title>需求大厅</title>
    <style>
        .doctor_detail>div.txt-center{
            width: 500px;
            height: 50px;
            margin: 10px auto;
        }
        .btn11,.btn12{
        	float:right;
        	width:80px;
        	height:30px;
        	line-height:30px;
        	text-align:center;
        	border-radius:5px;
        	margin-right:10px;
        	margin-top: 5px;
        	color:#333;
        	cursor: pointer;
        	border:1px solid #ddd;
        }
        #address {
		    color: #333;
		    width: 197px;
		    margin: 0 5px;
		    display: inline-block;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    white-space: nowrap;
		    position: absolute;
		    margin-top: 13px;
		}
		.doctor_detail .xuqiu li .gr_info {
		    width: 100%;
		    height: 50px;
		       line-height: 1;
		    border-bottom: 1px dotted #ddd;
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
            <li class="fl"><a class="hover" href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div style="border-top: 1px solid #38c4ff;"></div>
<div id="xuqiu">
    <div class="location">
        你的位置&gt;<span>首页</span>&gt;<span class="xuwei">需求大厅</span>
    </div>
    <div class="doctor_detail " style="overflow: hidden;" >
        <ul class="xuqiu" style="overflow: hidden;">
        	<c:forEach items="${xuQiuDaTingList }" var="list">
        		<li>
	                <div class="gr_info">
	                    <div class="img4"><img src="static/images/zyw/yisheng1.png" alt=""/></div>
	                    <span>${list.sex }</span>|
	                    <span>${list.age }岁</span>|
	                    <span style="color: #38C4FF;">${list.phone }</span>|
	                    <span id="address" title="${list.address }">${list.address }</span>
						<%--<button class="btn11" onclick="window.location.href='api/keHuPc/deleteXuQiu.do?xuqiu_id=${list.xuqiu_id }'">删除</button>
						<button class="btn12" onclick="window.location.href='api/keHuPc/toEditeFaBuXuQiu.do?xuqiu_id=${list.xuqiu_id }'">编辑</button>--%>
	                </div>
	                <div class="detail_info">
	                    <div class="jb_detial">
	                        <span>${list.disease }</span>
	                        <span>${list.fabu_time }</span>
	                    </div>
	                    <p class="jb_content">${list.symptom }</p>
	                    <ul class="pic_deatil" style="margin-left: 3%;">
	                    	<c:forEach items="${list.imgPathList }" var="list1" end="5">
	                    		<li style="width: 80px;margin-right: 1%;">
	                    		<c:if test="${list1.imgPath!='' }">
	                    			<img src="<%=basePath %>${list1.imgPath }" alt="" width="80px" height="80px"/></li>
	                    		</c:if>
	                    	</c:forEach>
	                    </ul>
	                </div>
	            </li>
        	</c:forEach>
        </ul>
       
	    <form action="<%=basePath %>api/keHuPc/xuQiuDaTing.do" method="post" id="pageForm">
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
	 	<%-- 分页end --%>
    </div>
     <%-- 分页start --%>        
	    <div class="txt-center">
	        <ul class="page" maxshowpageitem="5" pagelistcount="10"  id="page"></ul><%-- pagelistcount每页显示的信息条数 --%>
	    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
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