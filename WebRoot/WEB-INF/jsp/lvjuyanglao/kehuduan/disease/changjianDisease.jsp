<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/index.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/font-awesome.css">

    <title>运营模式</title>
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
        .wy-header-icon-back{
            width:120px;
        }
        .wy-header-icon-back>a{
            background: url(static/zhaoyiwang/zywkehuduan/images/dingwei01.png) no-repeat;background-size: 20px;;
        }

        .weui-tabbar__label {
            text-align: center;
            color: #999;
            font-size: 12px;
            line-height: 1.2;
            margin-bottom: 3px;
        }
           .sea-524 {
            width: 100%;
            padding: 10px 5px 10px 5px;
            background-color: #fff;
            margin-top: 50px;
            position: fixed;
            top: 0;
            z-index: 200;
        }
        .mainBox01 {
            width: 100%;
            position: relative;
            top: 127px;
            left: 0;
            /* overflow: hidden; */
            /* height: 600px; */
        }
        .right {
            position: absolute;
            top: 0px;
            left: 21%;
            /* float: left; */
            background-color: #fff;
            width: 79%;
            padding-left: 17px;
            /* z-index: -1; */
        }
        .left{
       		 top:52px;
        }
        .right{
        	top:-75px;
        }
         body{
            background-color:#f5f5f5;
        }
        .travel{
            margin-top: 51px;
            background-color: #fff;
            overflow-y: auto;
        }
        .travel_t li{
            display: block;
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            border-top: 1px solid #ddd;
        }
        .travel_t li a{
            display: block;
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;

        }
        .hover{
            background-color: #38C4FF;
            color: #fff;
        }
        
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<!--<div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a><span style="position:relative;top:-24px;left:35px;color:#fff;font-size: 16px;">返回</span></div>
    <div class="wy-header-title">常见疾病</div>
</div>-->
<div id="header" style="width: 100%;position: fixed;top: 0;left: 0;z-index: 100;background-color: #38c4ff;">
    <h1 class="title">运营模式</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<!--头部结束-->
<!--主体开始-->
<!-- <div class="sea-524">
    <div class="sea_box1030 margin_b3">
        <input id="search" type="button" value="搜索" >
        <input type="text" placeholder="请输入关键词" id="idDoctors" value="">
    </div>
</div> -->

<div class="travel">
    <ul class="travel_t">
	    <c:forEach items="${diseaseList }" var="list">
	    	<li>
	    		<a href="api/ljylkehu/showChangjianjibingDetailByID.do?changjianjibing_id=${list.changjianjibing_id }">${list.jibing_name }</a>
	    	</li>
	    </c:forEach>
	    <li></li>
    </ul>
</div>
<%@ include file="../diLan.jsp"%>
<!--主体结束-->
<script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script type="text/javascript">
$(function(){
    $(".travel").height($(window).height()-60);
    /*点击跳转对应详情页*/
    $(".travel_t li a").click(function(){
        $(this).addClass("hover").parent().siblings().find("a").removeClass("hover");
    });
});

    
     $(".left>li").click(function(){
            $(this).addClass("xuanz");
            $(this).siblings().removeClass("xuanz");
            console.log($(this).find("a").text());
            var url = "api/zywkehu/getDiseaseListByZimu.do";
            $.ajax({
            	url:url,
            	type:'post',
            	data:{zimu:$(this).find("a").text()},
            	dataType:'json',
            	success:function(data){
            		if(data.respCode=="01"){
            		//每次点击清空原来ul下的所有li标签
            			$(".right>ul").empty();
            			for(var i=0;i<data.diseaseList.length;i++){
            				var appendhtml='<li onclick="showDetailByID(this)" tid="'+data.diseaseList[i].changjianjibing_id+'">'+data.diseaseList[i].jibing_name+'</li>';
            				$(".right>ul").append(appendhtml);
            			}
            		}
            		
            	}
            });
           /*  $(".right").children().eq($(this).index()).addClass("show");
            $(".right").children().eq($(this).index()).removeClass("hide");
            $(".right").children().eq($(this).index()).siblings().removeClass("show");
            $(".right").children().eq($(this).index()).siblings().addClass("hide"); */
        })
        
        //点击某个疾病 去看详情
        function showDetailByID(e1){
        	var id = $(e1).attr("tid");
        	location.href='api/zywkehu/showChangjianjibingDetailByID.do?changjianjibing_id='+id; 
        }
        
    
   		 $(function(){
     		abc();
     		//checkSession();
     		//页面加载 默认加载字母A的疾病
     		onloadSelectDisease();
    	 })
     
    	 function abc(e1){
			$("#cjjb").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
		}
		
		function onloadSelectDisease(){
		  var url = "api/zywkehu/getDiseaseListByZimu.do";
            $.ajax({
            	url:url,
            	type:'post',
            	data:{zimu:"A"},
            	dataType:'json',
            	success:function(data){
            		if(data.respCode=="01"){
            			$(".right>ul").empty();
            			for(var i=0;i<data.diseaseList.length;i++){
            				var appendhtml='<li onclick="showDetailByID(this)" tid="'+data.diseaseList[i].changjianjibing_id+'">'+data.diseaseList[i].jibing_name+'</li>';
            				$(".right>ul").append(appendhtml);
            			}
            		}
            		
            	}
            });
		}
		
		//判断session是否存在 做相应的提示
		function checkSession(){
			var respCode = "${respCode}";
			var tag = "${tag}";
			if(respCode=="01"){
				
			}else{
				layer.confirm('您还没有登录，马上去？', {
   			                btn: ['确定'],
   			                title:'温馨提示',
   			            	},function () {
   			            		window.location.href='api/zywkehu/toLogin.do';
   			            	}
   			       );
			}
		}
		
		
		$(function(){
			$(".left").height($(window).height()-90);			
		});
		
</script>

</body>
</html>