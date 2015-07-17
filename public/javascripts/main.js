$(document).ready(function(){
	function process_ajax(request_uri, data){
		 console.log(request_uri)
		if (typeof(a)==='undefined') data = "";
		$.ajax({
				url : request_uri,
				method : "GET",
				dataType : "html"
			})
		 .done(function(data, textstatus, jqXHR) {
				console.log(data)
				if (jqXHR.status == 200) {
					$('#countries-category-accordian').hide() //hiding regions list
					$("#country-display-list").html(data)
				};
		  })
		 .fail(function(data, textstatus, jqXHR) {
		  })
	}

	$('#search-countries').bind('form_submit_on_enter',function() {
		query_string = $(this).val()
		$.ajax({
				url : "/search",
				method : "POST",
				data : {query : query_string},
				dataType : "html"
			})
		 .done(function(data, textstatus, jqXHR) {
				console.log(data)
				if (jqXHR.status == 200) {
					$("#country-display-list").html(data)
				};
		  })
		 .fail(function(data, textstatus, jqXHR) {
	 		  console.log("go have some walk")
		  })
	})

	$('#search-countries').keydown(function(e){
		if (e.keyCode == 13) {
		 	$(this).trigger('form_submit_on_enter')
		 	return false
		 } 
	})

	//for search result
 	$('#country-display-list').on('click','ul.country-list>li',function(){
		var country_name = $(this).data('name')
		$('#modal-country-name').html(country_name)
		$('#country-capital').html($(this).data('capital'))
		$('#country-region').html($(this).data('region'))
		$('#country-sub-region').html($(this).data('sub-region'))
		$('#country-population').html($(this).data('population'))
		$('#country-calling-codes').html($(this).data('calling-codes'))
		$('#country-top-level-domain').html($(this).data('top-level-domain'))
		$('#country-country-code').html($(this).data('alpha-two-code') +"   " +$(this).data('alpha-three-code'))
		$('#country-currencies').html($(this).data('currencies'))
		$('#country-languages').html($(this).data('languages'))
		$('#country-native-name').html($(this).data('native-name'))
		$('#country-modal').modal('toggle');
	})

	$('.category-pannel').on('click',function(){ 	
		var request_uri = $(this).data('pannel-name') + $(this).text().trim()
		process_ajax(request_uri)
	})


 	$('#pannel-show').on('click',function(){
 		$('#countries-category-accordian').show() //
 		$("#country-display-list").html("")
 	})

 	//for all other modals

	function initialize() {
		var mapCanvas = document.getElementById('map-canvas');
		var latlong = new google.maps.LatLng(44.5403, -78.5463)
		var mapOptions = {
		 center: latlong,
		 zoom: 8,
		 mapTypeId: google.maps.MapTypeId.ROADMAP
		}
		var map = new google.maps.Map(mapCanvas, mapOptions)
		var marker = new google.maps.Marker ({
	     position: latlong,
	     map: map,
	     title: 'country name'
		 });
	}
	google.maps.event.addDomListener(window, 'load', initialize);
	var marker_dynamic = new google.maps.LatLng(21.0000, 78.0000)

	     // $('body').on('click',function(){
	     // 		var marker = new google.maps.Marker({
	     // 		      position: marker_dynamic,
	     // 		      map: map,
	     // 		      title: 'country name'
	     // 		  });
	     // })

})