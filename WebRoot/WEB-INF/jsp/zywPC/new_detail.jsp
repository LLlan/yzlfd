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
    <link rel="stylesheet" href="static/css/zyw/ynzz_detail.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title>${titleMsg }</title>
    <style>
        .doctor_detail>div.txt-center{
            width: 500px;
            height: 50px;
            margin: 10px auto;
        }
        #new{
            width: 1160px;
            margin:0 auto;
            overflow: hidden;
        }
        .detail_zz{
            margin-top: 20px;
            width: 100%;
            overflow: hidden;
            border: 1px solid #ddd;
            padding: 20px;
        }
        .detail_zz h1{
            width: 100%;
            height: 40px;
            line-height: 40px;
            text-align: center;
            color: #000;
            font-size: 20px;
        }
        .details{
            width: 100%;
            overflow: hidden;
            margin-top: 20px;
        }


        .details p{
            margin-top: 15px;
            font-size: 14px;
            line-height: 30px;
            text-indent: 2em;
        }
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="top.jsp"></jsp:include>
<jsp:include page="top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<div id="new">
    <div class="detail_zz">
        <h1>${xgData.title }</h1>
        <div class="details">
        	${xgData.content }
        </div>
        <div class="detail-bottom">
            <div class="Fabu">
                <p>发布时间：<span>${xgData.addTime }</span></p>
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
<jsp:include page="bottom.jsp"></jsp:include>
<!--分享-->
<script>//window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"1","bdMiniList":false,"bdPic":"","bdStyle":"1","bdSize":"16"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];</script>
</body>
</html>