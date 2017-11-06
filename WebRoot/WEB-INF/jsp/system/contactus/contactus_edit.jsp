<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<base href="<%=basePath%>">
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</head>
<body>
	<form action="api/shangHu/${msg }.do" method="post" id="Form">
		<input type="hidden" name="contactus_id" value="${pd.contactus_id}"/>
		<div id="zhongxin">
		<table style="margin: 15px 0 0 25px;">
			<tr class="info">
				<td>电话:</td>
				<td>
					<input type="text" name="tel_phone" id="tel_phone" placeholder="输入联系电话" value="${pd.tel_phone }"/>
				</td>
			</tr>
			<tr class="info">
				<td>QQ:</td>
				<td>
					<input type="text" name="koukou" id="koukou" placeholder="输入QQ账号" value="${pd.koukou }"/>
				</td>
			</tr>
			<tr class="info">
				<td>微信:</td>
				<td>
					<input type="text" name="weixin" id="weixin" placeholder="输入微信账号" value="${pd.weixin }"/>
				</td>
			</tr>
			<tr class="info">
				<td>微信公众号:</td>
				<td>
					<input type="text" name="weixinpublic" id="weixinpublic" placeholder="输入微信公众号账号" value="${pd.weixinpublic }"/>
				</td>
			</tr>
			<tr class="info">
				<td>邮箱:</td>
				<td>
					<input type="text" name="email" id="email" placeholder="输入邮箱账号" value="${pd.email }"/>
				</td>
			</tr>
			<tr style="position: absolute;margin: 25px 0 0 83px;">
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();" style="margin-right: 50px;">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
	</form>
<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		//判断联系电话是否合法
		if($("#tel_phone").val()==""){
			$("#tel_phone").tips({
				side:3,
	            msg:'请输入联系电话',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#tel_phone").focus();
			return false;
		}
		//判断QQ账号是否合法
		if($("#koukou").val()==""){
			$("#koukou").tips({
				side:3,
	            msg:'输入QQ账号',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#koukou").focus();
			return false;
		}
		//判断微信账号是否合法
		if($("#weixin").val()==""){
			$("#weixin").tips({
				side:3,
	            msg:'请输入微信账号',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#weixin").focus();
			return false;
		}
		//判断微信公众号账号是否合法
		if($("#weixinpublic").val()==""){
			$("#weixinpublic").tips({
				side:3,
	            msg:'请输入微信公众号账号',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#weixinpublic").focus();
			return false;
		}
		//判断邮箱账号是否合法
		if($("#email").val()==""){
			$("#email").tips({
				side:3,
	            msg:'请输入邮箱账号',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#email").focus();
			return false;
		}
		//提交form表单
		$("#Form").submit();
	}
</script>
</body>
</html>