<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/zyw/common.css"/>
    <link rel="stylesheet" href="static/css/zyw/toubu.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/fabuNeeds.css"/>
    <link rel="stylesheet" href="static/css/zyw/common1.css"/>
    <link rel="stylesheet" href="static/css/zyw/index1.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>发布需求</title>
    <style>
        body{
            background-color: #fff;
        }
	    .amask .mask-content {
		    width: 30%;
		    margin: 200px auto auto;
		    background: white;
		    height: 160px;
		    text-align: center;
		    position: relative;
		    background: #d1c4c4;
	    }
    
	    .amask .mask-content .del-p {
		    color: #555;
		    height: 114px;
		    line-height: 114px;
		    font-size: 16px;
		    border-bottom: 1px solid #cba6a6;
		}
		.mask-content .check-p span {
		    width: 50%;
		    display: inline-block;
		    text-align: center;
		    color: #d4361d;
		    font-size: 16px;
		    border-right: 1px solid #cba6a6;
		}
		
		/*分类选择样式*/
		.bgSelected {
		    background: url(static/zhaoyiwang/images/select01.png) no-repeat;
		    background-size: 21px 21px;
		    border: none;
	    }
		.visitor>span {
		    float: left;
		}
		.danxuan, .duoxuan {
		    display: block;
		    width: 23px;
		    height:23px;
		    border: 1px solid #c1c1c1;
		}
		.visitor {
		    width: 93%;
		    height: 24px;
		    line-height: 24px;
		    margin: 16px auto auto auto;
		    font-size: 16px;
		    overflow: hidden;
		}/*end*/
		.picUp>span:nth-child(2) {
		    font-size: 16px;
		    position: absolute;
		    left: 10px;
		    top: 40px;
		}
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<jsp:include page="../top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<!--头部-->
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
<div style="border-top: 1px solid #38c4ff;"></div>
<div class="fubuBox">
    <div class="fabu01">
        <p class="fabuTop">您的位置 > 首页 > <span>${titleMsg }</span></p>
        <form action="<%=basePath %>api/keHuPc/${msg }.do" method="post" enctype="multipart/form-data" id="xuqiuform">
        <input type="hidden" name="xuqiu_id" id="xuqiu_id" value="${pd.xuqiu_id }">
        <div class="fabuMain">
        	<div class="visitor shangX" style="display: block; margin-left: 61px">
        		<input type="hidden" name="type" id="type1" value="找医生">
        		<label style="top: 137px;font-size: 16px;float: left;"><span style="color:#d54510;padding-right:10px;">*</span>分&nbsp;&nbsp;&nbsp;&nbsp;类:</label>
		        <span id="danxuan1" class="danxuan bgSelected" style="margin-left: 30px;" tid="找医生"></span>
		        <span style="margin-left:1%;font-size: 15px;">找医生</span>
		   		<span id="danxuan2" class="danxuan" style="margin-left:3%;" tid="找机构"></span>
		        <span style="margin-left:1%;font-size: 15px;">找机构</span>
		        <span id="danxuan3" class="danxuan" style="margin-left:3%" tid="找药商"></span>
		        <span style="margin-left:1%;font-size: 15px;">找药商</span>
		    </div>
            <div class="tit">
                <label for="tit"><span style="color:#d54510;padding-right:10px;">*</span>标&nbsp;&nbsp;&nbsp;&nbsp;题:</label>
                <textarea name="disease" id="disease" placeholder="">${pd.disease }</textarea>
                <p>4-15个字符(包括字母、数字、下划线)，不区分大小写</p>
            </div>
            <div class="xuqiu">
                <label for="xuqiu"><span style="color:#d54510;padding-right:10px;">*</span>需求内容:</label>
                <textarea name="symptom" id="symptom" placeholder="请输入您的需求内容或病情症状以及就诊经历" maxlength="125">${pd.symptom }</textarea>
                <p>125个字符(包括字母、数字、下划线)，不区分大小写</p>
            </div>
            <div class="picUp">
                <span>相关图片:</span>
                 <span>(仅限4张)</span>
                <div>
                    <div class="img-box " style="display:inline;margin:0;width:101px;height:94px;position: absolute;top:0;left:0;">
                        <section class=" img-section" style="width:101px;height:94px;">
                            <div class="z_photo upimg-div clear" style="border:none; width:480px;height:94px;">
                                <section class="z_file fl"  style="margin:0;width:101px;height:94px;border: 2px dashed #d5d5d5;">
                                    <img src="static/images/zyw/add1.png" class="add-img" style="margin:0;width:97px;height:90px;">
                                    <input type="file" name="xuQiuImgFile" id="file" class="file" accept="images/jpg,images/jpeg,images/png,images/bmp" multiple style="margin:0;width:100%;"/>
                                </section>
                            </div>
                        </section>
                    </div>
                    <aside class="amask works-mask">
                        <div class="mask-content">
                            <p class="del-p ">您确定要删除作品图片吗？</p>
                            <p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
                        </div>
                    </aside>
                </div>
            </div>
            <div class="xinxi01">
                <label for="sex"><span style="color:#d54510;padding-right:10px;">*</span>性&nbsp;&nbsp;&nbsp;&nbsp;别 :</label>
                <select name="sex" class="select" id="sex">
                    <option <c:if test="${pd.sex=='男' }">selected="selected"</c:if> value="男">男</option>
                    <option <c:if test="${pd.sex=='女' }">selected="selected"</c:if> value="女">女</option>
                </select>
                <label for="age" style="margin-left:20px;" class="name"><span style="color:#d54510;padding-right:10px;">*</span>年&nbsp;&nbsp;&nbsp;&nbsp;龄 :</label>
                <input style="width: 110px;" type="text" id="age" name="age" value="${pd.age }"/>
                <label for="sheng" style="margin-left:20px;"><span style="color:#d54510;padding-right:10px;">*</span>所在城市 :</label>
                <select name="sheng" class="select" id="sheng" style="margin-right:15px;" onchange="fn1(this.value)">
                	<c:if test="${msg=='saveFaBuXuQiu' }"> 
                		<option selected="selected" value="">请选择</option>
                	</c:if>
                	<c:if test="${msg!='saveFaBuXuQiu' }">
                		<option selected="selected" value=" ,${pd.sheng }">${pd.sheng }</option>
                	</c:if>
                </select>省
                <select name="shi" class="select" id="shi" style="margin-right:15px;">
                    <c:if test="${msg=='saveFaBuXuQiu' }"> 
                		<option selected="selected" value="">请选择</option>
                	</c:if>
                	<c:if test="${msg!='saveFaBuXuQiu' }">
                		<option selected="selected" value="${pd.shi }">${pd.shi }</option>
                	</c:if>
                </select>市
            </div>
            <p style="margin-top:15px;margin-left: 40px;">
                <label for="name" class="name"><span style="color:#d54510;padding-right:10px;">*</span>本人姓名 : </label>
                <input type="text" id="patient_name" name="patient_name" value="${pd.patient_name }"/>
                <label for="tel" class="tel"><span style="color:#d54510;padding-right:10px;">*</span>手机号码 : </label>
                <input type="text" id="phone" name="phone" value="${pd.phone }"/>
            </p>
            <p style="margin-top:20px;">
                <a href="javascript:void(0)" id="subBtn">确认提交</a>
            </p>
        </div>
        </form>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script src="static/js/zyw/imgUp-fbxq.js"></script>
