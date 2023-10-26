package cn.edu.gcc.service;

import cn.edu.gcc.dao.UserDao;
import cn.edu.gcc.domain.User;
import cn.edu.gcc.utils.DButil;
import com.alibaba.fastjson.JSONObject;

import java.sql.SQLException;
import java.util.List;

public class UserService {
    UserDao userDao = new UserDao();
//    DButil dButil = new DButil();

    public List<User> selectAlluser()  {
        try {
            return userDao.selectAllUser();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //异步判断用户名是否重复
    public boolean register_selectisUsernameExit(String username){
        try {
            if(userDao.selectisUsernameExit(username)){
                return true;

            }else {
                return false;
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    //添加用户
    public boolean register(User user){
       return userDao.addUser(user);

    }

    public boolean modifyUserInfo(String name,String phone,String address,String username){

        return userDao.modifyUserInfo(name,phone,address,username);
    }

    //登录
    public User login (String username,String password){

        User user = null;
        try {
            user = userDao.selectByUsernamePassword(username, password);
            System.out.println(user);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        if(user!=null){
            return user;
        }
        return null;
    }
    public User selectFromId(int id){
        try {
            return userDao.selectByid(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public int userDelete(int id){
        try {
            return userDao.delectUser(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int modifyUser(JSONObject json){
        try {
            return userDao.modifyUser(json);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int modifyPassword(int id, String password){
        try {
            return userDao.modifyPassword(id,password);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
