package cn.edu.gcc.domain;

import java.time.LocalDate;
import java.util.*;

public class Order {
    private int id;
    private float count;//总价
    private int amount;// 商品总数

    private String goodname;

    private String image;
    private int status;//1已付款/2已发货/3已完成
    private int payinfo;//1微信/2支付宝/3货到付款
    private String name;
    private String phone;
    private String address;
    private String datetime;
    private String username;
    private User user;
    private Map<Integer,Cart> itemMap = new HashMap<Integer,Cart>();

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getpayinfo() {
        return payinfo;
    }

    public void setpayinfo(int payinfo) {
        this.payinfo = payinfo;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public float getCount() {
        return count;
    }

    public void setCount(float count) {
        this.count = count;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {

        this.datetime = datetime;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Map<Integer, Cart> getItemMap() {
        return itemMap;
    }

    public void setItemMap(Map<Integer, Cart> itemMap) {
        this.itemMap = itemMap;
    }

    @Override
    public String toString() {
        return "Order{" +
                "id=" + id +
                ", count=" + count +
                ", amount=" + amount +
                ", goodname='" + goodname + '\'' +
                ", image='" + image + '\'' +
                ", status=" + status +
                ", payinfo=" + payinfo +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", datetime='" + datetime + '\'' +
                ", username='" + username + '\'' +
                '}';
    }
}
