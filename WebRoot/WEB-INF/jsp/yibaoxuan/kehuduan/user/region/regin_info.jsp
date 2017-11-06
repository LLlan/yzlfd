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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/yahu.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/jquery-weui.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/weui.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/font-awesome.css">
    <link rel="stylesheet" href="static/yibaoxuan/zywkehuduan/css/index.css"/>
    <script src="static/yibaoxuan/zywkehuduan/js/jquery-2.1.4.js"></script>
    <script src="static/yibaoxuan/zywkehuduan/js/fastclick.js"></script>
    <script src="static/yibaoxuan/zywkehuduan/js/jquery-weui.js"></script>
    <script src="static/yibaoxuan/layer/layer.js"></script>
    <title>主页</title>
    <style>
        .xuanXiang>li>.btm-bor{
            border-bottom: 3px solid #4db7e1;color:#4db7e1;!important;
        }
        .show{
            display: block;
        }
        .hide{
            display: none;
        }
         .mask {
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0,0,0,0.3);
		    position: fixed;
		    top: 0;
		    left: 0;
		    display: none;
		    z-index: 100;
		}
		.bigImg img {
		    height: 250px;
		}
		.bigImg {
		    width: 100%;
		    height: auto;
		    position: fixed;
		    left: 0;
		    top: 150px;
		    display: none;
		    z-index: 99999;
		}
		.exampleBox {
		    padding: 9px 4%;
		    overflow: hidden;
		}
		.btn3 {
		    position: absolute;
		    top: 60px;
		    right: 0;
		    border-color: #000;
		    color: #fff;
		    padding: 5px;
		    border-radius: 5px;
		    background-color: #F3D588;
		    outline: none;
		    text-decoration: none;
		}
		.ys_detail .ysy li .consult .btn {
		    position: absolute;
		    top: 20px;
		    right: 0;
		    border-color: #000;
		    color: #fff;
		    padding: 5px;
		    border-radius: 5px;
		    background-color: #F3D588;
		    outline: none;
		}
		.ys_detail .ysy li .consult .btn22 {
		    position: absolute;
		    top: 58px;
		    right: 0;
		    border-color: #000;
		    color: #fff;
		    padding: 5px;
		    border-radius: 5px;
		    background-color: #F3D588;
		    outline: none;
		}
    </style>
