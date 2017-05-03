/**
 * @Title: AreaRegion.java
 * @Package cn.com.ccms.vo
 * @Description: TODO
 * Copyright: Copyright (c) 2011 
 * Company:永乐科技
 * 
 * @author 程明
 * @date 2015年4月10日 下午1:37:17
 * @version V1.0
 */

package cn.com.loan.vo;

import java.util.List;

/**
 * @ClassName: Result
 * @Description: TODO
 * @author 孙立峰
 * @date 2017年4月28日 下午1:37:17
 *
 */
public class Result {

	private List<Songs> songs;

	private int songCount;
	
	public int getSongCount() {
		return songCount;
	}
	public void setSongCount(int songCount) {
		this.songCount = songCount;
	}
	public List<Songs> getSongs() {
		return songs;
	}
	public void setSongs(List<Songs> songs) {
		this.songs = songs;
	}
	
	

}
