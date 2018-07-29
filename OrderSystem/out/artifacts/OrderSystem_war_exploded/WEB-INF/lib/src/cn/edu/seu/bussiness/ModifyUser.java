package cn.edu.seu.bussiness;

import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.User;
import cn.edu.seu.model.UserPosition;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.*;

/**
 * 用于前端员工信息格式和数据库信息格式转换
 */
public class ModifyUser {
    public static HashMap<Integer, User> userHashMap = new HashMap<>();

    static {
        try {
            for(Object user : DB_Manager.FindAll("User")){
                userHashMap.put(((User)user).getId(), (User)user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean deleteUser(int id){
        boolean bool = false;

        try {
            bool = DB_Manager.Delete(getUser(id));
            userHashMap.remove(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bool;
    }

    public static List<User> getAllUsers(){
        List<User> users = new ArrayList<>();

        Set<Integer> ids = userHashMap.keySet();
        Iterator iterator = ids.iterator();

        while(iterator.hasNext()){
            users.add(userHashMap.get((Integer) iterator.next()));
        }

        users.sort(new MyComparator<User>());

        return users;
    }

    public static User getUser(int id){
        return userHashMap.get(id);
    }

    public static boolean addOrUpdateUser(
            int id,
            String account,
            String pwd,
            Character isLocked,
            String faceImg, // 前端为图片类型
            String name,
            Character sex,
            String phoneNumber,
            String address,
            String position // 前端为int类型
    ) {
        User user = new User();
        try {
            UserPosition userPosition =Init.getUserPosition(position);

            user.setId(id);
            user.setAccount(account);
            user.setPwd(pwd);
            user.setIsLocked(isLocked);
            user.setName(name);
            user.setSex(sex);
            user.setPhoneNumber(phoneNumber);
            user.setAddress(address);
            user.setPosition(userPosition);
            if(faceImg != null && !faceImg.isEmpty()){
                user.setFaceImg(faceImg);
            }else{
                user.setFaceImg(userHashMap.get(id).getFaceImg());
            }
            DB_Manager.SaveOrUpdate(user);

            userHashMap.put(user.getId(), user);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }

}
