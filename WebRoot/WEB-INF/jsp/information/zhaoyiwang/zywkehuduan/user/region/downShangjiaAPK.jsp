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
            height: 54px;/*原来是110*/
        }
    </style>
</head>
<body>
    <div class="mask"></div>
      <div class="mask_bottom">
        <div class="anzhuo">安卓下载</div>
        <div class="bg_az" style="display: none;">
          <%--   <div class="az1" onclick="downAndriod('${pd.andriod_kehu}')">客户端</div> --%>
            <div class="az2" onclick="downAndriod('${pd.andriod_shanghu}')">商家版</div>
        </div>
        
      <%-- <div class="ios" style="display:block;">ios下载</div>
        <div class="bg_ios" style="display: none;">
            <div class="ios1" onclick="downIOS('${pd.ios_kehu}')">客户端</div>
            <div class="ios2" onclick="downIOS('${pd.ios_shanghu}')">商家端</div>
        </div> --%>
    </div>
    <script>
		function downAndriod(url){
			window.location.href=url;
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