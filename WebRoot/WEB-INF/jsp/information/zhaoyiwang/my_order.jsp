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
    <link rel="stylesheet" href="static/zhaoyiwang/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/index.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/login.css">
    <title>我的订单</title>
    <style>
        body{
            background-color:#eee;
        }
        .show{
            display: block;
        }
        .hide{
            display: none;
        }
        .xuanXiang>li>.btm-bor{
            border-bottom: 3px solid #4db7e1;color:#4db7e1;!important;
        }
        .smallbox>div.ziLiao>a {
            display: block;
            width: 60px;
            height: 20px;
            line-height: 20px;
            text-align: center;
            color: #fff;
            font-size: 14px;
            position: absolute;
             top: 10px;
            right: 0;
            background-color: #fdb836;
            border-radius: 5px;
        }
        .smallbox>div.ziLiao>a.quxiao01{
            color: #fdb836;
            background-color: #fff;
            border: 1px solid #fdb836;
            top: 60px;
        }
        .noneBox>p:nth-child(2)>a, .noneBox02>p:nth-child(2)>a, .noneBox03>p:nth-child(2)>a {
            padding: 17px 35px;
            color: #71b2d0;
        }
        .ziLiao>p:nth-child(1)>span {
            color: #aeaeae;
            font-size: 12px;
            font-weight: 400;
            padding-left: 2px;
            margin-left: 0;
            border-left: none;
        }
        .ziLiao>p:nth-child(3) {
            width: 65%;
        }
        .kehuZiliao{
            width:92%;margin:auto;font-size: 16px;;
        }
        .kehuZiliao>p{
            border-bottom:1px solid #eee;padding:12px 0;color:#a6a6a6
        }
        .kehuZiliao>p>span{
            color:#000;
        }
    </style>
</head>
<body>
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">我的订单</h1>
    <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<!--主体开始-->
