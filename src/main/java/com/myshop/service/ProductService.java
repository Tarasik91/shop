package com.myshop.service;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.UIManager;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.myshop.bean.ProductBean;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.Product;
import com.myshop.model.ProductInBasket;
import com.myshop.model.ProductType;
import com.myshop.util.PaginationModel;
import com.myshop.util.PaginationUtil;

public class ProductService {
	@Autowired
	private  ProductDao productDao;
	@Autowired
	private ProductTypeDao productTypeDao;
	
	
	
	public Model viewProduct(Model uiModel, HttpServletRequest request , int id){
		ProductBean bean = new ProductBean();
		HttpSession session = request.getSession();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		if (map != null) {
			ProductInBasket pib = new ProductInBasket();
			Set<Integer> productIds = map.keySet();
			if (productIds.size() > 0){
				List<Product> products = productDao.findByIds(productIds);
				uiModel.addAttribute("PIB", pib.getProductInBasketBeanList(products, map));
			}
		}
		List<ProductType> productTypes = productTypeDao.findAll();
		uiModel.addAttribute("productTypes", productTypes);
		uiModel.addAttribute("product", bean.getProductBean(productDao.findById(id)));
		return uiModel;
	}
	
	public Model viewCard(Model uiModel, HttpServletRequest request ){
		HttpSession session = request.getSession();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		ProductBean bean = new ProductBean();
		List<ProductType> productTypes = productTypeDao.findAll();
		uiModel.addAttribute("products", bean.getArray(productDao.findAll()));
		double totalPrice = 0;
		int count = 0;
		if (map != null) {
			totalPrice = (double) session.getAttribute("totalPrice");
			for (int key : map.keySet()) {
				count += map.get(key);
			}
			ProductInBasket pib = new ProductInBasket();
			Set<Integer> productIds = map.keySet();
			if (productIds.size() > 0) {
				List<Product> products = productDao.findByIds(productIds);
				uiModel.addAttribute("PIB", pib.getProductInBasketBeanList(products, map));
			}
		}
		uiModel.addAttribute("productTypes", productTypes);
		uiModel.addAttribute("totalPrice", totalPrice);
		uiModel.addAttribute("totalCount", count);
		return uiModel;
	}
	public Model viewByTypeAndPage(HttpServletRequest request, Model uiModel, int categoryId, int pageNumber){
		HttpSession session = request.getSession();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		Object isAdmin = session.getAttribute("isAdminLogined");
		if (isAdmin!=null && (Boolean)isAdmin){
			uiModel.addAttribute("isAdmin", true);
		}
		ProductBean bean = new ProductBean();
		List<ProductType> productTypes = productTypeDao.findAll();	
		double totalPrice = 0;
		int count = 0;
		if (map != null) {
			totalPrice = (double) session.getAttribute("totalPrice");
			for (int key : map.keySet()) {
				count += map.get(key);
			}
			ProductInBasket pib = new ProductInBasket();
			Set<Integer> productIds = map.keySet();
			if (productIds.size() > 0) {
				List<Product> products = productDao.findByIds(productIds);
				uiModel.addAttribute("PIB", pib.getProductInBasketBeanList(products, map));
			}
		}
		ProductType type = productTypeDao.findById(categoryId);
		uiModel.addAttribute("productType", type);
		PaginationModel<Product> model = productDao.findByTypeAndPage(categoryId, pageNumber);
		PaginationUtil.getMaxMinValue(model);
		uiModel.addAttribute("products", bean.getArray(model.getList()));
		uiModel.addAttribute("paginationModel", model);
		uiModel.addAttribute("productTypes", productTypes);
		uiModel.addAttribute("totalPrice", totalPrice);
		uiModel.addAttribute("totalCount", count);
		return uiModel;
	}
}
