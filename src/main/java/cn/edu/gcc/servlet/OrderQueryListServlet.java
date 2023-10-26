package cn.edu.gcc.servlet;

import cn.edu.gcc.dao.OrderDao;
import cn.edu.gcc.domain.Order;
import cn.edu.gcc.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "OrderQueryListServlet", value = "/OrderQueryListServlet")
public class OrderQueryListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        OrderService orderService = new OrderService();
        List<Order> ordersList = orderService.queryOrder();
        for (Order order : ordersList) {
            System.out.println(order.toString());
        }
        request.setAttribute("ordersList",ordersList);
        request.getRequestDispatcher("/admin/adminAllOrder.jsp").forward(request,response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
