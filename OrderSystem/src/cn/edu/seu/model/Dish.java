package cn.edu.seu.model;

public class Dish extends Model{
    private String name;
    private String description;
    private String txt;
    private String img;
    private Character isRecommended;
    private Float price;

    public Dish() {
    }

    public Dish(int id, String name, String description, String txt, String img, Character isRecommended, Float price) {
        super(id);
        this.name = name;
        this.description = description;
        this.txt = txt;
        this.img = img;
        this.isRecommended = isRecommended;
        this.price = price;
    }

    public Dish(String name, String description, String txt, String img, Character isRecommended, Float price) {
        this.name = name;
        this.description = description;
        this.txt = txt;
        this.img = img;
        this.isRecommended = isRecommended;
        this.price = price;
    }

    public Dish(String name, String description, String txt, String img, Character isRecommended, double price) {
        this.name = name;
        this.description = description;
        this.txt = txt;
        this.img = img;
        this.isRecommended = isRecommended;
        setPrice(price);
    }

    public Dish(String name, String description, String txt, String img, Character isRecommended, Double price) {
        this.name = name;
        this.description = description;
        this.txt = txt;
        this.img = img;
        this.isRecommended = isRecommended;
        setPrice(price);
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTxt() {
        return txt;
    }

    public void setTxt(String txt) {
        this.txt = txt;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Character getIsRecommended() {
        return isRecommended;
    }

    public void setIsRecommended(Character isRecommended) {
        this.isRecommended = isRecommended;
    }

    public Float getPrice() {
        return price;
    }

    public void setPrice(Float price) {
        this.price = price;
    }
    public void setPrice(Double price) { this.price = price.floatValue();}
    public void setPrice(double price) { this.price = new Float((float)price);}


    @Override
    public String toString() {
        return "Dish{" +
                "id=" + super.getId() +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", txt='" + txt + '\'' +
                ", img='" + img + '\'' +
                ", isRecommended=" + isRecommended +
                ", price=" + price +
                '}';
    }
}
