/**
 * @Title: ObjectUtils.java
 * @Package cn.com.ccms.common
 * @Description: TODO
 * Copyright: Copyright (c) 2011 
 * Company:永乐科技
 * 
 * @author 程明
 * @date 2015年4月10日 下午2:13:12
 * @version V1.0
 */

package cn.com.loan.common;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/**
 * @ClassName: ObjectUtils
 * @Description: TODO
 * @author 孙立峰
 * @date 2015年4月10日 下午2:13:12
 *
 */

public class ObjectUtils {
	
	public static void fieldCoty(Object source, Object target)
			throws NoSuchMethodException, SecurityException,
			IllegalAccessException, IllegalArgumentException,
			InvocationTargetException {
		Class sourceClass = source.getClass();// 得到对象的Class
		Class targetClass = target.getClass();// 得到对象的Class
		Field[] sourceFields = sourceClass.getDeclaredFields();// 得到Class对象的所有属性
		Field[] targetFields = targetClass.getDeclaredFields();// 得到Class对象的所有属性
		for (Field sourceField : sourceFields) {
			String name = sourceField.getName();// 属性名
			Class type = sourceField.getType();// 属性类型
			String methodName = name.substring(0, 1).toUpperCase()
					+ name.substring(1);
			Method getMethod = sourceClass.getMethod("get" + methodName);// 得到属性对应get方法
			Object value = getMethod.invoke(source);// 执行源对象的get方法得到属性值
			for (Field targetField : targetFields) {
				String targetName = targetField.getName();// 目标对象的属性名
				if (targetName.equals(name)) {
					Method setMethod = targetClass.getMethod(
							"set" + methodName, type);// 属性对应的set方法
					setMethod.invoke(target, value);// 执行目标对象的set方法
				}
			}
		}
	}
	
	/**
	  * @Title: input2byte
	  * @Description: 将输入流转换成字节数组
	  * @param @param inStream
	  * @param @return
	  * @param @throws IOException    设定文件
	  * @return byte[]    返回类型
	  * @throws
	 */
	public static byte[] input2byte(InputStream inStream) throws IOException {  
        ByteArrayOutputStream swapStream = new ByteArrayOutputStream();  
        byte[] buff = new byte[100];  
        int rc = 0;  
        while ((rc = inStream.read(buff, 0, 100)) > 0) {  
            swapStream.write(buff, 0, rc);  
        }  
        byte[] in2b = swapStream.toByteArray();  
        return in2b;  
    } 
	
}
