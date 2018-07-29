package cn.edu.seu.bussiness;

import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.Table;

import java.util.*;

public class ModifyTable {
    public static HashMap<Integer, Table> tableHashMap = new HashMap<>();

    static {
        try {
            for(Object table : DB_Manager.FindAll("Table")){
                tableHashMap.put(((Table)table).getId(), (Table)table);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static boolean deleteTable(int id){
        boolean bool = false;

        try {
            bool = DB_Manager.Delete(getTable(id));
            tableHashMap.remove(id);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return bool;
    }

    public static List<Table> getAllTables(){
        List<Table> tables = new ArrayList<>();

        Set<Integer> ids = tableHashMap.keySet();
        Iterator iterator = ids.iterator();

        while(iterator.hasNext()){
            tables.add(tableHashMap.get((Integer) iterator.next()));
        }

        tables.sort(new MyComparator<Table>());

        return tables;
    }

    public static Table getTable(int id){
        return tableHashMap.get(id);
    }

    public static boolean addOrUpdateTable(
            int id,
            Character isFree,
            Integer size
    ) {
        Table table = new Table();
        try {
            table.setId(id);
            table.setIsFree(isFree);
            table.setSize(size);

            DB_Manager.SaveOrUpdate(table);

            tableHashMap.put(table.getId(), table);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return true;
    }
}
