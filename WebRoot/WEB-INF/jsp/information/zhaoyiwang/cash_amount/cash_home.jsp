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
    <link rel="stylesheet" href="static/zhaoyiwang/css/yahu.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/weui.min.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/weui1.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/index.css"/>
    <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/js/fastclick.js"></script>
    <script src="static/zhaoyiwang/js/jquery-weui.js"></script>
    <title>现金金额</title>
    <style>
        .weui_cells{
            margin-top: 15px;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">现金金额</h1>
    <a href="javascript:void(0)" onclick="window.location.href='api/shangHu/toPersonCenter.do'" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main" style="margin-top: 52px;">
    <div class="total">
        <div class="tatal_detail">
            <h1>${pd.xianjinAmount }</h1>
            <p>现金金额</p>
        </div>
    </div>
    <div class="weui_cells weui_cells_access" >
        <a class="weui_cell" href="javascript:void(0)" onclick="toJump('1');">
            <div class="weui_cell_bd weui_cell_primary turn_left">
                <p>申请提现</p>
            </div>
            <div class="weui_cell_ft"></div>
        </a>
    </div>
    <%--<div class="weui_cells weui_cells_access">
        <a class="weui_cell" href="javascript:void(0)" onclick="toJump('2');">
            <div class="weui_cell_bd weui_cell_primary turn_left">
                <p>我的银行卡</p>
            </div>
            <div class="weui_cell_ft"></div>
        </a>
    </div>--%>
    <div class="weui_cells weui_cells_access">
        <a class="weui_cell" href="javascript:void(0)" onclick="toJump('3');">
            <div class="weui_cell_bd weui_cell_primary turn_left">
                <p>申请记录</p>
            </div>
            <div class="weui_cell_ft">
            </div>
        </a>
    </div>
    
     <!-- <div class="weui_cells weui_cells_access">
        <a class="weui_cell" href="api/shangHu/fenxiaoMoney.do">
            <div class="weui_cell_bd weui_cell_primary turn_left">
                <p>分销所得金额记录</p>
            </div>
            <div class="weui_cell_ft">
            </div>
        </a>
    </div> -->
</div>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    //页面跳转
    function toJump(mark){
    	if(mark=='1'){
    		var payPassword="${pd.payPassword}";
    		if(payPassword==""){
    			layer.open({
    				content:'您还未设置提现密码,点击确定去设置!'
    				,btn:['确定','退出']
    				,yes:function(index){
    					window.location.href="api/shangHu/toPayPassword1.do";
    				}
    				,no:function(index){
    					layer.close(index);
    				}
    			});
    			return;
    		}
    		window.location.href="api/shangHu/toXianJinAmountApply.do";
    	}else if(mark=='2'){
    		window.location.href="api/shangHu/toXianJinAmountMyBlankCard.do";
    	}else{
    		window.location.href="api/shangHu/toXianJinAmountApplyRecord.do";
    	}
    }
</script>
</body>
</html>