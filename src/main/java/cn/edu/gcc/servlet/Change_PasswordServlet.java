package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Change_PasswordServlet", value = "/Change_pwd")
public class Change_PasswordServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type", "text/html;charset=UTF-8");  		//让浏览器用utf8来解析返回的数据
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        if(password.equals(user.getPassword())){
            response.getWriter().write("1");
        }else {
            response.getWriter().write("2");
        }

    }
}
