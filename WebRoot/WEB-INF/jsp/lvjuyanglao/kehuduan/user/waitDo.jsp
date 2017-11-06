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
	<link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/lib/weui.min.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/jquery-weui.css">
     <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/index.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">

    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">

    <title>待执行</title>
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
        .wy-header-icon-back{
            width:120px;
        }
        .wy-header-icon-back>a{
            background: url(static/zhaoyiwang/zywkehuduan/images/dingwei01.png) no-repeat;background-size: 20px;;
        }
        .searchBox{
            margin-top: 0;
        }
        .quxiao01,.yijiuzhen {
            width: 60px;
            height: 25px;
            line-height: 25px;
            text-align: center;
            color: #000;
            font-size: 14px;
            border: 1px solid #eee;
            position: absolute;
            bottom: 12px;
            right: 0;
            background-color: #fff;
            border-radius: 5px;
        }
        .noneBox>p:nth-child(2)>a, .noneBox02>p:nth-child(2)>a, .noneBox03>p:nth-child(2)>a {
            padding: 17px 30px;
            color: #71b2d0;
        }
       
         .smallbox>div .ziliao02{
		 	padding:4px 5.5%;color:#000;font-size:14px;border:1px solid #eee;
	    	position: absolute;bottom:52px;right:0;background-color:#fff;border-radius: 5px;
		}	
		.weui-tabbar__label {
		    text-align: center;
		    color: #999;
		    font-size: 12px;
		    line-height: 1.2;
		    margin-bottom: 3px;
		}
		
		.ziLiao>p:nth-child(3) {
    		width: 62%;
    	}
    	 .position{
			 display:inline-block;color:#aeaeae;font-size: 14px;font-weight: 400;padding-left:8px;margin-left:10px;border-left:1px solid #aeaeae;
		}
		.ziLiao>p:nth-child(4) {
		    color: #e0c381;
		    font-size: 14px;
		    white-space: nowrap;
		    overflow: hidden;
		    text-overflow: ellipsis;
		}
		.qupingjia{
			    display: block;
			    padding: 4px 4px;
			    color: #fff;
			    font-size: 14px;
			    position: absolute;
			    right: 0;
			    background-color: #fdb836;
			    border-radius: 5px;
		}
    </style>
</head>
<body style="height: 100%">
<!--头部开始-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">会员中心</h1>
<!--     <a href="javascript:history.go(-1)" class="icon1"><i class="icon-angle-left "></i></a> -->
</div>
<!--头部结束-->
<!--主体开始-->
<div class="ziliaoBox01" style="margin-top: 50px;">
    <div class="smallbox">
        <img src="static/zhaoyiwang/zywkehuduan/images/ill.png"/>
        <div class="ziLiao">
        <c:if test="${not empty pd}">
        <input type="hidden" id="rname" value="${pd.realName}"/>
            <p style="margin-top:1px;">${empty pd.realName ? '还未完善个人资料': pd.realName}&nbsp;&nbsp;<span style="border:none;">${pd.address }</span></p>
            <p style="color:#000;font-size:12px;margin-top:5px;">${pd.sex}</p>
            <c:if test="${not empty pd.age}">
           		 <p style="color:#000;font-size:12px;">${pd.age}岁</p>
            </c:if>
            <c:if test="${empty pd.age}">
            	<p style="color:#000;font-size:12px;"></p>
            </c:if>
             <c:if test="${not empty pd.realName}">
           		   <p style="color:#000;font-size:12px;">${pd.phone }</p>
            </c:if>
            <a href="javascript:void(0)" onclick="tuichu()" class="ziliao02" style="background-color: #fff;color: #333;">退出</a>
            <a href="<%=basePath%>api/zywkehu/gerenInfo.do?user_kuhu_id=${pd.user_kuhu_id}" class="ziliao01" style="padding:6px 2%;background-color: #fff;color: #333;">个人信息</a>
        </c:if>
        </div>
    </div>
</div>
  <div class="profit">
        <div class="cash">
            <a href="api/zywkehu/myMoney.do?user_kuhu_id=${pd.user_kuhu_id}" style="display: block;" onclick="toPersonCenterJump('2');">
                <em>${pd.money }</em>
                <p>现金金额</p>
            </a>
        </div>
        
        <div class="integral">
            <a href="api/zywkehu/myJifen.do?user_kuhu_id=${pd.user_kuhu_id}" style="display: block;">
                <em>${pd.jifen }</em>
                <p>我的积分</p>
            </a>
        </div>
    </div>

