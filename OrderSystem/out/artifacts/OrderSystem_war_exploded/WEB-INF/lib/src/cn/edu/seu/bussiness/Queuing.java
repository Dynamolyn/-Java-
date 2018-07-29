package cn.edu.seu.bussiness;

import cn.edu.seu.model.Table;

public class Queuing {
    public static int queueNumber = 0;

    public static int freeTables(){
        int count = 0;

        for(Table table : ModifyTable.getAllTables()){
            if(table.getIsFree() == 'Y'){
                count++;
            }
        }

        return count;
    }

    public static int getQueueNumber(){
        return queueNumber++;
    }
}
