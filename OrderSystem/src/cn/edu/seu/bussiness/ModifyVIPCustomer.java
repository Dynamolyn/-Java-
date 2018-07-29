package cn.edu.seu.bussiness;

import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.VIPCustomer;

import java.util.*;

public class ModifyVIPCustomer {
    public static HashMap<Integer, VIPCustomer> vipCustomerHashMap = new HashMap<>();

    static {
        try {
            for(Object vip : DB_Manager.FindAll("VIPCustomer")){
                vipCustomerHashMap.put(((VIPCustomer)vip).getId(), (VIPCustomer) vip);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean deleteVIPCustomer(int id){
        boolean bool = false;

        try {
            bool = DB_Manager.Delete(getVIPCustomer(id));
            vipCustomerHashMap.remove(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bool;
    }

    public static List<VIPCustomer> getAllVIPCustomers(){
        List<VIPCustomer> vips = new ArrayList<>();

        Set<Integer> ids = vipCustomerHashMap.keySet();
        Iterator iterator = ids.iterator();

        while(iterator.hasNext()){
            vips.add(vipCustomerHashMap.get((Integer) iterator.next()));
        }

        vips.sort(new MyComparator<VIPCustomer>());

        return vips;
    }

    public static VIPCustomer getVIPCustomer(int id){
        return vipCustomerHashMap.get(id);
    }

    public static boolean addOrUpdateVIPCustomer(
            int id,
            String name,
            Character sex,
            String phoneNumber,
            Integer dinningTimes,
            Float dinningSum
    ) {
        VIPCustomer vipCustomer = new VIPCustomer();
        try {
            vipCustomer.setId(id);
            vipCustomer.setName(name);
            vipCustomer.setSex(sex);
            vipCustomer.setPhoneNumber(phoneNumber);
            vipCustomer.setDinningTimes(dinningTimes);
            vipCustomer.setDinningSum(dinningSum);

            DB_Manager.SaveOrUpdate(vipCustomer);

            vipCustomerHashMap.put(vipCustomer.getId(), vipCustomer);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }

    public static void VIPPaid(
            int id,
            double sum
    ){
        VIPCustomer vipCustomer = vipCustomerHashMap.get(id);
        vipCustomer.setDinningSum(vipCustomer.getDinningSum() + sum);
        vipCustomer.setDinningTimes(vipCustomer.getDinningTimes() + 1);

        try {
            DB_Manager.SaveOrUpdate(vipCustomer);
        } catch (Exception e) {
            e.printStackTrace();
        }

        vipCustomerHashMap.put(vipCustomer.getId(),vipCustomer);
    }
}