<form id="orderForm" method="post">
<ul class="xuanXiang">
    <li><a href="javascript:void(0)" onclick="getOrderListByWhereDzx(2)" class="daizhixing">待执行</a></li>
    <li><a href="javascript:void(0)" onclick="getOrderListByWhereYwc(1)" class="yiwan">已完成</a></li>
    <input type="hidden" id="order_state" name="order_state">
</ul>
<div id="box"style="clear: both;margin-bottom:60px;">
   		 <div class="show showbox box1">
        <c:forEach items="${yishengOrderList}" var="ol">
	        <div class="bg-smallbox" style="margin-top:11px;">
	            <div class="smallbox">
	                <img src="${ol.headImg}"/>
	                <div class="ziLiao">
	                <div style="float: left;max-width:63px; text-overflow: ellipsis;overflow: hidden;white-space: nowrap;">
                   		${ol.youName }
                   	</div>
                   	
                   	<div class="position">${ol.position }</div>
	                   
	                    <p>${ol.mark }</p>
	                    <p>服务疾病:${ol.fuwu_jibing_name}</p>
	                    <p>价格:${ol.price}</p>
	                    <c:if test="${order_state eq '2'}">
		                    <a href="javascript:void(0)" onclick="yijiuzhen('${user_kehu_id }','${ol.user_shanghu_fid}','${ol.price}','${ol.shanghu_price}','${ol.order_yisheng_id}',1)" class="yijiuzhen">确认付款</a>
		                    <a href="javascript:void(0)" class="quxiao01" onclick="qxdd('${ol.order_yisheng_id}','${ol.identity}');">取消订单</a>
	                    </c:if>
	                    <c:if test="${order_state eq '1' and ol.pingjia_flag !='1'}">
	                    	<a href="javascript:void(0)" style="background-color:#fdb836;color:#000;font-size:14px;border:1px solid #eee;padding:6px 4%;position: absolute;top:18px;right:0;border-radius: 5px;" onclick="qupj('${ol.order_yisheng_id}','${user_kehu_id }','${ol.user_shanghu_fid}','${ol.identity}');">去评价</a>
	                    </c:if>
	                </div>
	            </div>
	        </div>
        </c:forEach>
        
        <c:forEach items="${yaoshangOrderList}" var="ol">
	        <div class="bg-smallbox" style="margin-top:11px;">
	            <div class="smallbox">
	                <img src="${ol.headImg}"/>
	                <div class="ziLiao">
	                    <p>${ol.youName } 
	                    <span>
	                    <c:if test="${ol.category eq '1'}">中药</c:if>
	                    <c:if test="${ol.category eq '2'}">西药</c:if>
	                    <c:if test="${ol.category eq '3'}">中药/西药</c:if>
	                    </span></p>
	                    <p>${ol.mark }</p>
	                    <p>服务疾病:${ol.fuwu_name }</p>
	                    <p>价格:${ol.price}</p>
	                   <c:if test="${order_state eq '2'}">
		                    <a href="javascript:void(0)" onclick="yijiuzhen('${user_kehu_id }','${ol.user_shanghu_fid}','${ol.price}','${ol.shanghu_price}','${ol.order_yaoshang_id}',3)" class="yijiuzhen">确认付款</a>
		               		<a href="javascript:void(0)" class="quxiao01" onclick="qxdd('${ol.order_yaoshang_id}','${ol.identity}');">取消订单</a>
	                    </c:if>
	                    <c:if test="${order_state eq '1' and ol.pingjia_flag !='1'}">
	                    <a href="javascript:void(0)" style="background-color:#fdb836;color:#000;font-size:14px;border:1px solid #eee;padding:6px 4%;position: absolute;top:18px;right:0;border-radius: 5px;" onclick="qupj('${ol.order_yaoshang_id}','${user_kehu_id }','${ol.user_shanghu_fid}','${ol.identity}');">去评价</a>
	                    </c:if>
	                </div>
	            </div>
	        </div>
        </c:forEach>
        
        <c:forEach items="${jigouOrderList}" var="ol">
	        <div class="bg-smallbox" style="margin-top:11px;">
	            <div class="smallbox">
	                <img src="${ol.headImg}"/>
	                <div class="ziLiao">
	                    <p>${ol.youName } <span>${ol.dengji }</span></p>
	                    <p>${ol.mark }</p>
	                    <p>${ol.fuwu_name }</p>
	                    <p>价格:${ol.price}</p>
	                    <c:if test="${order_state eq '2'}">
		                    <a href="javascript:void(0)" onclick="yijiuzhen('${user_kehu_id }','${ol.user_shanghu_fid}','${ol.price}','${ol.shanghu_price}','${ol.order_jigou_id}',2)" class="yijiuzhen">确认付款</a>
		             		<a href="javascript:void(0)" class="quxiao01" onclick="qxdd('${ol.order_jigou_id}','${ol.identity}');">取消订单</a>
	                    </c:if>
	                    <c:if test="${order_state eq '1' and ol.pingjia_flag !='1'}">
	                    	<a href="javascript:void(0)" style="background-color:#fdb836;color:#000;font-size:14px;border:1px solid #eee;padding:6px 4%;position: absolute;top:18px;right:0;border-radius: 5px;" onclick="qupj('${ol.order_jigou_id }','${user_kehu_id }','${ol.user_shanghu_fid}','${ol.identity}');">去评价</a>
	                    </c:if>
	                </div>
	            </div>
	        </div>
        </c:forEach>
    </div>
    
    
   <!--  <div class="hide showbox box2">
        <div class="bg-smallbox"  style="margin-top:11px;">
            <div class="smallbox">
                <img src="static/zhaoyiwang/zywkehuduan/images/yisheng_10.png"/>
                <div class="ziLiao">
                    <p>杨梅 <span>主治医师</span></p>
                    <p>个人</p>
                    <p>服务疾病:腰间盘突出</p>
                    <p>价格:500元</p>
                    <a href="javascript:void(0)" style="background-color:#fff;color:#000;font-size:14px;border:1px solid #eee;padding:6px 4%;position: absolute;top:12px;right:0;border-radius: 5px;">已完成</a>
                </div>
            </div>
        </div>
    </div> -->
