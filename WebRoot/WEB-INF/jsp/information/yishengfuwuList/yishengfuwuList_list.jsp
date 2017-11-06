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
	<form action="<%=basePath%>api/shangHu/getyishengfuwulistPage.do" method="post" id="myForm">
	<table>
		<tr>
			<td>
				<span class="input-icon">
					<input autocomplete="off" id="nav-search-input" type="text" name="searchName" value="${pd.searchName }" placeholder="这里输入关键词" />
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
			<th class="center"  style="width: 50px;">序号</th>
			<th class='center'>用户名</th>
			<th class='center'>手机号</th>
			<c:choose>
				<c:when test="${pd.type=='1' }">
					<th class='center'>真实姓名</th>
					<th class='center'>职位</th>
					<th class='center'>标注(个人或者医院的名称)</th>
					<th class='center'>服务疾病的名称</th>
				</c:when>
				<c:when test="${pd.type=='2' }">
					<th class='center'>名称</th>
					<th class='center'>等级</th>
					<th class='center'>标注</th>
					<th class='center'>服务名称</th>
				</c:when>
				<c:otherwise>
					<th class='center'>名称</th>
					<th class='center'>类别</th>
					<th class='center'>标注</th>
					<th class='center'>服务名称</th>
				</c:otherwise>
			</c:choose>
			<th class='center'>价格</th>
			<th class='center'>添加时间</th>
			<th class='center'>服务详情</th>
			<%--<th class='center'>操作</th>--%>
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
					<td class='center'>${var.userName}</td>
					<td class='center'>${var.phone}</td>
					<c:choose>
						<c:when test="${var.identity=='1' }">
							<td class='center'>${var.youName}</td>
							<td class='center'>${var.position}</td>
							<td class='center'>${var.mark}</td>
							<td class='center'>${var.fuwu_jibing_name}</td>
						</c:when>
						<c:when test="${var.identity=='2' }">
							<td class='center'>${var.youName}</td>
							<td class='center'>
								<c:choose>
									<c:when test="${var.dengji=='1' }">
										一级乙等
									</c:when>
									<c:when test="${var.dengji=='2' }">
										一级甲等
									</c:when>
									<c:when test="${var.dengji=='3' }">
										二级乙等
									</c:when>
									<c:when test="${var.dengji=='4' }">
										二级甲等
									</c:when>
									<c:when test="${var.dengji=='5' }">
										三级乙等
									</c:when>
									<c:otherwise>
										三级甲等
									</c:otherwise>
								</c:choose>
							</td>
							<td class='center'>${var.mark}</td>
							<td class='center'>${var.fuwu_jibing_name}</td>
						</c:when>
						<c:otherwise>
							<td class='center'>${var.youName}</td>
							<td class='center'>
								<c:choose>
									<c:when test="${var.category=='1' }">
										中药
									</c:when>
									<c:when test="${var.category=='2' }">
										西药
									</c:when>
									<c:otherwise>
										中药/西药
									</c:otherwise>
								</c:choose>
							</td>
							<td class='center'>${var.mark}</td>
							<td class='center'>${var.fuwu_jibing_name}</td>
						</c:otherwise>
					</c:choose>
					<td class='center'>${var.price}</td>
					<td class='center'>${var.addTime}</td>
					<td class='center'><a href="javascript:void(0)" onclick="lookDetailInformation('${var.fuwu_id }');">查看</a></td>
					<%--<td style="width: 68px;">
						<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.hudong_category_id }')" ><i class='icon-edit'></i></a>
						<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.hudong_category_id }')"><i class='icon-trash'></i></a>
					</td> --%>
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
<script type="text/javascript">
	$(top.hangge());
	//查看基本信息
	function lookDetailInformation(id){
		//获取基本信息
		$.post('api/shangHu/getYiShengServiceDetailInformation.do',{fuwu_id:id},function(data){
			var str='';
			var pd=data.pd;
			str+='<div id="lookDetailInformation" style="display: none;">';
			str+='<table>';
			str+='<tr>';
			str+='<td class="firsttd">头像：</td>';
			str+='<td class="secondtd"><img src="<%=basePath %>'+pd.headImg+'" width="100px" height="100px"></td>';
			str+='</tr>';
			str+='<tr>';
			if(pd.identity=='1'){
				str+='<td>姓名：</td>';
				str+='<td class="secondtd">'+pd.youName+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>职位：</td>';
				str+='<td class="secondtd">'+pd.position+'</td>';
			}else if(pd.identity=='2'){
				str+='<td>名称：</td>';
				str+='<td class="secondtd">'+pd.youName+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>等级：</td>';
				if(pd.dengji=='1'){
					str+='<td class="secondtd">一级乙等</td>';
				}else if(pd.dengji=='2'){
					str+='<td class="secondtd">一级甲等</td>';
				}else if(pd.dengji=='3'){
					str+='<td class="secondtd">二级乙等</td>';
				}else if(pd.dengji=='4'){
					str+='<td class="secondtd">二级甲等</td>';
				}else if(pd.dengji=='5'){
					str+='<td class="secondtd">三级乙等</td>';
				}else {
					str+='<td class="secondtd">三级甲等</td>';
				}
			}else{
				str+='<td>名称：</td>';
				str+='<td class="secondtd">'+pd.youName+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>类别：</td>';
				if(pd.category=='1'){
					str+='<td class="secondtd">中药</td>';
				}else if(pd.category=='2'){
					str+='<td class="secondtd">西药</td>';
				}else{
					str+='<td class="secondtd">中药/西药</td>';
				}
			}
			str+='</tr>';
			str+='<tr>';
			str+='<td>标注：</td>';
			str+='<td class="secondtd">'+pd.mark+'</td>';
			str+='</tr>';
			str+='<tr>';
			str+='<td>服务的名称：</td>';
			str+='<td class="secondtd">'+pd.fuwu_jibing_name+'</td>';
			str+='</tr>';
			str+='<tr>';
			str+='<td>价格：</td>';
			str+='<td class="secondtd">'+pd.price.toFixed(2)+'</td>';
			str+='</tr>';
			str+='<tr>';
			str+='<td>服务详情：</td>';
			str+='<td class="secondtd">'+pd.jibing_introdaction+'</td>';
			str+='</tr>';
			str+='</table>';
			str+='</div>';
			$("#lookDetailInformation").remove();
			$("body").append(str);
			layer.open({
		        type: 1
		        ,title: "服务详情" //不显示标题栏   title : false/标题
		        ,closeBtn: 1//是否显示关闭按钮0和1
		        ,area:['620px', '540px']//宽高
		        ,shade: 0.5//透明度
		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
		        ,resize: false
		        ,skin: 'layui-layer-lan'
		        ,btn: ['退出']
		        ,btnAlign: 'c'
		        ,moveType: 1 //拖拽模式，0或者1
		        ,shadeClose: false //开启遮罩关闭
		        ,content: $("#lookDetailInformation")
		    });
		});
	}
</script>
</body>
</html>