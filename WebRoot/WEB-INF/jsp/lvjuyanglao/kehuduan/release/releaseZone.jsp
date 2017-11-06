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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/weui.css"/>
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/index.css"/>
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/login.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/font-awesome.css">
    <title>发布主页</title>
    <style>
        body{
            font-size: 10px;
            background-color:#eee;
        }
        .wy-header-icon-back{
            width:120px;
        }
        .wy-header-icon-back>a{
            background: url(static/lvjuyanglao/zywkehuduan/images/dingwei01.png) no-repeat;background-size: 20px;;
        }

        .weui-tabbar__label {
            text-align: center;
            color: #999;
            font-size: 12px;
            line-height: 1.2;
            margin-bottom: 3px;
        }
        .icon1{
        	font-size:33px;
        }
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">发布需求</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<!--头部结束-->
<!--主体开始-->
<!--<div class="searchBox">
    <div class="searchBlock">
        <form action="">
            <input type="text" placeholder="请输入关键词" class="keyWords"/>
            <input type="button" value="搜索" class="searchBtn"/>
        </form>
    </div>
</div>-->
<div class="fabu" style="margin-top: 55px;">
    <a href="<%=basePath%>/api/ljylkehu/fabuxuqiu.do">发布需求</a>
</div>
<div class="rongqi" style="margin-bottom: 60px;">

 <c:forEach items="${reslutList}" var="xuqiu" varStatus="index">
    <div class="liebiaoBox">
        <p class="userName"><img src="static/lvjuyanglao/zywkehuduan/images/ill.png" alt=""/></p>
        <div class="xuqiuB">
            <p>${xuqiu.patient_name }<span>${xuqiu.sex }</span><span>|</span>${xuqiu.age }岁<span>|</span>${xuqiu.address }<span>|</span>${xuqiu.disease }</p>
            <p>${xuqiu.symptom}</p>
             <p style="margin-bottom: 10px;">
             <c:if test="${not empty xuqiu.imgList}">
	              <c:forEach items="${xuqiu.imgList}" var="img">
				       <img style="margin-right:10px " src="${img.img_url}" alt="" width="80px" height="80px"/>
	              </c:forEach>
             </c:if>
             </p>
        </div>
    </div>
    <div style="width: 60%;height: 34px;margin:10px auto;">
    <a style="display:inline-block;float:left;border:1px solid red;width:60px;height:25px;line-height:25px;text-align:center;color:#000;font-size: 13px;border-radius:10px;" href="<%=basePath %>api/ljylkehu/tofabuxuqiu.do?xuqiu_id=${xuqiu.xuqiu_id }">编辑</a>
    <a style="display:inline-block;float:right;border:1px solid red;width:60px;heihgt:25px;line-height:25px;text-align:center;color:#000;font-size: 13px;border-radius:10px;" href="<%=basePath %>api/ljylkehu/deleteXuQiu.do?xuqiu_id=${xuqiu.xuqiu_id }">删除</a>
    </div>
  </c:forEach>
       
    <div class="mask"></div>
    <div class="noneBox">
        <p>患者电话</p>
        <p><a href="javascript:void(0)" class="cancel" style="color:#000;">取消</a> <a href="tel:14543456765" class="sure">确定</a></p>
    </div>
</div>

<!--底部导航-->
<%@ include file="../diLan.jsp"%>
<!--主体结束-->
<script src="static/lvjuyanglao/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/lvjuyanglao/layer/mobile/layer.js"></script>
<script type="text/javascript">
    $(".callHuanzhe").click(function(){
        console.log("1");
        $(".mask").fadeIn();
        $(".noneBox").fadeIn();
        $(".cancel").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
        });
        $(".sure").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
        });
    });
</script>
<script>
    function getLocation(){
        if (navigator.geolocation){
            navigator.geolocation.getCurrentPosition(showPosition,showError);
        }else{
            alert("浏览器不支持地理定位。");
        }
    }

    function showPosition(position){
        $("#latlon").html("纬度:"+position.coords.latitude +'，经度:'+ position.coords.longitude);
        var latlon = position.coords.latitude+','+position.coords.longitude;
        //baidu
        var url = "http://api.map.baidu.com/geocoder/v2/?ak=C93b5178d7a8ebdb830b9b557abce78b&callback=renderReverse&location="+latlon+"&output=json&pois=0";
        $.ajax({
            type: "GET",
            dataType: "jsonp",
            url: url,
            beforeSend: function(){
                $("#baidu_geo").html('正在定位...');
            },
            success: function (json) {
                if(json.status==0){
                    $("#baidu_geo").html(json.result.formatted_address);
                }
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $("#baidu_geo").html(latlon+"地址位置获取失败");
            }
        });
    }

    function showError(error){
        switch(error.code) {
            case error.PERMISSION_DENIED:
                alert("定位失败,用户拒绝请求地理定位");
                break;
            case error.POSITION_UNAVAILABLE:
                alert("定位失败,位置信息是不可用");
                break;
            case error.TIMEOUT:
                alert("定位失败,请求获取用户位置超时");
                break;
            case error.UNKNOWN_ERROR:
                alert("定位失败,定位系统失效");
                break;
        }
    }

    //getLocation();

    /*navigator.geolocation.getCurrentPosition(function (position) {
     var lat = position.coords.latitude;
     var lon = position.coords.longitude;
     var point = new BMap.Point(lon, lat);  // 创建坐标点
     // 根据坐标得到地址描述
     var myGeo = new BMap.Geocoder();
     myGeo.getLocation(point, function (result) {
     var city = result.addressComponents.city;
     var provinceName = result.addressComponents.province;
     var districtName = result.addressComponents.district;
     $('#baidu_geo').html(districtName);
     });
     });*/
     $(function(){
     	abc();
     	checkSession();
     })
     
     	function abc(e1){
			$("#fbxq").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
		}
		
		//判断session是否存在 做相应的提示
		function checkSession(){
			var respCode = "${respCode}";
			var tag = "${tag}";
			if(respCode=="01"){
			}else{
					 /*layer.confirm('您还没有登录，马上去？', {
   			                btn: ['确定']['取消'],
   			                title:'温馨提示',
   			                closeBtn:0,
   			            	},function () {
   			            		window.location.href='api/ljylkehu/toLogin.do';
   			            	},function(){
   			            		window.location.href='api/ljylkehu/index.do';
   			            	}
   			       ); */
					//询问框
					  layer.open({
					    content: '您还没有登录，马上去登录？'
					    ,btn: ['确定', '取消']
					    ,yes: function(index){
					    	window.location.href='api/zywkehu/toLogin.do';
					    },no:function(){
					    	window.location.href='api/ljylkehu/index.do';
					    }
					  });
			}
		}
		
</script>
</body>
</html>