<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/zyw/gerenZiliao.css"/>
    <link rel="stylesheet" href="static/css/zyw/common.css"/>
    <link rel="stylesheet" href="static/css/zyw/toubu.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
     <link rel="stylesheet" href="static/css/zyw/index1.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>个人资料</title>
    <style>
        .img-box {
            margin-top:0;
        }
        .amask {

            background:rgba(0,0,0,.5);
        }
        .amask .mask-content {
            width: 30%;
            margin: 200px auto auto;
            background: white;
            height: 160px;
            text-align: center;
            position: relative;
            border-radius: 10px;
        }
        .ser_add_top .ser_img1 p {
            color: #333;
            font-size: 12px;
            height: 30px;
            line-height: 30px;
        }
        .amask .mask-content .del-p {
            color: #555;
            height: 94px;
            line-height: 94px;
            font-size: 16px;
            border-bottom: 1px solid #ddd;
        }
        .mask-content .check-p span:first-child {
            border-right: 1px solid #ddd;
        }
        .ser_add_top .ser_img1 .check-p{
            height: 60px;
            line-height: 60px;
        }
        .mask-content .check-p span {
            cursor: pointer;
        }
        a {
            text-decoration: none;
            color: #7f7f7f;
        }
        .jianjie {
            width: 1156px;
            height: 140px;
            padding: 0 50px;
            position: absolute;
            background-color: #fff;
        }
        .jianjie>textarea {
            width: 1060px;
            height: 55px;
            line-height: 24px;
            margin-top: 14px;
            font-size: 14px;
            color: #000;
            resize: none;
            border-radius: 4px;
            padding: 10px 20px;
            border: 1px solid #e5e5e5;
        }
        .anli {
            width: 1158px;
            margin-top: 14px;
            border: 1px solid #e5e5e5;
            padding: 10px 50px 20px 50px;
            background-color: #fff;
        }
        .anliadd>input, .anliadd1>input, .anliadd2>input, .anliadd3>input {
            width: 1058px;
            height: 38px;
            border: 1px solid #e5e5e5;
            border-radius: 3px;
            padding: 0 20px;
        }
        .anliadd>textarea, .anliadd1>textarea, .anliadd2>textarea,.anliadd3>textarea {
            width: 1058px;
            height: 86px;
            border: 1px solid #e5e5e5;
            border-radius: 3px;
            padding: 20px;
            resize: none;
            line-height: 20px;
            font-size: 14px;
        }
        .bg_xuqiu{
            width: 100%;
            overflow: hidden;
            border-top: 1px solid #38C4FF;
        }
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<jsp:include page="../top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<!--导航栏-->
<div class="seem">
    <div class="sidbar fl">
        <div class="all clearfix">
            <a href="<%=basePath %>api/keHuPc/index.do"><b>所有分类</b></a>
        </div>
    </div>
    <div class="navmain fl">
        <ul>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/index.do">首页</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYiShengList.do">找医生</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchJiGouList.do">找机构</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYaoShangList.do">找药商</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div class="bg_xuqiu">
    <div class="ziliaoBack">
        <div class="ziliaoBox">
            <div class="ziliaoTop">您的位置 > <span>会员中心</span> > <span>${titleMsg }</span></div>
            <form action="api/keHuPc/${msg }" method="post" id="anliForm" enctype="multipart/form-data"> 
            	<input type="hidden" name="anli_zhanshi_id" value="${pd.anli_zhanshi_id }">
            	<input type="hidden" name="imgPath" value="${pd.imgPath }" id="imgPath">
            	<div class="ziliaoMainA">
	                <div class="anliadd" style="display: block;">
	                    <div class="zz" style="overflow: hidden;">
	                        <span style="font-weight: 400;float: left;line-height: 127px;font-size: 16px;color: #000;">图片:</span>
	                        <div class="z_photo upimg-div" style="border: 1px dashed #ddd;margin-left: 30px;float: left">
	                            <section class="z_file fl">
	                                <img src="${not empty pd.imgPath?pd.imgPath:'static/images/zyw/add1.png' }" class="add-img">
	                                <input type="file" name="file" id="file" class="file" value="" accept="image/jpg,image/jpeg,image/png,image/bmp" />
	                            </section>
	                        </div>
	                    </div>
	                    <h2>标题 : </h2>
	                    <input type="text" name="title" id="title" value="${pd.title }" placeholder="输入标题内容" class="biaotiInt1"/>
	                    <p style="height:30px;line-height:30px;text-align: right"></p><%-- 可以输入4-30个字符 --%>
	                    <h2 style="padding-top:0;">案例描述 : </h2>
	                    <textarea name="detailContent" id="detailContent" class="miaoshu1" placeholder="输入案例描述">${pd.detailContent }</textarea>
	                    <p style="height:30px;line-height:30px;text-align: right">可以输入10-200个字符</p>
	                    <p style="height:30px;line-height:30px;text-align: right">
	                    	<a href="javascript:void(0)" class="save" style="float: left;">保存</a>
	                    </p>
	                </div>
	            </div>
            </form>
        </div>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/js/zyw/imgUp-anli.js"></script>
<script src="static/zhaoyiwang/layer/layer.js"></script>
</body>
<script type="text/javascript">
	$(".save").click(function(){
		if($("#imgPath").val()==''){
			if($("#file").val()==''){
				layer.tips('请选择图片', '#file', {
				    tips: [3, '#FF3E96'],
				    time: 2000
				});
				return;
			}
		}
		if($("#title").val()==''){
			layer.tips('请输入标题', '#title', {
			    tips: [3, '#FF3E96'],
			    time: 2000
			});
			return;
		}
		if($("#detailContent").val()==''){
			layer.tips('请输入案例详情', '#detailContent', {
			    tips: [3, '#FF3E96'],
			    time: 2000
			});
			return;
		}
		$("#anliForm").submit();
	});
</script>
</html>