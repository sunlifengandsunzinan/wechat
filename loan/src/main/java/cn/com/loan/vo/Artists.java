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
public class Artists implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = 2891298634593547249L;

	private String name;
	
	private int id;
	
	private int picId;
	
	private int img1v1Id;

	private String briefDesc;
	
	private String picUrl;
	
	private String img1v1Url;
	
	private int albumSize;
	
	private String[] alias;
	
	private String trans;
	
	private int musicSize;

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

	public int getPicId() {
		return picId;
	}

	public void setPicId(int picId) {
		this.picId = picId;
	}

	public int getImg1v1Id() {
		return img1v1Id;
	}

	public void setImg1v1Id(int img1v1Id) {
		this.img1v1Id = img1v1Id;
	}

	public String getBriefDesc() {
		return briefDesc;
	}

	public void setBriefDesc(String briefDesc) {
		this.briefDesc = briefDesc;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public String getImg1v1Url() {
		return img1v1Url;
	}

	public void setImg1v1Url(String img1v1Url) {
		this.img1v1Url = img1v1Url;
	}

	public int getAlbumSize() {
		return albumSize;
	}

	public void setAlbumSize(int albumSize) {
		this.albumSize = albumSize;
	}

	public String[] getAlias() {
		return alias;
	}

	public void setAlias(String[] alias) {
		this.alias = alias;
	}

	public String getTrans() {
		return trans;
	}

	public void setTrans(String trans) {
		this.trans = trans;
	}

	public int getMusicSize() {
		return musicSize;
	}

	public void setMusicSize(int musicSize) {
		this.musicSize = musicSize;
	}

}
