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
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/zhaoyiwang/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <link href="static/zhaoyiwang/css/common1.css" type="text/css" rel="stylesheet"/>
    <link href="static/zhaoyiwang/css/index1.css" type="text/css" rel="stylesheet"/>
    <title>${titleMsg }</title>
    <style>
        body{
            background-color:#eee;
        }
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <div class="wy-header-icon-back" >
    	<a href="javascript:history.go(-1)" style="width: 32px">
	    	<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
	    </a>
    </div>
    <div class="wy-header-title" id="titleMsg">${titleMsg }</div>
</div>
<!--头部结束-->
<!--主体开始-->
<form action="<%=basePath %>api/shangHu/${msg }.do" method="post" id="myForm">
	<input type="hidden" id="msg" value="${msg }" name="msg"><%-- 判断操作为添加还是编辑 --%>
	<input type="hidden" id="fuwu_id" name="fuwu_id" value="${pd.fuwu_id }">
	<div class="Pxinxi">
	    <ul>
	        <li class="jibing01">
	        	<label for="telnum1">服务疾病</label>
	        	<input type="text" placeholder="疾病的名称" id="jibingName" style="margin-left:4%;" name="fuwu_jibing_name" value="${pd.fuwu_jibing_name }"/>
	        </li>
	        <li><label for="address1">价格</label><input type="text" placeholder="您理想的价格" id="price" name="price" value="${pd.price }"/></li>
	         <li>
	        	<label for="telnum1">疾病介绍</label><br>
	        	<textarea  placeholder="输入疾病介绍..." name="jibing_introdaction" id="jibing_introdaction" style="margin-top: 10px;width:100%;height:120px;padding:10px;">${pd.jibing_introdaction }</textarea>
	        </li>
	    </ul>
	</div>
</form>
<a href="javascript:void(0)" class="save" onclick="save();">提交</a>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script src="static/zhaoyiwang/js/imgUp1.js"></script>
<script type="text/javascript">
var regNum=/^\+?[1-9]\d*$/;
   $(function(){
        $(".jibing01").click(function(){
        /* 	//判断价格是否合法
    		if(!regNum.test($("#price").val()) && $("#price").val()!=""){
    			layer.tips('请正确填写价格', '#price', {
    	     		  tips: [1, '#D9006C'],
    	     		  time: 3000
    	     	});
    			return;
    		} */
        	$("#myForm").attr("action","api/shangHu/toPersonMyServiceAddJiBing.do");
        	$("#myForm").submit();
        });
    });
    //保存操作
    function save(){
    	console.log($("#file").val());
	   	//大于0的正数和小数正则表达式
	   	var regNum1=/^(?!0(\.0+)?$)([1-9][0-9]*|0)(\.[0-9]+)?$/;
	   	
		//判断服务疾病是否合法
		if($("#jibingName").val()==""){
			/*layer.tips('服务疾病不能为空', '#jibingName', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});*/
			layer.open({
	        	content:'请选择服务疾病'
	        	,skin:'msg'
	        	,time:2
	        });
			return;
		}
		//判断价格是否合法
		if(!regNum1.test($("#price").val())){
			/*layer.tips('价格必须是整数', '#price', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});*/
			layer.open({
	        	content:'请正确输入服务价格'
	        	,skin:'msg'
	        	,time:2
	        });
			return;
		}
		//疾病简介是否合法
		if($("#jibing_introdaction").val()==""){
			/*layer.tips('疾病简介不能为空', '#jibing_introdaction', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});*/
			layer.open({
	        	content:'请输入疾病介绍'
	        	,skin:'msg'
	        	,time:2
	        });
			return;
		}
    	$("#myForm").submit();
    }
</script>
</body>
</html>