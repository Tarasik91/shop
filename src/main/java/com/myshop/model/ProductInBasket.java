package com.myshop.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.myshop.bean.ProductBean;

public class ProductInBasket {
	private List<ProductBean> productBeans;
	private double totalPrice;
	private int totalCount;
	
	public List<ProductBean> getProductBeans() {
		return productBeans;
	}

	public void setProductBeans(List<ProductBean> productBeans) {
		this.productBeans = productBeans;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	public ProductInBasket  getProductInBasketBeanList(List<Product> list, Map<Integer, Integer> map, String urlPath) {
		List<ProductBean> results = new ArrayList<>();
		double tp = 0;
		int tc = 0;
		if (list == null)
			return null;
		for (Product product : list) {
			ProductBean bean = new ProductBean(urlPath);
			bean.setId(product.getId());
			bean.setQuantity(map.get(product.getId()));
			bean.setSellingPrice(product.getSellingPrice());
			bean.setTotalPrice(bean.getQuantity() * bean.getSellingPrice());
			tp += bean.getTotalPrice(); 
			tc += bean.getQuantity();
			bean.setName(product.getName());
			bean.setPurchasePrice(product.getPurchasePrice());
			results.add(bean);
		}
		setProductBeans(results);
		setTotalPrice(tp);
		setTotalCount(tc);
		return this;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
}
