class Country < Api
  @@provide_link = '/countries/'
  
  attr_accessor :name, :capital, :altSpellings, :relevance, :population, :latlng, :demonym, :area, :gini, :timezones, :borders, :nativeName, :callingCodes, :topLevelDomain, :alpha2Code, :alpha3Code, :currencies, :languages

  def initialize
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
  end

  def update_attributes(hash)
    hash.keys.each do |key|
      m = "#{key}="
      self.new.send( m, hash[key] ) if self.new.respond_to?( m )
    end
  end

  def self.provide_link
    @@provide_link
  end

  def self.provide_region_link
    @@region
  end

  def self.provide_search_link
    @@country_name
  end

  def self.provide_currency_link
    @@currency
  end

  def self.provide_language_link
    @@lang
  end
  
  # def change_result_object_keys(result_list)
  #   hash_keys = @@hash.hash_keys
  #   result_list.each do |result|
  #     # puts result.inspect
  #     new_hash = Hash[result.each_with_index.map do |x,index|
  #       [hash_keys[index], result[index]]
  #     end]
  #     # new_hash = Hash[result.map{|k,v| [@@hash[k], v]}]
  #     puts new_hash.inspect
  #   end
  # end


  def get_information(action: , action_code: "")
    result_list = call_api(action, action_code)
    # update_attributes(result_list.first)
    result_list 
  end
end