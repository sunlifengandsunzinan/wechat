package cn.com.loan.controller;

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

import cn.com.loan.annotation.OAuthRequired;
import cn.com.loan.service.WregisterInfoManagerService;





/**
  * @ClassName: UserController
  * @Description: 需要验证OAuth2控制器
  * @author slf
  * @date 2015年4月8日 上午11:24:20
  *
  */
@Controller
@RequestMapping("/user")
public class UserController extends BaseController{
	
    static final Logger logger = LoggerFactory.getLogger(UserController.class);

   
    
    /** 
     * 加载个人信息，此处添加了@OAuthRequired注解 
     * @param model 
     * @return 
     */  
    @RequestMapping("/user")
    @OAuthRequired
   public String user(HttpServletRequest request,Model model){
        System.out.println("Load a User!");  
        HttpSession session = request.getSession();  
        model.addAttribute("Userid", session.getAttribute("Userid"));
	   return "user/user";
   }

    
    @RequestMapping("/test")
    @OAuthRequired
   public String test(HttpServletRequest request,Model model){
//        System.out.println("Load a User!");  
//        HttpSession session = request.getSession();  
//        model.addAttribute("Userid", session.getAttribute("Userid"));
        Properties props = new Properties();
        props.put("python.home", "/Library/Frameworks/Python.framework/Versions/2.7/bin");
        props.put("python.console.encoding", "UTF-8");
        
        props.put("python.security.respectJavaAccessibility", "false");
        
        props.put("python.import.site", "false");

        Properties preprops = System.getProperties();

        PythonInterpreter.initialize(preprops, props, new String[0]);
        PythonInterpreter interpreter = new PythonInterpreter();  
//        interpreter.exec("days=('mod','Tue','Wed','Thu','Fri','Sat','Sun'); ");  
//        interpreter.exec("print days[1];");
        interpreter.execfile("/Users/sunlifeng/git/NetEase-MusicBox/src/api.py");  
        PyFunction func = (PyFunction) interpreter.get("search", PyFunction.class);
        PyObject pyobj = func.__call__(new PyString("back"),new PyString("stype=1"));
        System.out.println("得到的python字符串是"+pyobj.toString());
	   return "user/user";
   }
    
    
    
    
    
    
    
}














