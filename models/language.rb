class Language

	attr_accessor :name, :country_list

	def initialize(language)
		@language = language
		@country_list = Interface::set_language_specific_countries(language)
	end
end