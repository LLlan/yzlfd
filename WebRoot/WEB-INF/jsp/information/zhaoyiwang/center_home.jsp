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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/zhaoyiwang/css/yahu.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/jquery-weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/weui.css"/>
    <link rel="stylesheet" href="static/zhaoyiwang/css/font-awesome.css">
    <link rel="stylesheet" href="static/zhaoyiwang/css/index.css"/>
    <script src="static/zhaoyiwang/js/jquery-2.1.4.js"></script>
    <script src="static/zhaoyiwang/js/fastclick.js"></script>
    <script src="static/zhaoyiwang/js/jquery-weui.js"></script>
    <title>会员中心</title>
    <style>
        .wy-header-icon-back{
            width:120px;
        }
        .wy-header-icon-back>a{
            background: url(static/zhaoyiwang/images/dingwei01.png) no-repeat;background-size: 20px;;
        }
        .searchBox{
            margin-top: 0;
        }
    </style>
</head>
<body style="background:#fff;">

<div id="header" style="background-color: #38c4ff;">
    <h1 class="title">会员中心</h1>
    <a href="api/shangHu/toTransfer.do" class="icon1"><i class="icon-angle-left "></i></a>
</div>
<!--<div class="wy-header header">
    <div class="wy-header-icon-back"><a href="javascript:history.go(-1)"></a><span  class="address"></span></div>
    <div class="wy-header-title">LOGO</div>
    <a href="#" class="saoMa">扫一扫</a>
</div>-->
<!-- 
<div class="wy-header" style="width: 100%;position: fixed;top: 0;left: 0;z-index: 100;">
    <div class="wy-header-icon-back"><i></i><span id="baidu_geo" class="address"></span></div>
    <div class="wy-header-title">LOGO</div>
    <a href="javascript:void(0)" class="saoMa">扫一扫</a>
</div>
 -->
