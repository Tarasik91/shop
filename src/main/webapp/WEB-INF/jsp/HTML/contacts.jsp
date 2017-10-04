<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %><html xmlns="http://www.w3.org/1999/xhtml" dir="ltr" lang="en" xml:lang="en" xmlns:fb="http://www.facebook.com/2008/fbml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Your Store</title>
<meta name="description" content="My Store" />
<link rel="stylesheet" type="text/css" href="stylesheet/960.css" media="all" />
<link rel="stylesheet" type="text/css" href="stylesheet/screen.css" media="screen" />
<link rel="stylesheet" type="text/css" href="stylesheet/color.css" media="screen" />
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="stylesheet/ie.css" media="screen" />
<![endif]-->

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.2/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.11/jquery-ui.min.js"></script>
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.8/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/shoppica.js"></script>
<script type="text/javascript">
$(document).ready(function () {
														
	jQuery.validator.setDefaults({
			errorElement: "p",
			errorClass: "s_error_msg",
			errorPlacement: function(error, element) {
					error.insertAfter(element);
			},
			highlight: function(element, errorClass, validClass) {
					$(element).addClass("error_element").removeClass(validClass);
					$(element).parent("div").addClass("s_error_row");
			},
			unhighlight: function(element, errorClass, validClass) {
					$(element).removeClass("error_element").addClass(validClass);
					$(element).parent("div").removeClass("s_error_row");
			}
	});
	$("#contact_form").validate({
		rules: {
			enquiry: {
					required: true,
					minlength: 10
			}
		}
	});
	
});
</script>


</head>

<body class="s_layout_fixed">

