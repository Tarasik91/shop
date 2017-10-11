package com.myshop.util;

public class ImageUtil {
	public  String getRealPath(){
		String fullPath = getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		String pathArr[] = fullPath.split("/WEB-INF/classes/");
		fullPath = pathArr[0];
		fullPath  = System.getProperty("catalina.base") + "/webapps/myshop/";
		return fullPath+ "\\resources\\image\\";
	}
}
