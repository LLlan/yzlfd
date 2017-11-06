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
    <link rel="stylesheet" href="static/css/zyw/page.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/index1.css"/>
    <link rel="stylesheet" href="static/css/zyw/my_service.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <script src="static/js/zyw/imgUp-fuwu.js"></script>
    <script src="static/js/zyw/page.js"></script>
    <title>我的服务</title>
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

        .bg_xuqiu{
            width: 100%;
            overflow: hidden;
            border-top: 1px solid #38C4FF;
        }
        
        
        
        .tog1, .tog2, .tog3 {
		    height: 314px;
		    width: 375px;
		    position: absolute;
		    top: 291px;
		    left: 287px;
		    z-index: 90;
		    background-color: #fff;
		    border-top: none;
		    overflow: hidden;
		    /* height: 300px; */
		    /* transition: all .8s ease; */
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
        .box3{
            width: 100%;
            background-color:#f4f4f4;
        }
        .wrap{
            width: 100%;
            height: 315px;
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
            height: 314px;
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
            padding-left: 10px;
        }
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<jsp:include page="../top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
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
<!--主体-->
<div class="bg_xuqiu">
    <div class="service">
        <div class="ser_top">
            <span>您的位置 ></span><span>添加服务</span>
        </div>
        <c:choose>
        	<c:when test="${identity=='1' }">
        	<form action="api/keHuPc/${msg }.do" method="post" id="ysForm" enctype="multipart/form-data">
        		<input type="hidden" name="fuwu_id" value="${pd.fuwu_id }">
        		<div class="ser_add">
		            <div class="ser_add_top">
		                <div class="ser_add_rt" style="margin-left: 0;">
		                    <div class="ser_add_mine">
		                        <div class="ser_mine_top">
		                            <span>疾病：</span>
		                            <input type="text" value="${pd.fuwu_jibing_name }" id="ysfuwuname" name="fuwu_jibing_name" readonly="readonly" class="type1" placeholder="选择服务疾病"/>
		                        </div>
			                    <section class="tog2"  style="display:none;">
	                                <div class="menu_box box2" style="display:none;">
	                                    <div class="left_la">
	                                        <div class="wrap wrap3">
	                                            <ul >
	                                                <li class="active"><a href="javascript:;">A</a></li>
	                                                <li><a href="javascript:;">B</a></li>
	                                                <li><a href="javascript:;">C</a></li>
	                                                <li><a href="javascript:;">D</a></li>
	                                                <li><a href="javascript:;">E</a></li>
	                                                <li><a href="javascript:;">F</a></li>
	                                                <li><a href="javascript:;">G</a></li>
	                                                <li><a href="javascript:;">H</a></li>
	                                                <li><a href="javascript:;">I</a></li>
	                                                <li><a href="javascript:;">J</a></li>
	                                                <li><a href="javascript:;">K</a></li>
	                                                <li><a href="javascript:;">L</a></li>
	                                                <li><a href="javascript:;">M</a></li>
	                                                <li><a href="javascript:;">N</a></li>
	                                                <li><a href="javascript:;">O</a></li>
	                                                <li><a href="javascript:;">P</a></li>
	                                                <li><a href="javascript:;">Q</a></li>
	                                                <li><a href="javascript:;">R</a></li>
	                                                <li><a href="javascript:;">S</a></li>
	                                                <li><a href="javascript:;">T</a></li>
	                                                <li><a href="javascript:;">U</a></li>
	                                                <li><a href="javascript:;">V</a></li>
	                                                <li><a href="javascript:;">W</a></li>
	                                                <li><a href="javascript:;">X</a></li>
	                                                <li><a href="javascript:;">Y</a></li>
	                                                <li><a href="javascript:;">Z</a></li>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                    <div class="right_la" >
	                                        <div class="wrap wrap4">
	                                            <ul>
	                                            	<c:forEach items="${list }" var="va">
	                                            		<li onclick="getText(this);">${va.jibing_name }</li>
	                                            	</c:forEach>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                </div>
	                            </section>
		                    </div>
		                    <div class="add_price">
		                        <span>价格：</span>
		                        <input type="text" value="${pd.price }" id="ysfuwuprice" name="price" placeholder="您的理想价格"/>元
		                    </div>
		                </div>
		            </div>
		            <div class="ser_add_bottom">
		                <p>服务详情：</p>
		                <textarea id="ysfuwujieshao" name="jibing_introdaction" cols="30" rows="10" placeholder="服务产品详情内容.....">${pd.jibing_introdaction }</textarea>
		                <p>可以输入10-200个字符</p>
		                <p class="commit" style="text-align: left;">
		                    <a class="ser_add_fabu" href="javascript:void(0);" id="ysfuwusave">发布</a>
		                </p>
		            </div>
		        </div>
		    </form>
        	</c:when>
        	<c:otherwise>
        	<form action="api/keHuPc/${msg }.do" method="post" enctype="multipart/form-data" id="Form">
        		<input type="hidden" name="headImg" id="headImg" value="${pd.headImg }">
        		<input type="hidden" name="fuwu_id" value="${pd.fuwu_id }">
        		<div class="ser_add">
		            <div class="ser_add_top">
		                <div class="ser_img1">
		                    <p>图片：</p>
		                    <div class="img-box full" style="width:101px;height:94px;border:2px dashed #d5d5d5;">
		                        <section class=" img-section" style="width:101px;height:94px;">
		                            <div class="z_photo upimg-div clear" style="border:none; width:101px;height:94px;">
		                                <section class="z_file fl"  style="margin:0;width:101px;height:94px;">
		                                    <img src="${not empty pd.headImg?pd.headImg:'static/images/zyw/add1.png' }" class="add-img" style="margin:0;width:97px;height:90px;">
		                                    <input type="file" name="file" id="file1" class="file" value="" accept="images/jpg,images/jpeg,images/png,images/bmp" style="margin:0;width:100%;"/>
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
		                <div class="ser_add_rt">
		                    <div class="ser_add_mine">
		                        <div class="ser_mine_top">
		                            <span>名称：</span>
		                            <input type="text" value="${pd.fuwu_jibing_name }" name="fuwu_jibing_name" id="fuwuname" placeholder="服务产品名称"/>
		                        </div>
		                    </div>
		                    <div class="add_price">
		                        <span>价格：</span>
		                        <input type="text" value="${pd.price }" name="price" id="fuwuprice" placeholder="您的理想价格"/>元
		                    </div>
		                </div>
		            </div>
		            <div class="ser_add_bottom">
		                <p>服务详情：</p>
		                <textarea name="jibing_introdaction" id="fuwujieshao" cols="30" rows="10" placeholder="服务产品详情内容.....">${pd.jibing_introdaction }</textarea>
		                <p>可以输入10-200个字符</p>
		                <p class="commit" style="text-align: left;">
		                    <a class="ser_add_fabu" href="javascript:void(0);" id="fuwusave">发布</a>
		                </p>
		            </div>
		        </div>
		    </form>
        	</c:otherwise>
        </c:choose>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<%-- 发布部分 --%>
<script>
//医生发布服务
$("#ysfuwusave").click(function(){
	//服务名称判断
	if($("#ysfuwuname").val()==''){
		layer.tips('请选择服务疾病的名称', '#ysfuwuname', {
		    tips: [3, '#FF3E96'],
		    time: 2000
		});
		return;
	}
	//价格判断
	if($("#ysfuwuprice").val()=='' || isNaN($("#ysfuwuprice").val()) || (!isNaN($("#ysfuwuprice").val()) && parseFloat($("#ysfuwuprice").val())<=0)){
		layer.tips('请正确输入价格', '#ysfuwuprice', {
		    tips: [1, '#FF3E96'],
		    time: 2000
		});
		return;
	}
	//内容判断
	if($("#ysfuwujieshao").val()==''){
		layer.tips('请输入服务的详细内容', '#ysfuwujieshao', {
		    tips: [1, '#FF3E96'],
		    time: 2000
		});
		return;
	}
	$("#ysForm").submit();
});
//机构或者药商发布服务
$("#fuwusave").click(function(){
	//判断图片是否可以为空
	if($("#headImg").val()==''){
		if($("#file1").val()==''){
			layer.tips('请选择图片', '#file1', {
			    tips: [3, '#FF3E96'],
			    time: 2000
			});
			return;
		}
	}
	//服务名称判断
	if($("#fuwuname").val()==''){
		layer.tips('请输入服务名称', '#fuwuname', {
		    tips: [3, '#FF3E96'],
		    time: 2000
		});
		return;
	}
	//价格判断
	if($("#fuwuprice").val()=='' || isNaN($("#fuwuprice").val()) || (!isNaN($("#fuwuprice").val()) && parseFloat($("#fuwuprice").val())<=0)){
		layer.tips('请正确输入价格', '#fuwuprice', {
		    tips: [1, '#FF3E96'],
		    time: 2000
		});
		return;
	}
	//内容判断
	if($("#fuwujieshao").val()==''){
		layer.tips('请输入服务的详细内容', '#fuwujieshao', {
		    tips: [1, '#FF3E96'],
		    time: 2000
		});
		return;
	}
	$("#Form").submit();
});
</script>
<%-- 选择疾病部分 --%>
<script>
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
/*科类左侧点击，颜色随之改变*/
$(".wrap3>ul>li").click(function(){
    $(this).addClass("active").siblings().removeClass("active");
    var letter=$(this).find("a").html();
    $.post('api/shangHu/getJiBingListByLetter.do',{letter:letter},function(data){
    	var str='';
    	str+='<ul>';
    	$.each(data.list,function(i,j){
    		str+='<li onclick="getText(this)">'+j.jibing_name+'</li>';
    	});
    	str+='</ul>';
    	$(".wrap4").html(str);
    });
});
function getText(obj){
	$(".type1").val($(obj).text());
    $(".tog2").hide();
    $(".box2").removeClass("have");
}
</script>
</body>
</html>