<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="categories" class="s_nav">
	<ul>
		<li id="menu_home"><a href="${pageContext.request.contextPath}">Home</a></li>
		<c:forEach items="${productTypes }" var="productType">
			<li><a href="/product/type/${productType.id }/page/1">${productType.name }</a>
			</li>
		</c:forEach>
	</ul>
</div>

<div id="cart_menu" class="s_nav">
	<a href="${pageContext.request.contextPath}/cart/view""><span class="s_icon"></span> <small
		class="s_text">Корзина</small><span class="s_grand_total s_main_color">${PIB.totalPrice}</span></a>
	<div class="s_submenu s_cart_holder">
		<p class="s_mb_0">${PIB.totalCount} продукт(и/ів)</p>
	</div>
</div>