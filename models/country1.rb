class Country
	#needs to fetch all countries related 
	
	
	attr_accessor :all_countries, :calling_code, :currency, :region, :sub_region, :country_name, :country_code, :lang, :subregion, :substring, :data_initialisation, :calling_codes_set,  :region_names_set, :sub_region_names_set, :language_codes_set, :cuurencies_set, :country_code_set
		
		
	def initialize
		@base_uri = "https://restcountries.eu/rest/v1"
		@base_uri_images = "https://api.gettyimages.com:443/v3/search/images?"
		@end_point = "artists="
		@api_key = "nwkxwgjamhuacvrb5e6hx7ej"
		@all_countries = "/all"
		@calling_code = "/callingcode/"
		@currency = "/currency/"
		@region = "/region/"
		@sub_region = "/subregion/"
		@country_name = "/name/"
		@country_code = "/alpha/"
		@lang = "/lang/"
		# @@data_initialisation = 0
		# @@region_names_set = Set.new
		# @@country_code_set = Set.new
		# @@sub_region_names_set = Set.new
		# @@calling_codes_set = Set.new
		@language_codes_set = Set.new
		# @@cuurencies_set = Set.new
		
		# REVIEW -- At the time when the app is started, make the API call to
		# fetch ALL the country data. From that data exract out the unique region,
		# subregion, currency, etc. list programmatically.
		 
 	end

 

	def get_country_images(country_name)
		request_uri = @base_uri_images + @end_point + country_name
		request_uri = URI.encode(request_uri)
		result = JSON.parse(open(request_uri, "api-key" => @api_key).read)
		result
	end

	def call_api(action, request_code = "")
		request_uri = (@base_uri + action +  request_code).strip
		request_uri = URI.encode(request_uri)
		puts "================="
		puts request_uri.inspect
		result = JSON.parse(open(request_uri).read)
		result
	end

	
 	def get_all_information
 		all_data =  call_api(@all_countries)
 		all_data.each do |country|
 			@region_names_set.add country["region"] 
 			@sub_region_names_set.add country["subregion"]
 			country["callingCodes"].each {|code| @calling_codes_set.add code}
 			country["currencies"].each {|cur| @cuurencies_set.add cur}
 			country["languages"].each {|lang| @language_codes_set.add lang}
 			@country_code_set.add country["alpha2Code"]   
 			@country_code_set.add country["alpha3Code"]   
 		end
 		@data_initialisation = 1	
		# puts @region_names_set.inspect
		# puts "==============="
		# puts @sub_region_names_set.inspect
		# puts "==============="
		# puts @calling_codes_set.inspect
		# puts "==============="
		# puts @cuurencies_set.inspect
		# puts "==============="
		# puts @language_codes_set.inspect
		# puts "==============="
		# puts @country_code_set.inspect

 	end
end