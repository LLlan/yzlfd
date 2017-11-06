<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String url= request.getParameter("url");
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/zyw/common.css"/>
    <link rel="stylesheet" href="static/css/zyw/toubu.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/ynzz_detail.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>疑难杂症详情</title>
    <style>
        .doctor_detail>div.txt-center{
            width: 500px;
            height: 50px;
            margin: 10px auto;
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
            <li class="fl"><a class="hover" href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div style="border-top: 1px solid #38c4ff;"></div>
<div id="zazheng">
    <div class="location">
        你的位置 &gt; <span>首页</span> &gt; <span class="xuwei">疑难杂症</span>
    </div>
    <div class="detail_zz">
        <h1>${ynzzData.ynzz_name }</h1>
        <div class="details">
        	${ynzzData.ynzz_context }
        </div>
        <div class="detail-bottom">
            <div class="Fabu">
                <p>发布时间：<span>${ynzzData.add_time }</span></p>
                <p>来源：<span>找医网</span></p>

            </div>
            <div class="bdsharebuttonbox bdshare-button-style1-16" data-bd-bind="1498704080575">
                <a href="#" class="bds_more" data-cmd="more"></a> <a title="分享到QQ空间" href="#" class="bds_qzone" data-cmd="qzone"></a>
                <a title="分享到新浪微博" href="#" class="bds_tsina" data-cmd="tsina"></a>
                <a title="分享到腾讯微博" href="#" class="bds_tqq" data-cmd="tqq"></a>
                <a title="分享到人人网" href="#" class="bds_renren" data-cmd="renren"></a> <a title="分享到微信" href="#" class="bds_weixin" data-cmd="weixin"></a>
                <!--<a class="bds_count" data-cmd="count" title="累计分享11次">11</a>-->
            </div>
        </div>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<!--分享-->
<script>//window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"1","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</body>
</html>