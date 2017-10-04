<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en"
	xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Your Store</title>
<meta name="description" content="My Store" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/960.css" />" media="all" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/screen.css" />"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/color.css" />" media="screen" />
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="stylesheet/ie.css" media="screen" />
<![endif]-->

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/shoppica.js" />"></script>

</head>

<body class="s_layout_fixed">

	<div id="wrapper">

		<!-- ********************** -->
		<!--      H E A D E R       -->
		<!-- ********************** -->
		<div id="header" class="container_12">
			<div class="grid_12">

				<a id="site_logo" href="index.html">Shoppica store - Premium
					e-Commerce Theme</a>

				<%@include file="block/links.jsp"%>				
				<%@include file="block/header.jsp"%>
			</div>
		</div>
		<!-- end of header -->


		<!-- ********s************** -->
		<!--     I N T R O          -->
		<!-- ********************** -->

		<div id="intro">
			<div id="intro_wrap">
				<div class="container_12">
					<div id="breadcrumbs" class="grid_12">
						<a href="index.html">Home</a> &gt; <a href="">Clothing</a>
					</div>
					<h1>Clothing</h1>
				</div>
			</div>
		</div>
		<!-- end of intro -->
		<c:if test="${isAdmin}">
			<a href="/myshop/admin/product/add"
				class="s_button_1 s_main_color_bgr left"><span class="s_text">Добавити
					продукт</span></a>
		</c:if>

		<!-- ********************** -->
		<!--      C O N T E N T     -->
		<!-- ********************** -->
		<div id="content" class="container_12">
			<div id="category" class="grid_9">
				<div id="listing_options">
					<div id="listing_sort" class="s_switcher">
						<span class="s_selected">Default</span>
						<ul class="s_options" style="display: none;">
							<li><a href="">Name A - Z</a></li>
							<li><a href="">Name Z - A</a></li>
							<li><a href="">Price Low &gt; High</a></li>
							<li><a href="">Price High &gt; Low</a></li>
							<li><a href="">Rating Highest</a></li>
							<li><a href="">Rating Lowest</a></li>
							<li><a href="">Model A - Z</a></li>
							<li><a href="">Model Z - A</a></li>
						</ul>
					</div>
					<div id="view_mode" class="s_nav">
						<ul class="clearfix">
							<li id="view_grid" class="s_selected"><a
								href="listing_2.html"><span class="s_icon"></span>Grid</a></li>
							<li id="view_list"><a href="listing_1.html"><span
									class="s_icon"></span>List</a></li>
						</ul>
					</div>
				</div>

				<div class="clear"></div>

				<div class="s_listing s_grid_view clearfix">
					<c:forEach items="${products}" var="product">
						<c:forEach items="${product}" var="p">
							<c:if test="${not empty p}">
								<div class="s_item grid_3">
									<a class="s_thumb"
										href="/myshop/product/view/<c:out value="${p.id}" />"> <c:url
											var="imgUrl" value="${p.photoPath}" /> <img src="${imgUrl }"
										title="${p.name}" alt="${p.name}" /></a>
									<h3>
										<a href="/myshop/product/view/<c:out value="${p.id}" />">${p.name}</a>
									</h3>
									<p class="s_model">Product 6</p>
									<p class="s_price">
										<span class="s_currency s_before"></span>${p.sellingPrice } ₴

									</p>
									<p class="s_rating s_rating_5">
										<span style="width: 60%;" class="s_percent"></span>
									</p>
									
									<c:if test="${isAdmin}">
										<a class="s_button_add_to_cart"
											href="/myshop/admin/product/edit/<c:out value="${p.id}" />"> 
											<span class="s_icon"></span>Редагувати									
										</a>
									</c:if>
									<a class="s_button_add_to_cart"
										href="/myshop/product/view/<c:out value="${p.id}" />"> <span
										class="s_icon_16"> <span class="s_icon"></span>Добавити
											в корзину
									</span></a>
								</div>
							</c:if>
						</c:forEach>
						<div class="clear"></div>
					</c:forEach>

				</div>

				<div class="pagination">
					<div class="links">
						<b>1</b> <a href="">2</a> <a href="">&gt;</a> <a href="">&gt;|</a>
					</div>
					<div class="results">Showing 1 to 12 of 20 (2 Pages)</div>
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
								href="/myshop/cart/view"><span class="s_text">View
									Cart</span></a> <a class="s_button_1 s_secondary_color_bgr"
								href="/myshop/cart/checkout"><span class="s_text">Checkout</span></a>
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
				<div class="container_12">
					<%@include file="block/contact.jsp"%>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!-- end of shop info -->
		<
	</div>
</body>
</html>
