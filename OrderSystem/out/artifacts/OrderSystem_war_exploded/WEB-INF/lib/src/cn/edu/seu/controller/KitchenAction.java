package cn.edu.seu.controller;

import cn.edu.seu.bussiness.ModifyDish;
import cn.edu.seu.bussiness.ModifyOrder;
import cn.edu.seu.model.Order;
import cn.edu.seu.model.OrderContent;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import cn.edu.seu.controller.DishesInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import static cn.edu.seu.controller.DataFactory.documentToJson;

@Controller
public class KitchenAction {


    /**
     * 更新后厨菜单
      *
     *
     *
     */
    @RequestMapping(value = "/updateShow.do", method = RequestMethod.POST)
    public void updateShow( HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.getParameter("req");
        PrintWriter p = response.getWriter();

        List<Order> list = ModifyOrder.getDynamicList();
        System.out.println("Before clear" + list);
        ModifyOrder.dynamicPool.clear();
        System.out.println("After clear" + list);

        if(list.isEmpty()){
            System.out.println("no data");
            p.write("null");
            p.flush();
            p.close();
        }

        ArrayList<DishesInfo> dishesInfoArrayList = new ArrayList<>();
        DishesInfo temp;

        int orderId;
        for (Order order : list) { // 遍历某个时间段内的所有订单列表
            orderId = order.getId();
            for (OrderContent orderContent : order.getFood()) { // 遍历某个订单列表内的所有订单内容
                // 设置dishesInfo对象（orderContent->dishesInfo)
                temp = new DishesInfo();
                temp.setOrderId("" + orderId);
                temp.setdishesId("" + orderContent.getDishId().getId());
                temp.setName(orderContent.getDishId().getName());
                temp.setNumber("" + orderContent.getDisNumber());
                temp.setTableNum("" + order.getTableId());

                System.out.println("temp dish info " + temp);

                // 将dishesInfo对象添加到ArrayList中
                dishesInfoArrayList.add(temp);
            }
        }

        System.out.println("dishesInfoArrayList :" + dishesInfoArrayList);

        DishesInfo[] dishesInfos = new DishesInfo[dishesInfoArrayList.size()];

        int i = 0;
        for(DishesInfo dishesInfo : dishesInfoArrayList){
            dishesInfos[i++] = dishesInfo;
            System.out.println(dishesInfos[i-1]);
        }

        System.out.println("dishesInfoArray :" + dishesInfos);

        System.out.println(documentToJson(dishesInfos));
        p.write(documentToJson(dishesInfos));
        p.flush();
        p.close();

    }

    //完成订单后后厨删除并提供菜名
    @RequestMapping(value ="/finishDish.do", method = RequestMethod.POST)
    public void transpDish(HttpServletRequest request, HttpServletResponse response){
        request.getParameter("dishesName");
        //操作
        /**
         * 传菜公告
         */
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

    //意外删除订单
    @RequestMapping(value = "/deleteDishes.do", method = RequestMethod.POST)
    public void deleteDishes( HttpServletRequest request,HttpServletResponse response){
     String ID = request.getParameter("orderId");
     String name = request.getParameter("dishesName");
       ModifyOrder.cookDeleteDish(ID,name);
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

}
