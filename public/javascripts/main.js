$(document).ready(function(){
	$('#search-countries').bind('form_submit_on_enter',function() {
			console.log($(this).val)
			query_string = $(this).val()

			$.ajax({
					url : "/search",
					method : "POST",
					data : {query : query_string},
					dataType : "html"
				})
			 .done(function(data, textstatus, jqXHR) {
					console.log(data)
					if (jqXHR.status==200) {
						$(".search-result-container").html(data)
					};
			  })
			 .fail(function(data, textstatus, jqXHR) {
		 		  console.log("go have some walk")
		 		  // console.log(data)
		 		 	// console.log(textstatus)
		 		  // console.log(jqXHR)
			  })
	})

	$('#search-countries').keydown(function(e){
		if (e.keyCode == 13) {
		 	$(this).trigger('form_submit_on_enter')
		 	return false
		 } 
	})
})