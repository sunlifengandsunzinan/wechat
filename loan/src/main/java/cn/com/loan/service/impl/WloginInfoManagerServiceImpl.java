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

import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.com.loan.dao.WloginInfoMapper;
import cn.com.loan.pojo.WloginInfo;
import cn.com.loan.pojo.WloginInfoExample;
import cn.com.loan.service.WloginInfoManagerService;
import cn.com.loan.service.WregisterInfoManagerService;

/**
  * @ClassName: WloginInfoManagerServiceImpl
  * @Description: 登陆
  * @author 孙立峰
  * @date 2015年4月8日 上午11:24:20
  *
  */
@Service
public class WloginInfoManagerServiceImpl implements WloginInfoManagerService {
	
	@Autowired
	private WloginInfoMapper wloginInfoMapper;
	
	
    @Override
    public WloginInfo queryRegisterInfo(String username,String password) {
    	WloginInfoExample example = new WloginInfoExample();
    	WloginInfoExample.Criteria criteria = example.createCriteria();
    	criteria.andEmailEqualTo(username);
    	criteria.andLoginPasswordEqualTo(password);
    	List<WloginInfo> list = wloginInfoMapper.selectByExample(example);
		if(CollectionUtils.isNotEmpty(list)){
			return list.get(0);
		}
		return null;
    }

	
	




}






