package cn.com.loan.controller;

import java.util.List;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.python.core.PyFunction;
import org.python.core.PyObject;
import org.python.core.PyString;
import org.python.util.PythonInterpreter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.com.loan.annotation.OAuthRequired;
import cn.com.loan.common.ApplicationConstants;
import cn.com.loan.service.MusicApiService;
import cn.com.loan.service.WregisterInfoManagerService;
import cn.com.loan.vo.Songs;






/**
  * @ClassName: MusicController
  * @Description: 需要验证OAuth2控制器
  * @author slf
  * @date 2015年4月8日 上午11:24:20
  *
  */
@Controller
@RequestMapping("/music")
public class MusicController extends BaseController{
	
    static final Logger logger = LoggerFactory.getLogger(MusicController.class);
    
	 @Autowired
	 private MusicApiService musicApiService;
    
    /** 
     * 加载个人信息，此处添加了@OAuthRequired注解 
     * @param model 
     * @return 
     */  
    @RequestMapping("/search")
    //@OAuthRequired
   public String search(HttpServletRequest request,Model model){
        
    	
	   return "music/search";
   }

    @RequestMapping("/dosearch")
    @ResponseBody
   public String dosearch(HttpServletRequest request,String str,Model model){
        
    	List<Songs> list = musicApiService.search(str);
    	
    	return list.toString();
   }
   
    
}














