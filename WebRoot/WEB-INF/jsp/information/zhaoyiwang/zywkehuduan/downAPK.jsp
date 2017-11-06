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
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/yahu.css"/>
    <script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
    <title>APP下载</title>
    <style>
        .mask{
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            z-index: 500;
            background: rgba(0,0,0,.3);
        }
        .mask_bottom{
            position: fixed;
            bottom: 0;
            left: 0;
            z-index: 999;
            width: 100%;
            background-color: #fff;
            overflow: hidden;
        }
           .anzhuo,.ios,.az1,.az2,.ios1,.ios2{
            width: 100%;
            height: 55px;
            line-height: 55px;
            font-size: 15px;
            color: #333;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        .az1,.az2,.ios1,.ios2{
        	   font-size: 13px;
        }
        .ios{
            border-bottom: none;
        }
        .hover{
            background-color: #38c4ff;
            color: #fff;
        }
        .bg_az{
            width: 100%;
            height: 109px;/*原来是110*/
        }
    </style>
</head>
<body>
    <div class="mask"></div>
      <div class="mask_bottom">
        <div class="anzhuo">安卓下载</div>
        <div class="bg_az" style="display: none;">
            <div class="az1" onclick="downAndriod('${pd.andriod_kehu}')">客户端</div>
            <div class="az2" onclick="downAndriod('${pd.andriod_shanghu}')">商户端</div>
        </div>
      <%-- <div class="ios" style="display:block;">ios下载</div>
        <div class="bg_ios" style="display: none;">
            <div class="ios1" onclick="downIOS('${pd.ios_kehu}')">客户端</div>
            <div class="ios2" onclick="downIOS('${pd.ios_shanghu}')">商家端</div>
        </div> --%>
    </div>
    <script>
  //定义浏览器
    var browser = {
   	    versions: function () {
   	        var u = navigator.userAgent, app = navigator.appVersion;
   	        return {         //移动终端浏览器版本信息
   	            trident: u.indexOf('Trident') > -1, //IE内核
   	            presto: u.indexOf('Presto') > -1, //opera内核
   	            webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
   	            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
   	            mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
   	            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
   	            android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
   	            iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
   	            iPad: u.indexOf('iPad') > -1, //是否iPad
   	            webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
   	        };
   	    }(),
    	language: (navigator.browserLanguage || navigator.language).toLowerCase()
    };
    
    
    
		function downAndriod(url){
			
			//公共参数
			var vNow = new Date();
			var sNow = "";
			sNow += String(vNow.getFullYear());
			(vNow.getMonth() + 1)<10?sNow += "0"+String(vNow.getMonth() + 1):sNow += String(vNow.getMonth() + 1);
			(vNow.getDate())<10?sNow += "0"+String(vNow.getDate()):sNow += String(vNow.getDate());
			(vNow.getHours())<10?sNow += "0"+String(vNow.getHours()):sNow += String(vNow.getHours());
			(vNow.getMinutes())<10?sNow += "0"+String(vNow.getMinutes()):sNow += String(vNow.getMinutes());
			(vNow.getSeconds())<10?sNow += "0"+String(vNow.getSeconds()):sNow += String(vNow.getSeconds());
			(vNow.getMilliseconds())<10?sNow += "00"+String(vNow.getMilliseconds()):(vNow.getMilliseconds())<100?sNow += "0"+String(vNow.getMilliseconds()):sNow += String(vNow.getMilliseconds());
			
			//获取随机六位数
			for(var i=0;i<6;i++)
			{
			    sNow += Math.floor(Math.random()*10);
			}
			console.log(sNow); 
			
			
			if (browser.versions.mobile) {//移动设备中打开
				   var ua = navigator.userAgent.toLowerCase();//获取判断用的对象
				        
				   if (ua.match(/MicroMessenger/i) == "micromessenger") {//在微信中打开
					   window.location.href="api/zywkehu/pay.do?order_number="+sNow;
				   }else{//非微信内打开
					   window.location.href=url; 
				   }
			}else{
				window.location.href=url; 
			} 
		}
		function downIOS(url){
			window.location.href=url;
		}
		   
    </script>
     <script>
        $(".anzhuo").click(function(){
         $(".ios").removeClass("oo");
            $(this).addClass("hover").siblings().removeClass("hover");
            $(this).siblings(".bg_ios").hide();
            if($(this).hasClass("zz")){
                $(this).removeClass("zz");
                $(".bg_az").hide();
            }else{
                $(this).addClass("zz hover");
                $(".bg_az").show();
                
            }
        });
        $(".ios").click(function(){
        	$(".anzhuo").removeClass("zz");
            $(this).addClass("hover").siblings().removeClass("hover");
            $(this).siblings(".bg_az").hide();
            if($(this).hasClass("oo")){
                $(this).removeClass("oo").addClass("hover");
                $(".bg_ios").hide();
            }else{
                $(this).addClass("oo hover");
                $(".bg_ios").show();
            }
        })
    </script>
</body>
</html>