<div id="wrapper"> 
  
  <!-- ********************** --> 
  <!--      H E A D E R       --> 
  <!-- ********************** --> 
  <div id="header" class="container_12">
    <div class="grid_12">
    
    	<a id="site_logo" href="index.html">Shoppica store - Premium e-Commerce Theme</a> 

      <div id="system_navigation" class="s_nav">
        <ul class="s_list_1 clearfix">
          <li><a href="index.html">Home</a></li>
          <li><a href="login.html">Log In</a></li>
          <li><a href="cart.html">Shopping Cart</a></li>
          <li><a href="static.html">About Us</a></li>
          <li><a href="contacts.html">Contact</a></li>
        </ul>
      </div>

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
      
      <div id="language_switcher" class="s_switcher"> <span class="s_selected">US Dollar</span>
        <ul class="s_options">
          <li><a href="">Euro</a></li>
          <li><a href="">Pound Sterling</a></li>
          <li><a href="">US Dollar</a></li>
        </ul>
      </div>
      
      <div id="currency_switcher" class="s_switcher"> <span class="s_selected"><img src="images/flags/gb.png" alt="English" /> English</span>
        <ul class="s_options">
          <li><a href=""><img src="images/flags/gb.png" alt="English" /> English</a></li>
          <li><a href=""><img src="images/flags/de.png" alt="Deutsch" /> Deutsch</a></li>
        </ul>
      </div>
      
      <div id="categories" class="s_nav">
        <ul>
          <li id="menu_home"> <a href="index.html">Home</a> </li>
          <li> <a href="listing_1.html">Electronics</a>
            <div class="s_submenu">
              <h3>Inside Electronics</h3>
              <ul class="s_list_1 clearfix">
                <li> <a href="listing_1.html">Digital Cameras</a>
                  <ul class="s_list_1 clearfix">
                    <li><a href="listing_1.html">Compact Cameras</a></li>
                    <li><a href="listing_1.html">Digital SLR</a></li>
                  </ul>
                </li>
                <li><a href="listing_1.html">Home Audio</a></li>
                <li><a href="listing_1.html">Home Cinema</a></li>
                <li><a href="listing_1.html">Cell Phones</a></li>
                <li><a href="listing_1.html">MP3 Players</a></li>
                <li><a href="listing_1.html">Car-Audio</a></li>
              </ul>
              <span class="clear border_eee"></span>
              <h3>Electronics Brands</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Canon</a></li>
                <li><a href="listing_1.html">Hugo Boss</a></li>
                <li><a href="listing_1.html">Panasonic</a></li>
                <li><a href="listing_1.html">Samsung</a></li>
                <li><a href="listing_1.html">Sony</a></li>
              </ul>
            </div>
          </li>
          <li> <a href="listing_1.html">Computers</a>
            <div class="s_submenu">
              <h3>Inside Computers</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Desktops</a></li>
                <li><a href="listing_1.html">Laptops</a></li>
                <li><a href="listing_1.html">Monitors</a></li>
                <li><a href="listing_1.html">Components</a></li>
                <li><a href="listing_1.html">Software</a></li>
              </ul>
              <span class="clear border_eee"></span>
              <h3>Computers Brands</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Hugo Boss</a></li>
                <li><a href="listing_1.html">Sony</a></li>
              </ul>
            </div>
          </li>
          <li><a href="listing_1.html">Clothing</a>
            <div class="s_submenu">
              <h3>Inside Clothing</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Women's Clothing</a></li>
                <li><a href="listing_1.html">Men's Clothing</a></li>
                <li><a href="listing_1.html">Boys</a></li>
                <li><a href="listing_1.html">Girls</a></li>
                <li><a href="listing_1.html">Infants and toddlers</a></li>
              </ul>
              <span class="clear border_eee"></span>
              <h3>Clothing Brands</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Bvlgari</a></li>
                <li><a href="listing_1.html">Elisabeth Arden</a></li>
              </ul>
            </div>
          </li>
          <li><a href="listing_1.html">Shoes</a>
            <div class="s_submenu">
              <h3>Inside Shoes</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Women's Shoes</a></li>
                <li><a href="listing_1.html">Men's Shoes</a></li>
                <li><a href="listing_1.html">Kids' Shoes</a></li>
                <li><a href="listing_1.html">Sportswear</a></li>
              </ul>
              <span class="clear border_eee"></span>
              <h3>Shoes Brands</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Adidas</a></li>
                <li><a href="listing_1.html">Apple</a></li>
                <li><a href="listing_1.html">Armani</a></li>
                <li><a href="listing_1.html">Balenciaga</a></li>
                <li><a href="listing_1.html">Christian Dior</a></li>
                <li><a href="listing_1.html">Nike</a></li>
                <li><a href="listing_1.html">Samsung</a></li>
                <li><a href="listing_1.html">Sony</a></li>
              </ul>
            </div>
          </li>
          <li><a href="listing_1.html">Gifts</a>
            <div class="s_submenu">
              <h3>Inside Gifts</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Perfumes</a></li>
                <li><a href="listing_1.html">Spirits and Beers</a></li>
                <li><a href="listing_1.html">Wines</a></li>
                <li><a href="listing_1.html">Flowers</a></li>
                <li><a href="listing_1.html">Chocolates and sweets</a></li>
                <li><a href="listing_1.html">Toys and Games</a></li>
                <li><a href="listing_1.html">Pets</a></li>
              </ul>
              <span class="clear border_eee"></span>
              <h3>Gifts Brands</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Adidas</a></li>
                <li><a href="listing_1.html">Armani</a></li>
                <li><a href="listing_1.html">Balenciaga</a></li>
                <li><a href="listing_1.html">Bvlgari</a></li>
                <li><a href="listing_1.html">Canon</a></li>
                <li><a href="listing_1.html">Christian Dior</a></li>
                <li><a href="listing_1.html">Elisabeth Arden</a></li>
                <li><a href="listing_1.html">Hugo Boss</a></li>
                <li><a href="listing_1.html">Sony</a></li>
              </ul>
            </div>
          </li>
          <li><a href="listing_1.html">At home</a>
            <div class="s_submenu">
              <h3>Inside At home</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Furniture</a></li>
                <li><a href="listing_1.html">Garden</a></li>
                <li><a href="listing_1.html">Appliances</a></li>
                <li><a href="listing_1.html">Pet Supplies</a></li>
                <li><a href="listing_1.html">Tools and Accessories</a></li>
                <li><a href="listing_1.html">Lighting</a></li>
                <li><a href="listing_1.html">Food and Drink</a></li>
              </ul>
            </div>
          </li>
          <li><a href="listing_1.html">Health</a>
            <div class="s_submenu">
              <h3>Inside Health</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Suplements</a></li>
                <li><a href="listing_1.html">Cosmetics</a></li>
                <li><a href="listing_1.html">Personal Care</a></li>
              </ul>
            </div>
          </li>
          <li><a href="listing_1.html">Jewellery</a>
            <div class="s_submenu">
              <h3>Inside Jewellery</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Necklaces</a></li>
                <li><a href="listing_1.html">Rings</a></li>
                <li><a href="listing_1.html">Bracelets</a></li>
                <li><a href="listing_1.html">Earrings</a></li>
                <li><a href="listing_1.html">Pendants</a></li>
              </ul>
            </div>
          </li>
          <li><a href="listing_1.html">Books</a>
            <div class="s_submenu">
              <h3>Inside Books</h3>
              <ul class="s_list_1 clearfix">
                <li><a href="listing_1.html">Fantasy</a></li>
                <li><a href="listing_1.html">Love Stories</a></li>
                <li><a href="listing_1.html">Science Fiction</a></li>
                <li><a href="listing_1.html">Educational</a></li>
              </ul>
            </div>
          </li>
        </ul>
      </div>
      
      <div id="cart_menu" class="s_nav">
      	<a href="cart.html"><span class="s_icon"></span> <small class="s_text">Cart</small><span class="s_grand_total s_main_color">$0.00</span></a>
        <div class="s_submenu s_cart_holder">
          <p class="s_mb_0">0 items</p>
        </div>
      </div>
      
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
          <a href="">Home</a>
          &gt;
          <a href="">Contact Us</a>
        </div>
        <h1>Contact Us</h1>
      </div>
    </div>
  </div>
  <!-- end of intro -->

  
  <!-- ********************** --> 
  <!--      C O N T E N T     -->
  <!-- ********************** --> 
  <div id="content" class="container_16">


    
    <div id="contacts" class="s_info_page grid_12">
     	
      <h2><span class="s_secondary_color">Shop</span> address</h2>
      
      <p class="alpha grid_4"><strong>Shoppica store</strong><br /> 5 Shoppica Blvd<br /> New York<br /> 1000</p>
      <p class="grid_4"><strong>Telephone:</strong><br /> +1 (0) 7007001</p>
      <p class="omega grid_4"><strong>Fax:</strong><br /> +1 (0) 7007002</p>

      <br />
      <span class="clear border_ddd"></span>
      <br />
      
      
      <h2><span class="s_secondary_color">Send</span> a message</h2>

      <form id="contact_form" action="#" method="post" enctype="multipart/form-data">
      	<div id="contact_form_icon"></div>
        
        <div class="s_row_3 clearfix">
          <label><strong>First Name:</strong> *</label>
          <input type="text" size="40" class="required" title="Name must be between 3 and 32 characters!" />
        </div>
        <div class="s_row_3 clearfix">
          <label><strong>E-Mail Address:</strong> *</label>
          <input type="text" size="40" class="required email" title="E-Mail Address does not appear to be valid!" />
        </div>
        <div class="s_row_3 clearfix">
          <label><strong>Enquiry:</strong> *</label>
          <div class="s_full">
            <textarea id="enquiry" style="width: 98%;" rows="10" class="required" title="Enquiry must be between 10 and 3000 characters!"></textarea>
          </div>
        </div>
        <a class="s_button_1 s_main_color_bgr" onclick="$('#contact_form').submit();"><span class="s_text">Send message</span></a>
      </form>

    </div>
    
    <div id="right_col" class="grid_3">

      <div id="information_module" class="s_box">
        <h2>Information</h2>
        <ul class="s_list_1">
          <li><a href="static.html">About Shoppica</a></li>
          <li><a href="static.html">Privacy Policy</a></li>
          <li><a href="static.html">Terms &amp; Conditions</a></li>
          <li><a href="contacts.html">Contact Us</a></li>
          <li><a href="sitemap.html">Site Map</a></li>
        </ul>
      </div>
  
      <div id="featured_side" class="s_box clearfix">
        <h2>Featured</h2>
        <div class="s_item s_size_1 clearfix">
          <a class="s_thumb" href="product.html"><img src="images/dummy/pic_8.jpg" width="38" height="38" alt="White football trainers" /></a>
          <h3><a href="product.html">White football trainers</a></h3>
          <p><a href="product.html"><span class="s_main_color"><span class="s_currency s_before">Â£</span>117.50</span></a></p>
        </div>
        <div class="s_item s_size_1 clearfix">
          <a class="s_thumb" href="product.html"><img src="images/dummy/pic_7.jpg" width="38" height="38" alt="Hubo Boss Emotion" /></a>
          <h3><a href="product.html">Hubo Boss Emotion</a></h3>
          <p><a href="product.html"><span class="s_main_color"><span class="s_currency s_before">Â£</span>2,350.00</span></a></p>
        </div>
        <div class="s_item s_size_1 clearfix">
          <a class="s_thumb" href="product.html"><img src="images/dummy/pic_6.jpg" width="38" height="38" alt="Christian Dior J'adore" /></a>
          <h3><a href="product.html">Christian Dior J'adore</a></h3>
          <p><a href="product.html"><span class="s_main_color"><span class="s_currency s_before">Â£</span>328.99</span></a></p>
        </div>
      </div>

    </div>
    
    <div class="clear"></div>
   
  </div>
  <!-- end of content -->
  
  <!-- ********************** --> 
  <!--   S H O P   I N F O    --> 
  <!-- ********************** --> 
  <div id="shop_info">
    <div id="shop_info_wrap">
      <div class="container_12">
        <div id="shop_description" class="grid_3">
          <h2>Shoppica Theme</h2>
          <p>Pellentesque a arcu ut nisi semper cursus. Nullam vehicula dapibus ultrices. Integer nunc risus, fringilla ut hendrerit a, dapibus vestibulum ante. In ullamcorper erat et orci mattis rutrum et a enim. Curabitur semper, erat sit amet condimentum volutpat, enim nisi auctor augue, id fringilla est dui non lectus. Cras in urna ante, sit amet dignissim orci. Proin nibh urna, consectetur vitae placerat luctus.</p>
        </div>
        <div id="shop_contacts" class="grid_3">
          <h2>Contact Us</h2>
          <table width="100%" cellpadding="0" cellspacing="0" border="0">
            <tr>
              <td valign="middle"><span class="s_icon_32"><span class="s_icon s_phone_32"></span>5234452 <br /></span></td>
            </tr>
            <tr>
              <td valign="middle"><span class="s_icon_32"><span class="s_icon s_fax_32"></span>5234452 <br /></span></td>
            </tr>
            <tr>
              <td valign="middle"><span class="s_icon_32"><span class="s_icon s_mail_32"></span>pinko@example.com <br /> pinko@example.com</span></td>
            </tr>
            <tr>
              <td valign="middle"><span class="s_icon_32"><span class="s_icon s_skype_32"></span>my_skype <br /> </span></td>
            </tr>
          </table>
        </div>
        <div id="twitter" class="grid_3">
          <h2>Twitter</h2>
          <ul id="twitter_update_list"><li></li></ul>
          <script type="text/javascript" src="http://twitter.com/javascripts/blogger.js"></script> 
          <script type="text/javascript" src="http://twitter.com/statuses/user_timeline/themeburn.json?callback=twitterCallback2&amp;count=2"></script> 
        </div>
        <div id="facebook" class="grid_3">
          <h2>Facebook</h2>
          <div class="s_widget_holder">
            <fb:fan profileid="111188056908" stream="0" connections="6" logobar="0" width="220" css="http://svest.no-ip.org/test/opencart/catalog/view/theme/shoppica/stylesheet/facebook.css.php?300"></fb:fan>
          </div>
        </div>
        <div class="clear"></div>
      </div>
    </div>
  </div>
  <!-- end of shop info --> 
  
  
  
  <!-- ********************** --> 
  <!--      F O O T E R       --> 
  <!-- ********************** --> 
  <div id="footer" class="container_12">
    <div id="footer_categories" class="clearfix">
      <div class="grid_2">
        <h2>Electronics</h2>
        <ul class="s_list_1">
          <li><a href="">Digital Cameras</a></li>
          <li><a href="">Home Audio</a></li>
          <li><a href="">Home Cinema</a></li>
          <li><a href="">Cell Phones</a></li>
          <li><a href="">MP3 Players</a></li>
          <li><a href="">Car-Audio</a></li>
        </ul>
      </div>
      <div class="grid_2">
        <h2>Computers</h2>
        <ul class="s_list_1">
          <li><a href="">Desktops</a></li>
          <li><a href="">Laptops</a></li>
          <li><a href="">Monitors</a></li>
          <li><a href="">Components</a></li>
          <li><a href="">Software</a></li>
        </ul>
      </div>
      <div class="grid_2">
        <h2>Clothing</h2>
        <ul class="s_list_1">
          <li><a href="">Women's Clothing</a></li>
          <li><a href="">Men's Clothing</a></li>
          <li><a href="">Boys</a></li>
          <li><a href="">Girls</a></li>
          <li><a href="">Infants and toddlers</a></li>
        </ul>
      </div>
      <div class="grid_2">
        <h2>Shoes</h2>
        <ul class="s_list_1">
          <li><a href="">Women's Shoes</a></li>
          <li><a href="">Men's Shoes</a></li>
          <li><a href="">Kids' Shoes</a></li>
          <li><a href="">Sportswear</a></li>
        </ul>
      </div>
      <div class="grid_2">
        <h2>Gifts</h2>
        <ul class="s_list_1">
          <li><a href="">Perfumes</a></li>
          <li><a href="">Spirits and Beers</a></li>
          <li><a href="">Wines</a></li>
          <li><a href="">Flowers</a></li>
          <li><a href="">Chocolates and sweets</a></li>
          <li><a href="">Toys and Games</a></li>
        </ul>
      </div>
      <div class="grid_2">
        <h2>At home</h2>
        <ul class="s_list_1">
          <li><a href="">Furniture</a></li>
          <li><a href="">Garden</a></li>
          <li><a href="">Appliances</a></li>
          <li><a href="">Pet Supplies</a></li>
          <li><a href="">Tools and Accessories</a></li>
          <li><a href="">Lighting</a></li>
        </ul>
      </div>
      <div class="clear"></div>
      <div class="grid_12 border_eee"></div>
    </div>
    <div id="payments" class="right clearfix">
      <img src="images/payments/discover_straight_32px.png" alt="" />
      <img src="images/payments/american_express_straight_32px.png" alt="" />
      <img src="images/payments/moneybookers_straight_32px.png" alt="" />
      <img src="images/payments/paypal_straight_32px.png" alt="" />
      <img src="images/payments/visa_straight_32px.png" alt="" />
      <img src="images/payments/american_express_straight_32px.png" alt="" />
    </div>
    <p id="copy">&copy; Copyright 2011. Powered by <a class="blue" href="">Open Cart</a>.<br /> <a class="s_main_color" href="http://www.shoppica.net">Shoppica theme</a> made by <a href="http://www.themeburn.com">ThemeBurn.com</a></p>
  </div>
  <!-- end of FOOTER --> 
  
</div>

<div id="fb-root"></div>
<script type="text/javascript">
  window.fbAsyncInit = function() {
    FB.init({appId: '0c18007de6f00f7ecda8c040fb76cd90', status: true, cookie: true,
     xfbml: true});
  };
  (function() {
    var e = document.createElement('script'); e.async = true;
    e.src = document.location.protocol +
    '//connect.facebook.net/en_US/all.js';
    document.getElementById('fb-root').appendChild(e);
  }());
</script>

</body>
</html>
