<%--
  Created by IntelliJ IDEA.
  User: Lemon
  Date: 2023/6/3
  Time: 2:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>

    <link rel="stylesheet" href="css/slick.min.css">
    <link rel="stylesheet" href="css/bootstrap-grid.min.css">
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="fonts/icofont/icofont.min.css">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/login-css.css">
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link href="css/product.css" rel="stylesheet">

</head>
<body>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="product-heading section-heading">
                    <h2>最近热卖</h2>
                </div>

            </div>
        </div>

        <div class="row row-cols-lg-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5">
            <c:forEach items="${good}" var="g">
                <div class="col">
                    <div class="product-card">
                        <div class="product-media">
                            <div class="product-label">
                                <label class="label-text sale">热销</label>
                            </div>
                            <button class="product-wish wish"><i class="icofont-ui-love"></i></button>
                            <a class="product-image" href="#"><img src="${g.image}" alt="product"></a>
                            <div class="product-widget"><a title="Product Compare" href="compare.html" class="icofont-ui-rotation"></a><a title="Product Video" href="#" class="venobox icofont-ui-play" data-autoplay="true" data-vbtype="video"></a><a title="Product View" href="#" class="icofont-eye-alt" data-bs-toggle="modal" data-bs-target="#product-view"></a></div>
                        </div>
                        <div class="product-content">
                            <div class="product-rating"><i class="active icofont-star"></i><i class="active icofont-star"></i><i class="active icofont-star"></i><i class="active icofont-star"></i><i class="icofont-star"></i><a href="product-details.html">(3)</a></div>
                            <h6 class="product-name"><a href="product-details.html">${g.goodname}</a></h6>
                            <h6 class="product-price"><del>¥34</del><span>${g.price} <small>/元</small></span></h6>
                            <button id="${g.id}" class="product-add" title="Add to Cart"><i class="icofont-cart"></i><span>加入购物车</span></button>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>
</body>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/index.js"></script>
<script src="js/product.js"></script>
</html>
