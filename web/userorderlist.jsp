<%--
  Created by IntelliJ IDEA.
  User: Lemon
  Date: 2023/6/3
  Time: 3:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<meta charset="UTF-8">
<head>
  <link href="css/main.css" rel="stylesheet">
  <link href="css/register.css" rel="stylesheet">
  <link href="css/sidebars.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/carousel.css" rel="stylesheet">
  <link href="css/index.css" rel="stylesheet">
  <link href="css/UserCenter.css" rel="stylesheet">
  <link rel="stylesheet" href="fonts/icofont/icofont.min.css">

</head>
<body>
<div class="window">
  <div class="header">
    <jsp:include page="userHeader.jsp"></jsp:include>

  <div class="main">
    <div class="aside">
      <div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 280px;">

        <ul class="nav nav-pills flex-column mb-auto">
          <li class="nav-item">
            <a href="${pageContext.request.contextPath}/UserCenter.jsp" id="userInfo" class="nav-link text-white" aria-current="page">
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
            <a href="${pageContext.request.contextPath}/userorderlist.jsp" id="orderInfo" class="nav-link active">
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
      <div class="container">

        <h2 style="margin-top: 10px">我的订单</h2>

        <table class="table table-bordered table-hover">

          <tr>
            <th width="10%">订单号</th>
            <th width="10%">总价</th>
            <th width="20%">商品详情</th>
            <th width="30%">收货信息</th>
            <th width="10%">订单状态</th>
            <th width="10%">支付方式</th>
            <th width="10%">下单时间</th>
          </tr>

          <c:forEach items="${orders }" var="order">

            <tr>
              <td><p>${order.id }</p></td>
              <td><p>${order.count }</p></td>
              <td>
                  <p>${order.goodname }</p>
                  <img src="${order.image }" width="100px"/>
              </td>
              <td>
                <p>姓名：${order.name }</p>
                <p>电话：${order.phone }</p>
                <p>地址：${order.address }</p>
              </td>
              <td>
                <p>
                  <c:if test="${order.status==1 }"><span style="color:red;">已付款</span></c:if>
                  <c:if test="${order.status==2 }"><span style="color:green;">已发货</span></c:if>
                  <c:if test="${order.status==3 }"><span style="color:black;">已完成</span></c:if>


                </p>
              </td>
              <td>
                <p>

                  <c:if test="${order.payinfo==1 }">微信</c:if>
                  <c:if test="${order.payinfo==2 }">支付宝</c:if>
                  <c:if test="${order.payinfo==3 }">货到付款</c:if>

                </p>
              </td>
              <td><p>${order.datetime }</p></td>
            </tr>

          </c:forEach>



        </table>

      </div>
    </div>
  </div>
</div>
  <div class="footer">
    <jsp:include page="footer.jsp"></jsp:include>

  </div>
</div>
</body>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/index.js"></script>
<script src="js/register.js"></script>
<script src="js/usercenter.js"></script>
</html>