<!--主体-->
<div class="main" style="margin-top: 50px;">
    <div class="ys_info" style="background:#F7F7FA">
        <div class="ys_detail" style="border-bottom: none;">
            <div class="img3">
               <img src="<%=basePath %>${pd.headImg }" alt=""/>
            </div>
            <c:choose>
            	<c:when test="${pd.identity=='1' }">
            		 <ul class="ysy" style="position: relative;font-size: 15px;">
		                <li>
		                    <b style="display:inline-block;float: left;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;max-width: 85px;">${pd.youName }</b> | <span>${pd.position }</span>
		                </li>
		                <li>
		                    <span>${pd.mark }</span>
		                </li>
		                <li>
		                    电话：<span>${pd.linkMethod }</span>
		                </li>
		                <li>
		                    <a href="javascript:void(0)" class="consult" onclick="toPersonCenterJump('1');">
		                        <button class="btn">基本资料</button>
		                    </a>
		                   地址：<span>${pd.address }</span>
		                </li>
		            </ul>
            	</c:when>
            	<c:when test="${pd.identity=='5' || pd.identity=='4' }">
            		 <ul class="ysy" style="position: relative;font-size: 15px;">
		                <li>
		                    <b style="display:inline-block;float: left;text-overflow: ellipsis;white-space: nowrap;overflow: hidden;max-width: 85px;">${pd.youName }</b>  <span></span>
		                </li>
		                <li>
		                    <span></span>
		                </li>
		                <li>
		                    <span></span>
		                </li>
		                <li style="margin-top: 50px;">
		                    <a href="javascript:void(0)" class="consult" onclick="toPersonCenterJump('1');">
		                        <button class="btn">基本资料</button>
		                    </a>
		                   地址：<span>${pd.address }</span>
		                </li>
		            </ul>
            	</c:when>
            	<c:otherwise>
            		<ul class="ysy" style="position: relative;font-size: 15px;">
		                <li style="width: 75%">
		                    <b>${pd.youName }</b> | <span>${pd.mark }</span>
		                </li>
		                <li>
		                    <a href="javascript:void(0)" class="consult" onclick="toPersonCenterJump('1');">
		                        <button class="btn">基本资料</button>
		                    </a>
		                   地址：<span>${pd.address }</span>
		                </li>
		                 <li>
		                    服务项目个数：<span>${list.size() }</span>
		                </li>
		            </ul>
            	</c:otherwise>
            </c:choose>
        </div>
    </div>
    <!--现金金额-->
    <div class="profit">
        <div class="cash">
            <a href="javascript:void(0)" style="display: block;" onclick="toPersonCenterJump('2');">
                <em>${pd.xianjinAmount }</em>
                <p>现金金额</p>
            </a>
        </div>
        <div class="integral">
            <a href="javascript:void(0)" style="display: block;" onclick="toPersonCenterJump('9');">
                <em>${pd.chengjiaoAmount }</em>
                <p>成交金额</p>
            </a>
        </div>
    </div>
    <div style="width:100%;height:10px;background:#F7F7FA;"></div>
    <!--我的订单、我的团队-->
    <div class="weui-flex">
        <div class="weui-flex__item">
            <div class="nav3">
                <ul>
                    <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('4');">
                            <i><img src="static/zhaoyiwang/images/dingdan.png" alt=" 我的订单"></i>
                           	我的订单
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('8');">
                            <i><img src="static/zhaoyiwang/images/fuwu.png" alt="我的服务"></i>
                            <c:if test="${shanghuUser.identity=='1' || shanghuUser.identity=='2' || shanghuUser.identity=='3' }">
                            	我的服务
                            </c:if>
                            <c:if test="${shanghuUser.identity=='4' || shanghuUser.identity=='5'}">
                            	我的产品
                            </c:if>
                            	
                        </a>
                    </li>
                   <!--  <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('5');">
                            <i><img src="static/zhaoyiwang/images/tuandui.png" alt="我的团队"></i>
                            	我的团队
                        </a>
                    </li> -->
                    <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('6');">
                            <i><img src="static/zhaoyiwang/images/shengqing.png" alt="申请开店"></i>
                          	 资质认证材料
                        </a>
                    </li>
                  <!--   <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('7');">
                            <i><img src="static/zhaoyiwang/images/erweima.png" alt="我的二维码"></i>
                          	  我的二维码
                        </a>
                    </li> -->
                   
                   <!--  <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('9');">
                            <i><img src="static/zhaoyiwang/images/shangjia.png" alt="商户余额"></i>
                            	成交金额
                        </a>
                    </li> -->
                    
                <!--     <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('10');">
                            <i><img src="static/zhaoyiwang/images/shangjia.png" alt="商户余额"></i>
                            	我的股权
                        </a>
                    </li> -->
               		<li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('11');">
                            <i><img src="static/zhaoyiwang/images/erweima.png"></i>
                           	存款管理
                        </a>
                    </li>
                    <c:if test="${shanghuUser.identity=='1' || shanghuUser.identity=='2' || shanghuUser.identity=='3' }">
		                 <li>
		                        <a href="javascript:void(0)" onclick="toPersonCenterJump('12');">
		                            <i><img src="static/zhaoyiwang/images/shangjia.png"></i>
		                           	 我的案例
		                        </a>
		                 </li>
	                 </c:if>
	                 <li>
	                      <a href="javascript:void(0)" onclick="toPersonCenterJump('1');">
	                          <i><img src="static/zhaoyiwang/images/shezhi.png" alt="设置"></i>
	                            	设置
	                      </a>
	                  </li>
                </ul>

            </div>
        </div>
    </div>
    <!--底部间隙60px-->
    <div class="weui-flex clearfix">
        <div class="bot60"></div>
    </div>
</div>
<!--底部导航-->
<div class="weui-tabbar wy-foot-menu">
	<!--<c:if test="${shanghuUser.identity=='1' || shanghuUser.identity=='2' || shanghuUser.identity=='3' }">
		<a href="javascript:void(0)" class="weui-tabbar__item" onclick="toThirdModel('1');">
	        <div class="weui-tabbar__icon  foot-menu-member"></div>
	        <p class="weui-tabbar__label">需求大厅</p>
	    </a>
	</c:if>  -->
    <a href="javascript:void(0)" class="weui-tabbar__item" onclick="toThirdModel('1');">
	        <div class="weui-tabbar__icon  foot-menu-member"></div>
	        <p class="weui-tabbar__label">需求大厅</p>
	    </a>
    
    <a href="javascript:void(0)" class="weui-tabbar__item"  onclick="toMsg('${tempPd.user_shanghu_id}','${tempPd.shanghu_name }')">
        <div class="weui-tabbar__icon foot-menu-xiaoxi"></div>
        <p class="weui-tabbar__label">消息中心</p>
    </a>
    <a href="javascript:void(0)" class="weui-tabbar__item"  onclick="toThirdModel('2');">
        <div class="weui-tabbar__icon foot-menu-contact"></div>
        <p class="weui-tabbar__label">联系我们</p>
    </a>
    <a href="javascript:void(0)" class="weui-tabbar__item weui-bar__item--on" onclick="toThirdModel('3');">
        <div class="weui-tabbar__icon foot-menu-user"></div>
        <p class="weui-tabbar__label">个人中心</p>
    </a>
