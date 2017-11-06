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
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, width=device-width">
    <link rel="stylesheet" href="static/zhaoyiwang/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <link href="static/zhaoyiwang/css/common1.css" type="text/css" rel="stylesheet"/>
    <link href="static/zhaoyiwang/css/index1.css" type="text/css" rel="stylesheet"/>
    <title>基本信息</title>
    <style>
        body{
            background-color:#eee;
        }
       
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <div class="wy-header-icon-back" >
	    <a href="javascript:history.go(-1)" style="width: 32px">
	    	<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
	    </a>
    </div>
    <div class="wy-header-title">基本信息</div>
</div>
<!--头部结束-->
<!--主体开始-->
<form action="<%=basePath %>api/shangHu/savePersonInformation.do" method="post" enctype="multipart/form-data" id="myForm">
	<input type="hidden" value="${pd.headImg }" id="panduan">
	<div class="Pxinxi">
	    <ul>
	        <li style="display: block;height:100px;position: relative;"><span style="position:absolute;top:40%;left:4%; ">头像</span>
	            <div class="img-box" style="display:inline;margin:0;width:80px;background-color: #fff;position: absolute;top:10px;;left:27%;">
	                <section class=" img-section" style="width:80px;">
	                    <div class="z_photo upimg-div clear" style="border:none; width:80px;">
	                        <section class="z_file fl"  style="margin:0;width:80px;border:1px solid #ddd">
	                        	<c:if test="${pd.headImg!='' && pd.headImg!=null }">
	                        		<img src="${pd.headImg }" class="add-img" style="margin:0;width:80px;height:80px;">
	                        	</c:if>
	                        	<c:if test="${pd.headImg=='' || pd.headImg==null }">
	                        		 <img src="static/zhaoyiwang/images/add1.png" class="add-img" style="margin:0;width:80px;height:80px;">
	                        	</c:if>
	                            <input type="file" name="headImgFile" id="file" class="file" value="" style="margin:0;width:100%;"/>
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
	        </li>
	        <li>
	        	<label for="name1">名称</label>
	        	<input type="text" placeholder="您的名称或名字" id="name1" name="youName" value="${pd.youName }"/>
	        </li>
	        <li>
	        	<label for="zhiwu1">职务</label>
	        	<input type="text" placeholder="您的职位" id="zhiwu1" name="position" value="${pd.position }"/>
	        </li>
	        <li>
	        	<label for="biaozhu1">标注</label>
	        	<input type="text" placeholder="个人或医院名称" id="biaozhu1" name="mark" value="${pd.mark }"/>
	        </li>
	        <li>
	        	<label for="telnum1">类型</label>
	        	<select name="category" style="margin-left: 15%;border: 1px solid #dac5c5;height: 30px;width: 100px;text-align: center;">
	        		<option value="1" <c:if test="${pd.category=='1' }">selected</c:if>>中医</option>
	        		<option value="2" <c:if test="${pd.category=='2' }">selected</c:if>>西医</option>
	        		<option value="3" <c:if test="${pd.category=='3' }">selected</c:if>>中西医</option>
	        		<option value="4" <c:if test="${pd.category=='4' }">selected</c:if>>疑难杂症</option>
	        	</select>
	        </li>
	        <li>
	        	<label for="telnum1">科类</label>
	        	<input type="text" readonly="readonly" placeholder="科类名称(内科:普通内科)" id="keshiName" name="keshiName" value="${pd.keshiName }"/>
	        </li>
	        <li>
	        	<label for="telnum1">电话</label>
	        	<input type="text" placeholder="您的联系方式" id="telnum1" name="linkMethod" value="${pd.linkMethod }"/>
	        </li>
	        <li>
	        	<label for="address1">地址</label>
	        	<%--
	        	<input type="text" placeholder="您的就诊地址" id="address1" name="address" value="${pd.address }"/>
	        	--%>
	        	<input type="text" name="address" placeholder="选择城市"  id="address" value="${pd.address }" readonly="" data-code="420106" data-codes="420000,420100,420106"/>
	        </li>
	    </ul>
	</div>
</form>
<a href="javascript:void(0)" class="save" onclick="save();">保存</a>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script src="static/zhaoyiwang/zywkehuduan/js/city-picker.js"></script>
<script src="static/zhaoyiwang/zywkehuduan/js/jquery-weui.js"></script>
<script src="static/zhaoyiwang/js/imgUp1.js"></script>
<script type="text/javascript">

$(function(){
    $("#address").cityPicker({
        title: "请选择地址",
        onChange: function (picker, values, displayValues) {
            console.log(values, displayValues);
        }
    });
})

	$(function(){
	    $("#keshiName").click(function(){
	    	$("#myForm").attr("action","api/shangHu/toSettingPersonInformationKeLei.do");
	    	$("#myForm").submit();
	    });
	});
	//保存
	function save(){
		//先判断是添加还是修改(添加时头像不能为空，修改时可以为空)
		if($("#panduan").val()==""){//添加
			//判断头像是否合法
			if($("#file").val()==""){
				$("#file").tips({
					side:3,
		            msg:'头像不能为空',
		            bg:'#FF3E96',
		            time:2
		        });
				return;
			}
		}
		//判断名称是否合法
		if($("#name1").val()==""){
			$("#name1").tips({
				side:3,
	            msg:'名称不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		//判断名称是否合法
		if($("#keshiName").val()==""){
			$("#keshiName").tips({
				side:3,
	            msg:'科室不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		//判断职位是否合法
		if($("#zhiwu1").val()==""){
			$("#zhiwu1").tips({
				side:3,
	            msg:'职位不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		//判断标注是否合法
		if($("#biaozhu1").val()==""){
			$("#biaozhu1").tips({
				side:3,
	            msg:'标注信息不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		//判断电话是否合法
		if($("#telnum1").val()==""){
			$("#telnum1").tips({
				side:3,
	            msg:'电话信息不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		//判断地址是否合法
		if($("#address1").val()==""){
			$("#address1").tips({
				side:3,
	            msg:'地址信息不能为空',
	            bg:'#FF3E96',
	            time:2
	        });
			return;
		}
		//loading带文字
		layer.open({
		    type: 2
		    ,content: '加载中'
		    ,shadeClose: false
		});
		setTimeout('$("#myForm").submit();', 1000);
		
	}
</script>
</body>
</html>