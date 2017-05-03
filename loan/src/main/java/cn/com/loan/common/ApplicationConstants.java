/**
 * @Title: ApplicationConstants.java
 * @Package cn.com.ccms.common
 * @Description: TODO
 * Copyright: Copyright (c) 2011 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月17日 上午10:52:51
 * @version V1.0
 */

package cn.com.loan.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

/**
 * @ClassName: ApplicationConstants
 * @Description: 常量类
 * @author 孙立峰
 * @date 2015年4月17日 上午10:52:51
 *
 */
@Component
public final class ApplicationConstants {

	/**
	 * 该类不能初始化
	 */
	private ApplicationConstants() {
	}
	/* -----------------------------------
	 *        日志配置
	 ----------------------------------- */
	public static boolean operationLogs;
	/**
	 * 页面分页每页条数
	 */
	public static int pageSize=10;
	
	/**
	 * 邮件链接超时时长
	 */
	public static int interval;
	
	
	/**
	 * 主机地址
	 */
	public static String host;
	
	/**
	 * 系统换行符
	 */
	public static final String LINE_SEPARATOR = System.getProperty("line.separator");
	
	/**
	 * 项目名称
	 */
	public static String appContextPath;
	
	
	/**
	 * 图片上传路径
	 */
	public static String imgUploadPath;
	
	/**
	 * JSESSIONIDKEY
	 */
	public static final String JSESSIONIDKEY = "JSESSIONIDKEY";
	/**
	 * 缓存map中当前用户的key
	 */
	public static final String CURRENTUSERKEY = "CURRENTUSERKEY";
	/**
	 * 缓存中存放JSESSIONIDKEY和用户id对应的一个map关系。</br>
	 * 目的为其它接口调用本系统更新用户信息
	 */
	public static final String JSESSIONID_USER_KEY = "JSESSIONIDUSERKEY";
	
	
	/**
	 * APPID
	 */
	public static String APPID = "wx4f03d3f05d337952";
	/**
	 * SECRET
	 */
	public static String SECRET = "363dcacac3b34fa0b19ea550dce22411";
	/**
	 * 获取ACCESS_TOKEN接口
	 */
	public static String GET_ACCESSTOKEN_URL = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=APPSECRET&code=CODE&grant_type=authorization_code";
	/**
	 * ACCESS_TOKEN有效时间(单位：ms)
	 */
	public static int EFFECTIVE_TIME = 700000;
	
	/**
	 * conf.properties文件路径
	 */
	public static String CONF_PROPERTIES_PATH = "src/conf/config.properties";
	
	/**
	 * 微信接入token ，用于验证微信接口
	 */
	public static String TOKEN = "f6354055";
	
	/**
	 * 音乐api调用地址
	 */
	public static String apiAddress;
	
	/**
	 * 生成随机验证码---放到session中的key
	 */
	public static final String RANDOMCODEKEY = "RandomSecurityCode";
	
	@Value("#{config['interval']}")
	public  void setInterval(String interval) {
		ApplicationConstants.interval = Integer.valueOf(interval);
	}

	@Value("#{config['app.context.path']}")
	public  void setAppContextPath(String appContextPath) {
		ApplicationConstants.appContextPath = appContextPath;
	}
	@Value("#{config['host.address']}")
	public  void setHost(String host) {
		ApplicationConstants.host = host;
	}
	
	@Value("#{config['log.operation.logs']}")
	public void setOperationLogs(boolean operationLogs) {
		ApplicationConstants.operationLogs = operationLogs;
	}

	@Value("#{config['image.upload.path']}")
	public void setImgUploadPath(String imgUploadPath) {
		ApplicationConstants.imgUploadPath = imgUploadPath;
	}
	
	@Value("#{config['api.address']}")
	public void setApiAddress(String apiAddress) {
		ApplicationConstants.apiAddress = apiAddress;
	}
	
	
	
	
	/**
	 * lucene 存放的磁盘目录
	 */
//	public static String INDEX_DIR ;
//
//	@Value("#{config['sadp.lucene.directory.path']}")
//	public static void setINDEX_DIR(String iNDEX_DIR) {
//		INDEX_DIR = iNDEX_DIR;
//	}
	
	
}
