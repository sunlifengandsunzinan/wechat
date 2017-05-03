/**
 * NumberMatchingServiceImpl
 * V 1.0.0
 * 2013/12/13
 *
 * Copyright © 2013 中国电信股份有限公司电子渠道运营中心 版权所有
 *
 * 所有文字、代码资料，版权均属中国电信股份有限公司增值业务运营中心
 * 所有，任何公司或个人未经本司协议授权，不得复制、下载、存储或公开
 * 显示。违者本公司将依法追究责任。
 */
package cn.com.loan.common;

import javax.servlet.ServletContextEvent;

import org.slf4j.bridge.SLF4JBridgeHandler;
import org.springframework.web.util.Log4jConfigListener;

/**
 * 扩展Spring的Log4jConfigListener，在容器启动的时候，桥接JDK14的输出到slf4j-logger
 * @author liutong01
 * 
 */
public class LoggerIntergrationListener extends Log4jConfigListener {

	@Override
	public void contextInitialized(ServletContextEvent event) {
		installJulToSlf4jBridge();
		event.getServletContext().log("Jdk-util-logger桥接slf4j成功！");
		super.contextInitialized(event);
	}

	private void installJulToSlf4jBridge() {
		SLF4JBridgeHandler.removeHandlersForRootLogger();
		SLF4JBridgeHandler.install();
	}
}
