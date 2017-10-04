<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- load MUI -->
<link href="//cdn.muicss.com/mui-0.9.25/css/mui.min.css"
	rel="stylesheet" type="text/css" />
<script src="//cdn.muicss.com/mui-0.9.25/js/mui.min.js"></script>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
<link href="<c:url value="/resources/css/main.css" />" rel="stylesheet">

</head>
<body>
	<!-- example content -->
	<div class="mui-container">
		<div class="mui-panel">
			<table class="bordered">
				<thead>
					<tr>
						<th>Photo</th>
						<th>Name</th>				
						<th>Selling Price</th>
						<th>quantity</th>
						<th>Selling price</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${products}" var="product">
						<tr>
							<td><c:url var="imgUrl" value="${product.photoPath}" /> <img
								src="${imgUrl}" style="width: 90px; height: auto;">
							</td>
							<td><c:out value="${product.name}" /></td>
							<td><c:out value="${product.sellingPrice}" /></td>
							<td><c:out value="${product.quantity}" /></td>
							<td><c:out value="${product.totalPrice}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>