package cn.edu.seu.model;

public class Table extends Model{
    private Character isFree;
    private Integer size;

    public Table() {}

    public Table(int id, Character isFree, Integer size) {
        super(id);
        this.isFree = isFree;
        this.size = size;
    }

    public Table(Character isFree, Integer size) {
        this.isFree = isFree;
        this.size = size;
    }

    public Character getIsFree() {
        return isFree;
    }

    public void setIsFree(Character isFree) {
        this.isFree = isFree;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    @Override
    public String toString() {
        return "Table{" +
                "id=" + super.getId() +
                ", isFree=" + isFree +
                ", size=" + size +
                '}';
    }
}
