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
    <link rel="stylesheet" href="static/css/zyw/zhaoyaoshang.css"/>
    <link rel="stylesheet" href="static/css/zyw/page.css"/>
    <link rel="stylesheet" href="static/css/zyw/yaoshang_home.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>找药商</title>
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
        .sort {
            width: 1160px;
            margin: 5px auto 20px auto;
        }
        .pin00>span {
            float: left;
            font-size: 15px;
            color: #000;
        }
        .zhaoyaoshang00 label,.zhaoyaoshang00 select,.zhaoyaoshang00>select>option{
            color:#000;
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

        .range{
            line-height: 18px;
            text-align: center;
        }
       
        #mo_sort>li{
            height: 120px;
             padding: 10px 0;
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
        .type00 label{
            color: #000;
        }
        .type00{
		    width:100%;height:40px;line-height: 40px;font-size: 12px;color: #000;margin-top:10px;margin-bottom: 10px;
		}
		.type00>input{
		    margin-left:10px;
		}
		.type00>label{
		    margin-left:10px;
		}
		.type00>a{
		    padding:4px 20px;border-radius: 4px;margin-left:20px;border:1px solid #38c4ff;color:#38c4ff;
		}
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<jsp:include page="../top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<!--头部-->
<div class="seem" id="maodian">
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
            <li class="fl"><a class="hover" href="<%=basePath %>api/keHuPc/searchYaoShangList.do">找药商</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div class="zhaoyaoshangBack">
    <div class="zhaoyaoshangBox">
        <div class="zhaoyaoshangTop">您的位置 > 首页 > <span>找药商</span></div>
        <div class="zhaoyaoshangMain">
            <p class="zhaoyaoshang00" style="font-size: 12px;">
                <label for="s_province">所在地区:</label>
                <select class="select" id="sheng" style="margin-right:5px;" onchange="fn1(this.value)">
                	<option value="">请选择</option>
                </select>省
                <select class="select" id="shi" name="shi" style="margin-right:5px;">
                	<option value="">请选择</option>
                </select>市
                <a href="javascript:void(0)" class="buxian buxian01">不限</a>
            </p>
            <p class="type00">
                药品类型:
                <label for="zhongyi">中药:</label><input type="radio" id="zhongyi" name="zhongyi" value="1"/>
                <label for="xiyi">西药:</label><input type="radio" id="xiyi" name="zhongyi" value="2"/>
                <label for="xiyi1">中药/西药:</label><input type="radio" id="xiyi1" name="zhongyi" value="3"/>
                <a href="javascript:void(0)" class="buxian02 buxian">不限</a>
            </p>
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
  	<%-- 服务类型 (1-中药2-西药3-中药/西药)--%>
   	<input type="hidden" id="categorys" name="category" value="">
</form>
<!--默认排序-->
<div class="sort">
    <p></p>
    <p></p>
    <div class="sort_top">
        <ul class="sort_top_ul">
        	<li>头像</li>
            <li >药商名称/地点</li>
            <li>药品类型</li>
            <li>经营范围</li>
            <li>个人成就</li>
            <li>操作</li>
        </ul>
    </div>
    <ul id="mo_sort">
    	<c:choose>
    		<c:when test="${yaoshangList.size()>0 }">
    			<c:forEach items="${yaoshangList }" var="list">
    				<li>
			            <a href="<%=basePath %>api/keHuPc/yaoShangDetail.do?yisheng_id=${list.user_shanghu_id }" target="_blank">
			            	<ul class="yiyuan">
			                    <div style="float: left;width: 100%;height: 98px;text-align: center;">
				            		<img alt="" src="<%=basePath %>${list.headImg }" width="80px" height="80px">
				            	</div>
			                </ul>
			            	
			                <ul class="yiyuan">
			                    <li>${list.youName }</li>
			                    <li></li>
			                    <li>${list.address }</li>
			                    <li></li>
			                </ul>
			                <ul class="diqu">
			                    <li></li>
			                    <li>
			                    	<c:choose>
			                    		<c:when test="${list.category=='1' }">
			                    			中药
			                    		</c:when>
			                    		<c:when test="${list.category=='2' }">
			                    			西药
			                    		</c:when>
			                    		<c:otherwise>
			                    			中药/西药
			                    		</c:otherwise>
			                    	</c:choose>
			                    </li>
			                    <li></li>
			                    <li></li>
			                </ul>
			                <div class="range">
			                   ${list.goodField }
			                </div>
			                <ul class="chengjiu">
			                    <li></li>
			                    <li>服务过<span>${list.num }</span>人</li>
			                    <li></li>
			                </ul>
			                <ul class="zhiXun">
			                    <li></li>
			                    <li><button class="btn2">立即咨询</button></li>
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
        <ul class="page" maxshowpageitem="5" pagelistcount="10"  id="page"></ul>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/js/zyw/page1.js"></script>
<script src="static/js/zyw/twoProCity.js"></script>
<!--不限-->
<script type="text/javascript">
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
    
  	//具体筛选执行的方法
    function shaixuan(){
    	$.ajax({
            type: "POST",
            url:"api/keHuPc/getYaoShangList.do",
            data:$('#selectForm').serialize(),// 你的formid
            dataType:"json",
            //async: false,
            success: function(data) {
            	//alert(data.yishengList)
                var str='';
                if(data.yaoshangList.length>0){
                	$.each(data.yaoshangList,function(){
                		str+='<li>';
                		str+='<a href="api/keHuPc/yaoShangDetail.do?yisheng_id='+this.user_shanghu_id+'" target="_blank">';
                		str+='<div style="float: left;width: 3%;height: 98px;">';
                		str+='<img alt="" src="'+this.headImg+'" width="80px" height="80px">';
                		str+='</div>';
                		str+='<ul class="yiyuan">';
                		str+='<li>'+this.youName+'</li>';
                		str+='<li></li>';
                		str+='<li>'+this.address+'</li>';
                		str+='</ul>';
                		str+='<ul class="diqu">';
                		str+='<li></li>';
                		str+='<li>';
                		if(this.category=="1"){
                			str+='中药';
                		}else if(this.category=="2"){
                			str+='西药';
                		}else{
                			str+='中药/西药';
                		}
                		str+='</li>';
                		str+='<li></li>';
                		str+='</ul>';
                		str+='<div class="range">'+this.goodField;
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