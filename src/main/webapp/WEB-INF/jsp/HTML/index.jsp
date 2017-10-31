<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Малятко</title>
<meta name="description" content="Малятко" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/960.css" />" media="all" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/screen.css" />"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/color.css" />" media="screen" />
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="stylesheet/ie.css" media="screen" />
<![endif]-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/shoppica.js"/>" ></script>

</head>

<body class="s_layout_fixed">

<div id="wrapper">   
  <!-- ********************** --> 
  <!--      H E A D E R       --> 
  <!-- ********************** -->
  <div id="header" class="container_12">
    <div class="grid_12">    
    	<a id="site_logo" href="/myshop/">Shoppica store - Premium e-Commerce Theme</a> 
      <%@include file="block/links.jsp"%>	
      <%@include file="block/header.jsp"%>
    </div>
  </div>
  <!-- end of header --> 
 
  <!-- ********************** --> 
  <!--     I N T R O          --> 
  <!-- ********************** --> 
  <div id="intro">
    <div id="intro_wrap">
      <div id="product_intro" class="container_12">
        <div id="product_intro_info" class="grid_5">
          
          <c:forEach items="${products}" var="product">         				
	          <div style="position: relative; display: none;">
	            <h2><a href="/myshop/product/view/<c:out value="${product.id}" />">${product.name }</a></h2>
	            <p class="s_desc">${product.description} </p>
	            <div class="s_price_holder">
	              <p class="s_price"> $ ${product.sellingPrice }</p>
	            </div>
	          </div>
          
          </c:forEach>
          
        </div>
        <div id="product_intro_preview">
          <div class="slides_container">
          <c:forEach items="${products}" var="product">  
            <div class="slideItem" style="display: none"><a href="/myshop/product/view/<c:out value="${product.id}" />"><img src="${pageContext.request.contextPath}/${product.photoPath}" alt="" /></a></div>
           </c:forEach>
            
          </div>
          <a class="s_button_prev" href="javascript:;"></a>
          <a class="s_button_next" href="javascript:;"></a>
        </div>
      </div>
    </div>
  </div>
	<script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery.slides.js"/>" > </script> 
  <script type="text/javascript" src="<c:url value="/resources/js/shoppica.products_slide.js"/>" > </script>
  <!-- end of intro --> 
  
  
  <!-- ********************** --> 
  <!--      C O N T E N T     --> 
  <!-- ********************** --> 
  <div id="content" class="container_12">
   <div id="welcome" class="grid_12">
      <h2>Вітаємо в інтернет - магазині * Малятко* !</h2>
      <p> У нас ви можете придбати якісний , модний дитячий одяг за низькими цінами. Мінімальної суми немає , продаж від однієї одиниці товару. Можливий опт: від 500 грн - безкоштовна доставка, від 1000 грн -5 % + безкоштовна доставка.  </p>
      <p>Доставка : Новою поштою, Укр поштою, Самовивіз ( м.Львів , вул. Водогінна 2 )</p>
      <p>Оплата : карта Приват банку, наложний платіж ( Нова пошта-оплата при отриманні )</p>
      <p>Замовити товар можна через: Корзину, shopmalyatko@gmail.com, Viber ( ‎0680334666 )</p>
      <p>робочий графік : Пн - ПТ з 10:00 - 18:00 год </p>
    </div>
    
    <div class="clear"></div> 
  </div>
  <!-- end of content --> 
  
		<!--   S H O P   I N F O    -->
		<!-- ********************** -->
		<div id="shop_info">
			<div id="shop_info_wrap">
				<div class="container_12">
					<%@include file="block/contact.jsp"%>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!-- end of shop info -->
</div>

</body>
</html>
