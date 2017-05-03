/**
 * @Title: SystemManage.java
 * @Package cn.com.sadp.common
 * @Description: TODO
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年5月5日 上午9:57:08
 * @version V1.0
 */

package cn.com.loan.common;

import java.util.HashMap;
import java.util.Map;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import cn.com.loan.pojo.WloginInfo;

/**
 * @ClassName: SystemManage
 * @Description: 系统管理类
 * @author 孙立峰
 * @date 2015年5月5日 上午9:57:08
 *
 */

public class SystemManageUtils {
	
	//@Autowired
	//private CacheManager cacheManager;
	
	/**
	 * 缓存的名称。类似于session对象，存放如当前用户等信息。
	 */
	public static final String CACHESESSION = "SystemManageUtilsCache";
//	private static final String SESSIONMAP = "sessionMap";
//	private static final String IDSESSIONMAP = "idSessionMap";

	// sessionId 和 MregisterInfo
	//private static Map<String, MregisterInfo> sessionMap = new HashMap<String, MregisterInfo>();
	// MregisterInfo的id 和 sessionId
	//private static Map<String, String> map = new HashMap<String, String>();
	
	private volatile static SystemManageUtils sm;
	
	private SystemManageUtils(){
		
	}
	
	// 双重检查锁定,无论是多线程或类装载器都能保证单例
	public static SystemManageUtils getInstanse(){
		if(sm == null){
			synchronized(SystemManageUtils.class){
				if(sm == null){
					sm = new SystemManageUtils();
					
				}
			}
		}
		return sm;
	}
	
	@SuppressWarnings("unchecked")
	public void setUser(String jsessionId, WloginInfo user){
		Cache cache = getCache();
		// jsessionId 和 MregisterInfo
		Element element = cache.get(jsessionId);
		if(element != null ){
			Map<String, WloginInfo> jsessionMap = (Map<String, WloginInfo>)element.getObjectValue();
			jsessionMap.put(ApplicationConstants.CURRENTUSERKEY, user);
			element = new Element(jsessionId, jsessionMap);
			cache.put(element);
		}else{
			Map<String, WloginInfo> jsessionMap = new HashMap<String, WloginInfo>();
			jsessionMap.put(ApplicationConstants.CURRENTUSERKEY, user);
			element = new Element(jsessionId, jsessionMap);
			cache.put(element);
		}
		// MregisterInfo的id 和 jsessionId
		Element e = cache.get(ApplicationConstants.JSESSIONID_USER_KEY);
		if(e != null){
			Map<String, String> idSessionMap = (Map<String, String>)e.getObjectValue();
			idSessionMap.put(user.getId(), jsessionId);
			e = new Element(ApplicationConstants.JSESSIONID_USER_KEY, idSessionMap);
			cache.put(e);
		}else{
			Map<String, String> idSessionMap = new HashMap<String, String>();
			idSessionMap.put(user.getId(), jsessionId);
			e = new Element(ApplicationConstants.JSESSIONID_USER_KEY, idSessionMap);
			cache.put(e);
		}
	}
	
	@SuppressWarnings("unchecked")
	public void removeUser(String jsessionId){
		Cache cache = getCache();
		String userId = null;
		// jsessionId 和 MregisterInfo
		Element element = cache.get(jsessionId);
		if(element != null ){
			Map<String, WloginInfo> jsessionMap = (Map<String, WloginInfo>)element.getObjectValue();
			WloginInfo info = jsessionMap.get(ApplicationConstants.CURRENTUSERKEY);
			if(info != null){
				userId = info.getId();
			}
			jsessionMap.remove(ApplicationConstants.CURRENTUSERKEY);
			element = new Element(jsessionId, jsessionMap);
			cache.put(element);
		}
		// MregisterInfo的id 和 jsessionId
		Element e = cache.get(ApplicationConstants.JSESSIONID_USER_KEY);
		if(e != null){
			Map<String, String> idSessionMap = (Map<String, String>)e.getObjectValue();
			idSessionMap.remove(userId);
			e = new Element(ApplicationConstants.JSESSIONID_USER_KEY, idSessionMap);
			cache.put(e);
		}
	}
	
	/**
	 * 获得当前用户
	 * @param jsessionId
	 * @return
	 * MregisterInfo
	 */
	@SuppressWarnings("unchecked")
	public WloginInfo getMregisterInfo(String jsessionId){
		Cache cache = getCache();
		Element element = cache.get(jsessionId);
		if(element != null ){
			Map<String, WloginInfo> jsessionMap = (Map<String, WloginInfo>)element.getObjectValue();
			return jsessionMap.get(ApplicationConstants.CURRENTUSERKEY);
		}
		return null;
	}

//	@SuppressWarnings("unchecked")
//	public Map<String, MregisterInfo> getSessionMap() {
//		CacheManager cacheManager = CacheManager.getInstance();
//		Cache cache = cacheManager.getCache(CACHESESSION);
//		Element element = cache.get(SESSIONMAP);
//		if(element == null){
//			Map<String, MregisterInfo> sessionMap = new HashMap<String, MregisterInfo>();
//			element = new Element(SESSIONMAP, sessionMap);
//			cache.put(element);
//		}
//		
//		element = cache.get(SESSIONMAP);
//		return (Map<String, MregisterInfo>)element.getObjectValue();
//	}

	
//	@SuppressWarnings("unchecked")
//	public Map<String, String> getMap() {
//		
//		Cache cache = getCache();
//		Element element = cache.get(IDSESSIONMAP);
//		if(element == null){
//			Map<String, String> idSessionMap = new HashMap<String, String>();
//			element = new Element(IDSESSIONMAP, idSessionMap);
//			cache.put(element, true);
//		}
//		element = cache.get(IDSESSIONMAP);
//		return (Map<String, String>)element.getObjectValue();
//	}
	
	
	/**
	 * 获得 SystemManageUtilsCache 缓存对象
	 * @return
	 * Cache
	 */
	private Cache getCache(){
		CacheManager cacheManager = CacheManager.getInstance();
		Cache cache = cacheManager.getCache(CACHESESSION);
		return cache;
	}
}
