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
   <link rel="stylesheet" href="static/yibaoxuan/lib/weui.min.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/style.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/login.css">
    <link href="static/yibaoxuan/css/common1.css" type="text/css" rel="stylesheet"/>
    <link href="static/yibaoxuan/css/index1.css" type="text/css" rel="stylesheet"/>
    <title>${titleMsg }</title>
    <style>
        body{
            background-color:#eee;
        }
        #serviceXQ{
            width:100%;height:164px;border-radius: 10px;padding:10px 4%;
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
    <div class="wy-header-title" id="titleMsg">${titleMsg }</div>
</div>
<!--头部结束-->
<!--主体开始-->
<form action="<%=basePath %>api/ybxshangHu/${msg }.do" method="post" id="myForm" enctype="multipart/form-data">
<input type="hidden" value="${pd.headImg }" id="panduan"><%-- 判断操作为添加还是编辑 --%>
<input type="hidden" value="${pd.fuwu_id }" name="fuwu_id">
<div class="Pxinxi">
    <ul>
    	<c:if test="${msg!='updatePersonMyService' }">
	    	<li>
	        	<label for="name1">产品类别</label>
	        	<select name="type" style="border: 1px solid #e8d8d8;height: 30px;margin-left: 12px;">
	        		<option value="1" selected="selected">字画</option>
	        		<option value="2">古玩</option>
	        		<option value="3">藏品</option>
	        		<option value="4">玉石</option>
	        	</select>
	        </li>
        </c:if>
        <li style="display: block;height:100px;position: relative;"><span style="position:absolute;top:40%;left:4%; ">图片</span>
            <div class="img-box" style="display:inline;margin:0;width:80px;background-color: #fff;position: absolute;top:10px;;left:26%;">
                <section class=" img-section" style="width:80px;">
                    <div class="z_photo upimg-div clear" style="border:none; width:80px;">
                        <section class="z_file fl"  style="margin:0;width:80px;border:1px solid #ddd;">
                            <c:if test="${pd.headImg!='' && pd.headImg!=null }">
	                        		<img src="${pd.headImg }" class="add-img" style="margin:0;width:80px;height:80px;">
	                        	</c:if>
	                        	<c:if test="${pd.headImg=='' || pd.headImg==null }">
	                        		 <img src="static/yibaoxuan/images/add1.png" class="add-img" style="margin:0;width:80px;height:80px;">
	                        	</c:if>
                            <input type="file" name="headImgFile" id="file" class="file" value="" accept="images/jpg,images/jpeg,images/png,images/bmp" multiple style="margin:0;width:100%;"/>
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
        	<input type="text" placeholder="产品名称" id="jibingName" style="margin-left:13%;" name="fuwu_jibing_name" value="${pd.fuwu_jibing_name }"/>
        </li>
        <li><label for="address1">价格</label><input type="text" placeholder="您理想的价格" id="price" name="price" value="${pd.price }"/></li>
        <li>
        	<label for="telnum1">产品详情</label><br>
        	<textarea  placeholder="输入产品详情..." name="jibing_introdaction" id="jibing_introdaction" style="margin-top: 10px;width:100%;height:120px;padding:10px;">${pd.jibing_introdaction }</textarea>
        </li>
    </ul>
</div>
</form>
<a href="javascript:void(0)" class="save" onclick="save();">提交</a>
<!--主体结束-->
<script src="static/yibaoxuan/js/jquery-2.1.4.js"></script>
<script src="static/yibaoxuan/layer/layer.js"></script>
<script src="static/yibaoxuan/js/imgUp1.js"></script>
<script type="text/javascript">
    $(function(){
        $(".jibing01").click(function(){
            window.location.href="changjianDisease.html";
        })
    });
  //保存操作
    function save(){
    	console.log($("#file").val());
	   	//大于0的正数和小数正则表达式
	   	var regNum=/^(?!0(\.0+)?$)([1-9][0-9]*|0)(\.[0-9]+)?$/;
	  //先判断是添加还是修改(添加时头像不能为空，修改时可以为空)
		if($("#panduan").val()==""){//添加
			//判断头像是否合法
			if($("#file").val()==""){
				layer.tips('图片不能为空', '#file', {
		     		  tips: [1, '#D9006C'],
		     		  time: 3000
		     	});
				return;
			}
		}
		//判断服务疾病是否合法
		if($("#jibingName").val()==""){
			layer.tips('产品名称不能为空', '#jibingName', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
		}
		//判断价格是否合法
		if($("#price").val()=="" || (!regNum.test($("#price").val()) || $("#price").val()=="0" || $("#price").val()=="0.0") || $("#price").val()=="0.00"){
			layer.tips('请正确填写价格', '#price', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
		}
		//疾病简介是否合法
		if($("#jibing_introdaction").val()==""){
			layer.tips('产品简介不能为空', '#jibing_introdaction', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
		}
    	$("#myForm").submit();
    }
</script>
</body>
</html>