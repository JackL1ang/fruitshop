<%--
  Created by IntelliJ IDEA.
  User: Lemon
  Date: 2023/6/8
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
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
                        <a href="${pageContext.request.contextPath}/userCenterServlet" id="userInfo" class="nav-link text-white" aria-current="page">
                            <svg class="bi pe-none me-2" width="16" height="20"><use xlink:href="#home"></use></svg>
                            用 户 信 息
                        </a>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/OrderQueryListServlet" id="allOrderInfo" class="nav-link active">
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
                <table class="table table-bordered table-hover">

                    <tr>
                        <th width="5%">订单号</th>
                        <th width="10%">商品名</th>
                        <th width="10%">数量</th>
                        <th width="10%">价格</th>
                        <th width="10%">用户名</th>
                        <th width="10%">收货信息</th>
                        <th width="10%">订单状态</th>
                        <th width="10%">支付方式</th>
                        <th width="10%">下单时间</th>
                        <th width="12%">操作</th>
                    </tr>


                    <c:forEach items="${ordersList}" var="o">

                        <tr>
                            <td><p>${o.id}</p></td>
                            <td><p >${o.goodname}</p><img src="${o.image}" width="100px"/></td>
                            <td><p >${o.amount}</p></td>
                            <td><p>${o.count}</p></td>
                            <td><p>${o.username}</p></td>
                            <td>
                                <p>
                                    收件人：${o.name}
                                </p>
                                <p>
                                    地址：${o.address}
                                </p>
                                <p>
                                    电话：${o.phone}
                                </p>
                            </td>
                            <td>
                                <p>

                                    <c:if test="${o.status==1 }"><span style="color:red;">已付款</span></c:if>
                                    <c:if test="${o.status==2 }"><span style="color:green;">已发货</span></c:if>
                                    <c:if test="${o.status==3 }"><span style="color:black;">已完成</span></c:if>
                                </p>

                            </td>
                            <td>
                                <p>
                                    <c:if test="${o.payinfo==1 }">微信</c:if>
                                    <c:if test="${o.payinfo==2 }">支付宝</c:if>
                                    <c:if test="${o.payinfo==3 }">货到付款</c:if>

                                </p>

                            </td>
                            <td><p >${o.datetime}</p></td>
                            <td>
                                <a id="${o.id}" class="btn btn-primary btn-order-modify" data-bs-toggle="modal" data-bs-target="#modify-mini-user">修改</a>
                                <a class="btn btn-danger" href="${pageContext.request.contextPath }/AdminDeleteOrder?id=${o.id }">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <div class="modal fade" id="modify-mini-user">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5">订 单 信 息</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div id="error_register" class="error_msg msg_color">

                        </div>
                        <div class="modal-body">
                            <form class="add-form">
                                <div class="mb-3">
                                    <label  class="col-form-label">订单状态:</label>
                                    <select id="order-type" class="form-select">
                                        <option value="1">已付款</option>
                                        <option value="2">已发货</option>
                                        <option value="3">已完成</option>
                                    </select>
                                </div>

                            </form>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >关 闭</button>
                            <button type="submit" class="btn btn-primary modify-order-btn">修 改</button>
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
<script src="${pageContext.request.contextPath}/admin/js/adminAllOrder.js"></script>
</html>
