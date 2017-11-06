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
		    height:130px;
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
		  	 height:130px;
		}
		.ziLiao>p:nth-child(4) {
		    color: #e0c381;
		    font-size: 14px;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    white-space: nowrap;
		}
		
		 .position{
		 	display: inline-block;
		    font-size: 14px;
		    font-weight: 400;
		    padding-left: 8px;
		    margin-left: 10px;
		    background-color: #38c4ff;
		    color: white;
		    padding-right: 8px;
		    border-radius: 5px;
		}
		.ziLiao>p:nth-child(3) {
		    width: 100%;
		    color: #000;
		    font-size: 14px;
		    white-space: nowrap;
		    overflow: auto;
		    text-overflow: initial;
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
                <div class="ziLiao">
                    <div style="float: left;max-width:230px; text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">
                    	${list.youName }
                    </div>
                    <div class="position">
                    ${list.type=='1'?'医生':list.type=='2'?'机构':list.type=='3'?'药商':list.type=='4'?'酒店':list.type=='5'?'景点':list.type=='6'?'特产':list.type=='7'?'字画':list.type=='8'?'古玩':list.type=='9'?'藏品':'玉石' }
                    </div>
                    <p>
                    	完成时间:${list.complete_time }
                    </p>                  
                    <p>服务或产品名称:${list.fuwu_jibing_name }</p>
                    <!--<p style="max-width:185px; text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">${list.mark }</p>-->
                    <p>本单收益:${list.price }元</p>
                    <a class="deal" href="javascript:void(0)">已成交</a>
                </div>
                <%--
                <c:choose>
                	<c:when test="${identity=='1' }">
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
		                    		<c:when test="${list.category=='1' }">
		                    			中药
		                    		</c:when>
		                    		<c:when test="${list.category=='2' }">
		                    			西药
		                    		</c:when>
		                    		<c:otherwise>
		                    			中药/西药
		                    		</c:otherwise>
		                    	</c:choose>
		                    </span><span style="position: absolute;left:50%;top:3px;;border:none;">${list.complete_time }</span>                    
		                    <p>${list.mark }</p>
		                    <p>服务名称:${list.fuwu_name }</p>
		                    <p>价格:${list.price }元</p>
		                    <a class="deal" href="javascript:void(0)">已成交</a>
		                </div>
                	</c:otherwise>
                </c:choose>
                --%>
            </div>
        </div>
    	</div>
	</c:forEach>
</div>
<!--主体结束-->
</body>
</html>