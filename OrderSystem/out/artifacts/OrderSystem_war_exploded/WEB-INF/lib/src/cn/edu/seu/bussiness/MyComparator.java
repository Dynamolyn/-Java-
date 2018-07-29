package cn.edu.seu.bussiness;

import cn.edu.seu.model.Model;

import java.util.Comparator;

public class MyComparator<T> implements Comparator<T> {
    @Override
    public int compare(T o1, T o2) {
        if(((Model)o1).getId() < ((Model)o2).getId()){
            return -1;
        }else if(((Model)o1).getId() > ((Model)o2).getId()){
            return 1;
        }else{
            return 0;
        }
    }
}
