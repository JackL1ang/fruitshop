package cn.edu.gcc.servlet;

import cn.edu.gcc.dao.OrderDao;
import cn.edu.gcc.service.OrderService;
import cn.edu.gcc.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminModifyTypeServlet", value = "/AdminModifyTypeServlet")
public class AdminModifyTypeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int type = Integer.parseInt(request.getParameter("type"));
        System.out.println(type);
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        OrderService orderService = new OrderService();
        String i = String.valueOf(orderService.modifyOrderType(type, id));
        response.getWriter().write(i);


    }
}
