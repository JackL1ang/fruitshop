package cn.edu.gcc.servlet;

import cn.edu.gcc.domain.Good;
import cn.edu.gcc.service.GoodService;
import cn.edu.gcc.utils.DButil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "AdminGoodList", value = "/AdminGoodList")
public class AdminGoodList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GoodService goodService = new GoodService();
        List<Good> goods = goodService.goodSelectAll();
        req.getSession().setAttribute("good",goods);
        for (Good good : goods) {
            System.out.println(good);
        }
        req.getRequestDispatcher("/admin/adminAllGood.jsp").forward(req,resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
