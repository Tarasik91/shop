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
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/css/materialize.min.css">
</head>
<body>
	<!-- example content -->
	<div class="mui-container">
		<div class="mui-panel">

			<div class="slider">
				<ul class="slides">
					<c:forEach items="${product.photos}" var="photo">
						<c:url var="imgUrl" value="${photo}" />
						<li><img src="${imgUrl}"> <!-- random image -->
							<div class="caption center-align">
								<h3>${product.name}</h3>
								<h5 class="light grey-text text-lighten-3">${product.sellingPrice}.</h5>
							</div></li>
					</c:forEach>

				</ul>
			</div>
		</div>
	</div>
	 <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.3/js/materialize.min.js"></script>
</body>
<script>
$(document).ready(function(){
    $('.slider').slider();
  });
      
</script>
</html>