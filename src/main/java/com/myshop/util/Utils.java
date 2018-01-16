package com.myshop.util;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Utils {
	public static boolean isAdmin(HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object isAdmin = session.getAttribute("isAdminLogined");
		if (isAdmin == null || !(Boolean) isAdmin)
			return false;
		return true;
	}
}
