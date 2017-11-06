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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet"  href="static/lvjuyanglao/zywkehuduan/css/font-awesome.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/weui.min.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/login.css">
    <script src="static/lvjuyanglao/zywkehuduan/js/jquery-2.1.4.js"></script>
    <title>二维码</title>
    <style>
        .Main{
            position: relative;
            width: 100%;
            height: 100%;
            margin-top: 50px;
           /* display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;*/
        }
        .colum{
            position: absolute;
            top: 50%;
            left: 50%;
            margin-left: -100px;
            margin-top: -100px;
            width: 200px;
            height: 230px;
        }
        .Picture,img{
            position: absolute;
            top: 40%;
            left: 50%;
            margin-left: -100px;
            margin-top: -100px;
            width: 200px;
            height: 200px;
            border: none;
            text-align: center;
        }
        img{
            border: none;
        }
        .Main span{
            position: absolute;
            left: 9px;
            bottom: -30px;
            /*width: 100%;
            height:30px;
            line-height: 30px;*/
            color: #333;
            font-size: 13px;
        }
        .backlast{
      	  position:relative;top:-4px;left:19px;color:#fff;font-size: 15px;
        }

    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"><span class="backlast">返回</span></a></div>
    <div class="wy-header-title">我的二维码</div>
</div>
<div class="Main" style="">
    <div class="Picture">
        <img src="${pdsData.erweima_img}" alt=""/>
   		<span style="margin-top: 1px;">扫一扫上面的二维码，加入我们</span>
    </div>
    
     <div class="-mob-share-ui-button -mob-share-open" onclick="fenxiangEwm('${pd.user_kuhu_id}')">分享</div>
<!-- <div class="-mob-share-ui" style="display: none">
    <ul class="-mob-share-list">
        <li class="-mob-share-weixin"><p>微信</p></li>
        <li class="-mob-share-weibo"><p>新浪微博</p></li>
        <li class="-mob-share-qzone"><p>QQ空间</p></li>
        <li class="-mob-share-qq"><p>QQ好友</p></li>
        <li class="-mob-share-douban"><p>豆瓣</p></li>
        <li class="-mob-share-facebook"><p>Facebook</p></li>
        <li class="-mob-share-twitter"><p>Twitter</p></li>
    </ul>
    <div class="-mob-share-close">取消</div>
</div> -->
<div class="-mob-share-ui-bg"></div>
<script id="-mob-share" src="http://f1.webshare.mob.com/code/mob-share.js?appkey=你的appkey"></script>
</div>
<script src="static/lvjuyanglao/layer/layer.js"></script>
<script>
	function fenxiangEwm(id){
		//location.href="api/ljylkehu/fenxiangEwm.do?user_kuhu_id="+id;
		var url="<%=basePath%>api/ljylkehu/fenxiangEwm.do?user_kuhu_id="+id+"&type=1";
		url=encodeURIComponent(url);
		location.href="<%=basePath%>api/ljylkehu/fxewm.do?tag=1&fenxiangEwm="+url; 
	
	}


    $(function(){
    	var tag = "${tag}";
    	console.log("tag="+tag)
    	if(tag!="" && tag!=undefined){
			layer.msg("请您下载APP使用，分享更方便！",{
    		            time:2500,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
    		            icon:7,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		  });
		}
        $(".Main").height($(window).height()-50) ;
    })
</script>
</body>
</html>