<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/zyw/common.css"/>
    <link rel="stylesheet" href="static/css/zyw/toubu.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/dizhi.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/layer/layer.js"></script>
    <title>填写收货地址</title>
    <style>
        .show{
            display: block;
        }
        .hide{
            display: none;
        }
        .colmain>.sure{
            background-color:#38c4ff;color:#fff;border:1px solid #38c4ff;
        }
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<jsp:include page="../top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<!--头部-->
<div class="seem">
    <div class="sidbar fl">
        <div class="all clearfix">
            <a href="<%=basePath %>api/keHuPc/index.do"><b>所有分类</b></a>
        </div>
    </div>
    <div class="navmain fl">
        <ul>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/index.do">首页</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYiShengList.do">找医生</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchJiGouList.do">找机构</a></li>
            <li class="fl"><a class="hover" href="<%=basePath %>api/keHuPc/searchYaoShangList.do">找药商</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div class="xiadanBack">
    <div class="xiadanBox">
        <div class="xiadanTop">您的位置 > 首页 > 找药商 > <span>立即下单</span></div>
        <div class="xiadanMain01">
            <div class="xingM">
                <label for="nameN">姓名 : </label><input type="text" placeholder="请输入您的姓名" id="nameN"/>
                <label for="telN">收货人电话 : </label><input type="text" placeholder="请输入您的电话号码" id="telN"/>
            </div>
            <div class="dizhi">
                <label for="s_province">地址 : </label>
                <select class="select" id="s_province" name="s_province"  onchange="fn1(this.value)">
                </select>
                <select class="select" id="s_city" name="s_city"  onchange="fn2(this.value)">
                </select>
                <select class="select" id="s_county" name="s_county" >
                </select>
                <script src="static/js/zyw/area.js"></script>
                <script type="text/javascript">_init_area();</script>
                <input type="text" id="xiang" placeholder="详细街道"/>
            </div>
            <div class="beizhu">
                <label for="bei">备注 : </label><input type="text" id="bei" placeholder="此处填写备注信息（无指定要求可不填写）"/>
            </div>
            <div class="colTwo">
                <span>产品信息 : </span>
                <p><span>药商名称:　${tempfuwu.youName }</span><span>服务名称:　${tempfuwu.fuwu_jibing_name }</span><span>地址:　${tempfuwu.address }</span></p>
                <p class="numChange"><a href="javascript:void(0)" style="background-color:#fcfcfc;" class="jian">-</a><span class="num">1</span><a href="javascript:void(0)" style="background-color:#38c4ff;border:1px solid #38c4ff;color:#fff;" class="jia">+</a></p>
            </div>
        </div>
        <%--<p class="tongyi">我已阅读并且同意<a href="javascript:void(0)">《购买合同付款条款》</a>相关注意事项<input type="radio"/></p>--%>
        <div class="xiadanMain02">
            <div class="smain02">
                <span>支付方式 :</span>
                <%--<a href="javascript:void(0)" class="zhifu" tid="1">微信支付</a>--%>
                <a href="javascript:void(0)" class="zhifu" style="border:1px solid #38c4ff" tid="2">支付宝支付</a>
                <span style="margin-left: 90px;" id="num3">使用<font id="num1"></font>个虚拟币抵扣<font id="num2"></font>元</span><input type="checkbox" style="margin-left: 10px;" id="xnbcheckbox">
                <a href="javascript:void(0)" onclick="querenzhifu('${tempfuwu.fuwu_id }');">确认付款</a>
                <span>元</span>
                <span id="price">${tempfuwu.price }</span><input type="hidden" id="danjia" value="${tempfuwu.price }">
            </div>
        </div>
        <form action="" method="post" id="payForm">
        	<input type="hidden" name="fuwu_id" id="fuwu_id" value="">
        	<input type="hidden" name="WIDtotal_amount" id="WIDtotal_amount" value="">
        	<input type="hidden" name="user_kuhu_id" id="user_kuhu_fid" value="${kehuUser.user_kuhu_id }">
        	
        	<input type="hidden" name="xingming" id="xingming" value="">
        	<input type="hidden" name="dianhua" id="dianhua" value="">
        	<input type="hidden" name="dizhi" id="dizhi" value="">
        	<input type="hidden" name="beizhu" id="beizhu" value="">
        	<input type="hidden" name="number" id="number" value="">
        </form>
        <input type="hidden" name="type" id="type" value="2">
        <script>
        	function querenzhifu(fuwu_id){
        		//验证手机格式的正则表达是
        		var phoneReg=/^1[3-9]\d{9}$/;
        		
        		$("#fuwu_id").val(fuwu_id);
        		
        		var xingming = $("#nameN").val();
        		var dianhua = $("#telN").val();
        		var sheng = $("#s_province option:selected").val();
        		var shi = $("#s_city option:selected").val();
        		var qu = $("#s_county option:selected").val();
        		var detail=$("#xiang").val();
        		var beizhu=$("#bei").val();
        		var number=$(".num").text();
        		
				if(xingming==''){
					layer.tips('姓名不能为空', '#nameN', {
					  tips: [1, '#FF3E96'],
					  time: 4000
					});
					return;
				}
				if(!phoneReg.test(dianhua)){
					layer.tips('请正确输入手机号码', '#telN', {
					  tips: [1, '#FF3E96'],
					  time: 4000
					});
					return;
				}
				if(sheng=="请选择"){
					layer.tips('省不能为空', '#s_province', {
					  tips: [1, '#FF3E96'],
					  time: 4000
					});
					return;
				}
				if(shi=="请选择"){
					layer.tips('市不能为空', '#s_city', {
					  tips: [1, '#FF3E96'],
					  time: 4000
					});
					return;
				}
				if(qu=="请选择"){
					layer.tips('区不能为空', '#s_county', {
					  tips: [1, '#FF3E96'],
					  time: 4000
					});
					return;
				}
				if(detail==""){
					layer.tips('请输入详细地址', '#xiang', {
					  tips: [1, '#FF3E96'],
					  time: 4000
					});
					return;
				}
        		
				$("#xingming").val(xingming);
        		$("#dianhua").val(dianhua);
        		if(sheng==shi){
        			$("#dizhi").val(sheng+" "+qu+" "+detail);
        		}else{
        			$("#dizhi").val(sheng+" "+shi+" "+qu+" "+detail);
        		}
        		$("#beizhu").val(beizhu);
        		$("#number").val(number);
        		$("#WIDtotal_amount").val($("#price").html());
        		
        		$("#payForm").attr("action","api/pc_alipay/alipay.do");
    			$("#payForm").submit();
        		/*if($("#type").val()=="2"){//选择支付宝支付
        			$("#payForm").attr("action","api/pc_alipay/alipay.do");
        			$("#payForm").submit();
        		}else{
        			
        		}*/
        	}
        </script>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
