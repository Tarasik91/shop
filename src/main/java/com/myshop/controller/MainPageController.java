package com.myshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myshop.bean.ProductBean;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.ProductType;

@Controller
public class MainPageController {

	@Autowired
	private ProductTypeDao productTypeDao;
	
	@Autowired
	private ProductDao productDao;
	
	@RequestMapping("/")
	public String getIndexPage(Model model){
		List<ProductType> productTypes = productTypeDao.findAll();
		model.addAttribute("productTypes", productTypes);
		ProductBean bean = new ProductBean();
		model.addAttribute("products", bean.getProductBeanList(productDao.findByRating()));
		return "/HTML/index";
	}
}
