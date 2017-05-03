/**
 * @Title: PageInfo.java
 * @Package cn.com.ccms.vo
 * @Description: TODO
 * Copyright: Copyright (c) 2011 
 * Company:永乐科技
 * 
 * @author 程明
 * @date 2015年4月17日 上午10:16:30
 * @version V1.0
 */

package cn.com.loan.vo;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import cn.com.loan.common.ApplicationConstants;

/**
 * @ClassName: PageInfo
 * @Description: TODO
 * @author 于莺伟
 * @date 2015年4月17日 上午10:16:30
 *
 */
@Component
@Scope("prototype")
public class PageInfo {
	// 默认当前页为第一页  
    private Integer pageNo = 1;
    // 总记录大小
    private Integer count = 0;
    // 分页大小
    private Integer pageSize = ApplicationConstants.pageSize;

    /**
     * 总共xx页
     *
     * @return
     */
    public Integer getTotal() {
        int totalPage = count / getPageSize();
        return count % getPageSize() == 0 ? totalPage : totalPage + 1;
    }

    /**
     * 数据库从xx条开始查询
     *
     * @return
     */
    public int getOffset() {
    	if(this.count == 0){// 说明没数据直接返回
    		return 0;
    	}
        return (pageNo - 1) * getPageSize();
    }

    public Integer getPageNo() {
        return pageNo;
    }

    public void setPageNo(Integer pageNo) {
        this.pageNo = pageNo;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
        if (pageNo > getTotal())
            pageNo = getTotal();
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
