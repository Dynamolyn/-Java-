package cn.edu.seu.model;

public class OrderState {
    private int id;
    private String name;

    public OrderState() {}

    public OrderState(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public OrderState(String name) {
        this.name = name;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "OrderState{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