<div class="main" style="margin-top: 50px;">
    <ul class="xuanXiang">
        <li title="2"><a href="javascript:void(0)" class="btm-bor daizhixing">待执行</a></li>
        <li title="1"><a href="javascript:void(0)" class="yiwan">已完成</a></li>
    </ul>
    <div id="box"style="clear: both">
    	<%-- 待执行 --%>
        <div class="show showbox box1" id="boxid1">
        <c:forEach items="${list }" var="list">
                    <c:choose>
                    	<c:when test="${identity=='1' }">
	                    	<div class="bg-smallbox" style="margin-top:11px;">
				                <div class="smallbox">
				                    <img src="static/zhaoyiwang/images/ill.png"/>
				                    <div class="ziLiao">
			                    		<p>${list.realName }<span>${list.sex }|</span><span>${list.age }岁|</span><span>${list.address }</span></p>
				                        <%--<p>就诊时间：<span>05-17</span></p>--%>
				                        <p>就诊疾病:${list.fuwu_jibing_name }</p>
				                        <p>价格:${list.price }元</p>
				                        <a href="javascript:void(0)" class="yijiuzhen" style="background-color:#fff;color:#000;font-size:14px;border:1px solid #eee;padding:6px 3%;position: absolute;top:12px;right:0;border-radius: 5px;">待就诊</a>
				                        <a href="javascript:void(0);" class="quxiao01" onclick="lianxihuanzhe('${list.user_kuhu_id}','${list.realName }','${list.user_shanghu_id }','${list.youName }')">联系患者</a>
				                     </div>
		                		</div>
	           				</div>
                    	</c:when>
                    	<c:when test="${identity=='2' }">
	                    	<div class="bg-smallbox" style="margin-top:11px;">
				                <div class="smallbox">
				                    <img src="static/zhaoyiwang/images/ill.png"/>
				                    <div class="ziLiao">
			                    		<p>${list.realName }<span>${list.sex }|</span><span>${list.age }岁</p>
				                        <p><span>${list.address }</span></p>
				                        <p>就诊疾病:${list.fuwu_name }</p>
				                        <p>价格:${list.price }元</p>
				                        <a href="javascript:void(0)" class="yijiuzhen" style="background-color:#fff;color:#000;font-size:14px;border:1px solid #eee;padding:6px 3%;position: absolute;top:12px;right:0;border-radius: 5px;">待就诊</a>
				                        <a href="javascript:void(0);" class="quxiao01" onclick="lianxihuanzhe('${list.user_kuhu_id}','${list.realName }','${list.user_shanghu_id }','${list.youName }')">联系患者</a>
				                     </div>
		                		</div>
	           				</div>
                    	</c:when>
                    	<c:otherwise>
                    		<c:choose>
                    			<c:when test="${list.type=='4' || list.type=='5' }">
                    				<div class="bg-smallbox" style="margin-top:11px;">
						                <div class="smallbox">
						                    <img src="static/zhaoyiwang/images/ill.png"/>
						                    <div class="ziLiao">
					                    		<p>${list.realName }<span>${list.sex }|</span><span>${list.age }岁</p>
						                        <p><span>${list.address }</span></p>
						                        <p>就诊疾病:${list.fuwu_name }</p>
						                        <p>价格:${list.price }元</p>
						                        <a href="javascript:void(0)" class="yijiuzhen" style="background-color:#fff;color:#000;font-size:14px;border:1px solid #eee;padding:6px 3%;position: absolute;top:12px;right:0;border-radius: 5px;">待就诊</a>
						                        <a href="javascript:void(0);" class="quxiao01" onclick="lianxihuanzhe('${list.user_kuhu_id}','${list.realName }','${list.user_shanghu_id }','${list.youName }')">联系患者</a>
						                     </div>
				                		</div>
			           				</div>
                    			</c:when>
                    			<c:otherwise>
                    				<div class="bg-smallbox" style="margin-top:8px;height: 310px;margin-bottom: 10px;">
					                    <div class="kehuZiliao">
					                        <p>姓名 : <span>${list.xingming }</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话 : <span>${list.dianhua }</span></p>
					                        <p>地址 : <span>${list.dizhi }</span></p>
					                        <p>备注 : <span>${list.beizhu }</span></p>
					                    </div>
					                    <div class="smallbox">
					                        <img src="static/zhaoyiwang/images/ill.png" style="width: 74px;margin-top: 30px;"/>
					                        <div class="ziLiao">
					                            <p>${list.fuwu_name }</p>
					                            <a href="javascript:void(0);" class="quxiao01" onclick="lianxihuanzhe('${list.user_kuhu_id}','${list.realName }','${list.user_shanghu_id }','${list.youName }')" style="top:7px;">联系买家</a>
					                            <div style="color: #6f6f6f;font-size: 13px;height: 41px;width: 100%;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;">药品功效：<span>${list.fuwu_introdaction }</span></div>
					                            <p style="width: 100%">单价：<span style="float: right;">￥${list.price }</span></p>
					                            <p style="width: 100%;color: black;">数量：<span style="float: right;">${list.number }</span><span style="float: right;font-family: cursive;font-size: 1px;margin-top: 4px">X</span></p>
					                            <p style="width: 100%">总价：<span style="float: right;">￥${list.totalPrice }</span></p>
					                        </div>
					                    </div>
					                    <%--
					                    <a href="javascript:void(0)" style="background-color: #f13b3a;display: block;width: 50%;float: left;height: 36px;line-height: 36px;text-align: center;color: #fff;font-size: 14px;">联系买家</a>
					                    <a href="javascript:void(0);" style="background-color: #ff9600;display: block;width: 50%;float: left;height: 36px;line-height: 36px;text-align: center;color: #fff;font-size: 14px;">已发货</a>
					            		--%>
					            	</div>
                    			</c:otherwise>
                    		</c:choose>
                    	</c:otherwise>
                    </c:choose>
        </c:forEach>
    	</div>
    	<%-- 已完成 --%>
    	<div class="hide showbox box2" id="boxid2">
    	</div>
    </div>
</div>
<div class="mask"></div>
<div class="noneBox">
    <p id="callPhoen"></p>
    <p><a href="javascript:void(0)" class="cancel01" style="color:#000;">取消</a> <a href="tel:14543456765" class="sure">呼叫</a></p>
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
<script type="text/javascript">

