/**
 * @Title: LoginInterceptorAdapter.java
 * @Package cn.com.sadp.interceptor
 * @Description: TODO
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年5月5日 下午1:21:30
 * @version V1.0
 */

package cn.com.loan.interceptor;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import cn.com.loan.common.ApplicationConstants;
import cn.com.loan.common.SystemManageUtils;
import cn.com.loan.pojo.PaccessUrl;
import cn.com.loan.pojo.WloginInfo;

/**
 * @ClassName: LoginInterceptorAdapter
 * @Description: 拦截所有请求，配置url符合的要登录过的用户可以访问
 * @author 孙立峰
 * @date 2015年5月5日 下午1:21:30
 *
 */

public class LoginInterceptorAdapter extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptorAdapter.class);
	
	//@Autowired
	//private SystemService systemService;
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		// 请求的项目名称+controller的路径名
		String requestURI = request.getRequestURI();
		logger.debug(requestURI);
		// 当前用户
        WloginInfo currentUser = null;
    	Cookie[] cookies = request.getCookies();
    	if(cookies != null){
    		for (Cookie cookie : cookies) {
    			if(cookie.getName().equals(ApplicationConstants.JSESSIONIDKEY)){
					String jsessionId = cookie.getValue();
					currentUser = SystemManageUtils.getInstanse().getMregisterInfo(jsessionId);
					break;
				}
			}
    	}
		
		List<PaccessUrl> urlList = null;
		if(CollectionUtils.isNotEmpty(urlList)){
			for (PaccessUrl paccessUrl : urlList) {
				if(requestURI.startsWith(ApplicationConstants.appContextPath+paccessUrl.getUrl())){
					if(currentUser != null){
						return true;
					}else{
						response.setContentType("text/html; charset=UTF-8");
						PrintWriter out = response.getWriter();
						out.flush();
						out.println("<script>");
					    out.println("alert('请先登录！');");
					    out.println("history.back();");
					    out.println("</script>");
					    
					    return false;
					}
				}
			}
		}
		
		return true;
	
	}

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}

	
}
