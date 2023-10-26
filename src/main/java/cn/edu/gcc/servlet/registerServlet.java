package cn.edu.gcc.servlet;

import cn.edu.gcc.dao.UserDao;
import cn.edu.gcc.domain.User;
import cn.edu.gcc.service.UserService;
import org.apache.commons.beanutils.BeanUtils;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.Map;

@WebServlet(name = "registerServlet", value = "/registerServlet")
public class registerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User user = new User();
        UserService uService = new UserService();
        try {
            //获取前端的Map复制到userBean中
            BeanUtils.copyProperties(user, request.getParameterMap());
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InvocationTargetException e) {
            throw new RuntimeException(e);
        }
        boolean register = uService.register(user);
        System.out.println(register);
        if(register){
            response.getWriter().write("1");
        }else {
            response.getWriter().write("0");
        }

    }
}
