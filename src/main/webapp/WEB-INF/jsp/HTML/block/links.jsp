<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="system_navigation" class="s_nav">
	<ul class="s_list_1 clearfix">
	  	<li><a href="/myshop/">Home</a></li>
		<li><a href="/myshop/product/type/1/page/1">Продукти</a></li>
		<li><a href="/myshop/cart/view">Корзина</a></li>
		<li><a href="/myshop/order/cards">Заявки</a></li>
		<c:if test="${isAdmin}">
			<li><a href="/myshop/admin-page">Log in</a></li>
			<li><a href="/myshop/logout">Log out</a></li>
		</c:if>
		
	</ul>
</div>
