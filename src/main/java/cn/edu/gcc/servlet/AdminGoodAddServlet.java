package cn.edu.gcc.servlet;

import cn.edu.gcc.service.GoodService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "AdminGoodAddServlet", value = "/AdminGoodAddServlet")
public class AdminGoodAddServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setHeader("Content-type", "text/html;charset=UTF-8");  		//让浏览器用utf8来解析返回的数据
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");


        try {
            //使用Map存储FD的信息
            Map<String, Object> params = new HashMap<>();
            //创建磁盘工厂对象
            DiskFileItemFactory factory =  new DiskFileItemFactory();

            //Servlet文件上传核心对象
            ServletFileUpload upload = new ServletFileUpload(factory);
            //获取war_exploded的地址
            String uploadPath = getServletContext().getRealPath("./picture/product/");

            //解析请求的内容提取文件数据
            List<FileItem> fileItemList = upload.parseRequest(request);
            //获取fd传过来的默认id
            String string = fileItemList.get(1).getString();
            System.out.println(string);
            //只能在这里获取参数 因为getParameter、getInputStream和getReader是互斥的，当流被其中一种方式读取后可能字节发生了改变，这时候用另外一种方法无论如何都获取不到的
            //所以在 fileUpload.parseRequest(request) 之后 即时用下方注释掉的代码处理request后 再尝试使用 request.getParameter去获取参数 会发现也都是null
            for (FileItem fileItem : fileItemList) {
                //FD普通表单的字段如果是文本
                if(fileItem.isFormField()){
                    params.put(fileItem.getFieldName(),fileItem.getString("UTF-8"));
                }else {
                    //文件名
                    String Filename = "0"+string+".jpg";

                    System.out.println("filename------->"+Filename);
                    //文件路径
                    String filePath = uploadPath + Filename;
                    //本地文件地址
                    String[] arr1=filePath.split("\\\\",6);
                    for (int i =0 ; i<arr1.length;i++){
                        System.out.println(arr1[i]);
                    }
                    String localPath = arr1[0]+"\\"+arr1[1]+"\\"+"web\\"+arr1[5];
                    String webPath = arr1[5];
                    params.put("images",webPath);
                    System.out.println(filePath);
                    System.out.println(localPath);

                    File storeFile = new File(filePath);

                    File storeFile1 = new File(localPath);
                    fileItem.write(storeFile);

                    fileItem.write(storeFile1);

                }
            }
            GoodService goodService = new GoodService();
            String i = String.valueOf(goodService.addGood(params));
            System.out.println(i);
            response.getWriter().write(i);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }


    }
}
