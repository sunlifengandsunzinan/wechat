/**
 * @Title: Page.java
 * @Package cn.com.ccms.vo
 * @Description: TODO
 * Copyright: Copyright (c) 2011 
 * Company:永乐科技
 * 
 * @author 于莺伟
 * @date 2015年4月17日 上午9:13:12
 * @version V1.0
 */

package cn.com.loan.vo;

import java.io.IOException;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * @ClassName: Page
 * @Description: 分页自定义标签
 * @author 于莺伟
 * @date 2015年4月17日 上午9:13:12
 *
 */

public class Page extends TagSupport {
	static final Logger logger = LoggerFactory.getLogger(Page.class);

	private Integer curPage;
	private Integer totalPage;
	private Integer pageSize;
	private Integer totalCount;
	private String formId;

	public int doStartTag() throws JspException {
		if (totalCount == 0) {
			// 说明没分页数据
			try {
				pageContext
						.getOut()
						.print("<div style='background-color: #f4f4f4;'><div class='pagination'><span>无分页数据</span></div></div>");
			} catch (IOException e) {
				logger.error(e.getMessage(), e);
			}
			return super.doStartTag();
		}
		if (curPage < 1) {
			curPage = 1;
		}
		if (curPage > totalPage) {
			curPage = totalPage;
		}

		// 输出到页面的JS函数
		StringBuilder fun = new StringBuilder();
		// 输出到页面的代码
		StringBuilder str = new StringBuilder();

		fun.append("<script type='text/javascript'>")
				.append("function goPageNo(pageNo, pageSize){")
				.append("var f = document.getElementById('" + formId + "');")
				.append("if(f.action.indexOf('pageNo') < 0 ){")
				.append("f.action = f.action + '?pageNo=' + pageNo + '&pageSize=' + pageSize;")
				.append("}").append("f.method = 'POST';").append("f.submit();")
				.append("}").append("</script>");

		str.append("<div style='background-color: #f4f4f4;'>");
		str.append("<div class='pagination'>");
		str.append("<select name='pageInfo.pageSize' style='width: 50px;float:left;height:20px;' onchange=\"goPageNo("
				+ curPage
				+ ",this.options[this.selectedIndex].value);\"><option value='10' "
				+ (pageSize == 10 ? "selected='selected'" : "")
				+ ">10</option><option value='20' "
				+ (pageSize == 20 ? "selected='selected'" : "")
				+ ">20</option><option value='30' "
				+ (pageSize == 30 ? "selected='selected'" : "")
				+ ">30</option><option value='40' "
				+ (pageSize == 40 ? "selected='selected'" : "")
				+ ">40</option><option value='50' "
				+ (pageSize == 50 ? "selected='selected'" : "")
				+ ">50</option><option value='100' "
				+ (pageSize == 100 ? "selected='selected'" : "")
				+ ">100</option></select>&nbsp;&nbsp;&nbsp;&nbsp;");

		// 如果只有一页，则无需分页
		if (totalPage == 1) {
			str.append("<span class='current'>1</span>");
		} else {
			// 显示上一页与第一页
			if (curPage == 1) {
				str.append("<span class='disabled'><< 上一页</span>");
				str.append("<span class='current'>1</span>");
			} else {
				str.append("<a href='javascript:goPageNo(" + (curPage - 1)
						+ "," + pageSize + ")'><< 上一页</a>");
				str.append("<a href='javascript:goPageNo(1," + pageSize
						+ ")'>1</a>");
			}

			// 当前页超过5时第一页后面加点，因为中间相隔了第二页
			if (curPage - 4 > 1)
				str.append("<span class='gap'>...</span>");

			// v,v1分别代表中间页数的最小值和最大值,3表示显示当前页的前后三页
			int v = (curPage - 3) > 1 ? (curPage - 3) : 2;
			int v1 = (curPage + 3) < totalPage ? (curPage + 3) : totalPage - 1;
			if (v1 == totalPage) {
				v = totalPage - 10;
			} else if (v == 1 && v1 < totalPage) {
				v1 = totalPage > 10 ? 10 : totalPage;
			}

			//
			for (int i = v; i <= v1; i++) {
				if (curPage == i) { // 当前页要加粗显示
					str.append("<span class='current'>");
					str.append(i);
					str.append("</span>");
				} else {
					str.append("<a href='javascript:goPageNo(" + i + ","
							+ pageSize + ")'>" + i + "</a>");
				}
			}

			if (curPage < totalPage - 4)
				str.append("<span class='gap'>...</span>");

			// 显示最后一页
			if (curPage != totalPage) {
				str.append("<a href='javascript:goPageNo(" + totalPage + ","
						+ pageSize + ")'>" + totalPage + "</a>");
			} else {
				str.append("<span class='current'>" + curPage + "</span>");
			}

			// 显示下一页
			if (curPage == totalPage) {
				str.append("<span class='disabled'>下一页 >></span>");
			} else {
				str.append("<a href='javascript:goPageNo(" + (curPage + 1)
						+ "," + pageSize + ")'>下一页 >></a>");
			}
		}

		// 总记录数
		// b1:当前页开始数 b2:当前页结束数
		Integer b1 = 0;
		Integer b2 = 0;
		if (totalPage == 1) {// 如果只有一页
			b1 = 1;
			b2 = totalCount;
		} else {
			if (curPage == totalPage) {// 最后一页
				b1 = (curPage - 1) * pageSize + 1;
				b2 = totalCount;
			} else {
				b1 = (curPage - 1) * pageSize + 1;
				b2 = curPage * pageSize;
			}
		}

		str.append("&nbsp;&nbsp;&nbsp;&nbsp;<span>显示" + b1 + "到" + b2 + "，共"
				+ totalCount + "条记录</span>");
		str.append("</div>");
		str.append("</div>");

		try {
			pageContext.getOut().print(fun.append(str));
		} catch (IOException e) {
			logger.error(e.getMessage(), e);
		}
		return super.doStartTag();
	}

	public void setCurPage(Integer curPage) {
		this.curPage = curPage;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public void setTotalPage(Integer totalPage) {
		this.totalPage = totalPage;
	}

	public void setFormId(String formId) {
		this.formId = formId;
	}

	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	/**
	 * @Fields serialVersionUID : TODO（用一句话描述这个变量表示什么）
	 */

	private static final long serialVersionUID = 3779131109969040448L;

}
