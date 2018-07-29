package cn.edu.seu.model;

public class User extends Model{
    private String account;
    private String pwd;
    private Character isLocked;
    private String faceImg;
    private String name;
    private Character sex;
    private String phoneNumber;
    private String address;
    private UserPosition position;

    public User() {}

    public User(int id, String account, String pwd, Character isLocked, String faceImg, String name, Character sex, String phoneNumber, String address, UserPosition position) {
        super(id);
        this.account = account;
        this.pwd = pwd;
        this.isLocked = isLocked;
        this.faceImg = faceImg;
        this.name = name;
        this.sex = sex;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.position = position;
    }

    public User(String account, String pwd, Character isLocked, String faceImg, String name, Character sex, String phoneNumber, String address, UserPosition position) {
        this.account = account;
        this.pwd = pwd;
        this.isLocked = isLocked;
        this.faceImg = faceImg;
        this.name = name;
        this.sex = sex;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.position = position;
    }

    public Character getIsLocked() {
        return isLocked;
    }

    public void setIsLocked(Character isLocked) {
        this.isLocked = isLocked;
    }

    public UserPosition getPosition() {
        return position;
    }

    public void setPosition(UserPosition position) {
        this.position = position;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }


    public String getFaceImg() {
        return faceImg;
    }

    public void setFaceImg(String faceImg) {
        this.faceImg = faceImg;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + super.getId() +
                ", account='" + account + '\'' +
                ", pwd='" + pwd + '\'' +
                ", isLocked=" + isLocked +
                ", faceImg='" + faceImg + '\'' +
                ", name='" + name + '\'' +
                ", sex=" + sex +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", address='" + address + '\'' +
                ", position=" + position.getName() +
                '}';
    }
}
