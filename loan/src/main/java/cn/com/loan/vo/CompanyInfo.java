/**
 * @Title: CompanyInfo.java
 * @Package cn.com.sadp.vo
 * @Description: TODO
 * Copyright: Copyright (c) 2011 
 * Company:永乐科技
 * 
 * @author 孙立峰
 * @date 2015年4月10日 下午1:37:17
 * @version V1.0
 */

package cn.com.loan.vo;


/**
 * @ClassName: FirSecCategory
 * @Description: TODO
 * @author 孙立峰
 * @date 2015年5月11日 下午1:37:17
 *
 */
public class CompanyInfo {
	private String companyid;
	private String name;
	private String img;
	private String category;
	private String area;
	private String companyname;
	private String supplynum;
	private String demandnum;
	private String dialognum;
	private String companydesc;
	private String supplydemanddesc;
	private String address;
	
	
	public String getSupplynum() {
		return supplynum;
	}
	public void setSupplynum(String supplynum) {
		this.supplynum = supplynum;
	}
	public String getDemandnum() {
		return demandnum;
	}
	public void setDemandnum(String demandnum) {
		this.demandnum = demandnum;
	}
	public String getDialognum() {
		return dialognum;
	}
	public void setDialognum(String dialognum) {
		this.dialognum = dialognum;
	}
	public String getCompanydesc() {
		return companydesc;
	}
	public void setCompanydesc(String companydesc) {
		this.companydesc = companydesc;
	}
	public String getCompanyname() {
		return companyname;
	}
	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getSupplyDemandDesc() {
		return supplydemanddesc;
	}
	public void setSupplyDemandDesc(String desc) {
		this.supplydemanddesc = desc;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCompanyid() {
		return companyid;
	}
	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	

}
