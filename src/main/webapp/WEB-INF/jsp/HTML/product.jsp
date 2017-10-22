<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Your Store</title>
<meta name="description" content="My Store" />
<meta property="og:image" content="images/dummy/pic_1.jpg" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/960.css" />" media="all" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/screen.css" />"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/color.css" />" media="screen" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/fotorama.css" />"
	media="all" />	
	
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="stylesheet/ie.css" media="screen" />
<![endif]-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="<c:url value="/resources/js/fotorama.js" />"></script>
	
<script type="text/javascript"
	src="<c:url value="/resources/js/shoppica.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/ajax_add.js"/>"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".s_tabs").tabs({
							fx : {
								opacity : 'toggle',
								duration : 300
							}
						});
	});

</script>

</head>

<body class="s_layout_fixed">

	<div id="wrapper">

		<!-- ********************** -->
		<!--      H E A D E R       -->
		<!-- ********************** -->
		<div id="header" class="container_12">
			<div class="grid_12">

				<a id="site_logo" href="/myshop/">Shoppica store - Premium
					e-Commerce Theme</a>

				<%@include file="block/links.jsp"%>

				<%@include file="block/header.jsp"%>


			</div>
		</div>
		<!-- end of header -->


		<!-- ********************** -->
		<!--     I N T R O          -->
		<!-- ********************** -->

		<div id="intro">
			<div id="intro_wrap">
				<div class="container_12">
					<div id="breadcrumbs" class="grid_12">
						<a href="/">Початкова</a> &gt; <a href="">${product.productTypeName}</a>
					</div>
					<h1>${product.productTypeName}</h1>
				</div>
			</div>
		</div>
		<!-- end of intro -->


		<!-- ********************** -->
		<!--      C O N T E N T     -->
		<!-- ********************** -->
		<div id="content" class="product_view container_16">

			<div id="product" class="grid_12">
				<div id="product_images" class="grid_6 alpha">
					<a id="product_image_preview" rel="prettyPhoto[gallery]"
						href="${pageContext.request.contextPath}${product.photoPath}">
						<img id="image"
						src="${pageContext.request.contextPath}${product.photoPath}"
						title="${product.name}" alt="${product.name}" />
					</a>
				</div>
				<div id="product_info" class="grid_6 omega">
					<p class="s_price">
						<span class="s_currency s_before"></span>${product.sellingPrice }₴
					</p>
					<dl class="clearfix">
						<c:forEach var="entry" items="${quantity}">
							<c:if test="${entry.value != 0}">
								<c:set var="colorSize" value="${fn:split(entry.key, '@@')}" />
								<dt>Розмір</dt>
								<dd>${sizes[colorSize[1]].name }</dd>
								<dt>Колір</dt>
								<dd>${colors[colorSize[0]].name }</dd>
								<dt>Кількість</dt>
								<dd>${entry.value}</dd>
							</c:if>
						</c:forEach>

						<dd>
							<p class="s_rating s_rating_5">
								<span style="width: 100%;" class="s_percent"></span>
							</p>
						</dd>
					</dl>

					<div id="product_options">
						<h3>Додаткові параметри</h3>

						<span class="clear"></span>
					</div>
					<div id="product_buy" class="clearfix">
						<label for="product_buy_quantity">Кількість:</label> <input
							id="product_id" name="product_id" type="number" hidden
							value="${product.id }" /> <input id="product_buy_quantity"
							type="text" value="1" size="2" name="product_buy_quantity" /> <a
							id="add_to_cart" class="s_main_color_bgr"><span
							class="s_text"><span class="s_icon"></span>В корзину</span></a>
					</div>
				</div>
				<div class="clear"></div>
				<div class="s_tabs grid_12 alpha omega">
					<ul class="s_tabs_nav clearfix">
						<li><a href="#product_description">Опис</a></li>
						<li><a href="#product_reviews">Відгуки </a></li>
						<li><a href="#product_gallery">Фото</a></li>
					</ul>
					<div class="s_tab_box">

						<div id="product_description">
							<div class="cpt_product_description ">
								Engineered with pro-level features and performance.<br />

							</div>
							<!-- cpt_container_end -->
						</div>

						<div id="product_reviews" class="s_listing">
							<div class="s_review last">
								<p class="s_author">
									<strong>Shoppica</strong><small>(29/03/2011)</small>
								</p>
								<div class="right">
									<div class="s_rating_holder">
										<p class="s_rating s_rating_5">
											<span class="s_percent" style="width: 100%;"></span>
										</p>
										<span class="s_average">5 out of 5 Stars!</span>
									</div>
								</div>
								<div class="clear"></div>
								<p>Vestibulum molestie tellus rhoncus nulla cursu</p>
							</div>
							<div class="pagination">
								<div class="results">Showing 1 to 1 of 1 (1 Pages)</div>
							</div>
							<h2 class="s_title_1">
								<span class="s_main_color">Write</span> Review
							</h2>
							<div id="review_title" class="clear"></div>
							<div class="s_row_3 clearfix">
								<label><strong>Your Name:</strong></label> <input type="text" />
							</div>
							<div class="s_row_3 clearfix">
								<label><strong>Your Review:</strong></label>
								<textarea style="width: 98%;" rows="8"></textarea>
								<p class="s_legend">
									<span style="color: #FF0000;">Note:</span> HTML is not
									translated!
								</p>
							</div>
							<div class="s_row_3 clearfix">
								<label><strong>Rating</strong></label> <span class="clear"></span>
								<span>Bad</span>&nbsp; <input type="radio" /> &nbsp; <input
									type="radio" /> &nbsp; <input type="radio" /> &nbsp; <input
									type="radio" /> &nbsp; <input type="radio" /> &nbsp; <span>Good</span>
							</div>
							<span class="clear border_ddd"></span> <a
								class="s_button_1 s_main_color_bgr"><span class="s_text">Continue</span></a>
							<span class="clear"></span>
						</div>

						<div id = "product_gallery">
						<div class="fotorama" data-width="700" data-ratio="700/467" data-max-width="100%">
								<c:forEach items="${product.photos}" var="photo">
								
								 <img src="${pageContext.request.contextPath}${photo}"/>
									
								</c:forEach>
						</div>
						</div>
					</div>
				</div>

			</div>


			<div id="right_col" class="grid_3">
				<div id="cart_side" class="s_box_1 s_cart_holder">
					<h2 class="s_secondary_color">Корзина</h2>
					<div id="cart_side_contents">
						<div id="productInBasket">
							<c:forEach var="product" items="${PIB.productBeans}">
								<div class="s_cart_item">
									<a class="s_button_remove" data-product-id="${product.id}">&nbsp;</a>
									<span class="block">${product.quantity }x <a
										href="/myshop/product/view/${product.id }">${product.name }</a></span>
								</div>
							</c:forEach>
						</div>
						<span class="clear s_mb_15 border_eee"></span>
						<c:if test="${PIB.productBeans.size() > 0}">
						<div class="s_total clearfix">
							<strong class="cart_module_total left">Загальна сума:</strong><span
								class="cart_module_total">${PIB.totalPrice }<span
								class="s_currency s_after">₴</span></span>
						</div>
						<span class="clear s_mb_15"></span>
						<div class="align_center clearfix">
							<a class="s_button_1 s_secondary_color_bgr s_ml_0"
								href="/myshop/cart/view"><span class="s_text">Корзина</span></a>
							<a class="s_button_1 s_secondary_color_bgr"
								href="/myshop/cart/checkout"><span class="s_text">Замовлення</span></a>
						</div>
						</c:if>
					</div>
				</div>

				<div id="categories_module" class="s_box">
					<h2>Categories</h2>
					<div class="s_list_1">
						<ul>
							<c:forEach items="${productTypes }" var="productType">
								<li><a
									href="/myshop/product/productCategory/${productType.id }">${productType.name }</a></li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>

		</div>
		<!-- end of content -->

		<!-- ********************** -->
		<!--   S H O P   I N F O    -->
		<!-- ********************** -->
		<div id="shop_info">
			<div id="shop_info_wrap">
				<%@include file="block/contact.jsp"%>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<!-- end of shop info -->

</body>

</html>
