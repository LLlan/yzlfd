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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/zhaoyiwang/css/weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/index.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
    <title>发布主页</title>
    <style>
        body{
            background-color:#eee;
        }
        .wy-header-icon-back{
            width:120px;
        }
        .wy-header-icon-back>a{
            background: url(static/zhaoyiwang/images/dingwei01.png) no-repeat;background-size: 20px;;
        }
        .searchBox{
            margin-top: 0;
        }
        
         .mask {
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0,0,0,0.3);
		    position: fixed;
		    top: 0;
		    left: 0;
		    display: none;
		    z-index: 100;
		}
		.bigImg img {
		    height: 250px;
		}
		.bigImg {
		    width: 100%;
		    height: auto;
		    position: fixed;
		    left: 0;
		    top: 150px;
		    display: none;
		    z-index: 99999;
		}
		.exampleBox {
		    padding: 9px 4%;
		    overflow: hidden;
		}

    </style>
</head>
<body>
<!--头部开始-->
<!--头部开始-->
<div class="wy-header header">
	<%-- 定位 （start）--%>
    <div class="wy-header-icon-back"><a href="javascript:history.go(-1)"></a><span id="baidu" class="address"></span></div>
    <%-- 定位 （end）--%>
    <!-- <div class="wy-header-title">LOGO</div>
    <a href="javascript:void(0)" class="saoMa">扫一扫</a> -->
</div>
<!--头部结束-->
<!--主体开始-->
<div class="searchBox">
    <div class="searchBlock">
        <form action="<%=basePath %>api/shangHu/toRelease.do" method="post">
            <input type="text" placeholder="请输入关键词" class="keyWords" name="searchName" value="${searchName }"/>
            <input type="submit" value="搜索" class="searchBtn"/>
        </form>
    </div>
</div>
<div class="rongqi">
	<c:forEach items="${list }" var="list">
		<div class="liebiaoBox">
        <p class="userName"><img src="static/zhaoyiwang/images/ill.png" alt=""/></p>
        <div class="xuqiuB">
            <p>${list.patient_name }<span>${list.sex }</span><span>|</span>${list.age }岁<span>|</span>${list.address }<span>|</span>${list.disease }</p>
            <p>${list.symptom }</p>
            <p>
            <c:forEach items="${list.xuqiuImgList }" var="imglist"> 
            	<img src="<%=basePath %>${imglist.img_url }" alt=""/>
            </c:forEach>
            </p>
            <a href="javascript:void(0)" onclick="lianxihuanzhe('${list.user_kuhu_fid}','${list.patient_name }','${shanghu_id }','${shanghu_name}')" class="" title="${list.phone }">联系客户</a>
        </div>
    </div>
	</c:forEach>
    <div class="mask"></div>
    <div class="noneBox">
        <p id="phone">患者电话</p>
        <p><a href="javascript:void(0)" class="cancel" style="color:#000;">取消</a> <a class="sure">确定</a></p>
    </div>
</div>
<!--底部导航-->
<div class="weui-tabbar wy-foot-menu">

    <a href="javascript:void(0)" class="weui-tabbar__item weui-bar__item--on" onclick="toThirdModel('1');">
        <div class="weui-tabbar__icon  foot-menu-member"></div>
        <p class="weui-tabbar__label">需求大厅</p>
    </a>
     <a href="javascript:void(0)" class="weui-tabbar__item" onclick="toMsg('${shanghu_id}','${shanghu_name }')">
        <div class="weui-tabbar__icon foot-menu-xiaoxi"></div>
        <p class="weui-tabbar__label">消息中心</p>
    </a>
    <a href="javascript:void(0)" class="weui-tabbar__item" onclick="toThirdModel('2');">
        <div class="weui-tabbar__icon foot-menu-contact"></div>
        <p class="weui-tabbar__label">联系我们</p>
    </a>
    <a href="javascript:void(0)" class="weui-tabbar__item" onclick="toThirdModel('3');">
        <div class="weui-tabbar__icon foot-menu-user"></div>
        <p class="weui-tabbar__label">个人中心</p>
    </a>
</div>
<div class="mask"></div>
<div class="bigImg"></div>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
		$(".rongqi img").click(function(){
        event.stopPropagation();
        $(".mask").fadeIn();
        var pic=$(this).attr("src");
        $(".bigImg").fadeIn();
        $(".bigImg").empty();
        $(".bigImg").append('<img class="bigPic" src="'+pic+'">');
        $(document).click(function(event){
            var _con = $('.bigImg');   // 设置目标区域
            if(!_con.is(event.target) && _con.has(event.target).length === 0){ // Mark 1
                $('.bigImg').fadeOut();//淡出消失
                $(".mask").fadeOut();
            }
        });
    });
</script>
<script type="text/javascript">
	
	function lianxihuanzhe(k_id,k_name,s_id,s_name){
		console.log(k_id)
		console.log(k_name)
		console.log(s_id)
		console.log(s_name)
		
		//更新联系患者人数star
		var identity="${shanghuUser.identity}";
	 	  if(identity=="1"){
	 		  $.post('api/zywkehu/updateLxrs.do',{user_shanghu_id:s_id},function(data){
	 			  console.log(data.respMsg);
	 		  });
	 	  }//end 
		
		location.href="<%=basePath%>api/zywkehu/lianxihuanzhe.do?ku_id="+k_id+"&kehu_name="+k_name+"&s_id="+s_id+"&s_name="+s_name;    
	}
	
	function toMsg(shanghu_id,shanghu_name){
		 location.href="<%=basePath%>api/zywkehu/myqq.do?shanghu_userId="+shanghu_id+"&shanghu_name="+shanghu_name;    
	}

	
    $(".callHuanzhe").click(function(){
    	$("#phone").html($(this).attr("title"));
    	var phone=$(this).attr("title");
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
            $(".sure").attr("href","tel:"+phone);//href="tel:14543456765"
        });
    });
  //三大模块之间的跳转
	function toThirdModel(mark){
		if(mark=='1'){
			window.location.href='api/shangHu/toRelease.do';
		}else if(mark=='2'){
			window.location.href='api/shangHu/toContact.do';
		}else{
			window.location.href='api/shangHu/toPersonCenter.do';
		}
	}
</script>
<script>
      var myprovince = remote_ip_info['province'];
    var city = remote_ip_info['city'];
    var mydistrict = remote_ip_info['district'];
    $("#baidu").html(city+"市")
</script>

<%-- 定位 （start）--%>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=f2C9QaeY2zU9joj3Z34DG2gThH70Pwzl"></script>
<script type="text/javascript">
    $(function(){
      // 百度地图API功能
        var map = new BMap.Map("allmap");
        var point = new BMap.Point(116.331398,39.897445);
        function myFun(result){
            var cityName = result.name;
           // alert("当前定位城市:"+cityName);
            $(".address").text(cityName)
        }
        var myCity = new BMap.LocalCity();
        myCity.get(myFun);

        //demo示例一到四 通过lass调取，一句可以搞定，用于页面中可能有多个导航的情况
       // $('.wrapper').navbarscroll();

    });
</script>
<%-- 定位 （end）--%>
</body>
</html>