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
    
     <link rel="stylesheet" href="static/js/wangyiIM/dist/css/theme.css">
    <title>登录</title>
</head>
<style>
    .bgSelected{
        background: url(static/lvjuyanglao/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
    }
      .mask{
			  position:fixed;z-index:600;left:0;top:0;width:100%;height:100%;background:rgba(0,0,0,0.5)
			}
</style>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back"><a href="javascript:history.go(-1)"></a></div>
    <div class="wy-header-title">登录</div>
</div>
<!--头部结束-->
<!--主体开始-->
   <div class="main">
    <form class="main_box">
    	<input type="hidden" id="identity" name="identity" value="1">
        <input type="text" placeholder="用户名或手机号" name="loginName" id="loginName">
        <input type="password" placeholder="输入密码" name="loginPassword" id="loginPassword">
    </form>
    
    <div class="visitor shangX" style="display: block;">
        <%--<span class="danxuan bgSelected" title="1"></span>
        <span style="margin-left:1%">医生</span>
   		<span class="danxuan" style="margin-left:6%;" title="2"></span>
        <span style="margin-left:1%;">机构</span>
        <span class="danxuan" style="margin-left:6%" title="3"></span>
        <span style="margin-left:1%">药商</span>--%>
    </div>
    
   	<div class="forget" style="float: right;margin: -21px 13px 0 0px;"><a href="javascript:void(0)" onclick="toMissPassword();">忘记密码？</a></div>
    <div class="login" id="login"><a href="javascript:void(0)">登录</a></div>
    <div class="log-reg">
        <span>
            <a href="javascript:void(0)" class="bor-right" id="toLogin">登录</a><span>|</span><a href="javascript:void(0)" id="toRegister">注册</a>
        </span>
    </div>
</div>
<!--主体结束-->
<script src="static/js/wangyiIM/dist/js/login.js"></script>
<script src="static/lvjuyanglao/js/jquery-2.1.4.js"></script>
<script src="static/lvjuyanglao/layer/layer.js"></script>
<script type="text/javascript">
$(".danxuan").click(function(){
    $(this).addClass("bgSelected");
    $(this).siblings(".danxuan").removeClass("bgSelected");
    $("#identity").val($(this).attr("title"));
});

$(function(){
	//abc();
})
	/* function abc(e1){
		$(e1).addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
	} */

$("#wylg").click(function(){
	$("#tuerName").val($("#loginName").val());
	$("#tpassword").val($("#loginName").val());
	console.log(1465614164)
})

      
	//登录
	$("#login").click(function(){
		console.log(2222222222);
		
		 
		//$("#wylg").click();
		var identity=$("#identity").val();//身份
		var loginName=$("#loginName").val();
		var loginPassword=$("#loginPassword").val();
		if(loginName==""){
			layer.tips('登录名不能为空', '#loginName', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
		}
		if(loginPassword==""){
			layer.tips('密码不能为空', '#loginPassword', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
		}
		$.ajax({
    		type:"post",
    		url:"api/ljylshangHu/login.do",
    		data:{
    			"loginName":loginName,
    			"loginPassword":loginPassword,
    			"identity":identity
    		},
    		dataType:"json",
    		success:function(data){
    			if(data.respCode=='01'){
    				$.post('api/ljylshangHu/isPerfectPersonInformation.do',{},function(date){
    					if(date.respCode=="00"){
    						layer.confirm('您的个人信息还未完善,点击确定去完善信息', {
    			                btn: ['确定'],
    			                title:'温馨提示',
    			            	},function () {
    			            		window.location.href='api/ljylshangHu/toPersonCenterSetting.do';
    			            	}
    			        	);
    					}else{
    						$.post('api/ljylshangHu/isStateApplyStore.do',{},function(datb){
    							if(datb.respCode=="01" || datb.respCode=="02"){
    								window.location.href='api/ljylshangHu/toPersonCenter.do';
    							}else if(datb.respCode=="00"){
    								layer.confirm('您的申请已被拒绝,点击确定重新提交申请材料', {
    	    			                btn: ['确定'],
    	    			                title:'温馨提示',
    	    			            	},function () {
    	    			            		window.location.href='api/ljylshangHu/toPersonApplyStore.do';
    	    			            	}
    	    			        	);
    							}else{
    								layer.confirm('您还未提交开店申请材料,点击确定去提交申请材料', {
    	    			                btn: ['确定'],
    	    			                title:'温馨提示',
    	    			            	},function () {
    	    			            		window.location.href='api/ljylshangHu/toPersonApplyStore.do';
    	    			            	}
    	    			        	);
    							}
    						})
    					}
    				})
    			}else{
    				layer.msg("登录失败："+data.respMsg,{
    		            time:2000,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
    		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		        })
    				//console.log(data.respMsg);
    			}
    		}
    	}) 
	});
	//进入登录页面
	$("#toLogin").click(function(){
		   window.location.href='api/ljylshangHu/toLogin.do';
	});
	//进入注册页面
	$("#toRegister").click(function(){
		   window.location.href='api/ljylshangHu/toRegister.do';
	});
	//点击忘记密码
	function toMissPassword(){
		window.location.href="api/ljylshangHu/toLoginMissPassword1.do";
	}
</script>
</body>
</html>