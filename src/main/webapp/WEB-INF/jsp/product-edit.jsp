<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%> 
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
			<div class="col s12 m12 l6">
				<form class="mui-form" method="POST" 
					action="/myshop/admin/product/addProduct" >				
					<div class="input-field col s6">
						<input name="name" /> <label for="name"> Name</label>
					</div>
					<div class="row">
						<div class="col s4">
							<label>Purchase price</label> 
							<input name="purchasePrice" />
						</div>
						<div class="col s4">
							<label>selling price</label>
							<input name="sellingPrice" />
						</div>
						<div class="col s4">
							<label>selling price</label> 
							<input name="productType" />
						</div>
							
					</div>
					<button type="submit" class="mui-btn mui-btn--raised">Submit</button>
				 </form>

				<c:if test="${product.id != 0}">
					<form method="POST" enctype="multipart/form-data"
						id="fileUploadForm" enctype="multipart/form-data">
						<input hidden name="productId" type="text" value="${product.id}">
						Please select a file to upload : <input type="file" name="file" />
						<input type="submit" value="Submit" id="btnSubmit" />
					</form>
					<c:forEach items="${product.photos}" var="photo">
						<c:url var="imgUrl" value="${photo}" />
						<img class="materialboxed"
							data-caption="A picture of a way with a group of trees in a park"
							width="250" src="${imgUrl}">
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {

		//$('#productType').find('option[value="my-value"]').prop('selected', true);
		
		$('select').material_select();

		$("#btnSubmit").click(function(event) {

			//stop submit the form, we will post it manually.
			event.preventDefault();

			// Get form
			var form = $('#fileUploadForm')[0];
			var url = "/myshop/admin/product/addPhoto";
			console.log(url)
			// Create an FormData object
			var data = new FormData(form);
			// If you want to add an extra field for the FormData
			data.append("CustomField", "This is some extra data, testing");

			// disabled the submit button
			$("#btnSubmit").prop("disabled", true);

			$.ajax({
				type : "POST",
				enctype : 'multipart/form-data',
				url : url,
				data : data,
				processData : false,
				contentType : false,
				cache : false,
				timeout : 600000,
				success : function(data) {

					$("#result").text(data);
					console.log("SUCCESS : ", data);
					$("#btnSubmit").prop("disabled", false);

				},
				error : function(e) {
					$("#result").text(e.responseText);
					console.log("ERROR : ", e);
					$("#btnSubmit").prop("disabled", false);
				}
			});
		});
	});
</script>
</html>