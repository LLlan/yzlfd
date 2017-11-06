<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <style>
        .logo {
            width: 100%;
            margin-bottom: 30px;
        }
        .logoBox {
            width: 1160px;
            height: 80px;
            line-height: 80px;
            margin: 0 auto;
            padding-top: 0px;
            position: relative;
        }
        .red1{
            background:#fff url(static/images/zyw/arrow02.png) 60px center no-repeat;background-size:16px 14px;
            border:1px solid #c1c1c1;border-bottom:none;
        }
        .red2{
            color:#38c4ff;border-bottom:2px solid #38c4ff;
        }
        .show{
            display: block;
        }
        .address {
            font-size: 14px;
        }
        a {
            text-decoration: none;
            color: #7f7f7f;
        }
    </style>
</head>
<body>
<div class="logo">
    <div class="logoBox">
        <a href="<%=basePath %>api/keHuPc/index.do"><img src="static/images/zyw/logo.jpg" alt="" width="180px" height="90px"/></a>
        <div class="searchBox">
        	<select id="type">
        		<option value="1" selected="selected">找医生</option>
        		<option value="2">找机构</option>
        		<option value="3">找药商</option>
        	</select>
            <input type="text" placeholder="请输入搜索的关键词" class="input1"/>
            <input type="button" value="搜索"  class="input2" onclick="sousuo();"/>
        </div>
        <c:choose>
        	<c:when test="${shanghuUser.identity!=null && shanghuUser.identity!='' }">
        		<a href="<%=basePath %>api/keHuPc/toServiceAdd.do" class="fabu">发布服务</a>
        	</c:when>
        	<c:otherwise>
        		<a href="<%=basePath %>api/keHuPc/toAddFaBuXuQiu.do" class="fabu">发布需求</a>
        	</c:otherwise>
        </c:choose>
    </div>
</div>
<form action="" method="post" id="searchForm">
	<input type="hidden" name="content" id="content">
</form>
<script>
	//搜索事件
	function sousuo(){
		var type=$("#type option:selected").val();
		var content=$(".input1").val();
		if(type=="1"){
			$("#searchForm").attr("action","api/keHuPc/searchYiShengList.do");
		}else if(type=="2"){
			$("#searchForm").attr("action","api/keHuPc/searchJiGouList.do");
		}else{
			$("#searchForm").attr("action","api/keHuPc/searchYaoShangList.do");
		}
		$("#content").val(content);
		$("#searchForm").submit();
	}
</script>
</body>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script>
	$(function(){
		/*var shanghuSession="${shanghuUser}";
		if($("#titleMsg").html()!="商家资质认证"){
			if(shanghuSession!=""){
				$.post('api/shangHu/isPerfectPersonInformation.do',{},function(date){
					if(date.respCode=="00"){
						layer.confirm('您的个人信息还未完善,点击确定去完善信息', {
				               btn: ['确定'],
				               title:'温馨提示',
				               closeBtn: 0,
				           	},function () {
				           		window.location.href='api/shangHu/toPersonCenterSetting.do';
				           	}
				       	);
					}else{
						$.post('api/shangHu/isStateApplyStore.do',{},function(datb){
							if(datb.respCode=="00"){
								layer.confirm('您的申请已被拒绝,点击确定重新提交申请材料', {
					                btn: ['确定'],
					                title:'温馨提示',
					                closeBtn: 0,
					            	},function () {
					            		window.location.href='api/keHuPc/toApplyStore.do';
					            	}
					        	);
							}else{
								layer.confirm('您还未提交商家资质认证材料,点击确定去提交材料', {
					                btn: ['确定'],
					                title:'温馨提示',
					                closeBtn: 0,
					            	},function () {
					            		window.location.href='api/keHuPc/toApplyStore.do';
					            	}
					        	);
							}
						});
					}
				});
			}else{
				console.log("jin11");
			}
		}*/
	});
</script>
</html>