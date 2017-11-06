<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/login.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>登录</title>
    <style>
        .logoBox>p{
            width:84%;height:40px;line-height: 40px;position: absolute;left:210px;top:25px;;;color:#000;font-size: 22px;
            border-left:1px solid #000;padding-left:20px;
        }
        .logoBox>p>a{
            color:#000;font-size: 14px;float:right;margin-right:40px;;
        }
        a {
            text-decoration: none;
            color: #7f7f7f;
        }
        .bgSelected{
            background: url(static/images/zyw/select01.png) no-repeat;background-size: 15px 15px;border:none;
        }
        .visitor {
		    width: 100%;
		    height: 24px;
		    line-height: 24px;
		    font-size: 16px;
		    overflow: hidden;
		    margin-top: 10px;
		    float: left;
		    cursor: pointer;
		    margin-left: 66px;
		}
		.danxuan, .duoxuan {
		    display: block;
		    width: 15px;
		    height: 15px;
		    border: 1px solid #c1c1c1;
		    border-radius: 5px;
		}
		.visitor>span {
		    float: left;
		}
		
		
		
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<div class="logo">
    <div class="logoBox" style="padding-top: 0px;">
        <a href="<%=basePath %>api/keHuPc/index.do"><img src="static/images/zyw/logo.jpg" alt="" width="160px" height="80px"/></a>
        <p>商户登录 <a href="javascript:void(0)" style="color: #38c4ff;">商户端登录</a><a href="<%=basePath %>api/keHuPc/toLogin.do">客户端登录</a><a href="<%=basePath %>api/keHuPc/index.do">返回首页</a></p>
    </div>
</div>
<div class="banBack" style="background: url(static/images/zyw/sloginimg.jpg) no-repeat;">
    <div class="banner">
        <div class="loginBox">
            <p><img src="static/images/zyw/stou.png" alt=""/></p>
            <span style="margin-left: 66px;color: red;" id="errorMsg"></span>
            <p class="user" style="margin-top: 5px;"><a href="javascript:void(0)"><img src="static/images/zyw/user1.png" alt=""/></a><input type="text" placeholder="用户名/手机号" name="userName" id="userName"/></p>
            <p class="pass"><a href="javascript:void(0)"><img src="static/images/zyw/pass1.png" alt=""/></a><input type="password" placeholder="密码" name="password" id="password"/></p>
            <div class="visitor shangX" style="display: block;">
            	<input type="hidden" id="identity" name="identity" value="1">
                <span class="danxuan bgSelected" tid="1"></span>
                <span style="margin-left:2%;margin-top: -4px;color: #000;">医生</span>
                <span  class="danxuan" style="margin-left:6%" tid="2"></span>
                <span style="margin-left:2%;margin-top: -4px;color: #000;">机构</span>
                <span  class="danxuan" style="margin-left:6%;" tid="3"></span>
                <span style="margin-left:2%;margin-top: -4px;color: #000;">药商</span>
            </div>
            <p class="rem"><input type="checkbox" id="saveid" onclick="savePaw();"/><label for="rem">两周内自动登录</label>
            <a href="<%=basePath %>api/keHuPc/towangjimima1.do" class="red">忘记密码</a><a href="<%=basePath %>api/keHuPc/toRegister1.do">注册</a></p>
            <a href="javascript:void(0)" class="login" onclick="checkLogin();">登录</a>
        </div>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script>
	$(document).keyup(function(event) {
		if (event.keyCode == 13) {
			$(".login").trigger("click");
		}
	});
</script>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script src="static/js/zyw/jquery.cookie.js"></script>
<script>
	//登录
	function checkLogin(){
		var identity=$("#identity").val();//身份
		if($("#userName").val()==""){
			layer.tips('登录名不能为空', '#userName', {
      		  tips: [1, '#FF3E96'],
      		  time: 3000
      		});
			return;
		}
		if($("#password").val()==""){
			layer.tips('密码不能为空', '#password', {
      		  tips: [1, '#FF3E96'],
      		  time: 3000
      		});
			return;
		}
        $.ajax({
           type: "post",
           url: "api/shangHu/login.do",
           data: {
        	   loginName:$("#userName").val(),
        	   loginPassword:$("#password").val(),
        	   identity:identity
           },
           dataType: "json",
           success:function(data){
   			if(data.respCode=='01'){
   				saveCookie();
   				$.post('api/shangHu/isPerfectPersonInformation.do',{},function(date){
   					if(date.respCode=="00"){
    					layer.alert(date.respMsg,{
    			            title:"温馨提示"//提示标题，默认为：信息
    			            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
    			            ,anim: 0 //动画类型0-6，默认为：0
    			            ,closeBtn: 0//是否显示关闭按钮，0-不显示，1-显示，默认为1
    			            ,btn: ['暂不完善','确定'] //按钮
    			            ,icon: 6    // icon
    			            , yes:function(){
    			        	    window.location.href='api/keHuPc/index.do';
    			            }
	    					, btn2:function(){
				            	window.location.href='api/keHuPc/personInformation.do';
						    }
    			        });
    				}else{
    					$.post('api/shangHu/isStateApplyStore.do',{},function(data){
    	    				if(data.respCode=="00" || data.respCode=="03"){
    	    					layer.alert(data.respMsgPc,{
    	    			            title:"温馨提示"//提示标题，默认为：信息
    	    			            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
    	    			            ,anim: 0 //动画类型0-6，默认为：0
    	    			            ,closeBtn: 0//是否显示关闭按钮，0-不显示，1-显示，默认为1
    	    			            ,btn: ['暂不认证','确定'] //按钮
    	    			            ,icon: 6    // icon
    	    			            , yes:function(){
    	    			        	    window.location.href='api/keHuPc/index.do';
    	    			            }
    		    					, btn2:function(){
    					            	window.location.href='api/keHuPc/toApplyStore.do';
    							    }
    	    			        });
    	    				}else{
    	    					window.location.href='api/keHuPc/index.do';
    	    				}
    	    			});
    				}
   				});
   			}else{
   				layer.msg("登录失败："+data.respMsg,{
   		            time:2000,//单位毫秒
   		            shade: [0.8, '#393D49'], // 透明度  颜色
   		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
   		            icon:2,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
   		        });
   				//console.log(data.respMsg);
   			}
   		}
       });
	}
	//保存cookie
	 function saveCookie() {
		if ($("#saveid").is(":checked")) {
			$.cookie('loginname1', $("#userName").val(), {
				expires : 7
			});
			$.cookie('password1', $("#password").val(), {
				expires : 7
			});
		}
	}

	function savePaw() {//loginName--password
		  
		if (!$("#saveid").is(":checked")) {
			$.cookie('loginname1', '', {
				expires : -1
			});
			$.cookie('password1', '', {
				expires : -1
			});
			$("#userName").val('');
			$("#password").val('');
		}
	}

	//读取cookie
	jQuery(function() {
		var loginname = $.cookie('loginname1');
		var password = $.cookie('password1');
		if (typeof(loginname) != "undefined"
				&& typeof(password) != "undefined") {
			$("#userName").val(loginname);
			$("#password").val(password);
			$("#saveid").attr("checked", true);
		}
	});
	 /*选择医生、机构或者药商*/
    $(".danxuan").click(function(){
        $(this).addClass("bgSelected");
        $(this).siblings(".danxuan").removeClass("bgSelected");
        $("#identity").val($(this).attr("tid"));
    });
</script>
</body>
</html>