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
    
    <link rel="stylesheet" href="static/js/wangyiIM/dist/css/theme.css">
    <title>登录</title>
</head>
<style>
    .bgSelected{
        background: url(static/zhaoyiwang/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
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
    	<!--<input type="hidden" id="identity" name="identity" value="1">-->
        <input type="text" placeholder="用户名或手机号" name="loginName" id="loginName">
        <input type="password" placeholder="输入密码" name="loginPassword" id="loginPassword">
    </form>
    <div class="visitor shangX" style="display: block;">
    	<!--  
        <span class="danxuan bgSelected" title="1"></span>
        <span style="margin-left:1%">医生</span>
   		<span class="danxuan" style="margin-left:6%;" title="2"></span>
        <span style="margin-left:1%;">机构</span>
        <span class="danxuan" style="margin-left:6%" title="3"></span>
        <span style="margin-left:1%">药商</span>
        -->
    </div>
   	<div class="forget" style="float: right;margin: -21px 13px 0 0px;"><a href="javascript:void(0)" onclick="toMissPassword();">忘记密码？</a></div>
    <div class="login" id="login"><a href="javascript:void(0)">登录</a></div>
    <div class="log-reg">
        <span>
            <a href="javascript:void(0)" class="bor-right" id="toLogin">登录</a><span>|</span><a href="javascript:void(0)" id="toRegister">注册</a>
        </span>
    </div>
</div>

<!-- IM -->  
     <!--  <div class="g-window">
      <div class="g-inherit m-album">
        <div id="form-data" class="g-center m-login" style="display:none">
          <div class="cells">
            <img class="logo" :src="logo">
          </div>
          <div class="cells">
            <div class="cell">
              <span class="icon icon-account"></span>
              <input type="text" class="ipt ipt-account" maxlength="20" id="tuerName" v-model="account" placeholder="请输入帐号"/>
            </div>
            <div class="cell">
              <span class="icon icon-pwd"></span>
              <input type="password" class="ipt ipt-account" maxlength="120" id="tpassword" v-model="password" placeholder="请输入密码"/>
            </div>
          </div>
          <div class="cells">
            <div v-show="errorMsg" class="error">{{errorMsg}}</div>
          </div>
           <input type="text" placeholder="用户名" name="userName" id="userName">
        	<input type="password" placeholder="输入密码" name="password" id="password">
          <div class="cells">
            <button type="button" class="btn btn-login" @click="login">登录</button>
            <button type="button" class="btn btn-regist" @click="regist">注册</button>
          </div>
        </div>
      </div>
    </div>  -->
<!-- 弹窗提示 begin -->
<!-- <div class="mask" style="display: none;"></div>
<div class="weui-cells2" style="display:none;width:73%;height:135px;position: fixed;top:220px;left:13%;background-color: #fff;z-index: 99999;border-radius: 5px;">
  <div id="xiazai2" style="padding: 15px 20px;border-bottom: 1px solid #eee;text-align: center;height:79px;line-height: 79px">
    	您还没有登录，马上去？
  </div>
    <div id="form-data" class="g-center m-login" style="display:block">
     	<input type="text" class="ipt ipt-account" maxlength="20" id="tuerName" v-model="account" value="111111"  placeholder="请输入帐号"/>
      	<input type="text" class="ipt ipt-account" maxlength="120" id="tpassword" v-model="password"  placeholder="请输入密码"/>
  	<div id="quxiao2" style="color: #000;width: 100%;height:56px;line-height:56px;text-align: center;">
    	<p class="cancel"> <button type="button" class="btn btn-login"  onclick="login()" id="wylg">确定</button></p>
  	</div>
   </div>
</div> -->


<!--主体结束-->
<script src="static/js/wangyiIM/dist/js/login.js"></script>
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
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
		var loginName=$("#loginName").val();
		var loginPassword=$("#loginPassword").val();
		if(loginName==""){
	     	layer.open({
	     	    content: '登录名不能为空'
	     	    ,skin: 'msg'
	     	    ,time: 2 //2秒后自动关闭
	     	});
			return;
		}
		if(loginPassword==""){
			layer.open({
	     	    content: '密码不能为空'
	     	    ,skin: 'msg'
	     	    ,time: 2 //2秒后自动关闭
	     	});
			return;
		}
		$.ajax({
    		type:"post",
    		url:"api/shangHu/login.do",
    		data:{
    			"loginName":loginName,
    			"loginPassword":loginPassword
    			//"identity":identity
    		},
    		dataType:"json",
    		success:function(data){
    			if(data.respCode=='01'){
    				layer.open({
    		     	    content: '登录成功'
    		     	    ,skin: 'msg'
    		     	    ,time: 0.5 //3秒后自动关闭
    		     	});
    				
    				setTimeout("window.location.href='api/shangHu/toTransfer.do'", 500);
    				/*$.post('api/shangHu/isPerfectPersonInformation.do',{},function(date){
    					if(date.respCode=="00"){
    						//询问框
    						layer.open({
    						    content: '您的个人信息还未完善,点击确定去完善信息'
    						    ,btn: ['确定', '退出']
    						    ,yes: function(index){
    						    	window.location.href='api/shangHu/toPersonCenterSetting.do';
    						    }
    							,no:function(index){
    								layer.close(index);
    							}
    						});
    					}else{
    						$.post('api/shangHu/isStateApplyStore.do',{},function(datb){
    							if(datb.respCode=="01" || datb.respCode=="02"){
    								window.location.href='api/shangHu/toPersonCenter.do';
    							}else if(datb.respCode=="00"){
    								layer.open({
    	    						    content: '您的申请已被拒绝,点击确定重新提交申请材料'
    	    						    ,btn: ['确定', '退出']
    	    						    ,yes: function(index){
    	    						    	window.location.href='api/shangHu/toPersonApplyStore.do';
    	    						    }
    	    							,no:function(index){
    	    								layer.close(index);
    	    							}
    	    						});
    							}else{
    								layer.open({
    	    						    content: '您还未提交开店申请材料,点击确定去提交申请材料'
    	    						    ,btn: ['确定', '退出']
    	    						    ,yes: function(index){
    	    						    	window.location.href='api/shangHu/toPersonApplyStore.do';
    	    						    }
    	    							,no:function(index){
    	    								layer.close(index);
    	    							}
    	    						});
    							}
    						});
    					}
    				});*/
    			}else{
    				/*layer.msg("登录失败："+data.respMsg,{
    		            time:2000,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
    		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		        });*/
    				layer.open({
    		     	    content: data.respMsg
    		     	    ,skin: 'msg'
    		     	    ,time: 3 //3秒后自动关闭
    		     	});
    			}
    		}
    	});
	});
	//进入登录页面
	$("#toLogin").click(function(){
		   window.location.href='api/shangHu/toLogin.do';
	});
	//进入注册页面
	$("#toRegister").click(function(){
		   window.location.href='api/shangHu/toRegister.do';
	});
	//点击忘记密码
	function toMissPassword(){
		window.location.href="api/shangHu/toLoginMissPassword1.do";
	}
</script>
</body>
</html>