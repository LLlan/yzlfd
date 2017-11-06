<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String url= request.getParameter("url");
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="static/css/zyw/common.css"/>
    <link rel="stylesheet" href="static/css/zyw/toubu.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/apply.css"/>
    <link rel="stylesheet" href="static/css/zyw/common1.css"/>
    <link rel="stylesheet" href="static/css/zyw/index2.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
    <title id="titleMsg">商家资质认证</title>
    <style>
        .doctor_detail>div.txt-center{
            width: 500px;
            height: 50px;
            margin: 10px auto;
        }
        body{
            background-color: #fff;
        }
        .bg_xuqiu{
            width: 100%;
            overflow: hidden;
            border-top: 1px solid #38C4FF;
        }
    </style>
</head>
<body>
<%-- 顶部（star） --%>
<jsp:include page="../top.jsp"></jsp:include>
<jsp:include page="../top2.jsp"></jsp:include>
<%-- 顶部 （end）--%>
<!--头部-->
<div class="seem">
    <div class="sidbar fl">
        <div class="all clearfix">
            <a href="<%=basePath %>api/keHuPc/index.do"><b>所有分类</b></a>
        </div>
    </div>
    <div class="navmain fl">
        <ul>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/index.do">首页</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYiShengList.do">找医生</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchJiGouList.do">找机构</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/searchYaoShangList.do">找药商</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/showYnzzMore.do">疑难杂症</a></li>
            <li class="fl"><a href="<%=basePath %>api/keHuPc/xuQiuDaTing.do">需求大厅</a></li>
        </ul>
    </div>
</div>
<div class="bg_xuqiu">
    <div class="applyBack">
    
        <div class="applyBox">
            <div class="applyTop">您的位置 > <span>会员中心</span> > <span>商家资质认证</span></div>
            <div class="applyMainA">
                <%--<p>温馨提示: 商家资质认证方式二选一</p>--%>
                <form action="api/keHuPc/saveApplyStore.do" method="post" enctype="multipart/form-data" id="myForm1">
	    			<input type="hidden" name="shenqingMethod" value="1">
	                <div class="applymainBox">
	                    <p class="applymainhead"><img src="static/images/zyw/shangjia1.png" alt=""/>商家资质</p>
	                    <div class="upload">
	                        <p>注意: 照片需要现场采集 , 图片不得有水印、logo和其他网站信息。</p>
	                        <div>
	                            <div class="img-box full" style="display:inline;margin:0;min-width:100%;height:129px;position: absolute;top:6px;;left:20px;">
	                                <section class=" img-section" style="width:100%;height:127px;">
	                                    <div class="z_photo upimg-div clear" style="border:none; width:100%;height:127px;">
	                                        <section class="z_file fl"  style="margin:0;width:127px;height:127px;border: 1px dashed #999;">
	                                            <img src="static/images/zyw/add1.png" class="add-img" style="margin:0;width:127px;height:127px;">
	                                            <input type="file" name="imgPathFile" id="file1" class="file" value="" accept="images/jpg,images/jpeg,images/png,images/bmp" multiple style="margin:0;width:100%;"/>
	                                        </section>
	                                    </div>
	                                </section>
	                            </div>
	                            <aside class="amask works-mask">
	                                <div class="mask-content" style="background: #ded5d5;width: 30%;">
	                                    <p class="del-p " style="border-bottom: 1px solid white;">您确定要删除该图片吗？</p>
	                                    <p class="check-p">
		                                    <span class="del-com wsdel-ok" style="border-right: 1px solid white;">确定</span>
		                                    <span class="wsdel-no">取消</span>
	                                    </p>
	                                </div>
	                            </aside>
	                        </div>
	                    </div>
	                </div>
                </form>
                <%--
                <form action="api/keHuPc/saveApplyStore.do" method="post" enctype="multipart/form-data" id="myForm2">
	    			<input type="hidden" name="shenqingMethod" value="2">
	                <div class="applymainBox">
	                    <p class="applymainhead"><img src="static/images/zyw/geren01.png" alt=""/>推荐人资料</p>
	                    <div class="upload">
	                        <p>注意: 请上传五个推荐人的认证成功页面截图。</p>
	                        <div>
	                            <div class="img-box full" style="display:inline;margin:0;min-width:100%;height:129px;position: absolute;top:6px;;left:20px;">
	                                <section class=" img-section" style="width:100%;height:127px;">
	                                    <div class="z_photo upimg-div clear" style="border:none; width:100%;height:127px;">
	                                        <section class="z_file fl"  style="margin:0;width:127px;height:127px;border: 1px dashed #999;">
	                                            <img src="static/images/zyw/add1.png" class="add-img" style="margin:0;width:127px;height:127px;">
	                                            <input type="file" name="imgPathFile" id="file2" class="file" value="" accept="images/jpg,images/jpeg,images/png,images/bmp" multiple style="margin:0;width:100%;"/>
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
	                </div>
                </form>
                --%>
            </div>
            <p class="submitT"><a href="javascript:void(0)" onclick="tijiao();">提交申请</a></p>
        </div>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
</body>
<script src="static/js/zyw/imgUp-apply.js"></script>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script>
//点击提交申请
function tijiao(){
	/*var file1=$("#file1").val();
	var file2=$("#file2").val();
	if((file1!='' && file2!='') || (file1=='' && file2=='')){
	 	layer.alert("商家资质认证的认证方式为二选一,点击确定重新选择认证方式!",{
            title:"温馨提示"//提示标题，默认为：信息
            //,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
            ,anim: 0 //动画类型0-6，默认为：0
            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
            ,btn: ['确定'] //按钮
            //,icon: 6    // icon
          , yes:function(){
        	  layer.closeAll();
           }
        });
		return;
	}
	if(file1!=''){
		var index = layer.load(2, {
			shade: [0.8, '#393D49'],
		});
		setTimeout('$("#myForm1").submit();', 1000);
	}else{
		var index = layer.load(2, {
			shade: [0.8, '#393D49'],
		});
		setTimeout('$("#myForm2").submit();', 1000);
	}*/
	var index = layer.load(2, {
		shade: [0.8, '#393D49'],
	});
	setTimeout('$("#myForm1").submit();', 1000);
}
</script>
</html>