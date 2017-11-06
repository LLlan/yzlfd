<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/weui.min.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/jquery-weui.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/login.css">

    <title>个人资料</title>
    <style>
        body{
            background-color:#eee;
        }
        .ziliaoList li input{
            width: 70%;
        }
         
        .sexCls{
        	padding: 5px 3px;
		    background-color: #fff;
		    color: #000;
		    border: 1px solid #c1c1c1;
		    border-radius: 5px;
        }
        .backlast{
      	  position:relative;top:-4px;left:19px;color:#fff;font-size: 15px;
        }
    </style>
</head>
<body>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"><span class="backlast">返回</span></a></div>
    <div class="wy-header-title">个人资料</div>
</div>
<!--头部结束-->
<!--主体开始-->
<div class="ziliaoBox01" style="margin-top:60px;">
<form  id="grzlForm">
    <ul class="ziliaoList">
    <%--   <li style="display: block;height:100px;position: relative;"><span style="position:absolute;top:40%;left:4%; ">头像</span>
            <div class="img-box" style="display:inline;margin:0;width:80px;background-color: #fff;position: absolute;top:10px;;left:27%;">
                <section class=" img-section" style="width:80px;">
                    <div class="z_photo upimg-div clear" style="border:none; width:80px;">
                        <section class="z_file fl"  style="margin:0;width:80px;border:1px solid #ddd">
                        	<c:if test="${pd.headImg!='' && pd.headImg!=null }">
                        		<img src="${pd.headImg }" class="add-img" style="margin:0;width:80px;height:80px;">
                        	</c:if>
                        	<c:if test="${pd.headImg=='' || pd.headImg==null }">
                        		 <img src="static//images/add1.png" class="add-img" style="margin:0;width:80px;height:80px;">
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
        </li> --%>
        
        <li><label for="name00">姓名</label><input type="text" id="name00" name="realName" placeholder="填写本人真实姓名" value="${pd.realName }"/></li>
        <li><label for="sex00">性别</label>
         <select name="sex"  style="width:25%;margin-left: 30px;height: 35px;" class="sexCls">
        	<option <c:if test="${pd.sex eq '男'}">selected="selected"</c:if>>男</option>
        	<option <c:if test="${pd.sex eq '女'}">selected="selected"</c:if>>女</option>
        </select>
        </li>
        <li><label for="age00">年龄</label><input type="text" id="age00" name="age" placeholder="填写本人真实年龄" value="${pd.age }"/></li>
        <li><label for="tel00">电话</label><input type="text" id="tel00" name="phone"  placeholder="填写本人联系方式" value="${pd.phone }"/></li>
        <li><label for="address">城市</label><input type="text" name="address" placeholder="选择城市"  id="address" value="${pd.address }" readonly="" data-code="420106" data-codes="420000,420100,420106"/></li>
    </ul>
 </form>
</div>
<a href="javascript:void(0)" class="save" id="save">保存</a>
<!--主体结束-->
<script src="static/yibaoxuan/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/yibaoxuan/zywkehuduan/js/city-picker.js"></script>
<script src="static/yibaoxuan/zywkehuduan/js/jquery-weui.js"></script>
<script src="static/yibaoxuan/layer/layer.js"></script>
<script type="text/javascript">
    $(function(){
        $("#address").cityPicker({
            title: "选择出发地",
            onChange: function (picker, values, displayValues) {
                console.log(values, displayValues);
            }
        });
    })
    
    $("#save").click(function(){
    	var ageReg=/^\+?[1-9]\d*$/;
		if(!ageReg.test($("#age00").val()) || (ageReg.test($("#age00").val()) && parseFloat($("#age00").val())>100)){
			layer.tips('请正确输入年龄', '#age00', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
		if($("#name00").val()==""){
			layer.tips('姓名不能为空', '#name00', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
		var phoneReg=/^1[3-9]\d{9}$/;
		if(!phoneReg.test($("#tel00").val())){
			layer.tips('请正确输入手机号码', '#tel00', {
			  tips: [1, '#FF3E96'],
			  time: 2000
			});
			return;
		}
    	var form  = $("#grzlForm").serialize();
		var url = "api/ybxkehu/saveGerenziliao.do";
		$.ajax({
			url: url,
			type: "post",
			data:form,
   			dataType:'json',
			success:function(data){
				if(data.respCode=="01"){
					window.location.href="api/ybxkehu/huiyuanzhongxin.do";
				}
			},
			error:function(){
				
			},
		}); 
    });

</script>
</body>
</html>