package cn.edu.gcc.servlet;

import cn.edu.gcc.service.GoodService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AdminDeleteGoodServlet", value = "/AdminDeleteGoodServlet")
public class AdminDeleteGoodServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        GoodService goodService = new GoodService();
        int i = goodService.deleteGood(Integer.parseInt(id));
        if (i==1){
            request.getRequestDispatcher("/AdminGoodList").forward(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
