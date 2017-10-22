package com.myshop.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.bean.OrderBean;
import com.myshop.bean.ProductInBasketBean;
import com.myshop.dao.OrderDao;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductInOrderDao;
import com.myshop.model.Order;
import com.myshop.model.ProductInOrder;
import com.myshop.model.enums.DeliveryType;
import com.myshop.model.enums.OrderStatus;
import com.myshop.model.enums.PaidType;

@Controller
@RequestMapping("/order")
public class OrderController {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductInOrderDao productInOrderDao;
	@RequestMapping("/save")
	public String saveOrder(HttpServletResponse response,
							HttpServletRequest request,
			@RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName,
			@RequestParam("email") String email,
			@RequestParam("telephone") String telephone,
			@RequestParam("address") String address){
		HttpSession session = request.getSession();
		Order order = new Order();
		order.setFirstName(firstName);
		order.setLastName(lastName);
		order.setAddress(address);
		order.setEmail(email);
		order.setTelephone(telephone);
		order.setAmount( (double) session.getAttribute("totalPrice"));
		orderDao.add(order);		
		
		List<ProductInBasketBean> products = (List<ProductInBasketBean>) session.getAttribute("productIdsMap");
		productInOrderDao.addProducts(getProducts(products, order));
		request.getSession().setAttribute("productIdsMap", null);
		return "redirect:/product/cards";
	}
	
	private List<ProductInOrder> getProducts(List<ProductInBasketBean> products, Order order){
		
		List<ProductInOrder> result = new ArrayList<>();
		if (products !=null &&  products.size() > 0){
			for(ProductInBasketBean product : products){
				ProductInOrder productInOrder = new ProductInOrder();
				productInOrder.setProduct(productDao.findById(product.getProductId()));
				productInOrder.setQuantity(product.getQuantity());
				productInOrder.setPrice(product.getPrice());
				productInOrder.setOrder(order);
				result.add(productInOrder);
			}
		}		
		return result;
	}
	
	@RequestMapping("/cards")
	public String view(Model model){
		model.addAttribute("deliveryTypes", DeliveryType.values());
		model.addAttribute("paidTypes", PaidType.values());
		model.addAttribute("orders",orderDao.findAll());
		model.addAttribute("statuses", OrderStatus.values());
		model.addAttribute("localDateTimeFormat", new SimpleDateFormat("yyyy-MM-dd'T'hh:mm"));
		return "/HTML/orders";
	}
}