</head>
<body>
<!--头部-->
<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">主页</h1>
    <a href="api/ybxkehu/goDoctor.do?type=${pd.type }" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<div class="main">
    <!--医生简介-->
    <div class="ys_info" >
        <div class="ys_detail" style="border-bottom: none;">
            <div class="img3">
                <a href="javascript:void(0)"><img src="${xqData.headImg}" alt=""/></a>
            </div>
            <ul class="ysy" style="position: relative;font-size: 15px;">
                <li>
                    <b>${xqData.youName}</b> <%--| --%>
                    <span>
                    <%--
                    <c:if test="${name eq '医生'}">${xqData.position}</c:if>
                    <c:if test="${name eq '药商'}">
                  	  <c:if test="${xqData.category eq '1'}">中药</c:if>
                  	  <c:if test="${xqData.category eq '2'}">西药</c:if>
                  	  <c:if test="${xqData.category eq '3'}">中药/西药</c:if>
                    </c:if>
                    <c:if test="${name eq '机构'}">${xqData.dengji}</c:if>
                    --%>
                    </span>
                </li>
                <li>
                  	  <%--${xqData.mark}--%>
                </li>
                <%--
                 <c:if test="${name eq '医生'}">
	                 <li>
	                 	   科类:<span>${xqData.keshiName}</span>
	                </li>
                </c:if>
                --%>
                <li>
                 	   服务项目:<span>${fuwuList.size()}</span>个
                </li>
                <li>
                    <a href="javascript:void(0)" class="consult" onclick="lijizixun('${kehu_userId }','${xqData.user_shanghu_id}','${kehu_userName}','${xqData.youName }')">
                        <button class="btn">立即咨询</button>
                    </a>
                    <a href="javascript:void(0)" class="consult" onclick="pingjiajilu('${xqData.user_shanghu_id}')">
                        <button class="btn22">评价记录</button>
                    </a>
                  <!--   <span>帮助过<em>10</em>人</span> -->
                </li>
            </ul>
        </div>
    </div>
    <div class="ys_item" >
        <ul class="xuanXiang">
            <li><a href="javascript:void(0)" class="btm-bor daizhixing">服务项目</a></li>
            <li><a href="javascript:void(0)" class="yiwan">个人资料</a></li>
        </ul>
        <div id="box" style="clear: both">
            <div class="show showbox box1">
            <c:forEach items="${fuwuList}" var="fuwu">
                <div class="bg-smallbox">
                    <div class="smallbox" id="images">
                        <img src="${fuwu.headImg}"/>
                        <%--<a id="example2-2" href="${fuwu.headImg}">
                        	<img alt="" src="${fuwu.headImg}" />
                        </a>--%>
                        <div class="ziLiao">
                            <p>${fuwu.fuwu_jibing_name }</p>
                            <p></p>
                            <p>${fuwu.jibing_introdaction }</p>
                            <p>价格:${fuwu.price}元</p>
                            <%-- <c:choose>
                            	<c:when test="${pd.type=='3' }">
                            		<button class="btn3" onclick="creatOrder1('${fuwu.fuwu_id }');">立即下单</button>
                            	</c:when>
                            	<c:otherwise>
                            		<button class="btn3" onclick="creatOrder('${fuwu.fuwu_id }');">立即下单</button>
                            	</c:otherwise>
                            </c:choose>--%>
                            <button class="btn3" onclick="creatOrder1('${fuwu.fuwu_id }');">立即下单</button>
                        </div>
                    </div>
                </div>
              </c:forEach>
             
            </div>
            <!--个人资料-->
            <div id="data" class="hide">
                <div class="expert">
                    <h1>简介</h1>
                    <div class="profile">
                       		${xqData.introduct}
                    </div>
                </div>
                <div class="field">
                    <h1>经营范围</h1>
                    <div class="good-at">
                    	${xqData.goodField }
                    </div>
                </div>
                <%--
                <div class="case">
                    <h1>案例</h1>
                    <div class="success_case">
                        <ul>
                        <c:forEach items="${anliList }" var="anli">
                            <li>
                            <span></span>
                            <img src="${anli.imgPath}" style="height: 70px; width: 70px;"/>
                            	${anli.title}
                            <a href="api/zywkehu/getyishengAnliDetail.do?anli_id=${anli.anli_zhanshi_id}">详情&gt;&gt;</a>
                            </li>
                        </c:forEach>
                        </ul>
                    </div>
                </div>
                --%>
            </div>
        </div>
    </div>
</div>
<%-- 填写订单详细信息 --%>
<div id="writeInformation" style="display: none;">
	<table style="width: 94%;margin: 2px 0 0 10px;">
		<tr style="height: 35px;">
			<td style="border: 1px solid #cfbcbc;text-indent: 10px;">收货人姓名：</td>
			<td style="border: 1px solid #cfbcbc;text-indent: 10px;">
				<input id="xingming" type="text" placeholder="输入收货人姓名" style="border: 1px solid #8687b5;border-radius: 10px;height: 30px;text-indent: 10px;">
			</td>
		</tr>
		<tr style="height: 35px;">
			<td style="border: 1px solid #cfbcbc;text-indent: 10px;">收货人电话：</td>
			<td style="border: 1px solid #cfbcbc;text-indent: 10px;">
				<input id="dianhua" type="text" placeholder="输入收货人电话" style="border: 1px solid #8687b5;border-radius: 10px;height: 30px;text-indent: 10px;">
			</td>
		</tr>
		<tr style="height: 35px;">
			<td style="border: 1px solid #cfbcbc;text-indent: 10px;">收货人地址：</td>
			<td style="border: 1px solid #cfbcbc;text-indent: 10px;">
				<input id="dizhi" type="text" placeholder="输入收货人地址" style="border: 1px solid #8687b5;border-radius: 10px;height: 30px;text-indent: 10px;">
			</td>
		</tr>
		<tr style="height: 35px;">
			<td style="border: 1px solid #cfbcbc;text-indent: 10px;">备　　　注：</td>
			<td style="border: 1px solid #cfbcbc;text-indent: 10px;">
				<input id="beizhu" type="text" placeholder="输入备注信息" style="border: 1px solid #8687b5;border-radius: 10px;height: 30px;text-indent: 10px;">
			</td>
		</tr>
		<tr style="height: 35px;">
			<td style="border: 1px solid #cfbcbc;text-indent: 10px;">购买数　量：</td>
			<td style="border: 1px solid #cfbcbc;text-indent: 10px;">
				<input id="number" type="text" placeholder="输入购买数量" style="border: 1px solid #8687b5;border-radius: 10px;height: 30px;text-indent: 10px;">
			</td>
		</tr>
	</table>
