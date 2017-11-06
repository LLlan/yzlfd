<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
	<base href="<%=basePath%>">	
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/yahu.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/jquery-weui.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/weui.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/font-awesome.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/index.css"/>
    <script src="static/yibaoxuan/zywkehuduan/js/jquery-2.1.4.js"></script>
    <script src="static/yibaoxuan/zywkehuduan/js/fastclick.js"></script>
    <script src="static/yibaoxuan/zywkehuduan/js/jquery-weui.js"></script>
    <script src="static/yibaoxuan/layer/layer.js"></script>
    <title>立即支付</title>
</head>
<body >
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">确认订单</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main" style="margin-top: 50px;">
    <div class="price">
        <b>￥</b><span id="price">${pd.price }</span>
    </div>
    <p class="fangshi">选择支付方式</p>
    <div class="weixinZ" style="height: 60px;margin-bottom: 10px;">
        <p style="top: 7px;">
            <img src="static/yibaoxuan/zywkehuduan/images/weixin_03.png" alt=""/>
            <span style="top: 11px;font-size: 16px;">微信支付</span>
            <a class=" weui-cells_checkbox" style="top: 0;">
                <label class="weui-cell weui-check__label check1" for="s11">
                    <input type="checkbox" class="weui-check" name="checkbox1" id="s11" >
                    <i class="weui-icon-checked"></i>
                </label>
            </a>
        </p>
    </div>
    <div class="weixinZ" style="height: 60px;">
        <p style="top: 7px;">
            <img src="static/yibaoxuan/zywkehuduan/images/zfb.png" alt=""/>
            <span style="top: 11px;font-size: 16px;">支付宝支付</span>
            <a class=" weui-cells_checkbox" style="top: 0;">
                <label class="weui-cell weui-check__label check2" for="s12">
                    <input type="checkbox" class="weui-check" name="checkbox2" id="s12">
                    <i class="weui-icon-checked"></i>
                </label>
            </a>
        </p>
    </div>
    <div class="weixinZ" style="height: 45px;margin-top: 10px;" id="dikou">
        <p style="top: -2px;">
        	<img src="static/images/zyw/xunibi.png" alt=""/>
            <span style="top: 13px;font-size: 14px;left: 40px;" id="num3">使用<font id="num1"></font>个虚拟币抵扣<font id="num2"></font>元</span>
            <a class=" weui-cells_checkbox" style="top: 0;">
                <label class="weui-cell weui-check__label check3" for="s13">
                    <input type="checkbox" class="weui-check" name="checkbox3" id="s13">
                    <i class="weui-icon-checked"></i>
                </label>
            </a>
        </p>
    </div>
    <form action="" method="post" id="payForm">
    	<%--<input type="hidden" name="user_kuhu_id" id="user_kuhu_id" value="${kehuUser.user_kuhu_id }">--%>
    	<%-- 购买服务的主键ID --%>
    	<input type="hidden" name="fuwu_id" id="fuwu_id" value="${pd.fuwu_id }">
    	<%-- 订单编号 --%>
    	<input type="hidden" name="WIDout_trade_no" id="WIDout_trade_no">
    	<%-- 订单名称 --%>
    	<input type="hidden" name="WIDsubject" id="WIDsubject">
    	<%-- 付款金额 --%>
    	<input type="hidden" name="WIDtotal_fee" id="WIDtotal_fee" value="${pd.price}">
    	<%-- 商品展示网址 --%>
    	<input type="hidden" name="WIDshow_url" id="WIDshow_url" value="${pd.WIDshow_url }">
    	<%-- 商品描述 --%>
    	<input type="hidden" name="WIDbody" id="WIDbody">
    	<%-- 药商部分下单需要的数据 --%>
    	<input type="hidden" name="xingming" id="xingming" value="${pd.xingming }">
		<input type="hidden" name="dianhua" id="dianhua" value="${pd.dianhua }">
		<input type="hidden" name="dizhi" id="dizhi" value="${pd.dizhi }">
		<input type="hidden" name="beizhu" id="beizhu" value="${pd.beizhu }">
		<input type="hidden" name="number" id="number" value="${pd.number }">
		
		<%-- 使用虚拟币的数量 --%>
		<input type="hidden" name="xnbNum" id="xnbNum" value="0">
    </form>
    <div class="weui-btn-area">
        <a class="weui-btn weui-btn_yellow" id="conf" onclick="querenzhifu();">确认支付</a>
    </div>
