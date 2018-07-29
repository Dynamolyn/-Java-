package cn.edu.seu.bussiness;

import cn.edu.seu.dao.DB_Manager;
import cn.edu.seu.model.Dish;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.struts2.ServletActionContext;


import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ElxInsertDish {
    /**
     *Excel文件导入
     * @param dishUploadFile
     * @return Dish的list
     * @throws Exception
     */
    public static void ExcelInsertDish(File dishUploadFile) throws Exception {

        FileInputStream im = new FileInputStream(dishUploadFile);
        POIFSFileSystem fs=new POIFSFileSystem(im);
        HSSFWorkbook hssfWorkbook=new HSSFWorkbook(fs);
        HSSFSheet hssfSheet=hssfWorkbook.getSheetAt(0);


        List<Dish> list=new ArrayList<Dish>();
        if(hssfSheet!=null){

            for(int rowNum=3;rowNum<=hssfSheet.getLastRowNum();rowNum++){

                HSSFRow hssfRow=hssfSheet.getRow(rowNum);

                if(hssfRow==null || getValue(hssfRow.getCell(1)).isEmpty()){
                    continue;
                }

                Dish dish=new Dish();
                dish.setId(0);
                dish.setName(getValue(hssfRow.getCell(1)));
                dish.setDescription(getValue(hssfRow.getCell(2)));
                dish.setTxt(getValue(hssfRow.getCell(3)));
                dish.setImg(getValue(hssfRow.getCell(4)));
                dish.setIsRecommended(getValue(hssfRow.getCell(5)).charAt(0));
                dish.setPrice(Float.valueOf(getValue(hssfRow.getCell(6))));


                list.add(dish);
            }

        }
        im.close();
        DB_Manager.SaveAll(list);
        for (Dish aDish:list
                ) {
            ModifyDish.dishHashMap.put(aDish.getId(), aDish);
        }
    }

    @SuppressWarnings("Static-access")

    private static  String getValue(HSSFCell hssfCell){

        if(hssfCell.getCellType()==hssfCell.CELL_TYPE_BOOLEAN){

            return String.valueOf(hssfCell.getBooleanCellValue());
        }
        else if(hssfCell.getCellType()==hssfCell.CELL_TYPE_NUMERIC){

            return String.valueOf(hssfCell.getNumericCellValue());
        }
        else {
            return  String.valueOf(hssfCell.getStringCellValue());
        }
    }
    


}
