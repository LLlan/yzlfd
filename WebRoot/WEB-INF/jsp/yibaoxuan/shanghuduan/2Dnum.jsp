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
    <link rel="stylesheet" href="static/zhaoyiwang/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <title>个人中心</title>
    <style>
        body{
            background-color:#eee;
        }
        .show{
            display: block;
        }
        .hide{
            display: none;
        }

    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" >
    	<a href="javascript:history.go(-1)" style="width: 32px;">
    		<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
    	</a>
    </div>
    <div class="wy-header-title">我的二维码</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div id="box"style="clear: both;margin-top:60px;">
    <div class="show showbox box1">
        <div class="bg-smallbox" style="margin-top:11px;height: 86px;">
            <div class="smallbox">
                <img src="${pd.headImg }" style="border-radius: 5px;height: 60px;"/>
                <div class="ziLiao">
                    <div style="float: left;max-width:107px; text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">
                   		${pd.youName }
                   	</div>
                   	
                   	<c:if test="${pd.identity=='1' }">
						<div class="position" ><span style="color:#ddd;margin-left:3px;";>|</span> ${pd.position }</div>
					</c:if>
                    <p style="margin-top:9px;font-weight: 600;">${pd.mark }</p>
                    <a href="javascript:void(0)" onclick="fenxiangEwm('${pd.user_shanghu_id}')" class="fenxiang" style="border:none;background-color: #3bc2ff;color:#fff;margin: -16% 0 0 0;float: right;">分享</a>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="d2numBox">
    <img src="<%=basePath %>${pd.erWeiMaImg }" alt=""/>
    <p>扫一扫上面的二维码，加入我们</p>
</div>

<div class="mask"></div>
<!--<div class="fenxiangBox">
    <p><img src="../imahes/zys/" alt=""/><img src="../imahes/zys/" alt=""/><img src="../imahes/zys/" alt=""/><img src="../imahes/zys/" alt=""/><img src="../imahes/zys/" alt=""/></p>
    <p><a href="javascript:void(0)" class="cancel" style="color:#000;">取消</a></p>
</div>-->
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script type="text/javascript">
function fenxiangEwm(id){
	//location.href="api/zywkehu/fenxiangEwm.do?user_kuhu_id="+id;
	var url="http://lnlcjf.com/api/zywkehu/fenxiangEwm.do?user_shanghu_id="+id+"&type=2";
	url=encodeURIComponent(url);
	location.href="http://lnlcjf.com/api/zywkehu/fxewm.do?fenxiangEwm="+url; 
}
 /*   var li=$('li');
    var div=$('#box').children();
    li.click(function(){
        div.eq($(this).index()).attr('class','show').siblings().attr('class','hide');
        $(this).children().addClass("btm-bor").parent().siblings().children().removeClass("btm-bor");
    });
    $(".yijiuzhen").click(function(){
        $(".mask").fadeIn();
        $(".noneBox").fadeIn();
        $(".cancel").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
        });
        $(".sure").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
            $(".yiwan").addClass("btm-bor");
            $(".daizhixing").removeClass("btm-bor");
            div.eq($(this).index()).attr('class','show').siblings().attr('class','hide');
            /!* .attr('class','hide').siblings().attr('class','show');*!/
        })
    });*/
</script>
</body>
</html>