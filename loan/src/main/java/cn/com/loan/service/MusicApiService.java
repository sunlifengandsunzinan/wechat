/**
 * @Title: SystemService.java
 * @Package cn.com.sadp.service
 * Copyright: Copyright (c) 2015 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月7日 下午1:48:17
 * @version V1.0
 */

package cn.com.loan.service;

import java.util.List;

import cn.com.loan.vo.Songs;


/**
  * @ClassName: MusicApiService
  * @Description: 调用音乐api
  * @author 孙立峰
  * @date 2017年4月28日 上午11:24:20
  *
  */
public interface MusicApiService {
	
	public List<Songs> search(String str);
	
}
