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
    <title>评价</title>
    <style>
        .bgSelected{
            background: url(static/lvjuyanglao/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
        .dispBox>textarea {
		    width: 96%;
		    height: 152px;
		    border: 1px solid #b5b5b5;
		    border-radius: 5px;
		    padding: 5px 2%;
		    margin-top: 5px;
		    resize: none;
		}
		
		
		
		
		 .select{
            width: 100%;
            overflow: hidden;
            margin-top: 20px;
            padding-right: 5px;
        }
        .select ul{
            display: flex;
            display: -webkit-flex;
            display: -webkit-box;
            display: -moz-box;
            display: -ms-flexbox;
            justify-content: space-between;
            width: 100%;
            height: 40px;
           
        }
        .select ul li{
            flex: 1;
            -webkit-flex: 1;
            -ms-flex: 1;
            -webkit-box-flex: 1;
            -moz-box-flex: 1;
            margin-right: 28px;
            height: 35px;
            border: 1px solid #ddd;
            line-height: 35px;
            border-radius: 15px;
            text-align: center;
            font-size: 16px;
            
        }
        .select ul li:last-child{
            margin-right: 0;
        }
        .select>ul>li.sel{
            color: #fff;
            background-color: #90EE90;
            border: none;
        }
        .select{
        	margin-bottom: 25px;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" >
    	<a href="javascript:history.go(-1)" style="width: 32px">
	    	<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
	    </a>
    </div>
    <div class="wy-header-title">评价</div>
</div>
<!--头部结束-->
<!--主体开始-->
<form action="<%=basePath %>api/ljylkehu/savePingjia.do" method="post" id="myForm">
	<input type="hidden" value="${pd.user_fid}" name="user_fid">
	<input type="hidden" value="${pd.identity}" name="identity">
	<input type="hidden" value="${pd.user_shanghu_id}" name="user_shanghu_id">
	<input type="hidden" value="${pd.tid}" name="tid">
	<input type="hidden" value="好评" name="grade" id="grade">
	
	<div class="dispBox">
	    <textarea style="height: 250px;" name="pj_context" id="pj_context" placeholder="请输入你对该产品的评价"></textarea>
	    <div class="select">
	    	<ul>
		        <li class="sel" tname="好评">好评</li>
		        <li class="" tname="不错">不错</li>
		        <li class="" tname="一般">一般</li>
	    	</ul>
		</div>
	</div>
	
</form>
<a href="javascript:void(0)" class="save" onclick="save();">保存</a>
<!--主体结束-->
<script src="static/lvjuyanglao/js/jquery-2.1.4.js"></script>
<!-- <script src="static/lvjuyanglao/layer/layer.js"></script> -->
<script src="static/lvjuyanglao/layer/mobile/layer.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script type="text/javascript">

	 $(".select>ul>li").click(function(){
        $(this).addClass("sel").siblings().removeClass("sel");
        $("#grade").val($(this).attr("tname"));
     })
	function save(){
		if($("#pj_context").val()==""){
		$("#pj_context").tips({
				side:3,//1在上面 2在右边 3在底下
	            msg:'评价语不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		//loading带文字
		 layer.open({
		    type: 2
		    ,content: '加载中'
		    ,shadeClose: false
		  });
		 setTimeout('$("#myForm").submit();', 600);
	}
</script>
</body>
</html>