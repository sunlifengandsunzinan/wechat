package cn.com.loan.dwr;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.loan.common.PasswordEncryptTools;
import cn.com.loan.controller.BaseController;
/**
 * 
  * @ClassName: CheckOldPasswordController
  * @Description: 更改密码时校验输入原密码是否正确 
  * @author 程明
  * @date 2015年5月27日 下午3:28:45
  *
 */
public class CheckOldPasswordController extends BaseController {
	
	static final Logger logger = LoggerFactory.getLogger(CheckOldPasswordController.class);
	
	/**
	  * @Title: checkPassword
	  * @Description: 页面初始化时调用此方法，设置session
	  * @param @param userId    设定文件
	  * @return void    返回类型
	  * @throws
	 */
	public boolean checkPassword(String oldPassword,String password) {
		 String pwd = PasswordEncryptTools.generatePassword(password);
		 return (pwd.equals(oldPassword));
	}
	
	 
	
}
