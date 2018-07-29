package cn.edu.seu.controller;

import cn.edu.seu.bussiness.ElxInsertDish;
import cn.edu.seu.bussiness.ExportExcel;
import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.Dish;
import org.apache.struts2.ServletActionContext;
import java.io.*;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.Servlet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
@Controller
public class ExportExcelAction extends HttpServlet{

    @Override
    @RequestMapping("/Export.do")
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        OutputStream output = resp.getOutputStream();
        resp.reset();
        resp.setHeader("Content-Disposition",
                "attachment; filename=PersonList.xls");
        resp.setContentType("application/vnd.ms-excel;charset=utf-8");

        // 定义表的标题
        String title = "dish";

        //定义表的列名
        String[] rowsName = new String[] { "ID","名称","描述","文本","图片","是否推荐","价格" };

        //定义表的内容
        List templist= null;
        try {
            templist = DB_Manager.FindAll("Dish");
        } catch (Exception e) {
            e.printStackTrace();
        }
        List<Dish> dishList = new ArrayList<>();

        for(Object ob : templist){
            dishList.add((Dish)ob);
        }

        System.out.println(dishList.get(2).getName());

        // 创建ExportExcel对象
        //List<Object[]> temp = new ArrayList<>();
       // temp.add(dishList.toArray());
        ExportExcel ex = new ExportExcel(title, rowsName, dishList);

        // 输出Excel文件


//            response.reset();


        try {
            ex.export(output);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("export");

            output.close();

    }

    @RequestMapping(value = "/Import.do")
    protected String  importExcel(HttpServletRequest req, HttpServletResponse resp) throws Exception {
        File file = new File("D:\\logs\\InsertDish.xls");
        ElxInsertDish.ExcelInsertDish(file);
        return "forward:/manageDi.do";
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

doGet(request,response);


    }

    /**
     *
     * @return
     * @throws Exception
     */
    String expoetExcelAction(HttpServletResponse response) throws Exception{

//        HttpServletResponse response= ServletActionContext.getResponse();

//        String title="菜品一览";
//
//        String[] headers={"ID","名称","描述","文本","图片","是否推荐","价格"};
//
//        List templist= DB_Manager.FindAll("Dish");
//        List<Dish> dishList = new ArrayList<>();
//
//        for(Object ob : templist){
//            dishList.add((Dish)ob);
//        }
//
//        ExportExcel<Dish> ex=new ExportExcel<Dish>();
//
//        //shuchu
//        try {
//            String fileName="dishes.xls";
//            OutputStream output=response.getOutputStream();
//
//            response.reset();
//            response.setHeader("Content-Disposition","attachment;filename="
//                +new String(fileName.getBytes("utf-8"),"iso8859-1"));
//
//            response.setContentType("application/vnd.me-excel;charset=UTF-8");
//            ex.exportExcel(title,headers,dishList,output);
//        }
//        catch (IOException e){
//            e.printStackTrace();
//        }

        return "tolist";
    }


}
