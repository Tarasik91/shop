<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en"
	xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Your Store</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

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

					<input type="hidden" value="${product.id }" name="id" />
					<div class="s_row_2 clearfix">
						<label class="required"><strong>Name</strong></label> <input
							name="name" type="text" size="85" value="${product.name }" />
					</div>
					<div class="s_row_2 clearfix">
						<label><strong>Опис</strong></label>
						<textarea name="description" rows="5" cols="85"></textarea>
					</div>

					<table style="width: 100%" id="productQuantityTable">
						<tr>
							<td><strong>Закупівельна ціна</strong></td>
							<td><strong>Продажна ціна</strong></td>
							<td><strong>Тип продукта</strong></td>
							<td></td>
						</tr>
						<tr>
							<td><input name="purchasePrice" type="number"
								value="${product.purchasePrice }" /></td>
							<td><input name="sellingPrice" type="number"
								value="${product.sellingPrice }" /></td>
							<td><select name="productType">
									<c:forEach items="${productTypes }" var="productType">\
          						<option value="${productType.id}">${productType.name}</option>
									</c:forEach>
							</select></td>
							<td></td>
						</tr>

						<tr>
							<td><strong>Розмір</strong></td>
							<td><strong>Колір</strong></td>
							<td><strong>Кількість</strong></td>
							<td></td>
						</tr>
						<c:forEach var="entry" items="${productQuantity}">
							<c:set var="colorSize" value="${fn:split(entry.key, '@@')}" />
							<tr>
								<td><c:out value="${colorSize[0]}" /></td>
								<td><c:out value="${colorSize[1]}" /></td>
								<td><c:out value="${entry.value}" /></td>
							</tr>
						</c:forEach>
						<tr>
							<td><select name="size">
									<c:forEach items="${sizes}" var="size">
										<option value="${size}">${size.name}</option>
									</c:forEach>
							</select></td>
							<td><select name="color">
									<c:forEach items="${colors}" var="color">
										<option value="${color}">${color.name}</option>
									</c:forEach>
								</select>
							</td>
							<td><input name="quantity" type="number" /></td>
							<td><a href="#" id="addQuantity"><img
									src="${pageContext.request.contextPath}/resources/images/add.png"
									alt="Add"> </img></a></td>
						</tr>
					</table>



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
					<form enctype="multipart/form-data" id="fileUploadForm"
						enctype="multipart/form-data">
						<input type="hidden" value="${product.id}" name="productId" />
						<p>Загрузіть ваші фотографиї на сервер</p>
						<p>
							<input type="file" name="photo" multiple
								accept="image/*,image/jpeg" /> <a id="btnSubmit"
								class="s_button_1 s_main_color_bgr left"><span
								class="s_text">Відправити</span></a>
						</p>
					</form>
					<div id="photoHolder">
						<ul class="s_thumbs clearfix">
							<c:forEach items="${product.photos}" var="photo">
								<li><a class="s_thumb"
									href="${pageContext.request.contextPath}${photo}" title="Leic"><img
										src="${pageContext.request.contextPath}${photo}" width="120"
										title="Leica M7" alt="Leica M7" /></a></li>
							</c:forEach>
						</ul>
					</div>

				</c:if>

				<div class="clear"></div>
				<br />

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
<script>
	$(document)
			.ready(
					function() {
						$("#addQuantity")
								.live(
										'click',
										function(event) {
											event.preventDefault();

											var tr = "<tr><td><input name='size' type='text'   /></td>"
													+ "<td> <input name='color' type='text'  /></td>"
													+ "<td> <input name='quantity' type='number'  /></td>"
													+ "<td><a href ='#' id = 'addQuantity'><img src='${pageContext.request.contextPath}/resources/images/add.png' alt='Add'> </img></a></td></tr>";
											console.log(tr)
											$("#productQuantityTable tbody")
													.append(tr);
										});
						$("#btnSubmit")
								.click(
										function(event) {
											event.preventDefault();
											// Get form
											var form = $('#fileUploadForm')[0];
											var url = "/myshop/admin/product/addPhoto";
											// Create an FormData object
											var data = new FormData(form);
											// If you want to add an extra field for the FormData
											// disabled the submit button
											//$("#btnSubmit").prop("disabled", true);

											$
													.ajax({
														type : "POST",
														enctype : 'multipart/form-data',
														url : url,
														data : data,
														processData : false,
														contentType : false,
														cache : false,
														timeout : 600000,
														success : function(data) {
															var photo = '<ul class="s_thumbs clearfix"> <a id="product_image_preview" rel="prettyPhoto[gallery]" href="/myshop/resources/image/'+ ${product.id} + '/' + data + '" >'
																	+ '<img id="image" src="/myshop/resources/image/'+ ${product.id} + '/' +data + '" ></a></ul>';
															$("#photoHolder")
																	.append(
																			photo)
															//	$("#btnSubmit").prop("disabled", false);

														},
														error : function(e) {
															$("#result")
																	.text(
																			e.responseText);
															console.log(
																	"ERROR : ",
																	e);
															//$("#btnSubmit").prop("disabled", false);
														}
													});
										});
					});
</script>
</html>
