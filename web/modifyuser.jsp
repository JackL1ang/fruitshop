<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <input id="address-register" type="text" value="${user.address}"/>
            </div>

            <div class="btn-submit">
                <div class="inner"></div>
                <button class="userCenter_btn" type="button">提交</button>
            </div>

        </form>
    </div>

</div>
<script src="js/usercenter.js"></script>