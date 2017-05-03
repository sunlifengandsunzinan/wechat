/**
 * @Title: BaseController.java
 * @Package cn.com.ccms.controller
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月7日 下午2:41:44
 * @version V1.0
 */

package cn.com.loan.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import cn.com.loan.common.ApplicationConstants;
import cn.com.loan.common.CommonUtils;
import cn.com.loan.common.SystemManageUtils;
import cn.com.loan.pojo.WloginInfo;
import cn.com.loan.vo.PageInfo;

/**
 * @ClassName: BaseController
 * @Description: 父类，公用信息
 * @author 孙立峰
 * @date 2015年4月7日 下午2:41:44
 *
 */
@Controller
public class BaseController {
	
	static final Logger logger = LoggerFactory.getLogger(BaseController.class);
	
	 /**
     * 分页对象
     */
    @Autowired
    private PageInfo pageInfo;
    
	/**
     * 返回当前登录用户
     *
     * @return
     */
    public WloginInfo getCurrentUser() {
    	WloginInfo currentUser = SystemManageUtils.getInstanse().getMregisterInfo(getJSessionId());
        return currentUser;
    }
    
    /**
     * 保存当前用户
     * @param currentUser
     * void
     */
    public void setCurrentUser(WloginInfo currentUser){
    	SystemManageUtils.getInstanse().setUser(getJSessionId(), currentUser);
    }
    
    /**
     * 删除当前用户信息
     * void
     */
    public void removeCurrentUser(){
    	SystemManageUtils.getInstanse().removeUser(getJSessionId());
    }
    
    /**
	 * 返回应用跟路径
	 *
	 * @return
	 */
	public String getBasePath() {
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();
		return request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
	}
	
	
	public PageInfo getPageInfo() {
		return pageInfo;
	}

	public void setPageInfo(PageInfo pageInfo) {
		this.pageInfo = pageInfo;
	}

	/**
	 * 获得 JSESSIONID 
	 * @return
	 * String
	 */
	public String getJSessionId(){
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getRequest();  
    	Cookie[] cookies = request.getCookies();
    	String id = null;
    	boolean b = true;// 没有包含自定义JSESSIONIDKEY
    	if(cookies == null){
    		Cookie c = new Cookie(ApplicationConstants.JSESSIONIDKEY, CommonUtils.selectUUID());
    		c.setMaxAge(3600);// 默认生命周期1小时
    		id = c.getValue();
    		HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
    		response.addCookie(c);
    	}else{
    		for (Cookie cookie : cookies) {
				if(cookie.getName().equals(ApplicationConstants.JSESSIONIDKEY)){
					b = false;
					id = cookie.getValue();
					break;
				}
			}
    		if(b){
    			Cookie c = new Cookie(ApplicationConstants.JSESSIONIDKEY, CommonUtils.selectUUID());
    			c.setMaxAge(3600);// 默认生命周期1小时
	    		id = c.getValue();
	    		HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
	    		response.addCookie(c);
    		}
    	}
		return id;
	}
	
}
