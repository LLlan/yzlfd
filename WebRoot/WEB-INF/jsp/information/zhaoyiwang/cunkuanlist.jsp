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
    <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
    <title>存款管理</title>
    <style>
        *{
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .save_money{
            position: fixed;
            bottom: 0;
            left: 0;
            z-index: 999;
            width: 100%;
            height: 50px;
            line-height: 50px;
            border: 1px solid #E1E1E1;
            text-align: center;
            background-color: #F4F4F4;
        }
        .save_money>a{
            display: block;
            color: #38c4ff;
        }
        .hover{
            color: #fff;
            background-color: #38c4ff;
        }
        .column ul{
            width: 100%;

            overflow: hidden;
        }
        .column ul li{
            padding: 10px 10px 10px 20px;
            width:100%;
            overflow: hidden;
            background-color: #fff;
            margin-top: 10px;
        }
        .column ul li:last-child{
            margin-bottom: 10px;
        }
        .column ul li p{
            font-size: 16px;
            color: #9a9a9a;
            margin: 0 15px 5px 5px;
        }
        .column ul li p span{
            color: #333333;
            font-size: 14px;
            margin-left: 20px;
        }
        .caozuo0 {
		    float: right;
		    margin-right: 20px;
		    border: 1px solid #c4c0c0;
		    border-radius: 5px;
		    background-color: #e9dfdf;
		    color: #a38181;
		    width: 60%;
		    height: 34px;
		    text-align: center;
		    line-height: 34px;
		}
        .caozuo1 {
        	float: right;
		    margin-right: 20px;
		    border: 1px solid #feb930;
		    border-radius: 5px;
		    background-color: #feb930;
		    color: white;
		    width: 60%;
		    height: 34px;
		    text-align: center;
		    line-height: 34px;
        }
		.caozuo2 {
		    float: right;
		    margin-right: 20px;
		    border: 1px solid #38c4ff;
		    border-radius: 5px;
		    background-color: #38c4ff;
		    color: white;
		    width: 60%;
		    height: 34px;
		    text-align: center;
		    line-height: 34px;
		}
    </style>
</head>
<body style="background-color: #f4f4f4;">
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"><span style="position:relative;top:-3px;left:19px;color:#fff;font-size: 15px;">返回</span></a></div>
    <div class="wy-header-title">存款管理</div>
</div>
<div class="column" style="padding: 50px 0;">
    <ul>
	    <c:forEach items="${list }" var="va">
	    	<li>
	            <p>存款金额<span>￥${va.begin_amount }</span></p>
	            <p>到期总额<span>￥${va.end_amount }</span></p>
	            <p>存款利率<span style="color: #f84848;">${va.rate * 100}%</span></p>
	            <p>存款类型<span style="color: #f84848;">
	            	<c:choose>
	            		<c:when test="${va.cunkuan_type=='1' }">
	            			3个月
	            		</c:when>
	            		<c:when test="${va.cunkuan_type=='2' }">
	            			6个月
	            		</c:when>
	            		<c:otherwise>
	            			12个月
	            		</c:otherwise>
	            	</c:choose>
	            </span></p>
	            <div style="width: 50%;margin-top: -55px;float: right;">
	            	<c:choose>
	            		<c:when test="${va.state=='0' }">
	            			<span class="caozuo0">已结束</span>
	            		</c:when>
	            		<c:when test="${va.state=='1' }">
	            			<span class="caozuo1" onclick="quchu('${va.cunkuan_id}','${va.user_id}');">取出到余额</span>
	            		</c:when>
	            		<c:otherwise>
	            			<span class="caozuo2">进行中</span>
	            		</c:otherwise>
	            	</c:choose>
	            </div>
	            <p>存入时间<span>${va.begin_time }</span></p>
	            <p>到期时间<span>${va.end_time }</span></p>
	        </li>
	    </c:forEach>
    </ul>
</div>
<div class="save_money"><a href="api/shangHu/toCunKuan.do?user_id=${pd.user_id }">我要存款</a></div>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script>
    function quchu(cunkuan_id,user_id){
    	$.post('api/shangHu/quchudaoyue.do',{cunkuan_id:cunkuan_id},function(data){
    		layer.open({
    		    type: 2
    		    ,content: '正在处理中'
    		    ,shadeClose: false
    		  });
    		setTimeout(function(){
    			window.location.href="api/shangHu/getCunKuanList.do?user_id="+user_id;
    		}, 2000);
    	});
    }
    
</script>
</body>
</html>