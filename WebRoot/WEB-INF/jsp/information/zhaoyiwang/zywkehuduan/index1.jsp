<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/yahu.css"/>
   <!--  <script src="http://api.map.baidu.com/api?ak=6PpXlYoFj5xXS7oRn0cIZcpz3V1O1qPH&v=2.0&services=false"></script> -->
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/jquery-weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/index.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/swiper.min.css"/>
  <!--   <script src="static/zhaoyiwang/zywkehuduan/js/jquery-1.11.0.min.js"></script> -->
    <script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/zywkehuduan/js/jquery.liMarquee.js"></script>
    <script src="static/zhaoyiwang/zywkehuduan/js/swiper.js"></script>
    <script src="static/zhaoyiwang/zywkehuduan/js/fastclick.js"></script>
    <script src="static/zhaoyiwang/zywkehuduan/js/jquery-weui.js"></script>
    <script src="static/js/jroll/jroll.js"></script>
   
    <title>首页</title>
    <style>
        .weui-tabbar__label {
            text-align: center;
            color: #999!important;
            font-size: 12px;
            line-height: 1.2;
            margin-bottom: 3px;
        }
        .mask{
			  position:fixed;z-index:600;left:0;top:0;width:100%;height:100%;background:rgba(0,0,0,0.5)
		}
		.disease_res{
			background-color:#fff;
		}
		.disease_res ul li{
			width: 33%;
			float:left;
			height: 30px;
			line-height: 30px;
			text-align: center;
			background-color: #fff;
		}
		.wrapper{
			-webkit-transform:translate3d(0,0,0);
			-webkit-overflow-scrolling:touch;
		}
		
		
		 #topNav, #topNav1 ,#topNav2{
            width: 100%;
            overflow: hidden;
            border-bottom:1px solid #f8f8f8;
        }

        #topNav .swiper-slide, #topNav1 .swiper-slide, #topNav2 .swiper-slide{
            padding: 0 5px;
            letter-spacing:2px;
            width:170px;
            
        }
        /*#topNav .swiper-slide span{*/

            /*transition:all .3s ease;*/
            /*display:block;*/
        /*}*/
        .img2,.img2 img{
        	margin-top:3px;
            float: left;
            width: 70px;
            /*height: 70px;*/
            height: 90px;
            margin-right:5px;
        }
        #topNav .swiper-slide span.font-14,#topNav1 .swiper-slide span.font-14,#topNav2 .swiper-slide span.font-14{
        	
            font-size: 12px;
            height:18px;
            line-height:18px;
            color:#333;
           
            display: block;
            width: 75px;
            margin-left: 5px;
            white-space: nowrap;
            text-overflow:ellipsis;
            overflow: hidden;
            margin-bottom:8px;
        }
          #topNav .swiper-slide span.font-12,#topNav1 .swiper-slide span.font-12,#topNav2 .swiper-slide span.font-12{
           height:18px;
            line-height:18px;
          	 font-size: 12px;
          	
           	color:#333;
            display: block;
            width: 75px;
            margin-left: 5px;
            white-space: nowrap;
            text-overflow:ellipsis;
            overflow: hidden;
            margin-bottom:8px;
          }
        #topNav .swiper-slide a, #topNav1 .swiper-slide a,#topNav2 .swiper-slide a{
            display: inline-block;
            width: 170px;
            color:#333;
        }
        .message {
		    position: absolute;
		    right: 10px;
		    top: 15px;
		    width: 23px;
		    height: 23px;
		}
		.title1 b, .title1 b {
		    float: left;
		    margin-top: 10px;
		    border-top: 2px solid #000;
		    width: 25px;
		    border-radius: 5px;
		}
		.title1 {
		    width: 135px;
		    margin: 0 auto;
		    padding: 10px 0;
		}	
		.bot60 {
		    width: 100%;
		    height: 50px;
		}	
		
		
		.code{
			width: 100%;
		    overflow: hidden;
		    padding: 10px 7%;
		    margin:10px 0;
		    background-color: green;
		}
		.code_l{
			width: 70%;
		    overflow: hidden;
		    color: #fff;
		    float: left;
		    line-height: 25px;
		    font-size: 14px;
		}
		.code_r{
			float:rigth;
			width: 30%;
    		overflow: hidden;
		}
		.code_r img{
			width: 90px;
		    height: 90px;
		    margin-top: 4px;
		}
		.down{
			width: 100%;
		    height: 90px;
		    padding: 10px 0;
		    background-color: #fff;
		    text-align: center;
		    margin-bottom: 10px;
		}
		.down p:first-child{
			width: 165px;
		    height: 40px;
		    line-height: 40px;
		    margin: 0 auto;
		    text-align: center;
		}
		.down p:first-child img{
			float: left;
		    width: 40px;
		    margin-right: -4px;
		    /* text-indent: 20px; */
		    height: 40px;
		    vertical-align: middle;
		}
		.down p:first-child span{
			font-size: 20px;
		    color: #000;
		    display: inline-block;
		    margin-top: -1px;
		    margin-left: 4px;
		}
		.down p:last-child{
			text-align:center;
			font-size:15px;
			color:#000;
			height:40px;
			line-height:40px;		
		}
    </style>
