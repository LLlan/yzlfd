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

    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">
    <script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/layer/layer.js"></script>
    <title>设置新密码</title>
    <style>
        .bgSelected{
            background: url(static/zhaoyiwang/zywkehuduan/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back"><a href="javascript:history.go(-1)"></a></div>
    <div class="wy-header-title">设置新密码</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="main">
    <form class="main_box"  id="subForm">
        <input type="password" placeholder="新密码"  name="newPassword">
        <input type="password" placeholder="确认密码" name="newPassword2">
        <input type="hidden" id="phone" name="phone" >
    </form>
    <div class="login"><a href="javascript:void(0)" onclick="wancheng()">完成</a></div>
    <div class="log-reg" style="margin-top:35px;">
   <!--      <span>
            <a href="login.html" class="bor-right">登录</a><span>|</span><a href="register.html">注册</a>
        </span> -->
    </div>
</div>
<!--主体结束-->

<script type="text/javascript">
	$(function(){
	//带参赋值
		var phone = "${pd.phone}";
		$("#phone").val(phone);
	});
	
	function wancheng(){
		var form  = $("#subForm").serialize();
				var url = "api/zywkehu/updatePassword.do";
					$.ajax({
						url: url,
						type: "post",
						data:form,
      					dataType:'json',
 						success:function(data){
 							if(data.respCode=="01"){
 								 layer.msg("密码修改成功！",{
			    		            time:1500,//单位毫秒
			    		            shade: [0.8, '#393D49'], // 透明度  颜色
			    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
			    		            icon:1,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
			    		        });
			    		        setTimeout( function(){
			    		        	 window.location.href="api/zywkehu/toLogin.do";
			    		        },1500);
			    		       
 							}
 					
						},
						error:function(){
							
						},
					}); 
	}
</script>
</body>
</html>