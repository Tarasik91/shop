package com.myshop.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myshop.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService service;
	
	@RequestMapping("/view/{id}")
	public String viewProduct(@PathVariable("id") int id, Model uiModel, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/");
		service.viewProduct(uiModel, request, id, realPath);
		return "HTML/product";
	}

	@RequestMapping(value = "/type/{id}/page/{pageNumber}", method = RequestMethod.GET)
	public String getCardsByCategoryAndPage(HttpServletRequest request, Model uiModel, @PathVariable("id") int categoryId, 
			@PathVariable("pageNumber") int pageNumber) {
		//String realPath = request.getSession().getServletContext().getRealPath("/");
		service.viewByTypeAndPage(request, uiModel, categoryId, pageNumber);
		return "HTML/listing_2";
	}
}
