<%--
  Created by IntelliJ IDEA.
  User: Lemon
  Date: 2023/6/10
  Time: 17:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/tasp.css" />
    <link href="css/orderconfirm.css" rel="stylesheet" />
    <link href="css/main.css" rel="stylesheet">
    <link href="css/slick.min.css" rel="stylesheet">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/login-css.css">
    <link href="css/carousel.css" rel="stylesheet">
    <link href="css/index.css" rel="stylesheet">
    <link rel="stylesheet" href="fonts/icofont/icofont.min.css">

</head>
<body>
<c:if test="${empty user}">
    <% String rq = request.getContextPath();
        response.sendRedirect(rq+"/index.jsp");
    %>
</c:if>
<c:if test="${empty cart}">
    <% String rq = request.getContextPath();
        response.sendRedirect(rq+"/index.jsp");
    %>
</c:if>
    <jsp:include page="header.jsp"></jsp:include>
    <div class="s_content">
        <div class="s_content_c inner_c">
            <div class="s_info">
                <div class="s_title">
                    <a href="#">
                        首页
                    </a> &gt;
                    <a href="#">
                        购物车
                    </a> &gt;
                    <span>
          订单确认
        </span>
                </div>
                <div id="address" class="address" style="margin-top: 20px;" data-spm="2">
                    <form name="addrForm" id="addrForm" action="#">
                        <h4>确认收货地址
                            <span class="manage-address">
                                 <a href="${pageContext.request.contextPath}/userCenterServlet" target="_blank" title="管理我的收货地址"class="J_MakePoint" data-point-url=>管理收货地址</a>
                                </span>
                        </h4>
                        <ul id="address-list" class="address-list">
                            <li class="J_Addr J_MakePoint clearfix  J_DefaultAddr " data-point-url="http://log.mmstat.com/buy.1.20">
                                <s class="J_Marker marker"></s>
                                <span class="marker-tip">寄送至</span>
                                <div class="address-info">
                                    <input name="address" class="J_MakePoint " type="radio" value="674944241"  checked/>
                                    <label class="user-address">${user.address} <em>${user.phone}</em></label>

                                </div>
                            </li>
                        </ul>
                    </form>
                    <div>
                        <h4 class="dib">确认订单信息</h4>
                        <table cellspacing="0" cellpadding="0" class="order-table" id="J_OrderTable">
                            <thead>
                            <tr>
                                <th class="s-title" style="color: black">店铺宝贝
                                    <hr/>
                                </th>
                                <th class="s-price" style="color: black">单价(元)
                                    <hr/>
                                </th>
                                <th class="s-amount" style="color: black">数量
                                    <hr/>
                                </th>
                                <th class="s-total" style="color: black">小计(元)
                                    <hr/>
                                </th>
                            </tr>
                            </thead>
                            <tbody data-spm="3" class="J_Shop" data-tbcbid="0" data-outorderid="47285539868" data-isb2c="false" data-postMode="2" data-sellerid="1704508670">
                                <td colspan="2" class="promo">
                                    <div>
                                        <ul class="scrolling-promo-hint J_ScrollingPromoHint">
                                        </ul>
                                    </div>
                                </td>
                                <c:forEach items="${sessionScope.cart}" var="c">
                                    <tr>
                                        <td class="s-title">
                                            <a href="#" target="_blank" class="J_MakePoint">
                                                <img width="100px" src="${c.value.good.image}" class="itempic"><span class="title J_MakePoint" data-point-url="http://log.mmstat.com/buy.1.5">${c.value.good.goodname}</span></a>


                                        </td>
                                        <td class="s-price">
                                            <span class='price '><em class="style-normal-small-black J_ItemPrice"  >${c.value.good.price}</em></span>

                                        </td>
                                        <td class="s-amount" data-point-url="">

                                            ${c.value.amount}

                                        </td>
                                        <td class="s-total">
                                            <span class='price '><em class="style-normal-bold-red J_ItemTotal ">${c.value.count}</em></span>

                                        </td>
                                    </tr>

                                </c:forEach>




                            <tr class="item-service">
                                <td colspan="5" class="servicearea" style="display: none"></td>
                            </tr>

                            <tr class="blue-line" style="height: 2px;">
                                <td colspan="5"></td>
                            </tr>

                            <tr class="other other-line">
                            <tr class="other other-line">
                                <td colspan="5">
                                    <cls class="dib-wrap">
                                        <li class="dib user-info">
                                            <div class="field gbook">
                                                <label class="label">给卖家留言：</label>
                                                <textarea class="order-textarea" style="width:350px;height:80px;" title="选填：对本次交易的补充说明（建议填写已经和卖家达成一致的说明）" name=""></textarea>
                                            </div>
                                        </li>
                                    </cls>
                                </td>
                            </tr>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <td colspan="5">

                                    <div class="order-go" data-spm="4">
                                        <div class="J_AddressConfirm address-confirm">
                                            <div class="kd-popup pop-back" style="margin-bottom: 40px; width: 100%">
                                                <div class="box">
                                                    <div class="col-sm-6 col-md-4 col-lg-3 ">
                                                        <label>
                                                            <div class="thumbnail">
                                                                <input type="radio" name="paytype" value="1" checked="checked" />
                                                                <img src="picture/wechat.jpg" alt="微信支付" width="100px">
                                                            </div>
                                                        </label>
                                                    </div>
                                                    <div class="col-sm-6 col-md-4 col-lg-3 ">
                                                        <label>
                                                            <div class="thumbnail">
                                                                <input type="radio" name="paytype" value="2"  />
                                                                <img src="picture/alipay.jpg" alt="支付宝支付" width="100px">
                                                            </div>
                                                        </label>
                                                    </div>
                                                    <div class="col-sm-6 col-md-4 col-lg-3 ">
                                                        <label>
                                                            <div class="thumbnail">
                                                                <input type="radio" name="paytype" value="3"  />
                                                                <img src="picture/offline.jpg" alt="货到付款" width="100px">
                                                            </div>
                                                        </label>
                                                    </div>
                                                    <div class="bd">
                                                        <div class="point-in">

                                                            <em class="t">实付款：</em> <span class='price g_price '>
                                                                        <span>&yen;</span><em class="style-large-bold-red" id="J_ActualFee">${total}</em>
                                                                    </span>
                                                        </div>

                                                        <ul>
                                                            <li><em>寄送至:</em><span id="J_AddrConfirm" style="word-break: break-all;"> </span></li>
                                                            <li><em>收货人:</em><span id="J_AddrNameConfirm">${user.address} ${user.phone}</span></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                                <button href="#">
                                                    <a class="btn-go" data-point-url="" tabindex="0" title="点击此按钮，提交订单。">提交订单</a>
                                                </button>

                                            </div>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tfoot>
                        </table>
                    </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
    <jsp:include page="footer.jsp"></jsp:include>

</body>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/vendor/slick.min.js"></script>
<script src="js/cumster/slick.js"></script>
<script src="js/index.js"></script>
</html>
