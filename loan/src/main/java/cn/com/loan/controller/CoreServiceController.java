package cn.com.loan.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;



import cn.com.loan.common.ApplicationConstants;
import cn.com.loan.common.DateUtils;
import cn.com.loan.common.FileUtils;
import cn.com.loan.common.ObjectUtils;
import cn.com.loan.common.SignUtil;





/**
  * @ClassName: ImageController
  * @Description: 图片服务器
  * @author 孙立峰
  * @date 2015年5月28日 下午13:21:44
  *
  */
@Controller
@RequestMapping("/wechat")
public class CoreServiceController extends BaseController{
	
    static final Logger logger = LoggerFactory.getLogger(CoreServiceController.class);

    /**
      * @Title: show
      * @Description: 显示图片
      * @param @param request
      * @param @param response
      * @param @param model    设定文件
      * @return void    返回类型
      * @throws
     */
    @RequestMapping(value="/get" , method = { RequestMethod.GET })
    public void get(String path, HttpServletRequest request,HttpServletResponse response, Model model,PrintWriter out){
		String signature = request.getParameter("signature");

		String timestamp = request.getParameter("timestamp");

		String nonce = request.getParameter("nonce");

		String echostr = request.getParameter("echostr");
  
        if (SignUtil.checkSignature(signature, timestamp, nonce)) {  
            out.print(echostr);  
        } else {  
            System.out.println("验证失败!");  
        }  
        out.flush();  
        out.close();  
    }
     
 
    
    
}














