package cn.edu.gcc.utils;


import com.mchange.v2.c3p0.ComboPooledDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DButil {
    //获得数据源
    private static DataSource ds = new ComboPooledDataSource();

    //添加getDataSource()方法
    public static DataSource getDataSource() {
        return  ds;
    }

    public static Connection getConnection() throws SQLException {
        return ds.getConnection();
    }
    public void closeConnection() throws SQLException {
        getConnection().close();
    }


}
