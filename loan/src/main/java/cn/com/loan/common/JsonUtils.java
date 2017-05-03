/**
 * @Title: JsonUtils.java
 * @Package cn.com.ccms.common
 * @Description: TODO
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月10日 下午1:38:07
 * @version V1.0
 */

package cn.com.loan.common;

import java.io.IOException;
import java.text.SimpleDateFormat;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @ClassName: JsonUtils
 * @Description: json工具
 * @author 孙立峰
 * @date 2015年4月10日 下午1:38:07
 *
 */

public class JsonUtils {

	 final static Logger logger = LoggerFactory.getLogger(JsonUtils.class);

	    /**
	     * 转成Json字符串
	     *
	     * @param object
	     * @param outputEmpty 是否输出空值
	     * @return
	     */
	    public static String toJsonString(Object object, boolean outputEmpty) {
	        if (object != null) {
	            try {
	                ObjectMapper mapper = new ObjectMapper();
	                if (!outputEmpty) {
	                    // 不输出空值
	                    mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);
	                }
	                mapper.setDateFormat(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"));
	                String json = mapper.writeValueAsString(object);

	                return json;
	            } catch (IOException e) {
	                logger.error("Json格式化异常", e);
	            }
	        }
	        return null;
	    }
}
