<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String url= request.getParameter("url");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>微信H5支付测试</title>
  </head>
  <body style="text-align: center;"><br><br><br>
  <input type="button" value="立即下单" onclick="lijixiadan('123123');"><%-- id:传递参数,所购买服务的主键ID --%>
  </body>
  <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
  <script>
  	//立即下单
	function lijixiadan(id){
		var appid = "wx07df4a5caaf79650";
		//var backUri = "http://192.168.1.88:8080/yzlfd/api/wxpay/topay";
		var backUri = "http://www.0898yzzx.com/yzlfd/api/wxpay/topay?id="+id;//这里要改成自己想回调的方法中去
		backUri = encodeURIComponent(backUri);
		console.log(backUri);
		
		var url="https://open.weixin.qq.com/connect/oauth2/authorize?appid=" 
				+ appid +"&redirect_uri=" + backUri 
				+ "&response_type=code&scope=snsapi_base&state=123#wechat_redirect";
		//scope 参数视各自需求而定，这里用scope=snsapi_base 不弹出授权页面直接授权目的只获取统一支付接口的openid,scope=snsapi_userinfo弹出授权页面
		window.location.href=url;
		$.get(url,function(data){
			
		});
		/*
		var url="https://open.weixin.qq.com/connect/qrconnect?appid="+ appid
				+"&redirect_uri="+backUri
				+"&response_type=code&scope=snsapi_userinfo&state=123#wechat_redirect";
		window.location.href=url;
		*/
		
	}
  </script>
</html>
