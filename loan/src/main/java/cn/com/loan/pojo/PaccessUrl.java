package cn.com.loan.pojo;

import java.io.Serializable;

public class PaccessUrl implements Serializable{
    /**
	  * @Fields serialVersionUID : TODO（用一句话描述这个变量表示什么）
	  */
	
	private static final long serialVersionUID = 2686586423664374497L;

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column p_access_url.id
     *
     * @mbggenerated
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column p_access_url.url
     *
     * @mbggenerated
     */
    private String url;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column p_access_url.effective
     *
     * @mbggenerated
     */
    private Integer effective;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column p_access_url.id
     *
     * @return the value of p_access_url.id
     *
     * @mbggenerated
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column p_access_url.id
     *
     * @param id the value for p_access_url.id
     *
     * @mbggenerated
     */
    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column p_access_url.url
     *
     * @return the value of p_access_url.url
     *
     * @mbggenerated
     */
    public String getUrl() {
        return url;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column p_access_url.url
     *
     * @param url the value for p_access_url.url
     *
     * @mbggenerated
     */
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column p_access_url.effective
     *
     * @return the value of p_access_url.effective
     *
     * @mbggenerated
     */
    public Integer getEffective() {
        return effective;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column p_access_url.effective
     *
     * @param effective the value for p_access_url.effective
     *
     * @mbggenerated
     */
    public void setEffective(Integer effective) {
        this.effective = effective;
    }
}