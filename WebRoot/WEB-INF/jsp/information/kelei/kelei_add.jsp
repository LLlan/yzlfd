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
		<title>菜单</title>
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
<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		if($("#keleiName").val()==""){
			$("#keleiName").tips({
				side:3,
	            msg:'请输入名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#keleiName").focus();
			return false;
		}
		$.post('api/shangHu/isNameOfKeLeiExistence.do',{keleiName:$("#keleiName").val(),parent_id:$("#parentId option:selected").val()},function(data){
			if(data.reqCode=='00'){
				$("#keleiName").tips({
					side:3,
		            msg:'该名称已存在',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#keleiName").focus();
			}else{
				$("#menuForm").submit();
				$("#zhongxin").hide();
				$("#zhongxin2").show();
			}
		});
	}
</script>
<body>
	<form  action="api/shangHu/${msg }.do" name="menuForm" id="menuForm" method="post" >
		<input type="hidden" name="kelei_id" value="${pd.kelei_id }">
		<div id="zhongxin">
		<table>
			<tr>
				<td>
					<select name="parent_id" id="parentId" class="input_txt">
						<option value="0">顶级科室</option>
						<c:forEach items="${list}" var="list">
							<option value="${list.kelei_id }" <c:if test="${pd.parent_id==list.kelei_id }">selected="selected"</c:if>>${list.keleiName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="keleiName" id="keleiName" placeholder="这里输入名称" value="${pd.keleiName }"/></td>
			</tr>
			<tr>
				<td style="text-align: center; padding-top: 10px;">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</body>
<script type="text/javascript">
$("#keleiName").focus();
</script>
</html>