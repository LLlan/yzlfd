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

    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/lib/weui.min.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/login.css">
    <link rel="stylesheet" href="static/js/wangyiIM/dist/css/theme.css">


    <title>登录</title>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back"><a href="javascript:history.go(-1)"></a></div>
    <div class="wy-header-title">登录</div>
</div>
<!--头部结束-->
<!--主体开始-->
   <div class="main">
    <form class="main_box">
        <input type="text" placeholder="用户名或手机号" name="userName" id="userName">
        <input type="password" placeholder="输入密码" name="password" id="password">
        <input type="hidden"  id="dc_id">
     
     </form>
     
    <div class="forget"><a href="api/ybxkehu/wangjimima.do" style="text-decoration: underline;">忘记密码？</a></div>
    <div class="login"><a href="javascript:void(0)"id="wylg">登录</a></div>
   	<!-- <button type="button" class="btn btn-login" @click="login" id="wylg">登录</button> -->
    <div class="log-reg">
        <span>
           <span>
           </span><a href="api/ybxkehu/toRegister.do" style="font-size: 14px;">没有账号？去注册</a>
            <!-- <a href="api/shangHu/toRegister.do" class="bor-right" style="text-decoration: underline;font-size: 14px;">注册成为商户</a> -->
    </div>
        </span>
    </div>
</div>
<!-- IM -->  
   <!-- <div class="g-window">
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
            <button type="button" class="btn btn-login" @click="login" id="wylg">登录</button>
            <button type="button" class="btn btn-regist" @click="regist">注册</button>
          </div>
        </div>
      </div>
    </div> -->   

<script src="static/js/wangyiIM/dist/js/login.js"></script>
<script src="static/yibaoxuan/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/yibaoxuan/layer/layer.js"></script>
<!--主体结束-->
<script type="text/javascript">
	$(function(){
		var twoDimensioncode_id = "${pd.twoDimensioncode_id}";
		$("#dc_id").val(twoDimensioncode_id);
	});
	
	
	$("#wylg").click(function(){
		//alert(22)
		//console.log()
		//$("#userName").val($("#tuerName").val());
		//$("#password").val($("#tpassword").val());
		checkLogin();
	});


	//检查服务器验证登录
		function checkLogin(){
	          $.ajax({
	             type: "post",
	             url: "api/ybxkehu/login.do",
	             data: {userName:$("#userName").val(),password:$("#password").val(),twoDimensioncode_id:$("#dc_id").val()},
	             dataType: "json",
	             success: function(data){
	           		if(data.respCode=="01"){
	           			location.href="api/ybxkehu/index.do?tag=1&twoDimensioncode_id="+data.twoDimensioncode_id;
	           		}else if(data.respCode=="02"){
	           			 layer.msg("该用户未注册！请先去注册。",{
	    		            time:1800,//单位毫秒
	    		            shade: [0.8, '#393D49'], // 透明度  颜色
	    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
	    		            icon:5,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		       		 }) ;
	           		}
	           		else{
	           			/* layer.msg("登录失败，用户名或密码错误",{
    		            time:3000,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
    		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		       		 }) */
    		       		 layer.alert("登录失败，用户名或密码错误",{
				            title:"温馨提示"//提示标题，默认为：信息
				            //,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
				            ,anim: 0 //动画类型0-6，默认为：0
				            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
				            ,btn: ['确定'] //按钮
				            ,icon: 2    // icon
		          
       					 });
	           		}
	           	
	              }
	         })
		}

</script>
</body>
</html>