package com.myshop.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

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
import org.springframework.web.multipart.MultipartFile;

import com.myshop.bean.ProductBean;
import com.myshop.dao.ProductDao;
import com.myshop.dao.ProductTypeDao;
import com.myshop.model.Product;

@RequestMapping("/admin/product")
@Controller
public class ProductAdminController {

	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductTypeDao productTypeDao;

	@RequestMapping(value = "/addProduct", method = RequestMethod.POST)
	public String updateProduct(@RequestParam("name") String name, @RequestParam("purchasePrice") double pPrice,
			@RequestParam("sellingPrice") double sPrice, @RequestParam("description") String description,
			@RequestParam("productType") int productTypeId, Model uiModel) {
		Product product = new Product();
		product.setDescription(description);
		product.setName(name);
		product.setPurchasePrice(pPrice);
		product.setSellingPrice(sPrice);
		product.setProductType(productTypeDao.findById(productTypeId));

		productDao.add(product);
		return "redirect:/product/cards";
	}

	@RequestMapping(path = "/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id, Model uiModel) {
		productDao.delete(id);
		return "redirect:list";
	}

	@RequestMapping("/edit/{id}")
	public String findById(@PathVariable("id") int id, Model uiModel, HttpServletRequest request) {
		HttpSession session = request.getSession();
		Object isAdmin = session.getAttribute("isAdminLogined");
		if (isAdmin != null && (boolean) isAdmin) {
			ProductBean bean = new ProductBean();
			uiModel.addAttribute("product", bean.getProductBean(productDao.findById(id)));
			uiModel.addAttribute("productTypes", productTypeDao.findAll());
			return "/HTML/admin-product";
		}
		return "redirect:list";
	}

	@RequestMapping("/add")
	public String add(Model uiModel) {
		uiModel.addAttribute("isAdmin", true);
		ProductBean productForm = new ProductBean();
		uiModel.addAttribute("productForm", productForm);
		uiModel.addAttribute("productTypes", productTypeDao.findAll());
		return "/HTML/admin-product";
	}

	@RequestMapping(value = "/addPhoto", method = RequestMethod.POST)
	public void handleFormUpload(HttpServletRequest context, @RequestParam("productId") int id,
			@RequestParam("file") MultipartFile file) throws IOException {
		if (!file.isEmpty()) {
			String rpath = context.getRealPath("/");
			BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
			File directory = new File(ProductBean.IMAGE_PATH + "/" + id);
			if (!directory.exists()) {
				directory.mkdirs();
			}

			long iden = System.currentTimeMillis() ;
			File destination = new File(ProductBean.IMAGE_PATH + "/" + id + "/" + file.getName() + iden + ".jpg"); // something
																													// like
																													// C:/Users/tom/Documents/nameBasedOnSomeId.png

			File dirTomcat = new File(rpath + "/" + id);
			if (!dirTomcat.exists()) {
				dirTomcat.mkdirs();
			}
			File fileOnTomact = new File(rpath + "/" + id + "/" + file.getName() + iden + ".jpg");

			ImageIO.write(src, "jpg", destination);
			ImageIO.write(src, "jpg", fileOnTomact);
			// Save the id you have used to create the file name in the DB. You
			// can retrieve the image in future with the ID.
		}
	}
}
