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
    <link rel="stylesheet" href="static/css/zyw/index.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <script src="static/js/zyw/jquery.SuperSlide.2.1.1.js"></script>
    <title>华夏郎中行-名医汇集看病不难</title>
    <style>
    
        #show_table>li:last-child {
            border-bottom: none;
        }
        #show_table {
            height: 546px;
        }
        .Doctor_detail {
            height: 545px;
            opacity:0.9;
        }
        .spanaddress{
        
        	color: #333;
		    width: 197px;
		    margin: 0 5px;
		    display: inline-block;
		    text-overflow: ellipsis;
		    overflow: hidden;
		    white-space: nowrap;
		    position: absolute;
        }
        .finde_list1 li>a, .finde_list2 li>a {
		    display: block;
		    height: 260px;
		    margin-left: 20px;
		    margin-top: 10px;
		    margin-right: 20px;
		}
		.Cottage {
		    width: 100%;
		    margin-top: 10px;
		    height: 110px;
		}
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<!--分类-->
<div class="classify" style="position: relative;z-index: 2;width:100%;height:600px;">
    <div class="seem">
        <div class="sidbar fl">
            <div class="all clearfix">
                <b>所有分类</b>
            </div>
            <div class="index_sidbar">
                <div id="changing_over">
                    <ul class="clearfix" id="show_table">
                        <li class=""  mt-ct="list01">
                            <div class="title"><span>找医生</span></div>
                            <div class="bar_pad clearfix">
                                <ul class="neike">
	                                <c:forEach items="${zhaoYiShengList }" var="list" end="7">
	                                	<li>
	                                        <a href="<%=basePath %>api/keHuPc/searchYiShengList.do?zhukelei=${list.kelei_id}" target="_blank">
	                                           	${list.zhuKeLei }
	                                        </a>
	                                    </li>
	                                </c:forEach>
	                                <c:if test="${! empty zhaoYiShengList }">
	                                	<li>
	                                        <a href="<%=basePath %>api/keHuPc/searchYiShengList.do" target="_blank">
	                                        	更多
	                                        </a>
	                                    </li>
	                                </c:if>
                                </ul>
                                <div class="clear"></div>
                            </div>
                             <!--找医生右侧详情-->
		                    <div class="Doctor_detail b-list01"  style="display: none;">
			                    <c:forEach items="${zhaoYiShengList }" var="list">
			                    	<div class="neike">
			                            <p>${list.zhuKeLei }</p>
			                            <ul>
			                            	<c:forEach items="${list.ziKeLeiList }" var="list1">
			                            		<li><a href="<%=basePath %>api/keHuPc/searchYiShengList.do?zikelei=${list1.ziKeLei }" target="_blank">${list1.ziKeLei }</a></li>
			                            	</c:forEach>
			                            </ul>
			                        </div>
			                    </c:forEach>
		                    </div>
                        </li>
                        <li class=""  mt-ct="list02">
                            <div class="title"><span>找机构</span></div>
                            <div class="bar_pad clearfix">
                                <ul class="neike">
	                                <c:forEach items="${zhaoJiGouList }" var="list" end="7">
	                                	<li>
	                                        <a href="<%=basePath %>api/keHuPc/searchJiGouList.do?dengji=${list.jiGouType}" target="_blank">
	                                           	${list.jiGouType }
	                                        </a>
	                                    </li>
	                                </c:forEach>
	                                <c:if test="${! empty zhaoJiGouList }">
	                                	<li>
	                                        <a href="<%=basePath %>api/keHuPc/searchJiGouList.do" target="_blank">
	                                        	更多
	                                        </a>
	                                    </li>
	                                </c:if>
                                </ul>
                                <div class="clear"></div>
                            </div>
                             <!--找机构右侧详情-->
		                    <div class="Doctor_detail b-list02" style="display: none;">
		                        <c:forEach items="${zhaoJiGouList }" var="list">
			                    	<div class="neike">
			                            <p>${list.jiGouType }</p>
			                            <ul>
			                            	<c:forEach items="${list.youNameList }" var="list1">
			                            		<li><a href="api/keHuPc/jiGouDetail.do?yisheng_id=${list1.id }" target="_blank">${list1.youName }</a></li>
			                            	</c:forEach>
			                            </ul>
			                        </div>
			                    </c:forEach>
		                    </div>
                        </li>
                        <li class="" mt-ct="list03">
                            <div class="title"><span>找药商</span></div>
                            <div class="bar_pad clearfix">
                                <ul class="neike">
                               		<c:forEach items="${yaoshangList }" var="list1" end="3">
                               			<li>
                                        	<a href="api/keHuPc/yaoShangDetail.do?yisheng_id=${list1.user_shanghu_id }" target="_blank">
                                        	   	${list1.youName }
                                        	</a>
                                    	</li>
                               		</c:forEach>
                               		<c:if test="${! empty yaoshangList }">
	                                	<li>
	                                        <a href="<%=basePath %>api/keHuPc/searchYaoShangList.do" target="_blank">
	                                        	更多
	                                        </a>
	                                    </li>
	                                </c:if>
                                </ul>
                                <div class="clear"></div>
                            </div>
                            
		                    <!--找药商右侧详情-->
		                    <div class="Doctor_detail b-list03" style="display: none;">
		                    	<c:forEach items="${zhaoYaoShangList }" var="list">
			                    	<div class="neike">
			                            <p>${list.yaoShangType }</p>
			                            <ul>
			                            	<c:forEach items="${list.youNameList }" var="list1">
			                            		<li><a href="api/keHuPc/yaoShangDetail.do?yisheng_id=${list1.id }" target="_blank">${list1.youName }</a></li>
			                            	</c:forEach>
			                            </ul>
			                        </div>
			                    </c:forEach>
		                    </div>
                        </li>
                        <li class="" mt-ct="list04">
                            <div class="title"><span>疑难杂症</span></div>
                            <div class="bar_pad clearfix">
                                <ul class="neike">
                                    <c:forEach items="${ynzzNameList }" var="list1" end="6">
                               			<li>
                                        	<a href="<%=basePath %>api/keHuPc/showYnzzDetail.do?ynzz_id=${list1.ynzz_id }" target="_blank">
                                        	   	${list1.ynzz_name }
                                        	</a>
                                    	</li>
                               		</c:forEach>
                                    <li>
                                        <a href="<%=basePath %>api/keHuPc/showYnzzMore.do" target="_blank">
                                        	更多
                                        </a>
                                    </li>
                                </ul>
                                <div class="clear"></div>
                            </div>
                            
		                    <!--疑难杂症右侧详情-->
		                    <div class="Doctor_detail b-list04" style="display: none;">
		                        <c:forEach items="${yiNanZaZhengList }" var="list">
			                    	<div class="neike">
			                            <p>${list.yiNanZaZhengType }</p>
			                            <ul>
			                            	<c:forEach items="${list.nameList }" var="list1">
			                            		<li><a href="<%=basePath %>api/keHuPc/showYnzzDetail.do?ynzz_id=${list1.id }" target="_blank">${list1.name }</a></li>
			                            	</c:forEach>
			                            </ul>
			                        </div>
			                    </c:forEach>
		                    </div>
                        </li>
                        <li class="" mt-ct="list05">
                           <div class="tubiao"></div>
                            <p>需求大厅</p>
                             <!--需求大厅右侧详情-->
		                    <div class="Doctor_detail b-list05" style="display: none;">
		                        <ul class="xuqiu">
		                        	<c:forEach items="${xuQiuDaTingList }" end="3" var="list">
			                        	<li>
			                                <div class="gr_info">
			                                    <div class="img4">
			                                    	<img src="static/images/zyw/yisheng1.png" alt=""/>
			                                    </div>
			                                    <span>${list.sex }</span>|
			                                    <span>${list.age }岁</span>|
			                                    <span class="spanaddress">${list.address }</span>
			                                </div>
			                                <div class="detail_info">
			                                    <div class="jb_detial">
			                                        <span>${list.disease }</span>
			                                        <span>${list.fabu_time }</span>
			                                    </div>
			                                    <p class="jb_content">${list.symptom }</p>
			                                    <ul class="pic_deatil">
			                                    	<c:forEach items="${list.imgPathList }" var="list1" end="3">
			                                    		<img width="84px;" height="82px;" src="<%=basePath %>${list1.imgPath }" alt=""/>
			                                    	</c:forEach>
			                                    </ul>
			                                </div>
			                            </li>
		                        	</c:forEach>
		                        </ul>
		                        <%--<a class="More" href="xuqiu/xuqiu.html" style="bottom: 2px;position: absolute;right: 10px;">更多&gt;&gt;</a> --%>
		                    </div>
                        </li>
                    </ul>
                                                   
                </div>
            </div>
        </div>
        <div class="navmain fl">
            <ul>
                <li class="fl"><a class="hover" href="<%=basePath %>api/keHuPc/index.do">首页</a></li>
                <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYiShengList.do">找医生</a></li>
                <li class="fl"><a href="<%=basePath %>api/keHuPc/searchJiGouList.do">找机构</a></li>
            	<li class="fl"><a href="<%=basePath %>api/keHuPc/searchYaoShangList.do">找药商</a></li>
                <li class="fl"><a href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
                <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
            </ul>
        </div>
    </div>
    <%-- 轮播图 --%>
    <div id="slideBox" class="slideBox">
        <div class="hd">
            <ul>
            	<c:forEach items="${bannerList }" varStatus="var">
            		<li class="" <c:if test="${var.index+1=='1' }">class='on'</c:if>>${var.index+1 }</li>
            	</c:forEach>
            </ul>
        </div>
        <div class="bd">
            <ul style="border-bottom: 1px solid #67D2FF;">
            	<c:forEach items="${bannerList }" var="banner">
            		<li style="display: block;"><a href="javascript:void(0);" target="_blank"><img src="<%=basePath %>${banner.PATH}"></a></li>
	            </c:forEach>
	            <%--
	            <li style="display: block;"><a href="javascript:void(0);" target="_blank"><img src="static/images/zyw/banner2.png"></a></li>
                <li style="display: block;"><a href="javascript:void(0);" target="_blank"><img src="static/images/zyw/banner2.png"></a></li>
                <li style="display: block;"><a href="javascript:void(0);" target="_blank"><img src="static/images/zyw/adv3.jpg"></a></li>
                <li style="display: block;"><a href="javascript:void(0);" target="_blank"><img src="static/images/zyw/adv3.jpg"></a></li>
                --%>
            </ul>
        </div>
    </div>