</div>
</form>
<div class="mask"></div>
<div class="noneBox">
    <p>您确定要进行已就诊操作？</p>
    <p><a href="javascript:void(0)" class="cancel01" style="color:#000;">取消</a> <a href="javascript:void(0)" class="sure">确定</a></p>
</div>
<div class="noneBox02">
    <p>您确定要取消此项服务？</p>
    <p><a href="javascript:void(0)" class="cancel02" style="color:#000;">再想想</a> <a href="javascript:void(0)" class="sure02" style="padding:17px 25px;">狠心取消</a></p>
</div>
<div class="noneBox03">
    <p>退款金额将原路退回支付账户</p>
    <p><a href="javascript:void(0)" class="sure03">确定</a></p>
</div>
<!--主体结束-->
<!--底部导航-->
<%@ include file="../diLan.jsp"%>
<!-- 弹窗提示 begin -->
<div class="mask" style="display: none;"></div>
<div class="weui-cells2" style="display:none;width:73%;height:135px;position: fixed;top:220px;left:13%;background-color: #fff;z-index: 99999;border-radius: 5px;">
  <div id="xiazai2" style="padding: 15px 20px;border-bottom: 1px solid #eee;text-align: center;height:79px;line-height: 79px">
    	您还没有登录，马上去？
  </div>
  <div id="quxiao2" style="color: #000;width: 100%;height:56px;line-height:56px;text-align: center;">
    <p class="cancel">确定</p>
  </div>
</div>
<!-- 弹窗提示 end -->
<script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<!-- <script src="static/zhaoyiwang/layer/mobile/layer.js"></script> -->

