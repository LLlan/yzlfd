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
    <title>注册</title>
    <style>
        .bgSelected{
            background: url(static/yibaoxuan/zywkehuduan/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
        .zcsh{
        	margin-top: 8px;
        	
        }
        .zcsh>a{
        	font-size: 14px;
        	text-decoration: underline;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header"  style="width:100%;position: fixed;left:0;top:0;">
    <div class="wy-header-icon-back"><a href="javascript:history.go(-1)"></a></div>
    <div class="wy-header-title">注册</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="main">
    <form class="main_box" id="subForm" >
        <input type="text" placeholder="用户名" id="userName" name="userName">
        <input type="password" placeholder="设置密码" id="password" name="password">
        <input type="password" placeholder="确认密码" id="password2" name="password2">
        <input type="number" placeholder="手机号" name="phone" id="phone" maxlength="11">
        <input type="button" value="获取验证码" class="yanzheng"  onclick="clickButton(this)"/>
        <input type="text" placeholder="短信验证码" name="yzm" id="yzm">
        <!-- 服务器返回的验证码 -->
        <input type="hidden"  name="fhyzm" id="fhyzm">
    
    <!--<div class="visitor">
        <span class="danxuan bgSelected"></span>
        <span style="margin-left:1%;">游客</span>
        <span  class="danxuan shanghu" style="margin-left:6%;"></span>
        <span style="margin-left:1%;">商户</span>
    </div>
    <div class="visitor shangX" style="display: none;">
        <span class="danxuan bgSelected"></span>
        <span style="margin-left:1%">医生</span>
        <span  class="danxuan" style="margin-left:6%"></span>
        <span style="margin-left:1%">药商</span>
        <span  class="danxuan" style="margin-left:6%;"></span>
        <span style="margin-left:1%;">机械</span>
        <span  class="danxuan" style="margin-left:6%;"></span>
        <span style="margin-left:1%;">机构</span>
    </div>-->
    <div class="login"><a href="javascript:void(0)" onclick="Register()">注册</a></div>
  <!--   <div class="zcsh" align="right"><a href="api/zywkehu/toLogin.do" class="bor-right">注册成为商户</a></div>
        -->
   <!--  <div class="log-reg" style="margin-top:15px;">
        <span>
            <a href="api/shangHu/toRegister.do" class="bor-right">注册成为商户</a>
        </span>
    </div> -->
    </form>
</div>
<!--主体结束-->
<script src="static/yibaoxuan/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/yibaoxuan/layer/layer.js"></script>
<script type="text/javascript">
	var phoneReg=/^1[3-9]\d{9}$/;
    function clickButton(obj){
    //电话号码不能为空
        if($("#phone").val()!=""&&phoneReg.test($("#phone").val())){
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
		             url: "api/ybxkehu/sendMSM.do",
		             data: {phone:$("#phone").val()},
		             dataType: "json",
		             success: function(data){
			             //	将返回的验证码赋到隐藏域中，用于注册带过去
			                       $("#fhyzm").val(data.yanzhengma);
			                       console.log(data.yanzhengma)
		           			 
		              }
		         });
	    
        }else{
        		 layer.alert("手机号码格式不正确",{
			            title:"温馨提示"//提示标题，默认为：信息
			            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
			            ,anim: 0 //动画类型0-6，默认为：0
			            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
			            ,btn: ['确定'] //按钮
			            ,icon: 6    // icon
		          
       				 });
        }
     
    }
    
    
    
    $(".danxuan").click(function(){
        $(this).addClass("bgSelected");
        $(this).siblings(".danxuan").removeClass("bgSelected");
        if($(".shanghu").hasClass("bgSelected")){
            $(".shangX").css("display","block");
        }else{
            $(".shangX").css("display","none");
        }
    });
    
    //注册
    function Register(){
    	//var form = new FormData(document.getElementById("subForm"));
    		if($("#yzm").val()!=$("#fhyzm").val()){
    			 layer.msg("验证码输入错误！",{
   		            time:1500,//单位毫秒
   		            shade: [0.8, '#393D49'], // 透明度  颜色
   		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
   		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
   		        });
   		        
    		}else if($("#password").val()!=$("#password2").val()){
    		       /*/  layer.alert("两次密码输入不一致",{
			            title:"温馨提示"//提示标题，默认为：信息
			            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
			            ,anim: 0 //动画类型0-6，默认为：0
			            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
			            ,btn: ['确定'] //按钮
			            ,icon: 6    // icon
		          
       				 });*/
       				 var password2 = $("#password2");
			   		 layer.tips('两次密码输入不一致', '#password2', {
			     		  tips: [1, '#D9006C'],
			     		  time: 2000
			     	});
			     	return;
    		}else{
    			var userName = $("#userName").val();
    			var password = $("#password").val();
    			var phone = $("#phone").val();
   			   //判断用户名是否合法
			   if(!isNaN(userName) || userName.length>20 || userName.length<0 || userName==''){
				   layer.tips('请注意用户名格式:不能为空、不能全为数字、长度0-20', '#userName', {
			     		  tips: [1, '#D9006C'],
			     		  time: 3000
			     	});
					return;
			   }
			 
			   if(password==''){
			   		 layer.tips('密码不能为空', '#password', {
			     		  tips: [1, '#D9006C'],
			     		  time: 2000
			     	});
			     	return;
			   }
			     if(phone==''){
			   		 layer.tips('手机号码不能为空', '#phone', {
			     		  tips: [1, '#D9006C'],
			     		  time: 2000
			     	});
			     	return;
			   }
    		
	          $.ajax({
	                url:"api/ybxkehu/register.do",
	                type:"post",
	                data:{userName:$("#userName").val(),
	                	  password:$("#password").val(),
	                	  phone:$("#phone").val(),
	                	  yzm:$("#yzm").val(),
	                	  fhyzm:$("#fhyzm").val()},
	                success:function(data){
	                	if(data.respCode=="01"){
	                		 layer.msg("注册成功！",{
			    		            time:1500,//单位毫秒
			    		            shade: [0.8, '#393D49'], // 透明度  颜色
			    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
			    		            icon:1,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
			    		        });
	                     		setTimeout( function(){
			    		        	 window.location.href="api/ybxkehu/toLogin.do";
			    		        },1500);
	                	}else{
	                		layer.msg("注册失败！"+data.respMsg,{
			    		            time:1500,//单位毫秒
			    		            shade: [0.8, '#393D49'], // 透明度  颜色
			    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
			    		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
			    		        });
	                	}
	                    
	                },
	                error:function(e){
	                    alert("错误！！");
	                    //window.clearInterval(timer);
	                }
	            }); //ajax end
	            
	        }//else end
    }
    
    
   /* $(".danxuan").click(function(){
        if($(this).hasClass("bgSelected")){
            $(this).removeClass("bgSelected");
        }else{
            $(this).addClass("bgSelected");
        }
    })*/
</script>
</body>
</html>