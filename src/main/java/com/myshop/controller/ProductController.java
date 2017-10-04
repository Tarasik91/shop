package com.myshop.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import com.myshop.bean.ProductBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.Product;
import com.myshop.model.ProductInBasket;
import com.myshop.model.ProductType;
import com.myshop.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductTypeDao productTypeDao;
	@Autowired
	private ProductService service;

	@RequestMapping("/view/{id}")
	public String viewProduct(@PathVariable("id") int id, Model uiModel, HttpServletRequest request) {
		service.viewProduct(uiModel, request, id);
		return "HTML/product";
	}

	@RequestMapping(value = "/cards", method = RequestMethod.GET)
	public String cards(HttpServletRequest request, Model uiModel) {
		HttpSession session = request.getSession();
		Object isAdmin = session.getAttribute("isAdminLogined");
		if(isAdmin != null && (boolean)isAdmin){
			uiModel.addAttribute("isAdmin", true);
		}
		service.viewCard(uiModel, request);
		return "HTML/listing_2";
	}

	@RequestMapping(value = "/productCategory/{id}", method = RequestMethod.GET)
	public String getCardsByCategory(HttpServletRequest request, Model uiModel, @PathVariable("id") int categoryId) {
		service.viewByCategory(request, uiModel, categoryId);
		return "HTML/listing_2";
	}
}
