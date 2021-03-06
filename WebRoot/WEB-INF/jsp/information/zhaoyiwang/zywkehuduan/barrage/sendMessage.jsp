<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
    <head>
    	<base href="<%=basePath%>">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>BarrageClient</title>
        <link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
    </head>

    <body>

        <div class="container" style="padding-top:20px;">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">Barrage</h3>
                </div>
                <div class="panel-body" id="content"></div>
            </div>
            <hr/>
            <input type="text" class="form-control" placeholder="msg" aria-describedby="sizing-addon1" id="msg">
            <hr/>

            <hr/>
            <button type="button" class="btn btn-lg btn-success btn-block" onclick="emit()">Emit</button>
        </div>

        <script type="text/javascript" src="http://apps.bdimg.com/libs/jquery/2.1.4/jquery.min.js"></script>
        <script type="text/javascript" src="http://cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%=basePath%>static/js//barrage/core.js"></script>
        <script type="text/javascript" src="<%=basePath%>static/js//barrage/index.js"></script>
    </body>
</html>



