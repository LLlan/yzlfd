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
	<form action="api/ljylshangHu/${msg }.do" method="post" id="Form" enctype="multipart/form-data">
		<input type="hidden" name="mingzhu_id" value="${pd.mingzhu_id}"/>
		<input type="hidden" name="imgPath" id="imgPath" value="${pd.imgPath}"/>
		<div id="zhongxin">
		<table style="margin: 15px 0 0 15px;">
			<tr class="info">
				<td>封面:</td>
				<td>
					<input type="file" name="imgPathFile" id="imgPathFile" value="" accept="image/gif,image/jpg,image/jpeg,image/png"/>
				</td>
			</tr>
			<tr class="info">
				<td>名称:</td>
				<td>
					<input type="text" name="mingzhuName" id="mingzhuName" placeholder="输入名称" value="${pd.mingzhuName }"/>
				</td>
			</tr>
			<tr class="info">
				<td>链接:</td>
				<td>
					<input type="text" name="mingzhuLink" id="mingzhuLink" placeholder="输入链接" value="${pd.mingzhuLink }"/>
				</td>
			</tr>
			<tr style="position: absolute;margin: 25px 0 0 60px;">
				<td style="text-align: center;">
					<a class="btn btn-mini btn-primary" onclick="save();" style="margin-right: 10px;">保存</a>
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
		if($("#imgPath").val()==""){
			if($("#imgPathFile").val()==''){
				$("#imgPathFile").tips({
					side:3,
		            msg:'封面不能为空',
		            bg:'#AE81FF',
		            time:1.5
		        });
				return false;
			}
		}
		if($("#mingzhuName").val()==''){
			$("#mingzhuName").tips({
				side:3,
	            msg:'名称不能为空',
	            bg:'#AE81FF',
	            time:1.5
	        });
			return false;
		}
		if($("#mingzhuLink").val()==''){
			$("#mingzhuLink").tips({
				side:3,
	            msg:'链接不能为空',
	            bg:'#AE81FF',
	            time:1.5
	        });
			return false;
		}
		//提交form表单
		$("#Form").submit();
	}
</script>
</body>
</html>