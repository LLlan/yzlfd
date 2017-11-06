<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="weui-tabbar wy-foot-menu">
    <a href="<%=basePath%>api/zywkehu/index1.do" id="sy" onclick="abc(this)" class="weui-tabbar__item">
        <div class="weui-tabbar__icon foot-menu-home"></div>
        <p class="weui-tabbar__label">首页</p>
    </a>
    <a href="<%=basePath%>api/zywkehu/index.do" id="cjjb" onclick="abc(this)" class="weui-tabbar__item weui-bar__item--on" >
        <div class="weui-tabbar__icon foot-menu-hxlz"></div>
        <p class="weui-tabbar__label">华夏郎中</p>
    </a><%--
    <a href="<%=basePath%>api/zywkehu/changjianjibing.do" id="cjjb" onclick="abc(this)" class="weui-tabbar__item">
        <div class="weui-tabbar__icon foot-menu-cart"></div>
        <p class="weui-tabbar__label">常见疾病</p>
    </a>
    --%><a href="<%=basePath%>api/zywkehu/fabuxuqiuList.do" id="fbxq" onclick="abc(this)" class="weui-tabbar__item">
        <div class="weui-tabbar__icon  foot-menu-member"></div>
        <p class="weui-tabbar__label">发布需求</p>
    </a>
    <a href="<%=basePath%>api/zywkehu/connectUs.do" id="lxwm" onclick="abc(this)" class="weui-tabbar__item">
        <div class="weui-tabbar__icon foot-menu-contact"></div>
        <p class="weui-tabbar__label">联系我们</p>
    </a>
    <a href="<%=basePath%>api/zywkehu/huiyuanzhongxin.do" id="hyzx"  onclick="abc(this)" class="weui-tabbar__item">
        <div class="weui-tabbar__icon foot-menu-user"></div>
        <p class="weui-tabbar__label">个人中心</p>
    </a>
</div>
