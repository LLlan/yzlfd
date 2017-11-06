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
		
		<link href="static/zhaoyiwang/css/index1.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="static/zhaoyiwang/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
		
</head>
<body>
	<form action="api/keHuPc/${msg }.do" method="post" id="Form" enctype="multipart/form-data">
		<input type="hidden" name="guanyuwomen_id" value="${pd.guanyuwomen_id}"/>
		<input type="hidden" value="${pd.imgPath }" id="panduan">
		<div id="zhongxin">
		<table style="margin: 15px 0 0 25px;">
			<tr class="info">
				<td>图片:</td>
				<td style="height: 90px;">
					<div class="img-box" style="display:inline;margin:0;width:80px;background-color: #fff;position: absolute;top:10px;;left:27%;">
				          <section class=" img-section" style="width:80px;">
				              <div class="z_photo upimg-div clear" style="border:none; width:80px;">
				                  <section class="z_file fl"  style="margin:0;width:80px;border:1px solid #ddd">
				                  	<c:if test="${pd.imgPath!='' && pd.imgPath!=null }">
				                  		<img src="${pd.imgPath }" class="add-img" style="margin:0;width:80px;height:80px;">
				                  	</c:if>
				                  	<c:if test="${pd.imgPath=='' || pd.imgPath==null }">
				                  		 <img src="static/zhaoyiwang/images/add1.png" class="add-img" style="margin:0;width:80px;height:80px;">
				                  	</c:if>
				                      <input type="file" name="imgPathFile" id="file" class="file" value="" style="margin:0;width:100%;"/>
				                  </section>
				              </div>
				          </section>
				    </div>
				    <aside class="amask works-mask">
				        <div class="mask-content">
				            <p class="del-p ">您确定要删除作品图片吗？</p>
				            <p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
				        </div>
				    </aside>
				</td>
			</tr>
			<tr class="info">
				<td>简介:</td>
				<td>
					<textarea style="height: 400px;width: 440px;" rows="" cols="" name="content" id="content">${pd.content}</textarea>
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
	<script src="static/zhaoyiwang/js/imgUp1.js"></script>
<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		
		if($("#panduan").val()==""){//添加
			//判断头像是否合法
			if($("#file").val()==""){
				$("#file").tips({
					side:3,
		            msg:'请选择图片',
		            bg:'#AE81FF',
		            time:1
		        });
				return;
			}
		}
		//判断头像是否合法
		if($("#content").val()==""){
			$("#content").tips({
				side:3,
	            msg:'请输入简介内容',
	            bg:'#AE81FF',
	            time:1
	        });
			return;
		}
		//提交form表单
		$("#Form").submit();
	}
</script>
</body>
</html>