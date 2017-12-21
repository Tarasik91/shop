<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Малятко</title>
<meta name="description" content="Малятко" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/960.css" />" media="all" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/screen.css" />" media="screen" />
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/stylesheet/color.css" />" media="screen" />
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="stylesheet/ie.css" media="screen" />
<![endif]-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/shoppica.js"/>" ></script>
<script type="text/javascript" src="<c:url value="/resources/js/ajax_add.js"/>"></script>

</head>

<body class="s_layout_fixed">

<div id="wrapper"> 
  
  <!-- ********************** --> 
  <!--      H E A D E R       --> 
  <!-- ********************** -->
  <div id="header" class="container_12">
    <div class="grid_12">
    
    	<a id="site_logo" href="index.html">Shoppica store - Premium e-Commerce Theme</a> 

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
      <div class="container_12">
        <div id="breadcrumbs" class="grid_12">
          <a href="/myshop/">Головна</a>
           &gt; <a href="/myshop/cart/view">Корзина</a>
        </div>
        <h1>Корзина</h1>
      </div>
    </div>
  </div>
  <!-- end of intro -->
  
  
  <!-- ********************** --> 
  <!--      C O N T E N T     --> 
  <!-- ********************** --> 
  <div id="content" class="container_12">
  
    <div id="shopping_cart" class="grid_12">
 	<c:if test = "${PIB.productBeans.size() > 0}">
      <form id="cart" class="clearfix" >
        <table class="s_table_1" width="100%" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <th width="65">Видалити</th>
            <th width="60">Іконка</th>
            <th width="320">Назва</th>     
            <th>Кількість</th>
            <th>Ціна</th>
            <th>Загальна</th>
          </tr>
           <c:forEach items="${PIB.productBeans}" var="p">
           <tr class="even product-quantity-cart-row" data-id = "${p.id}">
	           <td ><a href="#"  class = "remove-product"><img src="${pageContext.request.contextPath}/resources/images/trash1600.png" width="24" height="24" /></a></td>
	           <td valign="middle"><a href="/myshop/product/view/<c:out value="${p.id}"/>" ><img src="${pageContext.request.contextPath}${p.photoPath}" width="60" height="60" alt="Pana" /></a></td> 
	           <td valign="middle">${p.name}</td>
	           <td class= "quantity" valign="middle"><input type="number"  min="1"  onkeypress="return event.charCode >= 48" size="3" value = "${p.quantity }"/></td>
	           <td class = "sellingPrice" valign="middle">${p.sellingPrice}</td>
	           <td class = "totalPrice align_right"  >${p.totalPrice}</td>
           </tr>
           </c:forEach>
        </table>
        <input hidden name = "products" id  = "products"/>
        <p class="s_total s_secondary_color last"><strong>Загальна:</strong><span id = "basketPrice"> ${PIB.totalPrice }</span> </p>                
        <div class="clear"></div>
        <br />
        <button class="s_button_1 s_main_color_bgr" id = "confirm-button" ><span class="s_text">Підтвердити</span></button>
      </form>
      </c:if>
      <c:if test = "${PIB.productBeans.size() == 0}">
      	<h2>Корзина пуста</h2>
      </c:if>
    </div>
    <div class="clear"></div>
    <br />
  </div>
  		<div id="shop_info">
			<div id="shop_info_wrap">
				<%@include file="block/contact.jsp"%>
			</div>
		</div>
  <!-- end of content --> 
</div>
</body>
</html>
