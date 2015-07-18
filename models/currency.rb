class Currency
	attr_accessor :name, :country_list

	def initialize(currency)
		@currency = currency
		@country_list = Interface::set_currency_specific_countries(currency)
	end
end