</div>
<!--常见疾病/最新公告-->
<div class="jieshao">
    <!--常见疾病-->
    <div class="changjian">
        <div class="cjjb"><p>常见疾病</p></div>
        <div class="jb_list">
            <ul>
            	<c:forEach items="${changJianJiBingList }" var="list" end="22">
            		<li><a target="_blank" href="<%=basePath %>api/keHuPc/showCjjbDetail.do?changjianjibing_id=${list.changjianjibing_id }">${list.jibing_name }</a></li>
            	</c:forEach>
                <li><a target="_blank" href="<%=basePath %>api/keHuPc/showCjjbMore.do">更多&gt;&gt;</a></li>
            </ul>
        </div>
    </div>

    <div class="slideGroup" style="margin:0 auto">
       <div class="parHd">
            <ul><li>平台公告</li><li>新闻资讯</li><%-- <li>健康常识</li> --%></ul>
        </div>
        <div class="parBd">
            <div class="slidebox">
                <ul>
                	<c:forEach items="${newsList }" var="list">
                		<li>
	                        <a target="_blank" href="<%=basePath %>api/keHuPc/getXinwenDetail.do?new_id=${list.newsandnotice_id }">
	                            <p class="content"><i></i>${list.title }</p>
	                            <span>${list.addTime }</span>
	                        </a>
                    	</li>
                	</c:forEach>
                </ul>
            </div><!-- slideBox End -->
            <div class="slidebox">
                <ul>
                    <c:forEach items="${noticeList }" var="list">
                		<li>
	                        <a target="_blank" href="<%=basePath %>api/keHuPc/getXinwenDetail.do?new_id=${list.newsandnotice_id }">
	                            <p class="content"><i></i>${list.title }</p>
	                            <span>${list.addTime }</span>
	                        </a>
                    	</li>
                	</c:forEach>
                </ul>
            </div><!-- slideBox End -->
			<%-- 
            <div class="slidebox">

                <ul>
                    <li>
                        <a href="javascript:void(0);">
                            <p class="content"><i></i>天地自古有灵气，内聚于山川，外显于风云</p>
                            <span>2017-06-02</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);">
                            <p class="content"><i></i>天地自古有灵气，内聚于山川，外显于风云</p>
                            <span>2017-06-02</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);">
                            <p class="content"><i></i>天地自古有灵气，内聚于山川，外显于风云</p>
                            <span>2017-06-02</span>
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0);">
                            <p class="content"><i></i>天地自古有灵气，内聚于山川，外显于风云</p>
                            <span>2017-06-02</span>
                        </a>
                    </li>
                </ul>

            </div><!-- slideBox End -->
			--%>
        </div><!-- parBd End -->
    </div>
