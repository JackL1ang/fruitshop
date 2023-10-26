package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.User;
import cn.edu.gcc.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;

@WebServlet(name = "isUsernameExistServlet", value = "/isUsernameExistServlet")
public class isUsernameExistServlet extends HttpServlet {
    UserService us= new UserService();
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");

        User user = new User();
        String username = request.getParameter("username");
        System.out.println(username);
        boolean register = us.register_selectisUsernameExit(username);
        response.getWriter().write(String.valueOf(register));
    }
}
