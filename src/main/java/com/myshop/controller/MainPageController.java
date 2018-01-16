package com.myshop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshop.bean.ProductBean;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.ProductType;
import com.myshop.service.ProductService;
import com.myshop.util.Utils;

@Controller
public class MainPageController {

	@Autowired
	private ProductTypeDao productTypeDao;

	@Autowired
	private ProductDao productDao;

	@Autowired
	private ProductService productService;

	@RequestMapping("/")
	public String getIndexPage(Model model, HttpServletResponse response, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/");
		List<ProductType> productTypes = productTypeDao.findAll();
		productService.addProductInBasketToModel(request, model);
		model.addAttribute("productTypes", productTypes);
		ProductBean bean = new ProductBean(realPath);
		model.addAttribute("products", bean.getProductBeanList(productDao.findByRating()));
		if (Utils.isAdmin(request)) {
			model.addAttribute("isAdmin", true);
		}
		return "/HTML/index";
	}
}
