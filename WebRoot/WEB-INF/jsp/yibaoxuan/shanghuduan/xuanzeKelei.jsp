<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/zhaoyiwang/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <title>科类选择</title>
    <style>
        body{
            background-color:#f5f5f5;
        }
        .xuanz{
            background-color: #fff;
        }
        .show{
            display: block;
        }
        .hide{
            display: none;;
        }
        .right {
		    position: absolute;
		    top: 0;
		    left: 21%;
		    background-color: #fff;
		    width: 59%;
		    padding-left: 10%;
		    z-index: 100;
		}
		
		.left {
		    position: fixed;
		    left: 0;
		    top: 51px;
		    width: 21%;
		    overflow-y: auto;
		}
		.mainBox01 {
		    width: 100%;
		    position: relative;
		    top: 51px;
		    left: 0;
		}
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a><span style="position:relative;top:-24px;left:35px;color:#fff;font-size: 16px;">返回</span></div>
    <div class="wy-header-title">科类选择</div>
</div>
<!--头部结束-->
<!--主体开始-->
<!-- <div class="searchBox" style="border-bottom: 1px solid #dedede;position: fixed;left:0;top:0;z-index: 99;">
    <div class="searchBlock">
        <form action="">
            <input type="text" placeholder="请输入关键词" class="keyWords"/>
            <input type="button" value="搜索" class="searchBtn"/>
        </form>
    </div>
</div> -->
<!-- <div class="bor10"></div> -->
<div class="mainBox01">
    <ul class="left" style="width: 40%;margin-left: -33px;">
    <c:if test="${not empty listtop}">
    	<c:forEach items="${listtop }" var="list" end="0">
    		<li class="xuanz" title="${list.kelei_id }"><a href="javascript:void(0)">${list.keleiName }</a><span>></span></li>
    	</c:forEach>
    	<c:if test="${listtop.size()>0 }">
	    	<c:forEach items="${listtop }" var="list" begin="1">
	    		<li title="${list.kelei_id }"><a href="javascript:void(0)">${list.keleiName }</a><span>></span></li>
	    	</c:forEach>
    	</c:if>
    </c:if>
    </ul>
   <div class="right" id="right" style="left:31%">
        <ul class="show">
        	<c:forEach items="${listchild }" var="list">
        		<li onclick="jiBingName('${list.keleiName }')">${list.keleiName }</li>
        	</c:forEach>
        </ul>
    </div>
</div>
<form action="api/shangHu/toSettingPersonInformation.do" id="myForm" method="post">
	<input type="hidden" value="" id="keshiName" name="keshiName">
</form>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
    $(function(){
        $(".left>li").click(function(){
       
            $(this).addClass("xuanz");
            $(this).siblings().removeClass("xuanz");
            $(".right").children().eq($(this).index()).addClass("show");
            $(".right").children().eq($(this).index()).removeClass("hide");
            $.post('api/shangHu/getKeLeiListByParentId.do',{parent_id:$(this).attr("title")},function(data){
            	var str='';
            	str+='<ul class="show">';
            	$.each(data.list,function(i,j){
            		str+='<li onclick="jiBingName(\''+j.keleiName+'\')">'+j.keleiName+'</li>';
            	});
            	str+='</ul>';
            	$("#right").html(str);
            });
        });
    });
    function jiBingName(name){
    	$("#keshiName").val(name);
    	$("#myForm").submit();
    }
    $(function(){
			$(".mainBox01").height($(window).height()-50);		
			$(".left").height($(window).height()-50);
	});
		
</script>
</body>
</html>