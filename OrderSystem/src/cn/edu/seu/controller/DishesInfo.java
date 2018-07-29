package cn.edu.seu.controller;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
@JsonIgnoreProperties(ignoreUnknown = true)
//忽略未知属性
public class DishesInfo {

        private String name;
        private String dishesId;
        private String number;
        private String tableNum;
        private String orderId;

        public DishesInfo() {
           // super();
        }

        public DishesInfo(String name, String dishesId, String number, String tableNum,String orderId) {
           // super();
            this.orderId = orderId;
            this.name = name;
            this.dishesId = dishesId;
            this.number = number;
            this.tableNum = tableNum;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getdishesId() {
            return dishesId;
        }

        public void setdishesId(String dishesId) {
            this.dishesId = dishesId;
        }

        public String getNumber() {
            return number;
        }

        public void setNumber(String number) {
            this.number = number;
        }

        public String getTableNum() {
            return tableNum;
        }

        public void setTableNum(String tableNum) {
            this.tableNum = tableNum;
        }


        @Override
        public String toString() {
            return "dishesInfo {"
                    + "name=" + name + ","
                    + "ID=" + orderId + ","
                    + "ID=" + dishesId + ","
                    + "number=" + number + ","
                    + "tableNum=" + tableNum
                    + "}";
        }


    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public String getOrderId() {
        return orderId;
    }
}
