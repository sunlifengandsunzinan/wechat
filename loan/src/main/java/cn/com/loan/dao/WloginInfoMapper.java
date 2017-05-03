package cn.com.loan.dao;

import cn.com.loan.pojo.WloginInfo;
import cn.com.loan.pojo.WloginInfoExample;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface WloginInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    int countByExample(WloginInfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    int deleteByExample(WloginInfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    int insert(WloginInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    int insertSelective(WloginInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    List<WloginInfo> selectByExample(WloginInfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    WloginInfo selectByPrimaryKey(String id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    int updateByExampleSelective(@Param("record") WloginInfo record, @Param("example") WloginInfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    int updateByExample(@Param("record") WloginInfo record, @Param("example") WloginInfoExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(WloginInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table w_login_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(WloginInfo record);
}