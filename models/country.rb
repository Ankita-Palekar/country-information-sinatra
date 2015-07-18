class Country 
  @@provide_link = '/countries/'
  
  attr_accessor :name, :capital, :altSpellings, :relevance, :population, :latlng, :demonym, :area, :gini, :timezones, :borders, :nativeName, :callingCodes, :topLevelDomain, :alpha2Code, :alpha3Code, :currencies, :languages
 

  def initialize
  
  end

  def update_attributes(hash)
    hash.keys.each do |key|
      m = "#{key}="
      # REVIEW -- read Ruby style guide. You do not need to put spaces after
      # functional call braces.
      self.new.send(m, hash[key]) if self.new.respond_to?(m)
    end
  end
 
 

  def get_information(action: , action_code: "")
    result_list = call_api(action, action_code)
    # update_attributes(result_list.first)
    result_list 
  end
end