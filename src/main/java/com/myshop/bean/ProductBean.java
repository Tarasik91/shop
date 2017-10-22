package com.myshop.bean;

import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.List;

import com.myshop.model.Product;

public class ProductBean {
	public static int COLUMN = 3;
	//public static String IMAGE_PATH = "C:/Users/taras/workspace/myshop/src/main/webapp/resources/image";
	private int id;
	private String realPath;
	private String name;
	private String description;
	private double purchasePrice;
	private double sellingPrice;
	private ArrayList<String> photos;
	private String photoPath;
	private int productType;
	private int quantity;
	private double totalPrice;

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
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}	
	
	public String getRealPath() {
		return realPath;
	}
	public void setRealPath(String realPath) {
		this.realPath = realPath;
	}
	public String getPhotoPath() throws IOException, URISyntaxException {
		if (id != 0) {
			String path = realPath + "resources\\image\\";
			File directory = new File(path + id);
			if (directory.exists() && directory.list().length != 0) {
				return "\\resources\\image\\" + id + "\\" + directory.list()[0];
			}
		}
		return "/resources/image/images.png";
	}

	public List<String> getPhotos() {
		List<String> results = new ArrayList<>();
		if (id != 0) {
			String path = realPath + "\\resources\\image\\";
			File directory = new File(path + id);
			
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
			ProductBean bean = getProductBean(product, realPath);
		
			results.add(bean);
		}
		return results;
	}
	
	public ProductBean getProductBean(Product product, String realPath) {
		
		ProductBean bean = new ProductBean();
		bean.setRealPath(realPath);
		bean.setId(product.getId());
		bean.setName(product.getName());
		bean.setPurchasePrice(product.getPurchasePrice());
		bean.setSellingPrice(product.getSellingPrice());
		bean.setDescription(product.getDescription());
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
