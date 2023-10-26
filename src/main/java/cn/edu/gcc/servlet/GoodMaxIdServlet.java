package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.Good;
import cn.edu.gcc.service.GoodService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GoodMaxIdServlet", value = "/GoodMaxIdServlet")
public class GoodMaxIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        GoodService goodService = new GoodService();
        Good good = goodService.maxGoodId();
        int maxid = good.getId();
        String max = String.valueOf(maxid+1);
        response.getWriter().write(max);
    }
}
