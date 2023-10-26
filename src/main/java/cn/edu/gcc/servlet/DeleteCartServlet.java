package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.Cart;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Map;

@WebServlet(name = "DeleteCartServlet", value = "/DeleteCartServlet")
public class DeleteCartServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //获取前端session要删除货物的id
        Integer id = Integer.valueOf(request.getParameter("id"));
        //购物车大小初始化
        int size = 0;
        //总价初始化
        double total = 0;

        System.out.println(id);
        HttpSession session = request.getSession();
        //获取session保存的购物车
        Map<Integer, Cart> cart = (Map<Integer, Cart>) session.getAttribute("cart");
        //将货物的id从购物车中移除
        cart.remove(id);
        //如果购物车为空
        if(cart.isEmpty()){

        }else {
            //遍历一次购物车
            for(Map.Entry<Integer, Cart> map: cart.entrySet()){
                total+=map.getValue().getGood().getPrice();
            }
        }
        //查看map的大小 得知购物者里的信息
        size = cart.size();
        System.out.println(size);
        System.out.println(total);
        request.setAttribute("cart",cart);
        session.setAttribute("size",size);
        session.setAttribute("total",total);



    }
}
