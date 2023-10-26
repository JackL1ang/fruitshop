<%--
  Created by IntelliJ IDEA.
  User: Lemon
  Date: 2023/6/11
  Time: 23:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<header>
  <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">

    <div class="container-fluid">
      <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><img class="logo-header" src="${pageContext.request.contextPath}/picture/logo.png"></a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarCollapse">
        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
          <li><a href="${pageContext.request.contextPath}/index.jsp" class="nav-link text-white">主 页</a></li>
          <li><a href="#" class="text-white"></a></li>
          <li><a href="${pageContext.request.contextPath}/GoodListServlet" class="nav-link text-white">商 品</a></li>
          <li><a href="#" class="text-white"></a></li>
          <li>
            <div class="dropdown dropdown-menu-end">
              <button type="button" class="catalog-btn btn btn-dark dropdown-toggle nav-link" data-bs-toggle="dropdown">
                类 别
              </button>
              <ul class="catalog dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                <div class="container">
                  <div class="row row-cols-5">
                    <div class="col">
                      <div class="megamenu-wrap">
                        <h5 class="megamenu-title"><a id="vegetable" href="${pageContext.request.contextPath}/selectGoodByType?type=蔬菜">蔬菜</a></h5>
                        <ul class="megamenu-list">
                          <li><a href="#">胡萝卜</a></li>
                          <li><a href="#">白菜</a></li>
                          <li><a href="#">上海青</a></li>
                          <li><a href="#">西蓝花</a></li>
                          <li><a href="#">土豆</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col">
                      <div class="megamenu-wrap">
                        <h5 class="megamenu-title"><a id="fruit" href="${pageContext.request.contextPath}/selectGoodByType?type=水果">水果</a></h5>
                        <ul class="megamenu-list">
                          <li><a href="#">苹果</a></li>
                          <li><a href="#">梨子</a></li>
                          <li><a href="#">香蕉</a></li>
                          <li><a href="#">草莓</a></li>
                          <li><a href="#">西瓜</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col">
                      <div class="megamenu-wrap">
                        <h5 class="megamenu-title"><a id="Dairy" href="${pageContext.request.contextPath}/selectGoodByType?type=乳制品">乳制品</a></h5>
                        <ul class="megamenu-list">
                          <li><a href="#">黄油</a></li>
                          <li><a href="#">芝士</a></li>
                          <li><a href="#">牛奶</a></li>
                          <li><a href="#">鸡蛋</a></li>
                          <li><a href="#">奶酪</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col">
                      <div class="megamenu-wrap">
                        <h5 class="megamenu-title"><a id="seafood" href="${pageContext.request.contextPath}/selectGoodByType?type=海鲜">海鲜</a></h5>
                        <ul class="megamenu-list">
                          <li><a href="#">龙虾</a></li>
                          <li><a href="#">螃蟹</a></li>
                          <li><a href="#">鲍鱼</a></li>
                          <li><a href="#">海参</a></li>
                          <li><a href="#">贝类</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col">
                      <div class="megamenu-wrap">
                        <h5 class="megamenu-title"><a id="Low calorie food" href="${pageContext.request.contextPath}/selectGoodByType?type=低热量食品">低热量食品</a></h5>
                        <ul class="megamenu-list">
                          <li><a href="#">鲑鱼</a></li>
                          <li><a href="#">三文鱼</a></li>
                          <li><a href="#">沙拉</a></li>
                          <li><a href="#">番茄</a></li>
                          <li><a href="#">燕麦</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col">
                      <div class="megamenu-wrap">
                        <h5 class="megamenu-title"><a id="fast food" href="${pageContext.request.contextPath}/selectGoodByType?type=快餐">快餐</a></h5>
                        <ul class="megamenu-list">
                          <li><a href="#">汉堡</a></li>
                          <li><a href="#">奶昔</a></li>
                          <li><a href="#">三明治</a></li>
                          <li><a href="#">甜甜圈</a></li>
                          <li><a href="#">披萨</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col">
                      <div class="megamenu-wrap">
                        <h5 class="megamenu-title"><a id="dirnk" href="${pageContext.request.contextPath}/selectGoodByType?type=饮料">饮料</a></h5>
                        <ul class="megamenu-list">
                          <li><a href="#">鸡尾酒</a></li>
                          <li><a href="#">苏打饮料</a></li>
                          <li><a href="#">香槟</a></li>
                          <li><a href="#">白酒</a></li>
                          <li><a href="#">元气森林</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col">
                      <div class="megamenu-wrap">
                        <h5 class="megamenu-title"><a id="pork" href="${pageContext.request.contextPath}/selectGoodByType?type=肉类">肉类</a></h5>
                        <ul class="megamenu-list">
                          <li><a href="#">肉丸子</a></li>
                          <li><a href="#">香肠</a></li>
                          <li><a href="#">家禽</a></li>
                          <li><a href="#">鸡肉</a></li>
                          <li><a href="#">牛肉</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col">
                      <div class="megamenu-wrap">
                        <h5 class="megamenu-title"><a id="fish" href="${pageContext.request.contextPath}/selectGoodByType?type=鱼类">鱼类</a></h5>
                        <ul class="megamenu-list">
                          <li><a href="#">沙丁鱼</a></li>
                          <li><a href="#">草鱼</a></li>
                          <li><a href="#">鲫鱼</a></li>
                          <li><a href="#">石斑鱼</a></li>
                          <li><a href="#">黄鳝</a></li>
                        </ul>
                      </div>
                    </div>
                    <div class="col">
                      <div class="megamenu-wrap">
                        <h5 class="megamenu-title"><a id="solid food" href="${pageContext.request.contextPath}/selectGoodByType?type=干粮">干粮</a></h5>
                        <ul class="megamenu-list">
                          <li><a href="#">面条</a></li>
                          <li><a href="#">奶粉</a></li>
                          <li><a href="#">坚果</a></li>
                          <li><a href="#">杏仁</a></li>
                          <li><a href="#">花生</a></li>
                        </ul>
                      </div>
                    </div>
                  </div>
                </div>
              </ul>
            </div>
          </li>


          <li><a href="#" class="text-white"></a></li>
          <li><a href="#" class="nav-link text-white">关 于</a></li>
        </ul>


        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" action="searchGoodsServlet" method="get">

          <input name="likename" value="" type="text" class="form-control form-control-dark text-bg-dark" placeholder="Search...">

        </form>

          <div class="header-widget-group right">
            <div class="dropdown dropdown-menu-end">
              <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
                <li><a class="dropdown-item active" href="${pageContext.request.contextPath}/userCenterServlet">个人中心</a></li>
                <li><a class="dropdown-item" href="${pageContext.request.contextPath}/userLoginOut">注销</a></li>
              </ul>
            </div>
            <a class="header-widget" href="#" title="我的订单">
              <i class="icofont-ui-rotation"></i>
              <sup>0</sup>
            </a>
            <a class="header-widget" href="#" title="心愿单">
              <i class="icofont-ui-love"></i>
              <sup>0</sup>
            </a>
            <button class="header-widget header-cart" title="购物车">
              <i class="icofont-shopping-cart"></i>
              <c:if test="${!empty size}">
                <sup>${size}</sup>
              </c:if>
              <c:if test="${empty size}">
                <sup>0</sup>
              </c:if>
            </button>
          </div>
      </div>
    </div>
    </div>
  </nav>