</head>
<body>

<div class="wy-header" style="width: 100%;position: fixed;top: 0;left: 0;z-index: 9999;">
    <div class="wy-header-icon-back"><i></i><span id="baidu" class="address"></span></div>
    <%-- <c:if test="${pd.kehu_userId!=''and not empty pd.kehu_userId and pd.kehu_userId!=null}"> --%>
   	 <div class="message"><img src="static/zhaoyiwang/zywkehuduan/images/msg-3.png" onclick="toMessageCenter()"></div>
   	 <input type="hidden" id="kehu_id">
   	 <input type="hidden" id="kehu_name">
    <%-- </c:if> --%>
</div>

<div class="main" style="margin-top: 50px;">
   <!-- 
    <div class="sea-524">
        <div class="sea_box1030 margin_b3">
            <input id="search" type="button" value="搜索" >
            <input type="text" placeholder="请输入关键词" id="idDoctors" value="">
        </div>
    </div> -->
    <!--轮播图-->
    <div class="swiper-container" >
        <!-- Additional required wrapper -->
        <div class="swiper-wrapper">
            <!-- Slides -->
            <c:forEach items="${bannerList }" var="banner">
           		 <div onclick="window.location.href='${banner.LINK}'" class="swiper-slide"><img src="${banner.PATH}"/></div>
            </c:forEach>
        </div>
        <!-- If we need pagination -->
        <div class="swiper-pagination"></div>
    </div>
    <!--找医生-->
    <div class="weui-flex">
        <div class="weui-flex__item">
            <div class="nav1">
                <ul>
                    <li>
                        <a href="<%=basePath%>/api/ljylkehu/index.do">
                            <i><img src="static/zhaoyiwang/zywkehuduan/images/ljylm.png"></i>
                            旅居养老
                        </a>
                    </li>

                    <li>
                        <a href="<%=basePath%>/api/ybxkehu/index.do" >
                            <i><img src="static/zhaoyiwang/zywkehuduan/images/gwzhym.png"></i>
                           字画古玩苑
                        </a>
                    </li>
                     <li>
                        <a href="<%=basePath%>/api/zywkehu/index.do">
                            <i><img src="static/zhaoyiwang/zywkehuduan/images/hxlzhm.png"></i>
                            华夏郎中行
                        </a>
                    </li> 
                    <li><!-- <%=basePath%>/api/zywkehu/getYnzzList.do -->
                        <a href="javascript:void(0)" onclick="lijizixun();">
                            <i><img src="static/zhaoyiwang/zywkehuduan/images/gwc.png"></i>
                           巨惠商城
                        </a>
                    </li>

                </ul>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
    <div class="weui-flex" style="margin-top: -20px;">
        <div class="weui-flex__item">
            <div class="nav1">
                <ul>
                    <li>
                        <a href="<%=basePath%>api/ljylkehu/goDoctor.do?type=5">
                            <i><img src="static/images/zyw/lvju.png"></i>
                            旅居风光
                        </a>
                    </li>

                    <li>
                        <a href="<%=basePath%>api/ybxkehu/goDoctor.do?type=7" >
                            <i><img src="static/images/zyw/cangpin.png"></i>
                            字画展示
                        </a>
                    </li>
                     <li>
                        <a href="<%=basePath%>api/zywkehu/goDoctor.do">
                            <i><img src="static/zhaoyiwang/zywkehuduan/images/yisheng.png"></i>
                            找医生
                        </a>
                    </li> 
                    <li><!-- <%=basePath%>api/zywkehu/getYnzzList.do -->
                        <a href="javascript:void(0)" onclick="lijizixun();">
                            <i><img src="static/zhaoyiwang/zywkehuduan/images/tm.png"></i>
                          特卖
                        </a>
                    </li>

                </ul>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>
    <!--最新新闻-->
    <div class="news_notice">
        <div class="news">
            <p>最新动态</p>
            <ul style="height:116px;overflow:hidden;">
	            <c:forEach items="${xinwenlist }" var="xinwen">
	                <li><a href="<%=basePath%>/api/zywkehu/getXinwenDetail.do?new_id=${xinwen.newsandnotice_id}">${xinwen.title}</a></li>
	             </c:forEach>
            </ul>
            <a href="<%=basePath%>api/zywkehu/xinwenList.do?category=1">更多&gt;&gt;</a>
        </div>
        <div class="notice">
            <p>平台公告</p>
            <ul  style="height:116px;overflow:hidden;">
            	 <c:forEach items="${gonggaolist }" var="gg">
	                <li><a href="<%=basePath%>api/zywkehu/getXinwenDetail.do?new_id=${gg.newsandnotice_id}">${gg.title}</a></li>
	           </c:forEach>
            </ul>
            <a href="<%=basePath%>api/zywkehu/gonggaoList.do?category=2">更多&gt;&gt;</a>
        </div>
    </div>
    <!--按问题找医生-->
    <!--<div class="weui-flex">
        <div class="weui-flex__item">
            <div class="nav2">
                <ul>
                    <li>
                        <a href="<%=basePath%>/api/ljylkehu/index.do">
                            <i><img src="static/images/zyw/lvju.png" alt="旅居养老"></i>
                            	旅居养老
                        </a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/api/ybxkehu/index.do">
                            <i><img src="static/images/zyw/cangpin.png" alt="宝石字画"></i>
                         	   	宝石字画
                        </a>
                    </li>
                    <li>
                        <a href="<%=basePath%>/api/zywkehu/goDoctor.do">
                            <i><img src="static/zhaoyiwang/zywkehuduan/images/zys/more.png" alt="更多"></i>
                         	   更多
                        </a>
                    </li>
                </ul>
                <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>-->
    <!--名著-->
    <!--<div class="master">
        <div class="master_lf">
            <img src="static/zhaoyiwang/zywkehuduan/images/zys/mingzhu_03.png" alt=""/>
        </div>
        <div class="master_rt">
            <ul>
            <c:forEach items="${mingzhulist }" var="mz">
                <li>
                		<a href="${mz.mingzhuLink }">
                   	 <div class="img1"><img src="${mz.imgPath }" alt=""/></div>
                    	<p>${mz.mingzhuName }</p>
               		</a>
                </li>
              </c:forEach> 
            </ul>
        </div>
    </div>-->
    <!--找机构-->
    <div class="doctor">
        <div class="title1">
            <div class="row">
                <b></b>
                <h5>旅居风光</h5>
                <b></b>
            </div>
            <a href="<%=basePath%>api/ljylkehu/goDoctor.do?type=5">更多&gt;&gt;</a>
        </div>
       <%--  <div class="wrapper wrapper01" id="wrapper02">
            <div class="scroller">
                <ul class="clearfix">
                 <c:forEach items="${jigouList}" var="yisheng">
                    <li class="jigou" onclick="getDetail('${yisheng.user_shanghu_id}','机构')">
                        <a href="javascript:void(0)">
                            <div class="img2">
                                <img src="${yisheng.headImg }" alt=""/>
                            </div>
                            <span class="font-14">${yisheng.youName }</span>
                            <span>擅长领域：${yisheng.goodField }</span>
                        </a>
                    </li>
                  </c:forEach> 
                </ul>
            </div>
        </div> --%>
        
           <div id="topNav1" class="swiper-container1">
            <div class="swiper-wrapper">
            
            
	                <c:forEach items="${jigouList}" var="yisheng">
	                
	                <div class="swiper-slide " style="width: 180px;">
	                    <a href="api/ljylkehu/getYishengDetail.do?yisheng_id=${yisheng.user_shanghu_id}&name=医生&type=5&zjh=1">
	                        <div class="img2" style="width: 160px;">
	                        	<!--  
	                            <img src="${yisheng.headImg }"  style="width: 160px;"/>
	                            <img src="static/zhaoyiwang/zywkehuduan/images/123.jpg" style="width: 160px;"/>
	                            -->
	                            <img src="${yisheng.headImg }"  style="width: 160px;"/>
	                            
	                        </div>
	                        <!--  
	                        <span class="font-14">${yisheng.youName }</span>
	                        <span class="font-12">${yisheng.dengji}</span>
	                        -->
	                    </a>
	                </div></c:forEach>  
	             <!--  
	             <c:forEach items="${jigouList}" var="yisheng">
                 </c:forEach>  
                 -->
                 
            </div>
        </div>
        

        
   
    </div>
    <!--找药商-->
    <div class="doctor">
        <div class="title1">
            <div class="row">
                <b></b>
                <h5>字画展示</h5>
                <b></b>
            </div>
            <a href="<%=basePath%>api/ybxkehu/goDoctor.do?type=7">更多&gt;&gt;</a>
        </div>
       <%--  <div class="wrapper wrapper01" id="wrapper03">
            <div class="scroller">
                <ul class="clearfix">
                  <c:forEach items="${yaoshangList}" var="yisheng">
                    <li class="jigou" onclick="getDetail('${yisheng.user_shanghu_id}','药商')">
                        <a href="javascript:void(0)">
                            <div class="img2">
                                <img src="${yisheng.headImg }" alt=""/>
                            </div>
                            <span class="font-14">${yisheng.youName }</span>
                            <span>擅长领域：${yisheng.goodField }</span>
                        </a>
                    </li>
                 </c:forEach>  
                </ul>
            </div>
        </div> --%>
        
        
          <div id="topNav2" class="swiper-container1">
            <div class="swiper-wrapper">
                <c:forEach items="${yaoshangList}" var="yisheng">
	                <div class="swiper-slide ">
	                    <a href="api/ybxkehu/getYishengDetail.do?yisheng_id=${yisheng.user_shanghu_id}&name=医生&type=7">
	                        <div class="img2"  style="width: 160px;">
	                            <img src="${yisheng.headImg }"  style="width: 160px;"/>
	                        </div>
	                        <!--  
	                        <span class="font-14">${yisheng.youName }</span>
	                        <span class="font-12">
	                        <c:if test="${yisheng.category eq '1'}">中药</c:if>
	                        <c:if test="${yisheng.category eq '2'}">西药</c:if>
	                        <c:if test="${yisheng.category eq '3'}">中药/西药</c:if>
	                        </span>
	                        -->
	                    </a>
	                </div>
                 </c:forEach>  
            </div>
        </div>
    </div>
    <!--找医生-->
    <div class="doctor">
        <div class="title1">
            <div class="row">
                <b></b>
                <h5>找医生</h5>
                <b></b>
            </div>
            <a href="<%=basePath%>/api/zywkehu/goDoctor.do">更多&gt;&gt;</a>
        </div>
        <%-- <div class="wrapper wrapper01" id="wrapper01">
            <div class="scroller">
                <ul class="clearfix">
                <c:forEach items="${yishengList}" var="yisheng">
                    <li class="jigou">
                        <a href="api/zywkehu/getYishengDetail.do?yisheng_id=${yisheng.user_shanghu_id}&name=医生">
                            <div class="img2">
                                <img src="${yisheng.headImg }" alt=""/>
                            </div>
                            <span>${yisheng.youName }</span>
                            <span>${yisheng.keshiName }</span>
                            <span>${yisheng.position }</span>
                        </a>
                    </li>
                  </c:forEach>  
                </ul>
            </div>
        </div> --%>
        
         <div id="topNav" class="swiper-container1">
            <div class="swiper-wrapper">
                <c:forEach items="${yishengList}" var="yisheng">
	                <div class="swiper-slide ">
	                    <a href="api/zywkehu/getYishengDetail.do?yisheng_id=${yisheng.user_shanghu_id}&name=医生&identity=1&zjh=1">
	                        <div class="img2">
	                            <img src="${yisheng.headImg }" alt=""/>
	                        </div>
	                        <span class="font-14">${yisheng.youName }</span>
	                        <span class="font-12">${yisheng.keshiName }</span>
	                        <span class="font-12">${yisheng.position }</span>
	                    </a>
	                </div>
                 </c:forEach>  
            </div>
        </div>
        
    </div>
    
   
   
   <!--
   <div class="code">
        <div class="code_l">
        	<p>常按二维码</p>
        	<p>关注公众号</p>
        	<p>提现、直播</p>
        	<p>重要通知早知道</p>
        </div>
        <div class="code_r">
        	<img src="static/zhaoyiwang/zywkehuduan/images/ewm.png"/>
        </div>
    </div>
    -->
    <div class="down">
    	<p onclick="downAPK()"><img src="static/zhaoyiwang/zywkehuduan/images/todown.png"/><span>戳我下载APP</span></p>
    	<p>苹果APP待开发</p>
    </div>
    
    <!--常见疾病-->
    <!--<div class="disease_res">
        <div class="title1">
            <div class="row">
                <b></b>
                <h5>常见疾病</h5>
                <b></b>
            </div>
        </div>
        <ul style="background:#fff;overflow:hidden;width:100%;">
        <c:forEach items="${jibinglist }" var="jibing" end="10">
            <li onclick="showChangjianjibingDetailByID('${jibing.changjianjibing_id}')"><a href="javascript:void(0)">${jibing.jibing_name}</a></li>
         </c:forEach>
         <li><a href="<%=basePath%>api/zywkehu/changjianjibing.do">更多&gt;&gt;</a></li>
        </ul>
    </div>-->
    <!--公司简介-->
   <!--<div class="bottom">
        <div class="zhuce">
        <div class="link">
            <a href="javascript:void(0)">APP下载：</a>
            <span style="color: blue"></span><a href="javascript:void(0)" onclick="downAPK()">快戳我</a>
        </div>
    </div> -->
    <!--底部间隙60px-->
    <div class="weui-flex clearfix">
        <div class="bot60"></div>
    </div>
