class Country < Api
  @@provide_link = '/countries/'
  @@region_link = '/region/'
  @@hash = {:name1 => "", :capital => "", :altSpellings => "", :relevance => "", :region => "", :subregion => "", :translations => "", :population => "", :latlng => "", :demonym => "", :area => "", :gini => "", :timezones => "", :borders => "", :nativeName => "", :callingCodes => "", :topLevelDomain => "", :alpha2Code => "", :alpha3Code => "", :currencies => "", :languages => ""}


  def self.provide_link
    @@provide_link
  end

  
  # --@TODO below functions can be merged find a way

 
  def get_region_specific_countries(region_code:)
    result_list = call_api(@@region_link, region_code)
    result_list
  end

  def get_country_search_result(query:)
  	result_list = call_api(@@country_name, query)
  	result_list
  end
end