</div>
<!--找医生-->
<div class="Seek">
    <div class="find">
        <div class="Seek_find">
            <i></i>
            <b>找医生</b>
            <span>名医汇集 看病不难</span>
        </div>
        <a href="<%=basePath %>api/keHuPc/searchYiShengList.do" target="_blank">更多&gt;&gt;</a>
    </div>
    <ul class="finde_list">
    	<c:forEach items="${yishengList }" var="list" end="8">
    		<li>
	            <a href="<%=basePath %>api/keHuPc/yiShengDetail.do?yisheng_id=${list.user_shanghu_id }" target="_blank">
	                <div class="top_find">
	                    <div class="img"><img src="<%=basePath %>${list.headImg }" alt=""/></div>
	                    <h1><b>${list.youName }</b><span>${list.position }</span></h1>
	                    <h3>${list.mark }</h3>
	                </div>
	                <div class="bottom_find">
	                    ${list.introduct }
	                </div>
	            </a>
	        </li>
    	</c:forEach>
    </ul>
</div>
<!--找机构-->
<div class="Seek1">
    <div class="find">
        <div class="Seek_find" id="jigou">
            <i></i>
            <b>找机构</b>
            <span>相信科学 信赖科技</span>
        </div>
        <a href="<%=basePath %>api/keHuPc/searchJiGouList.do" target="_blank">更多&gt;&gt;</a>
    </div>
    <ul class="finde_list1">
		<c:forEach items="${jigouList }" var="list" end="8">
    		<li><%--
	            <a href="<%=basePath %>api/keHuPc/jiGouDetail.do?yisheng_id=${list.user_shanghu_id }" target="_blank">
	                <div class="medicine">${list.dengji }</div>
	                <div class="medicine_bottom">
	                	
	                    <p class="hospital">${list.youName }</p>
	                    <div class="detailed">
	                        ${list.introduct }
	                        <!--<a href="javascript:void(0);">[更多]</a>-->
	                    </div>
	                    <p class="help">
	                        帮助过<span>${list.num }</span>人  | 服务评分：<span>5</span> 
	                    </p>
	                    <div class="tel">
	                        <div class="dian">电话：<span>${list.linkMethod }</span></div>
	                        <button class="btn" style="float: right">在线咨询</button>
	                    </div>
	                </div>
	            </a>
	        --%>
	        <a href="<%=basePath %>api/keHuPc/yaoShangDetail.do?yisheng_id=${list.user_shanghu_id }" target="_blank">
	        <div class="medicine">${list.dengji }</div>
	                <div class="Cottage">
	                    <div class="img1"><img src="<%=basePath %>${list.headImg }" alt=""/></div>
	                    <p class="Pharmacy">${list.youName }</p>
	                    <p>帮助过<span>${list.num }</span>人 <%-- | 服务评分：<span>4</span> --%></p>
	                    <%--<p class="Button"><button class="btn1">在线咨询</button></p>--%>
	                     
	                        <div class="dian" style="margin-left: 120px;">电话：<span>${list.linkMethod }</span></div>
	                    
	                </div>
	                <div class="Cottage_info">
	                    <span>${list.introduct }</span>
	                </div>
	            </a>
	        </li>
    	</c:forEach>
    </ul>
