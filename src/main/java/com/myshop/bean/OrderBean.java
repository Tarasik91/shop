package com.myshop.bean;

import java.util.ArrayList;
import java.util.List;

import com.myshop.model.Order;

public class OrderBean {
	enum STATUS  {CANSELLED, COMPLATED, RESERVED};
	public static int COLUMN = 3;
	private int id;
	private STATUS status;
	private String firstName;
	private String lastName;
	private String email;
	private String address;
	private String telephone;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	
	public OrderBean[][] getArray(List<Order> orderList) {
		List<OrderBean> list = getProductBeanList(orderList);
		int row = list.size() / COLUMN;
		if (list.size() % COLUMN != 0)
			row += 1;
		OrderBean[][] result = new OrderBean[row][COLUMN];
		int j = 0;
		for (int i = 0; i < row; i++) {
			for (int k = 0; k < COLUMN; k++) {
				if (j < list.size())
					result[i][k] = list.get(j++);
			}
		}
		return result;
	}
	public List<OrderBean> getProductBeanList(List<Order> list) {
		List<OrderBean> results = new ArrayList<>();
		if (list == null)
			return null;
		for (Order order : list) {
			OrderBean bean = new OrderBean();
			bean.setId(order.getId());
			bean.setAddress(order.getAddress());
			bean.setEmail(order.getEmail());
			bean.setFirstName(order.getFirstName());
			bean.setLastName(order.getLastName());
			bean.setTelephone(order.getTelephone());
			results.add(bean);
		}
		return results;
	}
}
