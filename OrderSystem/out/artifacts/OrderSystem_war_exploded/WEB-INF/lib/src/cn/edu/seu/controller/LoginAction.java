package cn.edu.seu.controller;

import cn.edu.seu.bussiness.Init;
import cn.edu.seu.bussiness.LoginVerification;
import cn.edu.seu.bussiness.ModifyOrder;
import cn.edu.seu.bussiness.VerificationCode;
import cn.edu.seu.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Logger;

@Controller
public class LoginAction {
    public String strCode = null;
    public int state = 0;
    public int id=0;
    String account=null;

//显示验证码图片
    @RequestMapping("/verCode.do")
    public void getVerCode(HttpServletRequest request, HttpServletResponse response, HttpSession session)
            throws IOException {
        response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        VerificationCode verCode = new VerificationCode();
        //生成验证码图片image
        BufferedImage image = verCode.getVerificationCodeImg();

        //获得验证码
        strCode = verCode.getVerificationCode();
        System.out.println(strCode);
        ImageIO.write(image, "JPEG", response.getOutputStream());
        response.getOutputStream().flush();

    }
    //异步比对验证码信息
    @RequestMapping(value = "/verCodeString.do", method = RequestMethod.POST)
    public void getVerCodeString(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        String judge = "false";
        String vString = strCode;
        String inPCode = request.getParameter("verCode");
        boolean a = vString.equals(inPCode.toLowerCase());
        System.out.println(a);
        if(a)  judge = "true";
        PrintWriter p = response.getWriter();
        p.write(judge);
        p.flush();
        p.close();
    }

  //跳转
    @RequestMapping(value = "/jumpTo.do", method = {RequestMethod.GET,RequestMethod.POST})
    public String JumpTo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

       if(state==1) {
           session.setAttribute("adminID", id);
           session.setAttribute("adminAccount", account);
           return "forward:manageW.do";
       }
        else if(state== 2){
           session.setAttribute("waiterID",id);
           session.setAttribute("waiterAccount",account);
            return  "forward:/waiterOrder.do";
       }
        else if(state==3) {
           session.setAttribute("cookID", id);
           session.setAttribute("cookAccount", account);
           return "chif/kitchen";
       }
        else return null;//错误页面处理
    }


    //比对信息
    @RequestMapping(value = "/loginUser.do", method = RequestMethod.POST)
    public void verLogin(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

         account = request.getParameter("name");
        System.out.println(account);
        String psw = request.getParameter("password");
        System.out.println(psw);
        PrintWriter p = response.getWriter();
        String judge = "true";
        state = LoginVerification.loginVerification(account,psw);
        id = LoginVerification.getloginId(account,psw);

        System.out.println(state);

        try{
            System.out.println(Init.class.getName());
            System.out.println(ModifyOrder.flag);
        }catch (Exception e){
            System.out.println("not load");
        }

        p.write(judge);
        p.flush();
        p.close();

    }

}