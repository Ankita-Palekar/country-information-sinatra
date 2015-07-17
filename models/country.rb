class Country < Api
  @@provide_link = '/countries/'
  @@region_link = '/region/'

  def self.provide_link
    @@provide_link
  end
  
  def get_region_specific_countries(region_code:)
    result_list = call_api(@@region_link, region_code)
    result_list
  end
end