package com.myshop.bean;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;

import org.springframework.util.ResourceUtils;

import com.myshop.model.Product;
import com.myshop.util.ImageUtil;

public class ProductBean {
	public static int COLUMN = 3;
	//public static String IMAGE_PATH = "C:/Users/taras/workspace/myshop/src/main/webapp/resources/image";
	private int id;
	private String name;
	private double purchasePrice;
	private double sellingPrice;
	private ArrayList<String> photos;
	private String photoPath;
	private int productType;
	private int quantity;
	private double totalPrice;
	private String color;
	private String size;

	public ProductBean() {
	}
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getPurchasePrice() {
		return purchasePrice;
	}

	public void setPurchasePrice(double purchasePrice) {
		this.purchasePrice = purchasePrice;
	}

	public double getSellingPrice() {
		return sellingPrice;
	}

	public void setSellingPrice(double sellingPrice) {
		this.sellingPrice = sellingPrice;
	}

	public int getProductType() {
		return productType;
	}

	public void setProductType(int productType) {
		this.productType = productType;
	}

	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

	
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getPhotoPath() throws IOException, URISyntaxException {
		if (id != 0) {
			ImageUtil util = new ImageUtil();
			File directory = new File(util.getRealPath() + id);
			if (directory.exists() && directory.list().length != 0) {
				return "\\resources\\image\\" + id + "\\" + directory.list()[0];
			}
		}
		return "/resources/image/images.png";
	}

	public List<String> getPhotos() {
		List<String> results = new ArrayList<>();
		if (id != 0) {
			ImageUtil util = new ImageUtil();
			File directory = new File(util.getRealPath() + id);
			
			if (directory.exists() && directory.list().length != 0) {
				String[] files = directory.list();
				for (String file : files) {
					results.add("\\resources\\image\\" + id + "\\" + file);
				}
			}
		}
		return results;
	}

	public List<ProductBean> getProductBeanList(List<Product> list) {
		List<ProductBean> results = new ArrayList<>();
		if (list == null)
			return null;
		for (Product product : list) {
			ProductBean bean = getProductBean(product);
		
			results.add(bean);
		}
		return results;
	}
	
	public ProductBean getProductBean(Product product) {
		ProductBean bean = new ProductBean();
		bean.setId(product.getId());
		bean.setName(product.getName());
		bean.setPurchasePrice(product.getPurchasePrice());
		bean.setSellingPrice(product.getSellingPrice());
		bean.setColor(product.getColor());
		bean.setSize(product.getSize());
		return bean;
	}

	public ProductBean getProduct(Product product, ProductBean bean) {
		return bean;
	}

	public ProductBean[][] getArray(List<Product> productList) {
		List<ProductBean> list = getProductBeanList(productList);
		int row = list.size() / COLUMN;
		if (list.size() % COLUMN != 0)
			row += 1;
		ProductBean[][] result = new ProductBean[row][COLUMN];
		int j = 0;
		for (int i = 0; i < row; i++) {
			for (int k = 0; k < COLUMN; k++) {
				if (j < list.size())
					result[i][k] = list.get(j++);
			}
		}
		return result;
	}
}
