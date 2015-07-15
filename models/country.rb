class Country
	#needs to fetch all countries related 
	attr_accessor :all_countries, :calling_code, :currency, :region, :sub_region, :country_name, :country_code	
	
	def initialize
		@base_uri = "https://restcountries.eu/rest/v1"
		@all_countries = "/all"
		@calling_code = "/callingcode"
		@currency = "/currency"
		@region = "/region"
		@sub_region = "/subregion"
		@country_name = "/name"
		@country_code = "/alpha/"
	end

	def get_all_countries
		request_uri = (@base_uri + @all_countries).strip
		country_list = JSON.parse(open(request_uri).read)
		return country_list
	end

	def get_country_information(code)
		request_uri = (@base_uri + @country_code + code.to_s).strip
		country_information = JSON.parse(open(request_uri).read)
		return country_information
	end

end