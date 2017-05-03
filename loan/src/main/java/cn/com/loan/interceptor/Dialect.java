/**
 * @Title: Dialect.java
 * @Package cn.com.ccms.interceptor
 * @Description: TODO
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月17日 上午10:59:18
 * @version V1.0
 */

package cn.com.loan.interceptor;

/**
 * @ClassName: Dialect
 * @Description: MyBatis实现物理分页
 * @author 于莺伟
 * @date 2015年4月17日 上午10:59:18
 *
 */

public abstract class Dialect {

	public abstract String getLimitString(String sql, int skipResults,
			int maxResults);

	public static enum Type {
		MYSQL, ORACLE
	}
}
