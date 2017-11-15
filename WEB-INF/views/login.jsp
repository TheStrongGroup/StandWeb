<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<html lang="en" class="no-js">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    <title>能耗管理服务平台</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0,user-scalable=no" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <meta name="MobileOptimized" content="320">
    <!-- <meta content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0;" name="viewport" /> -->
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css"
          rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/uniform/css/uniform.default.css"
          rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css"
          href="assets/plugins/select2/select2_metro.css"/>
    <link href="assets/css/style-metronic.css" rel="stylesheet"
          type="text/css"/>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style-responsive.css" rel="stylesheet"
          type="text/css"/>
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/themes/default.css" rel="stylesheet"
          type="text/css" id="style_color"/>
    <link href="assets/css/pages/login-soft.css" rel="stylesheet"
          type="text/css"/>
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
    <link href="app/css/main.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" href="app/img/logo.ico"/>

</head>
<body>
<div class="login-main">
    <h1><img src="app/img/logo1.png"/>Stand能耗系统</h1>
    <div class="login-tab form-group">
        <div class="login-right">
            <h4>系统登陆</h4>
            <form class="login-form" action="rest/user/login" method="post">
                <label>用户名：</label><input type="text" name="customerName" id="customerName" placeholder="请输入用户名"
                                          size="25" value="java1234"/>
                <label>密&nbsp;&nbsp;&nbsp;码：</label><input type="password" name="customerPwd1" placeholder="请输入密码"
                                                           id="customerPwd1" size="25" value="123456"/>
                <label>验证码：</label><input type="text" name="checkCode" placeholder="请输入验证码"
                                          id="checkCode" size="15" value="" style="width: 50%;"/>
                <img id="img" src="<%=basePath%>rest/user/createCode" onclick="refresh()"
                     style="width: 30%;height:100%;">

                <input name="customerPwd" id="password" size="25" value="" class="form-control placeholder-no-fix"
                       type="customerPwd"
                       autocomplete="off" placeholder="密码"
                       style="display: none;"/>
                <input type="submit" id="loginBut" value="登 录" class="pass-botton"/>
                <p style="color: #ff2628;">${error}</p>
            </form>
        </div>
    </div>
    <div class="login-foot">
        <p>版权所有 @斯同瑞电气有限公司 沪ICP00000</p>
    </div>
</div>


<script src="assets/plugins/respond.min.js"></script>
<script src="assets/plugins/excanvas.min.js"></script>
<script src="assets/plugins/jquery-1.10.2.min.js"
        type="text/javascript"></script>
<script src="assets/plugins/jquery-migrate-1.2.1.min.js"
        type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js"
        type="text/javascript"></script>
<script
        src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js"
        type="text/javascript"></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js"
        type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js"
        type="text/javascript"></script>
<script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js"
        type="text/javascript"></script>
<script
        src="assets/plugins/jquery-validation/dist/jquery.validate.min.js"
        type="text/javascript"></script>
<script src="assets/plugins/backstretch/jquery.backstretch.min.js"
        type="text/javascript"></script>
<script type="text/javascript"
        src="assets/plugins/select2/select2.min.js"></script>
<script src="assets/scripts/app.js" type="text/javascript"></script>
<script src="assets/scripts/login-soft.js" type="text/javascript"></script>

<script src="app/lib/security/sha256.js" type="text/javascript"></script>
<script>
    $(document).ready(function () {
        $("#loginBut").bind("click", function () {
            App.init();
            Login.init();
        });
    })
    function refresh() {
        var url = "/rest/user/createCode?number=" + Math.random();//这里没有随机参数的话就只进两次后台就再也不进了，这个现在还不太明白为什么
        $("#img").attr("src", url);
    }
</script>
</body>
</html>