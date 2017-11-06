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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">

    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/lib/weui.min.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/lvjuyanglao/zywkehuduan/css/login.css">
    <title>找回密码</title>
    <style>
        .bgSelected{
            background: url(static/lvjuyanglao/zywkehuduan/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header"  style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back"><a href="javascript:history.go(-1)"></a></div>
    <div class="wy-header-title">找回密码</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="main">
    <form class="main_box" id="form">
        <input type="number" id="phone" placeholder="手机号" name="phone">
        <input type="button" value="获取验证码" class="yanzheng"  onclick="clickButton(this)" style="top:0;"/>
        <input type="text" placeholder="短信验证码" id="yzm" name="yzm">
        <input type="hidden" id="fhyzm" name="fhyzm">
    </form>
    <div class="login"><a href="javascript:void(0)" onclick="validate()">验证</a></div>
    <!-- <div class="log-reg" style="margin-top:35px;">
        <span>
            <a href="login.html" class="bor-right">登录</a><span>|</span><a href="register.html">注册</a>
        </span>
    </div> -->
</div>
<!--主体结束-->
<script src="static/lvjuyanglao/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/lvjuyanglao/layer/layer.js"></script>
<script type="text/javascript">
    function clickButton(obj){
    if($("#phone")!=""){
        var obj = $(obj);
        obj.attr("disabled","disabled");/*按钮倒计时*/
        var time = 60;
        var set=setInterval(function(){
            obj.val(--time+"(s)");
        }, 1000);/*等待时间*/
        setTimeout(function(){
            obj.attr("disabled",false).val("重新获取");/*倒计时*/
            clearInterval(set);
        }, 60000);
	            //请求获取验证码
		          $.ajax({
		             type: "post",
		             url: "api/ljylkehu/sendMSM.do",
		             data: {phone:$("#phone").val()},
		             dataType: "json",
		             success: function(data){
			             //	将返回的验证码赋到隐藏域中，用于注册带过去
			                       $("#fhyzm").val(data.yanzhengma);
			                       console.log(data.yanzhengma)
		           			 
		              }
		         });
	         }else{
	         	layer.alert("电话号码不能为空",{
			            title:"温馨提示"//提示标题，默认为：信息
			            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
			            ,anim: 0 //动画类型0-6，默认为：0
			            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
			            ,btn: ['确定'] //按钮
			            ,icon: 6    // icon
		          
       			});
	         }
    }
    
    
    function validate(){
    	if($("#yzm").val()!=$("#fhyzm").val()){
    			 layer.msg("验证码输入不正确",{
    		            time:1500,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
    		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		        }); 
    	}else{
    		location.href="api/ljylkehu/xinmima.do?phone="+$("#phone").val();
    	}
    }
</script>
</body>
</html>