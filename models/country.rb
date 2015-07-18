class Country 
  @@provide_link = '/countries/'
  
  attr_accessor :countryName, :population, :lat, :lng, :area, :timezone, :countryCode

  def initialize(country_hash={})
    update_attributes(country_hash)
  end
  
  def update_attributes(hash)
    hash.keys.each do |key|
      m = "#{key}="
      self.send(m, hash[key]) if self.respond_to?(m)
    end
  end
end