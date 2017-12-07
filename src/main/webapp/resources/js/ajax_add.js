$(document).ready(function () {
	$("#product-comment-submit").click(function(){
		var comment = $("#comment").val();
		var autor = $("#autor").val();
		var productId = $("#")
		var raiting;
		$.ajax({
			type: "POST",          
	        url: '/myshop/product/comment/save',
	        data : {comment:comment, autor:autor},
			}).done(function() {
				$.toast({text : 'Ваша заявка оформлена. Дякуємо за покупку', position: 'top-left', icon: 'success', hideAfter: 2000});
		});
	});	

	
    $('#add_to_cart').removeAttr('onclick');
    
    $(".remove-product").click(function(e) {
    	e.preventDefault();
    	var productId = $(this).closest("tr").attr("data-id");
		var $theAnchor = $(this);
		$.ajax({
            type: 'get',
            dataType: "json",
            url: '/myshop/cart/removeProduct',
            data :{productId : productId},
            success: function (count) {    
            	$('#cart_menu div.s_cart_holder').html(count + " items" );
            	$theAnchor.closest("tr").remove();
            },
        })
	});
    
    $("#confirm-button").click(function(e){
    	e.preventDefault();
    	//var products = [];
    	
    	var products = [];
    	$(".product-quantity-cart-row").each(function(){
    		product = {"quantity":$(this).find("td.quantity input").val(), 
    				"price": $(this).find("td.sellingPrice").text(),
    				"productId":$(this).attr("data-id")
    		};
        	products.push(product);
    	})
    	$.ajax({
            type: 'post',
            dataType: "json",
            contentType: 'application/json',
            url: '/myshop/cart/change',
            data :JSON.stringify(products),
            success: function (count) {    
            	 window.location = '/myshop/cart/checkout';
            },
        })
    });
    
    $(".quantity").keyup(function () {
    	var $theAnchor = $(this);
    	var quantity = $(this).find("input").val();
    	var tr = $theAnchor.closest("tr");
    	var price =  tr.children('td.sellingPrice').text();
    	var total = price * quantity;
    	var td = tr.children('td.totalPrice');
    	td.text(total);
    	var newBasketPrice = 0;
    	$(".totalPrice").each(function(){
    		newBasketPrice += parseFloat( $(this).html()); 
    	})
    	$("#basketPrice").html(newBasketPrice);
    });
    
    $(".s_button_remove").live('click', function(){ 	
    //$('.s_button_remove').click(function () {
    	var productId = $(this).attr("data-product-id");
    	var $theAnchor = $(this);
        $.ajax({
            type: 'get',
            dataType: "json",
            url: '/myshop/cart/removeProduct',
            data :{productId : productId},
            success: function (data) {    
            	$('#cart_menu div.s_cart_holder').html(data.count + " items" );
            	  $("#totalPriceSpan").text(data.totalPrice + "₴");
            	$theAnchor.closest("div").remove();
            },
        })
    });
    

    $('.s_button_remove_tr').click(function () {  
        	var productId = $(this).attr("data-product-id");
        	var $theAnchor = $(this);
            $.ajax({
                type: 'get',
                dataType: "json",
                url: '/myshop/cart/removeProduct',
                data :{productId : productId},
                success: function (count) {    
                	$('#cart_menu div.s_cart_holder').html(count + " items" );
                	$theAnchor.closest("tr").remove();
                },
            })
        });

    function addToCart(data, image){
        $.ajax({
            type: 'post',
            url: '/myshop/cart/addProduct',
            dataType: "json",
            data: data,
            success: function (data) {
            	var html = '';
            	var products =  data.productBeans;
            	var divElement = "<div class='s_cart_item'>";
            	$.each( products, function( key, value ) {
            		var aElement = "<a  class='s_button_remove' data-product-id = '" + value.id +"' >&nbsp;</a>";
            		var spanElement = "<span class='block'>" + value.quantity + " x " +  "<a href='/myshop/product/view/" +value.id + "'>"+ 
            		value.name +"</a></span>";
            		html = html  + divElement + aElement +spanElement +  "</div>"
            	});
            	
                $('#productInBasket').html(html);
                $("#totalDiv").removeClass("hidden");
                $("#totalPriceSpan").text(data.totalPrice + "₴");
                $('#cart_menu div.s_cart_holder').html(data.totalCount + " items" );
                $('#cart_menu span.s_grand_total').html($('#cart_menu span.cart_module_total:last').html());
            },
            complete: function () {
                //var image = $('.image').offset();
                if (!$('#cart_side').length && $("#cart_menu").length) {
                    var cart = $('#cart_menu').offset();
                } else {
                    var cart = $('#cart_side').offset();
                }

                $('body').append('<img src="' + image.attr('src') + '" id="temp" style="position: absolute; top: ' + image.offset().top + 'px; left: ' + image.offset().left + 'px;" />');

                params = {
                    top : cart.top + 'px',
                    left : cart.left + 'px',
                    opacity : 0.0,
                    width : $('#cart_side').width(),
                    height : $('#cart_side').height()
                };

                $('#temp').animate(params, 'slow', false, function () {
                    $('#temp').remove();
                });
            }
        });
    }

    $('#add_to_cart').click(function () {
    	var image = $('#image');
    	addToCart($('#product :input'), image);
    });
    $('.add_to_cart').click(function (e) {
    	e.preventDefault();
    	var image = $(this).parent().find("a :first");
    	console.log(image)
    	var productId = $(this).attr("data-productId");
    	var data = {product_id : productId, product_buy_quantity:1}
    	addToCart(data, image);
    });
});