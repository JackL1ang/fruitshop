package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.User;
import cn.edu.gcc.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "modifyUserInfoServlet", value = "/modifyUserInfoServlet")
public class modifyUserInfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        UserService userService = new UserService();

        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        HttpSession session = request.getSession();
        User user_before = (User) session.getAttribute("user");
        String username = user_before.getUsername();
        boolean b = userService.modifyUserInfo(name, phone, address, username);
        User user_after = userService.login(user_before.getUsername(), user_before.getPassword());
        if(b){
            session.setAttribute("user",user_after);
            response.getWriter().write("1");
        }else {
            response.getWriter().write("2");
        }
    }
}
