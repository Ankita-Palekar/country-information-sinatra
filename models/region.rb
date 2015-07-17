class Region < Api
	@@provide_link = "/countries"
	def initialize
		Api::get_all_information	
	end

	def self.provide_link
		@@provide_link
	end

	def get_all_regions
		@@region_names_set
	end
end