package cn.edu.gcc.dao;

import cn.edu.gcc.domain.User;
import cn.edu.gcc.utils.DButil;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class UserDao {
    private static QueryRunner qr = new QueryRunner(DButil.getDataSource());
    public boolean selectisUsernameExit(String username) throws SQLException {
        User uquery = qr.query("select * from user where username = ?",new BeanHandler<User>(User.class) ,username);
        if(uquery==null){
            return true;
        }else {
            return false;
        }
    }

    public User selectByUsernamePassword(String username,String password) throws SQLException {
        return qr.query("select * from user where username = ? and password = ?",new BeanHandler<User>(User.class),username,password);
    }
    public boolean modifyUserInfo(String name,String phone,String address,String username)  {
        try {
            qr.update("update user set name = ?,phone = ?,address = ? where username = ?",name,phone,address,username);
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }

    }
    public boolean addUser(User user){
        try {

            qr.update("insert into user values(null,?,?,?,?,?,?,?)",user.getUsername(),user.getEmail(),user.getPassword(),user.getName(),user.getPhone(),user.getAddress(),user.getIsadmin());
            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;

        }
    }

    public List<User> selectAllUser() throws SQLException {
        return qr.query("select * from user",new BeanListHandler<User>(User.class));
    }

    public User selectByid(int id) throws SQLException {
        return qr.query("select * from user where id = ?",new BeanHandler<User>(User.class),id);
    }

    public int delectUser(int id) throws SQLException {
        return qr.update("DELETE from user where id = ?",id);
    }

    public int modifyUser(JSONObject json) throws SQLException {
        return qr.update("update user set `id`=?,`username`=?,`email`=?,`password`=?,`name`=?," +
                        "`phone`=?,`address`=?,`isadmin`=? where `id` = ?",json.get("id"),json.get("username"),
                json.get("email"),json.get("password"),json.get("name"),json.get("phone"),json.get("address"),json.get("isadmin"),json.get("id"));
    }

    public int modifyPassword(int id,String password) throws SQLException {
        return qr.update("update user set `password`=? where `id` = ?",password,id);
    }
}
