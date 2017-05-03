/**
 * @Title: MysqlDialect.java
 * @Package cn.com.ccms.interceptor
 * @Description: TODO
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月17日 上午11:00:39
 * @version V1.0
 */

package cn.com.loan.interceptor;

/**
 * @ClassName: MysqlDialect
 * @Description: Mysql实现分页查询
 * @author 于莺伟
 * @date 2015年4月17日 上午11:00:39
 *
 */

public class MysqlDialect extends Dialect {

	/**
	 * offset--去掉前offset条
	 * record--返回后record条记录
	 */
	@Override
	public String getLimitString(String sql, int offset, int record) {
		sql = sql.trim();
        StringBuffer pagingSelect = new StringBuffer();
        pagingSelect.append(sql);
        pagingSelect.append("  limit ").append(offset).append(", ").append(record);
        
        return pagingSelect.toString();
	}

}
