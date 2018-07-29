package cn.edu.seu.bussiness;

import cn.edu.seu.controller.DishesInfo;
import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.Order;
import cn.edu.seu.model.OrderContent;
import cn.edu.seu.model.OrderState;

import java.util.*;

public class ModifyOrder {

    public static void main(String[] args){
        List<Order> temp = getDynamicList();
    }

    public static Map<Integer, Order> orderPool = new HashMap<>();
    // 动态数据更新缓冲池
    public static List<Order> dynamicPool = new ArrayList<>();
    public static Integer flag = 0;

    private static List<Order> getOrders(String state){
        List<Order> orders = new ArrayList<>();

        for(Integer id : orderPool.keySet()){
            Order order = orderPool.get(id);
            if(order.getState().getName().equals(state)){
                orders.add(order);
            }
        }
        return orders;
    }

    public static Double getHistorySum(int id){
        Order order = null;
        try {
            order = (Order) DB_Manager.FindByID(Order.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        double sum = 0d;
        for(OrderContent oc : order.getFood()){
            sum += (oc.getDisNumber() * oc.getDishId().getPrice());
        }

        return sum;
    }

    public static Double getOrderSum(int id){
        Order order = orderPool.get(id);

        double sum = 0d;
        for(OrderContent oc : order.getFood()){
            sum += (oc.getDisNumber() * oc.getDishId().getPrice());
        }
        return sum;
    }

    public static List<Order> getWaitingOrders(){
        return getOrders("waiting");
    }

    public static List<Order> getFinishedOrders(){
        return getOrders("finished");
    }

    public static List<Order> getDynamicList() {
        List<Order> temp = new ArrayList<>();

        for(Order order : dynamicPool){
            temp.add(order);
        }

        return temp;
    }

    // 客户点餐完毕，服务员创建初始订单（近期）
    public static boolean orderCreate(
            Integer waiterId,
            ArrayList<DishesInfo> dishesInfos
    ) {
        Order order = new Order();

        Date present = new Date();

        order.setId(0);
        order.setBeginTime(present); // 订单开始时间为当前时间
        order.setEndTime(present); // 订单结束时间默认设置为订单创建时间

        /**
         * orderState
         * 1->waiting
         * 2->finished
         * 3->paid
         * 4->abnormal
         */

        order.setState(Init.getOrderState("waiting"));
        order.setWaiterId(waiterId);
        order.setTableId(Integer.parseInt((dishesInfos.get(0)).getTableNum()));

        // 首先往数据库中存入订单基本信息，订单内容为空
        Set<OrderContent> food = new HashSet<OrderContent>();
        order.setFood(food);

        try {
            DB_Manager.Save(order); // 更新id值
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        // 调用修改订单内容方法为订单添加内容
        System.out.println(dishesInfos);
        System.out.println(order.getId());

        orderPool.put(order.getId(), order);
        System.out.println(orderPool);

        modifyOrderContent(order.getId(), dishesInfos);
        dynamicPool.add(order);

//        System.out.println("orderPool" + orderPool);
//        System.out.println("dynamicPool" + dynamicPool);

        return true;
    }

    // 客户由于各种原因需要修改订单内容（近期）
    public static boolean modifyOrderContent(
            int id,
            ArrayList<DishesInfo> dishesInfos
    ) {
        try {
            Order order = orderPool.get(id);
            System.out.println(order);
            Set<OrderContent> food = new HashSet<OrderContent>();

            // 根据参数dishesInfo创建订单内容
            OrderContent orderContent;

            for (DishesInfo dishInfo : dishesInfos) {
                orderContent = new OrderContent();
                orderContent.setOrderId(order);
                orderContent.setDishId(ModifyDish.getDish(Integer.parseInt(dishInfo.getdishesId())));
                orderContent.setDisNumber(Integer.parseInt(dishInfo.getNumber()));
                food.add(orderContent);
                System.out.println(orderContent);
            }

            System.out.println("test : " + food);

            order.setFood(food);
            DB_Manager.SaveOrUpdate(order);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    // 修改订单状态为finished（近期）
    public static boolean orderFinished(
            int id
    ) {
        try {
            OrderState orderState = Init.getOrderState("finished");
            System.out.println(id);
            System.out.println(orderState);

            System.out.println("orderPool.get(id)" + orderPool.get(id));
            orderPool.get(id).setState(orderState);
            orderPool.put(orderPool.get(id).getId(), orderPool.get(id));
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

        return true;
    }

    // 客户结账后，设置订单结束时间，把订单从内存中删除，并且存入数据库（近期->历史）
    public static boolean orderPaid(
            int id
    ) {
        Order order = orderPool.get(id);
        order.setEndTime(new Date()); // 设置当前时间为结束时间

        try {
            OrderState orderState = Init.getOrderState("paid");
            order.setState(orderState);
            DB_Manager.SaveOrUpdate(order); // 订单存入数据库
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        orderPool.remove(order.getId()); // 订单从内存中删除
        return true;
    }

    // 把订单从内存中删除（近期）
    public static void deleteOrder(int id) {
        // 直接将订单从服务器的内存中删除，不用将其传入数据库中
        orderPool.remove(id);
    }

    // 获得所有订单（历史）
    public static List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();

        try {
            for (Object ob : DB_Manager.FindAll("Order")) {
                orders.add((Order) ob);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        orders.sort(new MyComparator<Order>());

        return orders;
    }

    // 获得某个订单详细信息（历史）
    public static Order getOrder(int id) {
        Order order = new Order();

        try {
            order = (Order) DB_Manager.FindByID(Order.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return order;
    }
    // 历史订单不存在删除和修改操作

    public static void cookDeleteDish(
            String orderId,
            String dishName
    ){
        Order order = orderPool.get(Integer.parseInt(orderId));
        System.out.println("cookDeleteDish order : " + order);
        System.out.println("orderPool before：" + orderPool);
        for(OrderContent oc : order.getFood()){
            if(dishName.equals(oc.getDishId().getName())){
                order.getFood().remove(oc);
                System.out.println("Dish remove : " + oc);
                break;
            }
        }

        System.out.println("orderPool After：" + orderPool);
    }

    public static void waiterDeleteOrder(
            String orderId
    ){
        orderPool.remove(Integer.parseInt(orderId));
    }
}
