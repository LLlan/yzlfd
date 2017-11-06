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
    <title>设置提现密码</title>
    <style>
        .bgSelected{
            background: url(static/zhaoyiwang/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back"><a href="javascript:history.go(-1)"></a></div>
    <div class="wy-header-title">设置提现密码</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="main">
    <form class="main_box">
    	<input type="hidden" name="phone" value="${phone }" id="phone">
    	<!--<input type="hidden" name="identity" value="${identity }" id="identity">-->
        <input type="password" placeholder="输入密码(6位数字)" maxlength="6" id="newPassword">
        <input type="password" placeholder="确认密码" maxlength="6" id="againPassword">
    </form>
    <div class="login"><a href="javascript:void(0)" onclick="wancheng();">完成</a></div>
    <!--  
    <div class="log-reg" style="margin-top:35px;">
        <span>
            <a href="javascript:void(0)" class="bor-right" id="toLogin">登录</a><span>|</span><a href="javascript:void(0)" id="toRegister">注册</a>
        </span>
    </div>
    -->
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script type="text/javascript">
	//点击完成操作
	function wancheng(){
		var payPassword=$("#newPassword").val();
		var againPassword=$("#againPassword").val();
		if(payPassword.length!=6 || isNaN(payPassword)){
			/*layer.tips('密码长度输入不正确,请重新输入6~20位密码', '#newPassword', {
	      		  tips: [1, '#D9006C'],
	      		  time: 3000
	      	});*/
			layer.open({
				content:'密码格式不正确'
				,skin:'msg'
				,time:2
			});
	 		return;
		}
		if(againPassword!=payPassword){
			layer.open({
				content:'确认密码输入错误'
				,skin:'msg'
				,time:2
			});
	 		return;
		}
		
		$.post('api/zywkehu/toPayPassword3.do',{phone:$("#phone").val(),payPassword:payPassword},function(data){
			if(data.respCode=='01'){
				layer.open({
					content:'提现密码修改成功'
					,skin:'msg'
					,time:1.5
				});
				setTimeout("window.location.href='api/zywkehu/myMoney.do'", 1500);
			}else{
				/*layer.alert("修改失败:该手机号尚未注册",{
		            title:"温馨提示"//提示标题，默认为：信息
		            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
		            ,anim: 0 //动画类型0-6，默认为：0
		            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
		            ,btn: ['退出','去注册'] //按钮
		            ,icon: 6    // icon
		            ,yes:function(){
		            	layer.closeAll();
		            }
		            ,btn2:function(){
		                
		            }
		        });*/
				layer.open({
				    content: '修改失败:该手机号尚未注册'
				    ,btn: ['去注册', '退出']
				    ,yes: function(index){
				    	window.location.href="api/shangHu/toRegister.do";
				    }
					,no:function(index){
						layer.close(index);
					}
				});
			}
		});
		//$("#myForm").submit();
	}
	//进入登录页面
	$("#toLogin").click(function(){
		   window.location.href='api/shangHu/toLogin.do';
	});
	//进入注册页面
	$("#toRegister").click(function(){
		   window.location.href='api/shangHu/toRegister.do';
	});
</script>
</body>
</html>