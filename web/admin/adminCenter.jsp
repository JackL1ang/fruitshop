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

    <link href="css/register.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="css/main.css" rel="stylesheet">
    <link href="css/slick.min.css" rel="stylesheet">
    <link href="css/register.css" rel="stylesheet">
    <link href="css/sidebars.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/css/adminCenter.css" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icofont/icofont.min.css">
    <style>
        .content{
            background: white;
        }
    </style>
    <title>用户中心</title>
</head>
<body>

 <%--    判断是否获取用户信息 --%>
    <c:if test="!${user.isadmin}">
        <% String rq = request.getContextPath();
          request.getRequestDispatcher(rq+"/index.jsp").forward(request,response);
        %>
    </c:if>
    <div class="window">
        <div class="header">
            <jsp:include page="adminHeader.jsp"></jsp:include>
        <div class="main">
            <div class="aside">
                <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px;">

                    <ul class="nav nav-pills flex-column mb-auto">
                        <li class="nav-item">
                            <a href="${pageContext.request.contextPath}/userCenterServlet" id="userInfo" class="nav-link active" aria-current="page">
                                <svg class="bi pe-none me-2" width="16" height="20"><use xlink:href="#home"></use></svg>
                                用 户 信 息
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/OrderQueryListServlet" id="allOrderInfo" class="nav-link text-white">
                                <svg class="bi pe-none me-2" width="16" height="20"><use xlink:href="#table"></use></svg>
                                所 有 订 单
                            </a>
                        </li>
                        <li>
                            <a href="${pageContext.request.contextPath}/AdminGoodList" id="addGood" class="nav-link text-white">
                                <svg class="bi pe-none me-2" width="16" height="20"><use xlink:href="#table"></use></svg>
                                商 品 信 息
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
                    <div class="text-right" style="margin-top: 5px"><a class="btn btn-warning"  type="button" data-bs-toggle="modal" data-bs-target="#add-mini-user">添 加 用 户</a></div>
                    <table class="table table-bordered table-hover">

                        <tr>
                            <th width="5%">ID</th>
                            <th width="10%">用户名</th>
                            <th width="10%">密码</th>
                            <th width="10%">邮箱</th>
                            <th width="10%">收件人</th>
                            <th width="10%">电话</th>
                            <th width="10%">地址</th>
                            <th width="10%">管理员</th>
                            <th width="12%">操作</th>
                        </tr>


                        <c:forEach items="${users}" var="u">
                        <tr>
                            <td><p>${u.id }</p></td>
                            <td><p >${u.username}</p></td>
                            <td><p>${u.password}</p></td>
                            <td><p >${u.email}</p></td>
                            <td><p>${u.name}</p></td>
                            <td><p>${u.phone}</p> </td>
                            <td><p>${u.address}</p></td>
                            <td><p>${u.isadmin}</p></td>
                            <td>
                                <a id="${u.id}" class="btn btn-primary btn-modify" data-bs-toggle="modal" data-bs-target="#modify-mini-user">修改</a>
                                <a class="btn btn-danger" href="${pageContext.request.contextPath }/AdminDeleteUserServlet?id=${u.id }">删除</a>
                            </td>
                        </tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="modal fade" id="add-mini-user">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">用 户 信 息</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <form class="add-form">
                                    <div class="mb-3">
                                        <label  class="col-form-label">id:</label>
                                        <input id="add-mini-id" type="text" class="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="col-form-label">用户名:</label>
                                        <input id="add-mini-username" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="col-form-label">密码:</label>
                                        <input id="add-mini-password" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label  class="col-form-label">邮箱:</label>
                                        <input id="add-mini-email" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="col-form-label">收件人:</label>
                                        <input id="add-mini-name" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="col-form-label">电话:</label>
                                        <input id="add-mini-phone" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="col-form-label">地址:</label>
                                        <input id="add-mini-address" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="col-form-label">是否管理员</label>
                                        <div>
                                            <input class="form-check-input check-mini" type="radio" value="true" name="flexRadioDefault" id="flexRadioDefault1">
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                是
                                            </label>

                                            <input class="form-check-input check-mini"  type="radio" value="false" name="flexRadioDefault" id="flexRadioDefault2" checked>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                                否
                                            </label>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >关 闭</button>
                                <button type="submit" class="btn btn-primary add-btn">修 改</button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="modify-mini-user">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5">用 户 信 息</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div id="error_register" class="error_msg msg_color">

                            </div>
                            <div class="modal-body">
                                <form class="add-form">
                                    <div class="mb-3">
                                        <label  class="col-form-label">id:</label>
                                        <input id="modify-mini-id" type="text" class="form-control" />
                                    </div>
                                    <div class="mb-3">
                                        <label class="col-form-label">用户名:</label>
                                        <input id="modify-mini-username" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label  class="col-form-label">密码:</label>
                                        <input id="modify-mini-password" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label  class="col-form-label">邮箱:</label>
                                        <input id="modify-mini-email" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label  class="col-form-label">收件人:</label>
                                        <input id="modify-mini-name" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label  class="col-form-label">电话:</label>
                                        <input id="modify-mini-phone" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="col-form-label">地址:</label>
                                        <input id="modify-mini-address" type="text" class="form-control"/>
                                    </div>
                                    <div class="mb-3">
                                        <label class="col-form-label">是否管理员</label>
                                        <div>
                                            <input id="modify-true" class="form-check-input check-mini-modify" type="radio" value="true" name="flexRadioDefault"/>
                                            <label class="form-check-label" for="flexRadioDefault1">
                                                是
                                            </label>

                                            <input id="modify-false" class="form-check-input check-mini-modify"  type="radio" value="false" name="flexRadioDefault"/>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                                否
                                            </label>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >关 闭</button>
                                <button type="submit" class="btn btn-primary user-modify-btn">修 改</button>
                            </div>
                        </div>
                    </div>
                </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="footer">
       <jsp:include page="/footer.jsp"></jsp:include>
    </div>
</body>

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/index.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/admin.js"></script>

</html>