</div>
<!--找药商-->
<div class="Seek2">
    <div class="find">
        <div class="Seek_find" id="yaoshang">
            <i></i>
            <b>找药商</b>
            <span>奇珍异草 药到病除</span>
        </div>
        <a href="<%=basePath %>api/keHuPc/searchYaoShangList.do" target="_blank">更多&gt;&gt;</a>
    </div>
    <ul class="finde_list2">
	    <c:forEach items="${yaoShangList }" var="list" end="8">
    		<li>
	            <a href="<%=basePath %>api/keHuPc/yaoShangDetail.do?yisheng_id=${list.user_shanghu_id }" target="_blank">
	                <div class="Cottage">
	                    <div class="img1"><img src="<%=basePath %>${list.headImg }" alt=""/></div>
	                    <p class="Pharmacy">
	                    	<b>${list.youName }</b> | 
	                    	<span>
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
	                    	</span> | 
	                    	<span>${list.mark }</span>
	                    </p>
	                    <p>帮助过<span>${list.num }</span>人 <%-- | 服务评分：<span>4</span> --%></p>
	                    <%--<p class="Button"><button class="btn1">在线咨询</button></p>--%>
	                </div>
	                <div class="Cottage_info">
	                    <b>经营范围：</b>
	                    <span>${list.goodField }</span>
	                </div>
	            </a>
	        </li>
	    </c:forEach>
    </ul>
