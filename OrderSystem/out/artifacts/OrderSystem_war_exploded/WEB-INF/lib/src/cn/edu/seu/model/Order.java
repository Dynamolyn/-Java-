package cn.edu.seu.model;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Order extends Model{
    private Date beginTime;
    private Date endTime;
    private OrderState state;
    private Integer waiterId;
    private Integer tableId;
    private Set<OrderContent> food;

    public Order() {
        food = new HashSet<>();
    }

    public Order(int id, Date beginTime, Date endTime, OrderState state, Integer waiterId, Integer tableId, Set<OrderContent> food) {
        super(id);
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.state = state;
        this.waiterId = waiterId;
        this.tableId = tableId;
        this.food = food;
        if (this.food==null){
            this.food = new HashSet<>();
        }
    }

    public Order(Date beginTime, Date endTime, OrderState state, Integer waiterId, Integer tableId, Set<OrderContent> food) {
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.state = state;
        this.waiterId = waiterId;
        this.tableId = tableId;
        this.food = food;
        if (this.food==null){
            this.food = new HashSet<>();
        }
    }

    public Order(int id, Date beginTime, Date endTime, OrderState state, Integer waiterId, Integer tableId) {
        super(id);
        this.beginTime = beginTime;
        this.endTime = endTime;
        this.state = state;
        this.waiterId = waiterId;
        this.tableId = tableId;
    }

    public Set<OrderContent> getFood() {
        return food;
    }

    public void setFood(Set<OrderContent> food) {
        this.food = food;
    }

    public Date getBeginTime() {
        return beginTime;
    }

    public void setBeginTime(Date beginTime) {
        this.beginTime = beginTime;
    }

    public Date getEndTime() {
        return endTime;
    }

    public void setEndTime(Date endTime) {
        this.endTime = endTime;
    }

    public OrderState getState() {
        return state;
    }

    public void setState(OrderState state) {
        this.state = state;
    }

    public Integer getWaiterId() {
        return waiterId;
    }

    public void setWaiterId(Integer waiterId) {
        this.waiterId = waiterId;
    }

    public Integer getTableId() {
        return tableId;
    }

    public void setTableId(Integer tableId) {
        this.tableId = tableId;
    }

    @Override
    public String toString() {
        StringBuilder info =new StringBuilder();
        info.append("----------\n");
        info.append("Order id= ");
        info.append(super.getId());
        info.append("\n----------\n[beginTime] ");
        info.append(beginTime);
        info.append("\n[endTime] ");
        info.append(endTime);
        info.append("\n[state] ");
        info.append(state.getName());
        info.append("\n[waiterId] ");
        info.append(waiterId);
        info.append("\n[tableId] ");
        info.append(tableId);
        info.append("\nfood:\n");
        for (OrderContent aOC:food
             ) {
            info.append(aOC.getDishId().getName());
            info.append(" * ");
            info.append(aOC.getDisNumber());
            info.append("\n");
        }
        info.append("----------");
        return info.toString();
    }
}
