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
		<input type="hidden" name="jigou_type_id" value="${pd.jigou_type_id}"/>
		<div id="zhongxin">
		<table style="margin: 15px 0 0 15px;">
			<tr class="info">
				<td>
					<input type="text" name="typeName" id="typeName" placeholder="输入机构类型的名称" value="${pd.typeName }"/>
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
	$("#typeName").focus();
	//保存
	function save(){
		//判断联系电话是否合法
		if($("#typeName").val()==""){
			$("#typeName").tips({
				side:3,
	            msg:'请输入机构类型的名称',
	            bg:'#AE81FF',
	            time:1.5
	        });
			$("#typeName").focus();
			return false;
		}
		//判断该疾病名称是否存在
		$.post('api/shangHu/isNameOfJiGouTypeExistence.do',{typeName:$("#typeName").val()},function(data){
			if(data.reqCode=="01"){
				//提交form表单
				$("#Form").submit();
			}else{
				$("#typeName").tips({
					side:3,
		            msg:'该名称已存在!',
		            bg:'#AE81FF',
		            time:1.5
		        });
				$("#typeName").focus();
			}
		});
	}
</script>
</body>
</html>