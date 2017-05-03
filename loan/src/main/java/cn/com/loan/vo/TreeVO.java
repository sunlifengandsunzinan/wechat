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
public class TreeVO {

	private String id;
	private String text;
	private String state;
	private String url;
	private List<TreeVO> children;
	private String parent;
	private boolean checked;
	
	/**
	  * 创建一个新的实例 TreeVO. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  */
	public TreeVO() {
	}
	
	
	/**
	
	  * 创建一个新的实例 TreeVO. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param id
	  * @param text
	  */
	public TreeVO(String id, String text) {
		this.id = id;
		this.text = text;
	}



	/**
	  * 创建一个新的实例 TreeVO. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param id
	  * @param text
	  * @param state
	  */
	
	public TreeVO(String id, String text, String state) {
		this.id = id;
		this.text = text;
		this.state = state;
	}


	/**
	  * 创建一个新的实例 TreeVO. 
	  * <p>Title: </p>
	  * <p>Description: </p>
	  * @param id
	  * @param text
	  * @param state
	  * @param children
	  */
	public TreeVO(String id, String text, String state, List<TreeVO> children) {
		this.id = id;
		this.text = text;
		this.state = state;
		this.children = children;
	}

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
	public List<TreeVO> getChildren() {
		return children;
	}
	public void setChildren(List<TreeVO> children) {
		this.children = children;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}


	public String getParent() {
		return parent;
	}


	public void setParent(String parent) {
		this.parent = parent;
	}


	public boolean isChecked() {
		return checked;
	}


	public void setChecked(boolean checked) {
		this.checked = checked;
	}
	
	
	

}
