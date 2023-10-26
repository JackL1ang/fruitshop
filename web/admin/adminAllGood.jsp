<%--
  Created by IntelliJ IDEA.
  User: Lemon
  Date: 2023/6/8
  Time: 12:09
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
  <title>商品信息</title>
</head>
<body>

    判断是否获取用户信息
<c:if test="!${user.isadmin}">
  <% String rq = request.getContextPath();
    response.sendRedirect(rq+"/index.jsp");
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
            <a href="${pageContext.request.contextPath}/OrderQueryListServlet" id="allOrderInfo" class="nav-link text-white">
              <svg class="bi pe-none me-2" width="16" height="20"><use xlink:href="#table"></use></svg>
              所 有 订 单
            </a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/AdminGoodList" id="addGood" class="nav-link active">
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
        <div class="text-right" style="margin-top: 5px"><a id="good-add-btn" class="btn btn-warning"  type="button" data-bs-toggle="modal" data-bs-target="#add-mini-allgood">添 加 商 品</a></div>
        <table class="table table-bordered table-hover">

          <tr>
            <th width="5%">ID</th>
            <th width="10%">商品名</th>
            <th width="10%">图片</th>
            <th width="10%">价格</th>
            <th width="10%">库存</th>
            <th width="12%">操作</th>
          </tr>


          <c:forEach items="${good}" var="g">

            <tr>
              <td><p>${g.id}</p></td>
              <td><p >${g.goodname}</p></td>
              <td><img height="100px" src="${g.image}"/></td>
              <td><p >${g.price}</p></td>
              <td><p >${g.stock}</p></td>
              <td>
                <a id="${g.id}" class="btn btn-primary good-btn-modify" data-bs-toggle="modal" data-bs-target="#modify-mini-user">修改</a>
                <a class="btn btn-danger" href="${pageContext.request.contextPath }/AdminDeleteGoodServlet?id=${g.id }">删除</a>
              </td>
            </tr>
          </c:forEach>
        </table>
      </div>
      <div class="modal fade" id="add-mini-allgood">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5" id="exampleModalLabel">商 品 信 息</h1>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
              <form class="add-form">
                <div class="mb-3">
                  <label  class="col-form-label">id:</label>
                  <input id="add-mini-good-id" type="text" readonly="readonly" class="form-control"/>
                </div>
                <div class="mb-3">
                  <label class="col-form-label">商品名:</label>
                  <input id="add-mini-goodnames" type="text" class="form-control"/>
                </div>
                <div class="mb-3">
                  <label class="col-form-label">图片:</label>
                  <input id="add-mini-goodpricture" type="file" class="form-control"/>
                </div>
                <div class="mb-3">
                  <label  class="col-form-label">价格:</label>
                  <input id="add-mini-good-price" type="text" class="form-control"/>
                </div>
                <div class="mb-3">
                  <label class="col-form-label">库存:</label>
                  <input id="add-mini-amount" type="text" class="form-control"/>
                </div>
                <div class="mb-3">
                  <label class="col-form-label">类别:</label>
                  <select class="form-select add-good">
                    <option>蔬菜</option>
                    <option>水果</option>
                    <option>乳制品</option>
                    <option>海鲜</option>
                    <option>低热量食品</option>
                    <option>快餐</option>
                    <option>肉类</option>
                    <option>饮料</option>
                    <option>鱼类</option>
                    <option>干粮</option>
                  </select>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >关 闭</button>
              <button  type="submit" class="btn btn-primary good-add-confirm-btn">修 改</button>
            </div>
          </div>
        </div>
      </div>


      <div class="modal fade" id="modify-mini-user">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h1 class="modal-title fs-5">商 品 信 息</h1>
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
                  <label class="col-form-label">商品名:</label>
                  <input id="modify-mini-goodsname" type="text" class="form-control"/>
                </div>
                <div class="mb-3">
                  <label  class="col-form-label">图片:</label>
                  <img width="100px" id="modify-mini-image" src="">
                  <input id="modify-mini-images" type="file" class="form-control"/>
                </div>
                <div class="mb-3">
                  <label  class="col-form-label">价格:</label>
                  <input id="modify-mini-price" type="text" class="form-control"/>
                </div>
                <div class="mb-3">
                  <label  class="col-form-label">库存:</label>
                  <input id="modify-mini-stock" type="text" class="form-control"/>
                </div>
                <div class="mb-3">
                  <label class="col-form-label">类别：</label>
                  <select class="form-select modify-good">
                    <option>蔬菜</option>
                    <option>水果</option>
                    <option>乳制品</option>
                    <option>海鲜</option>
                    <option>低热量食品</option>
                    <option>快餐</option>
                    <option>肉类</option>
                    <option>饮料</option>
                    <option>鱼类</option>
                    <option>干粮</option>
                  </select>
                </div>
              </form>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" >关 闭</button>
              <button type="submit" class="btn btn-primary good-modify-btn">修 改</button>
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
<script src="${pageContext.request.contextPath}/admin/js/adminAllGood.js"></script>

</html>
