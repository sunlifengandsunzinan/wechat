/**
 * @Title: Utils.java
 * @Package cn.com.sadp.webService
 * @Description: TODO
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年5月7日 下午5:05:22
 * @version V1.0
 */

package cn.com.loan.webService;

import java.util.Map;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;

import org.springframework.beans.factory.annotation.Autowired;

import cn.com.loan.common.ApplicationConstants;
import cn.com.loan.common.SystemManageUtils;
import cn.com.loan.dao.WloginInfoMapper;
import cn.com.loan.pojo.WloginInfo;

/**
 * @ClassName: Utils
 * @Description: webService-工具包接口
 * @author 孙立峰
 * @date 2015年5月7日 下午5:05:22
 *
 */
@Path(value = "/utils/")
@Produces({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
public class Utils {


	@Autowired
	private WloginInfoMapper loginInfoMapper;
	
	/**
	 * 更新当前用户信息
	 * @return
	 * String
	 */
	@SuppressWarnings("unchecked")
	@POST
	@Path("/updateCurrentUser")
	@Consumes({MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML})
	public Response updateCurrentUser(String userId){
		
		Response response = new Response();
		response.setMessage("更新用户失败");
		response.setCode(1);
		
		CacheManager cacheManager = CacheManager.getInstance();
		Cache cache = cacheManager.getCache(SystemManageUtils.CACHESESSION);
		// MregisterInfo的id 和 jsessionId
		Element e = cache.get(ApplicationConstants.JSESSIONID_USER_KEY);
		if(e != null){
			Map<String, String> idSessionMap = (Map<String, String>)e.getObjectValue();
			if(idSessionMap == null){
				response.setMessage("没有要更新的用户");
				response.setCode(0);
			}
			String jsessionId = idSessionMap.get(userId);
			// jsessionId 和 MregisterInfo
			Element element = cache.get(jsessionId);
			if(element != null){
				Map<String, WloginInfo> jsessionMap = (Map<String, WloginInfo>)element.getObjectValue();
				if(jsessionMap != null){
					WloginInfo mregisterInfo = loginInfoMapper.selectByPrimaryKey(userId);
					jsessionMap.put(ApplicationConstants.CURRENTUSERKEY, mregisterInfo);
					response.setMessage("更新用户成功");
					response.setCode(0);
					element = new Element(jsessionId, jsessionMap);
					cache.put(element);
				}else{
					response.setMessage("没有要更新的用户");
					response.setCode(0);
				}
			}
		}
		
		return response;
	} 
}
