package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.Cart;
import cn.edu.gcc.domain.Good;
import cn.edu.gcc.service.GoodService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "GoodCart",value = "/GoodCart")
public class GoodCart extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        Object user =  session.getAttribute("user");
        //判断用户是否存在 如不存在让用户先登录
        if(user==null){
            resp.getWriter().write("false");
        }else {
            HttpSession session1  = req.getSession();
            //判断购物车是否为空 使用Map存储
            Map<Integer,Cart> cartMap = (Map<Integer, Cart>) session1.getAttribute("cart");
            if(cartMap ==null){
                //创建购物车
                cartMap = new HashMap<>();


            }
            double total = 0;
            int size = 0;
            Cart cart = new Cart();
            GoodService gs = new GoodService();
            //设置购物车中的一个商品的数量
            cart.setAmount(1);
            //获取商品的id
            int id = Integer.parseInt(req.getParameter("id"));
            System.out.println(id);
            //通过id搜索到商品
            Good good = gs.selectGoodById(id);
            //将搜索到的商品放入购物车中
            cart.setGood(good);
            System.out.println("cart.getAmount()------->"+cart.getAmount());
            System.out.println("cart.getCount()----------->>"+cart.getCount());
            cartMap.put(id,cart);
            //计算购物车中的总价
            for(Map.Entry<Integer, Cart> map: cartMap.entrySet()){
                total+=map.getValue().getGood().getPrice();
            }
            System.out.println("cartMap.size()------->"+cartMap.size());
            //现在购物车中有多少商品
            size = cartMap.size();
            //总价
            session1.setAttribute("total",total);
            //Map中有多少数据
            session1.setAttribute("size",size);
            session1.setAttribute("cart",cartMap);
            resp.getWriter().write("true");
        }




    }
}
