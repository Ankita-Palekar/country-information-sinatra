$(document).ready(function(){
	function process_ajax(request_uri, data){
		console.log(request_uri)
		if (typeof(data)==='undefined') data = "";
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
		codeAddress($(this).val())
		$('.spinner').show()
		$('.country-display-list').hide()
		query_string = $(this).val()
		$.ajax({
				url : "/search",
				method : "POST",
				data : {query : query_string},
				dataType : "html"
			})
		.done(function(data, textstatus, jqXHR) {	 
			if (jqXHR.status == 200) {
				$('.spinner').hide()
				$('.country-display-list').show()
				$("#country-display-list").html(data)
			};
		 })
		.fail(function(data, textstatus, jqXHR) {
	 		console.log("code failed")
		})
	})

	$('#search-countries').keydown(function(e){
		if (e.keyCode == 13) {
		 	$(this).trigger('form_submit_on_enter')
		 	return false
		 } 
	})

	function make_strings (action, array_items) {
		var item_string = ""
		$.each(array_items,function(index,value){
		 	item_string += '<a class="country-specific-info" href="/'+action+'/' + value + '/countries">' + value + '</a>'
		})
		return item_string
	}

	//for search result
 	$('#country-display-list').on('click','ul.country-list>li',function(){
		var country_name = $(this).data('name')
		// var currencies_string, languages_string = ""
		// var currencies = $(this).data('currencies')
		// currencies_string = make_strings('currency',currencies)
		// var languages = $(this).data('languages')
		// languages_string = make_strings('language',languages)
		$('#modal-country-name').html(country_name)
		// $('#country-capital').html($(this).data('capital'))
		 region = $(this).data('region')
		 region = region.replace('/','-')
		  console.log(region)
		$('#country-region').html('<a href="/region/'+region+'/countries">'+$(this).data('region')+'</a>')
		// $('#country-sub-region').html($(this).data('sub-region'))
		$('#country-population').html($(this).data('population'))
		// $('#country-calling-codes').html($(this).data('calling-codes'))
		// $('#country-top-level-domain').html($(this).data('top-level-domain'))
		$('#country-codes').html($(this).data('country-code'))
		// $('#country-currencies').html(currencies_string)
		// $('#country-languages').html(languages_string)
		// $('#country-native-name').html($(this).data('native-name'))
		
		codeAddress(country_name)
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
	  geocoder = new google.maps.Geocoder();
	  var latlng = new google.maps.LatLng(21.0000, 78.0000);
	  var mapOptions = {
	    zoom: 5,
	    center: latlng
	  }
	  map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
	}

	function codeAddress(address) {
    geocoder.geocode( { 'address': address}, function(results, status) {
      if (status == google.maps.GeocoderStatus.OK) {
        map.setCenter(results[0].geometry.location);
        var marker = new google.maps.Marker({
          map: map,
          position: results[0].geometry.location
        });
      } else {
      	alert("Geocode was not successful for the following reason: " + status);
      }
    });
	}
	
	google.maps.event.addDomListener(window, 'load', initialize);	

})