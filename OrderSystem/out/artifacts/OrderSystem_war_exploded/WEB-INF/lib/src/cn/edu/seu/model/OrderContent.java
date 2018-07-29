package cn.edu.seu.model;

public class OrderContent extends Model{
    private Dish dishId;
    private Integer disNumber;
    private Order orderId;

    public OrderContent() {
    }

    public OrderContent(int id, Dish dishId, Integer disNumber, Order orderId) {
        super(id);
        this.dishId = dishId;
        this.disNumber = disNumber;
        this.orderId = orderId;
    }

    public OrderContent(Dish dishId, Integer disNumber, Order orderId) {
        this.dishId = dishId;
        this.disNumber = disNumber;
        this.orderId = orderId;
    }

    public Order getOrderId() {
        return orderId;
    }

    public void setOrderId(Order orderId) {
        this.orderId = orderId;
    }

    public Dish getDishId() {
        return dishId;
    }

    public void setDishId(Dish dishId) {
        this.dishId = dishId;
    }

    public Integer getDisNumber() {
        return disNumber;
    }

    public void setDisNumber(Integer disNumber) {
        this.disNumber = disNumber;
    }


    @Override
    public String toString() {
        return "OrderContent{" +
                "id=" + super.getId() +
                ", dishId=" + dishId.getName() +
                ", disNumber=" + disNumber +
                ", orderId=" + orderId.getId() +
                '}';
    }
}
