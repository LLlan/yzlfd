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
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/lib/weui.min.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/login.css">
    <title></title>
    <style>
        body{
            background-color:#fff;
        }
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<!-- <div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;z-index: 100;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a><span style="position:relative;top:-24px;left:35px;color:#fff;font-size: 16px;">返回</span></div>
    <div class="wy-header-title">最新新闻</div>
</div> -->

<!--主体结束-->
<script src="static/lvjuyanglao/zywkehuduan/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
    $(function(){
        //平台、设备和操作系统
        var system = {
            win: false,
            mac: false,
            xll: false,
            ipad:false
        };
        //检测平台
        var p = navigator.platform;
        system.win = p.indexOf("Win") == 0;
        system.mac = p.indexOf("Mac") == 0;
        system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
        system.ipad = (navigator.userAgent.match(/iPad/i) != null)?true:false;
        //跳转语句
        if (system.win || system.mac || system.xll||system.ipad) {
			//pc端
			window.location.href="api/keHuPc/index.do";
			//window.location.href = "api/ljylkehu/index.do";
        } else {
       	    //手机端
            window.location.href = "api/ljylkehu/index.do";
        }
    })
</script>

<script type="text/javascript">
//下面的这种方式也可以判断到时pc还是移动设备访问
    /* function browserRedirect() {
      var sUserAgent = navigator.userAgent.toLowerCase();
      var bIsIpad = sUserAgent.match(/ipad/i) == "ipad";
      var bIsIphoneOs = sUserAgent.match(/iphone os/i) == "iphone os";
      var bIsMidp = sUserAgent.match(/midp/i) == "midp";
      var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
      var bIsUc = sUserAgent.match(/ucweb/i) == "ucweb";
      var bIsAndroid = sUserAgent.match(/android/i) == "android";
      var bIsCE = sUserAgent.match(/windows ce/i) == "windows ce";
      var bIsWM = sUserAgent.match(/windows mobile/i) == "windows mobile";
      document.writeln("您的浏览设备为：");
      if (bIsIpad || bIsIphoneOs || bIsMidp || bIsUc7 || bIsUc || bIsAndroid || bIsCE || bIsWM) {
        document.writeln("phone");
      } else {
        document.writeln("pc");
      }
    }
 
    browserRedirect(); */
  </script>
</body>
</html>