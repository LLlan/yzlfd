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
    <link rel="stylesheet" href="static/lvjuyanglao/css/weui.css"/>
    <link rel="stylesheet" href="static/lvjuyanglao/css/jquery-weui.css">
    <link rel="stylesheet" href="static/lvjuyanglao/css/index.css">
    <link rel="stylesheet" href="static/lvjuyanglao/css/style.css">
    <link rel="stylesheet" href="static/lvjuyanglao/css/login.css">
    <title>联系我们</title>
    <style>
        body{
            background-color:#eee;
        }
        .wy-header-icon-back{
            width:120px;
        }
        .wy-header-icon-back>a{
            background: url(static/lvjuyanglao/images/dingwei01.png) no-repeat;background-size: 20px;;
        }
        .searchBox{
            margin-top: 0;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header">
    <!-- <div class="wy-header-icon-back"><a href="javascript:history.go(-1)"></a><span  class="address"></span></div> -->
   <!--  <div class="wy-header-title">LOGO</div>
    <a href="javascript:void(0)" class="saoMa">扫一扫</a> -->
</div>
<!--头部结束-->
<!--主体开始-->
<!-- <div class="searchBox">
    <div class="searchBlock">
        <form action="">
            <input type="text" placeholder="请输入关键词" class="keyWords"/>
            <input type="button" value="搜索" class="searchBtn"/>
        </form>
    </div>
</div> -->
<ul class="connectBox">
    <li>电话:${pd.tel_phone }<a href="javascript:void(0)" class="callKefu">联系客服</a></li>
    <li>QQ:${pd.koukou }</li>
    <li>微信:${pd.weixin }</li>
    <li>公众号:${pd.weixinpublic }</li>
    <li>邮箱:${pd.email }</li>
</ul>
<div class="mask"></div>
<div class="noneBox">
    <p>${pd.tel_phone }</p>
    <p><a href="javascript:void(0)" class="cancel" style="color:#000;">取消</a> <a href="tel:${pd.tel_phone }" class="sure">确定</a></p>
</div>
<!--底部导航-->
<div class="weui-tabbar wy-foot-menu">
    <a href="javascript:void(0)" class="weui-tabbar__item" onclick="toThirdModel('1');">
        <div class="weui-tabbar__icon  foot-menu-member"></div>
        <p class="weui-tabbar__label">需求大厅</p>
    </a>
     <a href="javascript:void(0)" class="weui-tabbar__item"  onclick="toMsg('${shanghu_userId}','${shanghu_name }');">
        <div class="weui-tabbar__icon foot-menu-xiaoxi"></div>
        <p class="weui-tabbar__label">消息中心</p>
    </a>
    <a href="javascript:void(0)" class="weui-tabbar__item weui-bar__item--on" onclick="toThirdModel('2');">
        <div class="weui-tabbar__icon foot-menu-contact"></div>
        <p class="weui-tabbar__label">联系我们</p>
    </a>
    <a href="javascript:void(0)" class="weui-tabbar__item" onclick="toThirdModel('3');">
        <div class="weui-tabbar__icon foot-menu-user"></div>
        <p class="weui-tabbar__label">会员中心</p>
    </a>
</div>
<!--主体结束-->
<script src="static/lvjuyanglao/js/jquery-2.1.4.js"></script>
<script src="static/lvjuyanglao/layer/layer.js"></script>
<script src="http://int.dpool.sina.com.cn/iplookup/iplookup.php?format=js"></script>
<script type="text/javascript">

function toMsg(shanghu_id,shanghu_name){
		 location.href="<%=basePath%>api/ljylkehu/myqq.do?shanghu_userId="+shanghu_id+"&shanghu_name="+shanghu_name;    
	}


    $(".callKefu").click(function(){
        $(".mask").fadeIn();
        $(".noneBox").fadeIn();
        $(".cancel").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
        });

    })
    //三大模块之间的跳转
	function toThirdModel(mark){
		if(mark=='1'){
			$.post('api/ljylshangHu/isStateApplyStore.do',{},function(data){
				if(data.respCode=="01"){
					window.location.href='api/ljylshangHu/toRelease.do';
				}else if(data.respCode=="02"){
					layer.alert("您的申请已提交,等待后台人员的审核,如有不便,敬请谅解!",{
	    	            title:"温馨提示"//提示标题，默认为：信息
	    	            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
	    	            ,anim: 0 //动画类型0-6，默认为：0
	    	            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
	    	            ,btn: ['好的'] //按钮
	    	            ,icon: 6    // icon
	    	        });
				}
			});
		}else if(mark=='2'){
			window.location.href='api/ljylshangHu/toContact.do';
		}else{
			window.location.href='api/ljylshangHu/toPersonCenter.do';
		}
	}
</script>
<script>
     var myprovince = remote_ip_info['province'];
    var city = remote_ip_info['city'];
    var mydistrict = remote_ip_info['district'];
    $("#baidu").html(city+"市")
</script>
</body>
</html>