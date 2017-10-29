<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="system_navigation" class="s_nav">
	<ul class="s_list_1 clearfix">
	  	<li><a href="${pageContext.request.contextPath}">Головна</a></li>
		<li><a href="${pageContext.request.contextPath}/product/type/1/page/1">Продукти</a></li>
		<li><a href="${pageContext.request.contextPath}/cart/view">Корзина</a></li>
		<li><a href="${pageContext.request.contextPath}/order/cards">Заявки</a></li>
		<c:if test="${isAdmin}">
			<li><a href="${pageContext.request.contextPath}/admin-page">Log in</a></li>
			<li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
		</c:if>
		
	</ul>
</div>
