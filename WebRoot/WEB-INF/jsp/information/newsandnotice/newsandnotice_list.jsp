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
#lookDetaileInformation table td{border: 2px solid rgb(226, 226, 226);}
#lookDetaileInformation table{margin: 10px 10px 0 10px;font-family: cursive;font-size: 14px;width: 600px;height: 368px}
.secondtd{padding: 0 0 0 10px;}
.firsttd{width: 70px;}
.zhiding{
	display:block;float:right;
}
</style>
<script type="text/javascript">
	$(top.hangge());
	//新增
	function add(){
		 var category=$("#category").val();
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>api/shangHu/toAddNewsAndNotice.do?category='+category;
		 diag.Width = 720;
		 diag.Height = 550;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				var num = '${page.currentPage}';
			 	if(num == '0'){
			 		top.jzts();
			 		location.href = location.href;
			 	}else{
			 		nextPage('${page.currentPage}');
			 	}
			}
			 diag.close();
		 };
		 diag.show();
	}
	//修改
	function edit(tagID){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑";
		 diag.URL = '<%=basePath%>api/shangHu/toEditNewsAndNotice.do?newsandnotice_id='+tagID;
		 diag.Width = 720;
		 diag.Height = 550;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage('${page.currentPage}');
			}
			 diag.close();
		 };
		 diag.show();
	}
	//置顶
	function topp(tagID,topp,msg){
		bootbox.confirm(msg, function(result) {
			if(result) {
				top.jzts();
				var url = '<%=basePath%>api/shangHu/topNewsAndNotice.do?newsandnotice_id='+tagID+'&top='+topp;
				$.get(url,function(data){
					nextPage('${page.currentPage}');
				});
			}
		});
	}
	//删除
	function del(tagID){
		bootbox.confirm("确定要删除该条数据吗?", function(result) {
			if(result) {
				top.jzts();
				var url = '<%=basePath%>api/shangHu/deleteNewsAndNoticeById.do?ids='+tagID;
				$.get(url,function(data){
					nextPage('${page.currentPage}');
				});
			}
		});
	}
	$(function() {
		//复选框
		$('table th input:checkbox').on('click' , function(){
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
			.each(function(){
				this.checked = that.checked;
			});	
		});
	});
	//批量删除
	function makeAll() {
		bootbox.confirm('确定执行批量删除操作吗？',function(result){
			if(result){
				var str='';
				for ( var i = 0; i < document.getElementsByName('ids').length; i++) {
					if(document.getElementsByName('ids')[i].checked){
						if(str==''){
							str+=document.getElementsByName('ids')[i].value;
						}else{
							str+=','+document.getElementsByName('ids')[i].value;
						}
					}
				}
				if(str==''){
					bootbox.dialog("您没有选择任何内容!", 
						[
						  {
							"label" : "关闭",
							"class" : "btn-small btn-success",
							"callback": function() {
								}
							}
						 ]
					);
					$("#zcheckbox").tips({
						side:3,
			            msg:'点这里全选',
			            bg:'#AE81FF',
			            time:4
			        });
					return;
				}else{
					$.ajax({
						type:'post',
						url:'<%=basePath%>api/shangHu/deleteNewsAndNoticeById.do',
						dataTyoe:'json',
						cache: false,
						data:{
							"ids":str
						},
						success:function(data){
							nextPage('${page.currentPage}');
						},
					});
				}
			}
		});	
	}
	//查看详情
	function lookDetaileInformation(id){
		//获取基本信息
		$.post('api/shangHu/getNewsAndNoticeDetaileInformation.do',{newsandnotice_id:id},function(data){
			var str='';
			var pd=data.pd;
			str+='<div id="lookDetaileInformation" style="display: none;">';
			str+='<table>';
			str+='<tr>';
			str+='<td class="firsttd">图像：</td>';
			if(pd.imgPth==''){
				str+='<td class="secondtd">无图像信息</td>';
			}else{
				str+='<td class="secondtd"><img src="<%=basePath %>'+pd.imgPth+'" width="50px" height="50px"></td>';
			}
			str+='</tr>';
			str+='<tr>';
			str+='<td>标题：</td>';
			str+='<td class="secondtd">'+pd.title+'</td>';
			str+='</tr>';
			str+='<tr>';
			str+='<td>来源：</td>';
			str+='<td class="secondtd">'+pd.origin+'</td>';
			str+='</tr>';
			str+='<tr>';
			str+='<td>添加时间：</td>';
			str+='<td class="secondtd">'+pd.addTime+'</td>';
			str+='</tr>';
			str+='<tr>';
			str+='<td>内容：</td>';
			str+='<td class="secondtd">'+pd.content+'</td>';
			str+='</tr>';
			str+='</table>';
			str+='</div>';
			$("#lookDetaileInformation").remove();
			$("body").append(str);
			layer.open({
		        type: 1
		        ,title: "详情信息" //不显示标题栏   title : false/标题
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
		        ,content: $("#lookDetaileInformation")
		    });
		});
	}
