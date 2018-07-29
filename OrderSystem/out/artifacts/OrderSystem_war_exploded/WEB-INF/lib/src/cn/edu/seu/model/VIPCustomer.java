package cn.edu.seu.model;

public class VIPCustomer extends Model{
    private String name;
    private Character sex;
    private String phoneNumber;
    private Integer dinningTimes;
    private Float dinningSum;

    public VIPCustomer() {}

    public VIPCustomer(int id, String name, Character sex, String phoneNumber,
                       Integer dinningTimes, Float dinningSum) {
        super(id);
        this.name = name;
        this.sex = sex;
        this.phoneNumber = phoneNumber;
        this.dinningTimes = dinningTimes;
        this.dinningSum = dinningSum;
    }

    public VIPCustomer(String name, Character sex, String phoneNumber, Integer dinningTimes, Float dinningSum) {
        this.name = name;
        this.sex = sex;
        this.phoneNumber = phoneNumber;
        this.dinningTimes = dinningTimes;
        this.dinningSum = dinningSum;
    }

    public VIPCustomer(String name, Character sex, String phoneNumber, Integer dinningTimes, double dinningSum) {
        this.name = name;
        this.sex = sex;
        this.phoneNumber = phoneNumber;
        this.dinningTimes = dinningTimes;
        setDinningSum(dinningSum);
    }

    public VIPCustomer(String name, Character sex, String phoneNumber, Integer dinningTimes, Double dinningSum) {
        this.name = name;
        this.sex = sex;
        this.phoneNumber = phoneNumber;
        this.dinningTimes = dinningTimes;
        setDinningSum(dinningSum);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Character getSex() {
        return sex;
    }

    public void setSex(Character sex) {
        this.sex = sex;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public Integer getDinningTimes() {
        return dinningTimes;
    }

    public void setDinningTimes(Integer dinningTimes) {
        this.dinningTimes = dinningTimes;
    }

    public Float getDinningSum() {
        return dinningSum;
    }

    public void setDinningSum(Float dinningSum) {
        this.dinningSum = dinningSum;
    }
    public void setDinningSum(Double dinningSum) {
        this.dinningSum = dinningSum.floatValue();
    }
    public void setDinningSum(double dinningSum) { this.dinningSum = (float) dinningSum; }

    @Override
    public String toString() {
        return "VIPCustomer{" +
                "id=" + super.getId() +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", dinningTimes=" + dinningTimes +
                ", dinningSum=" + dinningSum +
                '}';
    }
}
