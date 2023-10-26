package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.User;
import cn.edu.gcc.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

@WebServlet(name = "userCenterServlet", value = "/userCenterServlet")
public class userCenterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        System.out.println(user);
        if(user==null){
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }else {
            boolean b = user.getIsadmin();
            if (b){
                UserService userService = new UserService();
                List<User> users = userService.selectAlluser();
                request.setAttribute("users",users);

                request.getRequestDispatcher("/admin/adminCenter.jsp").forward(request,response);

            }else {
                request.getRequestDispatcher("/UserCenter.jsp").forward(request,response);
            }
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




    }
}
