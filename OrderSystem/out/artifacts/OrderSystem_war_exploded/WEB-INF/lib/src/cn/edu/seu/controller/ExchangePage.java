package cn.edu.seu.controller;

import cn.edu.seu.bussiness.*;
import cn.edu.seu.model.User;
import org.omg.CORBA.Request;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ExchangePage {

    @RequestMapping("/manageW.do")
    public String exManageWaitNum(HttpServletRequest request,HttpServletResponse response)
    {
        request.setAttribute("emptyTable", Queuing.freeTables());
        if(Queuing.freeTables()==0) request.setAttribute("queuing",Queuing.getQueueNumber());
        else request.setAttribute("queuing",0);
        return "admin/manageWaitNum";
    }

    @RequestMapping("/manageE.do")
    public ModelAndView exManageEmployee()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("usersList", ModifyUser.getAllUsers());
        modelAndView.setViewName("admin/manageEmployee");
        return modelAndView;
    }
    @RequestMapping("/manageA.do")
    public ModelAndView exManageAccount()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("finishedList",ModifyOrder.getFinishedOrders());
        modelAndView.setViewName("admin/manageAccount");
        return modelAndView;
    }

    @RequestMapping("/addEmployee.do")
    public String exAddEmployee()
    {
        return "admin/addEmployee";
    }



    @RequestMapping("/addDishes.do")
    public String exAddDishes()
    {
        return "admin/addDishes";
    }


    @RequestMapping("/addVip.do")
    public String exAddVip()
    {
        return "admin/addVip";
    }


    @RequestMapping("/manageDi.do")
    public ModelAndView exManageDishes()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("dishesList", ModifyDish.getAllDishes());
        modelAndView.setViewName("admin/manageDishes");
        return modelAndView;
    }
    @RequestMapping("/manageC.do")
    public ModelAndView exManageCustomers()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("VIPCustomerList", ModifyVIPCustomer.getAllVIPCustomers());
        modelAndView.setViewName("admin/manageCustomer");
        return modelAndView;
    }
    @RequestMapping("/manageDa.do")
    public String exManageData()
    {
        return "admin/manageData";
    }

    @RequestMapping("/waiterBill.do")
    public ModelAndView exWaiterBill()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("waitingList", ModifyOrder.getWaitingOrders());
        modelAndView.setViewName("waiter/payList");
        return modelAndView;
    }

    @RequestMapping("/waiterOrder.do")
    public ModelAndView exWaiterOrder(HttpServletRequest request,HttpServletResponse response)
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("dishList",ModifyDish.getAllDishes());
        modelAndView.setViewName("waiter/orderDishes");
        return modelAndView;
    }
}
