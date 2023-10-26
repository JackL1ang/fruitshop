package cn.edu.gcc.dao;

import cn.edu.gcc.domain.Good;
import cn.edu.gcc.utils.DButil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public class GoodDao {
    private static QueryRunner qr = new QueryRunner(DButil.getDataSource());
    public List<Good> selectGoodAll() throws SQLException {
        return qr.query("select * from good",new BeanListHandler<Good>(Good.class));

    }

    public List<Good> selectGoodByType(String type) throws SQLException {
        return qr.query("select * from good where type = ?",new BeanListHandler<Good>(Good.class),type);
    }

    public Good selectGoodById(int id) throws SQLException {
        return qr.query("select * from good where id = ?",new BeanHandler<Good>(Good.class),id);
    }

    public List<Good> likeBysearch(String likename) throws SQLException {
        return qr.query("select * from good where goodname like ?",new BeanListHandler<Good>(Good.class),"%"+likename+"%");
    }

    public Good maxGoodId() throws SQLException {
        return qr.query("select max(id) id from `good`",new BeanHandler<Good>(Good.class));
    }
    public int addGood(Map<String, Object> goods) throws SQLException {
        return qr.update("insert into good values(?,?,?,?,?,?)",goods.get("goodid"),goods.get("goodname"),goods.get("images"),goods.get("price"),goods.get("amount"),goods.get("type"));
    }

    public int modifyGood(Map<String,Object> goods) throws SQLException {
        if(goods.get("images")==null){
            return qr.update("update good set `id`= ?,`goodname`=?,`image`=?,`price`=?,`stock`=?,`type` = ? where `id`= ?",goods.get("goodid"),goods.get("goodname"),goods.get("image"),goods.get("price"),goods.get("amount"),goods.get("type"),goods.get("goodid"));
        }else{
            return qr.update("update good set `id`= ?,`goodname`=?,`image`=?,`price`=?,`stock`=?,`type` = ? where `id`= ?",goods.get("goodid"),goods.get("goodname"),goods.get("images"),goods.get("price"),goods.get("amount"),goods.get("type"),goods.get("goodid"));
        }

    }

    public int deleteGood(int id) throws SQLException {
        return qr.update("DELETE from good where id = ?",id);
    }
}
