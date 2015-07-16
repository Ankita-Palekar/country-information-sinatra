class Country
	#needs to fetch all countries related 
	attr_accessor :all_countries, :calling_code, :currency, :region, :sub_region, :country_name, :country_code, :lang, :subregion, :substring
	
	def initialize
		@base_uri = "https://restcountries.eu/rest/v1"
		@all_countries = "/all"
		@calling_code = "/callingcode/"
		@currency = "/currency/"
		@region = "/region/"
		@sub_region = "/subregion/"
		@country_name = "/name/"
		@country_code = "/alpha/"
		@lang = "/lang/"
		@substring = "/name/"
	end

	def json_parse(request_uri)
		request_uri = URI.encode(request_uri)
		result = JSON.parse(open(request_uri).read)
		result
	end

	def make_request_uri(*uri)
		return_uri = ""
		uri.each do |url|
			return_uri += url
		end
		return_uri
	end



	def get_search_result(query)
		request_uri = (@base_uri + @substring + query).strip
		search_list = JSON.parse(open(request_uri).read)
		search_list
	end

	def get_all_countries
		request_uri = (@base_uri + @all_countries).strip
		country_list = JSON.parse(open(request_uri).read)
		country_list
	end

	def get_region_countries(region)
		request_uri = (@base_uri + @region + region).strip
		country_list = JSON.parse(open(request_uri).read)
		country_list
	end

	def get_sub_region_countries(sub_region)
		
		request_uri = (@base_uri + @sub_region + sub_region).strip
		request_uri = URI.encode(request_uri) 
		puts request_uri.inspect
		country_list = JSON.parse(open(request_uri).read)
		country_list
	end

	def get_country_on_calling_code(calling_code)
		request_uri = (@base_uri + @calling_code + calling_code).strip
		country_information = JSON.parse(open(request_uri).read)
		country_information
	end

	def get_same_currency_countries(currency_code)
		request_uri = (@base_uri + @currency + currency_code).strip
		country_list = JSON.parse(open(request_uri).read)
		country_list
	end

	def get_same_language_countries(language_code)
		request_uri = (@base_uri + @lang + language_code).strip
		country_list = JSON.parse(open(request_uri).read)
		country_list
	end

	def get_country_information(code)
		request_uri = (@base_uri + @country_code + code).strip
		country_information = JSON.parse(open(request_uri).read)
		country_information
	end

end