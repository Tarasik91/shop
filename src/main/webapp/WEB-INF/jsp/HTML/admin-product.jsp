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

			</div>
		</div>
		<!-- end of header -->


		<!-- ********************** -->
		<!--      C O N T E N T     -->
		<!-- ********************** -->
		<div id="content" class="container_16">

			<div class="grid_16">

				<form id="create" class="clearfix"
					action="/myshop/admin/product/addProduct" method="post">
					<h2 class="s_title_1">
						<span class="s_secondary_color">Продукт:</span>Добавити
					</h2>
					<div class="clear"></div>

					<div class="s_row_2 clearfix">
						<label class="required"><strong>Name</strong></label> <input
							name="name" type="text" size="85"  value = "${product.name }"/>
					</div>

					<div class="s_row_2 clearfix">
						<div class="inline">
							<label class="required"><strong>Закупівельна
									ціна</strong></label> <input name="purchasePrice" type="number" size="30" value = "${product.purchasePrice }" />
						</div>

						<div class="inline">
							<label class="required"><strong>Продажна ціна</strong></label> <input
								name="sellingPrice" type="number" size="30"  value ="${product.sellingPrice }"/>
						</div>
					</div>

					<div class="s_row_2 clearfix">
						<label><strong>Опис</strong></label>
						<textarea name="description" rows="5" cols="85"></textarea>
					</div>

					<div class="s_row_2 clearfix">
						<label><strong>Тип продукту</strong></label> <select
							name="productType" style="width: 212px;">
							<c:forEach items="${productTypes }" var="productType">\
          						<option value="${productType.id}">${productType.name}</option>
							</c:forEach>
						</select>
					</div>
					<a class="s_button_1 s_main_color_bgr left"
						onclick="$('#create').submit();"><span class="s_text">Зберегти</span></a>
				</form>
				<br />
			</div>
		</div>
		<!-- end of content -->

		<div id="content" class="container_12">
			<div class="clear"></div>
			<div id="special_home" class="grid_12">
			
				<h2 class="s_title_1">Photos</h2>
				<div class="clear"></div>
				
				
				<c:if test="${product.id != 0}">
					<form method="post" enctype="multipart/form-data"
						id="fileUploadForm" enctype="multipart/form-data">
						Please select a file to upload : <input type="file" name="file" />
						<a class="s_button_1 s_main_color_bgr left" id = "addPhoto"><span class="s_text">Добавити фото</span></a>
					</form>
				</c:if>	
				
				<div class="clear"></div>
				<br/>
				<div class="s_listing s_grid_view clearfix">					
			
				<c:forEach items="${product.photos}" var="photo">
						<div class="s_item grid_2">
							<a class="s_thumb" href="${pageContext.request.contextPath}/${photo}"><img
								src="${pageContext.request.contextPath}/${photo}"
								title="Armani Acqua di Gioia" alt="Armani Acqua di Gioia" /></a>
							<p class="s_model">Product 4</p>
						</div>
						</c:forEach>
					</div>		
			</div>
		</div>
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

	</div>

</body>
</html>