</div>
<!--底部导航-->
<div class="weui-tabbar wy-foot-menu">
    <a href="<%=basePath%>api/zywkehu/index1.do" id="sy" onclick="abc(this)" class="weui-tabbar__item weui-bar__item--on">
        <div class="weui-tabbar__icon foot-menu-home"></div>
        <p class="weui-tabbar__label">首页</p>
    </a>
    <a href="<%=basePath%>api/ljylkehu/index.do" id="sy" onclick="abc(this)" class="weui-tabbar__item">
        <div class="weui-tabbar__icon foot-menu-ljyl"></div>
        <p class="weui-tabbar__label">旅居养老</p>
    </a>
    <a href="<%=basePath%>api/ybxkehu/index.do" id="cjjb" onclick="abc(this)" class="weui-tabbar__item">
        <div class="weui-tabbar__icon foot-menu-zhbs"></div>
        <p class="weui-tabbar__label">字画宝石</p>
    </a>
    <a href="<%=basePath%>api/zywkehu/index.do" id="fbxq" onclick="abc(this)" class="weui-tabbar__item">
        <div class="weui-tabbar__icon  foot-menu-hxlz"></div>
        <p class="weui-tabbar__label">华夏郎中</p>
    </a>
    <a href="<%=basePath%>api/zywkehu/connectUs.do?zjh=1" id="lxwm" onclick="abc(this)" class="weui-tabbar__item">
        <div class="weui-tabbar__icon foot-menu-contact"></div>
        <p class="weui-tabbar__label">联系我们</p>
    </a>
    <a href="<%=basePath%>api/zywkehu/huiyuanzhongxin.do?zjh=1" id="hyzx"  onclick="abc(this)" class="weui-tabbar__item">
        <div class="weui-tabbar__icon foot-menu-user"></div>
        <p class="weui-tabbar__label">个人中心</p>
    </a>
