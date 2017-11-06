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
<form action="<%=basePath %>api/shangHu/${msg }.do" method="post" id="myForm" enctype="multipart/form-data">
<input type="hidden" value="${pd.headImg }" id="panduan"><%-- 判断操作为添加还是编辑 --%>
<input type="hidden" value="${pd.fuwu_id }" name="fuwu_id">
<div class="Pxinxi">
    <ul>
    	<c:if test="${shanghuUser.identity=='4' }">
    		<li>
	        	<label for="name1">类别</label>
	        	<select name="type" style="border: 1px solid #e8d8d8;height: 30px;margin-left: 13%;width: 90px;">
	        		<option value="4" <c:if test="${pd.type=='4' }">selected="selected"</c:if>>酒店产品</option>
	        		<option value="5" <c:if test="${pd.type=='5' }">selected="selected"</c:if>>景点产品</option>
	        		<option value="6" <c:if test="${pd.type=='6' }">selected="selected"</c:if>>特产产品</option>
	        	</select>
	        </li>
    	</c:if>
    	<c:if test="${shanghuUser.identity=='5' }">
    		<li>
	        	<label for="name1">类别</label>
	        	<select name="type" style="border: 1px solid #e8d8d8;height: 30px;margin-left: 13%;width: 90px;">
	        		<option value="7" <c:if test="${pd.type=='7' }">selected="selected"</c:if>>字画</option>
	        		<option value="8" <c:if test="${pd.type=='8' }">selected="selected"</c:if>>古玩</option>
	        		<option value="9" <c:if test="${pd.type=='9' }">selected="selected"</c:if>>藏品</option>
	        		<option value="10" <c:if test="${pd.type=='10' }">selected="selected"</c:if>>玉器</option>
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
	                        		 <img src="static/zhaoyiwang/images/add1.png" class="add-img" style="margin:0;width:80px;height:80px;">
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
        	<label for="name1">名字</label>
        	<input type="text" placeholder="服务或产品的名称" id="jibingName" style="margin-left:13%;" name="fuwu_jibing_name" value="${pd.fuwu_jibing_name }"/>
        </li>
        <li><label for="address1">价格</label><input type="text" placeholder="您理想的价格" id="price" name="price" value="${pd.price }"/></li>
        <li>
        	<label for="telnum1">详情</label><br>
        	<textarea  placeholder="输入服务或产品详情..." name="jibing_introdaction" id="jibing_introdaction" style="margin-top: 10px;width:100%;height:120px;padding:10px;">${pd.jibing_introdaction }</textarea>
        </li>
    </ul>
</div>
</form>
<a href="javascript:void(0)" class="save" onclick="save();">提交</a>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script src="static/zhaoyiwang/js/imgUp1.js"></script>
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
				layer.open({
		     		content:'请选择图片'
		     		,skin:'msg'
		     		,time:2
		     	});
				return;
			}
		}
		//判断服务疾病是否合法
		if($("#jibingName").val()==""){
			layer.open({
	     		content:'请输入服务名称'
	     		,skin:'msg'
	     		,time:2
	     	});
			return;
		}
		//判断价格是否合法
		if(!regNum.test($("#price").val())){
			layer.open({
	     		content:'请正确填写价格'
	     		,skin:'msg'
	     		,time:2
	     	});
			return;
		}
		//疾病简介是否合法
		if($("#jibing_introdaction").val()==""){
			layer.open({
	     		content:'请输入服务详情'
	     		,skin:'msg'
	     		,time:2
	     	});
			return;
		}
    	$("#myForm").submit();
    }
</script>
</body>
</html>