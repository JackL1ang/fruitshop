package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.Good;
import cn.edu.gcc.service.GoodService;
import com.alibaba.fastjson.JSON;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "GoodSelectByIdServlet", value = "/GoodSelectByIdServlet")
public class GoodSelectByIdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("id");
        System.out.println(id);
        GoodService goodService = new GoodService();
        Good good = goodService.selectGoodById(Integer.parseInt(id));
        System.out.println(good.toString());
        String s = JSON.toJSONString(good);
        System.out.println(s);
        response.getWriter().write(s);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
