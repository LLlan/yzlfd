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
    <title>案例展示列表</title>
    <style>
        .bgSelected{
            background: url(static/zhaoyiwang/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
        body{
            background-color: #eee;
        }
        .mask {
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0,0,0,0.3);
		    position: fixed;
		    top: 0;
		    left: 0;
		    display: none;
		    z-index: 100;
		}
		.bigImg img {
		    height: 270px;
		}
		.bigImg {
		    width: 100%;
		    height: auto;
		    position: fixed;
		    left: 0;
		    top: 150px;
		    display: none;
		    z-index: 99999;
		}
		.exampleBox {
		    padding: 9px 4%;
		    overflow: hidden;
		}
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" >
    	 <a href="javascript:void(0)" style="width: 32px;" onclick="window.location.href='api/shangHu/toPersonCenter.do'">
	    	<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
	    </a>
    </div>
    <div class="wy-header-title">案例展示列表</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="fabu" style="margin-top:60px;">
    <a href="javascript:void(0)" style="border-top:1px solid #d8d8d8;border-bottom: none;" onclick="toJump('add','');">添加案例</a>
</div>
<c:forEach items="${list }" var="list">
	<div class="anliBox01">
	    <div class="exampleBox">
	        <p>${list.title }</p>
	        <p style="line-height: 21px;"><img style="width: 80px;height: 80px;float: left;" src="<%=basePath %>${list.imgPath }">
	        	${list.detailContent }
	        </p>
	    </div>
	    <p class="change"><a href="javascript:void(0)" style="background-color: #ff9600" onclick="toJump('edit','${list.anli_zhanshi_id }');">编辑</a><a href="javascript:void(0)" style="background-color: #ee3837" class="delete" onclick="deleteAnLi('${list.anli_zhanshi_id }');">删除</a></p>
	</div>
</c:forEach>
<%-- 
<div class="anliBox01">
    <div class="exampleBox">
        <p>腰间盘突出治疗</p>
        <p>开结构化肯德基还没看见后大约可丝毫的，美厨娘创建块而护肤没考试大纲维护单里三后。大约可丝毫的美厨娘创建块而护肤没考试大纲维，护单里三级导航高越你先帮我饿？电动车否认他级导航高越你先帮我饿电动车否认他根本的个数无机物二月份</p>
    </div>
    <p class="change"><a href="javascript:void(0)" style="background-color: #ff9600" onclick="toJump('edit');">编辑</a><a href="javascript:void(0)" style="background-color: #ee3837" class="delete">删除</a></p>
</div>
--%>
<div class="mask"></div>
<div class="bigImg"></div>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script type="text/javascript">
   /* $(function(){
        $(".delete").click(function(){
            $(this).parent().parent().css("display","none");
        });
    });*/
    
       $(".exampleBox>p>img").click(function(){
        event.stopPropagation();
        $(".mask").fadeIn();
        var pic=$(this).attr("src");
        $(".bigImg").fadeIn();
        $(".bigImg").empty();
        $(".bigImg").append('<img class="bigPic" src="'+pic+'">');
        $(document).click(function(event){
            var _con = $('.bigImg');   // 设置目标区域
            if(!_con.is(event.target) && _con.has(event.target).length === 0){ // Mark 1
                $('.bigImg').fadeOut();//淡出消失
                $(".mask").fadeOut();
            }
        });
    });
    
    
    function deleteAnLi(id){
    	layer.open({
    		content:'您在执行删除案例操作,删除后将不可恢复,确认删除吗?'
    		,btn:['删除','取消']
    		,yes:function(index){
    			window.location.href="api/shangHu/deleteSettingExample.do?anli_zhanshi_id="+id;
    		}
    		,no:function(index){
    			layer.close(index);
    		}
    	});
    }
    function toJump(mark,id){
    	if(mark=='edit'){
    		window.location.href="api/shangHu/toSettingExampleEdit.do?anli_zhanshi_id="+id;
    	}else{
    		window.location.href="api/shangHu/toSettingExampleAdd.do";
    	}
    }
</script>
</body>
</html>