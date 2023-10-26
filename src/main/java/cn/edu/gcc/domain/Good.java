package cn.edu.gcc.domain;

public class Good {
    private int id;
    private String goodname;
    private String image;
    private float price;
    private int stock;

    private String type;

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public Good() {
        super();
    }

    public Good(int id, String goodname, String image, float price, int stock) {

        this.id = id;
        this.goodname = goodname;
        this.image = image;
        this.price = price;
        this.stock = stock;
    }

    @Override
    public String toString() {
        return "Good{" +
                "id=" + id +
                ", goodname='" + goodname + '\'' +
                ", image='" + image + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", type='" + type + '\'' +
                '}';
    }
}
