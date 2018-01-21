<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en"
	xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<title>Малятко</title>
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/960.css" />" media="all" />
	<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/jquery.toast.min.css" />" media="all" />
	
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/screen.css" />"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/color.css" />" media="screen" />

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
  <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB3mL-PMg7WlumTwF9tbbNBHS0YiJlQlMc&callback=initMap">
    </script> 

<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
	
<script type="text/javascript"
	src="<c:url value="/resources/js/shoppica.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/client.js"/>"></script>

<script type="text/javascript"
	src="<c:url value="/resources/js/toast/jquery.toast.min.js"/>"></script>	
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

</head>
<body class="s_layout_fixed">
	<div id="wrapper">
		<!-- ********************** -->
		<!--      H E A D E R       -->
		<!-- ********************** -->
		<div id="header" class="container_12">
			<div class="grid_12">

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
						<a href="/">Початкова</a> &gt; <a href="">Оформлення заявки</a>
					</div>
					<h1>Оформення</h1>
				</div>
			</div>
		</div>
		<!-- end of intro -->
		<!-- ********************** -->
		<!--      C O N T E N T     -->
		<!-- ********************** -->
		<div id="content" class="container_12">
			<div id="checkout" class="grid_12">
				<form id="checkout_form" class="s_accordion">
					<h2>Дані про оплату</h2>
					<div>
						<div class="grid_6 alpha">
							<div class="s_row_2 clearfix">
								<label>Імя: *</label> <input maxlength = 45 name="firstName" type="text" required id = "firstName"  title="Це поле обовязкове"/>
							</div>
							<div class="s_row_2 clearfix">
								<label>Прізвище: *</label> <input maxlength = 45 name="lastName"  title="Це поле обовязкове" required type="text"/>
							</div>
							<div class="s_row_2 clearfix">
								<label>E-Mail: *</label> 
								<input name="email" maxlength = 80 required type="email" title="Це поле обовязкове"/>
							</div>
	
						</div>
						<div class="grid_6 omega">
							<div class="s_row_2 clearfix">
								<label>Телефон: *</label> <input required name="telephone" title="Це поле обовязкове" type="text" maxlength = 13
								 />
							</div>
						
							<div class="s_row_2 clearfix">
								<label>Тип оплати</label> 
								<select name="paidType" style="width: 40%;">
									<c:forEach items="${paidTypes}" var="paidType">
										<option value="${paidType}">${paidType.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="s_row_2 clearfix">
								<label>Тип доставки</label> <select id = "deliveryType" style="width: 40%;"  name="deliveryType">
									<c:forEach items="${deliveryTypes}" var="deliveryType">
										<option value="${deliveryType}">${deliveryType.name}</option>
									</c:forEach>
								</select>
							</div>
							<div class="s_row_2 hidden" id = "citySection">
								<label>Місто</label> 
								<input  id ="cities" type = "text" name = "cities"/>
							</div>
						</div>
						<div class="clear"></div>
						<br />
					</div>
					<div class="s_row_2  hidden " id = "deparmtmentNewMailSection">
					<label>Відділення</label> 
						<select style="width: 99%;" name = "newMailAddress"  id ="departmantNewMail" ></select>
					</div>
					<div class = "clearfix"></div>
						<div class="s_row_3" id = "addressBlock">
								<label>Адреса: </label> 
								<input name="address" id = "address" style="width: 99%;" type="text" 
									 title="Це поле обовязкове" />
							</div>
					<div>
						<div class="clearfix"></div>
						<h3>
							коментарі
						</h3>
						<div class="s_row_3 clearfix">
							<textarea name = "comment" rows="2" style="width: 99%;"></textarea>
						</div>

					</div>
					<a class="s_button_1 s_main_color_bgr" id = "checkout-submit" href= "#" onclick="$('#checkout_form').submit();"><span class="s_text">Заповнити</span></a>
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