</div>
<!--公司简介-->
<div class="Seek3">
    <div class="find">
        <div class="Seek_find" id="jianjie">
            <i></i>
            <b>平台简介</b>
            <span>为人民服务</span>
        </div>
    </div>
    <div class="finde_list3">
        <div class="img3"><img src="<%=basePath %>${pingtaiPd.imgPath }" style="width: 200px;height: 150px;"/></div>
        <p>${pingtaiPd.content }</p>
    </div>
</div>
<!--底部-->
<jsp:include page="bottom.jsp"></jsp:include>
<script>
    $(function(){
    	
    	/*$(".tempWrap>ul").css("top","50px");*/
        jQuery(".slideBox").slide({mainCell:".bd ul",autoPlay:true});
    });
</script>
<!--显示右侧详情-->
<script> 
	$(" #show_table>li").mouseover(function(){
		$(this).children(".Doctor_detail").show();
		$(this).addClass("onx1").siblings().removeClass("onx1");		
	});
	$(" #show_table>li").mouseout(function(){
		$(this).children(".Doctor_detail").hide();
		$(this).removeClass("onx1");	
	})
    /*$("#show_table>li").mouseenter(function(){
        $(this).addClass("onx1").siblings().removeClass("onx1");
        var cat=$(this).attr("mt-ct");
        $(".b-"+cat+"").show().siblings().hide();
        $("#show_table").show();
    });

    $(".Doctor_detail").mouseleave(function(){
        $("#show_table").show();
        $(".Doctor_detail").hide();
        $("#show_table>li").addClass("onx1").siblings().removeClass("onx1");
    });*/
</script>
<script>
    $(function(){
        $(".top_column li a").click(function(){
            $(this).addClass("onx").parent().siblings().find("a").removeClass("onx");
            $(".gonggao").eq($(this).index()).show().siblings().hide();
            var aa=$(this).attr("mx");
            $(".a-"+aa+"").show().siblings().hide();
        });
    });
</script>
<script type="text/javascript">
/* 内层图片无缝滚动 */
jQuery(".slideGroup .slidebox").slide({ mainCell:"ul",vis:3,effect:"topMarquee",interTime:100,autoPlay:true,trigger:"click"});

/* 外层tab切换 */
jQuery(".slideGroup").slide({titCell:".parHd li",mainCell:".parBd"});
</script>
<!--顶部-->
</body>
</html>