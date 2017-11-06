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
    <link rel="stylesheet" href="static/css/zyw/zhaojigou.css"/>
    <link rel="stylesheet" href="static/css/zyw/page.css"/>
    <link rel="stylesheet" href="static/css/zyw/yaoshang_home.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>找机构</title>
    <style>
        .zhaojigou00 label,.zhaojigou00 select,.zhaojigou00 option{
            color:#000;
        }
        .type001 label{
            color: #000;
        }
        .sort {
            width: 1160px;
            margin: 35px auto 20px auto;
        }
        .zhaojigouBack {
            margin-top: 0;
            margin-bottom: 0;
            border-top: 1px solid #38c4ff;
        }
        .sort_top_ul li {
            float: left;
            color: #fff;
            width: 20%;
            text-align: center;
        }
        .yiyuan,.chengjiu, .range,.zhiXun{
            float: left;
            width: 20%;
            height: 98px;
        }
        .yiyuan li,.chengjiu li{
            width: 100%;
            height: 33.333%;
            text-align: center;
        }
        .yiyuan li:first-child, .chengjiu li:first-child,.chengjiu li:first-child span{
            color: #000;
        }

        .range{
            width: 20%;
            float: left;
            text-align: center;
        }
       
        #mo_sort>li{
            height: 120px;
            padding:10px 0;
        }
        .zhiXun{
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .btn2 {
            float: right;
            padding: 5px 15px;
            margin-top: 5px;
            color: #3EC6FF;
            font-size: 15px;
            border: 1px solid #3EC6FF;
            border-radius: 5px;
            background-color: #fff;
        }
        a {
            text-decoration: none;
            /*color: #7f7f7f;*/
        }
        
        
        .keleiActive{
        color:#38c4ff;border-bottom:1px dashed #38c4ff;
        }
        
        .kelei00{
		    width:100%;line-height: 40px;font-size: 14px;color: #000;margin-top:10px;
		    overflow: hidden;margin-bottom:20px;
		}
		.ke00{
		    width:100%;overflow: hidden;
		}
		.ke00>span,.ke00>.right{
		    float:left;
		    color:#000;
		}
		.right{
		    width:880px;
		}
		.right>div{
		    width:100%;overflow: hidden;
		}
		.right>div>ul,.right>div>a{
		    float:left;
		}
		.keke00{
		    overflow: hidden;
		}
		.keke00>li{
		    float: left;margin:0 10px;
		}
		.keke00>li>a{
		    padding:5px 5px;
		    /* border-bottom:1px solid #fff; */
		}
		.keke00>li>a.buxian {
		    padding: 4px 20px;
		    color: #38c4ff;
		    border-radius: 4px;
		    border: 1px solid #38c4ff;
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
            <li class="fl"><a class="hover" href="<%=basePath %>api/keHuPc/searchJiGouList.do">找机构</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYaoShangList.do">找药商</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div class="zhaojigouBack">
    <div class="zhaojigouBox">
        <div class="zhaojigouTop">您的位置 > 首页 > <span>找机构</span></div>
        <div class="zhaojigouMain">
            <p class="zhaojigou00">
                <label for="s_province">所在地区:</label>
                <select class="select" id="sheng" style="margin-right:5px;" onchange="fn1(this.value)">
                	<option value="">请选择</option>
                </select>省
                <select class="select" id="shi" name="shi" style="margin-right:5px;">
                	<option value="">请选择</option>
                </select>市
                <a href="javascript:void(0)" class="buxian buxian01">不限</a>
            </p>
            <div class="kelei00">
                <div class="ke00">
                    <span>机构类型:</span>
                    <div class="right">
                        <div>
                            <ul class="keke00">
                            	<c:forEach items="${listType }" var="list">
                            		<li class="dengji" tid="${list.typeName }"><a href="javascript:void(0)" style="color: #000;">${list.typeName }</a></li>
                            	</c:forEach>
                            	<li> <a href="javascript:void(0)" class="buxian03 buxian">不限</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
       </div>
    </div>
</div>
<%-- 筛选条件 --%>
<form action="<%=basePath %>api/keHuPc/searchJiGouList.do" method="post" id="selectForm">
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
   	<%-- 类型 --%>
   	<input type="hidden" id="dengjis" name="dengji" value="">
</form>
<!--默认排序-->
<div class="sort">
   
    <div class="sort_top">
        <ul class="sort_top_ul">
       		<li>头像</li>
            <li>名称/类型</li>
            <li>经营范围</li>
            <li>个人成就</li>
            <li>操作</li>
        </ul>
    </div>
    <ul id="mo_sort">
    	<c:choose>
    		<c:when test="${jigouList.size()>0 }">
		    	<c:forEach items="${jigouList }" var="list">
		        <li>
		            <a href="<%=basePath %>api/keHuPc/jiGouDetail.do?yisheng_id=${list.user_shanghu_id }" target="_blank">
		            	
		            	<ul class="yiyuan">
			                    <div style="float: left;width: 100%;height: 98px;text-align: center;">
				            		<img alt="" src="<%=basePath %>${list.headImg }" width="80px" height="80px">
				            	</div>
			                </ul>
		                <ul class="yiyuan">
		                    <li>${list.youName }</li>
		                    <li></li>
		                    <li>${list.dengji }</li>
		                </ul>
		                <div class="range">
		                    ${list.goodField }
		                </div>
		                <ul class="chengjiu">
		                    <li></li>
		                    <li>服务过<span>${list.num }</span>人</li>
		                    <li></li>
		                </ul>
		                <div class="zhiXun">
		                    <button class="btn2">立即咨询</button>
		                </div>
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
            $("#shi").html('<option value="">请选择</option>');
            $("#shengs").val("");
            $("#shis").val("");
            $("#currentPage").val(1);
            shaixuan();
        }
    });
    
    
	
	$(".dengji").click(function(){
    	$(this).find("a").addClass("keleiActive").parent().siblings().find("a").removeClass("keleiActive");
    	$(".buxian03").removeClass("nn");
        $(".buxian03").css("color","#38c4ff");
        $(".buxian03").css("border","1px solid #38c4ff");
        $(".buxian03").css("background-color","rgba(0,0,0,0)");
        $("#dengjis").val($(this).attr("tid"));
        //alert($(this).attr("tid"))
        $("#currentPage").val(1);
        shaixuan();
    });
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
            $(".dengji").find("a").removeClass("keleiActive").parent().siblings().find("a").removeClass("keleiActive");
            $("#dengjis").val("");
            $("#currentPage").val(1);
            shaixuan();
        }
    });
    
  	//具体筛选执行的方法
    function shaixuan(){
    	$.ajax({
            type: "POST",
            url:"api/keHuPc/getJiGouList.do",
            data:$('#selectForm').serialize(),// 你的formid
            dataType:"json",
            //async: false,
            success: function(data) {
            	//alert(data.yishengList)
                var str='';
                if(data.jigouList.length>0){
                	$.each(data.jigouList,function(){
                		str+='<li>';
                		str+='<a href="api/keHuPc/jiGouDetail.do?yisheng_id='+this.user_shanghu_id+'" target="_blank">';
                		str+='<div style="float: left;width: 0%;height: 98px;">';
                		str+='<img alt="" src="'+this.headImg+'" width="80px" height="80px">';
                		str+='</div>';
                		str+='<ul class="yiyuan">';
                		str+='<li>'+this.youName+'</li>';
                		str+='<li></li>';
                		str+='<li>'+this.dengji+'</li>';
                		str+='</ul>';
                		str+='<div class="range">'+this.goodField;
                		str+='</div>';
                		str+='<ul class="chengjiu">';
                		str+='<li></li>';
                		str+='<li>服务过<span>'+this.num+'</span>人</li>';
                		str+='<li></li>';
                		str+='</ul>';
                		str+='<div class="zhiXun">';
                		str+='<button class="btn2">立即咨询</button>';
                		str+='</div>';
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
<!--改变立即咨询的背景颜色-->
<script>
    $(function(){
        $(".btn2").click(function(){
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
            }
        });
    });
</script>
</body>
</html>