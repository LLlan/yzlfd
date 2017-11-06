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
.firsttd{width: 70px;}
</style>
</head>
<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	<!-- 检索  -->
	<form action="<%=basePath%>api/ljylshangHu/getyishenglistPage.do?identity=${msg }" method="post" id="myForm">
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
			<td style="vertical-align:top;">
				<select onchange="abc(this,'${msg }');" style="width: 120px;">
					<option value="">请选择</option>
					<option value="1" <c:if test="${msg1=='1' }">selected="selected"</c:if>>认证通过</option>
					<option value="2" <c:if test="${msg1=='2' }">selected="selected"</c:if>>待审核</option>
					<option value="3" <c:if test="${msg1=='3' }">selected="selected"</c:if>>待认证</option>
					<option value="0" <c:if test="${msg1=='0' }">selected="selected"</c:if>>认证失败</option>
				</select>
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
			<th class='center'>用户名1</th>
			<th class='center'>手机号</th>
			<th class='center'>真实姓名</th>
			<th class='center'>现金金额</th>
			<th class='center'>积分</th>
			<th class='center'>注册时间</th>
			<th class='center'>最近登录IP</th>
			<th class='center'>最近登录时间</th>
			<th class='center'>账号状态</th>
			<th class='center'>认证申请时间</th>
			<th class='center'>认证反馈时间</th>
			<th class='center'>认证状态</th>
			<th class='center'>基本信息</th>
			<th class='center'>认证资料</th>
			<th class='center'>置顶状态</th>
			<th class='center'>认证操作</th>
			<th class='center'>更改账号状态</th>
			<th class='center'>操作</th>
			
		</tr>
		</thead>
		<c:choose>
			<c:when test="${not empty list}">
				<c:forEach items="${list}" var="var" varStatus="vs">
				<tr>
					<td class='center' style="width: 30px;">
				 		<label><input type='checkbox' name='ids' value="${var.user_shanghu_id }"/><span class="lbl"></span></label>
					</td>
					<td class='center' style="width: 30px;">${vs.index+1}</td>
					<td class='center'>${var.userName}</td>
					<td class='center'>${var.phone}</td>
					<td class='center'>${var.youName}</td>
					<td class='center'>${var.xianjinAmount}</td>
					<td class='center'>${var.integral}</td>
					<td class='center'>${var.registerTime}</td>
					<td class='center'>${var.ip}</td>
					<td class='center'>${var.last_login_time}</td>
					<td class='center'>
						<c:if test="${var.status=='0'}"><div style='background-color: red; color: white;'>禁用</div></c:if>
						<c:if test="${var.status=='1'}"><div style='background-color: #15c300; color: white;'>正常</div></c:if>
					</td>
					<td class='center'>
						<c:if test="${var.renZhengApplyTime=='' || var.renZhengApplyTime==null}">无</c:if>
						<c:if test="${var.renZhengApplyTime!='' && var.renZhengApplyTime!=null}">${var.renZhengApplyTime }</c:if>
					</td>
					<td class='center'>
						<c:if test="${var.renZhengBackTime=='' || var.renZhengBackTime==null}">无</c:if>
						<c:if test="${var.renZhengBackTime!='' && var.renZhengBackTime!=null}">${var.renZhengBackTime }</c:if>
					</td>
					<td class='center'>
						<c:if test="${var.renZhengState=='0' }"><div style='background-color: red; color: white;'>认证失败</div></c:if>
						<c:if test="${var.renZhengState=='1' }"><div style='background-color: #15c300; color: white;'>认证通过</div></c:if>
						<c:if test="${var.renZhengState=='2' }">等待审核</c:if>
						<c:if test="${var.renZhengState=='3' }">等待认证</c:if>
					</td>
					<td class='center'><a href="javascript:void(0)" onclick="lookBaseInformation('${var.user_shanghu_id }');">查看</a></td>
					<td class='center'><a href="javascript:void(0)" onclick="lookRenZhengInformation('${var.user_shanghu_id }');">查看</a></td>
					<td class='center'>
						<c:if test="${var.top=='0'}">不置顶</c:if>
						<c:if test="${var.top=='1'}">置顶</c:if>
					</td>
					<td style="width: 80px;">
						<select style="width: 65px" onchange="changrenzhengstate(this);" id="renzhengstate">
							<option value="">选择</option>
							<option value="1">通过</option>
							<option value="0">拒绝</option>
						</select>
					</td>
					<td style="width: 80px;">
						<select style="width: 65px" onchange="changstate(this);" id="state">
							<option <c:if test="${var.status=='1'}">selected</c:if> value="1">正常</option>
							<option <c:if test="${var.status=='0'}">selected</c:if> value="0">禁用</option>
						</select>
					</td>
					<td style="width: 68px;">
						<c:if test="${var.top=='0'}">
							<a class='btn btn-mini btn-success' style="width: 48px;" onclick='topp("${var.user_shanghu_id }","1","确定对该条数据执行置顶操作吗?")'>置顶</a>
						</c:if>
						<c:if test="${var.top=='1'}">
							<a class='btn btn-mini btn-danger' onclick='topp("${var.user_shanghu_id }","0","确定对该条数据执行取消置顶操作吗?")'>取消置顶</a>
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
					<a class="btn btn-small btn-success" onclick="checkedAll('确定批量通过吗?');">批量通过</a>
					<a class="btn btn-small btn-danger" onclick="checkedAll('确定批量拒绝吗?');" style="margin: -55px 0 0 88px;width: 52px;text-align: center;">批量拒绝</a>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	</form>
