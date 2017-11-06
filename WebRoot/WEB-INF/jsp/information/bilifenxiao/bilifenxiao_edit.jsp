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
		<input type="hidden" name="bili_fenxiao_id" value="${pd.bili_fenxiao_id}"/>
		<div id="zhongxin">
		<table style="margin: 15px 0 0 25px;">
			<tr class="info">
				<td>直接人提成比例:</td>
				<td>
					<input type="text" style="width: 100px" name="bili_fenxiao1" id="bili_fenxiao1" placeholder="输入比例数" value="${pd.bili_fenxiao1 }"/>
				</td>
			</tr>
			<tr class="info">
				<td>间接人提成比例:</td>
				<td>
					<input type="text" style="width: 100px" name="bili_fenxiao2" id="bili_fenxiao2" placeholder="输入比例数" value="${pd.bili_fenxiao2 }"/>
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
	$("#bili_fenxiao1").focus();
	//保存
	function save(){
		if(isNaN($("#bili_fenxiao1").val()) || parseFloat($("#bili_fenxiao1").val())>=1 || parseFloat($("#bili_fenxiao1").val())<0 || $("#bili_fenxiao1").val()==''){
			$("#bili_fenxiao1").tips({
				side:3,
	            msg:'请输入大于或等于0且小于1的数字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#bili_fenxiao1").focus();
			return false;
		}
		if(isNaN($("#bili_fenxiao2").val()) || parseFloat($("#bili_fenxiao2").val())>=1 || parseFloat($("#bili_fenxiao2").val())<0 || $("#bili_fenxiao2").val()==''){
			$("#bili_fenxiao2").tips({
				side:3,
	            msg:'请输入大于或等于0且小于1的数字',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#bili_fenxiao2").focus();
			return false;
		}
		//提交form表单
		$("#Form").submit();
	}
</script>
</body>
</html>