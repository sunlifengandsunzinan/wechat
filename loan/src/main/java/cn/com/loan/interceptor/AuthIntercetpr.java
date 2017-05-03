/**
 * @Title: AuthIntercetpr.java
 * @Package cn.com.sadp.interceptor
 * @Description: TODO
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年5月11日 上午10:19:52
 * @version V1.0
 */

package cn.com.loan.interceptor;

import org.apache.cxf.configuration.security.AuthorizationPolicy;
import org.apache.cxf.interceptor.Fault;
import org.apache.cxf.interceptor.security.AuthenticationException;
import org.apache.cxf.message.Message;
import org.apache.cxf.phase.AbstractPhaseInterceptor;
import org.apache.cxf.phase.Phase;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @ClassName: AuthIntercetpr
 * @Description: webService的安全认证，用户名和密码
 * @author 于莺伟
 * @date 2015年5月11日 上午10:19:52
 *
 */

public class AuthIntercetpr extends AbstractPhaseInterceptor<Message> {

	private String userName;
	private String password;
	
	public AuthIntercetpr() {
		super(Phase.READ);
		logger.debug("========================="+Phase.READ);
	}

	@Override
	public void handleMessage(final Message message) throws Fault {

        String name = null;
        String password = null;
        
        AuthorizationPolicy policy = message.get(AuthorizationPolicy.class);
        if (policy != null) {
            name = policy.getUserName();
            password = policy.getPassword();
        } 

        if (name == null || password == null) {
        	logger.error("webService的用户名或密码不能为空。。。");
            throw new AuthenticationException("webService的用户名或密码不能为空。。。");
        }

        if(!name.equals(this.userName) || !password.equals(this.password)){
        	logger.error("webService的用户名或密码不正确。。。");
            throw new AuthenticationException("webService的用户名或密码不正确。。。");
        }
       
    }
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	private static final Logger logger = LoggerFactory.getLogger(AuthIntercetpr.class);
}
