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
        <h1>Orders</h1>
      </div>
    </div>
  </div>
  <!-- end of intro -->
  
  
  <!-- ********************** --> 
  <!--      C O N T E N T     --> 
  <!-- ********************** --> 
  <div id="content" class="container_12">
 
    <div id="order_history" class="grid_12">
      
      <div class="s_listing s_grid_view clearfix">
       <c:forEach items="${orders}" var="order">
        <div class="grid_4">
          <div class="s_order clearfix">
            <p class="s_id"><span class="s_999">Order ID:</span> <span class="s_main_color">#${order.id }</span></p>
            <p class="s_status s_secondary_color">Canceled</p>
            <span class="clear"></span>
            <dl class="clearfix">

              <dt>Date Added::</dt>
              <dd>07/04/2011</dd>
              <dt>Customer:</dt>
              <dd>${order.lastName } ${order.firstName }</dd>
              <dt>Products:</dt>
              <dd>1</dd>

            </dl>
            <span class="clear border_eee"></span>
            <br />
            <p class="s_total left"><span class="s_currency s_before">$</span>${order.amount }</p>
            <a href="invoice.html" class="s_main_color right"><strong>View</strong></a>
          </div>
        </div>
 		</c:forEach>
      </div>

      <a href="invoice.html" class="s_button_1 s_main_color_bgr"><span class="s_text">Continue</span></a>

      <div class="clear"></div>
      <br />

      <br />

    </div>
    
  </div>
  <!-- end of content --> 
  
  <!-- ********************** --> 
  <!--   S H O P   I N F O    --> 
  <!-- ********************** --> 
  <div id="shop_info">
    
  </div>
  <!-- end of shop info --> 
  
  
</div>


</body>
</html>
