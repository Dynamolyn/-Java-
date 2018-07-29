package cn.edu.seu.controller;

public class DishSimpleInfo {
    private String dishName;
    private int num;
    private float price;


    public DishSimpleInfo()
    {}

    public DishSimpleInfo(String dishName, int num,float price) {
        this.dishName = dishName;
        this.num = num;
        this.price = price;
    }

    public void setDishName(String dishName) {
        this.dishName = dishName;
    }

    public void setNum(int num) {
        this.num = num;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getDishName() {
        return dishName;
    }

    public int getNum() {
        return num;
    }

    public float getPrice() {
        return price;
    }


}
