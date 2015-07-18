class Region
	attr_accessor :name, :country_list
	def initialize(name)
		@name = name
		@country_list = Interface::set_region_specific_countries(name)
	end
end