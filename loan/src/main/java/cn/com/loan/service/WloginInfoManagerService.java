/**
 * @Title: SystemService.java
 * @Package cn.com.sadp.service
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月7日 下午1:48:17
 * @version V1.0
 */

package cn.com.loan.service;

import java.util.List;

import cn.com.loan.pojo.WloginInfo;


/**
  * @ClassName: WloginInfoManagerService
  * @Description: 登陆
  * @author 孙立峰
  * @date 2015年4月8日 上午11:24:20
  *
  */
public interface WloginInfoManagerService {
	
	/**
	 * 根据Email和密码查询登陆用户
	 * @param
	 * @return
	 * WloginInfo
	 */
	public WloginInfo queryRegisterInfo(String username,String password);
	
}