<script type="text/javascript">
	$(function(){
		var order_state = "${order_state}";
		if(order_state==2){
			$(".daizhixing").addClass("btm-bor");
			$(".yiwan").removeClass("btm-bor");
		}else{
			 $(".yiwan").addClass("btm-bor");
			 $(".daizhixing").removeClass("btm-bor");
		}
	});
	
	//已就诊
	function yijiuzhen(user_kehu_id,user_shanghu_id,price,shanghu_price,order_id,type){
 			      layer.open({
				    content: '您确定进行确认付款操作吗？'
				    ,btn: ['确定', '取消']
				    ,yes: function(index){
				    		location.href='api/zywkehu/yijiuzhen.do?user_kehu_id='+user_kehu_id+'&user_shanghu_id='+user_shanghu_id+'&price='+price+'&shanghu_price='+shanghu_price+'&order_id='+order_id+'&type='+type;                      
				    }
				  });
		
	}
	
	//取消订单
	function qxdd(id,identity){
 			      layer.open({
				    content: '您确定进行取消订单操作吗？'
				    ,btn: ['确定', '取消']
				    ,yes: function(index){
				    		location.href='api/shangHu/updateTuiDan0.do?id='+id+'&identity='+identity;
				    }
				  });
		
	}
	
	//待执行
	function getOrderListByWhereDzx(state){
		 location.href="api/zywkehu/huiyuanzhongxin.do?order_state=2";
	}
	
	//已完成
	function getOrderListByWhereYwc(state){
         location.href="api/zywkehu/huiyuanzhongxin.do?order_state=1";
	}
	
	//去评价
	function qupj(tid,user_fid,user_shanghu_id,identity){
		location.href="api/zywkehu/gopj.do?tid="+tid+"&user_fid="+user_fid+"&user_shanghu_id="+user_shanghu_id+"&identity="+identity;
	}

</script>

<script type="text/javascript">
    /*var li=$('li');
    var div=$('#box').children();
    li.click(function(){
        div.eq($(this).index()).attr('class','show').siblings().attr('class','hide');
        $(this).children().addClass("btm-bor").parent().siblings().children().removeClass("btm-bor");
    });
    $(".yijiuzhen").click(function(){
        $(".mask").fadeIn();
        $(".noneBox").fadeIn();
        $(".cancel01").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
        });
        $(".sure").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
            $(".yiwan").addClass("btm-bor");
            $(".daizhixing").removeClass("btm-bor");
            div.eq($(this).index()).attr('class','show').siblings().attr('class','hide');
        })
    });
    $(".quxiao01").click(function(){
        $(".mask").fadeIn();
        $(".noneBox02").fadeIn();
        $(".cancel02").click(function(){
            $(".mask").fadeOut();
            $(".noneBox02").fadeOut();
        });
        $(".sure02").click(function(){
            $(".noneBox02").fadeOut();
            $(".noneBox03").fadeIn();
            $(".sure03").click(function(){
                $(".mask").fadeOut();
                $(".noneBox03").fadeOut();
                $(".box1").remove();
            })
        })
    });*/
</script>
<script>
	$(function(){
     	abc();
     	checkSession();
     	//checkInfoComplete();
     })
     
     //检查个人资料是否完善
     function checkInfoComplete(){
     	if($("#rname").val()==""){
  			         //询问框
				  layer.open({
				    content: '您还未完善资料，马上去？'
				    ,btn: ['确定', '取消']
				    ,yes: function(index){
				    	window.location.href='api/zywkehu/gerenziliao.do';
				    },no:function(){
				    	window.location.href='api/zywkehu/index.do';
				    }
				  });
     	}
     }
     
     function abc(e1){
			$("#hyzx").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
	 }
	 
	 //退出
	 function tuichu(){
	 		window.location.href='api/zywkehu/tuichu.do';
	 }
	 
	 //判断session是否存在 做相应的提示
		function checkSession(){
			var respCode = "${respCode}";
			var zjh = "${pd.zjh}";
			
			if(respCode=="01"){
				checkInfoComplete();
			}else{
			  //询问框
				  layer.open({
				    content: '您还没有登录，马上去登录？'
				    ,btn: ['确定', '取消']
				    ,yes: function(index){
				    	window.location.href='api/zywkehu/toLogin.do';
				    },no:function(index){
				    	window.location.href='api/zywkehu/index1.do';
				    	/*if(zjh=='1'){
				    		window.location.href='api/zywkehu/index1.do';
				    	}else{
				    		window.location.href='api/zywkehu/index.do';
				    	}*/
				    }
				  });
			
				 	 /*  layer.confirm('您还没有登录，马上去？', {
  			                btn: ['确定']['取消'],
  			                title:'温馨提示',
  			                closeBtn:0,
  			            	},function () {
  			            		 
  			            	},function(){
  			            	
  			           	}
  			       );  */
			}
		}
		
</script>
</body>
</html>