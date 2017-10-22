$(document).ready(function() {
	
	$(".removePhoto").click(function(e){
		e.preventDefault();
		var self = $(this);
		var name = $(this).attr("data-product-name");
		var url  = "/myshop/admin/product/removePhoto";
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
	
	$("#submit-button").click(function() {
		var url = "/myshop/admin/product/addProduct";
		$.ajax({
			 type: "POST",  
			url: url,
			  data : $("#create").serialize()
			}).done(function() {
				 Materialize.toast('Збережено', 4000) 
			});
	});
	
		$("#addQuantity").live('click',
			function(event) {
				event.preventDefault();
				var sizeOptions = '';
				$('select[name="size"]:first option').each(function(key, value) {
									sizeOptions = sizeOptions.concat(value.outerHTML);
								});

	var colorOptions = '';
	$('select[name="color"]:first option')
			.each(
					function(key, value) {
						colorOptions = colorOptions
								.concat(value.outerHTML);
														});
		var tr = "<tr><td><select class = 'product-edit' name='size'>"
				+ sizeOptions
				+ "</select></td>"
				+ "<td> <select  class = 'product-edit' name='color'"
				+ colorOptions
				+ "</select></td>"
				+ "<td> <input  class = 'product-edit' name='quantity' type='number'  /></td>"
				+ "<td><a href ='#' id = 'addQuantity'><img src='${pageContext.request.contextPath}/resources/images/add.png' alt='Add'> </img></a></td></tr>";
		$("#productQuantityTable tbody")
				.append(tr);
	});
})