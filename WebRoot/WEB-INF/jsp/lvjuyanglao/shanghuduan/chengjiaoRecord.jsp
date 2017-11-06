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

    <link rel="stylesheet" href="static/lvjuyanglao/lib/weui.min.css">
    <link rel="stylesheet" href="static/lvjuyanglao/css/jquery-weui.css">
    <link rel="stylesheet" href="static/lvjuyanglao/css/style.css">
    <link rel="stylesheet" href="static/lvjuyanglao/css/login.css">
    <title>成交记录</title>
    <style>
        body{
            background-color: #eee;
       }
       .smallbox>img {
		    width: 60px;
		    height: 60px;
		    border: 1px solid #eee;
		}
		.showbox {
		    width: 100%;
		    height:160px;
		     overflow: hidden;
		}
		.smallbox>div {
		    width: 75%;
		    margin-left: 11px;
		    color: #000;
		}
		.smallbox {
		    width: 97%;
		    margin: auto;
		    overflow: hidden;
		    position: relative;
		    
		}
		.bg-smallbox {
		    width: 100%;
		    background-color: #fff;
		  	 overflow: hidden;
		  	 height:160px;
		}
		.ziLiao>p:nth-child(4) {
		    color: #e0c381;
		    font-size: 14px;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    white-space: nowrap;
		}
		
		 .position{
		    display:inline-block;color:#aeaeae;font-size: 14px;font-weight: 400;padding-left:8px;margin-left:10px;border-left:1px solid #aeaeae;
		}
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index:9999;">
	<div class="wy-header-icon-back">
    	<a href="javascript:history.go(-1)" style="width: 32px">
    		<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
    	</a>
    </div>
    <div class="wy-header-title">成交记录</div>
</div>
<!--头部结束-->
<!--主体开始-->
<p class="sum01">成交总数 : ${list.size() }个</p>
<div style="clear: both" class="transaction">
	<c:forEach items="${list }" var="list">
		<div class="show showbox ">
        <div class="bg-smallbox" style="margin-top:2px;">
            <div class="smallbox">
                <img src="${list.headImg }"/>
                <c:choose>
                	<c:when test="${identity=='3' }">
                		<div class="ziLiao">
		                    <div style="float: left;max-width:107px; text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">
		                    	${list.youName }
		                    </div>
		                    <div class="position">${list.position }</div>
		                    <p>
		                    	${list.complete_time }
		                    </p>                  
		                    <p>服务疾病:${list.fuwu_jibing_name }</p>
		                     <p style="max-width:185px; text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${list.mark }</p>
		                    <p>价格:${list.price }元</p>
		                    <a class="deal" href="javascript:void(0)">已成交</a>
		                </div>
                	</c:when>
                	<c:when test="${identity=='2' }">
                		<div class="ziLiao">
		                    <p style="position: relative;">${list.youName } 
		                    <span>${list.dengji }</span>
		                    <span style="position: absolute;left:50%;top:3px;;border:none;">${list.complete_time }</span>                    
		                    <p>${list.mark }</p>
		                    <p>服务名称:${list.fuwu_name }</p>
		                    <p>价格:${list.price }元</p>
		                    <a class="deal" href="javascript:void(0)">已成交</a>
		                </div>
                	</c:when>
                	<c:otherwise>
                		<div class="ziLiao">
		                    <p style="position: relative;">${list.youName } 
		                    <span>
		                    	<c:choose>
		                    		<c:when test="${list.type=='1' }">
		                    			酒店
		                    		</c:when>
		                    		<c:when test="${list.type=='2' }">
		                    			景点
		                    		</c:when>
		                    		<c:otherwise>
		                    			特产
		                    		</c:otherwise>
		                    	</c:choose>
		                    </span><span style="position: absolute;left:50%;top:3px;;border:none;">${list.complete_time }</span>                    
		                    <p></p>
		                    <p style="width: 100%;">产品名称:${list.fuwu_name }</p>
		                    <p>该单总额:${list.kehuPrice }元</p>
		                    <p>该单收益:${list.totalPrice }元</p>
		                    <a class="deal" href="javascript:void(0)">已成交</a>
		                </div>
                	</c:otherwise>
                </c:choose>
            </div>
        </div>
    	</div>
	</c:forEach>
</div>
<!--主体结束-->
</body>
</html>