<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="content">
    <div class="signup box">


        <div class="text">
            更 改 密 码
        </div>

        <div id="error_modifypassword" class="error_msg msg_color">

        </div>
        <form action="#">
            <div class="Account-Information">
                <span>原密码 </span>
                <input id="before-password" name="password" type="password" />
            </div>

            <div class="Account-Information">
                <span>新密码 </span>
                <input id="new-password" name="password" type="password" />
            </div>

            <div class="Account-Information">
                <span>确认密码 </span>
                <input id="confirm-password" name="password" type="password" />
            </div>

            <div class="btn-submit">
                <div class="inner"></div>
                <button class="modify-password" type="button">提交</button>
            </div>

        </form>
    </div>

</div>

<script src="${pageContext.request.contextPath}/js/usermodifypassword.js"></script>
