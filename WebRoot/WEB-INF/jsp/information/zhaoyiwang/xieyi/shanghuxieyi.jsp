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
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/style.css">
    <link rel="stylesheet" href="static/zhaoyiwang/zywkehuduan/css/login.css">
    <link href="static/zhaoyiwang/zywkehuduan/css/index1.css" type="text/css" rel="stylesheet"/>
    <link href="static/zhaoyiwang/zywkehuduan/css/common1.css" type="text/css" rel="stylesheet"/>
    <style type="text/css">
    .layui-layer-lan .layui-layer-btn a {
    background: #4898d5;
    border: none;
}
    </style>
</head>
<body style="background-color: #fff;">
<!--头部结束-->
<!--主体开始-->
<div class="artBox01" style="margin-top: auto;">
    <p style="color: #333;font-size: 15px;">尊敬的用户您好，感谢您访问“华夏郎中行”医疗平台。在注册商户前，敬请您阅读以下内容，在进行注册程序过程中点击“同意”按钮即表示用户完全接受本协议项下的全部条款。
本《商户协议与免责条款》是您（下称"商户"）与“华夏郎中行”医疗平台之间，使用服务时签署的协议。此商户协议与免责条款由“华夏郎中行医疗平台”提供。您若注册并使用了本公司的服务，即表示您认同并接受了此协议。请注意，您的使用受制于该条款、服务、要求。请您在使用网站前仔细阅读此条款！ 

除非您接受本协议，否则用户无权也无必要继续接受“华夏郎中行”医疗平台商户的服务，可以退出本次注册。用户点击接受并继续使用“华夏郎中行”医疗平台的服务，视为用户已完全的接受本协议。<br> 
 
一、注册商户重要须知<br> 
1.1 医生需出示，本人身份证、最近免冠照片、行医资格证、治疗患者成功案例五件以上、有五年以上行医经验、电话、微博、微信、QQ等通讯号。<br> 
 
 
1.2 医院需出示：法人身份证、营业执照等有效证件、电话、微博、微信、QQ等通讯号。<br> 
 
 
1.3 药厂需出示：法人身份证、药品生产许可证等有效证件、电话、微博、微信、QQ等通讯号。<br> 
 
 
1.4 药房、药商需出示：法人身份证、药品经营许可证等有效证件、电话、微博、微信、QQ等通讯号。<br> 
 
 
1.5 中医理疗、养生会馆等医疗机构需出示：法人身份证、营业执照等有效证件、电话、微博、微信、QQ等通讯号。<br> 
 
 
1.6 线下弟子(代理商）需出示：本人身份证、最近免冠照片、无劣迹证明等有效证件、电话、微博、微信、QQ等通讯号。<br> 
 
1.7 注册商户承诺保证提供资料真实合法有效，否则产生的一切后果注册商户自己承担<br> 
 
 
1.8  其余须知详见合伙人注册协议<br> 
 
 
 
二、商户需知（详见合伙人注册协议与免责声明）<br> 
1.1 成为商户须遵守平台规则<br> 
 
1.2 必须保证上传资料真实合法<br> 
 
1.3 必须保证用药真实合法性（对人体无害）<br> 
 
1.4 商户与客户任意交易造成任何后果，如病情加重、中毒、死亡等严重后果均与平台无关。
 <br> 
1.5 严禁私自与用户用任何方法交易<br> 
 
1.6 平台收取每笔交易额的20％用于维护费、开发费。<br> 
 
1.7 由代理商（统称弟子）带来的客户，商户需留给线下弟子每笔交易额20％的利润用于弟子线下活动费用。<br> 
 
1.8 对存在问题的商户，一经查出核实，立即对该商户账号进行封停处理。永远列入平台黑名单内，永不允许注册，并保留移送司法机关的权利。<br> 
 
1.9 如消费者不会使用或没有微信支付、支付宝支付等软件，为保证交易安全商家须同意让快递代收产品费并转交给平台，平台得到交易费后在转账给商家。<br> 
三、平台责任<br> 
1.1  平台对商户资料进行登记审核<br> 
 
1.2  平台有权对违规商户进行处罚<br> 
 
1.3  平台抽取商户每笔交易20％作为维护费、开发费。平台每笔收取运营费的千分之一用于贫困山区与贫困家庭进行扶老、助残、救孤、济困等福利事业项目的发展<br> 
 
1.4  平台抽取弟子每笔交易20％作为维护费、开发费。平台每笔收取运营费的千分之一用于贫困山区与贫困家庭进行扶老、助残、救孤、济困等福利事业项目的发展<br> 
 
1.5  平台有权利和义务对不熟悉“华夏郎中行”医疗平台的商户进行远程指导、电话指导等。<br> </p>
</div>
<!--主体结束-->
<script src="static/zhaoyiwang/zywkehuduan/js/jquery-2.1.4.js"></script>
<script type="text/javascript">

</script>
</body>
</html>