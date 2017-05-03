/**
 * @Title: CommonUtils.java
 * @Package cn.com.ccms.common
 * @Description: TODO
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月8日 下午5:24:59
 * @version V1.0
 */

package cn.com.loan.common;

import java.util.UUID;

/**
 * @ClassName: CommonUtils
 * @Description: 工具类
 * @author 孙立峰
 * @date 2015年4月8日 下午5:24:59
 *
 */

public class CommonUtils {

	/**
	 * 获得40位大写的uuid
	  *
	  * @return
	  * String
	 */
	public static String selectUUID(){
		UUID uuid = UUID.randomUUID();
		return "00000000" + uuid.toString().replace("-", "").toUpperCase();
	}
	
}