<script src="static/js/zyw/twoProCity.js"></script>
<script>

	if($("#xuqiu_id").val()!=''){
		var type="${pd.type}";
		if(type=="找医生"){
			$("#danxuan1").addClass("bgSelected").siblings(".danxuan").removeClass("bgSelected");
		}else if(type=="找机构"){
			$("#danxuan2").addClass("bgSelected").siblings(".danxuan").removeClass("bgSelected");
		}else{
			$("#danxuan3").addClass("bgSelected").siblings(".danxuan").removeClass("bgSelected");
		}
	}
	
	//分类选择js
	$(".danxuan").click(function(){
	    $(this).addClass("bgSelected");
	    $(this).siblings(".danxuan").removeClass("bgSelected");
	    $("#type1").val($(this).attr("tid"));
	});//end
	
	//发布需求
	$("#subBtn").click(function(){
		if($("#disease").val()==""){
			layer.tips('标题不能为空', '#disease', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
		if($("#symptom").val()==""){
			layer.tips('内容介绍不能为空', '#symptom', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
		var ageReg=/^\+?[1-9]\d*$/;
		if(!ageReg.test($("#age").val()) || (ageReg.test($("#age").val()) && parseFloat($("#age").val())>100)){
			layer.tips('请正确输入年龄', '#age', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
		if($("#sheng").val()==""){
			layer.tips('城市不能为空', '#sheng', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
		if($("#shi").val()==""){
			layer.tips('城市不能为空', '#shi', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
		if($("#patient_name").val()==""){
			layer.tips('姓名不能为空', '#patient_name', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
		var phoneReg=/^1[3-9]\d{9}$/;
		if(!phoneReg.test($("#phone").val())){
			layer.tips('请正确输入手机号码', '#phone', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
		$("#xuqiuform").submit();
	});

</script>
</body>
</html>