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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/yibaoxuan/css/yahu.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/css/jquery-weui.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/css/weui1.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/css/font-awesome.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/index.css"/>
    <script src="static/yibaoxuan/js/jquery-2.1.4.js"></script>
    <script src="static/yibaoxuan/js/fastclick.js"></script>
    <script src="static/yibaoxuan/js/jquery-weui.js"></script>
    <title>申请提现</title>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">申请提现</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main" style="margin-top: 60px;">
    <!--中国建设银行-->
    <!--
    <div class="weui_cells weui_cells_access">
        <a class="weui_cell" href="javascript:void(0)" onclick="selectBlankCard();">
            <div class="weui_cell_hd"><img src="static/yibaoxuan/images/jiansheyinhang.png" style="width: 40px;height: 40px;" alt="" ></div>
            <div class="weui_cell_bd weui_cell_primary turn_left" style="margin-left: 10px;">
                <p>中国建设银行</p>
                <p style="color: #ddd;font-size: 0.75em" class="huise">尾号1234 存蓄卡</p>
            </div>
            <div class="weui_cell_ft"></div>
        </a>
    </div>
    -->
    <!--添加银行-->
    <!--
    <div class="weui_cells weui_cells_access" style="margin-top: 5px">
        <a class="weui_cell" href="javascript:void(0)" onclick="toJump();">
            <div class="weui_cell_hd">
                <label  class="weui_label" style="width: 40px;"><img src="static/yibaoxuan/images/add2.png" style="width: 40px;height: 40px;vertical-align: middle;margin-right: -10px;" alt=""/></label>
            </div>
            <div class="weui_cell_bd weui_cell_primary " style="margin-left: 10px">
                添加银行卡
            </div>
            <div class="weui_cell_ft"></div>
        </a>
    </div>
    -->
    <%-- 钱包余额 --%>
    <input type="hidden" id="xianjinAmount" value="${xianjinAmount}">
    <form action="api/ybxkehu/submitXianJinAmountApply.do" method="post" id="submitForm">
		<div style="font-size: 14px;margin-left: 13px;color: red">可提现金额${xianjinAmount}</div>
		<div class="weui_cell " style="background-color: #fff">
	        <div class="weui_cell_hd"><label style="width: 70px;" class="weui_label">提现到</label></div>
	        <div class="weui_cell_bd weui_cell_primary">
	            <input  type="radio" name="tixian_method" value="1" checked="checked"/>支付宝<span style="margin-left: 20px;"></span>
	            <input  type="radio" name="tixian_method" value="2" />银行卡
	        </div>
	    </div>
	    <div class="weui_cell " style="background-color: #fff">
	        <div class="weui_cell_hd"><label style="width: 70px;" class="weui_label">姓　名</label></div>
	        <div class="weui_cell_bd weui_cell_primary">
	            <input class="weui_input" type="text" name="realName" id="realName" placeholder="请输入真实姓名" style="font-family: cursive;width: 80%;"/>
	        </div>
	    </div>
	    <div class="weui_cell " style="background-color: #fff">
	        <div class="weui_cell_hd"><label style="width: 70px;" class="weui_label">账　号</label></div>
	        <div class="weui_cell_bd weui_cell_primary">
	           <input class="weui_input" type="text" name="account" id="account" placeholder="请输入账号信息" style="font-family: cursive;width: 80%;"/>
	        </div>
	    </div>
	    <%--
	    <div class="weui_cell " style="background-color: #fff">
	        <div class="weui_cell_bd weui_cell_primary">
	           <input type="text" name="account" placeholder="请输入短信验证码"/>
	           <input type="button" value="点击获取验证码" style="height: 30px;margin-left: 25px;background-color: #625252;"/>
	        </div>
	    </div>
	    --%>
	    <div class="weui_cell " style="background-color: #fff">
        <div class="weui_cell_hd"><label style="width: 70px;" class="weui_label">金　额</label></div>
        <div class="weui_cell_bd weui_cell_primary">
            <input class="weui_input" type="text" name="amount" id="amount" placeholder="请输入提现金额" style="font-family: cursive;width: 80%;"/>
            <div style="display: none" id="errDiv">
            	<span id="errMsg" style="font-size: 1px;margin-left: 12px;color: red;font-family: cursive;font-weight: 700;"></span>
      		</div>
        </div>
    </div>
    </form>
    <div class="weui_btn_area">
        <%--<a id="formSubmitBtn" href="javascript:" class="weui_btn weui_btn_yellow">确定</a> --%>
        <a href="javascript:void(0)" class="weui_btn weui_btn_yellow" id="submitForm1">确定</a>
    </div>
    <!--弹出框-->
    <div class="mask"></div>
    <div class="pop" style="display: none;">
        <div class="payment">请输入支付密码<span class="fork"></span></div>
        <div class="pop_bottom">
            <div class="pop_bottom_top">
                <p>提现</p>
                <h1>123.00</h1>
            </div>
            <h5><a href="javascript:void(0)" onclick="missPassword();">忘记密码?</a></h5>
            <div class="input">
                <input type="tel" placeholder="" maxlength="1">
                <input type="tel" placeholder="" maxlength="1">
                <input type="tel" placeholder="" maxlength="1">
                <input type="tel" placeholder="" maxlength="1">
                <input type="tel" placeholder="" maxlength="1">
                <input type="tel" placeholder="" maxlength="1">

            </div>
        </div>
    </div>
    <!--重试弹出框-->
    <div class="error" style="display: none;">
        <div class="error_tip">支付密码错误，请重试</div>
        <div class="error_back">
            <div class="forget">
                <a href="">忘记密码</a>
            </div>
            <div class="try">
                <a href="">重试</a>
            </div>
        </div>
    </div>
