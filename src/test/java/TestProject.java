import cn.edu.gcc.dao.GoodDao;
import cn.edu.gcc.dao.OrderDao;
import cn.edu.gcc.domain.Good;
import cn.edu.gcc.domain.Order;
import cn.edu.gcc.domain.User;
import cn.edu.gcc.service.GoodService;
import cn.edu.gcc.utils.DButil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.junit.Test;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class TestProject {


    @Test
    public void test1() throws SQLException {

        QueryRunner qr = new QueryRunner(DButil.getDataSource());
        User user = qr.query("select * from user",new BeanHandler<User>(User.class));
        System.out.println(user);
    }

    @Test
    public void test2() throws SQLException {


        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = new Date(System.currentTimeMillis());
        String format = simpleDateFormat.format(date);
        System.out.println(format);

    }
    @Test
    public void test3(){
        OrderDao orderDao = new OrderDao();
        try {
            List<Order> orders = orderDao.queryOrder();
            for (Order order : orders) {
                System.out.println(order.getUsername());
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Test
    public void test4(){
        GoodService goodService = new GoodService();
        List<Good> likename = goodService.likeBysearch("萝");
        for (Good good : likename) {
            System.out.println(good.toString());
        }
    }

    @Test
    public void test5(){
        String a = "D:\\fruitshop\\out\\artifacts\\fruitshop_war_exploded\\picture\\product\\3.jpg";
        System.out.println(a);
        String[] arr1=a.split("\\\\",6);
        for (int i =0 ; i<arr1.length;i++){
            System.out.println(arr1[i]);
        }
        String b = arr1[0]+"\\"+arr1[1]+"\\"+"web\\"+arr1[5];
        System.out.println(b);
        System.out.println(arr1[5]);


    }
}
