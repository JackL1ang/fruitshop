package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.Good;
import cn.edu.gcc.service.GoodService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "searchGoodsServlet", value = "/searchGoodsServlet")
public class searchGoodsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String likename = request.getParameter("likename");
        GoodService goodService = new GoodService();
        List<Good> likenames = goodService.likeBysearch(likename);
        for (Good good : likenames) {
            System.out.println(good.toString());
        }
        System.out.println(likename);

        //查询到的值
        request.setAttribute("likenames",likenames);
        //用户输入想要查询的值
        request.setAttribute("likename",likename);
        request.getRequestDispatcher("/search.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
