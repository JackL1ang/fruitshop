package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.User;
import cn.edu.gcc.service.UserService;
import com.alibaba.fastjson.JSON;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SelectUserId", value = "/SelectUserId")
public class SelectUserId extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        UserService us = new UserService();
        User user = us.selectFromId(id);
        //封装为JSON
        String s = JSON.toJSONString(user);
        System.out.println(s);
        response.getWriter().write(s);
    }


}
