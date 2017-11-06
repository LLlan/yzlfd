<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>个人资料</title>
    <link rel="stylesheet" href="static/css/zyw/common.css"/>
    <link rel="stylesheet" href="static/css/zyw/toubu.css"/>
    <link rel="stylesheet" href="static/css/zyw/comStyle.css"/>
    <link rel="stylesheet" href="static/css/zyw/perZiliao.css"/>
    <link rel="stylesheet" href="static/css/zyw/common1.css"/>
    <link rel="stylesheet" href="static/css/zyw/index1.css"/>
    <script src="static/js/zyw/jquery-2.1.4.js"></script>
</head>
<body style="background-color: #fff;">
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
<div class="ziliaoBox">
    <div class="ziliao01">
        <p class="ziliaoTop">您的位置 > 首页 > <span>个人资料</span></p>
        <div class="mainBox">
            <div class="ziliaoMain">
                <div class="picUp" style="height: 30px;">
                     <%--<span>头&nbsp;&nbsp;&nbsp;&nbsp;像 : </span>
                    <div>
                        <div class="img-box full" style="display:inline;margin:0;width:101px;height:94px;position: absolute;top:0;left:0;border:2px dashed #d5d5d5;">
                            <section class=" img-section" style="width:101px;height:94px;">
                                <div class="z_photo upimg-div clear" style="border:none; width:101px;height:94px;">
                                    <section class="z_file fl"  style="margin:0;width:101px;height:94px;">
                                        <img src="static/images/zyw/add1.png" class="add-img" style="margin:0;width:97px;height:90px;">
                                        <input type="file" name="file" id="file1" class="file" value="" accept="images/jpg,images/jpeg,images/png,images/bmp" multiple style="margin:0;width:100%;"/>
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
                    </div>--%>
                </div>
                <p>
                    <label for="name" class="name"><span style="color:#d54510;padding-right:10px;">*</span>姓&nbsp;&nbsp;&nbsp;&nbsp;名 : </label>
                    <input type="text" id="realName" name="realName" placeholder="填写本人真实姓名" value="${pd.realName }"/>
                </p>
                <div class="xinxi01">
                    <label for="sex"><span style="color:#d54510;padding-right:10px;">*</span>性&nbsp;&nbsp;&nbsp;&nbsp;别 : </label>
                    <select name="sex" class="select" id="sex">
                        <option <c:if test="${pd.sex=='男' }">selected="selected"</c:if> value="男">男</option>
                        <option <c:if test="${pd.sex=='女' }">selected="selected"</c:if> value="女">女</option>
                    </select>
                    <label for="age" style="margin-left:20px;"><span style="color:#d54510;padding-right:10px;">*</span>年&nbsp;&nbsp;&nbsp;&nbsp;龄 : </label>
                    <input type="number" name="age" id="age" value="${pd.age }" min=1 placeholder="填写本人真实年龄" style="height: 36px;line-height: 36px;border: 1px solid #c1c1c1;border-radius: 3px;margin-left: 5px;padding-left: 10px;"/>
                </div>
                <p style="margin-left: -14px;">
                    <span style="color:#d54510;padding-right:10px;">*</span><label for="tel" class="tel">手机号码 : </label>
                    <input type="text" name="phone" value="${pd.phone }" id="phone" placeholder="填写本人使用中的手机号"/>
                </p>
                <p class="city011">
                    <label for="s_province"><span style="color:#d54510;padding-right:10px;">*</span>所在城市 :</label>
                    <select class="select" id="s_province" name="s_province" style="margin-right:15px;">
                    	<option>海南省</option>
                    </select>省
                    <select class="select" id="s_city" name="s_city"  style="margin-left:10px;margin-right:15px;">
                    	<option>海南省</option>
                    </select>市
                    <select class="select" id="s_county" name="s_county" style="margin-left:10px;margin-right:15px;" >
                    	<option>海南省</option>
                    </select>区
                    <script src="static/js/zyw/area.js"></script>
                    <c:if test="${pd.sheng=='' || pd.sheng==null }">
                    	<script type="text/javascript">chushihua("请选择","请选择","请选择");_init_area();</script>
                    </c:if>
                    <c:if test="${pd.sheng!='' && pd.sheng!=null }">
                    	<script type="text/javascript">chushihua("${pd.sheng}","${pd.city}","${pd.qu}");_init_area();</script>
                    </c:if>
                </p>
                <p style="margin-top:20px;">
                    <a href="javascript:void(0)" onclick="save();">保存</a>
                </p>
            </div>
        </div>
    </div>
</div>
<!--底部-->
<jsp:include page="../bottom.jsp"></jsp:include>
<script src="static/zhaoyiwang/layer/layer.js"></script>
<script>
	//保存
	function save(){
		//姓名不能为空
		if($("#realName").val()==""){
			layer.tips('姓名不能为空', '#realName', {
      		  tips: [1, '#FF3E96'],
      		  time: 3000
      		});
			return;
		}
		//年龄不能为空
		var ageReg=/^\+?[1-9]\d*$/;
		if(!ageReg.test($("#age").val()) || (ageReg.test($("#age").val()) && parseFloat($("#age").val())>100)){
			layer.tips('请正确输入年龄', '#age', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
		//手机号不能为空
		if($("#phone").val()==""){
			layer.tips('手机号不能为空', '#phone', {
      		  tips: [1, '#FF3E96'],
      		  time: 3000
      		});
			return;
		}
		var sheng=$("#s_province option:selected").val();
		var city=$("#s_city option:selected").val();
		var qu=$("#s_county option:selected").val();
		$.post('api/zywkehu/saveGerenziliao.do',{"realName":$("#realName").val(),"sex":$("#sex option:selected").val(),"age":$("#age").val(),"phone":$("#phone").val(),"address":sheng+" "+city+" "+qu},function(data){
			if(data.respCode=="01"){
				layer.msg('修改成功',{
    				time:1000,//单位毫秒
    				shade: [0.8, '#393D49'], // 透明度  颜色
    				icon:6,//1:绿色对号,2：红色差号,3：黄色问好,4：灰色锁,5：红色不开心,6：绿色开心,7：黄色感叹号
    			});
    			setTimeout("window.location.href='api/keHuPc/personCenter.do'", 1000);
			}
		});
		
	}
</script>
<script src="static/js/zyw/imgUp1.js"></script>
</body>
</html>