</script>
</head>
<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	<!-- 检索  -->
	<form action="<%=basePath%>api/shangHu/getnewsandnoticelistPage.do" method="post">
	<input type="hidden" name="category" id="category" value="${pd.category }">
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
			<th class="center">
				<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
			</th>
			<th class="center"  style="width: 50px;">序号</th>
			<th class='center'>图片</th>
			<th class='center'>标题</th>
			<th class='center'>来源</th>
			<th class='center'>添加时间</th>
			<th class='center'>内容</th>
			<th class='center'>状态</th>
			<th class='center'>类别</th>
			<th class='center' style="width: 130px;">操作</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="var" varStatus="vs">
				<tr>
					<td class='center' style="width: 30px;">
				 		<label><input type='checkbox' name='ids' value="${var.newsandnotice_id }"/><span class="lbl"></span></label>
					</td>
					<td class='center' style="width: 30px;">${vs.index+1}</td>
					<td class='center'>
						<c:choose>
							<c:when test="${var.imgPth!='' && var.imgPth!=null }">
								<img src="<%=basePath %>${var.imgPth}" width="40px" height="40px">
							</c:when>
							<c:otherwise>
								无图片信息
							</c:otherwise>
						</c:choose>
					</td>
					<td class='center'>${var.title}</td>
					<td class='center'>${var.origin}</td>
					<td class='center'>${var.addTime}</td>
					<td class='center'><a href="javascript:void(0)" onclick="lookDetaileInformation('${var.newsandnotice_id }')">查看</a></td>
					<td class='center'>
						<c:if test="${var.top=='0'}">不置顶</c:if>
						<c:if test="${var.top=='1'}">置顶</c:if>
					</td>
					<td class='center'>${var.type=='1'?'华夏郎中行':var.type=='2'?'旅居养老':'古玩字画苑'}</td>
					<td style="width: 68px;">
						<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.newsandnotice_id }')" ><i class='icon-edit'></i></a>
						<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.newsandnotice_id }')"><i class='icon-trash'></i></a>
						<c:if test="${var.top=='0'}">
							<a class='btn btn-mini btn-success zhiding' style="width: 48px;" onclick='topp("${var.newsandnotice_id }","1","确定对该条数据执行置顶操作吗?")'>置顶</a>
						</c:if>
						<c:if test="${var.top=='1'}">
							<a class='btn btn-mini btn-danger zhiding' onclick='topp("${var.newsandnotice_id }","0","确定对该条数据执行取消置顶操作吗?")'>取消置顶</a>
						</c:if>
					</td>
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
				<td style="vertical-align:top;width:50px;">
					<a class="btn btn-small btn-success" onclick="add();">新增</a>
					<a title="批量删除" class="btn btn-small btn-danger" onclick="makeAll();" style="margin: -55px 0 0 59px;width: 26px;text-align: center;"><i class='icon-trash'></i></a>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	</form>
</div>
</div>
</body>
</html>