</div>
</div>
<script type="text/javascript">
	$(top.hangge());
	
	function abc(obj,identity){
		console.log($(obj).val());
		var renZhengState=$(obj).val();
		window.location.href="api/ljylshangHu/getyishenglistPage.do?identity="+identity+"&renZhengState="+renZhengState;
	}
	
	//置顶
	function topp(tagID,topp,msg){
		bootbox.confirm(msg, function(result) {
			if(result) {
				top.jzts();
				var url = '<%=basePath%>api/ljylshangHu/topShangHu.do?user_shanghu_id='+tagID+'&top='+topp;
				$.get(url,function(data){
					nextPage('${page.currentPage}');
				});
			}
		});
	}
	$(function() {
		$(".chzn-select").chosen(); 
		//$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
		//复选框
		$('table th input:checkbox').on('click' , function(){
			var that = this;
			$(this).closest('table').find('tr > td:first-child input:checkbox')
			.each(function(){
				this.checked = that.checked;
			});	
		});
	});
	//批量通过和拒绝
	function checkedAll(msg) {
		bootbox.confirm(msg,function(result){
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
								//Example.show("great success");
								}
							}
						 ]
					);
					$("#zcheckbox").tips({
						side:3,
			            msg:'点这里全选',
			            bg:'#AE81FF',
			            time:8
			        });
					return;
				}else{
					var renZhengState="";
					if(msg=="确定批量拒绝吗?"){
						renZhengState="0";
					}else if(msg=="确定批量通过吗?"){
						renZhengState="1";
					}
					$.ajax({
						type:'post',
						url:'<%=basePath%>api/ljylshangHu/yishengChenked.do',
						dataTyoe:'json',
						data:{
							"ids":str,
							"renZhengState":renZhengState
						},
						success:function(data){
							nextPage('${page.currentPage}');
						},
					});
				}
			}
		});	
	}
	//单个改变认证状态
	function changrenzhengstate(obj){
		//var value=$("#renzhengstate option:selected").val();
		var value=$(obj).find("option:selected").val();
		//console.log(value);
		var msg="";
		var input=obj.parentNode.parentNode.getElementsByTagName("input");//获取存放主键ID的input框对象
		var ids=$(input).val();
		var renZhengState="";
		if(value=='1'){
			msg="确定要要执行通过操作吗?";
			renZhengState="1";
			bootbox.confirm(msg, function(result) {
				if(result) {
					top.jzts();
					$.post('<%=basePath%>api/ljylshangHu/yishengChenked.do',{ids:ids,renZhengState:renZhengState},function(data){
						nextPage('${page.currentPage}');
					});
				}
			});
		}else if(value=='0'){
			msg="确定要要执行拒绝操作吗?";
			renZhengState="0";
			bootbox.confirm(msg, function(result) {
				if(result) {
					top.jzts();
					$.post('<%=basePath%>api/ljylshangHu/yishengChenked.do',{ids:ids,renZhengState:renZhengState},function(data){
						nextPage('${page.currentPage}');
					});
				}
			});
		}
	}
	//改变账号的状态
	function changstate(obj){
		var value=$(obj).find("option:selected").val();
		var msg="";
		var input=obj.parentNode.parentNode.getElementsByTagName("input");//获取存放主键ID的input框对象
		var id=$(input).val();
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
				$.post('<%=basePath%>api/ljylshangHu/yishengStatus.do',{id:id,status:status},function(data){
					nextPage('${page.currentPage}');
				});
			}
		});
	}
	//查看基本信息
	function lookBaseInformation(id){
		//获取基本信息
		$.post('api/ljylshangHu/getBaseInformation.do',{user_shanghu_id:id},function(data){
			var str='';
			var pd=data.pd;
			str+='<div id="lookBaseInformation" style="display: none;">';
			str+='<table>';
			str+='<tr>';
			str+='<td class="firsttd">头像：</td>';
			str+='<td class="secondtd"><img src="<%=basePath %>'+pd.headImg+'" width="100px" height="100px"></td>';
			str+='</tr>';
			str+='<tr>';
			str+='<td>名称：</td>';
			str+='<td class="secondtd">'+pd.youName+'</td>';
			str+='</tr>';
			if(pd.identity=='1'){
				/*str+='<tr>';
				str+='<td>职位：</td>';
				str+='<td class="secondtd">'+pd.position+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>标注：</td>';
				str+='<td class="secondtd">'+pd.mark+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>联系方式：</td>';
				str+='<td class="secondtd">'+pd.linkMethod+'</td>';
				str+='</tr>';*/
				str+='<tr>';
				str+='<td>地址：</td>';
				str+='<td class="secondtd">'+pd.address+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>简介：</td>';
				str+='<td class="secondtd">'+pd.introduct+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>经营范围：</td>';
				str+='<td class="secondtd">'+pd.goodField+'</td>';
				str+='</tr>';
			}else if(pd.identity=='2'){
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
				
				str+='</tr>';
				str+='<tr>';
				str+='<td>标注：</td>';
				str+='<td class="secondtd">'+pd.mark+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>联系方式：</td>';
				str+='<td class="secondtd">'+pd.phone+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>地址：</td>';
				str+='<td class="secondtd">'+pd.city+pd.address+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>简介：</td>';
				str+='<td class="secondtd">'+pd.introduct+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>擅长领域：</td>';
				str+='<td class="secondtd">'+pd.goodField+'</td>';
				str+='</tr>';
			}else{
				str+='<tr>';
				str+='<td>类型：</td>';
				if(pd.category=='1'){
					str+='<td class="secondtd">中药</td>';
				}else if(pd.category=='2'){
					str+='<td class="secondtd">西药</td>';
				}else{
					str+='<td class="secondtd">中药/西药</td>';
				}
				
				str+='</tr>';
				str+='<tr>';
				str+='<td>标注：</td>';
				str+='<td class="secondtd">'+pd.mark+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>联系方式：</td>';
				str+='<td class="secondtd">'+pd.phone+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>地址：</td>';
				str+='<td class="secondtd">'+pd.city+pd.address+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>简介：</td>';
				str+='<td class="secondtd">'+pd.introduct+'</td>';
				str+='</tr>';
				str+='<tr>';
				str+='<td>经营范围：</td>';
				str+='<td class="secondtd">'+pd.goodField+'</td>';
				str+='</tr>';
			}
			str+='</table>';
			str+='</div>';
			$("#lookBaseInformation").remove();
			$("body").append(str);
			layer.open({
		        type: 1
		        ,title: "基本信息" //不显示标题栏   title : false/标题
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
		        ,content: $("#lookBaseInformation")
		    });
		});
	}
	//查看认证资料
	function lookRenZhengInformation(id){
		$.post('api/ljylshangHu/getRenZhengInformation.do',{user_shanghu_id:id},function(data){
			if(data.list.length>0){
				var str='<div style="width: 800px;height: auto;display: none;" id="lookRenZhengInformation">';
				$.each(data.list,function(i,j){
					str+='<p style="margin:20px 20px 20px 20px;">';
					str+='<img src="<%=basePath %>'+ j.imgPath +'">';
					str+='</p>';
					str+='<div style="border: 3px dashed #6cb708;margin-left: 20px;"></div>';
				});
				str+='</div>';
				$("#lookRenZhengInformation").remove();
				$("body").append(str);
			}else{
				var str='<div style="width: 800px;height: auto;font-size: 30px;font-family: cursive;margin-left: 126px;margin-top: 208px;display:none;" id="lookRenZhengInformation">';
				str+='<span>该用户还未进行开店申请,无法看到认证资料!</span>';
				str+='</div>';
				$("#lookRenZhengInformation").remove();
				$("body").append(str);
			}
			layer.open({
		        type: 1
		        ,title: "认证资料" //不显示标题栏   title : false/标题
		        ,closeBtn: 1//是否显示关闭按钮0和1
		        ,area:['850px', '600px']//宽高
		        ,shade: 0.5//透明度
		        ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
		        ,resize: false
		        ,skin: 'layui-layer-lan'
		        ,btn: ['退出']
		        ,btnAlign: 'c'
		        ,moveType: 1 //拖拽模式，0或者1
		        ,shadeClose: false //开启遮罩关闭
		        ,content: $("#lookRenZhengInformation")
		    });
		});
	}
</script>
</body>
</html>