class Country
	#needs to fetch all countries related 	
	def get_all_countries
		request_uri = "https://restcountries.eu/rest/v1/all"				
		result = JSON.parse(open(request_uri).read)
		puts result.inspect
	end
end