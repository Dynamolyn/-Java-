package cn.edu.seu.bussiness;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.List;

/**
 * 文件上传方法封装类
 * <p>
 * savePath 为希望文件保存的路径
 * request 为HttpServletRequest对象，由servlet调用时传入
 * 返回值为String类型的提示信息，“文件上传成功”或“文件上传失败”
 */
public class UploadDoPostMethod {
    public static String doPostMethod(String savePath, HttpServletRequest request) {


        System.out.println("doPost");
        // String savePath ="D:\\JAVAEE\\IdeaProjects\\UploadHandle\\web\\WEB-INF\\upload";
        File file = new File(savePath);
        if (!file.exists() && !file.isDirectory()) {
            System.out.println(savePath + "目录不存在，需要创建");
            file.mkdir();
        }
        System.out.println(savePath + "目录存在");
        String message = "";

        try {

            DiskFileItemFactory factory = new DiskFileItemFactory();


            ServletFileUpload upload = new ServletFileUpload(factory);


            upload.setHeaderEncoding("UTF-8");


            if (!ServletFileUpload.isMultipartContent(request)) {

                //*****
                return null;
            }

            List<FileItem> list = upload.parseRequest(request);
            for (FileItem item : list) {
                if (item.isFormField()) {
                    String name = item.getFieldName();
                    String value = item.getString("UTF-8");
                    System.out.println(name + "=" + value);
                } else {
                    String filename = item.getName();
                    System.out.println(filename);
                    if (filename == null || filename.trim().equals("")) {
                        continue;
                    }
                    filename = filename.substring(filename.lastIndexOf("\\") + 1);
                    InputStream in = item.getInputStream();
                    FileOutputStream out = new FileOutputStream(savePath + "\\" + filename);
                    byte buffer[] = new byte[1024];
                    int len = 0;
                    while ((len = in.read(buffer)) > 0) {
                        out.write(buffer, 0, len);
                    }
                    in.close();
                    out.close();
                    item.delete();
                    message = "文件上传成功";
                }
            }

        } catch (Exception e) {

            message = "文件上传失败";
            e.printStackTrace();
        }

        return message;
    }


}
