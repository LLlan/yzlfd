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
    <title>我的${titleMsg }</title>
    <style>
        body{
            background-color:#eee;
        }
		 .position{
				    display:inline-block;color:#aeaeae;font-size: 14px;font-weight: 400;padding-left:8px;margin-left:10px;border-left:1px solid #aeaeae;
		}
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index:999;">
    <div class="wy-header-icon-back" >
    	<a href="javascript:void(0)" style="width: 32px;" onclick="window.location.href='api/shangHu/toPersonCenter.do'">
    		<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
    	</a>
    </div>
    <div class="wy-header-title">我的${titleMsg }</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="myServiceBox">
    <div class="yiFabu">
        <p>${serviceList.size() }</p>
        <p>已发布</p>
    </div>
    <a href="javascript:void(0)" onclick="toJump('add');">
        <div class="addFuwu">
            <p>添加${titleMsg }</p>
        </div>
    </a>
</div>
<div class="listBox">
    <p>已发布列表</p>
    <div id="box"style="clear: both">
    <c:choose>
    	<c:when test="${shanghuUser.identity=='1' }">
    		 <c:forEach items="${serviceList }" var="list">
		    	<div class="show showbox box1" style="border-top: 1px solid #eee;">
		            <div class="bg-smallbox" >
		                <div class="smallbox">
		                    <img src="${list.headImg }"/>
		                    <div class="ziLiao">
		                       <div style="float: left;max-width:77px; text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">
		                    		${list.youName }
		                    	</div>
		                    	
		                    	<div class="position">${list.position }</div>
		                        <p style="width: 50%;">${list.mark }</p>
		                        <p>${list.fuwu_jibing_name }</p>
		                        <p>价格:${list.price }元</p>
		                        <a href="javascript:void(0)" class="yijiuzhen" style="padding:3px 8%;background-color: #fff;color:#ffba35;border:1px solid #ffba35;" onclick="toJump('${list.fuwu_id }');">编辑</a>
		                        <a href="javascript:void(0)" class="quxiao01" style="padding:3px 8%;;color:#ffba35;border:1px solid #ffba35;" onclick="deleteService('${list.fuwu_id }')">删除</a>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </c:forEach>
    	</c:when>
    	<c:otherwise>
    		<c:forEach items="${serviceList }" var="list">
		    	<div class="show showbox box1" style="border-top: 1px solid #eee;">
		            <div class="bg-smallbox" >
		                <div class="smallbox">
		                    <img src="${list.fwheadImg }"/>
		                    <div class="ziLiao">
		                        <p>名称 <span>${list.fuwu_jibing_name }</span></p>
		                        <p>${list.jibing_introdaction }</p>
		                        <p>价格:${list.price }元</p>
		                        <a href="javascript:void(0)" class="yijiuzhen" style="padding:3px 8%;background-color: #fff;color:#ffba35;border:1px solid #ffba35;" onclick="toJump('${list.fuwu_id }');">编辑</a>
		                        <a href="javascript:void(0)" class="quxiao01" style="padding:3px 8%;;color:#ffba35;border:1px solid #ffba35;" onclick="deleteService('${list.fuwu_id }')">删除</a>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </c:forEach>
    	</c:otherwise>
    </c:choose>
    </div>
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script type="text/javascript">
    function toJump(mark){
    	if(mark=='add'){
    		window.location.href='api/shangHu/toPersonMyServiceAdd.do';
    	}else{
    		window.location.href='api/shangHu/toPersonMyServiceEdit.do?fuwu_id='+mark;
    	}
    }
    function deleteService(fuwu_id){
    	layer.open({
    		content:'您在执行删除服务操作,删除后将不可恢复,确认删除吗?'
    		,btn:['删除','取消']
    		,yes:function(index){
    			window.location.href='api/shangHu/deletePersonMyService.do?fuwu_id='+fuwu_id;
    		}
    		,no:function(index){
    			layer.close(index);
    		}
    	});
    }
</script>
</body>
</html>