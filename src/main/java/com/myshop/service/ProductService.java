package com.myshop.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.myshop.bean.ProductBean;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductInOrderDao;
import com.myshop.dao.ProductQuantityDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.Product;
import com.myshop.model.ProductInBasket;
import com.myshop.model.ProductInOrder;
import com.myshop.model.ProductQuantity;
import com.myshop.model.ProductType;
import com.myshop.model.enums.Color;
import com.myshop.model.enums.Size;
import com.myshop.util.PaginationModel;
import com.myshop.util.PaginationUtil;

public class ProductService {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductTypeDao productTypeDao;
	@Autowired
	private ProductQuantityDao productQuantityDao;
	@Autowired
	private ProductInOrderDao productInOrderDao;

	public Model viewProduct(Model uiModel, HttpServletRequest request, int id, String realPath) {
		ProductBean bean = new ProductBean();
		HttpSession session = request.getSession();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		if (map != null) {
			ProductInBasket pib = new ProductInBasket();
			Set<Integer> productIds = map.keySet();
			if (productIds.size() > 0) {
				List<Product> products = productDao.findByIds(productIds);
				uiModel.addAttribute("PIB", pib.getProductInBasketBeanList(products, map));
			}
		}
		Product product = productDao.findById(id);
		Map<String, Integer> quantityMap = getQuantity(product);
		List<ProductType> productTypes = productTypeDao.findAll();
		uiModel.addAttribute("productTypes", productTypes);
		uiModel.addAttribute("quantity", quantityMap);
		uiModel.addAttribute("colors", Color.values());
		uiModel.addAttribute("sizes", Size.values());
		uiModel.addAttribute("product", bean.getProductBean(product, realPath));
		return uiModel;
	}

	public Map<String, Integer> getQuantity(Product product) {
		Map<String, Integer> quantityMap = new HashMap<>();
		List<ProductQuantity> quantityList = productQuantityDao.findByProduct(product);
		if (quantityList != null) {
			for (ProductQuantity q : quantityList) {
				String key = q.getColor().ordinal() + "@@" + q.getSize().ordinal();
				Integer quantity = quantityMap.get(key);
				if (quantity != null) {
					quantityMap.put(key, quantity + q.getQuantity());
				} else {
					quantityMap.put(key, q.getQuantity());
				}
			}
		}
		return quantityMap;
	}

	public void removeProduct(int id) {
		Product product = productDao.findById(id);
		boolean isInOrder = productInOrderDao.hasProduct(product);
		if (!isInOrder) {
			productDao.delete(id);
		} else {
			product.setActive(false);
		}
	}

	public Model viewByTypeAndPage(HttpServletRequest request, Model uiModel, int categoryId, int pageNumber) {
		HttpSession session = request.getSession();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		Object isAdmin = session.getAttribute("isAdminLogined");
		if (isAdmin != null && (Boolean) isAdmin) {
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