function lianxihuanzhe(k_id,k_name,s_id,s_name){
	console.log(k_id)
	console.log(k_name)
	console.log(s_id)
	console.log(s_name)
	location.href="http://lnlcjf.com/api/zywkehu/lianxihuanzhe.do?ku_id="+k_id+"&kehu_name="+k_name+"&s_id="+s_id+"&s_name="+s_name;    
}


    var li=$('li');
    var div=$('#box').children();
    li.click(function(){
        div.eq($(this).index()).attr('class','show').siblings().attr('class','hide');
        $(this).children().addClass("btm-bor").parent().siblings().children().removeClass("btm-bor");
        var order_state=$(this).attr("title");
        console.log(order_state);
        $.post('api/shangHu/personMyOrderYesOrNo.do',{order_state:order_state},function(data){
        	if(data.reqCode=="01"){
        		var str='';
        		$.each(data.list,function(){
        			if(data.identity=='1'){
        				str+='<div class="bg-smallbox"  style="margin-top:11px;">';
            			str+='<div class="smallbox">';
            			str+='<img src="static/zhaoyiwang/images/ill.png"/>';
            			str+='<div class="ziLiao">';
            			str+='<p>'+this.realName+'<span>'+this.sex+'|</span><span>'+this.age+'岁|</span><span>'+this.address+'</span></p>';
            			if(order_state=='1'){
            				str+='<p>就诊时间：<span>'+this.complete_time+'</span></p>';
            			}
            			str+='<p>就诊疾病:'+this.fuwu_jibing_name+'</p>';
            			str+='<p>价格:'+this.price+'元</p>';
            			if(order_state=='1'){
            				str+='<a href="javascript:void(0)" style="background-color:#fff;color:#000;font-size:14px;border:1px solid #eee;padding:6px 4%;position: absolute;top:12px;right:0;border-radius: 5px;">已就诊</a>';
            				str+="<a href=\"javascript:void(0)\" onclick=\"lianxihuanzhe('+this.user_kuhu_id+','+this.realName+','+this.user_shanghu_id+','+this.youName+')\" class=\"quxiao01\" style=\"background-color:#fff;color:#fdb836;font-size:14px;border:1px solid #eee;padding:6px 4%;position: absolute;top:70px;right:0;border-radius: 5px;\">联系患者</a>";
            			}else{
            				str+='<a href="javascript:void(0)" class="yijiuzhen" style="background-color:#fff;color:#000;font-size:14px;border:1px solid #eee;padding:6px 3%;position: absolute;top:12px;right:0;border-radius: 5px;">待就诊</a>';
            				str+="<a href=\"javascript:void(0);\" class=\"quxiao01\" onclick=\"lianxihuanzhe('+this.user_kuhu_id+','+this.realName+','+this.user_shanghu_id+','+this.youName+')\">联系患者</a>";
            			}
            			str+='</div>';
            			str+='</div>';
            			str+='</div>';
        			}else if(data.identity=='2'){
        				str+='<div class="bg-smallbox"  style="margin-top:11px;">';
            			str+='<div class="smallbox">';
            			str+='<img src="static/zhaoyiwang/images/ill.png"/>';
            			str+='<div class="ziLiao">';
            			str+='<p>'+this.realName+'<span>'+this.sex+'|</span><span>'+this.age+'岁</p>';
            			if(order_state=='1'){
            				str+='<p>就诊时间：<span>'+this.complete_time+'</span></p>';
            			}else{
            				str+='<p><span>'+this.address+'</span></p>';
            			}
            			str+='<p>就诊疾病:'+this.fuwu_name+'</p>';
            			str+='<p>价格:'+this.price+'元</p>';
            			if(order_state=='1'){
            				str+=' <a href="javascript:void(0)" style="background-color:#fff;color:#000;font-size:14px;border:1px solid #eee;padding:6px 4%;position: absolute;top:5px;right:0;border-radius: 5px;">已就诊</a>';
            				str+="<a href=\"javascript:void(0)\" onclick=\"lianxihuanzhe('+this.user_kuhu_id+','+this.realName+','+this.user_shanghu_id+','+this.youName+')\" class=\"quxiao01\" style=\"background-color:#fff;color:#fdb836;font-size:14px;border:1px solid #eee;padding:6px 4%;position: absolute;top:70px;right:0;border-radius: 5px;\">联系患者</a>";
            			}else{
            				str+='<a href="javascript:void(0)" class="yijiuzhen" style="background-color:#fff;color:#000;font-size:14px;border:1px solid #eee;padding:6px 3%;position: absolute;top:12px;right:0;border-radius: 5px;">待就诊</a>';
            				str+="<a href=\"javascript:void(0);\" class=\"quxiao01\" onclick=\"lianxihuanzhe('+this.user_kuhu_id+','+this.realName+','+this.user_shanghu_id+','+this.youName+')\">联系患者</a>";
            			}
            			str+='</div>';
            			str+='</div>';
            			str+='</div>';
        			}else{
        				if(this.type=='4' || this.type=='5'){
        					str+='<div class="bg-smallbox"  style="margin-top:11px;">';
                			str+='<div class="smallbox">';
                			str+='<img src="static/zhaoyiwang/images/ill.png"/>';
                			str+='<div class="ziLiao">';
                			str+='<p>'+this.realName+'<span>'+this.sex+'|</span><span>'+this.age+'岁</p>';
                			if(order_state=='1'){
                				str+='<p>就诊时间：<span>'+this.complete_time+'</span></p>';
                			}else{
                				str+='<p><span>'+this.address+'</span></p>';
                			}
                			str+='<p>就诊疾病:'+this.fuwu_name+'</p>';
                			str+='<p>价格:'+this.price+'元</p>';
                			if(order_state=='1'){
                				str+=' <a href="javascript:void(0)" style="background-color:#fff;color:#000;font-size:14px;border:1px solid #eee;padding:6px 4%;position: absolute;top:5px;right:0;border-radius: 5px;">已就诊</a>';
                				str+="<a href=\"javascript:void(0)\" onclick=\"lianxihuanzhe('+this.user_kuhu_id+','+this.realName+','+this.user_shanghu_id+','+this.youName+')\" class=\"quxiao01\" style=\"background-color:#fff;color:#fdb836;font-size:14px;border:1px solid #eee;padding:6px 4%;position: absolute;top:70px;right:0;border-radius: 5px;\">联系患者</a>";
                			}else{
                				str+='<a href="javascript:void(0)" class="yijiuzhen" style="background-color:#fff;color:#000;font-size:14px;border:1px solid #eee;padding:6px 3%;position: absolute;top:12px;right:0;border-radius: 5px;">待就诊</a>';
                				str+="<a href=\"javascript:void(0);\" class=\"quxiao01\" onclick=\"lianxihuanzhe('+this.user_kuhu_id+','+this.realName+','+this.user_shanghu_id+','+this.youName+')\">联系患者</a>";
                			}
                			str+='</div>';
                			str+='</div>';
                			str+='</div>';
        				}else{
        					str+='<div class="bg-smallbox" style="margin-top:8px;height: 310px;margin-bottom: 10px;">';
            				str+='<div class="kehuZiliao">';
            				str+='<p>姓名 : <span>'+this.xingming+'</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;电话 : <span>'+this.dianhua+'</span></p>';
            				str+='<p>地址 : <span>'+this.dizhi+'</span></p>';
            				str+='<p>备注 : <span>'+this.beizhu+'</span></p>';
            				str+='</div>';
            				str+='<div class="smallbox">';
            				str+='<img src="static/zhaoyiwang/images/ill.png" style="width: 74px;margin-top: 30px;"/>';
            				str+='<div class="ziLiao">';
            				str+='<p>'+this.fuwu_name+'</p>';
            				str+="<a href=\"javascript:void(0);\" class=\"quxiao01\" onclick=\"lianxihuanzhe('+this.user_kuhu_id+','+this.realName+','+this.user_shanghu_id+','+this.youName+')\" style=\"top:7px;\">联系买家</a>";
            				str+='<div style="color: #6f6f6f;font-size: 13px;height: 41px;width: 100%;overflow: hidden;text-overflow: ellipsis;display: -webkit-box;-webkit-line-clamp: 2;-webkit-box-orient: vertical;">药品功效：<span>'+this.fuwu_introdaction+'</span></div>';
            				str+='<p style="width: 100%">单价：<span style="float: right;">￥'+this.price+'</span></p>';
            				str+='<p style="width: 100%;color: black;">数量：<span style="float: right;">'+this.number+'</span><span style="float: right;font-family: cursive;font-size: 1px;margin-top: 4px">X</span></p>';
            				str+='<p style="width: 100%">总价：<span style="float: right;">￥'+this.totalPrice+'</span></p>';
    	                    str+='</div>';       
    	                    str+='</div>';       
    	                    //str+='<a href="javascript:void(0)" style="background-color: #f13b3a;display: block;width: 50%;float: left;height: 36px;line-height: 36px;text-align: center;color: #fff;font-size: 14px;">联系买家</a>';       
    	                    //str+='<a href="javascript:void(0);" style="background-color: #ff9600;display: block;width: 50%;float: left;height: 36px;line-height: 36px;text-align: center;color: #fff;font-size: 14px;">已发货</a>';       
    	            		str+='</div>';
        				}
        			}
        		});
        		if(order_state=='1'){
        			$("#boxid2").html(str);
        		}else{
        			$("#boxid1").html(str);
        		}
        	}else{
        		window.location.href="api/shangHu/toLogin.do";
        	}
        });
    });
    //联系患者
    function callphone(phone){
    	console.log(phone);
    	$("#callPhoen").html(phone);
   	 	$(".mask").fadeIn();
        $(".noneBox").fadeIn();
        $(".cancel01").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
        });
        $(".sure").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
            $(".sure").attr("href","tel:"+phone);//href="tel:14543456765"
        });
    }
</script>
</body>
</html>