package cn.edu.seu.bussiness;

import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.User;

import java.util.List;

public class UniqueAccountCheck {

    /**
     * 这个方法用于添加用户时，判断添加的用户名是否是和已经存在的用户名之间没有重复
     */
    public static boolean isUnique(String account) {
        try {
            List<Object> list = DB_Manager.FindByAttribute(User.class,"account","="+account);
            if(list.isEmpty()){
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
