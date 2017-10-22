package com.myshop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myshop.bean.MessageBody;
import com.myshop.dao.OrderDao;
import com.myshop.dao.ProductInOrderDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.Order;
import com.myshop.model.ProductInOrder;
import com.myshop.model.enums.OrderStatus;

@Controller
@RequestMapping("/invoice")
public class InvoiceController {
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ProductInOrderDao productInOrderDao;
	@Autowired
	private ProductTypeDao productTypeDao;
	
	@RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
	public String view(@PathVariable("id") int id, Model model){
		Order order  = orderDao.findById(id);
		List<ProductInOrder> products = productInOrderDao.findByOrder(order);
		model.addAttribute("order", order);
		model.addAttribute("orderStatuses", OrderStatus.values());
		model.addAttribute("productTypes", productTypeDao.findAll());
		model.addAttribute("products", products);
		return "HTML/invoice";
	}
	
	@RequestMapping(value = "/changeStatus", method = RequestMethod.POST)
	@ResponseBody
	public MessageBody changeStatus(@RequestParam("orderId") int orderId, @RequestParam("statusId") OrderStatus status){
		orderDao.updateStatus(orderId, status);
		return new MessageBody("OK", null);
	}

}
