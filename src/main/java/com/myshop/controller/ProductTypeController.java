package com.myshop.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.dao.ProductTypeDao;
import com.myshop.model.ProductType;

@Controller
@RequestMapping("/productType")
public class ProductTypeController {

	@Autowired
	private ProductTypeDao productTypeDao;
	@RequestMapping(value ="/addProductType",  method = RequestMethod.POST)
	public String updateProduct(@RequestParam("name") String name) {
		ProductType product = new ProductType();
		product.setName(name);
		productTypeDao.add(product);
		return "redirect:list";
	}
	
	@RequestMapping(value ="/list",  method = RequestMethod.GET)
	public String list(Model uiModel) {
		uiModel.addAttribute("productTypes",  productTypeDao.findAll());
		return "productType-list";
	}
	@RequestMapping("/add")
	public String add(Model uiModel) {
		return "productType-edit";
	}

}
