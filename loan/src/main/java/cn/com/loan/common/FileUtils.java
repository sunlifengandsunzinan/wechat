package cn.com.loan.common;

import java.io.File;

public class FileUtils {
	
	/**
	  * @Title: checkPathExist
	  * @Description: 判断目录是否存在
	  * @param @param path
	  * @param @return    设定文件
	  * @return boolean    返回类型
	  * @throws
	 */
	public static boolean checkPathExist(String path){
		boolean result = false;
		File file=new File(path);
		result = file.exists();
		return result;
	}
	
	public static boolean createPath(String path){
		File file = new File(path);
		return file.mkdirs();
	}
	
	public static void main(String[] args) {
		
	}
	
}
