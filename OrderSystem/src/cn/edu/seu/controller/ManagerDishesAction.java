package cn.edu.seu.controller;

import cn.edu.seu.bussiness.ModifyDish;
import cn.edu.seu.bussiness.ModifyOrder;
import cn.edu.seu.bussiness.ModifyVIPCustomer;
import cn.edu.seu.model.Order;
import cn.edu.seu.model.OrderContent;
import cn.edu.seu.model.VIPCustomer;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.annotation.Documented;
import java.text.DecimalFormat;
import java.util.HashSet;
import java.util.Set;

import static cn.edu.seu.controller.DataFactory.documentToJson;


@Controller
public class ManagerDishesAction {
    int searchVipId = 0;
    VIPCustomer vipCustomer=null;
    //管理员查看订单
    @RequestMapping(value = "/dishesPayShow.do", method = RequestMethod.POST)
    public void dishesPayShow(HttpServletRequest request, HttpServletResponse response) {
       int orderID = Integer.valueOf(request.getParameter("req"));
        //操作
        DecimalFormat df = new DecimalFormat("#.00");

        OrderInfo orderInfo = new OrderInfo();
        Order order = ModifyOrder.orderPool.get(orderID);
        orderInfo.setId(order.getId());
        orderInfo.setBeginTime(order.getBeginTime().toString());
        orderInfo.setEndTime(order.getEndTime().toString());
        orderInfo.setTableId(order.getTableId());
        Double price  = Double.parseDouble(df.format(ModifyOrder.getOrderSum(orderID)));

         orderInfo.setPrice(price);
        if(vipCustomer!= null){
            orderInfo.setSelePrice(price*0.88);
            ModifyVIPCustomer.VIPPaid(searchVipId,price*0.88);
            vipCustomer=null;
        }
        else  orderInfo.setSelePrice(price);
        System.out.println("order : " + order);
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


    //管理员结账并删除订单
    @RequestMapping(value = "/dishesPayDelete.do", method = RequestMethod.POST)
    public void dishesPayDelete(HttpServletRequest request, HttpServletResponse response) {
        String orderId = request.getParameter("orderId");


        //从内存中删除订单并加入数据库------------
        ModifyOrder.orderPaid(Integer.parseInt(orderId));
        //-----------------------------------

        try {
            PrintWriter p= response.getWriter();
            p.write("true");//else write(null)
            p.flush();
            p.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping(value = "/searchCustomerID.do",method = RequestMethod.POST)
    public void searchCustomerID(HttpServletRequest request, HttpServletResponse response){
        searchVipId = Integer.parseInt(request.getParameter("customerID"));
        String state = "false";
        vipCustomer =  ModifyVIPCustomer.getVIPCustomer(searchVipId);
        if(vipCustomer!=null)  state = "true";
        try {
            PrintWriter p= response.getWriter();
            p.write(state);//else write(null)
            p.flush();
            p.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
