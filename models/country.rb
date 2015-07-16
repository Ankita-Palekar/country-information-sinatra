class Country
	#needs to fetch all countries related 
	attr_accessor :all_countries, :calling_code, :currency, :region, :sub_region, :country_name, :country_code, :lang, :subregion, :substring
	
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
		result = JSON.parse(open(request_uri).read)
		result
	end
end