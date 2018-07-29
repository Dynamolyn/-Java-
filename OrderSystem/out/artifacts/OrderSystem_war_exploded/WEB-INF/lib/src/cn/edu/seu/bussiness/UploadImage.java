package cn.edu.seu.bussiness;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.Buffer;
import java.util.List;

/**
 * 文件上传方法封装类
 * <p>
 * savePath 为希望文件保存的路径
 * request 为HttpServletRequest对象，由servlet调用时传入
 * 返回值为String类型的提示信息，“文件上传成功”或“文件上传失败”
 */
public class UploadImage {
    public static BufferedImage uploadImage(HttpServletRequest request) {
        String message = "";
        InputStream in = null;
        BufferedImage img = null;

        try {
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setHeaderEncoding("UTF-8");
            if (!ServletFileUpload.isMultipartContent(request)) {
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
                    in = item.getInputStream();
                    img = ImageIO.read(in);

                    message = "文件上传成功";
                }
            }

        } catch (Exception e) {
            message = "文件上传失败";
            e.printStackTrace();
        }finally {
            try {
                in.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        return img;
    }


}
