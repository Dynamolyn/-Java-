package cn.edu.seu.controller;

import cn.edu.seu.bussiness.ModifyOrder;
import cn.edu.seu.model.Order;
import cn.edu.seu.model.OrderContent;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import static cn.edu.seu.controller.DataFactory.documentToJson;

@Controller
public class WaiterAction {
    //从服务员页面获取数据
    @RequestMapping(value = "/Kitchen.do", method = RequestMethod.POST)
    @ResponseBody
    public String kitchen(@RequestBody DishesInfo[] dishesInfoList, HttpServletRequest request) {
       // int Id = Integer.parseInt(request.getParameter("waiterID"));
        ArrayList<DishesInfo> list = new ArrayList<>();
        for (DishesInfo one : dishesInfoList) {
            System.out.println(one.getName() + " " + one.getdishesId() + " " + one.getNumber() + " " + one.getTableNum());
            list.add(one);
        }
        ModifyOrder.orderCreate(1, list);//Integer.parseInt(request.getParameter("userID"))
        return "true";
    }
    //服务员页面买单
    @RequestMapping(value = "/payTheBill.do", method = RequestMethod.POST)
    public void payTheBill(HttpServletRequest request, HttpServletResponse response){
        String payId = request.getParameter("payId");
        System.out.println(payId);
        //操作
        ModifyOrder.orderFinished(Integer.valueOf(payId));
        PrintWriter p = null;
        try {
            p = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        p.write("true");
        p.flush();
        p.close();
    }

    //服务员界面取消订单
    @RequestMapping(value = "/deleteTheBill.do", method = RequestMethod.POST)
    public void deleteTheBill(HttpServletRequest request, HttpServletResponse response) {
        String payId = request.getParameter("payId");
        ModifyOrder.waiterDeleteOrder(payId);
        PrintWriter p = null;
        try {
            p = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        p.write("true");
        p.flush();
        p.close();
    }

    //服务员界面查看订单
    @RequestMapping(value = "/waiterPayShow.do", method = RequestMethod.POST)
    public void waiterPayShow(HttpServletRequest request, HttpServletResponse response) {
        int orderID = Integer.valueOf(request.getParameter("orderId"));
        //操作
        OrderInfo orderInfo = new OrderInfo();
        Order order = ModifyOrder.orderPool.get(orderID);
        orderInfo.setId(order.getId());
        orderInfo.setBeginTime(order.getBeginTime().toString());
        orderInfo.setTableId(order.getTableId());

        Set<DishSimpleInfo> dishes = new HashSet<DishSimpleInfo>();
        dishes.clear();
        DishSimpleInfo d;

        for(OrderContent orderContent : order.getFood())
        {
            d = new DishSimpleInfo();
            d.setNum(orderContent.getDisNumber());
            d.setDishName(orderContent.getDishId().getName());
            d.setPrice(orderContent.getDishId().getPrice());
            System.out.println("d : " + d);
            dishes.add(d);
        }
        // System.out.println();
        orderInfo.setFood(dishes);
        System.out.println(orderInfo);
        System.out.println(documentToJson(orderInfo));
        try {
            PrintWriter p= response.getWriter();
            p.write(documentToJson(orderInfo));//else write(null)
            p.flush();
            p.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
