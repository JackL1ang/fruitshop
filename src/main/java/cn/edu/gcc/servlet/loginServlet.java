package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.User;
import cn.edu.gcc.service.UserService;
import com.alibaba.fastjson.JSON;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;


@WebServlet(name = "loginServlet", value = "/loginServlet")
public class loginServlet extends HttpServlet {
    UserService userService = new UserService();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        request.setCharacterEncoding("utf-8");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = userService.login(username, password);

        System.out.println(username+"      "+password);
        if (user ==null){
            response.getWriter().write("1");

        }else {
            System.out.println("user---->"+user.toString());
            //将获取到的user信息放入session中
            HttpSession session = request.getSession();
            session.setAttribute("user",user);


            String id = session.getId();
            System.out.println("session_id----->"+id);

            Object userInfo = session.getAttribute("user");
            System.out.println("session username----->"+userInfo);




        }

    }
}
