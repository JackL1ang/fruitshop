package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.Good;
import cn.edu.gcc.service.GoodService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "GoodListServlet", value = "/GoodListServlet")
public class GoodListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        GoodService goodService = new GoodService();
        List<Good> goods = goodService.goodSelectAll();
        request.setAttribute("good",goods);
        for (Good good : goods) {
            System.out.println(good);
        }
        request.getRequestDispatcher("/product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
