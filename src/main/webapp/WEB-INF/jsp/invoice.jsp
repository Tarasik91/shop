<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Малятко</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<meta name="description" content="My Store" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/960.css" />" media="all" />

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/screen.css" />"
	media="screen" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/color.css" />" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/stylesheet/prettyPhoto.css" />"
	media="all" />
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="stylesheet/ie.css" media="screen" />
<![endif]-->

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
	
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>

<script type="text/javascript"
	src="<c:url value="/resources/js/jquery/jquery.prettyPhoto.js" />"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/shoppica.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/js/admin.js"/>"></script>
</head>
<body class="s_layout_fixed">
<div id="wrapper"> 
  
  <!-- ********************** --> 
  <!--      H E A D E R       --> 
  <!-- ********************** --> 
  <div id="header" class="container_12">
    <div class="grid_12">
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
          <a href="">Початкова</a>
          &gt;
          <a href="">Замовлення</a>
        </div>
        <h1>Замовлення</h1>
      </div>
    </div>
  </div>
  <!-- end of intro -->

  <div id="content" class="container_16">
    <div id="order_details" class="grid_16">
	  <input type = "hidden" id = "orderId" value="${order.id}" />
      <div class="s_order clearfix">
        <p class="s_id"><span class="s_999">Номер заявки</span> <span class="s_main_color">#${order.id}</span></p>
        <span class="clear border_eee"></span>
        <dl class="grid_5 alpha clearfix">
          <dt>E-Mail</dt>
          <dd>${order.email }</dd>
          <dt>Телефон</dt>
          <dd>${order.telephone }</dd>
          <dt>Тип доставки</dt>
          <dd>${order.deliveryType.name }</dd>
          <dt>Тип оплати</dt>
          <dd>${order.paidType.name}</dd>
          <dt>Адреса</dt>
          <dd>${order.address }</dd>
          <dt>Відділ нової пошти</dt>
          <dd>${order.newMailAddress }</dd>
          <dt>Коментар</dt>
          <dd>${order.comment}</dd>
          <dt>Статус</dt>
      
          <dd><select name="status" id = "orderStatus">
				<c:forEach items="${orderStatuses}" var="status">
					<option ${order.status == status ? "selected" :""}  
					value="${status}">${status.name}</option>
				</c:forEach>
			</select></dd>
        </dl>
        
        <span class="clear border_eee"></span>

        <h2>Product</h2>
        <table class="s_table" width="100%" cellpadding="0" cellspacing="0" border="0">
          <tr>
            <th>Продукт</th>
            <th>Кількість</th>
            <th>Unit Price</th>
            <th width="130">Total</th>
          </tr>
          
         <c:set var="total" value="${0}"/>
         <c:forEach items="${products}" var="pio">
          <tr>
            <td class="align_left"><strong>${pio.product.name }</strong></td>
            <td>${pio.quantity}</td>
            <td><span class="s_currency s_before">$</span>${pio.price}</td>
            <td><span class="s_currency s_before">$</span>${pio.price * pio.quantity}</td>
            <c:set var="total" value="${total + pio.price * pio.quantity}" />
          </tr>
          </c:forEach>
          
          <tr class="last">
            <td class="align_right" colspan="3"><strong>Разом:</strong></td>
            <td class="s_secondary_color"><span class="s_currency s_before">$</span>${total }</td>
          </tr>
        </table>
      </div>
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
</div>

</body>
</html>
