package cn.edu.seu.bussiness;

import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.User;

import java.util.List;

public class LoginVerification {
    /**
     * 这个方法用于登录界面验证用户名和密码
     * @return -1 用户名密码不匹配
     * @return 0 用户名不存在
     * @return 1 用户为管理员
     * @return 2 用户为服务员
     * @return 3 用户为厨师
     * @return 4 账户被锁
     */
     public static int loginVerification(String account, String pwd) {
            try {
            List<Object> list = DB_Manager.FindByAttribute(User.class,"account",("= \'"+account +"\'"));
            for(Object user : list){
                String pass = ((User)user).getPwd();
                if(pass.equals(pwd)){
                    if(((User)user).getIsLocked() == 'Y'){
                        return 4; // 账户被锁
                    }else{
                        return ((User)user).getPosition().getId(); // 账户职位id
                    }
                }else{
                    return -1; // 用户名密码不匹配
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0; // 用户不存在
    }
    public static int getloginId(String account, String pwd) {
        try {
            List<Object> list = DB_Manager.FindByAttribute(User.class,"account",("= \'"+account +"\'"));
            for(Object user : list){
                String pass = ((User)user).getPwd();
                if(pass.equals(pwd)){
                    if(((User)user).getIsLocked() == 'Y'){
                        return 4; // 账户被锁
                    }else{
                        return ((User)user).getId(); // 账户职位id
                    }
                }else{
                    return -1; // 用户名密码不匹配
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0; // 用户不存在
    }
//      登录验证测试代码：成功
//    public static void main(String[] args){
//        System.out.println(loginVerification("root", "123"));
//        System.out.println(loginVerification("root", "061218qq"));
//        System.out.println(loginVerification("gg", "123"));
//    }

}
