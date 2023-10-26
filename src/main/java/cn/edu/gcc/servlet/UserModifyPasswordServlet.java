package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.User;
import cn.edu.gcc.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UserModifyPasswordServlet", value = "/UserModifyPasswordServlet")
public class UserModifyPasswordServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String new_password = request.getParameter("new_password");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        int id = user.getId();
        UserService userService = new UserService();
        String i = String.valueOf(userService.modifyPassword(id, new_password));
        response.getWriter().write(i);

    }
}
