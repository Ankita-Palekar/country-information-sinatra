$(document).ready(function(){
	$('#search-countries').bind('form_submit_on_enter',function() {
			$('.spinner').show()
			$('#search-result').hide()
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
						$('.spinner').hide()
						$("#search-result").html(data)
						$("#search-result").show()
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

// for google map
	// var map = new google.maps.Map();
 // 	function initialize() {
 // 	   var mapCanvas = document.getElementById('map-canvas');
 // 	   var mapOptions = {
 // 	     center: new google.maps.LatLng(44.5403, -78.5463),
 // 	     zoom: 8,
 // 	     mapTypeId: google.maps.MapTypeId.ROADMAP
 // 	   }
 // 	   var map = new google.maps.Map(mapCanvas, mapOptions);
 // 	 }

 // 	google.maps.event.addDomListener(window, 'load', initialize);

	// var substringMatcher = function(strs) {
	//   return function findMatches(q, cb) {
	//     var matches, substringRegex;
	 
	//     // an array that will be populated with substring matches
	//     matches = [];
	 
	//     // regex used to determine if a string contains the substring `q`
	//     substrRegex = new RegExp(q, 'i');
	 
	//     // iterate through the pool of strings and for any string that
	//     // contains the substring `q`, add it to the `matches` array
	//     $.each(strs, function(i, str) {
	//       if (substrRegex.test(str)) {
	//         matches.push(str);
	//       }
	//     });
	 
	//     cb(matches);
	//   };
	// };
	 
	// var states = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
	//   'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii',
	//   'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana',
	//   'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota',
	//   'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
	//   'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota',
	//   'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island',
	//   'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont',
	//   'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'
	// ];
	 
	// $('#search-countries.typeahead').typeahead({
	//   hint: true,
	//   highlight: true,
	//   minLength: 1
	// },
	// {
	//   name: 'states',
	//   source: substringMatcher(states)
	// });	


})