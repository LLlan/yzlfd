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
<script type="text/javascript">
	$(top.hangge());	
	//新增
	function addmenu(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增菜单";
		 diag.URL = '<%=basePath%>api/shangHu/toAddKeLei.do';
		 diag.Width = 223;
		 diag.Height = 156;
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	//修改
	function editmenu(id){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑菜单";
		 diag.URL = '<%=basePath%>api/shangHu/toEditKeLei.do?kelei_id='+id;
		 diag.Width = 223;
		 diag.Height = 156;
		 diag.CancelEvent = function(){ //关闭事件
			if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				top.jzts(); 
				setTimeout("location.reload()",100);
			}
			diag.close();
		 };
		 diag.show();
	}
	//删除
	function delmenu(id,isParent){
		var flag = false;
		if(isParent){
			if(confirm("确定要删除该菜单吗？其下子菜单将一并删除！")){
				flag = true;
			}
		}else{
			if(confirm("确定要删除该菜单吗？")){
				flag = true;
			}
		}
		if(flag){
			top.jzts();
			var url = "<%=basePath%>api/shangHu/deleteKeLeiById.do?kelei_id="+id;
			$.get(url,function(data){
				top.jzts();
				document.location.reload();
			});
		}
	}
	function openClose(menuId,curObj,trIndex){
		var txt = $(curObj).text();
		if(txt=="展开"){
			$(curObj).text("折叠");
			$("#tr"+menuId).after("<tr id='tempTr"+menuId+"'><td colspan='5'>数据载入中</td></tr>");
			if(trIndex%2==0){
				$("#tempTr"+menuId).addClass("main_table_even");
			}
			var url = "<%=basePath%>api/shangHu/getkeLeiList.do?parent_id="+menuId;
			$.get(url,function(data){
				if(data.list.length>0){
					var html = "";
					$.each(data.list,function(i,j){
						html = "<tr style='height:24px;line-height:24px;' name='subTr"+menuId+"'>";
						html += "<td></td>";
						html += "<td><span style='width:80px;display:inline-block;'></span>";
						html += "<span style='width:100px;text-align:left;display:inline-block;'>"+j.keleiName+"</span>";
						html += "</td>";
						html += "<td>"+j.addTime+"</td>";
						html += "<td><a class='btn btn-mini btn-info' title='编辑' onclick='editmenu(\""+j.kelei_id+"\")'><i class='icon-edit'></i></a> <a class='btn btn-mini btn-danger' title='删除' onclick='delmenu(\""+j.kelei_id+"\",false)'><i class='icon-trash'></i></a></td>";
						html += "</tr>";
						$("#tempTr"+menuId).before(html);
					});
					$("#tempTr"+menuId).remove();
					if(trIndex%2==0){
						$("tr[name='subTr"+menuId+"']").addClass("main_table_even");
					}
				}else{
					$("#tempTr"+menuId+" > td").html("没有相关数据");
				}
			},"json");
		}else{
			$("#tempTr"+menuId).remove();
			$("tr[name='subTr"+menuId+"']").remove();
			$(curObj).text("展开");
		}
	}
</script>
</head>
<body>
	<form action="api/shangHu/keleilistPage.do" method="post">
		<table id="table_report" class="table table-striped table-bordered table-hover">
			<thead>
			<tr>
				<th class="center"  style="width: 50px;">序号</th>
				<th class='center'>名称</th>
				<th class='center'>添加时间</th>
				<th class='center'>操作</th>
			</tr>
			</thead>
			<c:choose>
				<c:when test="${not empty list}">
					<c:forEach items="${list}" var="list" varStatus="vs">
					<tr id="tr${list.kelei_id }">
						<td class="center">${vs.index+1}</td>
						<td class='center'>${list.keleiName }</td>
						<td class='center'>${list.addTime }</td>
						<td style="width: 25%;">
							<a class='btn btn-mini btn-warning' onclick="openClose('${list.kelei_id }',this,${vs.index })" >展开</a>
							<a class='btn btn-mini btn-info' title="编辑" onclick="editmenu('${list.kelei_id }')" ><i class='icon-edit'></i></a>
							<a class='btn btn-mini btn-danger' title="删除"  onclick="delmenu('${list.kelei_id }',true)"><i class='icon-trash'></i></a>
						</td>
					</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="100">没有相关数据</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</table>
	</form>
	<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;width:50px;">
					<a class="btn btn-small btn-success" onclick="addmenu();">新增</a>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
	</div>
</body>
</html>