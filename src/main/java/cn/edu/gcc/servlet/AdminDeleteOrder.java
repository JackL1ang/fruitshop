package cn.edu.gcc.servlet;

import cn.edu.gcc.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminDeleteOrder", value = "/AdminDeleteOrder")
public class AdminDeleteOrder extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        System.out.println(id);
        OrderService orderService = new OrderService();
        int i = orderService.deleteOrder(id);
        if(i==1){
            request.getRequestDispatcher("/OrderQueryListServlet").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
