package cn.edu.seu.controller;

import cn.edu.seu.bussiness.ModifyDish;
import cn.edu.seu.bussiness.ModifyOrder;
import cn.edu.seu.bussiness.Statistics;
import cn.edu.seu.model.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.util.*;

import static cn.edu.seu.bussiness.Statistics.getDishesCounts;

@Controller
public class ManagerDataAction {
    @RequestMapping(value = "/searchOrderData.do",method = RequestMethod.POST)
    public void searchOrderData(HttpServletRequest request, HttpServletResponse response){
        List<Order> orderList = Statistics.getHistoryLists(request.getParameter("beginData"),request.getParameter("endData"));
        System.out.println("ManagerDataAction" + orderList);
        List<OrderInfo> orderInfoList =  new ArrayList<>();
        OrderInfo orderInfo;
        DecimalFormat df = new DecimalFormat("#.00");
        for(Order order:orderList){
            System.out.println("order : " + order);
            orderInfo = new OrderInfo();
            orderInfo.setId(order.getId());
            System.out.println("id");
            orderInfo.setTableId(order.getTableId());
            System.out.println("table id : ");
            orderInfo.setBeginTime(order.getBeginTime().toString());
            System.out.println("beginTime : ");
            Double price  = Double.parseDouble(df.format(ModifyOrder.getHistorySum(order.getId())));
            orderInfo.setSelePrice(price);
            System.out.println("price : ");
            orderInfoList.add(orderInfo);

            System.out.println("orderINfo : ");
            System.out.println(orderInfo);
        }
        try {
            PrintWriter p = response.getWriter();
            System.out.println("Json" + DataFactory.documentToJson(orderInfoList));
            if(DataFactory.documentToJson(orderInfoList).isEmpty())
                p.write("null");
            else
            p.write(DataFactory.documentToJson(orderInfoList));
            p.flush();
            p.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }



    //data
    @RequestMapping(value = "/chartsData.do",method = RequestMethod.POST)
    public void chartsData(HttpServletRequest request, HttpServletResponse response){
        request.getParameter("req");

        List<Integer> orderCounts = Statistics.getOrderCounts(7);
        List<Double> sums = Statistics.getSums(7);
        List<Integer> orderCountsM = Statistics.getOrderCounts(30);
        List<Double> sumsM = Statistics.getSums(30);

        Map<String, Object> myMap = new HashMap<String,Object>();
       // int []a = new int[]{1,23,57,80,24,56,70};
        //myMap.put("map",a);
        System.out.println(DataFactory.documentToJson(orderCounts.toArray()));
        System.out.println(DataFactory.documentToJson(sums.toArray()));
        myMap.put("orderWeek",orderCounts.toArray());
        myMap.put("moneyWeek",sums.toArray());
        myMap.put("orderMon",orderCountsM.toArray());
        myMap.put("moneyMon",sumsM.toArray());

        Map<String, Integer> temp = getDishesCounts(10);
        List<String> names = new ArrayList<>();
        List<Integer> numbers = new ArrayList<>();
        for(String name : temp.keySet()){
            names.add(name);
            numbers.add(temp.get(name));
        }

        myMap.put("names",names);
        myMap.put("numbers",numbers);

        PrintWriter p = null;
        try {
            p = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println("DataFactory.documentToJson(myMap) : " + DataFactory.documentToJson(myMap));
        p.write(DataFactory.documentToJson(myMap));
        p.flush();
        p.close();
    }

}
