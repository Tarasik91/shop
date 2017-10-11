package com.myshop.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.myshop.bean.ProductBean;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductQuantityDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.Product;
import com.myshop.model.ProductQuantity;
import com.myshop.model.enums.Color;
import com.myshop.model.enums.Size;
import com.myshop.util.ImageUtil;

@RequestMapping("/admin/product")
@Controller
public class ProductAdminController {

	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductTypeDao productTypeDao;
	@Autowired
	private ProductQuantityDao productQuantityDao;
	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String updateProduct(@RequestParam("name") String name, @RequestParam("purchasePrice") double pPrice,
			@RequestParam("sellingPrice") double sPrice, @RequestParam("description") String description,
			@RequestParam("size") List<String> sizes,
			@RequestParam("color") List<String> colors,
			@RequestParam("quantity") List<Integer> quantitys,
			@RequestParam("id") int id,
			@RequestParam("productType") int productTypeId, Model uiModel) {
		Product product = new Product();
		product.setDescription(description);
		product.setName(name);
		product.setPurchasePrice(pPrice);
		product.setSellingPrice(sPrice);	
		product.setProductType(productTypeDao.findById(productTypeId));	
		product.setId(id);
		productDao.add(product);
		List<ProductQuantity> list = new ArrayList<>();
		for(int i = 0 ; i< colors.size(); i++){
			int quantity = quantitys.get(i);
			String color = colors.get(i);
			String size = sizes.get(i);
			ProductQuantity productQuantity = new ProductQuantity();
			productQuantity.setQuantity(quantity);
			productQuantity.setSize(size);
			productQuantity.setColor(color);
			productQuantity.setProduct(product);
			list.add(productQuantity);
		}
		productQuantityDao.save(list);
		return "redirect:/product/type/"+productTypeId+"/page/1";
	}

	@RequestMapping(path = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id, Model uiModel) {
		Product product = productDao.findById(id);
		productDao.delete(id);
		return "redirect:/product/type/"+product.getProductType().getId()+"/page/1";
	}

	@RequestMapping("/edit/{id}")
	public String findById(@PathVariable("id") int id, Model uiModel, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object isAdmin = session.getAttribute("isAdminLogined");
		ProductBean bean = new ProductBean();
		if (isAdmin != null && (boolean) isAdmin) {
			Product product = productDao.findById(id);
			Map<String, Integer> quantityMap = new HashMap<>();
			List<ProductQuantity> quantityList = productQuantityDao.findByProduct(product);
			if (quantityList != null){
				for(ProductQuantity q : quantityList){
					String key = q.getColor() + "@@" + q.getSize();
					Integer quantity = quantityMap.get(key);
					if (quantity != null){
						quantityMap.put(key, quantity + q.getQuantity());
					}else{
						quantityMap.put(key, q.getQuantity());
					}
				}
			}
			uiModel.addAttribute("sizes",Size.values());
			uiModel.addAttribute("colors",Color.values());
			uiModel.addAttribute("productQuantity", quantityMap);
			uiModel.addAttribute("product", bean.getProductBean(product));
			uiModel.addAttribute("productTypes", productTypeDao.findAll());
			return "/HTML/admin-product";
		}
		return "redirect:/product/type/"+bean.getProductType()+"/page/1";
	}

	@RequestMapping("/add")
	public String add(Model uiModel) {
		uiModel.addAttribute("isAdmin", true);
		ProductBean productForm = new ProductBean();
		uiModel.addAttribute("productForm", productForm);
		uiModel.addAttribute("sizes",Size.values());
		uiModel.addAttribute("colors",Color.values());
		uiModel.addAttribute("productTypes", productTypeDao.findAll());
		return "/HTML/admin-product";
	}

	@RequestMapping(value = "/addPhoto", method = RequestMethod.POST)
	@ResponseBody
	public String handleFormUpload(HttpServletRequest context, @RequestParam("productId") int id,
			@RequestParam("photo") MultipartFile file) throws IOException {
		if (!file.isEmpty()) {
			String rpath = context.getRealPath("/");
			rpath = rpath + "resources\\image\\";
			BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
			long iden = System.currentTimeMillis() ;

			File dirTomcat = new File(rpath  + id);
			if (!dirTomcat.exists()) {
				dirTomcat.mkdirs();
			}
			File fileOnTomact = new File(rpath  + id + "\\" + file.getName() + iden + ".jpg");
			ImageIO.write(src, "jpg", fileOnTomact);
			// Save the id you have used to create the file name in the DB. You
			// can retrieve the image in future with the ID.
			return file.getName() + iden + ".jpg";
		}
		return "";
	}
}
