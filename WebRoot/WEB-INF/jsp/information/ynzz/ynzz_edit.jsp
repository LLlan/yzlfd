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
		<%-- 引入wangEditor --%>
		<link rel="stylesheet" type="text/css" href="static/zhaoyiwang/wangEditor/fontawesome/css/font-awesome.min.css">
    	<link rel="stylesheet" type="text/css" href="static/zhaoyiwang/wangEditor/fontawesome/css/font-awesome-ie7.min.css">
    	<link rel="stylesheet" type="text/css" href="static/zhaoyiwang/wangEditor/css/wangEditor-1.1.0-min.css">
    	<script type="text/javascript" src='static/zhaoyiwang/wangEditor/js/wangEditor-1.1.0-min.js'></script>
	</head>
<body>
	<form action="api/zywkehu/${msg }.do" method="post" id="Form">
		<input type="hidden" name="ynzz_id" id="ynzz_id" value="${pd.ynzz_id}"/>
		<input type="hidden" name="category" value="${category}"/>
		<div id="zhongxin">
		<table>
			<tr class="info">
				<td width="130px">疑难杂症名称:</td>
				<td>
					<input type="text" name="ynzz_name" id="ynzz_name" placeholder="请输入疑难杂症名称" value="${pd.ynzz_name }" style="margin-top: 15px;"/>
				</td>
			</tr>
			<tr class="info">
				<td>疑难杂症介绍:</td>
				<td>
				</td>
			</tr>
			<tr class="info">
				<td></td>
				<td>
					<div id='txtDiv' style='border:1px solid #cccccc; height:270px;width: 613px;'>
						<c:if test="${pd.ynzz_context!='' && pd.ynzz_context!=null }">${pd.ynzz_context }</c:if>
						<c:if test="${pd.ynzz_context=='' || pd.ynzz_context==null }"><p>请输入内容...</p></c:if>
    				</div>
					<textarea name="ynzz_context" id="context" style="display: none"></textarea>
				</td>
			</tr>
			<tr style="position: absolute;margin: 35px 0 0 99px;">
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
	$("#ynzz_name").focus();
	var $editor = $('#txtDiv').wangEditor();
	//保存
	function save(){
	$("#context").html($editor.html());
		//判断联系电话是否合法
		if($("#ynzz_name").val()==""){
			$("#ynzz_name").tips({
				side:3,
	            msg:'请输入常见疾病的名称',
	            bg:'#AE81FF',
	            time:1.5
	        });
			$("#ynzz_name").focus();
			return false;
		}
		if($("#ynzz_id").val()==""){
		//判断该疾病名称是否存在
		$.post('api/zywkehu/getYnzzByName.do',{ynzz_name:$("#ynzz_name").val()},function(data){
			if(data.reqCode=="01"){
				//提交form表单
				$("#Form").submit();
			}else{
				$("#ynzz_name").tips({
					side:3,
		            msg:'该疾病名称已存在!',
		            bg:'#AE81FF',
		            time:1.5
		        });
				$("#ynzz_name").focus();
			}
		});
		}else{
			//提交form表单
				$("#Form").submit();
		}
	}
</script>
</body>
</html>