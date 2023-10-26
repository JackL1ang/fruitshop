package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.Good;
import cn.edu.gcc.service.GoodService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "selectGoodByType", value = "/selectGoodByType")
public class selectGoodByType extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String type = request.getParameter("type");
        GoodService goodService = new GoodService();
        List<Good> goods = goodService.selectGoodByType(type);
        for (Good good : goods) {
            System.out.println(good);
        }


        request.getSession().setAttribute("types",goods);
        request.getSession().setAttribute("type",type);
        request.getRequestDispatcher("/productBycatalog.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
