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
	<form action="api/ljylshangHu/${msg }.do" method="post" id="Form">
		<input type="hidden" name="cunkuan_lilv_id" value="${pd.cunkuan_lilv_id}"/>
		<div id="zhongxin">
		<table style="margin: 15px 0 0 25px;">
			<tr class="info">
				<td>三个月的存款利率:</td>
				<td>
					<input type="text" name="cunkuan_lilv3" id="cunkuan_lilv3" placeholder="输入三个月的存款利率" value="${pd.cunkuan_lilv3 }"/>
				</td>
			</tr>
			<tr class="info">
				<td>六个月的存款利率:</td>
				<td>
					<input type="text" name="cunkuan_lilv6" id="cunkuan_lilv6" placeholder="输入六个月的存款利率" value="${pd.cunkuan_lilv6 }"/>
				</td>
			</tr>
			<tr class="info">
				<td>十二个月的存款利率:</td>
				<td>
					<input type="text" name="cunkuan_lilv12" id="cunkuan_lilv12" placeholder="输入十二个月的存款利率" value="${pd.cunkuan_lilv12 }"/>
				</td>
			</tr>
			<tr style="position: absolute;margin: 25px 0 0 120px;">
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
	</form>
<script type="text/javascript">
	$(top.hangge());
	$("#cunkuan_lilv3").focus();
	//保存
	function save(){
		//提交form表单
		$("#Form").submit();
	}
</script>
</body>
</html>