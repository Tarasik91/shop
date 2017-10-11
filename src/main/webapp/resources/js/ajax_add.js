$(document).ready(function () {
    $('#add_to_cart').removeAttr('onclick');

    //$(document).on('click','.s_button_remove',function(){
    $(".s_button_remove").live('click', function(){ 	
    //$('.s_button_remove').click(function () {
    	var productId = $(this).attr("data-product-id");
    	var $theAnchor = $(this);
        $.ajax({
            type: 'get',
            dataType: "json",
            url: '/myshop/cart/removeProduct',
            data :{productId : productId},
            success: function (count) {    
            	$('#cart_menu div.s_cart_holder').html(count + " items" );
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


    $('#add_to_cart').click(function () {
        $.ajax({
            type: 'post',
            url: '/myshop/cart/addProduct',
            dataType: "json",
            data: $('#product :input'),
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
                $('#cart_menu div.s_cart_holder').html(data.totalCount + " items" );
                $('#cart_menu span.s_grand_total').html($('#cart_menu span.cart_module_total:last').html());
            },
            complete: function () {
                var image = $('#image').offset();
                if (!$('#cart_side').length && $("#cart_menu").length) {
                    var cart = $('#cart_menu').offset();
                } else {
                    var cart = $('#cart_side').offset();
                }

                $('body').append('<img src="' + $('#image').attr('src') + '" id="temp" style="position: absolute; top: ' + image.top + 'px; left: ' + image.left + 'px;" />');

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
    });
});