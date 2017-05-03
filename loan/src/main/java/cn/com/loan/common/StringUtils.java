/**
 * @Title: StringUtils.java
 * @Package cn.com.ccms.common
 * @Description: TODO
 * Copyright: Copyright (c) 2011 
 * Company:永乐科技
 * 
 * @author 程明
 * @date 2015年4月17日 下午5:07:27
 * @version V1.0
 */

package cn.com.loan.common;

import net.sourceforge.pinyin4j.PinyinHelper;
import net.sourceforge.pinyin4j.format.HanyuPinyinCaseType;
import net.sourceforge.pinyin4j.format.HanyuPinyinOutputFormat;
import net.sourceforge.pinyin4j.format.HanyuPinyinToneType;

/**
 * @ClassName: StringUtils
 * @Description: TODO
 * @author 孙立峰
 * @date 2015年4月17日 下午5:07:27
 *
 */
public class StringUtils {
	
	public static String hanziToPinyin(String s){
		 String pinyinName = ""; 
		 char[] nameChar = s.toCharArray();  
         HanyuPinyinOutputFormat defaultFormat = new HanyuPinyinOutputFormat();  
         defaultFormat.setCaseType(HanyuPinyinCaseType.LOWERCASE);  
         defaultFormat.setToneType(HanyuPinyinToneType.WITHOUT_TONE);  
         for (int i = 0; i < nameChar.length; i++) {  
             if (nameChar[i] > 128) {  
                 try {  
                     pinyinName += PinyinHelper.toHanyuPinyinStringArray  
                                            (nameChar[i], defaultFormat)[0];  
                 } catch (Exception e) {  
                     e.printStackTrace();  
                 }  
             }else{
            	 pinyinName +=nameChar[i];
             }
         }  
         return pinyinName;  
	}
	
	
}






