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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
<link href="static/zhaoyiwang/css/index1.css" type="text/css" rel="stylesheet"/>
    <link rel="stylesheet" href="static/zhaoyiwang/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <title>${titleMsg }</title>
    <style>
        .dispBox>textarea.notice {
            width: 96%;
            height: 30px;
            line-height: 30px;
            border: 1px solid #b5b5b5;
            border-radius: 5px;
            padding: 6px 2%;
            resize: none;
        }
        .dispBox {
		    margin-top: 0px; 
		}
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index:9999;">
    <div class="wy-header-icon-back" >
	    <a href="javascript:history.go(-1)" style="width: 32px;">
	    	<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
	    </a>
    </div>
    <div class="wy-header-title" id="titleMsg">${titleMsg }</div>
</div>
<!--头部结束-->
<!--主体开始-->
<form action="api/shangHu/${msg }.do" method="post" id="myForm" style="margin-top: 50px;" enctype="multipart/form-data">
	<input type="hidden" value="${pd.anli_zhanshi_id }" name="anli_zhanshi_id">
	<input type="hidden" value="${pd.imgPath }" id="panduan">
	
	<div style="display: block; height: 100px;position: relative;border-bottom:1px dashed #ddd;">      
		<span style="position:absolute;top:40%;left:4%; ">图片</span>
	    <div class="img-box" style="display:inline;margin:0;width:80px;background-color: #fff;position: absolute;top:10px;;left:27%;">
	          <section class=" img-section" style="width:80px;">
	              <div class="z_photo upimg-div clear" style="border:none; width:80px;">
	                  <section class="z_file fl"  style="margin:0;width:80px;border:1px solid #ddd">
	                  	<c:if test="${pd.imgPath!='' && pd.imgPath!=null }">
	                  		<img src="${pd.imgPath }" class="add-img" style="margin:0;width:80px;height:80px;">
	                  	</c:if>
	                  	<c:if test="${pd.imgPath=='' || pd.imgPath==null }">
	                  		 <img src="static/zhaoyiwang/images/add1.png" class="add-img" style="margin:0;width:80px;height:80px;">
	                  	</c:if>
	                      <input type="file" name="imgPathFile" id="file" accept="images/jpg,iamges/jpeg,images/png" class="file" value="" style="margin:0;width:100%;"/>
	                  </section>
	              </div>
	          </section>
	    </div>
	</div>
	
    <aside class="amask works-mask">
        <div class="mask-content">
            <p class="del-p ">您确定要删除作品图片吗？</p>
            <p class="check-p"><span class="del-com wsdel-ok">确定</span><span class="wsdel-no">取消</span></p>
        </div>
    </aside>
	<div class="dispBox">
	    <p>案例展示 : </p>
	    <textarea name="title" id="title" placeholder="请填写案例标题" class="notice" maxlength="45">${pd.title }</textarea>
	    <textarea name="detailContent" id="detailContent"  placeholder="请描述你的案例..." style="height: 300px;">${pd.detailContent }</textarea>
	</div>
</form>
<a href="javascript:void(0)" class="save" onclick="save();">保存</a>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<!-- <script src="static/zhaoyiwang/layer/layer.js"></script> -->
<script src="static/zhaoyiwang/js/imgUp1.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script type="text/javascript">
	function save(){
		//先判断是添加还是修改(添加时头像不能为空，修改时可以为空)
		if($("#panduan").val()==""){//添加
			//判断头像是否合法
			if($("#file").val()==""){
		     	$("#file").tips({
					side:3,
		            msg:'案例图片不能为空',
		            bg:'#FF3E96',
		            time:2
	        	});
				return;
			}
		}
		if($("#title").val()==''){
	  			$("#title").tips({
					side:3,
		            msg:'标题内容不能为空',
		            bg:'#FF3E96',
		            time:2
	        	});
	  		
			return;
		}
		if($("#detailContent").val()==''){
	  		$("#detailContent").tips({
				side:3,
	            msg:'案例详情不能为空',
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