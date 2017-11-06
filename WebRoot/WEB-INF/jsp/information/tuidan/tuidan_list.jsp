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
	<link rel="stylesheet" href="static/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="static/css/bootstrap-responsive.min.css"/>
	<link rel="stylesheet" href="static/css/font-awesome.min.css" />
	<link rel="stylesheet" href="static/css/ace.min.css" />
	<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="static/css/ace-skins.min.css" />
	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
	<!-- 引入 -->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
<script src="static/zhaoyiwang/layer/layer.js"></script>
<style type="text/css">
/*基本信息显示样式*/
#lookDetailInformation table td{border: 2px solid rgb(226, 226, 226);}
#lookDetailInformation table{margin: 10px 10px 0 10px;font-family: cursive;font-size: 14px;width: 600px;height: 368px}
.secondtd{padding: 0 0 0 10px;}
.firsttd{width: 100px;}
</style>
</head>
<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	<!-- 检索  -->
	<form action="<%=basePath%>api/shangHu/tuidanlistPage.do" method="post" id="myForm">
	<input type="hidden" name="identity" id="identity" value="${pd.identity }">
	<input type="hidden" name="order_state" value="${pd.order_state }">
	<table>
		<tr>
			<td>
				<span class="input-icon">
					<input style="width: 145px;" autocomplete="off" id="nav-search-input" type="text" name="searchName" value="${pd.searchName }" placeholder="这里输入订单编号" />
					<i id="nav-search-icon" class="icon-search"></i>
				</span>
			</td>
			<td style="vertical-align:top;">
				<button class="btn btn-mini btn-light" title="检索">
					<i id="nav-search-icon" class="icon-search"></i>
				</button>
			</td>
		</tr>
	</table>
	<!-- 检索  -->
	<table id="table_report" class="table table-striped table-bordered table-hover">
		<thead>
		<tr>
			<%-- 
			<th class="center">
				<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
			</th>
			--%>
			<th class="center"  style="width: 20px;">序号</th>
			<th class='center'>订单编号</th>
			<th class='center'>支付方式</th>
			<th class='center'>支付编号</th>
			<th class='center'>操作时间</th>
			<th class='center'>客户实际价格</th>
			<c:if test="${list.size()>0 && list[0].order_state=='0'}">
				<th class='center' style="width: 74px;">操作</th>
			</c:if>
			
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="var" varStatus="vs">
				<tr>
					<%--
					<td class='center' style="width: 30px;">
				 		<label><input type='checkbox' name='ids' value="${var.user_shanghu_id }"/><span class="lbl"></span></label>
					</td>
					--%>
					<td class='center' style="width: 30px;">${vs.index+1}</td>
					<td class='center'>${var.order_number}</td>
					<td class='center'>${var.pay_method}</td>
					<td class='center'>${var.pay_number}</td>
					<td class='center'>${var.complete_time}</td>
					<td class='center'>${var.kehuPrice}</td>
					<c:if test="${var.order_state=='0' }">
						<c:choose>
							<c:when test="${var.identity=='1' }">
								<td style="width: 68px;">
									<a class='btn btn-mini btn-info' onclick="tuidan('${var.order_yisheng_id }');">确认已处理</a>
								</td>
							</c:when>
							<c:when test="${var.identity=='2' }">
								<td style="width: 68px;">
									<a class='btn btn-mini btn-info' onclick="tuidan('${var.order_jigou_id }');">确认已处理</a>
								</td>
							</c:when>
							<c:otherwise>
								<td style="width: 68px;">
									<a class='btn btn-mini btn-info' onclick="tuidan('${var.order_yaoshang_id }');">确认已处理</a>
								</td>
							</c:otherwise>
						</c:choose>
					</c:if>
				</tr>
				</c:forEach>
			</c:when>
			<c:otherwise>
				<tr>
				<td colspan="100" class="center">没有相关数据</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<%--<td style="vertical-align:top;width:50px;">
					<a class="btn btn-small btn-success" onclick="checkedAll('确定批量通过吗?');">批量通过</a>
					<a class="btn btn-small btn-danger" onclick="checkedAll('确定批量拒绝吗?');" style="margin: -55px 0 0 88px;width: 52px;text-align: center;">批量拒绝</a>
				</td>--%>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	</form>
</div>
</div>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script type="text/javascript">
	$(top.hangge());
	function tuidan(id){
		 layer.confirm('请使用该条数据的订单编号或支付编号到微信或支付宝商户平台执行退款操作后，再执行此操作!(如您已执行以上操作可以点击确定按钮)', {
              btn: ['确定','取消'],
              title:'温馨提示',
              closeBtn:0,
          	},function () {
          		$.post('api/shangHu/updateTuiDan.do',{id:id,identity:$("#identity").val(),order_state:4},function(data){
        			nextPage('${page.currentPage}');
        		})
          	},function(){
          		//donot do anything
          	}
  			);
		
	}
</script>
</body>
</html>