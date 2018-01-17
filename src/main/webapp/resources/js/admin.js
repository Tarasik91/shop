$(document).ready(function() {
	
	$(".removePhoto").click(function(e){
		e.preventDefault();
		var self = $(this);
		var name = $(this).attr("data-product-name");
		var url  = "/admin/product/removePhoto";
		$.ajax({
			type : "POST",
			data:{photoName:name},
			url : url,
			dataType: "json",
			success : function(data) {
				console.log(data)
				if(data.messsage == "OK"){
					self.parent("div").remove();		
				}
			},
			error : function(e) {
				console.log("ERROR : ",e);
			}
		});
	});
	
	
	$("#create").on('submit', function(e){
		e.preventDefault();
	})
	
	$("#create").validate({
		submitHandler: function(form) {		
		var url = "/admin/product/addProduct";
		$.ajax({
			 type: "POST",
			 url: url,
			 data : $("#create").serialize()
			}).done(function(data) {
				$.toast({text : 'Збережено', position: 'top-left', icon: 'success', hideAfter: 2000});				
				 setTimeout(function() {
					 window.location = '/admin/product/edit/' + data;
            		}, 2000);
			});
		}
	});
	
	$(document).on('click', '.addQuantityitem', function(event) {
		console.log("aa")
		//$("#addQuantity").live('click',function(event) {
				event.preventDefault();
				var sizeOptions = '';
				$('select[name="size"]:first option').each(function(key, value) {
									sizeOptions = sizeOptions.concat(value.outerHTML);
				});

	var colorOptions = '';
	$('select[name="color"]:first option').each(
					function(key, value) {
						colorOptions = colorOptions
								.concat(value.outerHTML);
	});
	console.log("${pageContext.request.contextPath}")
		var tr = "<tr><td><select class = 'product-edit' name='size'>"
				+ sizeOptions
				+ "</select></td>"
				+ "<td> <select  class = 'product-edit' name='color'"
				+ colorOptions
				+ "</select></td>"
				+ "<td> <input  class = 'product-edit' name='quantity' type='number'  /></td>"
				+ "<td><a href ='#' class = 'addQuantityitem'><img src='/resources/images/add.png' alt='Add'> </img></a></td></tr>";
		$("#productQuantityTable tbody")
				.append(tr);
	});
		
	$("#orderStatus").change(function(){
		var orderId = $("#orderId").val();
		var statusId =  $(this).find('option:selected').val();
		var url = "/invoice/changeStatus";
		$.ajax({
			data:{statusId:statusId, orderId:orderId}, 
			type: "POST",  
			url: url,
			}).done(function() {
				 Materialize.toast('Статус змінений', 4000) 
			});
	});	
})