</div>
<script src="static/zhaoyiwang/layer/mobile/layer.js"></script>
<script>
	function toMsg(shanghu_id,shanghu_name){//
		 location.href="<%=basePath%>api/zywkehu/myqq.do?shanghu_userId="+shanghu_id+"&shanghu_name="+shanghu_name;    
	}
	var identity="${shanghuUser.identity}";
	var msgString="";
	
	if(identity=="1"){
		msgString="点击确定成为医生,并完善信息";
	}else if(identity=="2"){
		msgString="点击确定成为机构,并完善信息";
	}else if(identity=="3"){
		msgString="点击确定成为药商,并完善信息";
	}else if(identity=="4"){
		msgString="点击确定成为旅居养老,并完善信息";
	}else{
		msgString="点击确定成为古玩字画苑,并完善信息";
	}
	//进入会员中心就进行验证判断
	$(function(){
		$.post('api/shangHu/isPerfectPersonInformation.do',{},function(date){
			if(date.respCode=="00"){
				/*layer.confirm('您的个人信息还未完善,点击确定去完善信息', {
	                btn: ['确定'],
	                title:'温馨提示',
	                closeBtn: 0
	            	},function () {
	            		window.location.href='api/shangHu/toPersonCenterSetting.do';
	            	}
	        	);*/
	        	layer.open({
	        		content:msgString
	        		,btn:['确定','退出']
	        		,yes:function(index){
	        			window.location.href='api/shangHu/toPersonCenterSetting.do';
	        		}
	        		,no:function(index){
	        			window.location.href='api/shangHu/toTransfer.do';
	        			//layer.close(index);
	        		}
	        	});
			}else{
				$.post('api/shangHu/isStateApplyStore.do',{},function(data){
					if(data.respCode=="00"){
						/*layer.confirm('您的申请已被拒绝,点击确定重新提交认证材料', {
			                btn: ['确定'],
			                title:'温馨提示',
			                closeBtn: 0
			            	},function () {
			            		window.location.href='api/shangHu/toPersonApplyStore.do';
			            	}
			        	);*/
						layer.open({
			        		content:'您的申请已被拒绝,点击确定重新提交认证材料'
			        		,btn:['确定','退出']
			        		,yes:function(index){
			        			window.location.href='api/shangHu/toPersonApplyStore.do';
			        		}
			        		,no:function(index){
			        			window.location.href='api/shangHu/toTransfer.do';
			        		}
			        	});
					}else if(data.respCode=="03"){
						/*layer.confirm('您还未提交资质认证材料,点击确定去提交资质认证材料', {
			                btn: ['确定'],
			                title:'温馨提示',
			                closeBtn: 0
			            	},function () {
			            		window.location.href='api/shangHu/toPersonApplyStore.do';
			            	}
			        	);*/
						layer.open({
			        		content:'您还未提交资质认证材料,点击确定去提交资质认证材料'
			        		,btn:['确定','退出']
			        		,yes:function(index){
			        			window.location.href='api/shangHu/toPersonApplyStore.do';
			        		}
			        		,no:function(index){
			        			window.location.href='api/shangHu/toTransfer.do';
			        		}
			        	});
					}
				});
			}
		});
	});
	//三大模块之间的跳转
	function toThirdModel(mark){
		if(mark=='1'){//进入需求大厅
			isStateApplyStore('api/shangHu/toRelease.do');
		}else if(mark=='2'){//联系我们
			window.location.href='api/shangHu/toContact.do';
		}else{//会员中心
			window.location.href='api/shangHu/toPersonCenter.do';
		}
	}
	//H5页面制作者留下
	$(function () {
        FastClick.attach(document.body);
    });
    //会员中心页面跳转
    function toPersonCenterJump(mark){
    	if(mark=="1"){
    		isStateApplyStore('api/shangHu/toPersonCenterSetting.do');
    	}else if(mark=="2"){
    		isStateApplyStore('api/shangHu/toPersonXianJinAmount.do');
    	}else if(mark=="3"){
    		isStateApplyStore('api/shangHu/toPersonMyJiFen.do');
    	}else if(mark=="4"){
    		isStateApplyStore('api/shangHu/toPersonMyOrder.do');
    	}else if(mark=="5"){
    		 /*layer.alert("该功能还未开放,更多精彩内容，敬请期待!",{
    	            title:"温馨提示"//提示标题，默认为：信息
    	            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
    	            ,anim: 0 //动画类型0-6，默认为：0
    	            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
    	            ,btn: ['好的'] //按钮
    	            ,icon: 6    // icon
    	      });*/
    		isStateApplyStore('api/shangHu/myTeam.do');
    	}else if(mark=="6"){
    		$.post('api/shangHu/isPerfectPersonInformation.do',{},function(date){
    			if(date.respCode=="00"){
    				/*layer.confirm('您的个人信息还未完善,点击确定去完善信息', {
    	                btn: ['确定'],
    	                title:'温馨提示',
    	                closeBtn: 0
    	            	},function () {
    	            		window.location.href='api/shangHu/toPersonCenterSetting.do';
    	            	}
    	        	);*/
    				layer.open({
		        		content:msgString
		        		,btn:['确定','退出']
		        		,yes:function(index){
		        			window.location.href='api/shangHu/toPersonCenterSetting.do';
		        		}
		        		,no:function(index){
		        			window.location.href='api/shangHu/toTransfer.do';
		        		}
		        	});
    			}else{
    				$.post('api/shangHu/isStateApplyStore.do',{},function(data){
    	    			if(data.respCode=="01"){
    	    				/*layer.alert("您已认证通过,无需重新申请!",{
    	        	            title:"温馨提示"//提示标题，默认为：信息
    	        	            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
    	        	            ,anim: 0 //动画类型0-6，默认为：0
    	        	            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
    	        	            ,btn: ['好的'] //按钮
    	        	            ,icon: 6    // icon
    	        	        });*/
    	    				layer.open({
    			        		content:'您已认证通过,无需重新申请!'
    			        		,skin:'msg'
    			        		,time:2
    			        	});
    	    			}else if(data.respCode=="02"){
    	    				/*layer.alert("您的申请已提交,等待后台人员的审核,如有不便,敬请谅解!",{
    	        	            title:"温馨提示"//提示标题，默认为：信息
    	        	            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
    	        	            ,anim: 0 //动画类型0-6，默认为：0
    	        	            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
    	        	            ,btn: ['好的'] //按钮
    	        	            ,icon: 6    // icon
    	        	        });*/
    	    				layer.open({
    			        		content:'您的申请已提交,请耐心等待平台审核!'
    			        		,skin:'msg'
    			        		,time:2
    			        	});
    	    			}else if(data.respCode=="00"){
    	    				/*layer.confirm('您的申请已被拒绝,点击确定重新提交认证材料', {
    	    	                btn: ['确定'],
    	    	                title:'温馨提示',
    	    	                closeBtn: 0
    	    	            	},function () {
    	    	            		window.location.href='api/shangHu/toPersonApplyStore.do';
    	    	            	}
    	    	        	);*/
    	    				layer.open({
    			        		content:'您的申请已被拒绝,点击确定重新提交认证材料'
    			        		,btn:['确定','退出']
    			        		,yes:function(index){
    			        			window.location.href='api/shangHu/toPersonApplyStore.do';
    			        		}
    			        		,no:function(index){
    			        			window.location.href='api/shangHu/toTransfer.do';
    			        		}
    			        	});
    	    			}else{
    	    				/*layer.confirm('您还未提交资质认证材料,点击确定去提交认证材料', {
    	    	                btn: ['确定'],
    	    	                title:'温馨提示',
    	    	                closeBtn: 0
    	    	            	},function () {
    	    	            		window.location.href='api/shangHu/toPersonApplyStore.do';
    	    	            	}
    	    	        	);*/
    	    				layer.open({
    			        		content:'您还未提交资质认证材料,点击确定去提交认证材料'
    			        		,btn:['确定','退出']
    			        		,yes:function(index){
    			        			window.location.href='api/shangHu/toPersonApplyStore.do';
    			        		}
    			        		,no:function(index){
    			        			window.location.href='api/shangHu/toTransfer.do';
    			        		}
    			        	});
    	    			}
    	    		});
    			}
    		});
    	}else if(mark=="7"){
    		isStateApplyStore('api/shangHu/toPersonMy2WeiMa.do');
    	}else if(mark=="8"){
    		isStateApplyStore('api/shangHu/toPersonMyService.do');
    	}else if(mark=="9"){
    		isStateApplyStore('api/shangHu/toPersonShangHuMoney.do');
    	}else if(mark=="10"){
    		isStateApplyStore('api/shangHu/toPersonMyGuQuan.do');
    	}else if(mark=="11"){
    		isStateApplyStore('api/shangHu/getCunKuanList.do');
    	}
    	else if(mark=="12"){
    		isStateApplyStore('api/shangHu/toSettingExample.do');
    	}
    	else{
    		isStateApplyStore('api/shangHu/toPersonMyXuNiBi.do');
    	}
    }
    //根据认证状态，进行提示
    function isStateApplyStore(url){
    	$.post('api/shangHu/isPerfectPersonInformation.do',{},function(date){
			if(date.respCode=="00"){
				/*layer.confirm('您的个人信息还未完善,点击确定去完善信息', {
	                btn: ['确定'],
	                title:'温馨提示',
	                closeBtn: 0
	            	},function () {
	            		window.location.href='api/shangHu/toPersonCenterSetting.do';
	            	}
	        	);*/
				layer.open({
	        		content:msgString
	        		,btn:['确定','退出']
	        		,yes:function(index){
	        			window.location.href='api/shangHu/toPersonCenterSetting.do';
	        		}
	        		,no:function(index){
	        			window.location.href='api/shangHu/toTransfer.do';
	        		}
	        	});
			}else{
				$.post('api/shangHu/isStateApplyStore.do',{},function(data){
					if(data.respCode=="01"){
						window.location.href=url;
					}else if(data.respCode=="02"){
						/*layer.alert("您的申请已提交,等待后台人员的审核,如有不便,敬请谅解!",{
		    	            title:"温馨提示"//提示标题，默认为：信息
		    	            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
		    	            ,anim: 0 //动画类型0-6，默认为：0
		    	            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
		    	            ,btn: ['好的'] //按钮
		    	            ,icon: 6    // icon
		    	        });*/
						layer.open({
			        		content:'您的申请已提交,请耐心等待平台审核!'
			        		,skin:'msg'
			        		,time:2
			        	});
					}else if(data.respCode=="00"){
						/*layer.confirm('您的申请已被拒绝,点击确定重新提交认证材料', {
			                btn: ['确定'],
			                title:'温馨提示',
			                closeBtn: 0
			            	},function () {
			            		window.location.href='api/shangHu/toPersonApplyStore.do';
			            	}
			        	);*/
						layer.open({
			        		content:'您的申请已被拒绝,点击确定重新提交认证材料'
			        		,btn:['确定','退出']
			        		,yes:function(index){
			        			window.location.href='api/shangHu/toPersonApplyStore.do';
			        		}
			        		,no:function(index){
			        			window.location.href='api/shangHu/toTransfer.do';
			        		}
			        	});
					}else{
						/*layer.confirm('您还未提交资质认证材料,点击确定去提交认证材料', {
			                btn: ['确定'],
			                title:'温馨提示',
			                closeBtn: 0
			            	},function () {
			            		window.location.href='api/shangHu/toPersonApplyStore.do';
			            	}
			        	);*/
						layer.open({
			        		content:'您还未提交资质认证材料,点击确定去提交认证材料'
			        		,btn:['确定','退出']
			        		,yes:function(index){
			        			window.location.href='api/shangHu/toPersonApplyStore.do';
			        		}
			        		,no:function(index){
			        			window.location.href='api/shangHu/toTransfer.do';
			        		}
			        	});
					}
				});
			}
    	});
    }
</script>
</body>
</html>