package cn.edu.gcc.domain;

public class Cart {
    private Good good;
    private int amount;//数量
    private double count;//总价


    public Good getGood() {
        return good;
    }

    public void setGood(Good good) {
        this.good = good;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public double getCount() {
        count = getAmount() * getGood().getPrice();
        return count;
    }

    public void setCount(double count) {
        this.count = count;
    }
}