</body>
<script type="text/javascript">
	var danjia=$("#danjia").val();
    $(".numChange>a").click(function(){
        $(this).css("background-color","#38c4ff");
        $(this).css("border","1px solid #38c4ff");
        $(this).css("color","#fff");
        $(this).siblings("a").css("background-color","#fcfcfc");
        $(this).siblings("a").css("border","1px solid #e5e5e5");
        $(this).siblings("a").css("color","#000");
    });
    $(".jia").click(function(){
        var n = $(".num").text();
        
        n++;
        $(".num").html(n);
        $("#price").html((n*danjia).toFixed(1));
    });
    $(".jian").click(function(){
        var n = $(".num").text();
        n--;
        $(".num").html(n);
        $("#price").html((n*danjia).toFixed(1));
        if(n<1){
            $(".num").html("1");
            $("#price").html(danjia);
        }
        
    });
    $(".smain02>.zhifu").click(function(){
        $(this).css("border","1px solid #38c4ff");
        $(this).siblings(".zhifu").css("border","1px solid #e5e5e5");
        $("#type").val($(this).attr("tid"));
    });
    $("#xnbcheckbox").click(function(){
    	if($("#xnbcheckbox").attr("checked")=="checked"){
    		$("#xnbcheckbox").attr("checked",false);
    		$("#price").html((parseFloat($("#price").html())+parseFloat($("#num1").html())).toFixed(1));
    	}else{
    		if(parseFloat($("#price").html())<=10){
    			$("#xnbcheckbox").attr("checked",false);
    			layer.msg("温馨提示,当前价格过低,无法使用虚拟币进行抵扣!",{
		            time:3000,//单位毫秒
		            shade: [0.8, '#393D49'], // 透明度  颜色
		            icon:5,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
		        });
    		}else{
    			$.ajax({
    				type:"post",
    				url:'api/order/getXuNiBiNumber.do',
    				data:{},
    				dataType:"json",
    				success:function(data){
    					if(parseFloat(data.xunibi)>=1){
            				$("#xnbcheckbox").attr("checked",true);
            				$("#price").html((parseFloat($("#price").html())-parseFloat($("#num1").html())).toFixed(1));
            			}else{
            				layer.msg("温馨提示,您的虚拟币不足,无法进行抵扣!",{
            		            time:3000,//单位毫秒
            		            shade: [0.8, '#393D49'], // 透明度  颜色
            		            icon:5,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
            		        });
            			}
    				},
    			});
    		}
    	}
    });
    $(function(){
    	var price = "${tempfuwu.price }";
    	price = parseFloat(price).toFixed(1);
    	$("#price").html(price);
    	if(parseFloat($("#price").html())<10){
 			//$("#dikou").css("display","none");
 			$("#num3").html("使用虚拟币进行抵扣");
 		}else{
 			$.ajax({
 				type:"post",
 				url:'api/order/getXuNiBiNumber.do',
 				data:{},
 				dataType:"json",
 				success:function(data){
 					if(parseFloat(data.xunibi)>=1){
 						var num = parseInt($("#price").html()*0.1);
 						if(parseFloat(data.xunibi)>=num){
 							$("#num1").html(num);
 							$("#num2").html(num);
 						}else{
 							$("#num1").html(data.xunibi);
 							$("#num2").html(data.xunibi);
 						}
         			}else{
         				//$("#dikou").css("display","none");
         				$("#num3").html("使用虚拟币进行抵扣");
         			}
 				},
 			});
 		}
    });
</script>
</html>