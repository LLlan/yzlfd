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
                    <div class="left">
                        <a href="javascript:void(0)" tid="1">我的二维码</a>
                        <a href="javascript:void(0)" tid="2">一级团队</a>
                        <a href="javascript:void(0)" tid="3">二级团队</a>
                        <a href="javascript:void(0)" tid="4">我的积分</a>
                        <a href="javascript:void(0)" tid="5">我的股权</a>
                        <a href="javascript:void(0)" tid="6">我的虚拟币</a>
                    </div>
                    <div id="contentBox" >
                    	<%-- 我的二维码 --%>
                    	<div id="erweima" style="position: inherit;margin-left: 40%;">
                    		<img src="<%=basePath %>${pd.erweima_img }" style="width: 200px;height: 200px;">
                    		
                    		<%-- 1 --%>
                    		<div style="margin-left: -6px;margin-top: 20px;">
								<div class="jiathis_style_32x32">
									<a class="jiathis_button_qzone"></a>
									<a class="jiathis_button_tsina"></a>
									<a class="jiathis_button_tqq"></a>
									<a class="jiathis_button_weixin"></a>
									<a class="jiathis_button_renren"></a>
									<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
								</div>
								<script "text/javascript"> 
									var id="${kehuUser.user_kuhu_id}";
									var img="${pd.erweima_img }";
									var jiathis_config = { 
									      pic:"<%=basePath%>"+img,
									      url: "<%=basePath%>api/zywkehu/fenxiangEwm.do?user_kuhu_id="+id+"&type=1",
									      title: "自定义网页标题 #微博话题#", 
									      summary:"自定义分享的文本摘要" 
									}; 
								</script>
								<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
							</div>
                    		<%-- 2 --%>
                    		<%--
                    		<div class="bdsharebuttonbox">
			                    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
			                    <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
			                    <a href="#" class="bds_sqq" data-cmd="sqq" title="分享到QQ好友"></a>
			                    <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
			                </div>
							<input id="copytext" type="hidden"/>
							<script>window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"分享到新浪微博","bdMini":"1","bdMiniList":["bdxc","tqf","douban","bdhome","sqq","thx","ibaidu","meilishuo","mogujie","diandian","huaban","duitang","hx","fx","youdao","sdo","qingbiji","people","xinhua","mail","isohu","yaolan","wealink","ty","iguba","fbook","twi","linkedin","h163","evernotecn","copy","print"],"bdPic":"","bdStyle":"1","bdSize":"32"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
						    <script src="static/js/zyw/ZeroClipboard.js"></script>
						    --%>
						    
						    
                    	</div>
                    	<%-- 一级团队 --%>
                    	<div id="yiji" class="right" style="display: none;">
                    		<c:forEach items="${yijiList }" var="list">
                    			<div class="rightBox">
		                            <img src="static/images/zyw/z123.jpg" alt=""/>
		                            <p><span>${list.userName }</span><span>${list.age }</span></p>
		                            <p>地址: <span>${list.address }</span></p>
		                        </div>
                    		</c:forEach>
	                    </div>
	                    <%-- 二级团队 --%>
                    	<div id="erji" class="right" style="display: none;"><%-- flex --%>
	                        <c:forEach items="${ejiList }" var="list">
                    			<div class="rightBox">
		                            <img src="static/images/zyw/z123.jpg" alt=""/>
		                            <p><span>${list.userName }</span><span>${list.age }</span></p>
		                            <p>地址: <span>${list.address }</span></p>
		                        </div>
                    		</c:forEach>
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
        	$("#erweima").css("display","block");
        	$("#yiji").css("display","none");
        	$("#erji").css("display","none");
        	$("#jifen").css("display","none");
        	$("#guquan").css("display","none");
        	$("#xunibi").css("display","none");
        }else if(tid=="2"){
        	$("#erweima").css("display","none");
        	$("#yiji").css("display","flex");
        	$("#erji").css("display","none");
        	$("#jifen").css("display","none");
        	$("#guquan").css("display","none");
        	$("#xunibi").css("display","none");
        }else if(tid=="3"){
        	$("#erweima").css("display","none");
        	$("#yiji").css("display","none");
        	$("#erji").css("display","flex");
        	$("#jifen").css("display","none");
        	$("#guquan").css("display","none");
        	$("#xunibi").css("display","none");
        }else if(tid=="4"){
        	$("#erweima").css("display","none");
        	$("#yiji").css("display","none");
        	$("#erji").css("display","none");
        	$("#jifen").css("display","block");
        	$("#guquan").css("display","none");
        	$("#xunibi").css("display","none");
        }else if(tid=="5"){
        	$("#erweima").css("display","none");
        	$("#yiji").css("display","none");
        	$("#erji").css("display","none");
        	$("#jifen").css("display","none");
        	$("#guquan").css("display","block");
        	$("#xunibi").css("display","none");
        }else{
        	$("#erweima").css("display","none");
        	$("#yiji").css("display","none");
        	$("#erji").css("display","none");
        	$("#jifen").css("display","none");
        	$("#guquan").css("display","none");
        	$("#xunibi").css("display","block");
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