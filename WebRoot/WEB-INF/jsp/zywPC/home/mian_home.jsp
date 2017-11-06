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
    <link rel="stylesheet" href="static/css/zyw/ynzz_paixu.css"/>
    <link rel="stylesheet" href="static/css/zyw/andiqu.css"/>
    <link rel="stylesheet" href="static/css/zyw/page.css"/>
    <link rel="stylesheet" href="static/css/zyw/yaoshang_home.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    
    <title>找医生</title>
    <style>
        .diqu00 label{
            color: #000;
        }
        .ke00 span,.type00 label{
            color: #000;
        }
        .diqu00>select,.diqu00>select option{
            color: #000;
        }
        .right {
            width: 880px;
        }
        .sort_top_ul li {
            float: left;
            color: #fff;
           width: 16.66%;
            text-align: center;
        }
        .yiyuan,.chengjiu, .range,.zhiXun,.diqu{
            float: left;
            width: 16.66%;
            height: 98px;
        }
        .yiyuan li,.chengjiu li,.diqu li,.zhiXun li{
            width: 100%;
            height: 25%;
            text-align: center;
        }
        .yiyuan li:first-child{
            color: #000;
        }
		#mo_sort>li {
		    width: 100%;
		    padding: 10px 0;
		    margin-top: 10px;
		    border: 1px solid #ddd;
		}
        .range {
		    line-height: 19px;
		    text-align: center;
		    display: -webkit-box;
		    -webkit-box-orient: block-axis;
		    -webkit-line-clamp: 4;
		    overflow: hidden;
		}
        .chengjiu{
            /*width: 20%;*/
            float: left;
        }
        #mo_sort>li{
            height: 120px;
        }
        .btn2 {

            padding: 5px 15px;
            margin-top: 5px;
            color: #3EC6FF;
            font-size: 15px;
            border: 1px solid #3EC6FF;
            border-radius: 5px;
            background-color: #fff;
            cursor: pointer;
            margin-right: 50px;
        }
        .btn2:hover{
            background-color: #3EC6FF;
            color: #fff;
        }
        a {
            text-decoration: none;
            /*color: #7f7f7f;*/
        }
        .keleiActive{
        color:#38c4ff;border-bottom:1px dashed #38c4ff;
        }
        .andiquBack {
    		width: 100%;
    		overflow: hidden;
    		border-top: 1px solid #38c4ff;
		}
		.andiquBox {
		    width: 1160px;
		    overflow: hidden;
		    background-color: #fff;
		    margin: 0 auto;
		}
		.keke00>li>a.buxian {
		    display: block;
		    width: 70px;
		    text-align: center;
		    height: 26px;
		    line-height: 26px;
		    border: 1px solid #38c4ff;
		    color: #38c4ff;
		    border-radius: 4px;
		    margin-top: 5px; 
		    float: left;
		    margin-left: 0px; 
		    padding:0px;
		}
		.buxianActive{
			color:#fff;
			border:1px solid #38c4ff；
			background-color:#38c4ff;
		}
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<jsp:include page="../top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<div class="seem" id="maodian">
    <div class="sidbar fl">
        <div class="all clearfix">
            <a href="<%=basePath %>api/keHuPc/index.do"><b>所有分类</b></a>
        </div>
    </div>
    <div class="navmain fl">
        <ul>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/index.do">首页</a></li>
            <li class="fl"><a class="hover" href="<%=basePath %>api/keHuPc/searchYiShengList.do">找医生</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchJiGouList.do">找机构</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYaoShangList.do">找药商</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div class="andiquBack">
    <div class="andiquBox">
        <div class="andiquTop">您的位置 > 首页 > <span>找医生</span></div>
        <div class="andiquMain">
            <p class="diqu00">
                <label for="s_province">医生所在地区:</label>
                <select class="select" id="sheng" style="margin-right:5px;" onchange="fn1(this.value)">
                	<option value="">请选择</option>
                </select>省
                <select class="select" id="shi" name="shi" style="margin-right:5px;">
                	<option value="">请选择</option>
                </select>市
                <a href="javascript:void(0)" class="buxian01">不限</a>
            </p>
            <p class="type00">
                医生服务类型:
                <label for="zhongyi">中医:</label><input type="radio" id="zhongyi" name="zhongyi" value="1"/>
                <label for="xiyi">西医:</label><input type="radio" id="xiyi" name="zhongyi" value="2"/>
                <label for="xiyi1">中西医:</label><input type="radio" id="xiyi1" name="zhongyi" value="3"/>
                <label for="xiyi2">疑难杂症:</label><input type="radio" id="xiyi2" name="zhongyi" value="4"/>
                <a href="javascript:void(0)" class="buxian02">不限</a>
            </p>
            <div class="kelei00">
                <div class="ke00">
                    <span>医生服务科类:</span>
                    <div class="right">
                        <div>
                            <ul class="keke00">
                            	<c:forEach items="${parentkeleiList }" var="list">
                            		<li class="zhukelei" tid="${list.kelei_id }"><a href="javascript:void(0)" style="color: #000;">${list.keleiName }</a></li>
                            	</c:forEach>
                            	<li> <a href="javascript:void(0)" class="buxian03 buxian">不限</a></li>
                            </ul>
                        </div>
                        <ul class="sub00"></ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%-- 筛选条件 --%>
