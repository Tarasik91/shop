package com.myshop.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {
	
	@RequestMapping("/admin-page")
	public String getLoginPage(){
		return "login";
	}
	
	@RequestMapping(value ="/login", method = RequestMethod.POST)
	public String login(@RequestParam(value = "password") String password,
            @RequestParam(value = "email") String user,
            HttpServletRequest servletRequest) {
		if (password != null && user != null) {
			if (user.equals("user@ukr.net") && password.equals("password")){
				HttpSession session = servletRequest.getSession();
				session.setAttribute("isAdminLogined", true);
				return "redirect:/";				
			}
		}
		return "redirect:admin-page";
	}
	
	@RequestMapping("/logout")
	public String logout( HttpServletRequest servletRequest){
		 HttpSession session = servletRequest.getSession(); 
		 session.setAttribute("isAdminLogined", null);
		 return "/login";
	}
	
	
//	@RequestMapping(method = RequestMethod.GET)
//	public String redirect (){
//		return "redirect:/product/cards";
//	}
}
