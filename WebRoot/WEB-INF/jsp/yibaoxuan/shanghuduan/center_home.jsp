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
    <link rel="stylesheet" href="static/yibaoxuan/css/yahu.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/css/jquery-weui.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/css/weui.css"/>
    <link rel="stylesheet" href="static/yibaoxuan/css/font-awesome.css">
    <link rel="stylesheet" href="static/yibaoxuan/css/index.css"/>
    <script src="static/yibaoxuan/js/jquery-2.1.4.js"></script>
    <script src="static/yibaoxuan/js/fastclick.js"></script>
    <script src="static/yibaoxuan/js/jquery-weui.js"></script>
    <title>会员中心</title>
    <style>
        .wy-header-icon-back{
            width:120px;
        }
        .wy-header-icon-back>a{
            background: url(static/yibaoxuan/images/dingwei01.png) no-repeat;background-size: 20px;;
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
<!--主体-->
<div class="main" style="margin-top: 50px;">
    <div class="ys_info" style="background:#F7F7FA">
        <div class="ys_detail" style="border-bottom: none;">
            <div class="img3">
               <img src="<%=basePath %>${pd.headImg }" alt=""/>
            </div>
            <c:choose>
            	<c:when test="${pd.identity=='5' }">
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
		                        <button class="btn">个人资料</button>
		                    </a>
		                   地址：<span>${pd.address }</span>
		                </li>
		            </ul>
            	</c:when>
            	<c:otherwise>
            		<ul class="ysy" style="position: relative;font-size: 15px;">
		                <li style="width: 75%">
		                    <b>${pd.youName }</b> | <span>${pd.city }</span>
		                </li>
		                <li>
		                    <a href="javascript:void(0)" class="consult" onclick="toPersonCenterJump('1');">
		                        <button class="btn">个人资料</button>
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
                            <i><img src="static/yibaoxuan/images/dingdan.png" alt=" 我的订单"></i>
                           	我的订单
                        </a>
                    </li>
                     <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('8');">
                            <i><img src="static/yibaoxuan/images/fuwu.png" alt="我的产品"></i>
                            	我的产品
                        </a>
                    </li>
                   <!--  <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('5');">
                            <i><img src="static/yibaoxuan/images/tuandui.png" alt="我的团队"></i>
                            	我的团队
                        </a>
                    </li> -->
                    <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('6');">
                            <i><img src="static/yibaoxuan/images/shengqing.png" alt="申请开店"></i>
                          	 资质认证材料
                        </a>
                    </li>
                  <!--   <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('7');">
                            <i><img src="static/yibaoxuan/images/erweima.png" alt="我的二维码"></i>
                          	  我的二维码
                        </a>
                    </li> -->
                   
                   <!--  <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('9');">
                            <i><img src="static/yibaoxuan/images/shangjia.png" alt="商户余额"></i>
                            	成交金额
                        </a>
                    </li> -->
                    
                <!--     <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('10');">
                            <i><img src="static/yibaoxuan/images/shangjia.png" alt="商户余额"></i>
                            	我的股权
                        </a>
                    </li> -->
               		<li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('11');">
                            <i><img src="static/yibaoxuan/images/erweima.png"></i>
                           	存款管理
                        </a>
                    </li>
                <!-- <li>
                        <a href="api/ybxshangHu/toSettingExample.do">
                            <i><img src="static/yibaoxuan/images/shangjia.png"></i>
                           	 我的案例
                        </a>
                    </li>-->
                   <li>
                        <a href="javascript:void(0)" onclick="toPersonCenterJump('1');">
                            <i><img src="static/yibaoxuan/images/shezhi.png" alt="设置"></i>
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
        <p class="weui-tabbar__label">会员中心</p>
    </a>
</div>
<script src="static/yibaoxuan/layer/mobile/layer.js"></script>
<script>
	function toMsg(shanghu_id,shanghu_name){//
		 location.href="<%=basePath%>api/ybxkehu/myqq.do?shanghu_userId="+shanghu_id+"&shanghu_name="+shanghu_name;    
	}


	//进入会员中心就进行验证判断
	$(function(){
		$.post('api/ybxshangHu/isPerfectPersonInformation.do',{},function(date){
			if(date.respCode=="00"){
				/*layer.confirm('您的个人信息还未完善,点击确定去完善信息', {
	                btn: ['确定'],
	                title:'温馨提示',
	                closeBtn: 0
	            	},function () {
	            		window.location.href='api/ybxshangHu/toPersonCenterSetting.do';
	            	}
	        	);*/
				layer.open({
	        		content:'您的个人信息还未完善,点击确定去完善信息'
	        		,btn:['确定','退出']
	        		,yes:function(index){
	        			window.location.href='api/ybxshangHu/toPersonCenterSetting.do';
	        		}
	        		,no:function(index){
	        			layer.close(index);
	        		}
	        	});
			}else{
				$.post('api/ybxshangHu/isStateApplyStore.do',{},function(data){
					if(data.respCode=="00"){
						/*layer.confirm('您的申请已被拒绝,点击确定重新提交认证材料', {
			                btn: ['确定'],
			                title:'温馨提示',
			                closeBtn: 0
			            	},function () {
			            		window.location.href='api/ybxshangHu/toPersonApplyStore.do';
			            	}
			        	);*/
			        	layer.open({
			        		content:'您的申请已被拒绝,点击确定重新提交认证材料'
			        		,btn:['确定','退出']
			        		,yes:function(index){
			        			window.location.href='api/ybxshangHu/toPersonApplyStore.do';
			        		}
			        		,no:function(index){
			        			layer.close(index);
			        		}
			        	});
					}else if(data.respCode=="03"){
						/*layer.confirm('您还未提交资质认证材料,点击确定去提交资质认证材料', {
			                btn: ['确定'],
			                title:'温馨提示',
			                closeBtn: 0
			            	},function () {
			            		window.location.href='api/ybxshangHu/toPersonApplyStore.do';
			            	}
			        	);*/
			        	layer.open({
			        		content:'您还未提交资质认证材料,点击确定去提交资质认证材料'
			        		,btn:['确定','退出']
			        		,yes:function(index){
			        			window.location.href='api/ybxshangHu/toPersonApplyStore.do';
			        		}
			        		,no:function(index){
			        			layer.close(index);
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
			isStateApplyStore('api/ybxshangHu/toRelease.do');
		}else if(mark=='2'){//联系我们
			window.location.href='api/ybxshangHu/toContact.do';
		}else{//会员中心
			window.location.href='api/ybxshangHu/toPersonCenter.do';
		}
	}
	//H5页面制作者留下
	$(function () {
        FastClick.attach(document.body);
    });
    //会员中心页面跳转
    function toPersonCenterJump(mark){
    	if(mark=="1"){
    		isStateApplyStore('api/ybxshangHu/toPersonCenterSetting.do');
    	}else if(mark=="2"){
    		isStateApplyStore('api/ybxshangHu/toPersonXianJinAmount.do');
    	}else if(mark=="3"){
    		isStateApplyStore('api/ybxshangHu/toPersonMyJiFen.do');
    	}else if(mark=="4"){
    		isStateApplyStore('api/ybxshangHu/toPersonMyOrder.do');
    	}else if(mark=="5"){
    		 /*layer.alert("该功能还未开放,更多精彩内容，敬请期待!",{
    	            title:"温馨提示"//提示标题，默认为：信息
    	            ,skin: 'layui-layer-molv'//默认为：无色，layui-layer-molv：墨绿，layui-layer-lan：深蓝
    	            ,anim: 0 //动画类型0-6，默认为：0
    	            ,closeBtn: 1//是否显示关闭按钮，0-不显示，1-显示，默认为1
    	            ,btn: ['好的'] //按钮
    	            ,icon: 6    // icon
    	      });*/
    		isStateApplyStore('api/ybxshangHu/myTeam.do');
    	}else if(mark=="6"){
    		$.post('api/ybxshangHu/isPerfectPersonInformation.do',{},function(date){
    			if(date.respCode=="00"){
    				/*layer.confirm('您的个人信息还未完善,点击确定去完善信息', {
    	                btn: ['确定'],
    	                title:'温馨提示',
    	                closeBtn: 0
    	            	},function () {
    	            		window.location.href='api/ybxshangHu/toPersonCenterSetting.do';
    	            	}
    	        	);*/
    				layer.open({
    	        		content:'您的个人信息还未完善,点击确定去完善信息'
    	        		,btn:['确定','退出']
    	        		,yes:function(index){
    	        			window.location.href='api/ybxshangHu/toPersonCenterSetting.do';
    	        		}
    	        		,no:function(index){
    	        			layer.close(index);
    	        		}
    	        	});
    			}else{
    				$.post('api/ybxshangHu/isStateApplyStore.do',{},function(data){
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
    			        		,time:1.5
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
    			        		,time:1.5
    			        	});
    	    			}else if(data.respCode=="00"){
    	    				/*layer.confirm('您的申请已被拒绝,点击确定重新提交认证材料', {
    	    	                btn: ['确定'],
    	    	                title:'温馨提示',
    	    	                closeBtn: 0
    	    	            	},function () {
    	    	            		window.location.href='api/ybxshangHu/toPersonApplyStore.do';
    	    	            	}
    	    	        	);*/
    	    	        	layer.open({
    			        		content:'您的申请已被拒绝,点击确定重新提交认证材料'
    			        		,btn:['确定','退出']
    			        		,yes:function(index){
    			        			window.location.href='api/ybxshangHu/toPersonApplyStore.do';
    			        		}
    			        		,no:function(index){
    			        			layer.close(index);
    			        		}
    			        	});
    	    			}else{
    	    				/*layer.confirm('您还未提交资质认证材料,点击确定去提交认证材料', {
    	    	                btn: ['确定'],
    	    	                title:'温馨提示',
    	    	                closeBtn: 0
    	    	            	},function () {
    	    	            		window.location.href='api/ybxshangHu/toPersonApplyStore.do';
    	    	            	}
    	    	        	);*/
    	    				layer.open({
    			        		content:'您还未提交资质认证材料,点击确定去提交认证材料'
    			        		,btn:['确定','退出']
    			        		,yes:function(index){
    			        			window.location.href='api/ybxshangHu/toPersonApplyStore.do';
    			        		}
    			        		,no:function(index){
    			        			layer.close(index);
    			        		}
    			        	});
    	    			}
    	    		});
    			}
    		});
    	}else if(mark=="7"){
    		isStateApplyStore('api/ybxshangHu/toPersonMy2WeiMa.do');
    	}else if(mark=="8"){
    		isStateApplyStore('api/ybxshangHu/toPersonMyService.do');
    	}else if(mark=="9"){
    		isStateApplyStore('api/ybxshangHu/toPersonShangHuMoney.do');
    	}else if(mark=="10"){
    		isStateApplyStore('api/ybxshangHu/toPersonMyGuQuan.do');
    	}else if(mark=="11"){
    		isStateApplyStore('api/shangHu/getCunKuanList.do');
    	}else{
    		isStateApplyStore('api/ybxshangHu/toPersonMyXuNiBi.do');
    	}
    }
    //根据认证状态，进行提示
    function isStateApplyStore(url){
    	$.post('api/ybxshangHu/isPerfectPersonInformation.do',{},function(date){
			if(date.respCode=="00"){
				/*layer.confirm('您的个人信息还未完善,点击确定去完善信息', {
	                btn: ['确定'],
	                title:'温馨提示',
	                closeBtn: 0
	            	},function () {
	            		window.location.href='api/ybxshangHu/toPersonCenterSetting.do';
	            	}
	        	);*/
				layer.open({
	        		content:'您的个人信息还未完善,点击确定去完善信息'
	        		,btn:['确定','退出']
	        		,yes:function(index){
	        			window.location.href='api/ybxshangHu/toPersonCenterSetting.do';
	        		}
	        		,no:function(index){
	        			layer.close(index);
	        		}
	        	});
			}else{
				$.post('api/ybxshangHu/isStateApplyStore.do',{},function(data){
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
			        		,time:1.5
			        	});
					}else if(data.respCode=="00"){
						/*layer.confirm('您的申请已被拒绝,点击确定重新提交认证材料', {
			                btn: ['确定'],
			                title:'温馨提示',
			                closeBtn: 0
			            	},function () {
			            		window.location.href='api/ybxshangHu/toPersonApplyStore.do';
			            	}
			        	);*/
						layer.open({
			        		content:'您的申请已被拒绝,点击确定重新提交认证材料'
			        		,btn:['确定','退出']
			        		,yes:function(index){
			        			window.location.href='api/ybxshangHu/toPersonApplyStore.do';
			        		}
			        		,no:function(index){
			        			layer.close(index);
			        		}
			        	});
					}else{
						/*layer.confirm('您还未提交资质认证材料,点击确定去提交认证材料', {
			                btn: ['确定'],
			                title:'温馨提示',
			                closeBtn: 0
			            	},function () {
			            		window.location.href='api/ybxshangHu/toPersonApplyStore.do';
			            	}
			        	);*/
						layer.open({
			        		content:'您还未提交资质认证材料,点击确定去提交认证材料'
			        		,btn:['确定','退出']
			        		,yes:function(index){
			        			window.location.href='api/ybxshangHu/toPersonApplyStore.do';
			        		}
			        		,no:function(index){
			        			layer.close(index);
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