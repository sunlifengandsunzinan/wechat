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

import java.io.Serializable;
import java.util.List;

/**
 * @ClassName: Artists
 * @Description: TODO
 * @author 孙立峰
 * @date 2017年4月28日 下午1:37:17
 *
 */
public class HMusic implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 6079606019095957276L;

	private String name;
	
	private int id;
	
	private int size;

	private String extension;
	
	private int sr;
	
	private int dfsId;
	
	private int bitrate;
	
	private int playTime;
	
	private Float volumeDelta;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public String getExtension() {
		return extension;
	}

	public void setExtension(String extension) {
		this.extension = extension;
	}

	public int getSr() {
		return sr;
	}

	public void setSr(int sr) {
		this.sr = sr;
	}

	public int getDfsId() {
		return dfsId;
	}

	public void setDfsId(int dfsId) {
		this.dfsId = dfsId;
	}

	public int getBitrate() {
		return bitrate;
	}

	public void setBitrate(int bitrate) {
		this.bitrate = bitrate;
	}

	public int getPlayTime() {
		return playTime;
	}

	public void setPlayTime(int playTime) {
		this.playTime = playTime;
	}

	public Float getVolumeDelta() {
		return volumeDelta;
	}

	public void setVolumeDelta(Float volumeDelta) {
		this.volumeDelta = volumeDelta;
	}
}
