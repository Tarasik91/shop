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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link href="//cdn.muicss.com/mui-0.9.25/css/mui.min.css"
	rel="stylesheet" type="text/css" />
<script src="//cdn.muicss.com/mui-0.9.25/js/mui.min.js"></script>
  <!-- Compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
 <!-- Compiled and minified JavaScript -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/js/materialize.min.js"></script>
</head>
<body>
	<!-- example content -->
	<div class="mui-container">
		<div class="mui-panel">
			<form class="mui-form" method="POST"
				action="/myshop/productType/addProductType">
				<input hidden name="id" type="text" id="id" value="${productType.id}">
				<label>Name</label>
				<div class="mui-textfield">
					<input name="name" type="text" placeholder="name"
						value="${productType.name}">
				</div>			
				<button type="submit" class="mui-btn mui-btn--raised">Submit</button>
			</form>
		</div>
	</div>
</body>
</html>