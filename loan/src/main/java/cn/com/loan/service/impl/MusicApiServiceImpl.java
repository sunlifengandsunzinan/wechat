/**
 * @Title: SystemServiceImpl.java
 * @Package cn.com.sadp.service.impl
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月7日 下午1:50:39
 * @version V1.0
 */

package cn.com.loan.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.python.antlr.PythonParser.return_stmt_return;
import org.springframework.stereotype.Service;

import cn.com.loan.common.ApplicationConstants;
import cn.com.loan.common.http.HttpClient;
import cn.com.loan.service.MusicApiService;
import cn.com.loan.service.WregisterInfoManagerService;
import cn.com.loan.vo.MusicResponse;
import cn.com.loan.vo.Songs;

/**
  * @ClassName: WregisterInfoService
  * @Description: 聊天室用户登录操作
  * @author 张萌涛
  * @date 2015年4月8日 上午11:24:20
  *
  */
@Service
public class MusicApiServiceImpl implements MusicApiService {

    public final static String APIADDRESS = ApplicationConstants.apiAddress;
	
	@Override
	public List<Songs> search(String str) {
		// TODO Auto-generated method stub
		Map<String, String> params = new HashMap<String, String>();
		params.put("keywords", str.trim());
		String s = HttpClient.doGet(APIADDRESS +"/search", params);
		JSONObject jsonObject=JSONObject.fromObject(s);
		MusicResponse response = (MusicResponse)JSONObject.toBean(jsonObject,MusicResponse.class);
		return response.getResult().getSongs();
		
	}	
	
	




}






