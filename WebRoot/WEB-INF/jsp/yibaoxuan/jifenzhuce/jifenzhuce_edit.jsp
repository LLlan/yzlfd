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
	<form action="api/ybxshangHu/${msg }.do" method="post" id="Form">
		<input type="hidden" name="jifen_zhuce_id" value="${pd.jifen_zhuce_id}"/>
		<div id="zhongxin">
		<table style="margin: 15px 0 0 25px;">
			<tr class="info">
				<td>注册送积分数:</td>
				<td>
					<input type="text" style="width: 100px" name="jifen_zhuce_number" id="jifen_zhuce_number" placeholder="输入送积分数量" value="${pd.jifen_zhuce_number }"/>
				</td>
			</tr>
			<tr style="position: absolute;margin: 25px 0 0 55px;">
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
	$("#jifen_zhuce_number").focus();
	//保存
	function save(){
		//只能为大于或等于0的整数
		reg=/^(0|\+?[1-9][0-9]*)$/;
		//判断邮箱账号是否合法
		if(!reg.test($("#jifen_zhuce_number").val())){
			$("#jifen_zhuce_number").tips({
				side:3,
	            msg:'请输入大于或等于0的整数',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#jifen_zhuce_number").focus();
			return false;
		}
		//提交form表单
		$("#Form").submit();
	}
</script>
</body>
</html>