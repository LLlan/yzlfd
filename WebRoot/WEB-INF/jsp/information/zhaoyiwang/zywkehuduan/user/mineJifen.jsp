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
    <title>我的积分</title>
    <style>
        .bgSelected{
            background: url(static/zhaoyiwang/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
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
<!--  
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
-->
<c:if test="${not empty tempPd }">
<div style="margin-top: 10px;width: 100%;height: 33px;line-height: 61px;padding: 19px 0;border-top: 1px solid #d0d0d0;border-bottom: 1px solid #d0d0d0;background-color: #fff;overflow: hidden;">
	<p style="margin: -33px 0 0 10px;">活动一：积分兑换股权</p>
	<p style="margin: -33px 0 0 34px;font-size: 15px;color: #a27e7e;">
		<span id="jifennum">${pd.jifen_num }</span> 积分可兑换 <span id="guquannum">${pd.guquan_num }</span> 股权 
		<span onclick="duihuan('1');" style="float: right;width: 60px;height: 33px;background: #38c4ff;margin-right: 15px;border: 1px;border-radius: 20px;margin-top: 5px;">
			<font style="margin: -14px 0 0 11px;position: absolute;font-size: 20px;color: white;">兑换</font>
		</span>
	</p>
</div>
</c:if>
<c:if test="${not empty jfhMoeny }">
<div style="margin-top: 10px;width: 100%;height: 33px;line-height: 61px;padding: 19px 0;border-top: 1px solid #d0d0d0;border-bottom: 1px solid #d0d0d0;background-color: #fff;overflow: hidden;">
	<p style="margin: -33px 0 0 10px;">活动${not empty tempPd?'二':'一' }：积分兑换money</p>
	<p style="margin: -33px 0 0 34px;font-size: 15px;color: #a27e7e;">
		<span id="jifennum1">${jfhMoeny.jifen_num }</span> 积分可兑换 <span id="moneynum">${jfhMoeny.money_num }</span> 元 
		<span onclick="duihuan('2');" style="float: right;width: 60px;height: 33px;background: #38c4ff;margin-right: 15px;border: 1px;border-radius: 20px;margin-top: 5px;">
			<font style="margin: -14px 0 0 11px;position: absolute;font-size: 20px;color: white;">兑换</font>
		</span>
	</p>
</div>
</c:if>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script type="text/javascript">
	function duihuan(type){
		var myjifen=$("#myjifen").html();
		var jifennum=$("#jifennum").html();
		var jifennum1=$("#jifennum1").html();
		var guquannum=$("#guquannum").html();
		var moneynum=$("#moneynum").html();
		
		if(type=='1'){
			if(parseFloat(myjifen) >= parseFloat(jifennum)){
				var msg="确定使用"+jifennum+"积分兑换"+guquannum+"股权吗?";
				layer.open({
					content:msg
					,btn:['兑换','取消']
					,yes:function(index){
						$.post('api/zywkehu/jiFenHuanGuQuan.do',{type:type},function(data){
							if(data.respCode=='00'){
								//window.location.href='api/zywkehu/index.do';
							}else{
								layer.open({
									content:'兑换成功'
									,skin:'msg'
									,time:1
								});
								setTimeout("window.location.href='api/zywkehu/myJifen.do'", 1000);
							}
						});
					}
					,no:function(index){
						layer.close(index);
					}
				});
			}else{
				layer.open({
					content:'您的积分不足,无法进行兑换'
					,skin:'msg'
					,time:1
				});
			}
		}else{
			if(parseFloat(myjifen) >= parseFloat(jifennum1)){
				var msg="确定使用"+jifennum1+"积分兑换"+moneynum+"元吗?";
				layer.open({
					content:msg
					,btn:['兑换','取消']
					,yes:function(index){
						$.post('api/zywkehu/jiFenHuanGuQuan.do',{type:type},function(data){
							if(data.respCode=='00'){
								//window.location.href='api/zywkehu/index.do';
							}else{
								layer.open({
									content:'兑换成功'
									,skin:'msg'
									,time:1
								});
								setTimeout("window.location.href='api/zywkehu/myJifen.do'", 1000);
							}
						});
					}
					,no:function(index){
						layer.close(index);
					}
				});
			}else{
				layer.open({
					content:'您的积分不足,无法进行兑换'
					,skin:'msg'
					,time:1
				});
			}
		}
		
		
	}
</script>
</body>
</html>