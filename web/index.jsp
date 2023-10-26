
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <title>生鲜商城</title>
  <link href="css/main.css" rel="stylesheet">
  <link href="css/slick.min.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="css/login-css.css">
  <link href="css/carousel.css" rel="stylesheet">
  <link href="css/index.css" rel="stylesheet">
  <link rel="stylesheet" href="fonts/icofont/icofont.min.css">

</head>
<body>

<jsp:include page="header.jsp"/>
<%--<%Object user = session.getAttribute("user");--%>
<%--  out.print(user);--%>
<%--<%--%>
<%--  String rq = request.getContextPath();--%>
<%--  out.print(rq);--%>

<%--%>--%>



  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
  <%--    轮播图片展示按按钮--%>
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>

    <div class="carousel-inner">
      <div class="carousel-item active">
        <svg class="bd-placeholder-img" width="100%" height="100%" preserveAspectRatio="none" focusable="false"><rect width="100%" height="100%"></rect><image style="height: 512px;width:1920px " href="picture/17830_15970466077232.jpg" ></image></svg>
        <div class="container">
          <div class="carousel-caption text-start">
            <h1 style="font-weight: bold">天 天 新 鲜 水 果</h1>
            <p style="font-weight: bold">从 我 开 始！</p>
            <p><a class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/register.jsp">进 行 注 册</a></p>

          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false" ><rect width="100%" height="100%"/><image href="picture/165.jpg" height="100%"/></svg>
        <div class="container">
          <div class="carousel-caption">
            <h1>2 4 小 时 免 费 配 送</h1>
            <p>安 全 送 达，损 坏 必 赔</p>
            <p><a  class="btn btn-lg btn-primary" href="${pageContext.request.contextPath}/product.jsp">立 刻 购 买</a></p>
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/><image width="100%" href="picture/17830_15807005629452.png"></image></svg>
        <div class="container">
          <div class="carousel-caption text-end">
            <h1>每 日 新 鲜 采 购</h1>
            <p>保 证 商 品 质 量</p>
            <p><a class="btn btn-lg btn-primary" href="#">了 解 更 多</a></p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>



  <div class="container marketing">
      <section class="section suggest-part">
        <div class="container">
          <ul class="suggest-slider slider-arrow">
            <li><a class="suggest-card" href="${pageContext.request.contextPath}/selectGoodByType?type=蔬菜"><img src="picture/suggest/01.jpg" alt="suggest">
              <h5>蔬菜<span>34种</span></h5>
            </a></li>
            <li><a class="suggest-card" href="${pageContext.request.contextPath}/selectGoodByType?type=水果"><img src="picture/suggest/02.jpg" alt="suggest">
              <h5>水果<span>89种</span></h5>
            </a></li>
            <li><a class="suggest-card" href="${pageContext.request.contextPath}/selectGoodByType?type=零食"><img src="picture/suggest/03.jpg" alt="suggest">
              <h5>零食 <span>45种</span></h5>
            </a></li>
            <li><a class="suggest-card" href="${pageContext.request.contextPath}/selectGoodByType?type=奶制品"><img src="picture/suggest/04.jpg" alt="suggest">
              <h5>奶制品<span>83种</span></h5>
            </a></li>
            <li><a class="suggest-card" href="${pageContext.request.contextPath}/selectGoodByType?type=海鲜"><img src="picture/suggest/05.jpg" alt="suggest">
              <h5>海鲜<span>40种</span></h5>
            </a></li>
            <li><a class="suggest-card" href="${pageContext.request.contextPath}/selectGoodByType?type=素食"><img src="picture/suggest/06.jpg" alt="suggest">
              <h5>素食<span>57种</span></h5>
            </a></li>
            <li><a class="suggest-card" href="${pageContext.request.contextPath}/selectGoodByType?type=干粮"><img src="picture/suggest/07.jpg" alt="suggest">
              <h5>干粮<span>23种</span></h5>
            </a></li>
            <li><a class="suggest-card" href="${pageContext.request.contextPath}/selectGoodByType?type=快餐"><img src="picture/suggest/08.jpg" alt="suggest">
              <h5>快餐<span>97种</span></h5>
            </a></li>
          </ul>
        </div>
      </section>
  </div>

    <hr class="featurette-divider">

    <div class="row featurette">
      <div class="col-md-7 ">
        <h2 class="item-index featurette-heading fw-normal lh-1" style="color: black">蔬 菜 特 价 大 甩 卖 </h2>
        <div style="height: 10px"></div>
        <p class="item-index lead">走 过 路 过 不 要 错 过 ！</p>
        <a class="item-index btn btn-lg btn-primary" href="${pageContext.request.contextPath}/GoodListServlet" style="background: #29912d">立 即 抢 购</a>
      </div>
      <div class="col-md-5">
        <img src="picture/countdown.png"/>
      </div>
    </div>


  <!-- FOOTER -->
  <jsp:include page="footer.jsp"/>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.js"></script>
<script src="js/vendor/slick.min.js"></script>
<script src="js/cumster/slick.js"></script>
<script src="js/index.js"></script>




</body>
</html>

