package cn.edu.gcc.servlet;

import cn.edu.gcc.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminDeleteUserServlet", value = "/AdminDeleteUserServlet")
public class AdminDeleteUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        UserService userService = new UserService();
        int i = userService.userDelete(Integer.parseInt(id));
        if(i==1){
            request.getRequestDispatcher("/userCenterServlet").forward(request,response);
        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
