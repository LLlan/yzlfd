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
    <link rel="stylesheet" href="static/yibaoxuan/lib/weui.min.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/style.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/login.css">
    <title>我的积分</title>
    <style>
        .bgSelected{
            background: url(static/yibaoxuan/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
        body{
            background-color: #eee;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" >
	   <a href="javascript:history.go(-1)" style="width: 32px">
	    	<span style="position:relative;top:-4px;left:19px;color:#fff;font-size: 16px;">返回</span>
	   </a>
    </div>
    <div class="wy-header-title">我的积分</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="jifenBox">
    <span><span id="myjifen" style="margin-left: 60px;">${jifenData.jifen}</span><font>分</font></span>
    <span>积分可以在平台上消费</span>
</div>
<c:if test="${jifenData.jifen!=null &&jifenData.jifen!='' }">
<div style="margin-top: 10px;width: 100%;height: 33px;line-height: 61px;padding: 19px 0;border-top: 1px solid #d0d0d0;border-bottom: 1px solid #d0d0d0;background-color: #fff;overflow: hidden;">
	<p style="margin: -33px 0 0 10px;">活动一：积分兑换股权</p>
	<p style="margin: -33px 0 0 34px;font-size: 15px;color: #a27e7e;">
		<span id="jifennum">${pd.jifen_num }</span> 积分可兑换 <span id="guquannum">${pd.guquan_num }</span> 股权 
		<span onclick="duihuan();" style="float: right;width: 60px;height: 33px;background: #38c4ff;margin-right: 15px;border: 1px;border-radius: 20px;margin-top: 5px;">
			<font style="margin: -14px 0 0 11px;position: absolute;font-size: 20px;color: white;">兑换</font>
		</span>
	</p>
</div>
</c:if>
<!--主体结束-->
<script src="static/yibaoxuan/js/jquery-2.1.4.js"></script>
<script src="static/yibaoxuan/layer/layer.js"></script>
<script type="text/javascript">
	function duihuan(){
		var myjifen=$("#myjifen").html();
		var jifennum=$("#jifennum").html();
		if(parseFloat(myjifen) >= parseFloat(jifennum)){
			$.post('api/ybxkehu/jiFenHuanGuQuan.do',{},function(data){
				if(data.respCode=='00'){
					//window.location.href='api/zywkehu/index.do';
				}else{
					layer.msg("兑换成功",{
			            time:2000,//单位毫秒
			            shade: [0.8, '#393D49'], // 透明度  颜色
			            icon:6,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
			        });
					setTimeout("window.location.href='api/ybxkehu/myJifen.do'", 2000);
				}
			});
		}else{
			layer.msg("您的积分不足,无法进行兑换",{
	            time:2000,//单位毫秒
	            shade: [0.8, '#393D49'], // 透明度  颜色
	            icon:5,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
	        });
		}
	}
</script>
</body>
</html>