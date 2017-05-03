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
import java.util.Date;
import java.util.List;

/**
 * @ClassName: Artists
 * @Description: TODO
 * @author 孙立峰
 * @date 2017年4月28日 下午1:37:17
 *
 */
public class Album implements Serializable{



	/**
	 * 
	 */
	private static final long serialVersionUID = -6835430915076394650L;

	private String name;
	
	private int id;
	
	private String type;
	
	private int size;
	
	private int picId;
	
	private String blurPicUrl;

	private int companyId;
	
	private int pic;
	
	private String picUrl;
	
	private Date publishTime;
	
	private String description;
	
	private String tags;

	private String company;
	
	private String briefDesc;
	
	private Artists artist;
	
	private String[]  songs;
	
	private String[]  alias;
	
	private int status;
	
	private int copyrightId;
	
	private String commentThreadId;
	
	private List<Artists> artists;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getPicId() {
		return picId;
	}

	public void setPicId(int picId) {
		this.picId = picId;
	}

	public String getBlurPicUrl() {
		return blurPicUrl;
	}

	public void setBlurPicUrl(String blurPicUrl) {
		this.blurPicUrl = blurPicUrl;
	}

	public int getCompanyId() {
		return companyId;
	}

	public void setCompanyId(int companyId) {
		this.companyId = companyId;
	}

	public int getPic() {
		return pic;
	}

	public void setPic(int pic) {
		this.pic = pic;
	}

	public String getPicUrl() {
		return picUrl;
	}

	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}

	public Date getPublishTime() {
		return publishTime;
	}

	public void setPublishTime(Date publishTime) {
		this.publishTime = publishTime;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getTags() {
		return tags;
	}

	public void setTags(String tags) {
		this.tags = tags;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getBriefDesc() {
		return briefDesc;
	}

	public void setBriefDesc(String briefDesc) {
		this.briefDesc = briefDesc;
	}

	public Artists getArtist() {
		return artist;
	}

	public void setArtist(Artists artist) {
		this.artist = artist;
	}

	public String[] getSongs() {
		return songs;
	}

	public void setSongs(String[] songs) {
		this.songs = songs;
	}

	public String[] getAlias() {
		return alias;
	}

	public void setAlias(String[] alias) {
		this.alias = alias;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public int getCopyrightId() {
		return copyrightId;
	}

	public void setCopyrightId(int copyrightId) {
		this.copyrightId = copyrightId;
	}

	public String getCommentThreadId() {
		return commentThreadId;
	}

	public void setCommentThreadId(String commentThreadId) {
		this.commentThreadId = commentThreadId;
	}

	public List<Artists> getArtists() {
		return artists;
	}

	public void setArtists(List<Artists> artists) {
		this.artists = artists;
	}
}
