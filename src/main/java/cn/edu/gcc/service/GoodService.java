package cn.edu.gcc.service;

import cn.edu.gcc.dao.GoodDao;
import cn.edu.gcc.domain.Good;
import cn.edu.gcc.utils.DButil;
import com.alibaba.fastjson.JSONObject;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class GoodService {
    private static GoodDao goodDao = new GoodDao();
    private static DButil dButil = new DButil();

    public List<Good> goodSelectAll() {
        List<Good> good = null;
        try {
            good = goodDao.selectGoodAll();
            dButil.closeConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return good;
    }
    public List<Good> selectGoodByType(String type){
        List<Good> good = null;
        try {

             good=goodDao.selectGoodByType(type);
             dButil.closeConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return good;
    }

    public Good selectGoodById(int id){
        try {
           return goodDao.selectGoodById(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public List<Good> likeBysearch(String likename){
        try {
            return  goodDao.likeBysearch(likename);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    public Good maxGoodId(){
        try {
           return goodDao.maxGoodId();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public int addGood(Map<String, Object> good){
        try {
            return goodDao.addGood(good);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public int modifyGood(Map<String,Object> good){
        try {
            return goodDao.modifyGood(good);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public int deleteGood(int id){
        try {
            return goodDao.deleteGood(id);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }


}