</header>
<aside class="cart-part">
  <div class="cart-container">
    <div class="cart-header">
      <div class="cart-total"><i class="icofont-shopping-cart"></i>
        <c:if test="${!empty size}">
          <span>商品总量(${size})</span>
        </c:if>
        <c:if test="${empty size}">
          <span>商品总量(0)</span>
        </c:if>
      </div>
      <button class="cart-close"><i class="icofont-close"></i></button>
    </div>
    <ul class="cart-list">
      <c:forEach items="${sessionScope.cart}" var="c">
        <li class="cart-item">
          <div class="cart-media"><a href="#"><img src="${c.value.good.image}" alt="product"></a>
            <button class="cart-delete" id="${c.key}"><i class="icofont-bin"></i></button>
          </div>
          <div class="cart-info-group">
            <div class="cart-info">
              <h6><a href="product-details.html">${c.value.good.goodname}</a></h6>
              <p>单价:¥${c.value.good.price}</p>
            </div>
            <div class="cart-action-group">
              <div class="product-action">
                <button class="action-minus" title="Quantity Minus"><i class="icofont-minus"></i></button>
                <input class="action-input" title="Quantity Number" type="text" name="quantity" value="${c.value.amount}">
                <button class="action-plus" title="Quantity Plus"><i class="icofont-plus"></i></button>
              </div>
              <h6>${c.value.count}</h6>
            </div>
          </div>
        </li>
      </c:forEach>
    </ul>
    <div class="cart-footer">
      <button class="coupon-btn">有优惠码?</button>
      <form class="coupon-form">
        <input type="text" placeholder="输入优惠码">
        <button type="submit"><span>使用</span></button>
      </form>
      <a class="cart-checkout-btn" href="${pageContext.request.contextPath}/confirm-order.jsp"><span class="checkout-label">立即支付</span><span class="checkout-price">总计：${total}</span></a></div>
  </div>
</aside>