<form action="<%=basePath %>api/keHuPc/searchYiShengList.do" method="post" id="selectForm">
	<input type="hidden" name="pageSize" id="pageSize" value=""><%-- 页面显示信息条数 --%>
   	<c:choose>
   		<c:when test="${pd.currentPage=='' || pd.currentPage==null }">
   			<input type="hidden" name="currentPage" id="currentPage" value="1"><%-- 当前页码数 --%>
   		</c:when>
   		<c:otherwise>
   			<input type="hidden" name="currentPage" id="currentPage" value="${pd.currentPage }"><%-- 当前页码数 --%>
   		</c:otherwise>
   	</c:choose>
   	<%-- 省、市 --%>
   	<input type="hidden" id="shengs" name="sheng" value="">
   	<input type="hidden" id="shis" name="shi" value="">
   	<%-- 服务类型 (1-中医2-西医3-中西医)--%>
   	<input type="hidden" id="categorys" name="category" value="">
   	<%-- 服务科类--%>
   	<input type="hidden" id="zhukeleis" name="zhukelei" value="">
   	<input type="hidden" id="zikeleis" name="zikelei" value="">
</form>
<!--默认排序-->
<div class="sort" style=" margin: 1% auto 20px auto;">
    <%--<p>默认排序：</p>--%>
    <div class="sort_top">
        <ul class="sort_top_ul">
        	<li>头像</li>
            <li>姓名/职称</li>
            <li>医院/科类</li>
            <li>类型/擅长领域</li>
            <li>个人成就</li>
            <li>操作</li>
        </ul>
    </div>
    <ul id="mo_sort">
    	<c:choose>
    		<c:when test="${yishengList.size()>0 }">
    			<c:forEach items="${yishengList }" var="list">
		    		<li>
			            <a href="<%=basePath %>api/keHuPc/yiShengDetail.do?yisheng_id=${list.user_shanghu_id }" target="_blank">
			           		<ul class="yiyuan">
			                    <div style="float: left;width: 100%;height: 98px;text-align: center;">
				            		<img alt="" src="<%=basePath %>${list.headImg }" width="80px" height="80px">
				            	</div>
			                </ul>
			                <ul class="yiyuan">
			                    <li>${list.youName }</li>
			                    <li></li>
			                    <li>${list.position }</li>
			                </ul>
			                <ul class="diqu">
			                    <li>${list.mark }</li>
			                    <li></li>
			                    <li>${list.keshiName }</li>
			                </ul>
			                <div class="range">
			                    <p>
			                    	<c:choose>
			                    		<c:when test="${list.category=='1' }">
			                    			中医
			                    		</c:when>
			                    		<c:when test="${list.category=='2' }">
			                    			西医
			                    		</c:when>
			                    		<c:otherwise>
			                    			中西医
			                    		</c:otherwise>
			                    	</c:choose>
			                    </p>
			                    ${list.goodField }
			                </div>
			                <ul class="chengjiu">
			                    <li></li>
			                    <li>服务过<span>${list.num }</span>人</li>
			                    <li></li>
			                </ul>
			                <ul class="zhiXun">
			                    <li></li>
			                    <li><button type="button" class="btn2" ng-click="setconversation('${list.user_shanghu_id}')">立即咨询</button></li>
			                    <li></li>
			                </ul>
			            </a>
			        </li>
		    	</c:forEach>
    		</c:when>
    		<c:otherwise>
    			<li style="text-align: center;">
    				<span style="font-size: 20px;font-family: cursive;">没有相关数据
    				<span style="font-size: 20px;font-family: cursive;margin-top: -5px;position: absolute;padding-left: 5px;">......</span>
    				</span>
    			</li>
    		</c:otherwise>
    	</c:choose>
    </ul>
    <div class="txt-center">
        <ul class="page" maxshowpageitem="5" pagelistcount="10" id="page"></ul>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/js/zyw/page1.js"></script>
