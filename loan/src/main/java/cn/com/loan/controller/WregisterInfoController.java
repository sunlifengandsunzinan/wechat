package cn.com.loan.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.com.loan.service.WregisterInfoManagerService;





/**
  * @ClassName: WregisterInfoController
  * @Description: 聊天室用户登录操作
  * @author 张萌涛
  * @date 2015年4月8日 上午11:24:20
  *
  */
@Controller
@RequestMapping("/register")
public class WregisterInfoController extends BaseController{
	
    static final Logger logger = LoggerFactory.getLogger(WregisterInfoController.class);

    @Autowired
    private WregisterInfoManagerService wrInfoManagerService;
   
    
    /**
     * 跳转注册页面
     * @return
     */
    @RequestMapping("/registerStepOne")
   public String addWregisterInfo(){
	   return "register/registerStepOne";
   }
    /**
     * 注册用户操作
     * @return
     */
    @RequestMapping("/addregister")
    public String addregister(){
    	
 	   return "register/registerStepOne";
    }
    
    
    
    
    
    
    
    
}














