<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<!-- load MUI -->
<link href="//cdn.muicss.com/mui-0.9.25/css/mui.min.css"
	rel="stylesheet" type="text/css" />
<script src="//cdn.muicss.com/mui-0.9.25/js/mui.min.js"></script>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.100.2/css/materialize.min.css">
<title>Insert title here</title>
</head>
<body>
	<div class="mui-container">
		<div class="mui-panel">
			<table class="bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productTypes}" var="productType">
					<tr>
						<td><c:out value="${productType.id}" /></td>
						<td><c:out value="${productType.name}" /></td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</body>
</html>