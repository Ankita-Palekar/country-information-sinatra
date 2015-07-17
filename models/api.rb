class Api
	attr_accessor :calling_code, :all_countries, :currency, :region, :sub_region, :country_name, :country_code, :lang, :data_initialisation ,:region_names_set

	@@base_uri = "https://restcountries.eu/rest/v1"
	@@all_countries = "/all"
	@@calling_code = "/callingcode/"
	@@currency = "/currency/"
	@@region = "/region/"
	@@sub_region = "/subregion/"
	@@country_name = "/name/"
	@@country_code = "/alpha/"
	@@lang = "/lang/"
	@@region_names_set = Set.new

 	def call_api(action, request_code = "")
		request_uri = (@@base_uri + action + request_code).strip
		request_uri = URI.encode(request_uri)
		result = JSON.parse(open(request_uri).read)
		result
	end

 	def self.get_all_information 
 		all_data =  self.new.call_api(@@all_countries)
 		all_data.each do |country|
 			@@region_names_set.add country["region"] 
 		end
 	end

end