class Interface

	@@base_uri = "https://restcountries.eu/rest/v1"
	@@all_countries = "/all"
	@@calling_code = "/callingcode/"
	@@currency = "/currency/"
	@@region = "/region/"
	@@sub_region = "/subregion/"
	@@country_name = "/name/"
	@@country_code = "/alpha/"
	@@lang = "/lang/"
	
	def initialize
		
	end

	def self.provide_region_link
		@@region
	end

 	def self.call_api(action, request_code = "")
		request_uri = (@@base_uri + action + request_code).strip
		request_uri = URI.encode(request_uri)
		result = JSON.parse(open(request_uri).read)
		result
	end

	def self.get_all_regions
		region_names_set = Set.new
		all_data = self.call_api(@@all_countries)
		puts all_data.first.inspect
		all_data.each do |country|
			region_names_set.add  country['region'] if country['region'].length!=0
		end
		region_names_set
	end

end