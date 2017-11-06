<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
  <head>
    <base href="<%=basePath%>">
    <title>微信支付</title>
  </head>
  <body onload="pay()">
		<%--
		<br><br><br><br><br><br><br>
  		<div style="text-align:center;size:30px;"><input type="button" style="width:200px;height:80px;" value="微信支付" onclick="onBridgeReady()"></div>
  		--%>
  </body>
  <script src="http://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>
  <script type="text/javascript">
	function pay(){
		var deeplink="${deeplink}";
		window.location.href=deeplink;
	}
  </script>
  
</html>