</div>
<!-- 弹窗提示 begin -->
<div class="mask" style="display: none;"></div>
<div class="weui-cells2" style="display:none;width:73%;height:135px;position: fixed;top:220px;left:13%;background-color: #fff;z-index: 99999;border-radius: 5px;">
  <div id="xiazai2" style="padding: 15px 20px;border-bottom: 1px solid #eee;text-align: center;height:79px;line-height: 79px">
    	您还没有登录，马上去？
  </div>
  <div id="quxiao2" style="color: #000;width: 100%;height:56px;line-height:56px;text-align: center;">
    <p class="cancel">确定</p>
  </div>
</div>
<!-- 弹窗提示 end -->
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script src="static/zhaoyiwang/zywkehuduan/js/jquery.lazyload.js?v=1.9.1"></script>
<script type="text/javascript">
    var mySwiper = new Swiper('#topNav', {
        freeMode: true,
        freeModeMomentumRatio: 0.5,
        slidesPerView: 'auto',

    });
    var mySwiper = new Swiper('#topNav1', {
        freeMode: true,
        freeModeMomentumRatio: 0.5,
        slidesPerView: 'auto',

    });
    var mySwiper = new Swiper('#topNav2', {
        freeMode: true,
        freeModeMomentumRatio: 0.5,
        slidesPerView: 'auto',

    });
    swiperWidth = mySwiper.container[0].clientWidth
    maxTranslate = mySwiper.maxTranslate();
    maxWidth = -maxTranslate + swiperWidth / 2
 
