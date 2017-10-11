package com.myshop.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myshop.bean.OrderBean;
import com.myshop.dao.OrderDao;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductInOrderDao;
import com.myshop.model.Order;
import com.myshop.model.ProductInOrder;
import com.myshop.model.enums.DeliveryType;
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
		Order order = new Order();
		order.setFirstName(firstName);
		order.setLastName(lastName);
		order.setAddress(address);
		order.setEmail(email);
		order.setTelephone(telephone);
		orderDao.add(order);		
		
		Map<Integer, Integer> map = (Map<Integer, Integer>) request.getSession().getAttribute("productIdsMap");
		
		productInOrderDao.addProducts(getProducts(map, order));
		request.getSession().setAttribute("productIdsMap", null);
		return "redirect:/product/cards";
	}
	
	private List<ProductInOrder> getProducts(Map<Integer,Integer> map, Order order){
		Set<Integer> productIds = map.keySet();
		List<ProductInOrder> result = new ArrayList<>();
		if (productIds.size() > 0){
			for(int id : productIds){
				ProductInOrder productInOrder = new ProductInOrder();
				productInOrder.setProduct(productDao.findById(id));
				productInOrder.setQuantity(map.get(id));
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
		return "/HTML/orders";
	}
}
