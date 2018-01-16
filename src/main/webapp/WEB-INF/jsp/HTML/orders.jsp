<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib prefix="joda" uri="http://www.joda.org/joda/time/tags" %>
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
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<script type="text/javascript" src="<c:url value="/resources/js/shoppica.js"/>" ></script>
</head>

<body class="s_layout_fixed">
<div id="wrapper"> 
  
  <!-- ********************** --> 
  <!--      H E A D E R       --> 
  <!-- ********************** -->
  <div id="header" class="container_12">
    <div class="grid_12">
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
          <a href="/myshop">Home</a>
           &gt; <a href="/myshop/order/cards">Заявки</a>
        </div>
        <h1>Заявки</h1>
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
            <p class="s_id"><span class="s_999">№ Зам.:</span> <span class="s_main_color">#${order.id }</span></p>
            <p class="s_status s_secondary_color">${order.status.name} </p>
            <span class="clear"></span>
            <dl class="clearfix">

              <dt>Дата створення</dt>
              <dd><joda:format pattern="dd-MM-yyyy HH:mm" value="${order.dateCreated}"/>
               </dd>
              <dt>Покупець:</dt>
              <dd>${order.lastName } ${order.firstName }</dd>
              <dt>Адреса:</dt>
              <dd>${order.address}</dd>
              <dt>Продуктів:</dt>
              <dd>${order.quantity}</dd>
            </dl>
            <span class="clear border_eee"></span>
            <br />
            <p class="s_total left"><span class="s_currency s_before">$</span>${order.amount }</p>
            <a href="${pageContext.request.contextPath}/invoice/view/${order.id}" class="s_main_color right"><strong>Переглянути</strong></a>
          </div>
        </div>
 		</c:forEach>
      </div>

      <div class="clear"></div>
      <br />
      <br />
    </div>
    
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
