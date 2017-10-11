package com.myshop.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myshop.bean.ProductBean;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.Product;
import com.myshop.model.ProductInBasket;
import com.myshop.model.ProductType;
import com.myshop.model.enums.DeliveryType;
import com.myshop.model.enums.PaidType;

@Controller
@RequestMapping("/cart")
public class CartController {
	@Autowired
	private ProductDao productDao;
	
	@Autowired
	private ProductTypeDao productTypeDAO;

	@RequestMapping(path = "/addProduct", method = RequestMethod.POST,  produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProductInBasket addProduct(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("product_id") int productId, @RequestParam("product_buy_quantity") String quantityString) {
		HttpSession session = request.getSession();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		Product product = productDao.findById(productId);	
		int quantity = Integer.parseInt(quantityString);
		double totalPrice = 0;
		if (map == null) {
			totalPrice = product.getSellingPrice() * quantity;
			map = new HashMap<>();
		}else{
			totalPrice = (double) session.getAttribute("totalPrice");
			totalPrice += product.getSellingPrice() * quantity;
		}
		ProductBean bean = new ProductBean();
		bean.setQuantity(quantity);
		bean.setSellingPrice(product.getSellingPrice());
		bean.setName(product.getName());
		map.put(productId, quantity);		
		ProductInBasket pib = new ProductInBasket();
		Set<Integer> productIds = map.keySet();		
		List<Product> products = productDao.findByIds(productIds);
		session.setAttribute("productIdsMap", map);
		session.setAttribute("totalPrice", totalPrice);
		return pib.getProductInBasketBeanList(products, map);
	}

	@RequestMapping(path = "/removeProduct", method = RequestMethod.GET)
	@ResponseBody
	public String removeProduct(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("productId") int productId) {
		HttpSession session = request.getSession();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		Product product = productDao.findById(productId);		
		double totalPrice = 0;
		if (map != null) {		
			totalPrice = (double) session.getAttribute("totalPrice");
			totalPrice -= product.getSellingPrice() * map.get(productId);
			map.remove(productId);
		}		
		int count = 0;
		for (int key : map.keySet()) {
			count += map.get(key);
		}
		session.setAttribute("productIdsMap", map);
		session.setAttribute("totalPrice", totalPrice);
		return String.valueOf(count);
	}

	@RequestMapping(path = "/view", method = RequestMethod.GET)
	public String getProductFromBasket(Model uiModel, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		ProductInBasket pib = new ProductInBasket();
		if (map != null) {
			Set<Integer> productIds = map.keySet();
			if (productIds.size() > 0){
				List<Product> products = productDao.findByIds(productIds);
				uiModel.addAttribute("PIB", pib.getProductInBasketBeanList(products, map));
			}		
		}else{
			uiModel.addAttribute("PIB", pib.getProductInBasketBeanList(new ArrayList<>(), map));
		}
		List<ProductType> productTypes = productTypeDAO.findAll();
		uiModel.addAttribute("productTypes", productTypes);
		return "HTML/cart";
	}
	
	@RequestMapping("/checkout")
	public String getCheckout(Model model){
		model.addAttribute("deliveryTypes", DeliveryType.values());
		model.addAttribute("paidTypes", PaidType.values());
		return "HTML/checkout";
	}	
}
