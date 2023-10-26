package cn.edu.gcc.servlet;

import cn.edu.gcc.service.UserService;
import cn.edu.gcc.utils.HttpGetJson;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminModifyUserServlet", value = "/AdminModifyUserServlet")
public class AdminModifyUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String id = request.getParameter("id");
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        String email = request.getParameter("email");
//        String name = request.getParameter("name");
//        String phone = request.getParameter("phone");
//        String address = request.getParameter("address");
//        String isadmin = request.getParameter("isadmin");
        //使用封装号fastJson 将前端的json传过来
        JSONObject json = HttpGetJson.getJson(request);
        System.out.println("modifyuser---->"+json.toJSONString());
        UserService userService = new UserService();
        String i = String.valueOf(userService.modifyUser(json));
        System.out.println("i--->"+i);
        response.getWriter().write(i);


    }
}
