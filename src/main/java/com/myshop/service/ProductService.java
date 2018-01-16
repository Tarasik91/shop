package com.myshop.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.myshop.bean.ProductBean;
import com.myshop.dao.ProductCommentDao;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductInOrderDao;
import com.myshop.dao.ProductQuantityDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.Product;
import com.myshop.model.ProductInBasket;
import com.myshop.model.ProductQuantity;
import com.myshop.model.ProductType;
import com.myshop.model.enums.Color;
import com.myshop.model.enums.OrderingType;
import com.myshop.model.enums.Size;
import com.myshop.util.PaginationModel;
import com.myshop.util.PaginationUtil;
import com.myshop.util.Utils;

public class ProductService {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductTypeDao productTypeDao;
	@Autowired
	private ProductQuantityDao productQuantityDao;
	@Autowired
	private ProductInOrderDao productInOrderDao;
	@Autowired
	private ProductCommentDao productCommentDao;
	
	public void addProductInBasketToModel(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		Map<Integer, Integer> map = (Map<Integer, Integer>) session.getAttribute("productIdsMap");
		int count = 0;
		double totalPrice = 0;
		List<Product> products = new ArrayList<Product>();
		if (map != null) {
			for (int key : map.keySet()) {
				count += map.get(key);
			}
			Set<Integer> productIds = map.keySet();
			if (productIds.size() > 0) {
				products = productDao.findByIds(productIds);
			}
		}
		ProductInBasket pib = new ProductInBasket();
		model.addAttribute("PIB", pib.getProductInBasketBeanList(products, map, null));
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("totalCount", count);
	}
	public Model viewProduct(Model model, HttpServletRequest request, int id, String realPath) {
		ProductBean bean = new ProductBean();
		addProductInBasketToModel(request, model);
		Product product = productDao.findById(id);
		Map<String, Integer> quantityMap = getQuantity(product);
		List<ProductType> productTypes = productTypeDao.findAll();
		model.addAttribute("productTypes", productTypes);
		model.addAttribute("quantity", quantityMap);
		model.addAttribute("colors", Color.values());
		model.addAttribute("sizes", Size.values());
		model.addAttribute("product", bean.getProductBean(product, realPath));
		model.addAttribute("comments", productCommentDao.findByProduct(product));
		if (Utils.isAdmin(request)) {
			model.addAttribute("isAdmin", true);
		}
		return model;
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

	public Model viewByTypeAndPage(HttpServletRequest request, Model uiModel, int categoryId, int pageNumber, OrderingType orderingType, String realPath) {
		HttpSession session = request.getSession();
		Object isAdmin = session.getAttribute("isAdminLogined");
		if (isAdmin != null && (Boolean) isAdmin) {
			uiModel.addAttribute("isAdmin", true);
		}
		ProductBean bean = new ProductBean(realPath);
		List<ProductType> productTypes = productTypeDao.findAll();
		addProductInBasketToModel(request, uiModel);
		ProductType type = productTypeDao.findById(categoryId);
		uiModel.addAttribute("productType", type);
		PaginationModel<Product> model = productDao.findByTypeAndPage(categoryId, pageNumber, orderingType);
		PaginationUtil.getMaxMinValue(model);
		uiModel.addAttribute("products", bean.getArray(model.getList()));
		uiModel.addAttribute("paginationModel", model);
		uiModel.addAttribute("productTypes", productTypes);
		uiModel.addAttribute("orderingType", OrderingType.values());
		return uiModel;
	}
}
