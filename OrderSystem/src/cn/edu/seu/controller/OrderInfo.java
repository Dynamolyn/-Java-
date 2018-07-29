package cn.edu.seu.controller;

import cn.edu.seu.model.OrderContent;

import java.util.Set;

public class OrderInfo {
    private int id;
    private int tableId;
    private String beginTime;
    private String endTime;
    private Double price;
    private Double selePrice;
    private Set<DishSimpleInfo> food;

    public OrderInfo(){}

    public OrderInfo(int id, int tableId, String beginTime, String endTime, Double price, Double selePrice, Set<DishSimpleInfo> food) {
        this.id = id;
        this.tableId = tableId;
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.price = price;
        this.selePrice = selePrice;
        this.food = food;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTableId(int tableId) {
        this.tableId = tableId;
    }

    public void setBeginTime(String beginTime) {
        this.beginTime = beginTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setSelePrice(Double selePrice) {
        this.selePrice = selePrice;
    }

    public void setFood(Set<DishSimpleInfo> food) {
        this.food = food;
    }

    public int getId() {
        return id;
    }

    public int getTableId() {
        return tableId;
    }

    public String getBeginTime() {
        return beginTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public Double getPrice() {
        return price;
    }

    public Double getSelePrice() {
        return selePrice;
    }

    public Set<DishSimpleInfo> getFood() {
        return food;
    }

    @Override
    public String toString() {
        return "OrderInfo{" +
                "id=" + id +
                ", tableId=" + tableId +
                ", beginTime='" + beginTime + '\'' +
                ", endTime='" + endTime + '\'' +
                ", price=" + price +
                ", selePrice=" + selePrice +
                ", food=" + food +
                '}';
    }
}
