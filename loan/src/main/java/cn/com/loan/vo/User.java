package cn.com.loan.vo;

import java.io.Serializable;

public class User implements Serializable{

	/**
	  * @Fields serialVersionUID : TODO（用一句话描述这个变量表示什么）
	  */
	
	private static final long serialVersionUID = -4914598658672064223L;

	private String userid;  
	  
    private String username;  
  
    public String getUserid() {  
        return userid;  
    }  
  
    public void setUserid(String userid) {  
        this.userid = userid;  
    }  
  
    public String getUsername() {  
        return username;  
    }  
  
    public void setUsername(String username) {  
        this.username = username;  
    }  
  
    public User(String userid, String username) {  
        super();  
        this.userid = userid;  
        this.username = username;  
    }  
}
