package cn.edu.seu.bussiness;

import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.Dish;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.File;
import java.util.*;

public class ModifyDish {
    public static HashMap<Integer, Dish> dishHashMap = new HashMap<>();

    static {
        try {
            for(Object dish : DB_Manager.FindAll("Dish")){
                dishHashMap.put(((Dish)dish).getId(), (Dish)dish);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean deleteDish(int id){
        boolean bool = false;

        try {
            bool = DB_Manager.Delete(getDish(id));
            dishHashMap.remove(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bool;
    }

    public static List<Dish> getAllDishes(){
        List<Dish> dishes = new ArrayList<>();

        Set<Integer> ids = dishHashMap.keySet();
        Iterator iterator = ids.iterator();

        while(iterator.hasNext()){
            dishes.add(dishHashMap.get((Integer) iterator.next()));
        }

        dishes.sort(new MyComparator<Dish>());

        return dishes;
    }

    public static Dish getDish(int id){
        return dishHashMap.get(id);
    }

    public static boolean addOrUpdateDish(
            int id,
            String name,
            String description,
            String txt,
            String img, // 前端为BufferedImage
            Character isRecommended,
            double price
    ) {
        Dish dish = new Dish();
        try {
            dish.setId(id);
            dish.setName(name);
            dish.setDescription(description);
            dish.setTxt(txt);
            dish.setIsRecommended(isRecommended);
            dish.setPrice(price);
            if(img != null){
                dish.setImg(img);
            }else{
                dish.setImg(dishHashMap.get(id).getImg());
            }

            DB_Manager.SaveOrUpdate(dish);

            dishHashMap.put(dish.getId(), dish);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }
}