</div>
<%-- end --%>
<form action="api/ybxorder/toRegin_pay.do" method="post" id="myForm">
	<input type="hidden" name="xingming" id="xingming1">
	<input type="hidden" name="dianhua" id="dianhua1">
	<input type="hidden" name="dizhi" id="dizhi1">
	<input type="hidden" name="beizhu" id="beizhu1">
	<input type="hidden" name="number" id="number1">
	<input type="hidden" name="fuwu_id" id="id1">
	<input type="hidden" name="WIDshow_url" id="WIDshow_url1">
</form>
<div class="mask"></div>
<div class="bigImg"></div>
<script type="text/javascript">
	$("#box>div>div>div>img").click(function(){
        event.stopPropagation();
        $(".mask").fadeIn();
        var pic=$(this).attr("src");
        $(".bigImg").fadeIn();
        $(".bigImg").empty();
        $(".bigImg").append('<img class="bigPic" src="'+pic+'">');
        $(document).click(function(event){
            var _con = $('.bigImg');   // 设置目标区域
            if(!_con.is(event.target) && _con.has(event.target).length === 0){ // Mark 1
                $('.bigImg').fadeOut();//淡出消失
                $(".mask").fadeOut();
            }
        });
    });
</script>
 <script type="text/javascript">
 	  function lijizixun(kehu_id,shanghu_id,userName,shanghuName){
	 	  /* console.log(arguments[0]);  
	 	  console.log(arguments[1]);
	 	  console.log(arguments[2]); */
	      location.href="api/ybxkehu/myqq.do?kehu_userId="+kehu_id+"&shanghu_userId="+shanghu_id+"&userName="+userName+"&shanghuName="+shanghuName+"&identity=5";    
    		
    }
    
    
    function pingjiajilu(id){
    	location.href="api/ybxkehu/pingjiajilu.do?user_shanghu_id="+id;
    }
    
    /*  layer.alert("开发中！！敬请期待。",{
	            title:"温馨提示"//提示标题，默认为：信息
	            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
	            ,anim: 0 //动画类型0-6，默认为：0
	            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
	            ,btn: ['确定'] //按钮
	            ,icon: 6    // icon
		          
       		 }); */
 	function creatOrder1(id){
 		 layer.open({
             type: 1
             ,title: "填写订单信息"
             ,closeBtn: 0
             ,area:['90%', '270px']
             ,shade: 0.5
             ,style:'background:gray;'
             ,id: 'LAY_layuipro'
             ,resize: false
             ,skin: 'layui-layer-lan'
             ,btn: ['提交订单', '退出']
             ,btnAlign: 'c'
             ,shadeClose: true 
             ,content: $("#writeInformation")
             ,btn1: function(){
            	 var phoneReg=/^1[3-9]\d{9}$/;//验证手机格式
            	 var numberReg=/^\+?[1-9]\d*$/;
            	 var xingming= $("#xingming").val();
            	 var dianhua= $("#dianhua").val();
            	 var dizhi= $("#dizhi").val();
            	 var beizhu= $("#beizhu").val();
            	 var number= $("#number").val();
            	 
            	 var WIDshow_url=window.location.href;
     			 WIDshow_url=encodeURIComponent(WIDshow_url);
     			 //信息验证
            	 if(xingming==''){
            		layer.tips('姓名不能为空', '#xingming', {
           			  tips: [4, '#FF1493'],
           			  time: 4000
           			});
            		return;
            	 }
            	 if(!phoneReg.test(dianhua)){
             		layer.tips('手机格式不正确', '#dianhua', {
            			  tips: [4, '#FF1493'],
            			  time: 4000
            			});
             		return;
             	 }
            	 if(dizhi==''){
             		layer.tips('地址不能为空', '#dizhi', {
            			  tips: [4, '#FF1493'],
            			  time: 4000
            			});
             		return;
             	 }
            	 if(!numberReg.test(number)){
              		layer.tips('请输入大于0的整数', '#number', {
             			  tips: [4, '#FF1493'],
             			  time: 4000
             			});
              		return;
              	 }
            	 $("#xingming1").val(xingming);
           		 $("#dianhua1").val(dianhua);
           		 $("#dizhi1").val(dizhi);
           		 $("#beizhu1").val(beizhu);
           		 $("#number1").val(number);
           		 $("#id1").val(id);
           		 $("#WIDshow_url1").val(WIDshow_url);
           		 //提交form表单
           		 $("#myForm").submit();
            	 layer.closeAll();
                 //console.log("tiji");
             }
             ,btn2: function(){
            	 $("#xingming").val("");
            	 $("#dianhua").val("");
            	 $("#dizhi").val("");
            	 $("#beizhu").val("");
            	 $("#number").val("");
            	 //console.log("tuichu");
             }
 		});
 	}
 
	 $(function(){
		checkSession2();
	});
		  //判断session是否存在 做相应的提示
		function checkSession2(){
			var respCode = "${respCode}";
			if(respCode=="01"){
			}else{
			 	 layer.confirm('您还没有登录，马上去？', {
				                btn: ['确定']['取消'],
				                title:'温馨提示',
				                closeBtn:0,
				            	},function () {
				            		window.location.href='api/ybxkehu/toLogin.do';
				            	},function () {
				            		var zjh = "${pd.zjh}";
	  			            		if(zjh=='1'){
	  			            			window.location.href='api/zywkehu/index1.do';
	  			            		}else{
	  			            			window.location.href='api/ybxkehu/index.do';
	  			            		}
				            	}
				      );
				}
		}
 
       	function creatOrder(id){
       		checkSession(id);
       		
       	}
     //判断session是否存在 做相应的提示
	function checkSession(id){
		var respCode = "${respCode}";
		if(respCode=="01"){
			var WIDshow_url=window.location.href;
			WIDshow_url=encodeURIComponent(WIDshow_url);
			
			
			
			window.location.href='api/ybxorder/toRegin_pay.do?fuwu_id='+id+"&WIDshow_url="+WIDshow_url;
		}else{
			 	 layer.confirm('您还没有登录，马上去？', {
 			                btn: ['确定']['取消'],
 			                title:'温馨提示',
 			                closeBtn:0,
 			            	},function () {
 			            		window.location.href='api/ybxkehu/toLogin.do';
 			            	}
 			       );
		}
	}
 </script>
<script>
	

    $(function () {
        FastClick.attach(document.body);
    });
    
   
</script>
<script type="text/javascript">
    var li=$('li');
    var div=$('#box').children();
    li.click(function(){
        div.eq($(this).index()).attr('class','show').siblings().attr('class','hide');
        $(this).children().addClass("btm-bor").parent().siblings().children().removeClass("btm-bor");
    });
    $(".yijiuzhen").click(function(){
        $(".mask").fadeIn();
        $(".noneBox").fadeIn();
        $(".cancel").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
        });
        $(".sure").click(function(){
            $(".mask").fadeOut();
            $(".noneBox").fadeOut();
            $(".yiwan").addClass("btm-bor");
            $(".daizhixing").removeClass("btm-bor");
            div.eq($(this).index()).attr('class','show').siblings().attr('class','hide');
            /* .attr('class','hide').siblings().attr('class','show');*/
        })
    });
</script>
</body>
</html>