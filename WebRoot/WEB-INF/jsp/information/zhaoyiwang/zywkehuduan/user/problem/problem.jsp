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
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/zys/yahu.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/zys/jquery-weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/zys/weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/zys/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/zys/index.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/zys/login.css"/>
    <script src="static/zhaoyiwang/zywkehuduan/js/zys/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/zywkehuduan/js/zys/fastclick.js"></script>
    <script src="static/zhaoyiwang/zywkehuduan/js/zys/jquery-weui.js"></script>
    <title>医生主页</title>
    <style>
        .searchBlock {
            height: 46px;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">医生主页</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="searchBox" style="border-bottom: 1px solid #dedede;position: fixed;top:0;z-index: 300;">
    <div class="searchBlock">
        <form action="">
            <input type="text" placeholder="请输入关键词" class="keyWords"/>
            <input type="button" value="搜索" class="searchBtn"/>
        </form>
    </div>
</div>
<div class="main" style="width:100%;position: fixed;top:60px;">
    <!--医生介绍-->
    <div class="ys_info">
        <div class="ys_detail">
            <div class="img3">
                <a href="../region/regin_info.html"><img src="static/zhaoyiwang/zywkehuduan/images/zys/yisheng_10.png" alt=""/></a>
            </div>
            <ul class="ys">
                <li>
                    <a href="../region/regin_info.html"><b>杨梅</b> | <span>主治医师</span></a>
                </li>
                <li>

                    <a href="../region/regin_info.html">个人</a>
                </li>
                <li>
                    <a href="../region/regin_info.html">中华医学会心电生理和起搏分会青年委员，中国医师协会心血管内科医师分会青年委员，中华医学会江苏省心血管病分会青年委员会副主委，中华全科医学杂志编委;2007年毕业于南京医科大学并任职于南京医科大学第一附属医院(江苏省人民医院)。熟练掌握各种心律失常的诊断与治疗。</a>
                </li>
                <li>
                    <a href="">
                        <button class="btn">立即咨询</button>
                    </a>
                    <span>帮助过<em>10</em>人</span> | <span>服务评分:<em>4.8</em></span>
                </li>
            </ul>
        </div>
        <div class="ys_detail">
            <div class="img3">
                <a href="../region/regin_info.html"><img src="static/zhaoyiwang/zywkehuduan/images/zys/yisheng_10.png" alt=""/></a>
            </div>
            <ul class="ys">
                <li>
                    <a href="../region/regin_info.html"><b>杨梅</b> | <span>主治医师</span></a>
                </li>
                <li>

                    <a href="../region/regin_info.html">个人</a>
                </li>
                <li>
                    <a href="../region/regin_info.html">中华医学会心电生理和起搏分会青年委员，中国医师协会心血管内科医师分会青年委员，中华医学会江苏省心血管病分会青年委员会副主委，中华全科医学杂志编委;2007年毕业于南京医科大学并任职于南京医科大学第一附属医院(江苏省人民医院)。熟练掌握各种心律失常的诊断与治疗。</a>
                </li>
                <li>
                    <a href="">
                        <button class="btn">立即咨询</button>
                    </a>
                    <span>帮助过<em>10</em>人</span> | <span>服务评分:<em>4.8</em></span>
                </li>
            </ul>
        </div>
    </div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>