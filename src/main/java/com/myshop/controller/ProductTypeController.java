package com.myshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.dao.ProductTypeDao;
import com.myshop.model.ProductType;
import com.myshop.util.Utils;

@Controller
@RequestMapping("/product-type")
public class ProductTypeController {

	@Autowired
	private ProductTypeDao productTypeDao;

	@RequestMapping(value = "/addProductType", method = RequestMethod.POST)
	public String updateProduct(@RequestParam("name") String name) {
		ProductType product = new ProductType();
		product.setName(name);
		productTypeDao.add(product);
		return "redirect:viewtype";
	}

	@RequestMapping("/view")
	public String viewType(Model model, HttpServletRequest request) {
		if (Utils.isAdmin(request)) {
			model.addAttribute("productTypes", productTypeDao.findAll());
			model.addAttribute("isAdmin", true);
			return "/admin/product-type";
		} else {
			return "/";
		}
	}

	@RequestMapping("/add")
	public String add(Model uiModel, @RequestParam("name") String name, HttpServletRequest request) {
		if (Utils.isAdmin(request)) {
			ProductType productType = new ProductType();
			productType.setName(name);
			productTypeDao.add(productType);
			return "redirect:/product-type/view";
		} else {
			return "/";
		}
	}

	@RequestMapping("/delete/{id}")
	public String delete(Model uiModel, @PathVariable("id") int id, HttpServletRequest request) {
		if (Utils.isAdmin(request)) {
			productTypeDao.delete(id);
			return "redirect:/product-type/view";
		} else {
			return "/";
		}
	}
}
