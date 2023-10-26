package cn.edu.gcc.servlet;

import cn.edu.gcc.dao.OrderDao;
import cn.edu.gcc.domain.Order;
import cn.edu.gcc.domain.User;
import cn.edu.gcc.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "userSearchOrderServlet", value = "/userSearchOrderServlet")
public class userSearchOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");
        int id = user.getId();
        OrderService orderService = new OrderService();
        List<Order> orders = orderService.queryOrderByUser(id);
        for (Order order : orders) {
            System.out.println(order.toString());
        }
        request.getSession().setAttribute("orders",orders);
        request.getRequestDispatcher("/userorderlist.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
