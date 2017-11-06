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
    <link rel="stylesheet" href="static/zhaoyiwang/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/index.css"/>
    <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/js/fastclick.js"></script>
    <script src="static/zhaoyiwang/js/jquery-weui.js"></script>
    <title>信息确认</title>
    <style>
        .weui-cells{
            margin-top: 10px;;
        }
        .weui-agree__checkbox:checked:before {
            color: #fff;
            background-color: #39D45E;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">选择银行卡</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main" style="margin-top: 60px;">
    <!--信息确认-->
    <div class="weui-cells__title">信息加密处理，仅用于银行验证</div>
    <div class="weui-cells">
        <div class="weui-cell">
            <div class="weui-cell__hd">
                <label class="weui-label">卡类型</label>
            </div>
            <div class="weui-cell__bd weui-cell_primary">
                <label class="weui-label">工商银行</label>
            </div>
        </div>
    </div>
    <form method="post" data-url="/login" id="formlogin">
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">姓名</label>
                </div>
                <div class="weui-cell__bd weui-cell_primary"><label class="weui-label">*小欧</label>
                    </div>
                </div>
            </div>
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">证件类型</label>
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <label class="weui-label">身份证</label>
                </div>
            </div>
        </div>
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">证件号</label>
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <label class="weui-label" style="width: 160px;"> 5****************2</label>
                </div>
            </div>
        </div>
        <div class="weui-cells">
            <div class="weui-cell">
                <div class="weui-cell__hd">
                    <label class="weui-label">手机号</label>
                </div>
                <div class="weui-cell__bd weui-cell_primary">
                    <label class="weui-label" style="width: 160px;"> 15352661225</label>
                </div>
            </div>
        </div>
            <div class="weui-cell">
                <label for="weuiAgree" class="weui-agree">
                    <input id="weuiAgree" type="checkbox" class="weui-agree__checkbox">
                <span class="weui-agree__text">
                    同意<a href="javascript:void(0);">《服务协议》</a>
                </span>
                </label>
            </div>
        <div class="weui-btn-area">
            <a class="weui-btn weui-btn_yellow" id="conf">确认</a>
        </div>
    </form>

</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>