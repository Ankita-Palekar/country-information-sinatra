class Interface

	# "/searchJSON?q=goa&maxRows=10&username=AnkitaPalekar&style=full"

	@@base_uri = "http://api.geonames.org/"
	@@search = "/searchJSON"
	@@max_rows = "&maxRows="
	@@username = "&username=AnkitaPalekar"
	@@style = "&style=full"
	@@query = "&q="
	@@countryInfo = "/countryInfoJSON"
	@@question_mark = "?"

	# @@all_countries = "/all"
	# @@calling_code = "/callingcode/"
	# @@currency = "/currency/"
	# @@region = "/region/"
	# @@sub_region = "/subregion/"
	# @@country_name = "/name/"
	# @@country_code = "/alpha/"
	# @@lang = "/lang/"


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

		request_uri = (@@base_uri + action +  @@style + @@username  + request_code).strip
		request_uri = URI.encode(request_uri)
		result = []
 		begin	
			result = JSON.parse(open(request_uri).read)
			result
 		rescue Exception => e
 			result
 		end
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
		# --@TODO use map and reduce after swaping
		country_list.each do |country_item|
			country_hash = {}
			country = Country.new(country_item)
			country_object_array.push country
		end
		country_object_array
	end

	def self.search_countries(query_substring)
		query_substring = @@query + query_substring
		country_list = self.call_api(@@search+@@question_mark, query_substring)
		country_list = country_list["geonames"]
		country_object_list = make_country_objects_array(country_list)
		puts country_object_list.inspect
		country_object_list
	end

	def self.get_region_specific_countries(region)
		country_list = call_api(@@region, region)
		country_object_array = self.make_country_objects_array(country_list)
		country_object_array
	end

	def self.get_language_specific_countries(language)
		country_list = call_api(@@lang, language)
		country_object_array = self.make_country_objects_array(country_list)
		country_object_array
	end

	def self.get_currency_specific_countries(currency)
		country_list = call_api(@@currency, currency)
		country_object_array = self.make_country_objects_array(country_list)
		country_object_array
	end
 
end