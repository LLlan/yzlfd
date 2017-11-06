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
        .wy-header-icon-back{
            width:120px;
        }
        .wy-header-icon-back>a{
            background: url(static/zhaoyiwang/zywkehuduan/images/dingwei01.png) no-repeat;background-size: 20px;;
        }

        .weui-tabbar__label {
            text-align: center;
            color: #999;
            font-size: 10px;
            line-height: 1.8;
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
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<!--<div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a><span style="position:relative;top:-24px;left:35px;color:#fff;font-size: 16px;">返回</span></div>
    <div class="wy-header-title">常见疾病</div>
</div>-->
<div id="header" style="width: 100%;position: fixed;top: 0;left: 0;z-index: 100;background-color: #38c4ff;">
    <h1 class="title">疑难杂症</h1>
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

<div class="mainBox01">
    <ul class="left">
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
    <div class="right">
        <ul class="show">
        </ul>
        <!-- <ul class="hide">
            <li>矮小症111111111</li>
            <li>艾滋病1111111</li>
            <li>艾滋病11111111111</li>
            <li>阿尔兹海默病111111111111</li>
            <li>暗疮111111111111</li>
            <li>变态反应111111111111</li>
            <li>便秘11111111111111</li>
            <li>病毒性肝炎1111111111111</li>
            <li>白血病111111111</li>
            <li>矮小症11111111111</li>
            <li>艾滋病111111111</li>
            <li>艾滋病1111111111</li>
            <li>阿尔兹海默病</li>
            <li>暗疮</li>
            <li>变态反应</li>
            <li>便秘</li>
            <li>病毒性肝炎</li>
            <li>白血病</li>
        </ul> -->
      <!--   <ul class="hide">
            <li>矮小症222222222222</li>
            <li>艾滋病222222222222</li>
            <li>艾滋病222222222222</li>
            <li>阿尔兹海默病</li>
            <li>暗疮222222222</li>
            <li>变态反应</li>
            <li>便秘22222222222222222</li>
            <li>病毒性肝炎</li>
            <li>白血病</li>
            <li>矮小症</li>
            <li>艾滋病</li>
            <li>艾滋病</li>
            <li>阿尔兹海默病</li>
            <li>暗疮</li>
            <li>变态反应</li>
            <li>便秘</li>
            <li>病毒性肝炎</li>
            <li>白血病</li>
        </ul>
        <ul class="hide">
            <li>矮小症333</li>
            <li>艾滋病33</li>
            <li>艾滋病3</li>
            <li>阿尔兹海默病</li>
            <li>暗3</li>
            <li>变态反应</li>
            <li>便秘3</li>
            <li>病毒性肝炎</li>
            <li>白血病</li>
            <li>矮小症</li>
            <li>艾滋病</li>
            <li>艾滋病</li>
            <li>阿尔兹海默病</li>
            <li>暗疮</li>
            <li>变态反应</li>
            <li>便秘</li>
            <li>病毒性肝炎</li>
            <li>白血病</li>
        </ul> -->
    </div>
    <!--底部间隙60px-->
   <!--  <div class="weui-flex clearfix">
        <div class="bot60"></div>
    </div> -->
</div>
<%@ include file="../diLan.jsp"%>
<!--主体结束-->
<script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script type="text/javascript">
    $(function(){
        /*var zimu=["A","B","C","D","E","F","G","H","I","G","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"];
        var des=[
                ['矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮'],
                ['白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘'],
                ['矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮'],
                ['白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘'],
                ['矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮','矮小症','艾滋病','阿尔兹海默病','暗疮'],
                ['白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘','白血病','病毒性肝炎','便秘'],
        ];*/
        $(".left>li").click(function(){
            $(this).addClass("xuanz");
            $(this).siblings().removeClass("xuanz");
            console.log($(this).find("a").text());
            var url = "api/zywkehu/getYnzzListByZimu.do";
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
            				var appendhtml=" <li>"+data.diseaseList[i].ynzz_name+"</li>";
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
    })
    
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
		  var url = "api/zywkehu/getYnzzListByZimu.do";
            $.ajax({
            	url:url,
            	type:'post',
            	data:{zimu:"A"},
            	dataType:'json',
            	success:function(data){
            		if(data.respCode=="01"){
            			$(".right>ul").empty();
            			for(var i=0;i<data.diseaseList.length;i++){
            				var appendhtml=" <li>"+data.diseaseList[i].ynzz_name+"</li>";
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