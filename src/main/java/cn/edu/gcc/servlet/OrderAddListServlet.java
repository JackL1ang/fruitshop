package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.Cart;
import cn.edu.gcc.domain.Order;
import cn.edu.gcc.domain.User;
import cn.edu.gcc.service.OrderService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@WebServlet(name = "OrderAddListServlet", value = "/OrderAddListServlet")
public class OrderAddListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        //获取购物车信息
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        //获取用户信息
        User user = (User) session.getAttribute("user");
        //获取在订单传过来的留言
        Object text = req.getParameter("text");
        //获取支付信息
        int payinfo = Integer.parseInt(req.getParameter("payinfo"));
        //获取时间
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        String format = simpleDateFormat.format(date);
        //创建order类把需要的set进去
        Order order = new Order();
        order.setpayinfo(payinfo);
        order.setUser(user);
        order.setItemMap(cart);
        order.setDatetime(format);
        order.setStatus(1);
        OrderService orderService = new OrderService();
        String i = String.valueOf(orderService.addOrder(order));
        resp.getWriter().write(i);

    }
}
