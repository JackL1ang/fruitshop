package cn.edu.gcc.service;

import cn.edu.gcc.dao.OrderDao;
import cn.edu.gcc.domain.Order;
import cn.edu.gcc.utils.DButil;

import java.sql.SQLException;
import java.util.List;

public class OrderService {
    OrderDao orderDao=new OrderDao();
    DButil dButil = new DButil();
    public int addOrder(Order order){
        try {
             orderDao.addOrder(order);
             return 1;
        } catch (SQLException e) {
            return 0;
        }
    }

    public List<Order> queryOrder(){
        try {
           return orderDao.queryOrder();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Order> queryOrderByUser(int id){
        List<Order> orders =  null;
        try {
            orders = orderDao.queryOrderByUser(id);
            dButil.closeConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return orders;
    }
    public int modifyOrderType(int type,int id){
        try {
            return orderDao.modifyOrderType(type,id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int deleteOrder(int id){
        try {
            return orderDao.deleteOrder(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
