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
 * @ClassName: AreaRegion
 * @Description: TODO
 * @author 程明
 * @date 2015年4月10日 下午1:37:17
 *
 */
public class AreaRegion {

	private String id;
	private String text;
	private String state;
	private List<AreaRegion> children;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public List<AreaRegion> getChildren() {
		return children;
	}
	public void setChildren(List<AreaRegion> children) {
		this.children = children;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
	

}
