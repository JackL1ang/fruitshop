<%--
  Created by IntelliJ IDEA.
  User: Lemon
  Date: 2023/5/26
  Time: 15:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <link href="css/main.css" rel="stylesheet">
    <link href="css/register.css" rel="stylesheet">
    <link href="css/sidebars.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="css/UserCenter.css" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icofont/icofont.min.css">
    <title>用户中心</title>
</head>
<body>

 <%--    判断是否获取用户信息 --%>
    <c:if test="${empty user}">
        <% String rq = request.getContextPath();
          response.sendRedirect(rq+"/index.jsp");
        %>
    </c:if>
    <div class="window">
        <div class="header">
            <jsp:include page="userHeader.jsp"></jsp:include>
        <div class="main">
            <div class="aside">
                <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px;">

                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/UserCenter.jsp" id="userInfo" class="nav-link active" aria-current="page">
                                <svg class="bi pe-none me-2" width="16" height="20"><use xlink:href="#home"></use></svg>
                                用 户 信 息
                            </a>
                        </li>
                        <li>
                            <a href="#" id="modify-password" class="nav-link text-white">
                                <svg class="bi pe-none me-2" width="16" height="20"><use xlink:href="#speedometer2"></use></svg>
                                修 改 密 码
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/userSearchOrderServlet" id="orderInfo" class="nav-link text-white">
                                <svg class="bi pe-none me-2" width="16" height="20"><use xlink:href="#table"></use></svg>
                                订 单 信 息
                            </a>
                        </li>

                    </ul>
                    <hr>
                    <div class="dropdown">
                        <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
                            <img src="picture/favicon.png" alt="" width="32" height="32" class="rounded-circle me-2">
                            <strong>${user.username}</strong>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/userLoginOut">注销</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="content-box">



                <div class="content">
                    <div class="signup box">


                        <div class="text">
                            个 人 信 息
                        </div>

                        <div id="error_register" class="error_msg msg_color">

                        </div>
                        <form action="#">
                            <div class="Account-Information">
                                <span>收货人 </span>
                                <input id="name-register" type="text" value="${user.name}"/>
                            </div>

                            <div class="Account-Information">
                                <span>收货电话 </span>
                                <input id="phone-register" type="text" value="${user.phone}"/>
                            </div>

                            <div class="Account-Information">
                                <span>收货地址 </span>
                                <input id="address-register" type="text" value="${user.address}" />
                            </div>

                            <div class="btn-submit">
                                <div class="inner"></div>
                                <button class="userCenter_btn" type="button">提交</button>
                            </div>

                        </form>
                    </div>

                </div>

            </div>
        </div>
    </div>
    <div class="footer">
       <jsp:include page="footer.jsp"></jsp:include>

    </div>

</body>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/index.js"></script>
<script src="js/register.js"></script>
<script src="js/usercenter.js"></script>

</html>
