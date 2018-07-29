package cn.edu.seu.controller;

import cn.edu.seu.bussiness.ModifyDish;
import cn.edu.seu.bussiness.ModifyUser;
import cn.edu.seu.bussiness.ModifyVIPCustomer;
import cn.edu.seu.model.Dish;
import cn.edu.seu.model.User;
import cn.edu.seu.model.VIPCustomer;
import com.sun.deploy.net.HttpResponse;
import org.apache.commons.codec.binary.Base64;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import javax.imageio.ImageIO;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.UUID;

import cn.edu.seu.controller.DataFactory;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ManagerAction {
    public int modifyEmployeeID = 0;

    private  BufferedImage bufferedImage;
    public int modifyDishID = 0;

    public int modifyCustomerID = 0;
    public String mess = "";
    @RequestMapping(value="/sendMessage.do",method = RequestMethod.POST)
    public  String sendMessage(HttpServletRequest request, HttpServletResponse response){
        HttpSession session = request.getSession();
        mess = request.getParameter("message");
        session.setAttribute("messageShow",request.getParameter("message"));
        return "forward:/manageW.do";
    }

    @RequestMapping(value="/getMessage.do",method = RequestMethod.POST)
    public void getMessage(HttpServletRequest request, HttpServletResponse response){
        System.out.println(mess);

        PrintWriter p = null;
        try {
            p = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        p.write(mess);
        p.flush();
        p.close();
    }

    /**
     * 人员管理
     * @param request
     * @param response
     */
    @RequestMapping(value = "/deleteE.do", method = RequestMethod.POST)
    public void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int deleteID = Integer.valueOf(request.getParameter("employeeID"));
        System.out.println(request.getParameter("employeeID"));
        ModifyUser.deleteUser(deleteID);
    }

    @RequestMapping(value = "/addE.do", method = RequestMethod.POST)
    public String addEmployee(HttpServletRequest request, HttpServletResponse response,
                              MultipartFile pictureFile) {

//        boolean state = false;
//        try {
//            request.setCharacterEncoding("utf-8");
//            //原始文件名称
//            String pictureFile_name = pictureFile.getOriginalFilename();
//            String newFileName = new String();
//            System.out.println(pictureFile_name);
//            if (pictureFile_name == null || pictureFile_name.equals("")) {
//                newFileName = "D:\\logs\\default.png";
//            } else {
//                newFileName = UUID.randomUUID().toString() + pictureFile_name;
//                String projectAbsPath =request.getSession().getServletContext().getRealPath("");
//                String projectPath = projectAbsPath.substring(0,projectAbsPath.indexOf("out"));
//                System.out.println(projectAbsPath);
//                File uploadPic = new File(projectPath +"/web/assets/img/" + newFileName);
//
////                File uploadPic = new File("E:\\EclipseWorkspace\\apache-tomcat-9.0.0.M22\\bin\\web\\assets\\img\\" + newFileName);
//                if (!uploadPic.exists()) {
//                    uploadPic.mkdirs();
//                }
//                //向磁盘写文件
//                pictureFile.transferTo(uploadPic);
//                newFileName = "/assets/img/"+newFileName;//
//            }
//            //新文件名称
//            System.out.println(newFileName);

        boolean state = false;
        try {
            request.setCharacterEncoding("utf-8");
            //原始文件名称
            String pictureFile_name = pictureFile.getOriginalFilename();
            String newFileName = new String();
            System.out.println(pictureFile_name);
            if (pictureFile_name == null || pictureFile_name.equals("")) {
                newFileName = "D:\\logs\\default.png";
            } else {
                newFileName = UUID.randomUUID().toString() + pictureFile_name;
                File uploadPic = new File("D:/logs/" + newFileName);
                if (!uploadPic.exists()) {
                    uploadPic.mkdirs();
                }
                //向磁盘写文件
                pictureFile.transferTo(uploadPic);
                newFileName = uploadPic.getAbsolutePath();
            }
            //新文件名称
            System.out.println(newFileName);

            String add = request.getParameter("address");
            String account = request.getParameter("account");
            String psw = request.getParameter("psw");
            String name = request.getParameter("name");
            String sex = request.getParameter("sex");
            String num = request.getParameter("phoneNum");
            String pos = request.getParameter("position");

            state = ModifyUser.addOrUpdateUser(0, account, psw, 'N', newFileName, name, sex.charAt(0), num, add, pos);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/manageE.do";
    }

    @RequestMapping(value = "/modifyE.do", method = RequestMethod.POST)
    public void modifyEmployee(HttpServletRequest request, HttpServletResponse response, Model model) {
        modifyEmployeeID = Integer.valueOf(request.getParameter("employeeID"));
        PrintWriter p = null;
        try {
            p = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        p.write("");
        p.flush();
        p.close();
    }
    @RequestMapping(value = "/modifyEmployee.do")
    public ModelAndView modifyEmployee() throws IOException {
        User user = ModifyUser.getUser(modifyEmployeeID);
        File file = new File(user.getFaceImg());
        bufferedImage = ImageIO.read(file);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("employee",user);
        modelAndView.addObject("employeeID",modifyEmployeeID);
        modelAndView.setViewName("admin/modifyEmployee");
        return modelAndView;
    }
    @RequestMapping(value = "/submitModifyInfo.do", method = RequestMethod.POST)
    public String modifyEmployee(HttpServletRequest request, HttpServletResponse response,
                                 MultipartFile pictureFile) {

        boolean state = false;
        try {
            request.setCharacterEncoding("utf-8");
            //原始文件名称
            String pictureFile_name = pictureFile.getOriginalFilename();
            String newFileName = new String();
            System.out.println(pictureFile_name);
            if (pictureFile_name == null || pictureFile_name.equals("")) {
                newFileName = null;
            } else {
                newFileName = UUID.randomUUID().toString() + pictureFile_name;
                File uploadPic = new File("D:/logs/" + newFileName);
                if (!uploadPic.exists()) {
                    uploadPic.mkdirs();
                }
                //向磁盘写文件
                pictureFile.transferTo(uploadPic);
                newFileName = uploadPic.getAbsolutePath();
            }
            //新文件名称
            System.out.println(newFileName);

            System.out.println(modifyEmployeeID);
            String add = request.getParameter("address");
            String account = request.getParameter("account");
            String psw = request.getParameter("psw");
            String name = request.getParameter("name");
            System.out.println(name);
            String sex = request.getParameter("sex");
            String num = request.getParameter("phoneNum");
            String pos = request.getParameter("position");

            state = ModifyUser.addOrUpdateUser(modifyEmployeeID, account, psw, 'N', newFileName, name, sex.charAt(0), num, add, pos);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/manageE.do";
    }
    //-------------------------------------------------------------------------
    @RequestMapping(value = "/checkE.do", method = RequestMethod.POST)
    public void checkEmployee(HttpServletRequest request, HttpServletResponse response) {

        int checkEmployeeID = Integer.valueOf(request.getParameter("employeeID"));

        User user = ModifyUser.getUser(checkEmployeeID);
        String temp = DataFactory.documentToJson(user);
        System.out.println(temp);
        PrintWriter p = null;
        try {
            File file = new File(user.getFaceImg());
            bufferedImage = ImageIO.read(file);
            p = response.getWriter();
            p.write(temp);
            p.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
        p.close();
    }
    @RequestMapping("/testHttpMessageDown.do")
    public void download(HttpServletRequest request,HttpServletResponse response) throws IOException {
        ImageIO.write(bufferedImage, "JPEG", response.getOutputStream());
        response.getOutputStream().flush();
    }

    /**
     * 菜品管理
     * @param request
     * @param response
     */
    @RequestMapping(value = "/deleteD.do", method = RequestMethod.POST)
    public void deleteDishes(HttpServletRequest request, HttpServletResponse response) {
        int deleteID = Integer.valueOf(request.getParameter("dishID"));
        System.out.println(request.getParameter("dishID"));
        ModifyDish.deleteDish(deleteID);
    }

    @RequestMapping(value = "/addD.do", method = RequestMethod.POST)
    public String addDishes(HttpServletRequest request, HttpServletResponse response, MultipartFile pictureFile) {
        boolean state = false;
            try {
                request.setCharacterEncoding("utf-8");
                //原始文件名称
                String pictureFile_name = pictureFile.getOriginalFilename();
                String newFileName = new String();
                System.out.println(pictureFile_name);
                if (pictureFile_name == null || pictureFile_name.equals("")) {
                    newFileName = "assets/img/defaultDish.jpg";
                } else {
                    newFileName = pictureFile_name;
                    String projectAbsPath = request.getSession().getServletContext().getRealPath("");
                    String projectPath = projectAbsPath.substring(0, projectAbsPath.indexOf("out"));
                    System.out.println(projectAbsPath);
                    File uploadPic = new File(projectPath + "/web/assets/img/" + newFileName);

//                File uploadPic = new File("E:\\EclipseWorkspace\\apache-tomcat-9.0.0.M22\\bin\\web\\assets\\img\\" + newFileName);
                    if (!uploadPic.exists()) {
                        uploadPic.mkdirs();
                    }
                    //向磁盘写文件
                    pictureFile.transferTo(uploadPic);
                    newFileName = "assets/img/" + newFileName;
                }
                //新文件名称
                System.out.println(newFileName);

//            InputStream inputStream = pictureFile.getInputStream();
//            BufferedImage bufferedImage = ImageIO.read(inputStream);
//            request.setCharacterEncoding("utf-8");
//            //原始文件名称
//            String pictureFile_name = pictureFile.getOriginalFilename();
//            String newFileName = new String();
//            System.out.println(pictureFile_name);
//            if (pictureFile_name == null || pictureFile_name.equals("")) {
//                newFileName = "D:\\logs\\defaultDish.png";
//            } else {
//                newFileName = UUID.randomUUID().toString() + pictureFile_name;
//                File uploadPic = new File("D:/logs/" + newFileName);
//                if (!uploadPic.exists()) {
//                    uploadPic.mkdirs();
//                }
//                //向磁盘写文件
//                pictureFile.transferTo(uploadPic);
//                newFileName = uploadPic.getAbsolutePath();
//            }
//            //新文件名称
//            System.out.println(newFileName);

                String name = request.getParameter("name");
                String isRe = request.getParameter("recommed");
                String descip = request.getParameter("description");
                String txt = request.getParameter("txt");
                Double price = Double.valueOf(request.getParameter("price"));
                state = ModifyDish.addOrUpdateDish(0, name, descip, txt, newFileName,
                        isRe.charAt(0), price);

            } catch (IOException e) {
                e.printStackTrace();
            }
            return "forward:/manageDi.do";
    }


    @RequestMapping("/checkD.do")
    public void checkDishes(HttpServletRequest request, HttpServletResponse response, Model model) {
        int checkID = Integer.valueOf(request.getParameter("dishID"));
        Dish dish = ModifyDish.getDish(checkID);
    //    String faceImgBase64 = getImgStr(dish.getImg());
     //   System.out.println(faceImgBase64);
     //   dish.setImg(faceImgBase64);
        String projectAbsPath = request.getSession().getServletContext().getRealPath("");
        String projectPath = projectAbsPath.substring(0, projectAbsPath.indexOf("out"));
        String tempdish = DataFactory.documentToJson(dish);
        System.out.println(tempdish);
        PrintWriter p = null;
        try {
            File file = new File(projectPath+"/web/"+dish.getImg());
            bufferedImage = ImageIO.read(file);
            p = response.getWriter();
            p.write(tempdish);
            p.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }

        p.close();
    }
    @RequestMapping(value = "/modifyD.do", method = RequestMethod.POST)
    public void modifyDish(HttpServletRequest request, HttpServletResponse response, Model model) {
        modifyDishID = Integer.valueOf(request.getParameter("dishID"));
        PrintWriter p = null;
        try {
            p = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        p.write("");
        p.flush();
        p.close();
    }
    @RequestMapping(value="/modifyDish.do")
    public ModelAndView modifyDishes() {
        Dish dish = ModifyDish.getDish(modifyDishID);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("dish",dish);
        modelAndView.addObject("dishID",modifyDishID);

        modelAndView.setViewName("admin/modifyDishes");
        return modelAndView;
    }

    @RequestMapping(value="/submitModifyDish.do",method = RequestMethod.POST)
    public String submitModifyDish(HttpServletRequest request, HttpServletResponse response,
                                 MultipartFile pictureFile) {

        boolean state = false;
        try {
            request.setCharacterEncoding("utf-8");
            //原始文件名称
            String pictureFile_name = pictureFile.getOriginalFilename();
            String newFileName = new String();
            System.out.println(pictureFile_name);
            if (pictureFile_name == null || pictureFile_name.equals("")) {
                newFileName = null;
            } else {
                String projectAbsPath = request.getSession().getServletContext().getRealPath("");
                String projectPath = projectAbsPath.substring(0, projectAbsPath.indexOf("out"));
                newFileName = UUID.randomUUID().toString() + pictureFile_name;
                File uploadPic = new File(projectPath +"/web/assets/img/"+ newFileName);
                if (!uploadPic.exists()) {
                    uploadPic.mkdirs();
                }
                //向磁盘写文件
                pictureFile.transferTo(uploadPic);
                newFileName = uploadPic.getAbsolutePath();
            }
            //新文件名称dd
            System.out.println(newFileName);
//            int id =Integer.parseInt(request.getParameter("dishID"));
            System.out.println(modifyDishID);
            String name = request.getParameter("name");
            String isRe = request.getParameter("recommed");
            String descip = request.getParameter("description");
            String txt = request.getParameter("txt");
            Double price = Double.valueOf(request.getParameter("price"));

            state = ModifyDish.addOrUpdateDish(modifyDishID, name, descip, txt, newFileName,
                    isRe.charAt(0), price);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return "forward:/manageDi.do";
    }


    /**
     * 客户管理
     * @param request
     * @param response
     * @return
     */
    @RequestMapping(value="/addC.do",method = RequestMethod.POST)
    public String addCustomer(HttpServletRequest request, HttpServletResponse response) {
          ModifyVIPCustomer.addOrUpdateVIPCustomer(0,request.getParameter("name"),request.getParameter("sex").charAt(0),
                  request.getParameter("phoneNum"),0,0.0f);
        return "forward:/manageC.do";
    }
    @RequestMapping(value="/modifyC.do",method = RequestMethod.POST)
    public void modifyCustomer(HttpServletRequest request, HttpServletResponse response) {
        modifyCustomerID = Integer.valueOf(request.getParameter("customerID"));
        PrintWriter p = null;
        try {
            p = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        p.write("");
        p.flush();
        p.close();
    }
        @RequestMapping(value="/modifyCustomer.do")
       public ModelAndView modifyCustomer() {
        VIPCustomer vipCustomer = ModifyVIPCustomer.getVIPCustomer(modifyCustomerID);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("VIPcustomer",vipCustomer);
        modelAndView.addObject("customerID",modifyCustomerID);
        modelAndView.setViewName("admin/modifyVip");
        return modelAndView;
    }
    @RequestMapping(value="/submitCustom.do", method = RequestMethod.POST)
    public String modifyCustomerOrder(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        request.setCharacterEncoding("utf-8");

        String name = request.getParameter("name");
        String sex = request.getParameter("sex");
        String phoneNum = request.getParameter("phoneNum");
        String dinningTimes = request.getParameter("dinningTime");
        String dinningCount = request.getParameter("dinningCount");

        ModifyVIPCustomer.addOrUpdateVIPCustomer(modifyCustomerID, name, sex.charAt(0),
                phoneNum,Integer.valueOf(dinningTimes),Float.valueOf(dinningCount));

        return "forward:/manageC.do";
    }
    @RequestMapping(value="/deleteCustomer.do",method = RequestMethod.POST)
    public void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int deleteID = Integer.valueOf(request.getParameter("customerID"));
        ModifyVIPCustomer.deleteVIPCustomer(deleteID);
    }
}
