/**
 * @Title: DateUtils.java
 * @Package cn.com.ccms.common
 * @Description: TODO
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月8日 下午5:28:48
 * @version V1.0
 */

package cn.com.loan.common;

import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName: DateUtils
 * @Description: 日期转换工具类
 * @author 孙立峰
 * @date 2015年4月8日 下午5:28:48
 *
 */

public class DateUtils {

	/**
	 * 将日期转换字符串
	 * @param date
	 * @param format 格式
	 * @return
	 */
	public static String getDateString(Date date, String format){
		DateFormat df = new SimpleDateFormat(format);
		return df.format(date);
	}
	
	/**
	 * 将毫秒专为xx时xx分xx秒xx毫秒
	 * 
	 * @param var
	 * @return
	 */
	public static String formatMillisecond(long var) {
		StringBuffer format = new StringBuffer();

		// 计算毫秒
		long millisecond = var % 1000;
		// 计算秒
		long second = (var / 1000) % 60;
		// 计算分
		long minute = (var / 1000 / 60) % 60;
		// 计算小时
		long hour = var / 1000 / 60 / 60;

		if (hour != 0)
			format.append(hour + "小时");
		if (minute != 0)
			format.append(minute + "分");
		// if (second != 0)
			format.append(second);
		if (millisecond != 0)
			format.append(".").append(new DecimalFormat("000").format(millisecond));
		format.append("秒");

		return format.toString();
	}
	
	/**
	 * 获得当前系统时间
	 * @return
	 * String
	 */
	public static String getCurrentDate(){
		DateFormat df = new SimpleDateFormat(FORMAT1);
		return df.format(new Date());
	}
	
	/**日期格式：yyyy-MM-dd hh:mm:ss*/
	public static final String FORMAT1 = "yyyy-MM-dd HH:mm:ss";
	/**日期格式：yyyy/MM/ddhh:mm*/
	public static final String FORMAT2 = "yyyy/MM/dd HH:mm";
	/**日期格式：yyyyMMdd*/
	public static final String FORMAT3 = "yyyyMMdd";
	/**日期格式：yyyy/MM/dd*/
	public static final String FORMAT4 = "yyyy/MM/dd";
	/**日期格式：yyyyMMddhhmmss*/
	public static final String FORMAT5 = "yyyyMMddhhmmss";
	
	/**日期格式：yyyyMMddhhmmss*/
	public static final String FORMAT6 = "yyyyMMddHHmmss";
}
