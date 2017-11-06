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
        <input type="number" placeholder="手机号" name="phone" id="phone">
        <input type="button" value="获取验证码" class="yanzheng"  onclick="clickButton(this)"/>
        <input type="text" placeholder="短信验证码" name="yzm" id="yzm">
        <!-- 服务器返回的验证码 -->
        <input type="hidden"  name="fhyzm" id="fhyzm">
        <input type="hidden"  name="twoDimensioncode_id" id="twoDimensioncode_id">
        <input type="hidden"  name="type" id="type">
    
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
   <!--  <div class="log-reg" style="margin-top:35px;">
        <span>
            <a href="api/ybxkehu/toLogin.do" class="bor-right">登录</a><span>|</span><a href="register.html">注册</a>
        </span>
    </div> -->
    </form>
</div>
<!--主体结束-->
<script src="static/yibaoxuan/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/yibaoxuan/layer/layer.js"></script>
<script type="text/javascript">
    function clickButton(obj){
    //电话号码不能为空
        if($("#phone").val()!=""){
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
    			/* layer.msg("两次密码输入不一致：",{
    		            time:3000,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
    		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		        }) */
    		         layer.alert("两次密码输入不一致",{
			            title:"温馨提示"//提示标题，默认为：信息
			            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
			            ,anim: 0 //动画类型0-6，默认为：0
			            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
			            ,btn: ['确定'] //按钮
			            ,icon: 6    // icon
		          
       				 });
    		}else{
	          $.ajax({
	                url:"api/ybxkehu/ew_register.do",
	                type:"post",
	                data:{userName:$("#userName").val(),
	                	  password:$("#password").val(),
	                	  phone:$("#phone").val(),
	                	  yzm:$("#yzm").val(),
	                	  fhyzm:$("#fhyzm").val(),
	                	  twoDimensioncode_id:$("#twoDimensioncode_id").val(),
	                	  type:$("#type").val()
	                	  },
	                success:function(data){
	                	if(data.respCode=="01"){
	                		 layer.msg("注册成功！",{
			    		            time:1500,//单位毫秒
			    		            shade: [0.8, '#393D49'], // 透明度  颜色
			    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
			    		            icon:1,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
			    		        });
	                     		setTimeout( function(){
			    		        	 window.location.href="api/ybxkehu/toLogin.do?twoDimensioncode_id="+data.twoDimensioncode_id;
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
    
    $(function(){
   	 	var tid = "${pd.twoDimensioncode_id}";
    	$("#twoDimensioncode_id").val(tid);
    	//将类型值赋值到指定隐藏域
    	$("#type").val("${pd.type}");
    })
</script>
</body>
</html>