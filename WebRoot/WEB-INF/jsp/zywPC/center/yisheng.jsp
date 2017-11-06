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
    <link rel="stylesheet" href="static/css/zyw/my_service.css"/>
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

        .tog1,.tog2,.tog3{
            height: 300px;
            width: 357px;
            position: absolute;
            top: 151px;
            right: 91px;
            z-index: 90;
            background-color: #fff;
            border-top: none;
            overflow: hidden;

            /*height: 300px;*/
            /* transition: all .8s ease;*/
        }
        .tog1 .menu_box,.tog2 .menu_box{
            /*display: -webkit-box;*/
            display: flex;
            display: -webkit-flex;
            background: #fff;
            height: 300px;
        }
        .left_la{
            float: left;
            width: 33%;

            background-color: #f5f5f5;
        }
        .demo{
            width: 100%;
            overflow: hidden;
        }
        .demo li{
            width: 100%;
            height: 40px;
            line-height: 40px;
            padding-left: 15px;
            border-bottom: 1px dotted #ddd;
        }
        .demo li a,.demo li a:hover{
            text-decoration: none;
            color: #555;
        }
        .box3{
            width: 100%;
            background-color:#f4f4f4;
        }
        .wrap{
            width: 100%;
            height: 300px;
            border: 1px solid #ddd;
            overflow: auto;
        }
        .menu .tog .left_la ul#diqu {
            height: 300px;
            overflow: auto;
            padding: 0;
            background: #f5f5f5;
        }

        .left_la li{
            padding-left: 10px;
            height: 40px;
            line-height: 40px;
            border-bottom: 1px solid #ddd;
            position: relative;
        }
        .left_la li a{
            display: block;
            font-size: 15px;
            color: #555;
        }
        .right_la li{
            height: 40px;
            line-height: 40px;
            position: relative;
        }
        .left_la li.active {
            background: #fff;
        }
        .right_la ul {
            background: #fff;
            padding-left: 10px;
            height: 400px;
        }

        .tog1 .right_la,.tog2 .right_la {
            -webkit-box-flex: 1;
            box-flex: 1;
            flex: 1;
            -webkit-box-flex: 1;
            height: 300px;
            display: -webkit-box;


        }
        .right_la ul li{
            border-bottom: 1px solid #ddd;
            text-align: left;
        }
        .xinxibox>p:nth-child(7) {
            position: absolute;
            left: 700px;
            top: 113px;
            width: 350px;
            height: 33px;
            line-height: 33px;
        }
        .xinxibox>p:nth-child(8) {
            position: absolute;
            left: 250px;
            top: 154px;
        }
        .xinxibox>p:nth-child(6) {
            position: absolute;
            left: 250px;
            top: 120px;
        }
        .xinxibox>p:nth-child(8)>span {
            position: relative;
            display: inline-block;
            width: 356px;
            height: 30px;
            line-height: 30px;
            padding: 0 20px;
            border-radius: 3px;

        }
        .xinxibox>p:nth-child(6) {
            position: absolute;
            left: 250px;
            top: 122px;
        }
        .qux {
            display: block;
            width: 80px;
            height: 40px;
            line-height: 40px;
            background-color: #38c4ff;
            color: #fff;
            text-align: center;
            float: right;
           margin-left: 10px;
            border-radius: 3px;
            font-size: 14px;
        }
        .anli>p:nth-child(2) {
		    width: 100%;
		    line-height: 24px;
		    font-size: 14px;
		    color: #000;
		    text-indent: 2em;
		    margin-top: 10px;
		    min-height: 90px;
		}
		.xinxibox>p:nth-child(7)>input {
		    width: 260px;
		    height: 30px;
		    padding: 0 20px;
		    border-radius: 3px;
		    border: 1px solid #decdcd;
		    margin-top: -30px;
		    position: absolute;
		    top: 33px;
		    margin-left: 5px;
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
            <div class="ziliaoTop">您的位置 > <span>会员中心</span> > <span>个人资料</span></div>
            <div class="ziliaoMainA">
                <p class="mainhead top1"><img src="static/images/zyw/geren01.png" alt=""/>个人信息<a href="javascript:void(0)" class="bianji1">编辑</a></p>
                <div class="boxbox">
                    <div class="xinxibox" style="z-index: 7">
                        <img style="border: 1px dashed #dccece;"" src="${not empty detaileData.headImg?detaileData.headImg:'static/images/zyw/add1.png' }" alt=""/>
                        <c:choose>
                        	<c:when test="${detaileData.identity=='1' }">
                        		<p>姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名: <span>${detaileData.youName }</span></p>
		                        <p>职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务: <span>${detaileData.position }</span></p>
		                        <p>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注: <span>${detaileData.mark }</span></p>
		                        <p>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话: <span>${detaileData.linkMethod }</span></p>
		                        <p>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型: <span>${detaileData.category=="1"?"中医":detaileData.category=="2"?"西医":"中西医"}</span></p>
		                        <p>科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类: <span>${detaileData.keshiName }</span></p>
                        	</c:when>
                        	<c:when test="${detaileData.identity=='2' }">
                        		<p>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称: <span>${detaileData.youName }</span></p>
                        		<p>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注: <span>${detaileData.mark }</span></p>
                        		<p>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话: <span>${detaileData.linkMethod }</span></p>
                        		<p>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型: <span>${detaileData.dengji}</span></p>
                        	</c:when>
                        	<c:otherwise>
                        		<p>名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称: <span>${detaileData.youName }</span></p>
                        		<p>标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注: <span>${detaileData.mark }</span></p>
                        		<p>电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话: <span>${detaileData.linkMethod }</span></p>
                        		<p>类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型: <span>${detaileData.category=="1"?"中药":detaileData.category=="2"?"西药":"中药/西药"}</span></p>
                        	</c:otherwise>
                        </c:choose>
                        <p>就诊地址: <span style="padding: 0 0px;">${detaileData.address }</span></p>
                    </div>
                    <form action="api/keHuPc/saveBaseInformation.do" id="baseForm" method="post" enctype="multipart/form-data">
                    	<input type="hidden" name="headImg" id="headImg" value="${detaileData.headImg }">
	                    <div class="xinxibox" style="z-index: 6">
	                        <div>
		                        <div class="img-box " style="display:inline;margin:0;width:145px;height:140px;position: absolute;top:25px;left:70px;">
		                            <section class="img-section" style="width:145px;height:140px;border: 1px dashed #dccece;">
		                                <div class="z_photo upimg-div clear" style="border:none; width:145px;height:140px;">
		                                    <section class="z_file fl"  style="margin:0;width:145px;height:140px;">
		                                        <img src="${not empty detaileData.headImg?detaileData.headImg:'static/images/zyw/add1.png' }" class="add-img" style="margin:0;width:145px;height:140px;">
		                                        <input type="file" name="headImgFile" id="file" class="file" value="" accept="images/jpg,images/jpeg,images/png,images/bmp" multiple style="margin:0;width:100%;"/>
		                                    </section>
		                                </div>
		                            </section>
		                        </div>
		                    </div>
		                    <c:choose>
		                    	<c:when test="${detaileData.identity=='1' }">
		                    		<p>
			                        	<label for="youName">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名: </label>
			                        	<input type="text" placeholder="您的名称或名字" id="youName" name="youName"/>
			                        </p>
			                        <p>
				                        <label for="position">职&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务: </label>
				                        <input type="text" placeholder="您的职位" id="position" name="position"/>
			                        </p>
			                        <p style="top: 70px;">
				                        <label for="mark">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注: </label>
				                        <input type="text" placeholder="标注信息(国有、民营。。。)" id="mark" name="mark"/>
			                        </p>
			                        <p style="top: 70px;">
				                        <label for="linkMethod">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话: </label>
				                        <input type="text" placeholder="您的联系方式" id="linkMethod" name="linkMethod"/>
			                        </p>
			                        <p style="top: 110px;">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型: 
				                        <select name="category" id="category">
				                            <option value="1" <c:if test="${detaileData.category=='1' }">selected="selected"</c:if>>中医</option>
				                            <option value="2" <c:if test="${detaileData.category=='2' }">selected="selected"</c:if>>西医</option>
				                            <option value="3" <c:if test="${detaileData.category=='3' }">selected="selected"</c:if>>中西医</option>
				                        </select>
			                        </p>
			                        <p style="top: 107px;">
			                            <span style="display: inline-block;vertical-align: text-bottom;">科&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;类:</span>
			                            <input class="type1" readonly="readonly" type="text" placeholder="选择科室" id="keshiName" name="keshiName"/>
			                        </p>
		                    	</c:when>
		                    	<c:when test="${detaileData.identity=='2' }">
		                    		<p>
			                        	<label for="youName">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称: </label>
			                        	<input type="text" placeholder="机构的名称" id="youName" name="youName"/>
			                        </p>
		                    		<p>
				                        <label for="mark">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注: </label>
				                        <input type="text" placeholder="标注信息(国有、民营。。。)" id="mark" name="mark"/>
			                        </p>
		                    		<p style="top: 70px;">
				                        <label for="linkMethod">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话: </label>
				                        <input type="text" placeholder="服务热线" id="linkMethod" name="linkMethod"/>
			                        </p>
		                    		<p style="top: 70px;">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型: 
				                        <select name="dengji" style="width: 260px;height: 30px;padding: 0 20px;border-radius: 3px;border: 1px solid #decdcd;">
							        	<c:forEach items="${list }" var="list">
							        		<option value="${list.typeName }" <c:if test="${detaileData.dengji==list.typeName }">selected</c:if>>${list.typeName }</option>
							        	</c:forEach>
							        	</select>
			                        </p>
		                    	</c:when>
		                    	<c:otherwise>
		                    		<p>
			                        	<label for="youName">名&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;称: </label>
			                        	<input type="text" placeholder="商家名称" id="youName" name="youName"/>
			                        </p>
		                    		<p>
				                        <label for="mark">标&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;注: </label>
				                        <input type="text" placeholder="标注信息(国有、民营。。。)" id="mark" name="mark"/>
			                        </p>
		                    		<p style="top: 70px;">
				                        <label for="linkMethod">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;话: </label>
				                        <input type="text" placeholder="服务热线" id="linkMethod" name="linkMethod"/>
			                        </p>
			                        <p style="top: 70px;">类&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型: 
				                        <select name="category" id="category" style="width: 260px;height: 30px;padding: 0 20px;border-radius: 3px;border: 1px solid #decdcd;">
				                            <option value="1" <c:if test="${detaileData.category=='1' }">selected="selected"</c:if>>中药</option>
				                            <option value="2" <c:if test="${detaileData.category=='2' }">selected="selected"</c:if>>西药</option>
				                            <option value="3" <c:if test="${detaileData.category=='3' }">selected="selected"</c:if>>中药/西药</option>
				                        </select>
			                        </p>
		                    	</c:otherwise>
		                    </c:choose>
	                        <p><label for="s_province">地&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;址: </label>
	                            <select class="select" id="s_province" name="s_province"  onchange="fn1(this.value)">
	                            </select>
	                            <select class="select" id="s_city" name="s_city"  onchange="fn2(this.value)">
	                            </select>
	                            <select class="select" id="s_county" name="s_county" >
	                            </select>
	                            <script src="static/js/zyw/area.js"></script>
	                             <c:if test="${detaileData.sheng=='' || detaileData.sheng==null }">
			                    	<script type="text/javascript">chushihua("请选择","请选择","请选择");_init_area();</script>
			                    </c:if>
			                    <c:if test="${detaileData.sheng!='' && detaileData.sheng!=null }">
			                    	<script type="text/javascript">chushihua("${detaileData.sheng}","${detaileData.city}","${detaileData.qu}");_init_area();</script>
			                    </c:if>
	                            <section class="tog2"  style="display:none;">
	                                <div class="menu_box box2" style="display:none;">
	                                    <div class="left_la">
	                                        <div class="wrap wrap3">
	                                            <ul>
	                                            	<c:forEach items="${listtop }" var="va" varStatus="vars">
	                                            		<li <c:if test="${vars.index=='0' }">class="active"</c:if> tid="${va.kelei_id }"><a href="javascript:;">${va.keleiName }</a></li>
	                                            	</c:forEach>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                    <div class="right_la" >
	                                        <div class="wrap wrap4" id="right">
	                                            <ul>
	                                            	<c:forEach items="${listchild }" var="va">
	                                            		<li onclick="getText(this);">${va.keleiName }</li>
	                                            	</c:forEach>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                </div>
	                            </section>
	                        </p>
	                    </div>
	                    <input type="hidden" name="address" id="address">
					</form>
                </div>
            </div>
            <form action="api/keHuPc/saveIntroductOrGoodsField.do" method="post" id="zjjj"> 
	            <div class="ziliaoMainA">
	                <p class="mainhead top2"><img src="static/images/zyw/geren01.png" alt=""/>专家简介<a href="javascript:void(0)" class="bianji2">编辑</a></p>
	                <div class="jianjiebox" style="height:140px;">
	                    <div class="jianjie" style="z-index:6">
	                        <p style="text-align: left;font-size: 14px;color:#000;">${detaileData.introduct }</p>
	                    </div>
	                    
		                    <div class="jianjie" style="z-index:5">
		                        <textarea name="introduct" id="jianjie1"></textarea>
		                        <p style="margin-top:0;">可以输入10—200个字符</p>
		                    </div>
	                </div>
	            </div>
            </form>
            <form action="api/keHuPc/saveIntroductOrGoodsField.do" method="post" id="scly"> 
	            <div class="ziliaoMainA">
	                <p class="mainhead top3"><img src="static/images/zyw/shanchang.png" alt=""/>擅长领域<a href="javascript:void(0)" class="bianji3">编辑</a></p>
	                <div class="jianjiebox1" style="height:140px;">
	                    <div class="jianjie" style="z-index:6">
	                        <p style="text-align: left;font-size: 14px;color:#000;">${detaileData.goodField }</p>
	                    </div>
	                    
		                    <div class="jianjie" style="z-index:5">
		                        <textarea name="goodField" id="jianjie"></textarea>
		                        <p style="margin-top:0;">可以输入10—200个字符</p>
		                    </div>
	                </div>
	            </div>
            </form>
            <div class="ziliaoMainA" style="border:none;">
                <p class="mainhead"><img src="static/images/zyw/anli.png" alt=""/>案例展示 <span>(${anliList.size() })</span><a href="api/keHuPc/toAnLiAdd.do" class="tianjia ">添加</a></p>
				<c:forEach items="${anliList }" var="va">
					<div class="anli">
	                    <h2>${va.title }</h2>
	                    <p><img style="float: left;margin-right: 5px;height: 100px;width: 100px;" src="${va.imgPath }" alt=""/>${va.detailContent }</p>
	                    <p>
	                    	<span class="ftime">发布日期 <time>${va.addTime }</time></span>
	                    	<a href="javascript:void(0)" style="margin-right: 10px;" class="delete" tid="${va.anli_zhanshi_id }">删除</a>
	                    	<a href="api/keHuPc/toAnLiEdit.do?anli_zhanshi_id=${va.anli_zhanshi_id }" class="bianji">编辑</a>
	                    </p>
	                </div>
				</c:forEach>
            </div>
        </div>
    </div>
</div>
<div class="cancelBox" style="top: 30%;">
    <p>确认删除该案例吗？</p>
    <p><a href="javascript:void(0)" class="cuol">取消</a><a href="javascript:void(0)" class="yes">确认</a></p>
</div>
<div class="mask"></div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/js/zyw/imgUp-yisheng.js"></script>
<script src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
$(function(){
    $(".bianji1").click(function(){
        $(".boxbox>form>div:nth-child(2)").find("p:nth-child(2)>input").val($(".boxbox>div:nth-child(1)>p:nth-child(2)>span").text());
        $(".boxbox>form>div:nth-child(2)").find("p:nth-child(3)>input").val($(".boxbox>div:nth-child(1)>p:nth-child(3)>span").text());
        $(".boxbox>form>div:nth-child(2)").find("p:nth-child(4)>input").val($(".boxbox>div:nth-child(1)>p:nth-child(4)>span").text());
        $(".boxbox>form>div:nth-child(2)").find("p:nth-child(5)>input").val($(".boxbox>div:nth-child(1)>p:nth-child(5)>span").text());
        $(".boxbox>form>div:nth-child(2)").find("p:nth-child(6)>input").val($(".boxbox>div:nth-child(1)>p:nth-child(6)>span").text());
        //$(".boxbox>div:nth-child(2)").find("p:nth-child(7)>span:nth-child(2)").text($(".boxbox>div:nth-child(1)>p:nth-child(7)>span").text());
        $(".boxbox>form>div:nth-child(2)").find("p:nth-child(7)>input").val($(".boxbox>div:nth-child(1)>p:nth-child(7)>span").text());
		
        $(".boxbox>div:nth-child(1)").css("z-index","6");
        $(".boxbox>form>div:nth-child(2)").css("z-index","7");
        $(this).css("display","none");
        $(".top1").append('<a href="javascript:void(0)" class="cancel1">取消</a>');
        $(".top1").append('<a href="javascript:void(0)" class="save1">保存</a>');
        $(".cancel1").click(function(){
            $(".boxbox>div:nth-child(1)").css("z-index","7");
            $(".boxbox>form>div:nth-child(2)").css("z-index","6");
            $(".bianji1").css("display","block");
            $(".cancel1").remove();
            $(".save1").remove();
            $(".tog2").hide();
        });
        $(".save1").click(function(){
        	//先判断是添加还是修改(添加时头像不能为空，修改时可以为空)
    		if($("#headImg").val()==""){//添加
    			//判断头像是否合法
    			if($("#file").val()==""){
    				$("#file").tips({
    					side:3,
    		            msg:'头像不能为空',
    		            bg:'#FF3E96',
    		            time:2
    		        });
    				return;
    			}
    		}
    		//判断名称是否合法
    		if($("#youName").val()==""){
    			$("#youName").tips({
    				side:3,
    	            msg:'名称不能为空',
    	            bg:'#FF3E96',
    	            time:2
    	        });
    			return;
    		}
    		//判断名称是否合法
    		if($("#keshiName").val()==""){
    			$("#keshiName").tips({
    				side:3,
    	            msg:'科室不能为空',
    	            bg:'#FF3E96',
    	            time:2
    	        });
    			return;
    		}
    		//判断职位是否合法
    		if($("#position").val()==""){
    			$("#position").tips({
    				side:3,
    	            msg:'职位不能为空',
    	            bg:'#FF3E96',
    	            time:2
    	        });
    			return;
    		}
    		//判断标注是否合法
    		if($("#mark").val()==""){
    			$("#mark").tips({
    				side:3,
    	            msg:'标注信息不能为空',
    	            bg:'#FF3E96',
    	            time:2
    	        });
    			return;
    		}
    		//判断电话是否合法
    		if($("#linkMethod").val()==""){
    			$("#linkMethod").tips({
    				side:3,
    	            msg:'电话信息不能为空',
    	            bg:'#FF3E96',
    	            time:2
    	        });
    			return;
    		}
    		//判断地址是否合法s_province s_city s_county
    		if($("#s_province").val()=="请选择"){
    			$("#s_province").tips({
    				side:3,
    	            msg:'地址信息不能为空',
    	            bg:'#FF3E96',
    	            time:2
    	        });
    			return;
    		}
    		if($("#s_city").val()=="请选择"){
    			$("#s_city").tips({
    				side:3,
    	            msg:'地址信息不能为空',
    	            bg:'#FF3E96',
    	            time:2
    	        });
    			return;
    		}
    		if($("#s_county").val()=="请选择"){
    			$("#s_county").tips({
    				side:3,
    	            msg:'地址信息不能为空',
    	            bg:'#FF3E96',
    	            time:2
    	        });
    			return;
    		}
    		$("#address").val($("#s_province option:selected").val()+" "+$("#s_city option:selected").val()+" "+$("#s_county option:selected").val());
    		
    		
    		$("#baseForm").submit();
        });
    });
    $(".bianji2").click(function(){
        $(".jianjiebox>div:nth-child(1)").css("z-index","4");
        $(".jianjiebox>div:nth-child(2)").css("z-index","5");
        $(".jianjiebox>div:nth-child(2)").children("textarea").val($(".jianjiebox>div:nth-child(1)").children("p").text());
        $(this).css("display","none");
        $(".top2").append('<a href="javascript:void(0)" class="cancel2">取消</a>');
        $(".top2").append('<a href="javascript:void(0)" class="save2">保存</a>');
        $(".cancel2").click(function(){
            $(".jianjiebox>div:nth-child(1)").css("z-index","5");
            $(".jianjiebox>div:nth-child(2)").css("z-index","4");
            $(".bianji2").css("display","block");
            $(".cancel2").remove();
            $(".save2").remove();
        });
        $(".save2").click(function(){
            /*$(".jianjiebox>div:nth-child(1)").css("z-index","5");
            $(".jianjiebox>div:nth-child(2)").css("z-index","4");
            $(".jianjiebox>div:nth-child(1)").children("p").html($(".jianjiebox>div:nth-child(2)").children("textarea").val());
            $(".bianji2").css("display","block");
            $(".cancel2").remove();
            $(".save2").remove();*/
            $("#zjjj").submit();
        });
    });
    $(".bianji3").click(function(){
        $(".jianjiebox1>div:nth-child(1)").css("z-index","5");
        $(".jianjiebox1>div:nth-child(2)").css("z-index","6");
        $(".jianjiebox1>div:nth-child(2)").children("textarea").val($(".jianjiebox1>div:nth-child(1)").children("p").text());
        $(this).css("display","none");
        $(".top3").append('<a href="javascript:void(0)" class="cancel3">取消</a>');
        $(".top3").append('<a href="javascript:void(0)" class="save3">保存</a>');
        $(".cancel3").click(function(){
            $(".jianjiebox1>div:nth-child(1)").css("z-index","6");
            $(".jianjiebox1>div:nth-child(2)").css("z-index","5");
            $(".bianji3").css("display","block");
            $(".cancel3").remove();
            $(".save3").remove();
        });
        $(".save3").click(function(){
            /*$(".jianjiebox1>div:nth-child(1)").css("z-index","6");
            $(".jianjiebox1>div:nth-child(2)").css("z-index","5");
            $(".jianjiebox1>div:nth-child(1)").children("p").html($(".jianjiebox>div:nth-child(2)").children("textarea").val());
            $(".bianji3").css("display","block");
            $(".cancel3").remove();
            $(".save3").remove();*/
            $("#scly").submit();
        });
    });
});
/*选择科室部分*/
$(".type1").click(function(){
    var index=$(this).index();
    if($(".box2").hasClass("have")){
        $(".tog2").hide();
        $(".box2").removeClass("have");
        $(".box2").css("display","none");
    }else{
        $(".tog2").show();
        $(".box2").css("display","block").addClass("have");
        $(this).find("a>b .shi02").css("color","#54ccb4");
    }
});
$(".wrap3>ul>li").click(function(){
    $(this).addClass("active").siblings().removeClass("active");
    $.post('api/shangHu/getKeLeiListByParentId.do',{parent_id:$(this).attr("tid")},function(data){
    	var str='';
    	str+='<ul>';
    	$.each(data.list,function(i,j){
    		str+='<li onclick="getText(this)">'+j.keleiName+'</li>';
    	});
    	str+='</ul>';
    	$("#right").html(str);
    });
});
function getText(obj){
	$(".type1").val($(obj).text());
    $(".tog2").hide();
    $(".box2").removeClass("have");
}//end 


/*删除*/
var del;
$(".delete").click(function(){
    del=$(this);
    $(".cancelBox").show();
    $(".mask").show();
    $(".cuol").click(function(){
        $(".cancelBox").hide();
        $(".mask").hide();
    });
    $(".yes").click(function(){
        $.post('api/keHuPc/anLiDelete.do',{anli_zhanshi_id:del.attr("tid")},function(data){
        	if(data.respCode=="01"){
        		del.parent().parent().remove();
                $(".cancelBox").hide();
                $(".mask").hide();
        	}else{
        		window.location.href="api/keHuPc/tosLogin.do";
        	}
        });
    });
});
</script>
</html>