<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
</head>
<body>
<footer>
    <div class="footer1Box" style="background-color: #ffffff;">
        <div class="footer1" >
            <div style="max-width: 80%; margin-top: 23px;float:left;text-align:center;margin-left: 160px;margin-right: 160px;">
                <ul >
                    <li><a href="javascript:void(0)" style="padding:0;">联系我们</a></li>
                    <li><a href="javascript:void(0)">QQ：${bottomPd.koukou }</a></li>
                    <li><a href="javascript:void(0)">微信：${bottomPd.weixin }</a></li>
                    <li><a href="javascript:void(0)">公众号：${bottomPd.weixinpublic }</a></li>
                    <li><a href="javascript:void(0)">邮箱：${bottomPd.email }</a></li>
                    <li><a href="javascript:void(0)">电话：${bottomPd.tel_phone }</a></li>
                </ul>
                <%--<p style="margin-top: 30px;">Copyright&copy;2017华夏郎中行版权所有&nbsp;&nbsp;&nbsp;ICP备案号:13009187号-3</p>--%>         
                <p style="margin-top: 30px;">Copyright&copy;2017华夏郎中行版权所有</p>        
            </div>
            <%--
             <a href="javascript:void(0)" class="clean" title="扫一扫" ><img src="static/images/zyw/clean_03.png" alt="扫一扫"/><p style="margin-top:5px;">扫一扫</p></a>
        	 --%>
        </div>
    </div>
</footer>
</body>
</html>