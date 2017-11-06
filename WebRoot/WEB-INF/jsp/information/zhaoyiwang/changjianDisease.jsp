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
    <title>常见疾病更多</title>
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
		    top: -75px;
		    left: 21%;
		    background-color: #fff;
		    width: 79%;
		    padding-left: 17px;
		    z-index: -1;
		}
		
		.left {
		    position: fixed;
		    left: 0;
		    top: 51px;
		    width: 21%;
		    overflow-y: auto;
		}
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a><span style="position:relative;top:-24px;left:35px;color:#fff;font-size: 16px;">返回</span></div>
    <div class="wy-header-title">常见疾病</div>
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
    <ul class="left" style="height: 520px;">
        <li class="xuanz"><a href="javascript:void(0)">A</a><span>></span></li>
        <li><a href="javascript:void(0)">B</a><span>></span></li>
        <li><a href="javascript:void(0)">C</a><span>></span></li>
        <li><a href="javascript:void(0)">D</a><span>></span></li>
        <li><a href="javascript:void(0)">E</a><span>></span></li>
        <li><a href="javascript:void(0)">F</a><span>></span></li>
        <li><a href="javascript:void(0)">G</a><span>></span></li>
        <li><a href="javascript:void(0)">H</a><span>></span></li>
        <li><a href="javascript:void(0)">I</a><span>></span></li>
        <li><a href="javascript:void(0)">J</a><span>></span></li>
        <li><a href="javascript:void(0)">K</a><span>></span></li>
        <li><a href="javascript:void(0)">L</a><span>></span></li>
        <li><a href="javascript:void(0)">M</a><span>></span></li>
        <li><a href="javascript:void(0)">N</a><span>></span></li>
        <li><a href="javascript:void(0)">O</a><span>></span></li>
        <li><a href="javascript:void(0)">P</a><span>></span></li>
        <li><a href="javascript:void(0)">Q</a><span>></span></li>
        <li><a href="javascript:void(0)">R</a><span>></span></li>
        <li><a href="javascript:void(0)">S</a><span>></span></li>
        <li><a href="javascript:void(0)">T</a><span>></span></li>
        <li><a href="javascript:void(0)">U</a><span>></span></li>
        <li><a href="javascript:void(0)">V</a><span>></span></li>
        <li><a href="javascript:void(0)">W</a><span>></span></li>
        <li><a href="javascript:void(0)">X</a><span>></span></li>
        <li><a href="javascript:void(0)">Y</a><span>></span></li>
        <li><a href="javascript:void(0)">Z</a><span>></span></li>
    </ul>
   <div class="right" id="right">
        <ul class="show">
        	<c:forEach items="${list }" var="list">
        		<li onclick="jiBingName('${list.jibing_name }')">${list.jibing_name }</li>
        	</c:forEach>
        </ul>
    </div>
</div>
<form action="api/shangHu/backToPersonMyServiceAdd.do" id="myForm" method="post">
	<input type="hidden" value="${fuwu_id }" name="fuwu_id" id="fuwu_id">
	<input type="hidden" value="${mark }" name="mark" id="mark"><%-- 主要是用来判断是添加还是编辑 --%>
	<input type="hidden" value="" id="fuwu_jibing_name" name="fuwu_jibing_name">
	
</form>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
    $(function(){
       $(".left").height($(window).height()-50);
    });
    
     $(".left>li").click(function(){
            $(this).addClass("xuanz");
            $(this).siblings().removeClass("xuanz");
            $(".right").children().eq($(this).index()).addClass("show");
            $(".right").children().eq($(this).index()).removeClass("hide");
            var letter=$(this).find("a").html();
            $.post('api/shangHu/getJiBingListByLetter.do',{letter:letter},function(data){
            	var str='';
            	str+='<ul class="show">';
            	$.each(data.list,function(i,j){
            		str+='<li onclick="jiBingName(\''+j.jibing_name+'\')">'+j.jibing_name+'</li>';
            	});
            	str+='</ul>';
            	$("#right").html(str);
            });
        });
    function jiBingName(name){
    	$("#fuwu_jibing_name").val(name);
    	$("#myForm").submit();
    }
</script>
</body>
</html>