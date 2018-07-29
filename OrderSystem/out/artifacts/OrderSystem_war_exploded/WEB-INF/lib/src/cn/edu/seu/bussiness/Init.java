package cn.edu.seu.bussiness;

import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.OrderState;
import cn.edu.seu.model.UserPosition;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class Init {
    private static HashMap<String, UserPosition> userPositions = new HashMap<>();
    private static HashMap<String, OrderState> orderStates = new HashMap<>();
    private static String broadcast = "";

    public static String getBroadcast() {
        return broadcast;
    }

    public static void setBroadcast(String broadcast) {
        Init.broadcast = broadcast;
    }

    static {
        try {
            System.out.println("Init start");
            DB_Manager.getHandler();

            for (Object up : DB_Manager.FindAll("UserPosition")) {
                UserPosition aup =(UserPosition)up;
                userPositions.put(aup.getName(),aup);
            }
            for (Object os : DB_Manager.FindAll("OrderState")) {
                OrderState aos =(OrderState)os;
                orderStates.put(aos.getName(),aos);
            }

            System.out.println(ModifyOrder.class.getName());
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    public static HashMap<String, UserPosition> getUserPositions() {
        return userPositions;
    }

    public static HashMap<String, OrderState> getOrderStates() {
        return orderStates;
    }

    public static UserPosition getUserPosition(String userPosition) {
       return userPositions.get(userPosition);
    }

    public static OrderState getOrderState(String orderState) {
        return orderStates.get(orderState);
    }
}
