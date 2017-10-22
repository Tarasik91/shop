$(document).ready(function() {
	$(".remove-product").click(function() {
		var $theAnchor = $(this);
		$theAnchor.closest("div").remove();
	});
		
	$("#deliveryType").change(function(){
		if ($(this).val() == "NEW_MAIL"){
			$("#citySection").removeClass("hidden");
			$("#deparmtmentMapSection").removeClass("hidden");
			getCitiesNewMail();
		}else{
    		$("#deparmtmentNewMailSection").addClass("hidden");
    		$("#citySection").addClass("hidden");
		}
	});
	
	function fillDepartment(cityId){
		data = {
				  "modelName": "AddressGeneral",
				    "calledMethod": "getWarehouses",
				    "methodProperties": {
				         "CityRef": cityId,
				    },
				"apiKey": "8c16ebfdb7984f9e3fa18904a65805f8"
				};
		$('#deparmtmentNewMailSection option') .remove();
		$.ajax({
            type: 'post',
            dataType: "jsonp",
            contentType: 'application/json',
            headers: { 'Access-Control-Allow-Origin': '*' },
            crossDomain: true,
            url: ' https://api.novaposhta.ua/v2.0/json/',
            data :data,
            success: function (response) {
            	$.each(response.data, function( index, val ) {          	
            		$("#deparmtmentNewMailSection").removeClass("hidden")
            		$('#departmantNewMail').append("<option data-latitude= '"+val.Latitude +"'" +
            				"data-longitude= '"+val.Longitude + "'" +
            				"value = '"+ val.Description + "' >" + val.Description + "</option>")
            	});
            	$("#departmantNewMail").trigger("change");
            },
        })
	}
	var marker;
	$("#departmantNewMail").change(function(){
		var element = $(this).find('option:selected');
		var latitude = parseFloat(element.attr("data-latitude"));
		var longitude = parseFloat(element.attr("data-longitude"));
		 var position = {lat: latitude, lng: longitude};
		 if (typeof marker !== "undefined") {
			 marker.setMap(null); 
		 }	 
		 marker = new google.maps.Marker({
	          position: new google.maps.LatLng( position),
	          title: element.val(),
	          map: map
		 });
		 map.setCenter(marker.getPosition());
		 map.setZoom(15);
	});
	function getCitiesNewMail(){
		data = {
				"modelName": "Address",
				"calledMethod": "getCities",
				"apiKey": "8c16ebfdb7984f9e3fa18904a65805f8"
				};
		$.ajax({
            type: 'post',
            dataType: "jsonp",
            contentType: 'application/json',
            headers: { 'Access-Control-Allow-Origin': '*' },
            crossDomain: true,
            url: ' https://api.novaposhta.ua/v2.0/json/',
            data :data,
            success: function (response) {
            	var cities = [];
            	
            	$.each(response.data, function( index, val ) {
            		cities.push({"value": val.Ref, "label": val.Description});
            	});
            	$( "#cities" ).autocomplete({
            	      source: cities,
            	      select: function(event, ui) {
            	          event.preventDefault();
            	          $("#cities").val(ui.item.label);
            	          fillDepartment(ui.item.value)
            	          //$("#selected-customer").val(ui.item.label);
            	      },
            	      focus: function(event, ui) {
            	          event.preventDefault();           	         
            	          $("#cities").val(ui.item.label);
            	      }
            	});
            },
        })
	}
});	

