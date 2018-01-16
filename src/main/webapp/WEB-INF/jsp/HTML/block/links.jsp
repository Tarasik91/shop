<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<a id="site_logo" href="/myshop">Shoppica store - Premium
					e-Commerce Theme</a>
<div id="system_navigation" class="s_nav">
	<ul class="s_list_1 clearfix">
	  	<li><a href="${pageContext.request.contextPath}">Головна</a></li>
		<li><a href="${pageContext.request.contextPath}/product/type/1/page/1">Продукти</a></li>
		<li><a href="${pageContext.request.contextPath}/cart/view">Корзина</a></li>
		<c:if test="${isAdmin}">
			<li><a href="${pageContext.request.contextPath}/order/cards">Заявки</a></li>
			<li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
		</c:if>
	</ul>
</div>
