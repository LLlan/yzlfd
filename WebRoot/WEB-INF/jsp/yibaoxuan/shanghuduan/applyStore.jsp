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

    <link rel="stylesheet" href="static/yibaoxuan/lib/weui.min.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/style.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/login.css">
    <link href="static/yibaoxuan/css/common1.css" type="text/css" rel="stylesheet"/>
    <link href="static/yibaoxuan/css/index1.css" type="text/css" rel="stylesheet"/>
    <title>商家认证</title>
    <style>
        .bgSelected{
            background: url(static/yibaoxuan/images/select01.png) no-repeat;background-size: 22px 22px;border:none;
        }
        body{
            background-color: #eee;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" >
   		<a href="javascript:void(0)" style="width: 32px;" onclick="window.location.href='api/ybxshangHu/toPersonCenter.do'">
    		<span style="position:relative;top:-4px;left:18px;color:#fff;font-size: 16px;">返回</span>
    	</a>
    </div>
    <div class="wy-header-title">商家认证</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="apply" style="padding-top:50px;">
    <p style="width: 100%;padding: 10px 0 0 15px;color: #A9A9A9;">温馨提示：请上传商家资质证书
</p>
    <form action="api/ybxshangHu/savePersonApplyStore.do" method="post" enctype="multipart/form-data" id="myForm1">
    	<input type="hidden" name="shenqingMethod" value="1">
	    <div class="applyBox">
	        <p>1、商家认证</p>
	        <p>注意 : 照片需要现场采集 , 图片不得有水印、LOGO和其他网站信息。</p>
	        <div style="position: relative;top:10px;left:5%;">
	            <div class="img-box full" style="margin:0;width:80px;background-color: #fff;">
	                <section class=" img-section" style="">
	                    <div class="z_photo upimg-div clear" style="border:none;">
	                   <!--      <section class="z_file fl"  style="margin:0;width:80px;border:1px solid #ddd;">
	                            <img src="static/yibaoxuan/images/add1.png" class="add-img" style="margin:0;width:80px;height:80px;">
	                            <input type="file" name="imgPathFile" id="file1" class="file" onclick="fn9()" value="" multiple style="margin:0;width:100%;"/>
	                        </section> -->
	                        
	                   <%--      <section class="z_file fl"  style="margin:0;width:80px;display: none" ></section>
	                        <section class="up-section fl">
	                        	<span class="up-span"></span>
	                        	<img onclick="del(this);" class="close-upimg" tid="${va.xuqiu_img_id }" src="static/yibaoxuan/zywkehuduan/images/zys/a7.png">
	                        	<img class="up-img" src="${va.img_url }">
	                        </section> --%>
	                        
	                        <section class="z_file fl"  style="margin:0;width:80px;">
	                            <img src="static/yibaoxuan/zywkehuduan/images/zys/add01.png" class="add-img" style="margin:0;width:80px;border:1px solid #eee;">
	                            <input onchange="imgUponchange(this);" type="file" name="imgFile" class="file" accept="image/*" style="margin:0;width:100%;"/>
	                        </section>
	                    </div>
	                </section>
	            </div>
	            <aside class="amask works-mask">
	                <div class="mask-content">
	                    <p class="del-p ">您确定要删除作品图片吗？</p>
	                    <p class="check-p">
	                    	<span class="del-com wsdel-ok" onclick="ok();">确定</span>
	                    	<span class="wsdel-no" onclick="no();">取消</span>
	                    </p>
	                </div>
	            </aside>
	        </div>
	    </div>
    </form>
    <!-- <form action="api/shangHu/savePersonApplyStore.do" method="post" enctype="multipart/form-data" id="myForm2">
    	<input type="hidden" name="shenqingMethod" value="2">
	    <div class="applyBox">
	        <p>2、推荐人资料</p>
	        <p>注意 : 请上传5个推荐人的认证成功页面截图。</p>
	        <div style="position: relative;top:10px;left:5%;">
	            <div class="img-box full" style="margin:0;width:80px;background-color: #fff;">
	                <section class=" img-section" style="">
	                    <div class="z_photo upimg-div clear" style="border:none;">
	                        <section class="z_file fl"  style="margin:0;width:80px;border:1px solid #ddd;">
	                            <img src="static/yibaoxuan/images/add1.png" class="add-img1" style="margin:0;width:80px;height:80px;">
	                            <input type="file" name="imgPathFile" id="file2" class="file" value="" onclick="fn5()" accept="images/jpg,images/jpeg,images/png,images/bmp" multiple style="margin:0;width:100%;"/>
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
	        </div>
	    </div>
    </form> -->
</div>
<a href="javascript:void(0)" class="save" style="margin-top:55px;" onclick="tijiao();">提交申请</a>
<!--主体结束-->
<script src="static/yibaoxuan/zywkehuduan/js/imgUp-fbxq.js"></script>
<script src="static/yibaoxuan/js/jquery-2.1.4.js"></script>
<script src="static/yibaoxuan/layer/mobile/layer.js"></script>
<!-- <script src="static/yibaoxuan/zywkehuduan/js/imgUp.js"></script> -->
<%--<script src="static/yibaoxuan/js/imgUp2.js"></script>--%>
<script type="text/javascript">
//点击提交申请
function tijiao(){
	var file1=$(".file").val();
	if(file1!=''){
		layer.open({
		    type: 2
		    ,content: '加载中'
		    ,shadeClose: false
		});
		setTimeout('$("#myForm1").submit();', 1000);
	}else{
		layer.open({
		    content: '请选择认证照片'
		    ,skin:'msg'
		    ,time:2
		});
	}
	
}
</script>
</body>
</html>