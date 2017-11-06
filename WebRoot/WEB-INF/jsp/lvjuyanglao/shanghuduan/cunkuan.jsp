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
    <script src="static/lvjuyanglao/js/jquery-2.1.4.js"></script>
    <title>我要存款</title>
    <style>
        .select{
            width: 100%;
            overflow: hidden;
            margin-top: 20px;
            padding: 0 10px;
        }
        .select ul{
            display: flex;
            display: -webkit-flex;
            display: -webkit-box;
            display: -moz-box;
            display: -ms-flexbox;
            justify-content: space-between;
            width: 95%;
            height: 40px;

        }
        .select ul li{
            flex: 1;
            -webkit-flex: 1;
            -ms-flex: 1;
            -webkit-box-flex: 1;
            -moz-box-flex: 1;
            margin-right: 10px;
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
            background-color: #feb930;
            border: none;
        }
        .changeU input {
            display: block;
            width: 85%;
            height: 35px;
            line-height: 35px;
            padding: 5px 0;
            margin:26px auto 0 auto;
            border: 1px solid #eaeaea;
            outline: none;
            border-radius: 27px;

        }
        .changeU .sure {
            display: block;
            width: 90%;
            height: 44px;
            line-height: 44px;
            margin:26px auto 0 auto;
            border: 1px solid #eaeaea;
            outline: none;
            border-radius: 27px;

        }
        .changeU input{
            padding-left: 20px;
        }
        .sure {
            background-color: #feb930;
            color: #fff;
            font-size: 18px;
            text-align: center;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a><span style="position:relative;top:-24px;left:35px;color:#fff;font-size: 16px;">返回</span></div>
    <div class="wy-header-title">存款额</div>
	<input type="hidden" id="li3"  value="${pd2.cunkuan_lilv3 }"/>
	<input type="hidden" id="li6" value="${pd2.cunkuan_lilv6 }"/>
	<input type="hidden" id="li12" value="${pd2.cunkuan_lilv12 }"/>
</div>
<div class="column" style="padding-top: 50px;">
    <div class="select">
        <ul id="myurl">
            <li class="sel" tid="1">3个月</li>
            <li tid="2">6个月</li>
            <li tid="3">12个月</li>
        </ul>
    </div>
          <span style="font-size: 14px;color: red;margin-left: 20px">利率：</span><span id="ttt" style="font-size: 13px;color: red;margin-left: 3px">${pd2.cunkuan_lilv3 * 100 }%</span>
    <input type="hidden" name="amount" id="amount" value="${pd.amount }"/>
    <form action="api/ljylshangHu/insertCunKuan.do" method="post" id="myForm">
    <%--<p style="margin: 10px 0px -25px 34px;font-size: 1px;font-family: -webkit-body;color: red;">温馨提示:存入最小金额为100元</p>--%>
    <div class="changeU">
        <input type="number" placeholder="可用金额为（${pd.amount }）" name="begin_amount" id="begin_amount"/>
        <input type="hidden" name="cunkuan_type" id="cunkuan_type" value="1"/>
        <input type="hidden" name="user_id" value="${pd.user_id }"/>
        <a href="javascript:void(0);" class="sure" onclick="baocun();">保存</a>
    </div>
	</form>
</div>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script src="static/lvjuyanglao/layer/mobile/layer.js"></script>
<script>
	$(function(){
		
	
		var amount=$("#amount").val();
		/* if(amount<100){
			$(".sure").css("background-color","#e4d8d8");
			$(".sure").removeAttr("onclick");
		} */
	});
    $(".select>ul>li").click(function(){
        $(this).addClass("sel").siblings().removeClass("sel");
        $("#cunkuan_type").val($(this).attr("tid"));
        if($(this).attr("tid")=="1"){
        	$("#ttt").text($("#li3").val()*100+"%");	
        }else if($(this).attr("tid")=="2"){
        	$("#ttt").text(($("#li6").val()*100)+"%");	
        }else{
        	$("#ttt").text(($("#li12").val()*100)+"%");	
        }
    });
    function baocun(){
    	var amount=$("#amount").val();
    	var begin_amount=$("#begin_amount").val();
    	//if(begin_amount<100 || begin_amount>amount ){
    	if(begin_amount<=0 || begin_amount>amount ){
    		//console.log("请正确输入金额");
    		$("#begin_amount").tips({
				side:3,
	            msg:'请正确输入金额',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
    	}
    	layer.open({
		    type: 2
		    ,content: '数据正在处理中'
		    ,shadeClose: false
		  });
		 setTimeout('$("#myForm").submit();', 1500);
    };
</script>
</body>
</html>