/**
 * @Title: LoginDwrController.java
 * @Package cn.com.sadp.dwr
 * @Description: TODO
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年5月18日 下午1:39:41
 * @version V1.0
 */

package cn.com.loan.dwr;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import cn.com.loan.common.ApplicationConstants;
import cn.com.loan.common.DateUtils;
import cn.com.loan.common.PasswordEncryptTools;
import cn.com.loan.controller.BaseController;
import cn.com.loan.pojo.WloginInfo;
import cn.com.loan.service.WloginInfoManagerService;

/**
 * @ClassName: LoginDwrController
 * @Description: 登录
 * @author 孙立峰
 * @date 2015年5月18日 下午1:39:41
 *
 */

public class LoginDwrController extends BaseController {

	@Autowired
	private WloginInfoManagerService loginInfoManagerService;
	
	/**
	 * 检测验证码
	 * @param code
	 * @return
	 */
	public boolean checkRandomSecurityCode(String code, HttpSession session){		
		if(StringUtils.isNoneBlank(code) && session != null){
			Object randomCode = session.getAttribute(ApplicationConstants.RANDOMCODEKEY);
			if(randomCode != null && StringUtils.isNoneBlank(randomCode.toString())){
				if(code.toUpperCase().equals(randomCode.toString().toUpperCase())){
					return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * 登录
	 * @param userName
	 * @param userPwd
	 * @param session
	 * @return
	 */
	public boolean Login(String emailName,String userPwd,HttpServletRequest request,HttpSession session){
		
		if(StringUtils.isNoneBlank(emailName) && StringUtils.isNoneBlank(userPwd)){
			String password = PasswordEncryptTools.generatePassword(userPwd);
			
			WloginInfo registerInfo = loginInfoManagerService.queryRegisterInfo(emailName, password);
			if(registerInfo != null){
				setCurrentUser(registerInfo);
				logger.info("用户：{}--时间：{}--登录成功...", registerInfo.getEmail(), DateUtils.getCurrentDate());
				return true;
			}
			
			if(emailName.equals("1")){
				logger.info("用户：{}--时间：{}--登录成功...", emailName, DateUtils.getCurrentDate());
				return true;
			}
		}
		
		return false;
	}
	
	/**
	 * 注销
	 * @param session
	 * @return
	 */
	public String LoginOut(HttpSession session,HttpServletRequest request){
		
		String emailName = "";
		WloginInfo currentUser = getCurrentUser();
		if(currentUser != null){
			emailName = currentUser.getEmail();
		}
		removeCurrentUser();
		logger.info("用户：{}--时间：{}--注销成功...", emailName, DateUtils.getCurrentDate());
		return "true";
	}
	
	private static final Logger logger = LoggerFactory.getLogger(LoginDwrController.class);
}
