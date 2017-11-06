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
    <link rel="stylesheet" href="static/yibaoxuan/css/demos.css">
    <title>个人信息</title>
    <style>
        body{
            background-color:#eee;
        }
        .weui-label {
            width: 70px;
        }
        label{
            display: inline-block;
            width:70px;
        }
        #start{
            padding-left:6%;
        }
        .logoPic{
            display: block;height:100px;position: relative;
        }
        .logoPic>p{
            width:24%;position:absolute;top:40%;left:4%;
        }
        .logoPic>p>i{
            position: absolute;
            top:20px;left:0;
            font-size:12px;color:#a8a8a8;
        }
       .z_photo .up-img {
		    display: block;
		    height: 80px;
		    max-width: 280%;
		    width: auto;
		}
    </style>
</head>
<body ontouchstart>
<!--头部开始-->
<div class="wy-header header" style="width:100%;position: fixed;top:0;left:0;z-index: 100;">
    <div class="wy-header-icon-back" ><a href="javascript:history.go(-1)"></a></div>
    <div class="wy-header-title">个人信息</div>
</div>
<!--头部结束-->
<!--主体开始-->
<form action="<%=basePath %>api/ybxshangHu/savePersonInformation.do" method="post" enctype="multipart/form-data" id="myForm">
<input type="hidden" value="${pd.headImg }" id="panduan">
<div class="Pxinxi">
    <ul>
        <li class="logoPic"><p>商家图片</hr><i>(店面/LOGO)</i></p>
            <div class="img-box " style="display:inline;margin:0;width:80px;background-color: #fff;position: absolute;top:10px;;left:30%;">
                <section class=" img-section" style="width:80px;">
                    <div class="z_photo upimg-div clear" style="border:none; width:80px;">
                        <section class="z_file fl"  style="margin:0;width:80px;border:1px solid #ddd">
                            <c:if test="${pd.headImg!='' && pd.headImg!=null }">
                        		<img src="${pd.headImg }" class="add-img" style="margin:0;width:auto;height:80px;max-width: 280%;">
                        	</c:if>
                        	<c:if test="${pd.headImg=='' || pd.headImg==null }">
                        		 <img src="static/yibaoxuan/images/add1.png" class="add-img" style="margin:0;width:80px;height:80px;">
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
        	<label for="name1">商家名称</label>
        	<input type="text" style="margin-left: 5%;" placeholder="您的名称或名字" id="name1" name="youName" value="${pd.youName }"/>
        </li>
        <%-- 
        <li>
        	<label for="name1">标注</label>
        	<input type="text" style="margin-left: 5%;" placeholder="个人还是国营" id="name1" name="mark" value="${pd.mark }"/>
        </li>
        <li>
        	<label for="name1">服务热线</label>
        	<input type="text" style="margin-left: 5%;" placeholder="联系电话" id="linkMethod" name="linkMethod" value="${pd.linkMethod }"/>
        </li>
        <c:choose>
        	<c:when test="${pd.identity=='2' }">
        		<li>
		        	<label for="telnum1">类型</label>
		        	<select name="dengji" style="margin-left: 5%;border: 1px solid #dac5c5;height: 30px;width: 100px;text-align: center;">
		        	<c:forEach items="${list }" var="list">
		        		<option value="${list.typeName }" <c:if test="${pd.dengji==list.typeName }">selected</c:if>>${list.typeName }</option>
		        	</c:forEach>
		        	</select>
		        </li>
        	</c:when>
        	<c:otherwise>
        		<li>
		        	<label for="telnum1">类型</label>
		        	<select name="category" style="margin-left: 5%;border: 1px solid #dac5c5;height: 30px;width: 100px;text-align: center;">
		        		<option value="1" <c:if test="${pd.category=='1' }">selected</c:if>>中药</option>
		        		<option value="2" <c:if test="${pd.category=='2' }">selected</c:if>>西药</option>
		        		<option value="3" <c:if test="${pd.category=='3' }">selected</c:if>>中药/西药</option>
		        	</select>
		        </li>
        	</c:otherwise>
        </c:choose>--%>
        <li>
        	<label for="biaozhu1">地址</label>
        	<%--
        	<input type="text" style="margin-left: 5%;" placeholder="例：大同路XXX街道12号" id="biaozhu1" name="address" value="${pd.address }"/>
        	--%>
        	<input style="margin-left: 3%;" type="text" name="address" placeholder="选择城市"  id="address" value="${pd.address }" readonly="" data-code="420106" data-codes="420000,420100,420106"/>
        </li>
    </ul>
</div>
</form>
<a href="javascript:void(0)" class="save" onclick="save();">保存</a>
<!--主体结束-->
<script src="static/yibaoxuan/js/jquery-2.1.4.js"></script>
<script src="static/yibaoxuan/layer/mobile/layer.js"></script>
<script type="text/javascript" src="static/js/jquery.tips.js"></script>
<script src="static/yibaoxuan/js/imgUp1.js"></script>
<script src="static/yibaoxuan/lib/fastclick.js"></script>
<script src="static/yibaoxuan/zywkehuduan/js/city-picker.js"></script>
<script src="static/yibaoxuan/zywkehuduan/js/jquery-weui.js"></script>
<script>


$(function(){
    $("#address").cityPicker({
        title: "请选择地址",
        onChange: function (picker, values, displayValues) {
            console.log(values, displayValues);
        }
    });
})
    $(function() {
        FastClick.attach(document.body);
    });
  //保存
	function save(){
	  	//alert($("#start").val())
		//先判断是添加还是修改(添加时头像不能为空，修改时可以为空)
		if($("#panduan").val()==""){//添加
			//判断头像是否合法
			if($("#file").val()==""){
				layer.open({
					content:'请选择商家LOGO'
					,skin:'msg'
					,time:2
				});
				return;
			}
		}
		//判断名称是否合法
		if($("#name1").val()==""){
			layer.open({
				content:'请输入商家名称'
				,skin:'msg'
				,time:2
			});
			return;
		}
		//判断地址是否合法
		if($("#address").val()==""){
			layer.open({
				content:'请选择商家地址'
				,skin:'msg'
				,time:2
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
<script src="static/yibaoxuan/js/jquery-weui.js"></script>
<script src="static/yibaoxuan/js/city-picker.js"></script>
<script>
    $("#start").cityPicker({
        title: "选择出发地",
        onChange: function (picker, values, displayValues){
            console.log(values, displayValues);
            
        }
    });
    $("#end").cityPicker({
        title: "选择目的地"
    });
    $("#home-city").cityPicker({
        title: "选择目的地",
        showDistrict: false,
        onChange: function (picker, values, displayValues) {
            console.log(values, displayValues);
        }
    });
</script>
</body>
</html>