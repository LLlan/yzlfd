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
		.ziLiao>p:nth-child(1)>span {
		    font-size: 14px;
		    font-weight: 400;
		    padding-left: 8px;
		    margin-left: 10px;
		    border-left: 0;
		    background-color: #38c4ff;
		    padding-right: 8px;
		    color: white;
		    border-radius: 5px;
		}
		 .smallbox>div.moren{
            width: 100%;
		    margin: 13px auto 0 auto;
		   
		    border-top: 1px solid #f0f0f0;
		    height: 48px;
		    color: #333;
		    font-size: 13px;
        }
        .moren>a:nth-child(1){
            display: block;
            width:130px;
            height:48px;
            line-height: 48px;
            float: left;
        }
        .moren>a:nth-child(1)>img{
            width:24px;
            height:24px;
            margin-top:10px;
            float: left;
            margin-right:10px;
        }
        .moren>a:nth-child(1)>span{
            float: left;
        }
        .moren>a:nth-child(2),.moren>a:nth-child(3){
            display: block;
            width:65px;
            height:48px;
            line-height: 48px;
            float: right;
            color:#999;
        }
        .moren>a:nth-child(2)>img,.moren>a:nth-child(3)>img{
            width:18px;
            height:18px;
            margin-top:15px;
            float: left;
            margin-right:10px;
        }
        .moren>a:nth-child(2)>span,.moren>a:nth-child(3)>span{
            float: left;
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
    <c:forEach items="${serviceList }" var="list">
    	<div class="show showbox box1" style="margin-bottom: 5px;border-top: 1px solid #eee;">
            <div class="bg-smallbox" >
                <div class="smallbox">
                    <img src="${list.fwheadImg }"/>
                    <div class="ziLiao">
                        <!--<p>名称 <span>${list.fuwu_jibing_name }</span></p>-->
                        <c:choose>
                        	<c:when test="${shanghuUser.identity=='4'}">
                        		<p>${list.fuwu_jibing_name }<span>${list.type=='4'?"酒店":list.type=='5'?"景点":"特产"}</span></p>
                        	</c:when>
                        	<c:otherwise>
                        		<p>${list.fuwu_jibing_name }<span>${list.type=='7'?"字画":list.type=='8'?"古玩":list.type=='9'?"藏品":"玉石"}</span></p>
                        	</c:otherwise>
                        </c:choose>
                        <p>${list.jibing_introdaction }</p>
                        <p>价格:${list.price }元</p>
                        <%--<a href="javascript:void(0)" class="yijiuzhen" style="padding:3px 8%;background-color: #fff;color:#ffba35;border:1px solid #ffba35;" onclick="toJump('${list.fuwu_id }');">编辑</a>
                        <a href="javascript:void(0)" class="quxiao01" style="padding:3px 8%;;color:#ffba35;border:1px solid #ffba35;" onclick="deleteService('${list.fuwu_id }')">删除</a>
                    --%>
                    </div>
                    <div class="moren">
		                <a href="javascript:void(0)" class="morenA" tid="${list.fuwu_id }" title="${list.type }"><img class="img${list.type }" src="static/zhaoyiwang/images/zys/${list.isDefault=='1'?'gou4':'gou5'}.png" alt=""/><span>设为默认LOGO</span></a>
		                <a href="javascript:void(0)" class="shanchu" onclick="deleteService('${list.fuwu_id }')"><img src="static/zhaoyiwang/images/zys/shan.png" alt=""/><span>删除</span></a>
		                <a href="javascript:void(0)" class="bianji" style="margin-right:10px;" onclick="toJump('${list.fuwu_id }');"><img src="static/zhaoyiwang/images/zys/bian.png" alt=""/><span>编辑</span></a>
		            </div>
                </div>
            </div>
        </div>
    </c:forEach>
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
   
    $(".morenA").click(function(){
    	if($(this).find("img").attr("src")=="static/zhaoyiwang/images/zys/gou4.png"){
    		 $(this).find("img").attr("src","static/zhaoyiwang/images/zys/gou5.png");
    		 isDefault($(this).attr("tid"), 0,$(this).attr("title"));
    	}else{
    		$(this).find("img").attr("src","static/zhaoyiwang/images/zys/gou4.png");
            $(this).parents(".showbox").siblings().find(".morenA").children("img"+$(this).attr("tid")).attr("src","static/zhaoyiwang/images/zys/gou5.png");
            isDefault($(this).attr("tid"), 1,$(this).attr("title"));
    	}
    });
    function isDefault(id,isDefault,title){
    	$.post('api/shangHu/isDefault.do',{fuwu_id:id,isDefault:isDefault,type:title},function(data){
    		if(data.respCode=="00"){
    			window.location.href="api/shangHu/toLogin.do";
    		}else{
    			layer.open({
    				content:'设置成功'
    				,skin:'msg'
    				,time:1.5
    			});
    			window.location.reload();
    		}
    	});
    }
</script>
</body>
</html>