</div>
<script>
	var browser = {
	    versions: function () {
	        var u = navigator.userAgent, app = navigator.appVersion;
	        return {         //移动终端浏览器版本信息
	            trident: u.indexOf('Trident') > -1, //IE内核
	            presto: u.indexOf('Presto') > -1, //opera内核
	            webKit: u.indexOf('AppleWebKit') > -1, //苹果、谷歌内核
	            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1, //火狐内核
	            mobile: !!u.match(/AppleWebKit.*Mobile.*/), //是否为移动终端
	            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/), //ios终端
	            android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1, //android终端或uc浏览器
	            iPhone: u.indexOf('iPhone') > -1, //是否为iPhone或者QQHD浏览器
	            iPad: u.indexOf('iPad') > -1, //是否iPad
	            webApp: u.indexOf('Safari') == -1 //是否web应该程序，没有头部与底部
	        };
	    }(),
	    language: (navigator.browserLanguage || navigator.language).toLowerCase()
	};
	//点击确认支付
	function querenzhifu(){
		$("#WIDtotal_fee").val($("#price").html());
		var user_id=$("#user_kuhu_id").val();
		//判断是否有选择支付方式
		if($(".check1 input").attr("checked")=="checked" || $(".check2 input").attr("checked")=="checked"){
			
			var xnbNum=0;
			//是否使用虚拟币
			if($(".check3 input").attr("checked")=="checked"){
				$("#xnbNum").val($("#num1").html());
				xnbNum=$("#num1").html();
			}
			
			//公共参数
			var vNow = new Date();
			var sNow = "";
			sNow += String(vNow.getFullYear());
			sNow += String(vNow.getMonth() + 1);
			sNow += String(vNow.getDate());
			sNow += String(vNow.getHours());
			sNow += String(vNow.getMinutes());
			sNow += String(vNow.getSeconds());
			sNow += String(vNow.getMilliseconds());
			//获取随机六位数
			for(var i=0;i<6;i++) 
			{ 
				sNow += Math.floor(Math.random()*10); 
			} 
			document.getElementById("WIDout_trade_no").value =  sNow;//订单编号
			document.getElementById("WIDsubject").value = "艺宝苑:购买产品";//body
			
			//判断是否是移动设备打开
			if (browser.versions.mobile) {//移动设备中打开
		        var ua = navigator.userAgent.toLowerCase();//获取判断用的对象
		        
		         var appid = "wx07df4a5caaf79650";
		    	 //参数
		    	 var fuwu_id=$("#fuwu_id").val();
		    	 var type=$("#type").val();
		    	 var WIDout_trade_no=$("#WIDout_trade_no").val();
		    	 var WIDtotal_fee=$("#WIDtotal_fee").val();
		    	 //药商参数
		    	 var xingming= $("#xingming").val();
            	 var dianhua= $("#dianhua").val();
            	 var dizhi= $("#dizhi").val();
            	 var beizhu= $("#beizhu").val();
            	 var number= $("#number").val();
            	 
		        if (ua.match(/MicroMessenger/i) == "micromessenger") {//在微信中打开
		        	if($(".check1 input").attr("checked")=="checked"){//选择微信支付
				    	//alert("微信浏览器中支持微信支付");
						var backUri = "http://www.0898yzzx.com/yzlfd/api/ybxWxpay/topay?fuwu_id="+fuwu_id+"&out_trade_no="+WIDout_trade_no+"&WIDtotal_fee="+WIDtotal_fee+"&xingming="+xingming+"&dianhua="+dianhua+"&dizhi="+dizhi+"&beizhu="+beizhu+"&number="+number;//这里要改成自己想回调的方法中去
						backUri = encodeURIComponent(backUri);
						console.log(backUri);
						
						var url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=" 
								+ appid +"&redirect_uri=" + backUri 
								+ "&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
						//scope 参数视各自需求而定，这里用scope=snsapi_base 不弹出授权页面直接授权目的只获取统一支付接口的openid,scope=snsapi_userinfo弹出授权页面
						window.location.href=url;
						
				    }else{//选择支付宝支付
				    	//alert("微信浏览器中不支持支付宝支付");引导客户用手机浏览器支付
				    	$("#payForm").attr("action","api/ybxAlipay/pay.do?num="+sNow);
				    	$("#payForm").submit();
				    }    
		        }else{//非微信内打开
		        	if($(".check1 input").attr("checked")=="checked"){//选择微信支付
		        		//alert("非微信浏览器不支持微信支付");
						//$("#payForm").attr("action","api/wxpay/topay1.do");
						//$("#payForm").submit();
						
		        		layer.alert("非微信浏览器进行微信支付功能还未开放!",{
				            title:"温馨提示"
				            ,anim: 0 
				            ,closeBtn: 1
				            ,btn: ['好的'] 
				            ,icon: 7 
				        });
		        		//$("#payForm").attr("action","api/wxpay/topay_saoma.do");
						//$("#payForm").submit();
				    }else{//选择支付宝支付
				    	//alert("非微信浏览器支持支付宝支付");
				    	$("#payForm").attr("action","api/ybxAlipay/alipay.do");
				    	$("#payForm").submit();
				    }  
		        }
			} else {//PC浏览器打开
			    if($(".check1 input").attr("checked")=="checked"){//选择微信支付
			    	//alert("PC不支持微信支付,请使用移动设备进行微信支付或选择支付宝支付");
			    	layer.alert("PC不支持微信支付,请使用移动设备进行微信支付或选择支付宝支付!",{
			            title:"温馨提示"
			            ,anim: 0 
			            ,closeBtn: 1
			            ,btn: ['好的'] 
			            ,icon: 7 
			        });	
			    	//扫码支付测试
					//$("#payForm").attr("action","api/wxpay/topay_saoma.do");
					//$("#payForm").submit();
			    }else{//选择支付宝支付
			    	//alert("PC支持支付宝支付");
			    	$("#payForm").attr("action","api/ybxAlipay/alipay.do");
			    	$("#payForm").submit();
			    }   
			}
		}else{
			layer.alert("请选择支付方式!",{
	            title:"温馨提示"
	            ,anim: 0 
	            ,closeBtn: 1
	            ,btn: ['好的'] 
	            ,icon: 7 
	        });			
		}
	}
    $(function () {
        FastClick.attach(document.body);
    });
