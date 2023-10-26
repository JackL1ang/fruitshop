<%--
  Created by IntelliJ IDEA.
  User: Lemon
  Date: 2023/5/27
  Time: 20:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

    <link href="css/main.css" rel="stylesheet">
    <link href="css/slick.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/login-css.css">
    <link href="css/carousel.css" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icofont/icofont.min.css">
    <link rel="stylesheet" href="css/login-css.css">
    <link href="css/register.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <title>用户注册</title>
</head>
<body>

    <c:if test="${!empty user}">
        <% String rq = request.getContextPath();
            response.sendRedirect(rq+"/index.jsp");
        %>
    </c:if>
    <jsp:include page="header.jsp"/>
    <div class="signup box">


        <div class="text">
            注 册 新 用 户
        </div>

        <div id="error_register" class="error_msg msg_color">

        </div>
        <form action="#">
            <div class="Account-Information">
                <span>用户名 <label style="color: red">*</label></span>
                <input id="username-register" type="text" />
            </div>
            <div class="Account-Information">
                <span>邮箱 <label style="color: red">*</label></span>
                <input id="Email-register" type="text" />
            </div>

            <div class="Account-Information">
                <span>密码 <label style="color: red">*</label></span>
                <input id="password-register" name="password" type="password" />
            </div>

            <div class="Account-Information">
                <span>收货人 </span>
                <input id="name-register" type="text" />
            </div>

            <div class="Account-Information">
                <span>收货电话 </span>
                <input id="phone-register" type="text" />
            </div>

            <div class="Account-Information">
                <span>收货地址 </span>
                <input id="address-register" type="text" />
            </div>

            <div class="btn-submit">
                <div class="inner"></div>
                <button class="register_btn" type="button">提交</button>
            </div>
            <div class="signup-link">已有账号?
                <a href="#" class="login-in">去登录</a>
            </div>

        </form>
    </div>
</body>

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/register.js"></script>
<script src="js/index.js"></script>
</html>
