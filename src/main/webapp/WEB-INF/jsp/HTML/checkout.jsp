<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en"
	xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<title>Your Store</title>
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

  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3mL-PMg7WlumTwF9tbbNBHS0YiJlQlMc&callback=initMap">
    </script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/shoppica.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/client.js"/>"></script>

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
						<a href="">Home</a> &gt; <a href="">Checkout</a>
					</div>
					<h1>Checkout</h1>
				</div>
			</div>
		</div>
		<!-- end of intro -->


		<!-- ********************** -->
		<!--      C O N T E N T     -->
		<!-- ********************** -->
		<div id="content" class="container_12">

			<div id="checkout" class="grid_12">
				<form id="checkout_form" class="s_accordion"
					action="/myshop/order/save">
					<h2>Дані про оплату</h2>
					<div>
						<div class="grid_6 alpha">
							<h3>
								<span class="s_secondary_color">Ваші</span> Особисті дані
							</h3>
							<div class="s_row_2 clearfix">
								<label>Імя: *</label> <input name="firstName" type="text"
									 />
							</div>
							<div class="s_row_2 clearfix">
								<label>Прізвище: *</label> <input name="lastName" type="text"
									/>
							</div>
							<div class="s_row_2 clearfix">
								<label>E-Mail: *</label> 
								<input name="email" type="text"/>
							</div>
							<div class="s_row_2 clearfix">
								<label>Тип доставки</label> <select id = "deliveryType"  name="deliveryType">
									<c:forEach items="${deliveryTypes}" var="deliveryType">
										<option value="${deliveryType}">${deliveryType.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="s_row_2 clearfix" id = "deparmtmentMapSection">
							  <div id="map"></div>
							</div>
							<script>
						    var map;  
							function initMap() {
						        var lviv = {lat: 49.85, lng: 24.016};
						        map = new google.maps.Map(document.getElementById('map'), {
						          zoom: 6,
						          center: lviv
						        });
						       
						      }
   							 </script>
						</div>
						<div class="grid_6 omega">
							<h3>
								<span class="s_secondary_color">Your</span> Address
							</h3>

							<div class="s_row_2 clearfix">
								<label>Telephone: *</label> <input name="telephone" type="text"
								 />
							</div>
							<div class="s_row_2 clearfix">
								<label>Address: *</label> <input name="address" type="text"
									 class="required"
									title="Address 1 must be between 3 and 128 characters!" />
							</div>
								<div class="s_row_2 clearfix">
								<label>Тип доставки</label> 
								<select name="paidType">
									<c:forEach items="${paidTypes}" var="paidType">
										<option value="${paidType}">${paidType.name}</option>
									</c:forEach>
								</select>
							</div>
							
							<div class="s_row_2 hidden" id = "citySection">
								<label>Місто</label> 
									<input  id ="cities"/>
							</div>
							
							<div class="s_row_2  hidden" id = "deparmtmentNewMailSection">
								<label>Відділення</label> 
									<select  id ="departmantNewMail" ></select>
							</div>
					

						</div>
						<div class="clear"></div>

						<br />
					</div>
					<div>

						<div class="clear"></div>
						<h3>
							<span class="s_secondary_color">Order</span> comments
						</h3>
						<div class="s_row_3 clearfix">
							<textarea rows="3" style="width: 99%;"></textarea>
						</div>

					</div>
					<a class="s_button_1 s_main_color_bgr"
						onclick="$('#checkout_form').submit();"><span class="s_text">Finish</span></a>
				</form>
			</div>
		</div>
		<!-- end of content -->

		<!-- ********************** -->
		<!--   S H O P   I N F O    -->
		<!-- ********************** -->
		<div id="shop_info">
			<div id="shop_info_wrap">
				<%@include file="block/contact.jsp"%>
			</div>
		</div>
		<!-- end of shop info -->

	</div>

</body>
</html>
