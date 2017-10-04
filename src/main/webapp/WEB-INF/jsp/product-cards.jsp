<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
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

</head>
<body>
	
	<!-- example content -->
	<div class="mui-container">
	
		<div class="mui-panel">
			<c:forEach items="${products}" var="product">
				<div class="row">
					<c:forEach items="${product}" var="p">
						<c:if test="${not empty p}">
							<div class="col s9 m3">
								<div class="card small">
									<div class="card-image">
										<c:url var="imgUrl" value="${p.photoPath}" />
										<img src="${imgUrl}">
									</div>
									<div class="card-content">
										<p>${p.name }</p>
										<p>Price : ${p.sellingPrice}</p>
									</div>

									<div class="card-action teal">
										<div class="row">
											<div class="col s4">
												<a href="/myshop/product/view/<c:out value="${p.id}" />">
													view</a>
											</div>
											<div class="col s4">
												<a data-id="<c:out value="${p.id}" />"
													class="addProdcutBasket">add basket</a>
											</div>
											<div class="col s4">
												<input type="number" id="quantity<c:out value="${p.id}" />" value = "1"/>
											</div>
										</div>
									</div>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
		$(".addProdcutBasket").click(function(event) {
			var productId = $(this).attr("data-id");
			var quantityid = 'quantity' + productId;
			console.log(quantityid);
			var quantity = $("#"+quantityid).val();
			console.log(quantity)
			$.ajax({
				url : "/myshop/order/addProduct",
				data : {
					productId : productId,
					quantity : quantity
				}
			}).done(function(data) {
				$("#productInBasketCount").text(data);
			});
		});
	})
</script>
</html>