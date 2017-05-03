/**
 * @Title: AreaRegion.java
 * @Package cn.com.ccms.vo
 * @Description: TODO
 * Copyright: Copyright (c) 2011 
 * Company:永乐科技
 * 
 * @author 程明
 * @date 2015年4月10日 下午1:37:17
 * @version V1.0
 */

package cn.com.loan.vo;

import java.util.List;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * @ClassName: Authenticator
 * @Description: TODO
 * @author 孙立峰
 * @date 2015年4月10日 下午1:37:17
 *
 */
public class EmailAuthenticator extends Authenticator{

	private String userName="";  
	private  String password="";  
	    public EmailAuthenticator(String userName,String password){  
	        this.userName=userName;  
	        this.password=password;  
	    }  
	     protected PasswordAuthentication getPasswordAuthentication(){     
	        return new PasswordAuthentication(userName, password);     
	     }   

}
