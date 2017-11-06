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
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/myTeam.css"/>
    <link rel="stylesheet" href="static/css/zyw/toubu.css"/>
    <link rel="stylesheet" href="static/css/zyw/common.css"/>
    <link rel="stylesheet" href="static/css/zyw/page.css"/>
    <link rel="stylesheet" href="static/css/zyw/share.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <script src="static/js/zyw/page.js"></script>
    <title>会员中心</title>
    <style>
        .show{
            display: block;
        }
        .hide{
            display: none;
        }
        .colmain>.sure{
            background-color:#38c4ff;color:#fff;border:1px solid #38c4ff;
        }
        .yiwanchegn {
		    display: block;
		    width: 97px;
		    height: 46px;
		    text-align: center;
		    line-height: 46px;
		    border: 1px solid #e5e5e5;
		    margin-left: 10px;
		    float: left;
		    color: #000;
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

<div class="myteamBack">
    <div class="myteamBox">
        <div class="myteamTop">您的位置 > <span>首页</span> > <span>会员中心</span></div>
        <div class="myteamMain">
            <div class="myteamMainA">
                <div class="teamBox">
                    <div class="left" style="height: 300px">
                        <a href="javascript:void(0)" tid="1">我的资料</a>
                        <a href="javascript:void(0)" tid="2">我的积分</a>
                        <a href="javascript:void(0)" tid="3">我的股权</a>
                        <a href="javascript:void(0)" tid="4">我的虚拟币</a>
                    </div>
                    <div id="contentBox" >
                    	<%-- 我的资料 --%>
                    	<div id="ziliao" class="right" >
                   			<div class="rightBox" style="width: 336px;height: 300px;">
	                            <img src="${pd.headImg }" alt="" style="top: 40px;width: 100px;height: 100px;"/>
	                            <p style="top:50px;"><span>${pd.userName }</span><span>${pd.phone }</span></p>
	                            <p style="top:95px;">地址: <span>${pd.address }</span></p>
	                            <div style="position: absolute;top: 155px;">
	                            		<span style="font-size: 15px;margin-left: 20px;">认证状态　:　</span>
                            			<c:choose>
                            				<c:when test="${pd.renZhengState=='0' }">
                            					<a href="<%=basePath %>api/keHuPc/toApplyStore.do" style="text-decoration: underline;color: white;background-color: red;font-size: 15px;">认证失败,点击重新认证</a>
                            				</c:when>
                            				<c:when test="${pd.renZhengState=='1' }">
                            					<span style="line-height: 0;background-color: #07f107;color: white;font-size: 15px;">成功认证</span>
                            				</c:when>
                            				<c:when test="${pd.renZhengState=='2' }">
                            					<span style="line-height: 0;background-color: #07f107;color: white;font-size: 15px;">已提交资料,等待审核</span>
                            				</c:when>
                            				<c:otherwise>
                            					<a href="<%=basePath %>api/keHuPc/toApplyStore.do" style="text-decoration: underline;font-size: 15px;color: #9e7373;background-color: yellow;">尚未认证,点击去认证</a>
                            				</c:otherwise>
                            			</c:choose>
	                            </div>
	                            <div style="position: absolute;top: 220px;left: 20px;">
	                            	<a href="<%=basePath %>api/keHuPc/personInformation.do" style="font-size: 15px;color: #38c4ff;">点击我编辑个人资料</a>
	                            </div>
	                        </div>
	                    </div>
	                    <%-- 我的积分 --%>
	                    <div id="jifen" style="display: none;">
	                    	<div style="text-align:center;height:80px;line-height:80px;">
	                    		<img alt="" src="static/images/zyw/jifen.png" style="vertical-align: middle;width:60px;height:60px">
	                    		<span style="margin-left:10px;font-size:18px;" id="myjifen">${pd.jifen }</span>
	                    		<span style="font-size:18px;">分</span>
	                    		<span style="margin-left:50px;font-size:18px;">积分可以在平台上消费</span>
	                    	</div>
	                    	<div style="margin-top:10px;margin-left: 41%;">
	                    		<p style="font-size:18px;">活动一：积分兑换股权</p>
	                    		<p style="color:#666;font-size:14px;margin-left: 32px;">
	                    			<span id="jifennum">${tempPd.jifen_num }</span> 积分可兑换 <span id="guquannum">${tempPd.guquan_num }</span> 股权 
	                    			<button onclick="duihuan();" style="width: 70px;line-height:30px;background: #38c4ff;border: 1px;border-radius: 10px;margin-top: 5px;cursor: pointer;color: white;">兑换</button>
	                    		</p>	                  	
	                    	</div>
	                    </div>
	                    <%-- 我的股权 --%>
	                    <div id="guquan" style="display: none">
	                    	<div style="text-align:center;height:80px;line-height:80px;">
	                    		<img alt="" src="static/images/zyw/guquan.png" style="vertical-align: middle;width:60px;height:60px">
	                    		<span style="margin-left:10px;font-size:18px;" id="myGuQuan">${pd.guquan }</span>
	                    		<span style="font-size:18px;">股</span>
	                    		<span style="margin-left:50px;font-size:18px;">股权可以在平台上消费</span>
	                    	</div>
	                    </div>
	                    <%-- 我的虚拟币 --%>
	                    <div id="xunibi" style="display: none">
	                    	<div style="text-align:center;height:80px;line-height:80px;">
	                    		<img alt="" src="static/images/zyw/xunibi.png" style="vertical-align: middle;width:60px;height:60px">
	                    		<span style="margin-left:10px;font-size:18px;">${pd.xunibi }</span>
	                    		<span style="font-size:18px;">币</span>
	                    		<span style="margin-left:50px;font-size:18px;">虚拟币可以在平台上消费</span>
	                    	</div>
	                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--<div class="sort">
    <div class="txt-center">
        <ul class="page" maxshowpageitem="5" pagelistcount="10"  id="page"></ul>
    </div>
</div>--%>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script type="text/javascript">
	function duihuan(){
		var myjifen=$("#myjifen").html();
		var jifennum=$("#jifennum").html();
		var guquannum=$("#guquannum").html();
		if(parseFloat(myjifen) >= parseFloat(jifennum)){
			$.post('api/keHuPc/jiFenHuanGuQuan.do',{},function(data){
				if(data.respCode=='00'){
					window.location.href='api/keHuPc/toLogin.do';
				}else{
					layer.msg("兑换成功",{
			            time:2000,//单位毫秒
			            shade: [0.8, '#393D49'], // 透明度  颜色
			            icon:6,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
			        });
					$("#myjifen").html(parseFloat($("#myjifen").html()) - parseFloat($("#jifennum").html()));
					$(".jifen").html(parseFloat($("#myjifen").html()));
					$("#myGuQuan").html(parseFloat($("#myGuQuan").html()) + parseFloat($("#guquannum").html()));
				}
			});
		}else{
			layer.msg("您的积分不足,无法进行兑换",{
	            time:2000,//单位毫秒
	            shade: [0.8, '#393D49'], // 透明度  颜色
	            icon:5,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
	        });
		}
	}
    $(".left>a").click(function(){
        $(this).css("color","#fff");
        $(this).css("background-color","#38c4ff");
        $(this).css("border-color","#38c4ff");
        $(this).siblings().css("color","#000");
        $(this).siblings().css("background-color","#fff");
        $(this).siblings().css("border-color","#e5e5e5");
        var tid=$(this).attr("tid");
        if(tid=="1"){
        	$("#ziliao").css("display","block");
        	$("#jifen").css("display","none");
        	$("#guquan").css("display","none");
        	$("#xunibi").css("display","none");
        }else if(tid=="2"){
        	$("#jifen").css("display","block");
        	$("#guquan").css("display","none");
        	$("#xunibi").css("display","none");
        	$("#ziliao").css("display","none");
        }else if(tid=="3"){
        	$("#jifen").css("display","none");
        	$("#guquan").css("display","block");
        	$("#xunibi").css("display","none");
        	$("#ziliao").css("display","none");
        }else{
        	$("#jifen").css("display","none");
        	$("#guquan").css("display","none");
        	$("#xunibi").css("display","block");
        	$("#ziliao").css("display","none");
        }
    });
</script>
<!--标签页-->
<script>
    $(function(){
        function tt(dd){
            //alert(dd);
        }
        var GG = {
            "kk":function(mm){
                // alert(mm);
            }
        };
        $("#page").initPage(71,1,GG.kk);
    })
</script>
</body>
</html>