class Country 
  @@provide_link = '/countries/'
  
  attr_accessor :name, :capital, :altSpellings, :relevance, :population, :latlng, :demonym, :area, :gini, :timezones, :borders, :nativeName, :callingCodes, :topLevelDomain, :alpha2Code, :alpha3Code, :currencies, :languages, :region, :subregion

  def initialize(country_hash={})
    @name = ""
    @capital = ""
    @altSpellings = ""
    @relevance = ""
    @population = ""
    @latlng = ""
    @demonym = ""
    @area = ""
    @gini = ""
    @timezones = ""
    @borders = ""
    @nativeName = ""
    @callingCodes = ""
    @topLevelDomain = ""
    @alpha2Code = ""
    @alpha3Code = ""
    @currencies = ""
    @languages = ""
    @region = ""
    @subregion = ""
    update_attributes(country_hash)
  end
  
  def update_attributes(hash)
    hash.keys.each do |key|
      m = "#{key}="
      self.send(m, hash[key]) if self.respond_to?(m)
    end
  end
end