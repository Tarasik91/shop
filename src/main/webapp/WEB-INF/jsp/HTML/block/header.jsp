
<div id="categories" class="s_nav">
	<ul>
		<li id="menu_home"><a href="index.html">Home</a></li>
		<c:forEach items="${productTypes }" var="productType">
			<li><a href="/myshop/product/productCategory/${productType.id }">${productType.name }</a>
			</li>
		</c:forEach>
	</ul>
</div>

<div id="cart_menu" class="s_nav">
	<a href="/myshop/cart/view""><span class="s_icon"></span> <small
		class="s_text">Cart</small><span class="s_grand_total s_main_color">${PIB.totalPrice	 }</span></a>
	<div class="s_submenu s_cart_holder">
		<p class="s_mb_0">${PIB.totalCount}items</p>
	</div>
</div>