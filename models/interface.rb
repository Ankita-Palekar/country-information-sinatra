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


	#non api related link  made for the view purpose /
	#eg /region/Asia/countries
	@@countries_link = '/countries'
	
	def initialize
		
	end

	def self.provide_region_link
		@@region
	end

	def self.provide_country_link
		@@countries_link
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
		all_data.each do |country|
			region_names_set.add  country['region'] if country['region'].length!=0
		end
		region_names_set
	end


	def self.make_country_objects_array(country_list)
		country_object_array = []
		country_list.each do |country_item|
			country_hash = {}
			country = Country.new(country_item)
			country.instance_variables.each {|var| country_hash[var.to_s.delete("@")] = country.instance_variable_get(var) }
			country_object_array.push country_hash
		end
		country_object_array
	end

	def self.search_countries(query_substring)
		country_list = self.call_api(@@country_name, query_substring)
		country_object_list = make_country_objects_array(country_list)
		country_object_list
	end

	#All country setter methods 

	def self.set_region_specific_countries(region)
		country_list = call_api(@@region, region)
		country_object_array = self.make_country_objects_array(country_list)
		country_object_array
	end

	def self.set_language_specific_countries(language)
		country_list = call_api(@@lang, language)
		country_object_array = self.make_country_objects_array(country_list)
		country_object_array
	end

	def self.set_currency_specific_countries(currency)
		country_list = call_api(@@currency, currency)
		country_object_array = self.make_country_objects_array(country_list)
		country_object_array
	end


end