</script>
<script>
    $(function(){
        $(".check1 input").click(function(){
        	if($(".check1 input").attr("checked")=="checked"){
        		$(".check1 input").attr("checked",false);
        		$("#payForm").attr("action","");
        	}else{
        		$(".check1 input").attr("checked",true);
                $(".check2 input").attr("checked",false);
        	}
        });
        $(".check2 input").click(function(){
        	if($(".check2 input").attr("checked")=="checked"){
        		$(".check2 input").attr("checked",false);
        		$("#payForm").attr("action","");
        	}else{
        		$(".check2 input").attr("checked",true);
                $(".check1 input").attr("checked",false);
        	}
        });
        $(".check3 input").click(function(){
        	if($(".check3 input").attr("checked")=="checked"){
        		$(".check3 input").attr("checked",false);
        		$("#price").html((parseFloat($("#price").html())+parseFloat($("#num1").html())).toFixed(1));
        	}else{
        		if(parseFloat($("#price").html())<10){
        			$(".check3 input").attr("checked",false);
        			layer.msg("温馨提示,当前价格低于10元,无法使用虚拟币进行抵扣!",{
    		            time:1500,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            icon:5,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		        });
        		}else{
        			$.ajax({
        				type:"post",
        				url:'api/ybxorder/getXuNiBiNumber.do',
        				data:{},
        				dataType:"json",
        				success:function(data){
        					if(parseFloat(data.xunibi)>=1){
                				$(".check3 input").attr("checked",true);
                				$("#price").html((parseFloat($("#price").html())-parseFloat($("#num1").html())).toFixed(1));
                			}else{
                				layer.msg("温馨提示,您的虚拟币不足,无法进行抵扣!",{
                		            time:1500,//单位毫秒
                		            shade: [0.8, '#393D49'], // 透明度  颜色
                		            icon:5,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
                		        });
                			}
        				},
        			});
        		}
        	}
        });
        if(parseFloat($("#price").html())<10){
			//$("#dikou").css("display","none");
			$("#num3").html("使用虚拟币进行抵扣");
		}else{
			$.ajax({
				type:"post",
				url:'api/ybxorder/getXuNiBiNumber.do',
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
</body>
</html>