package com.myshop.controller;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myshop.dao.ProductCommentDao;
import com.myshop.dao.ProductDao;
import com.myshop.model.Product;
import com.myshop.model.ProductComment;
import com.myshop.model.enums.OrderingType;
import com.myshop.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService service;

	@Autowired
	private ProductDao productDao;
	@Autowired
	private ProductCommentDao productCommentDao;

	@RequestMapping("/view/{id}")
	public String viewProduct(@PathVariable("id") int id, Model uiModel, HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/");
		service.viewProduct(uiModel, request, id, realPath);
		return "product";
	}

	@RequestMapping(value = "/type/{id}/page/{pageNumber}", method = RequestMethod.GET)
	public String getCardsByCategoryAndPage(HttpServletRequest request, Model uiModel,
			@PathVariable("id") int categoryId, @PathVariable("pageNumber") int pageNumber,
			@RequestParam(required = false, defaultValue = "PRICE_A", name = "sort") OrderingType sortType) {
		String realPath = request.getSession().getServletContext().getRealPath("/");
		service.viewByTypeAndPage(request, uiModel, categoryId, pageNumber, sortType, realPath);
		return "listing_2";
	}

	@RequestMapping(value = "/comment/save", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ProductComment comentSave(@RequestParam("productId") int productId, @RequestParam("comment") String comment,
			@RequestParam("autor") String autor) {
		ProductComment productComment = new ProductComment();
		productComment.setAutor(autor);
		productComment.setComment(comment);
		Product product = productDao.findById(productId);
		productComment.setProduct(product);
		productComment.setDateCreated(DateTime.now());
		productCommentDao.save(productComment);
		return productComment;
	}
}
