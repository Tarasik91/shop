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
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myshop.bean.MessageBody;
import com.myshop.bean.ProductBean;
import com.myshop.bean.ProductInBasketBean;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.Product;
import com.myshop.model.ProductInBasket;
import com.myshop.model.ProductType;
import com.myshop.model.enums.DeliveryType;
import com.myshop.model.enums.PaidType;
import com.myshop.util.Utils;

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
		
		if (map == null) {
			map = new HashMap<>();
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
		String realPath = request.getSession().getServletContext().getRealPath("/");
		return pib.getProductInBasketBeanList(products, map, realPath);
	}

	@RequestMapping(path = "/removeProduct", method = RequestMethod.GET)
	@ResponseBody
	public ProductInBasket removeProduct(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("productId") int productId) {
		HttpSession session = request.getSession();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		Product product = productDao.findById(productId);		
		double totalPrice = 0;
		if (map != null) {		
			totalPrice -= product.getSellingPrice() * map.get(productId);
			map.remove(productId);
		}		
		
		session.setAttribute("productIdsMap", map);
		session.setAttribute("totalPrice", totalPrice);
		ProductInBasket pib = new ProductInBasket();
		Set<Integer> productIds = map.keySet();
		List<Product> products = new ArrayList<>();
		if(productIds.size() > 0){
			products = productDao.findByIds(productIds);
		}
		session.setAttribute("productIdsMap", map);
		String realPath = request.getSession().getServletContext().getRealPath("/");
		return pib.getProductInBasketBeanList(products, map, realPath);
	}

	@RequestMapping(path = "/view", method = RequestMethod.GET)
	public String getProductFromBasket(Model model, HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String realPath = request.getSession().getServletContext().getRealPath("/");
		List<Product> products = new ArrayList<>();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		ProductInBasket pib = new ProductInBasket();
		if (map != null) {
			Set<Integer> productIds = map.keySet();
			if (productIds.size() > 0){
				products = productDao.findByIds(productIds);		
			}		
		}
		model.addAttribute("PIB", pib.getProductInBasketBeanList(products, map, realPath));
		List<ProductType> productTypes = productTypeDAO.findAll();
		model.addAttribute("productTypes", productTypes);
		if(Utils.isAdmin(request)){
			model.addAttribute("isAdmin", true);
		}
		return "cart";
	}
	
	@RequestMapping(value = "/change",  headers = "Accept=application/json",  method = RequestMethod.POST)
	@ResponseBody
	public MessageBody changeProducts(Model model, HttpServletRequest  request,  @RequestBody List<ProductInBasketBean> products){
		HttpSession session = request.getSession(true);
		session.setAttribute("productList", products);
		MessageBody body = new MessageBody();
		body.setMesssage("OK");
		return body;
	}
	
	@CrossOrigin
	@RequestMapping(value = "/checkout")
	public String getCheckout(Model model, HttpServletResponse response, HttpServletRequest request){
		List<ProductType> productTypes = productTypeDAO.findAll();
		model.addAttribute("productTypes", productTypes);
		model.addAttribute("deliveryTypes", DeliveryType.values());
		model.addAttribute("paidTypes", PaidType.values());
		response.setHeader("Access-Control-Allow-Origin", "*");
	    response.setHeader("Access-Control-Allow-Credentials", "true");
	    response.setHeader("Access-Control-Allow-Methods", "GET,HEAD,OPTIONS,POST,PUT");
	    response.setHeader("Access-Control-Allow-Headers", "Access-Control-Allow-Headers, Origin,Accept, X-Requested-With, Content-Type, Access-Control-Request-Method, Access-Control-Request-Headers");
		
		return "checkout";
	}
}