</div>

<table id="infTable" style="display: none;margin: 10px 0 0 5px;text-indent: 10px;">
	<tr style="height: 30px;">
		<td style="border: 1px solid #e2d8d8;">提现方式　</td>
		<td style="border: 1px solid #e2d8d8;width: 160px;" id="typeTable">支付宝</td>
	</tr>
	<tr style="height: 30px;">
		<td style="border: 1px solid #e2d8d8;">姓　　名　</td>
		<td style="border: 1px solid #e2d8d8;" id="nameTable"></td>
	</tr>
	<tr style="height: 30px;">
		<td style="border: 1px solid #e2d8d8;">账　　号　</td>
		<td style="border: 1px solid #e2d8d8;" id="accountTable"></td>
	</tr>
	<tr style="height: 30px;">
		<td style="border: 1px solid #e2d8d8;">金　　额　</td>
		<td style="border: 1px solid #e2d8d8;" id="amountTable"></td>
	</tr>
	<tr style="position: absolute;color: red;font-family: sans-serif;margin: 2px 4px 0 0;">
		<td colspan="2" style="font-size: 1px;">请确认以上信息是否正确,以免对您的财产造成损失!</td>
	</tr>
</table>
<script src="static/yibaoxuan/layer/layer.js"></script>
<script>
	//大于0的整数和小数（正则表达式）
	var reg=/^(?!0(\.0+)?$)([1-9][0-9]*|0)(\.[0-9]+)?$/;
	//点击确认事件
	$("#submitForm1").click(function(){
		/*layer.open({
			  type: 1,
			  area:['260px', '270px'],
			  title:"信息确认提示",
			  skin: 'layui-layer-demo',
			  btn: ['确认', '取消'],
			  closeBtn: 1,
			  anim: 2,
			  shadeClose: false,
			  content: $("#infTable"),
			  btn1:function(){
				  layer.closeAll()//关闭所有的弹窗
				  console.log("执行btn1");
			  }
			});*/
		var tixian_method  = $('input[name="tixian_method"]:checked').val();//提现方式
		var realName = $("#realName").val();//姓名
		var account = $("#account").val();//账号
		var amount = $("#amount").val();//提现金额
		//姓名不能为空
		if($("#realName").val()==''){
			layer.tips('姓名不能为空', '#realName', {
				tips: [3, '#FF1493'],
				time: 2000
			});
			return;
		}
		//账号不能为空
		if($("#account").val()==''){
			layer.tips('账号不能为空', '#account', {
				tips: [3, '#FF1493'],
				time: 2000
			});
			return;
		}
		//提现金额的错误提示如果存在,怎不提交
		if($("#errMsg").html()==""){
			if($("#amount").val()==""){
				layer.tips('请输入提现金额', '#amount', {
					tips: [3, '#FF1493'],
					time: 2000
				});
				return;
			}
			//console.log("所有条件均已满足");
			if(tixian_method=="1"){
				$("#typeTable").html("支付宝");
			}else{
				$("#typeTable").html("银行卡");
			}
			$("#nameTable").html(realName);
			$("#accountTable").html(account);
			$("#amountTable").html(amount);
			layer.open({
			  type: 1,
			  area:['260px', '270px'],
			  title:"信息确认提示",
			  skin: 'layui-layer-demo',
			  btn: ['确认', '取消'],
			  closeBtn: 1,
			  anim: 2,
			  shadeClose: false,
			  content: $("#infTable"),
			  btn1:function(){
				  layer.closeAll();//关闭弹窗
				  layer.msg("提现申请成功",{
		             time:2000,//单位毫秒
		             shade: [0.8, '#393D49'], // 透明度  颜色
		             icon:6,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
		          });
				  setTimeout("$('#submitForm').submit();",3000);
				  //setTimeout("console.log('所有条件均已满足');",3000);
			  }
			});
		}else{
		//by yym 
				layer.msg("您的输入有误，请按照提示操作！",{
    		            time:2000,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
    		            icon:5,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		        });
		}
	});
	//输入提现金额的keyup事件
	$("#amount").keyup(function(){
		$("#errDiv").show();
  		if(!reg.test($("#amount").val()) && $("#amount").val()!=""){
  			$("#errMsg").html("请正确输入提现金额");
  		}else{
  			if($("#amount").val()!="" && (parseFloat($("#amount").val()) > parseFloat($("#xianjinAmount").val()))){
  				$("#errMsg").html("提现金额大于当前可用金额");
  			}else{
  				$("#errDiv").hide();
  				$("#errMsg").html("");
  			}
  			/*else if((parseFloat($("#amount").val())<100)){
  				$("#errMsg").html("提现金额不能小于100");
  			}*/
  		}
	});
