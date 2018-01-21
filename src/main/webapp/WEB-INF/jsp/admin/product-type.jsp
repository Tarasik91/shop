<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en"
	xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Малятко</title>

  <!-- Compiled and minified JavaScript -->
<meta name="description" content="My Store" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/960.css" />" media="all" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/jquery.toast.min.css" />" media="all" />
	
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
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/jquery/jquery.prettyPhoto.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/shoppica.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/admin.js"/>"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/toast/jquery.toast.min.js"/>"></script>		
		
</head>
<body class="s_layout_fixed">
	<div id="wrapper">
		<!-- ********************** -->
		<!--      H E A D E R       -->
		<!-- ********************** -->
		<div id="header" class="container_12">
			<div class="grid_12">
				<%@include file="../block/links.jsp"%>
			</div>
		</div>
		<!-- end of header -->

		<!-- ********************** -->
		<!--      C O N T E N T     -->
		<!-- ********************** -->
		<div id="content" class="container_16">
			<div class="grid_16">

				<form id="product-type-form" class="clearfix"" method="post" action = "/product-type/add	">
					<h2 class="s_title_1">
						<span class="s_secondary_color">Тип:</span>Добавити
					</h2>
					<div class="clear"></div>
					<label> Назва </label>
					<input name ="name" id = "name" type = "text"/>
					<input id = "id" name = "id" hidden />
					<div class="clear"></div>
					<br/>
					<a class="s_button_1 s_main_color_bgr left" onclick="$('#product-type-form	').submit();" ><span class="s_text">Зберегти</span></a>
				</form>
				<br/>
				<table id = "product-types">
					<tr>
						<th>Назва</th>
						<th></th>
					</tr>
					<c:forEach items="${productTypes}" var="pt">
						<tr>
							<td>${pt.name}</td>
							<td><a href="#" id = "edit-productType" data-id = "${pt.id }">Редагувати(не працює поки)</a> <a href="${pageContext.request.contextPath}/product-type/delete/${pt.id}">Видалити</a></td>
						</tr>
					</c:forEach>
					</table>
				<br />
			</div>
		</div>
		<!-- ********************** -->
		<!--   S H O P   I N F O    -->
		<!-- ********************** -->
		<div id="shop_info">
			<div id="shop_info_wrap">
				<div class="container_12">
					<%@include file="../block/contact.jsp"%>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!-- end of shop info -->

	</div>

</body>
</html>
