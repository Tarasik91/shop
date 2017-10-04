<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Your Store</title>
<meta name="description" content="My Store" />
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
				

      <div id="site_search">
      	<a id="show_search" href="javascript:;" title="Search:"></a>
        <div id="search_bar" class="clearfix">
          <input type="text" id="filter_keyword" />
          <select id="filter_category_id">
            <option value="0">All Categories</option>
            <option value="1">Category 1</option>
            <option value="2">Category 2</option>
          </select>
          <a class="s_button_1 s_secondary_color_bgr"><span class="s_text">Go</span></a> <a class="s_advanced s_main_color" href="">Advanced Search</a>
        </div>
      </div>
      
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
          <a href="index.html">Home</a>
           &gt; <a href="cart.html">Basket</a>
        </div>
        <h1>Shopping Cart (0.00kg)</h1>
      </div>
    </div>
  </div>
  <!-- end of intro -->
  
  
  <!-- ********************** --> 
  <!--      C O N T E N T     --> 
  <!-- ********************** --> 
  <div id="content" class="container_12">
  
    <div id="shopping_cart" class="grid_12">

      <form id="cart" class="clearfix" action="/myshop/cart/checkout">
        <table class="s_table_1" width="100%" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <th width="65">Remove</th>
            <th width="60">Image</th>
            <th width="320">Name</th>     
            <th>Quantity</th>
            <th>Unit Price</th>
            <th>Total</th>
          </tr>
           <c:forEach items="${PIB.productBeans}" var="p">
             <tr class="even">
            <td valign="middle"><a class="s_button_remove_tr" data-product-id="${p.id}">&nbsp;</a></td>
            <c:url var="imgUrl"	value="${p.photoPath}" />
            <td valign="middle"><a href="/myshop/product/view/<c:out value="${p.id}"/>" ><img src="${imgUrl }" width="60" height="60" alt="Pana" /></a></td>
            
            <td valign="middle">${p.name}</td>
            <td valign="middle"><input type="text" size="3" value = "${p.quantity }"/></td>
            <td valign="middle">${p.sellingPrice}<span class="s_currency s_after"> ₴</span></td>
            <td valign="middle">${p.totalPrice}<span class="s_currency s_after"> ₴</span></td>
          </tr>
            </c:forEach>
        </table>
        <br />
        <p class="s_total s_secondary_color last"><strong>Total:</strong> ${PIB.totalPrice }<span class="s_currency s_after">₴</span></p>
                        
        <div class="clear"></div>
        <br />
        <button class="s_button_1 s_main_color_bgr" type="submit"><span class="s_text">Checkout</span></button>
      </form>

    </div>

    <div class="clear"></div>
    <br />
    <br />
    
  </div>
  <!-- end of content --> 
  
</div>

</body>
</html>
