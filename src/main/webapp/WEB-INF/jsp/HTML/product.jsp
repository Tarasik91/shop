<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en"
	xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
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
	href="<c:url value="/resources/stylesheet/prettyPhoto.css" />"
	media="all" />
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="stylesheet/ie.css" media="screen" />
<![endif]-->

<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery/jquery.prettyPhoto.js" />"></script>
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

						$(
								"#product_images a[rel^='prettyPhoto'], #product_gallery a[rel^='prettyPhoto']")
								.prettyPhoto({
									theme : 'light_square',
									opacity : 0.5
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

				<a id="site_logo" href="index.html">Shoppica store - Premium
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
						<a href="">Home</a> &gt; <a href="">Clothing</a>
					</div>
					<h1>Clothing</h1>
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
					<c:url var="imgUrl" value="${product.photoPath}" />
					<a id="product_image_preview" rel="prettyPhoto[gallery]"
						href="${imgUrl }"><img id="image" src="${imgUrl }"
						title="Leica M7" alt="Leica M7" /></a>
				</div>
				<div id="product_info" class="grid_6 omega">
					<p class="s_price">
						<span class="s_currency s_before"></span>${product.sellingPrice }₴
					</p>
					<dl class="clearfix">
						<dt>В наявності</dt>
						<dd>є на стані</dd>
						<dt>Модель</dt>
						<dd>Product 4</dd>
						<dt>Виробник</dt>
						<dd>
							<a href="#">Canon</a>
						</dd>
						<dt>Середній рейтинг</dt>
						<dd>
							<p class="s_rating s_rating_5">
								<span style="width: 100%;" class="s_percent"></span>
							</p>
						</dd>
					</dl>
					<div id="product_share" class="clearfix">
						<!-- AddThis Button BEGIN -->
						<div class="addthis_toolbox addthis_default_style ">
							<a class="addthis_button_facebook_like"
								fb:like:layout="button_count"></a> <a
								class="addthis_button_tweet"></a> <a
								class="addthis_counter addthis_pill_style"></a>
						</div>
						<script type="text/javascript"
							src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4de0eff004042e7a"></script>
						<!-- AddThis Button END -->
					</div>
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

						<div id="product_gallery">
							<ul class="s_thumbs clearfix">
								<c:forEach items="${product.photos}" var="photo">
									<li><a class="s_thumb" href="<c:url value = "${photo }"/>"
										title="Leic" rel="prettyPhoto[gallery]"><img
											src="<c:url value = "${photo }"/>" width="120"
											title="Leica M7" alt="Leica M7" /></a></li>
								</c:forEach>
							</ul>
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
