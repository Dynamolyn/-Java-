package cn.edu.seu.model;

public class UserPosition {
    private int id;
    private String name;

    public UserPosition() {}

    public UserPosition(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public UserPosition(String name) {
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
        return "UserPosition{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