</script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    //点击添加银行卡操作
    function toJump(){
    	window.location.href="api/shangHu/toXianJinAmountApplyAddBlankCard1.do";
    }
  	//点击选择银行卡操作
    function selectBlankCard(){
    	window.location.href="api/shangHu/toXianJinAmountApplySelectBankCard.do";
    }
  	//点击忘记密码操作
    function missPassword(){
    	window.location.href="api/shangHu/toXianJinAmountApplyMissPassword1.do";
    }
</script>
<script>

    /*
     * 模拟支付宝的密码输入形式
     */
    (function (window, document) {
        var active = 0,
                inputBtn = document.querySelectorAll('.input input');
        for (var i = 0; i < inputBtn.length; i++) {
            inputBtn[i].addEventListener('click', function () {
                inputBtn[active].focus();
            }, false);
            inputBtn[i].addEventListener('focus', function () {
                this.addEventListener('keyup', listenKeyUp, false);
            }, false);
            inputBtn[i].addEventListener('blur', function () {
                this.removeEventListener('keyup', listenKeyUp, false);
            }, false);
        }

        /**
         * 监听键盘的敲击事件
         */
        function listenKeyUp() {
            var beginBtn = document.querySelector('#beginBtn');
            if (!isNaN(this.value) && this.value.length != 0) {
                if (active < 5) {
                    active += 1;
                }
                inputBtn[active].focus();
            } else if (this.value.length == 0) {
                if (active > 0) {
                    active -= 1;
                }
                inputBtn[active].focus();
            }
            if (active >= 5) {
                var _value = inputBtn[active].value;
                if (beginBtn.className == 'begin-no' && !isNaN(_value) && _value.length != 0) {
                    beginBtn.className = 'begin';
                    beginBtn.addEventListener('click', function () {
                        calculate.begin();
                    }, false);
                }
            } else {
                if (beginBtn.className == 'begin') {
                    beginBtn.className = 'begin-no';
                }
            }
        }
    })(window, document);
</script>
<script>
    $(function(){
        $("#formSubmitBtn").click(function(){
            $(".mask").show();
            $(".pop").show();
            $(".fork").click(function(){
                $(".mask").hide();
                $(".pop").hide();
            })
        })
    })
</script>
</body>
</html>