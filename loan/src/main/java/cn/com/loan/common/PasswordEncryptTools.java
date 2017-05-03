/**
 * @Title: PasswordEncryptTools.java
 * @Package cn.com.ccms.common.security
 * Copyright: Copyright (c) 2011 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月7日 下午1:32:21
 * @version V1.0
 */

package cn.com.loan.common;

import java.security.MessageDigest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @ClassName: PasswordEncryptTools
 * @Description: 用户的密码用MD5加密
 * @author 孙立峰
 * @date 2015年4月7日 下午1:32:21
 *
 */

public class PasswordEncryptTools {
	
	//十六进制下数字到字符的映射数组  
    private final static String[] hexDigits = {"0", "1", "2", "3", "4",  
        "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};  
      
    /**
     *  把inputString加密
     */
    public static String generatePassword(String inputString){  
        return encodeByMD5(inputString);  
    }  
    
    /**  对字符串进行MD5加密     */  
    private static String encodeByMD5(String originString){  
        if (originString != null){  
            try{  
                //创建具有指定算法名称的信息摘要  
                MessageDigest md = MessageDigest.getInstance("MD5");  
                //使用指定的字节数组对摘要进行最后更新，然后完成摘要计算  
                byte[] results = md.digest(originString.getBytes());  
                //将得到的字节数组变成字符串返回  
                String resultString = byteArrayToHexString(results);  
                return resultString.toUpperCase();  
            } catch(Exception ex){  
                logger.error("用户密码MD5加密失败...", ex);
            }  
        }  
        return null;  
    }  
      
    /**  
     * 转换字节数组为十六进制字符串 
     * @param     字节数组 
     * @return    十六进制字符串 
     */  
    private static String byteArrayToHexString(byte[] b){  
        StringBuffer resultSb = new StringBuffer();  
        for (int i = 0; i < b.length; i++){  
            resultSb.append(byteToHexString(b[i]));  
        }  
        return resultSb.toString();  
    }  
      
    /** 将一个字节转化成十六进制形式的字符串     */  
    private static String byteToHexString(byte b){  
        int n = b;  
        if (n < 0)  
            n = 256 + n;  
        int d1 = n / 16;  
        int d2 = n % 16;  
        return hexDigits[d1] + hexDigits[d2];  
    }  
    
    public static void main(String[] args) {
		String str = "abc";
		
		String s1 = generatePassword(str);
		String s2 = generatePassword(str);
		System.out.println(s1);
		if(s1.equals(s2)){
			System.out.println("111");
		}else{
			System.out.println("222");
		}

	}
    
    private static final Logger logger = LoggerFactory.getLogger(PasswordEncryptTools.class);
}  