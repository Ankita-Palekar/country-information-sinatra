class Country
	#needs to fetch all countries related 
	attr_accessor :all_countries, :calling_code, :currency, :region, :sub_region, :country_name, :alpha	
	def initialize
		@base_uri = "https://restcountries.eu/rest/v1"
		@all_countries = "/all"
		@calling_code = "/callingcode"
		@currency = "/currency"
		@region = "/region"
		@sub_region = "/subregion"
		@country_name = "/name"
		@alpha = "/alpha"
	end

	def get_all_countries
		request_uri = @base_uri.concat(@all_countries).strip
		country_list = JSON.parse(open(request_uri).read)
		return country_list
	end
end