</script>
<script>
$(function(){
		var kehu_id = "${pd.kehu_userId}";
		var userName = "${pd.kehu_userName}";
		$("#kehu_id").val(kehu_id);
		$("#kehu_name").val(userName);
	//var jroll = new JRoll("#wrapper01", {scrollBarX:false});
	/* var mjroll = new JRoll("#wrapper02",{
		scroll:true,
		scrollX: true,
		scrollY: false,
		preventDefault:false
	});  */
	
	//使用iscroll出现滑动卡顿解决办法
      	/*$("#wrapper01").addEventListener('touchmove',function(e){
     		e.preventDefault();
     	},false);*/
    	
     	/* $("#wrapper02").addEventListener('touchmove',function(e){
    		e.preventDefault();
    	},false);
     	$("#wrapper03").addEventListener('touchmove',function(e){
    		e.preventDefault();
    	},false);
    	 */
    		//jq加载延迟图片
		$("img").lazyload({effect: "fadeIn"});
	
		
});
</script>
<script>
	function downAPK(){
		 /*layer.confirm('您现在要去下载APP（如果你正在使用的是APP可以点击取消按钮）', {
 			                btn: ['确定','取消'],
 			                title:'温馨提示',
 			                closeBtn:0,
 			            	},function () {
 			            		window.location.href='api/zywkehu/goDownAPK.do';
 			            	},function(){
 			            		//donot do anything
 			            	}
 			    );*/
 		layer.open({
 			content:'确定下载APP？'
 			,btn:['确定','取消']
 			,yes:function(index){
 				window.location.href='api/zywkehu/goDownAPK.do';
 			}
 			,no:function(index){
 				layer.close(index);
 			}
 		});
	}


	//去客户端消息中心
	function toMessageCenter(){
		var kehu_id = $("#kehu_id").val();
		var userName = $("#kehu_name").val();
		if(kehu_id==""||kehu_id==null){
			/*layer.msg("请您先登录才能查看消息中心！",{
    		            time:2000,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
    		            icon:5,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		        });*/
			layer.open({
	 			content:'请您先登录才能查看消息中心！'
	 			,skin:'msg'
	 			,time:2
	 		});       
		}else{
			location.href="<%=basePath%>api/zywkehu/toMessageCenter.do?kehu_userId="+kehu_id+"&kehu_userName="+userName; 
		}
	}

	function showChangjianjibingDetailByID(id){
		location.href='api/zywkehu/showChangjianjibingDetailByID.do?changjianjibing_id='+id; 
	}

 	function getDetail(id,name,identity){
			window.location.href='<%=basePath%>/api/zywkehu/getYishengDetail.do?yisheng_id='+id+'&name='+name+'&identity='+identity;
    }
		
    $(function () {
       //判断是不是扫码注册的，要提示客户去下载app
        var twoDimensioncode_id = "${twoDimensioncode_id}";
        FastClick.attach(document.body);
      	 abc();
      	 //checkSession(twoDimensioncode_id);
    });
    
    function lijizixun(){
   			layer.open({
   	 			content:'功能开发中,敬请期待!'
   	 			,btn:['确定','取消']
   	 			,yes:function(index){
   	 				layer.close(index);
   	 			}
   	 			,no:function(index){
   	 				layer.close(index);
   	 			}
   	 		});
    		 
    		 /*layer.alert("开发中！！敬请期待。",{
	            title:"温馨提示"//提示标题，默认为：信息
	            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
	            ,anim: 0 //动画类型0-6，默认为：0
	            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
	            ,btn: ['确定'] //按钮
	            ,icon: 6    // icon
		          
       		 });*/
    	}
    
      	function abc(e1){
			$(e1).addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
		}
		
		//判断session是否存在 做相应的提示
		function checkSession(twoDimensioncode_id){
			var respCode = "${respCode}";
			var tag = "${tag}";
			if(respCode=="01"){
				if(tag=="1"){
					/*layer.msg("登录成功！",{
    		            time:1500,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
    		            icon:1,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		        });*/
    		        setTimeout(function(){
    		        	location.href="<%=basePath%>api/zywkehu/index.do?twoDimensioncode_id="+twoDimensioncode_id;
    		        },100);
				}else{
					  if(twoDimensioncode_id!=""){
						  layer.open({
					 			content:'您现在使用的是网页版，马上去下载APP?'
					 			,btn:['确定','取消']
					 			,yes:function(index){
					 				window.location.href='api/zywkehu/goDownAPK.do';
					 			}
					 			,no:function(index){
					 				layer.close(index);	
					 			}
					 		});
					      	 /*layer.confirm('您现在使用的是网页版，马上去下载APP?', {
					   			                btn: ['确定','取消'],
					   			                title:'温馨提示',
					   			                closeBtn:0,
					   			            	},function () {
					   			            		window.location.href='api/zywkehu/goDownAPK.do';
					   			            	}, function(){
					                         		
					              				}
					   			); */
			      		 }
				}
				
			}else{
		 			
		 			
		 			/* $(".mask").fadeIn();
			     	 $(".weui-cells2").fadeIn();
			     	 $(".cancel").click(function(){
			        	 $(".mask").fadeOut();
			        	 $(".weui-cells2").fadeOut();
			        	 window.location.href='api/zywkehu/toLogin.do';
			      	}); */
			 	/* layer.confirm('您还没有登录，马上去？', {
   			                btn: ['确定'],
   			                title:'温馨提示',
   			                closeBtn:0,
   			            	},function () {
   			            		window.location.href='api/zywkehu/toLogin.do';
   			            	}, function(){
                         		alert(222)
              				}
   			       ); */
   			       
				      	
			}
		}
		
		//判断用户有没有登录，有则提示，没有则去登录
		function toLogin(){
				var url = 'api/zywkehu/toLogin.do';
				var respCode = "${respCode}";
				if(respCode=="01"){
					/*layer.msg("您已登录！",{
    		            time:1500,//单位毫秒
    		            shade: [0.8, '#393D49'], // 透明度  颜色
    		            //style: 'background: rgba(216,100,125,0.9); color:#fff; border:none;',
    		            icon:1,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    		        });*/
					layer.open({
			 			content:'您已登录！'
			 			,skin:'msg'
			 			,time:1.5
			 		});
			}else{
				window.location.href=url;
			}
		}
</script>
<!--轮播图-->
<script>
    $(".swiper-container").swiper({
        loop: true,
        autoplay: 3000
    });
</script>
<script type="text/javascript" src="static/zhaoyiwang/zywkehuduan/js/flexible.js"></script>
<script type="text/javascript" src="static/zhaoyiwang/zywkehuduan/js/iscroll.js"></script>
<script type="text/javascript" src="static/zhaoyiwang/zywkehuduan/js/navbarscroll.js"></script>
<script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=f2C9QaeY2zU9joj3Z34DG2gThH70Pwzl"></script>
<script type="text/javascript">
    $(function(){
      // 百度地图API功能
        var map = new BMap.Map("allmap");
        var point = new BMap.Point(116.331398,39.897445);
        function myFun(result){
            var cityName = result.name;
           // alert("当前定位城市:"+cityName);
            $(".address").text(cityName);
        }
        var myCity = new BMap.LocalCity();
        myCity.get(myFun);

        //demo示例一到四 通过lass调取，一句可以搞定，用于页面中可能有多个导航的情况
       // $('.wrapper').navbarscroll();

    });
   
</script>

</body>
</html>