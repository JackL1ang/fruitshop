package cn.edu.gcc.dao;

import cn.edu.gcc.domain.Cart;
import cn.edu.gcc.domain.Order;
import cn.edu.gcc.utils.DButil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class OrderDao {
    private static QueryRunner qr = new QueryRunner(DButil.getDataSource());
    public void addOrder(Order order) throws SQLException {

        //订单号 、用户id、商品id、支付方式、时间、状态,数量，价格
        for (Map.Entry<Integer,Cart> cart:order.getItemMap().entrySet()){
            int id = cart.getValue().getGood().getId();
            int amount = cart.getValue().getAmount();
            double count = cart.getValue().getCount();
            qr.update("insert into `order` values(null,?,?,?,?,?,?,?)",order.getUser().getId(),id,order.getpayinfo(),order.getDatetime(),order.getStatus(),amount,count);
        }

    }
    public List<Order> queryOrder() throws SQLException {
        return qr.query("select o.id,o.payinfo,o.datetime,o.status,o.amount,o.count,g.goodname,g.image,u.username,u.name,u.phone,u.address from `order` as o INNER JOIN user as u ON o.user_id = u.id INNER JOIN good as g ON o.good_id = g.id GROUP BY o.id",new BeanListHandler<Order>(Order.class));
    }

    public List<Order> queryOrderByUser(int id) throws SQLException {
        return qr.query("select o.id,o.payinfo,o.datetime,o.status,o.amount,o.count,g.goodname,g.image,u.username,u.name,u.phone,u.address FROM `order` o join `user` u on o.user_id = u.id JOIN `good` g ON o.good_id=g.id WHERE o.user_id=?",new BeanListHandler<Order>(Order.class),id);
    }
    public int modifyOrderType(int type,int id) throws SQLException {
        return qr.update("update `order` set `status`=? where `id` = ?",type,id);
    }
    public int deleteOrder(int id) throws SQLException {
        return qr.update("delete from `order` where`id`= ?",id);
    }
}
