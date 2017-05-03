package cn.com.loan.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import cn.com.loan.common.ApplicationConstants;
import cn.com.loan.common.DateUtils;
import cn.com.loan.common.FileUtils;
import cn.com.loan.common.ObjectUtils;





/**
  * @ClassName: ImageController
  * @Description: 图片服务器
  * @author 孙立峰
  * @date 2015年5月28日 下午13:21:44
  *
  */
@Controller
@RequestMapping("/img")
public class ImageController extends BaseController{
	
    static final Logger logger = LoggerFactory.getLogger(ImageController.class);

    /**
      * @Title: show
      * @Description: 显示图片
      * @param @param request
      * @param @param response
      * @param @param model    设定文件
      * @return void    返回类型
      * @throws
     */
    @RequestMapping("/show")
    public void show(String path, HttpServletRequest request,HttpServletResponse response, Model model){
    	String file = ApplicationConstants.imgUploadPath + File.separator + path;
    	try {
			InputStream is = new FileInputStream(file);
			response.setContentType("image/gif");
            //response.setContentLength((int) f.getLength());
            ServletOutputStream op = response.getOutputStream();
            byte[] bytes = ObjectUtils.input2byte(is);
            op.write(bytes);
            op.flush();
            op.close();
		} catch (Exception e) {
			logger.debug("读取图片异常",e);
		}
    }
     
    /**
      * @Title: saveImage
      * @Description: 保存上传的图片，返回数据库保存的图片url
      * @param @param file
      * @param @return    设定文件
      * @return String    返回类型
      * @throws
     */
    public String saveImage(MultipartFile file){
    	String now = DateUtils.getDateString(new Date(), DateUtils.FORMAT3);
    	String path = ApplicationConstants.imgUploadPath + File.separator + now + File.separator;
    	
    	//判断图片保存目录是否存在，如果不存在则创建
		if(!FileUtils.checkPathExist(path)){
			FileUtils.createPath(path);
		}
    	
		String originalFileName = file.getOriginalFilename();
    	String fileName = UUID.randomUUID().toString() + originalFileName;
    	
    	File localFile = new File(path+fileName);
    	
    	try {
			file.transferTo(localFile);
		} catch (Exception e) {
			e.printStackTrace();
		} 
    	String imgUrl = now + File.separator+fileName;
    	return imgUrl;
    }
    
    
    
    
}














