package cn.edu.seu.bussiness;

import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.Dish;
import cn.edu.seu.model.Order;
import cn.edu.seu.model.OrderContent;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class Statistics {
    public static List<Order> getHistoryLists(
            String beginTime,
            String endTime
    ) {
        List<Order> orderList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

        Date begin = null;
        Date end = null;

        try {
            begin = sdf.parse(beginTime);
            end = sdf.parse(endTime);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        try {
            for (Object o : DB_Manager.FindAll("Order")) {
                if (((Order) o).getBeginTime().after(begin) &&
                        ((Order) o).getBeginTime().before(end)) {
                    orderList.add((Order) o);
                    System.out.println((Order) o);
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("getHistoryLists" + orderList);

        return orderList;
    }

    public static Date dayBefore(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int day = calendar.get(Calendar.DATE);
        calendar.set(Calendar.DATE, day - 1);

        return calendar.getTime();
    }

    public static Date weekBefore(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int week = calendar.get(Calendar.WEEK_OF_YEAR);
        calendar.set(Calendar.WEEK_OF_YEAR, week - 1);

        return calendar.getTime();
    }

    public static Date monthBefore(Date date) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        int month = calendar.get(Calendar.MONTH);
        calendar.set(Calendar.MONTH, month - 1);

        return calendar.getTime();
    }

    public static List<Integer> getDayCounts() {
        Date date = new Date();

        return orderCounts(dayBefore(date), date);
    }

    public static List<Integer> getWeekCounts() {
        Date date = new Date();

        return orderCounts(weekBefore(date), date);
    }

    public static List<Integer> getMonthCounts() {
        Date date = new Date();

        return orderCounts(monthBefore(date), date);
    }

    //
//    public static Double getDaySum() {
//        Date date = new Date();
//
//        return sales(dayBefore(date), date);
//    }
//
//    public static Double getWeekSum() {
//        Date date = new Date();
//
//        return sales(weekBefore(date), date);
//    }
//
//    public static Double getMonthSum() {
//        Date date = new Date();
//
//        return sales(monthBefore(date), date);
//    }
    public static void main(String[] args) {
        System.out.println(getDishesCounts(3));
    }

    //    返回days天内每一天的销售额
    public static List<Double> getSums(int days) {
        Date today = new Date();
        List<Double> weekSum = new ArrayList<>();
        try {
            List<Object> historyLists = DB_Manager.FindAll("Order");
            System.out.println(historyLists);

            for (int i = 0; i < days; i++) {
                double sum = 0d; // 初始化每天的sum
                for (Object ob : historyLists) {
                    Order order = (Order) ob;
                    if (order.getBeginTime().before(today) &&
                            order.getBeginTime().after(dayBefore(today))) {
                        for (OrderContent oc : order.getFood()) {
                            sum += (oc.getDisNumber() * oc.getDishId().getPrice());
                        }
                    }
                }
                today = dayBefore(today);
                weekSum.add(sum);
                System.out.println((days - i) + " : " + sum);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

//        倒序
        List<Double> result = new ArrayList<>();
        for (int i = 0; i < days; i++) {
            result.add((double) i);
        }
        DecimalFormat df = new DecimalFormat("#.00");
        for (int i = 0; i < days; i++) {
            result.set(days - i - 1, Double.parseDouble(df.format(weekSum.get(i))));
        }

        return result;
    }

    //    返回days天内每一天的订单数量
    public static List<Integer> getOrderCounts(int days) {
        Date today = new Date();
        List<Integer> counts = new ArrayList<>();
        try {
            List<Object> historyLists = DB_Manager.FindAll("Order");
            System.out.println(historyLists);

            for (int i = 0; i < days; i++) {
                int count = 0; // 初始化每天的sum
                for (Object ob : historyLists) {
                    Order order = (Order) ob;
                    if (order.getBeginTime().before(today) &&
                            order.getBeginTime().after(dayBefore(today))) {
                        count++;
                    }
                }
                today = dayBefore(today);
                counts.add(count);
                System.out.println((days - i) + " : " + count);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

//        倒序
        List<Integer> result = new ArrayList<>();
        for (int i = 0; i < days; i++) {
            result.add(i);
        }
        for (int i = 0; i < days; i++) {
            result.set(days - i - 1, counts.get(i));
        }

        return result;
    }

    // 返回days天内每个菜品的销售数量
    public static Map<String, Integer> getDishesCounts(int days) {
        Date today = new Date();
        Map<Integer, Integer> counts = new HashMap<>();

        for (Integer id : ModifyDish.dishHashMap.keySet()) {
            counts.put(id, 0);
        }

        try {
            List<Object> historyLists = DB_Manager.FindAll("Order");
            System.out.println(historyLists);

            for (int i = 0; i < days; i++) {
                for (Object ob : historyLists) {
                    Order order = (Order) ob;
                    if (order.getBeginTime().before(today) &&
                            order.getBeginTime().after(dayBefore(today))) {
                        for (OrderContent oc : order.getFood()) {
                            counts.put(oc.getDishId().getId(), counts.get(oc.getDishId().getId()) + 1);
                        }
                    }
                }
                today = dayBefore(today);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<Temp> temps = new ArrayList<>();
        Temp temp;

        for (Integer id : counts.keySet()) {
            temp = new Temp();
            temp.setId(id);
            temp.setNumber(counts.get(id));
            temps.add(temp);
            String name = ModifyDish.getDish(id).getName();
            System.out.println("id : " + id + ", name : " + name + ", number : " + counts.get(id));
        }
        System.out.println("temps : " + temps);

        temps.sort(new Comparator<Temp>() {
            @Override
            public int compare(Temp o1, Temp o2) {
                if (o1.getNumber() > o2.getNumber())
                    return -1;
                else if (o1.getNumber() < o2.getNumber())
                    return 1;
                else
                    return 0;
            }
        });

        System.out.println("temps sorted: " + temps);

        counts.clear();
        if (temps.size() < 10) {
            for (int i = 0; i < temps.size(); i++) {
//                if (temps.get(i).getNumber() != 0)
                    counts.put(temps.get(i).getId(), temps.get(i).getNumber());
            }
            for(int i = temps.size(); i < 10; i++){
                counts.put(0, 0);
            }
        } else {
            for (int i = 0; i < 10; i++) {
//                if (temps.get(i).getNumber() != 0)
                    counts.put(temps.get(i).getId(), temps.get(i).getNumber());
            }
        }

        String result = "";
        Map<String, Integer> mapResult = new HashMap<>();
        int flag = 0;

        for (Integer id : counts.keySet()) {
            if (flag != 0) {
                result += ",";
            }
            flag++;
            result += ("{value:" + counts.get(id) + ", name:\'" +
                    ModifyDish.getDish(id).getName() + "\'}");
            mapResult.put(ModifyDish.getDish(id).getName(),counts.get(id));
        }
        System.out.println("result : " + result);
        System.out.println("mapResult : " + mapResult);

        return mapResult;
    }

    private static List<Integer> orderCounts(Date begin, Date end) {
        ArrayList<Integer> counts = new ArrayList<>();

        try {
            for (Object ob : DB_Manager.FindAll("Order")) {
                Order order = (Order) ob;
                if (order.getBeginTime().after(begin) && order.getBeginTime().before(end)) {
                    int i = order.getBeginTime().getHours();
                    counts.set(i, counts.get(i) + 1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return counts;
    }

    private static Double sales(Date begin, Date end) {
        Double sum = 0d;

        try {
            for (Object ob : DB_Manager.FindAll("Order")) {
                Order order = (Order) ob;
                if (order.getBeginTime().after(begin) && order.getBeginTime().before(end)) {
                    for (OrderContent orderContent : order.getFood()) {
                        sum += (orderContent.getDisNumber() * orderContent.getDishId().getPrice());
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return sum;
    }
}

class Temp {
    private int id;
    private int number;

    public Temp() {
    }

    public Temp(int id, int number) {
        this.id = id;
        this.number = number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    @Override
    public String toString() {
        return "Temp{" +
                "id=" + id +
                ", number=" + number +
                '}';
    }
}
