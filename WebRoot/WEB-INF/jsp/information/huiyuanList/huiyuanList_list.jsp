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
#lookBaseInformation table td{border: 2px solid rgb(226, 226, 226);}
#lookBaseInformation table{margin: 10px 10px 0 10px;font-family: cursive;font-size: 14px;width: 600px;height: 368px}
.secondtd{padding: 0 0 0 10px;}
.firsttd{width: 140px;}
</style>
</head>
<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	<!-- 检索  -->
	<form action="<%=basePath%>api/shangHu/gethuiyuanlistPage.do" method="post" id="myForm">
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
			<th class="center"  style="width: 20px;">序号</th>
			<th class='center'>用户名</th>
			<th class='center'>手机号</th>
			<th class='center'>真实姓名</th>
			<!-- <th class='center'>身份证号</th>
			<th class='center'>出生年月日</th> -->
			<th class='center'>性别</th>
			<th class='center'>年龄</th>
			<th class='center'>地址城市</th>
			<th class='center'>积分</th>
			<th class='center'>注册时间</th>
		<!-- 	<th class='center'>最近登录IP</th> -->
			<th class='center'>最近登录时间</th>
			<th class='center'>分销收入明细</th>
			<th class='center'>账号状态</th>
			<th class='center'>更改账号状态</th>
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="var" varStatus="vs">
				<tr>
					<td class='center' style="width: 30px;">${vs.index+1}</td>
					<td class='center'>${var.userName}</td>
					<td class='center'>${var.phone}</td>
					<td class='center'>${var.realName}</td>
					<%-- <td class='center'>${var.identityCard}</td>
					<td class='center'>${var.birthday}</td> --%>
					<td class='center'>${var.sex}</td>
					<td class='center'>${var.age}</td>
					<td class='center'>${var.address}</td>
					<td class='center'>${var.jifen}</td>
					<td class='center'>${var.registerTime}</td>
			<%-- 		<td class='center'>${var.ip}</td> --%>
					<td class='center'>${var.last_login_time}</td>
					<td class='center'>
						<a href="javascript:void(0)" onclick="fenxiaomingxi('${var.user_kuhu_id }');">查看</a>
					</td>
					<td class='center'>
						<c:if test="${var.status=='0'}"><div style='background-color: red; color: white;'>禁用</div></c:if>
						<c:if test="${var.status=='1'}"><div style='background-color: #15c300; color: white;'>正常</div></c:if>
					</td>
					<td style="width: 80px;">
						<select style="width: 65px" onchange="changstate(this,'${var.user_kuhu_id }');" id="state">
							<option <c:if test="${var.status=='1'}">selected</c:if> value="1">正常</option>
							<option <c:if test="${var.status=='0'}">selected</c:if> value="0">禁用</option>
						</select>
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
	//改变账号的状态
	function changstate(obj,id){
		var value=$(obj).find("option:selected").val();
		var msg="";
		var status="";
		if(value=='1'){
			msg="确定要对该账号执行启用操作吗?";
			status="1";
		}else if(value=='0'){
			msg="确定要对该账号执行禁用操作吗?";
			status="0";
		}
		bootbox.confirm(msg, function(result) {
			if(result) {
				top.jzts();
				$.post('<%=basePath%>api/shangHu/huiyuanStatus.do',{id:id,status:status},function(data){
					nextPage('${page.currentPage}');
				});
			}
		});
	}
	//分销收入明细
	function fenxiaomingxi(user_kuhu_id){
		$.post('api/shangHu/fenxiaomingxi.do',{user_kuhu_id:user_kuhu_id},function(data){
			var str='';
			var pd=data.pd;
			str+='<div id="lookBaseInformation" style="display: none;">';
			str+='<table style="width:780px;">';
			
			//一级分销收益
			str+='<tr>';
			str+='<td class="firsttd">一级分销收益（元）：</td>';
			if(data.list1.length>0){
				var zsy=0;
				for(var i=0;i<data.list1.length;i++){
					zsy+=parseFloat(data.list1[i].money);
				}
				str+='<td class="secondtd" colspan="3">'+parseFloat(zsy).toFixed(2)+'</td>';
				str+='</tr>';
				
				str+='<tr>';
				str+='<td class="firsttd">用户名</td>';
				str+='<td class="firsttd">手机号</td>';
				str+='<td class="firsttd">分销金额（元）</td>';
				str+='<td class="firsttd">时间</td>';
				str+='</tr>';
				
				$.each(data.list1,function(){
					str+='<tr>';
					str+='<td class="secondtd">'+this.userName+'</td>';
					str+='<td class="secondtd">'+this.phone+'</td>';
					str+='<td class="secondtd">'+parseFloat(this.money).toFixed(2)+'</td>';
					str+='<td class="secondtd">'+this.insert_time+'</td>';
					str+='</tr>';
				});
				
			}else{
				str+='<td class="secondtd" colspan="3">无一级分销收益</td>';
				str+='</tr>';
			}
			
			//二级分销收益
			str+='<tr>';
			str+='<td class="firsttd">二级分销收益（元）：</td>';
			if(data.list2.length>0){
				var zsy=0;
				for(var i=0;i<data.list2.length;i++){
					zsy+=parseFloat(data.list2[i].money);
				}
				str+='<td class="secondtd" colspan="3">'+parseFloat(zsy).toFixed(2)+'</td>';
				str+='</tr>';
				
				str+='<tr>';
				str+='<td class="firsttd">用户名</td>';
				str+='<td class="firsttd">手机号</td>';
				str+='<td class="firsttd">分销金额（元）</td>';
				str+='<td class="firsttd">时间</td>';
				str+='</tr>';
				
				$.each(data.list2,function(){
					str+='<tr>';
					str+='<td class="secondtd">'+this.userName+'</td>';
					str+='<td class="secondtd">'+this.phone+'</td>';
					str+='<td class="secondtd">'+parseFloat(this.money).toFixed(2)+'</td>';
					str+='<td class="secondtd">'+this.insert_time+'</td>';
					str+='</tr>';
				});
				
			}else{
				str+='<td class="secondtd" colspan="3">无二级分销收益</td>';
				str+='</tr>';
			}
			
			str+='</table>';
			str+='</div>';
			$("#lookBaseInformation").remove();
			$("body").append(str);
			layer.open({
		        type: 1
		        ,title: "分销收益明细" //不显示标题栏   title : false/标题
		        ,closeBtn: 1//是否显示关闭按钮0和1
		        ,area:['800px', '600px']//宽高
		        ,shade: 0.5//透明度
		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
		        ,resize: false
		        ,skin: 'layui-layer-lan'
		        ,btn: ['退出']
		        ,btnAlign: 'c'
		        ,moveType: 1 //拖拽模式，0或者1
		        ,shadeClose: false //开启遮罩关闭
		        ,content: $("#lookBaseInformation")
		    });
		});
	}
</script>
</body>
</html>