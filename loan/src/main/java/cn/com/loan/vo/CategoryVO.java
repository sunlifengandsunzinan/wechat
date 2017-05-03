package cn.com.loan.vo;

/**
 * 
  * @ClassName: CategoryVO
  * @Description: TODO
  * @author 程明
  * @date 2015年6月16日 下午5:10:36
  *
 */
public class CategoryVO {
	
	private String firCategoryId;
	
	private String firCategoryName;
	
	private String secCategoryId;
	
	private String secCategoryName;
	
	public CategoryVO(){
		
	}
	
	public CategoryVO(String _firCategoryId,String _firCategoryName,String _secCategoryId,String _secCategoryName){
		firCategoryId = _firCategoryId;
		firCategoryName = _firCategoryName;
		secCategoryId = _secCategoryId;
		secCategoryName = _secCategoryName;
	}

	public String getFirCategoryId() {
		return firCategoryId;
	}

	public void setFirCategoryId(String firCategoryId) {
		this.firCategoryId = firCategoryId;
	}

	public String getFirCategoryName() {
		return firCategoryName;
	}

	public void setFirCategoryName(String firCategoryName) {
		this.firCategoryName = firCategoryName;
	}

	public String getSecCategoryId() {
		return secCategoryId;
	}

	public void setSecCategoryId(String secCategoryId) {
		this.secCategoryId = secCategoryId;
	}

	public String getSecCategoryName() {
		return secCategoryName;
	}

	public void setSecCategoryName(String secCategoryName) {
		this.secCategoryName = secCategoryName;
	}
	
}