<script src="static/js/zyw/twoProCity.js"></script>
<!--标签页-->
<script>
    	function toPage(obj,currentPage){
    		if($(obj).attr("class")!="pageItemDisable"){
    			if(currentPage!=$("#currentPage").val()){
    				$("#currentPage").val(currentPage);
    				shaixuan();
    			}
    		}
    	}
    	$("#pageSize").val($("#page").attr("pagelistcount"));
        page("${pageCount }",$("#currentPage").val());
        function page(pageCount,currentPage){
        	initPage(pageCount,currentPage);//第一个参数代表总的信息数，第二个参数代表着当前页
        }
        
      	//不限按钮的点击改变状态
        //1.
        $("#sheng").change(function(){
        	$(".buxian01").removeClass("nn");
        	$(".buxian01").css("color","#38c4ff");
            $(".buxian01").css("border","1px solid #38c4ff");
            $(".buxian01").css("background-color","rgba(0,0,0,0)");
            $("#shengs").val($("#sheng option:selected").val().split(",")[1]);
            $("#shis").val("");
            $("#currentPage").val(1);
            shaixuan();
        });
        $("#shi").change(function(){
        	$("#shis").val($("#shi option:selected").val());
        	$("#currentPage").val(1);
        	shaixuan();
        });
        $(".buxian01").click(function(){
            if($(this).hasClass("nn")){
                $(this).removeClass("nn");
                $(this).css("color","#38c4ff");
                $(this).css("border","1px solid #38c4ff");
                $(this).css("background-color","rgba(0,0,0,0)");
            }else{
                $(this).addClass("nn");
                $(this).css("color","#fff");
                $(this).css("border","1px solid #38c4ff");
                $(this).css("background-color","#38c4ff");
                //选中不限时，省、市为空
                $("#sheng option").eq(0).attr("selected",true).siblings().attr("selected",false);
                $("#shi").html('<option value="">请选择</option>')
                $("#shengs").val("");
                $("#shis").val("");
                $("#currentPage").val(1);
                shaixuan();
            }
        });
        //2.
        $("input[type='radio']").click(function(){
        	$(".buxian02").removeClass("nn");
        	$(".buxian02").css("color","#38c4ff");
            $(".buxian02").css("border","1px solid #38c4ff");
            $(".buxian02").css("background-color","rgba(0,0,0,0)");
            $("#categorys").val($(this).val());
            $("#currentPage").val(1);
            shaixuan();
        });
        $(".buxian02").click(function(){
            if($(this).hasClass("nn")){
                $(this).removeClass("nn");
                $(this).css("color","#38c4ff");
                $(this).css("border","1px solid #38c4ff");
                $(this).css("background-color","rgba(0,0,0,0)");
            }else{
                $(this).addClass("nn");
                $(this).css("color","#fff");
                $(this).css("border","1px solid #38c4ff");
                $(this).css("background-color","#38c4ff");
                //选中不限时，单选按钮不选中
                //$("input[name='zhongyi']").attr("checked",false);  
                $("input[type='radio']").attr("checked",false);  
                $("#categorys").val("");
                $("#currentPage").val(1);
                shaixuan();
            }
        });
        //3.
        $(".zhukelei").click(function(){
        	$(this).find("a").addClass("keleiActive").parent().siblings().find("a").removeClass("keleiActive");
        	$(".buxian03").removeClass("nn");
            $(".buxian03").css("color","#38c4ff");
            $(".buxian03").css("border","1px solid #38c4ff");
            $(".buxian03").css("background-color","rgba(0,0,0,0)");
            $("#zhukeleis").val($(this).attr("tid"));
            $("#zikeleis").val("");
            //根据主科类的ID获取其下所有的子类
            $.post('api/keHuPc/getChildKeLeiList.do',{kelei_id:$(this).attr("tid")},function(data){
            	var str='';
            	$.each(data.childkeleiList,function(){
            		str+='<li onclick="zikelei(this);" tid="'+this.keleiName+'" id="sss"> <a href="javascript:void(0)" style="color: #000;">'+this.keleiName+'</a></li>';
            	});
            	$(".sub00").html(str);
            });
            $("#currentPage").val(1);
            shaixuan();
        });
        function zikelei(obj){
        	$(obj).find("a").addClass("keleiActive").parent().siblings().find("a").removeClass("keleiActive");
        	$(".buxian03").removeClass("nn");
        	$(".buxian03").css("color","#38c4ff");
        	$(".buxian03").css("border","1px solid #38c4ff");
        	$(".buxian03").css("background-color","rgba(0,0,0,0)");
        	$("#zikeleis").val($(obj).attr("tid"));
        	$("#currentPage").val(1);
        	shaixuan();
        };
        $(".buxian03").click(function(){
            if($(this).hasClass("nn")){
                $(this).removeClass("nn");
                $(this).css("color","#38c4ff");
                $(this).css("border","1px solid #38c4ff");
                $(this).css("background-color","rgba(0,0,0,0)");
            }else{
                $(this).addClass("nn");
                $(this).css("color","#fff");
                $(this).css("border","1px solid #38c4ff");
                $(this).css("background-color","#38c4ff");
                $(".sub00>li").find("a").removeClass("keleiActive").parent().siblings().find("a").removeClass("keleiActive");
                $(".zhukelei").find("a").removeClass("keleiActive").parent().siblings().find("a").removeClass("keleiActive");
                $("#zhukeleis").val("");
                $("#zikeleis").val("");
                $("#currentPage").val(1);
                shaixuan();
            }
        });

        //具体筛选执行的方法
        function shaixuan(){
        	$.ajax({
                type: "POST",
                url:"api/keHuPc/getYiShengList.do",
                data:$('#selectForm').serialize(),// 你的formid
                dataType:"json",
                //async: false,
                success: function(data) {
                	//alert(data.yishengList)
                    var str='';
                    if(data.yishengList.length>0){
                    	$.each(data.yishengList,function(){
                    		str+='<li>';
                    		str+='<a href="api/keHuPc/yiShengDetail.do?yisheng_id='+this.user_shanghu_id+'" target="_blank">';
                    		str+='<div style="float: left;width: 0%;height: 98px;">';
                    		str+='<img alt="" src="'+this.headImg+'" width="80px" height="80px">';
                    		str+='</div>';
                    		str+='<ul class="yiyuan">';
                    		str+='<li>'+this.youName+'</li>';
                    		str+='<li></li>';
                    		str+='<li>'+this.position+'</li>';
                    		str+='</ul>';
                    		str+='<ul class="diqu">';
                    		str+='<li>'+this.mark+'</li>';
                    		str+='<li></li>';
                    		str+='<li>'+this.keshiName+'</li>';
                    		str+='</ul>';
                    		str+='<div class="range">';
                    		str+='<p>';
                    		if(this.category=="1"){
                    			str+='中医';
                    		}else if(this.category=="2"){
                    			str+='西医';
                    		}else{
                    			str+='中西医';
                    		}
                    		str+='</p>'+this.goodField;
                    		str+='</div>';
                    		str+='<ul class="chengjiu">';
                    		str+='<li></li>';
                    		str+='<li>服务过<span>'+this.num+'</span>人</li>';
                    		str+='<li></li>';
                    		str+='</ul>';
                    		str+='<ul class="zhiXun">';
                    		str+='<li></li>';
                    		str+='<li><button class="btn2">立即咨询</button></li>';
                    		str+='<li></li>';
                    		str+='</ul>';
                    		str+='</a>';
                    		str+='</li>';
                    	});
                  }else{
                	  str+='<li style="text-align: center;">';
                	  str+='<span style="font-size: 20px;font-family: cursive;">没有相关数据';
                	  str+='<span style="font-size: 20px;font-family: cursive;margin-top: -5px;position: absolute;padding-left: 5px;">......</span>';
                	  str+='</span>';
                	  str+='</li>';
                  }
                  $("#mo_sort").html(str);  
                  page(data.pageCount,data.currentPage);
                  window.location.href=window.location.href.replace("#maodian", "")+"#maodian";
                }
            });
        }
</script>
</body>
</html>