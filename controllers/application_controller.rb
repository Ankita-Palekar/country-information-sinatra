class ApplicationController < Sinatra::Base
	
	enable :static
	enable :sessions, :method_override
	set	:views, Proc.new	{File.join(root, "../views/")}
	set :public_folder , Proc.new {File.join(root,"../public")}
	register Sinatra::Twitter::Bootstrap::Assets
 
	get '/' do 
		erb :index
	end

	# get '/test'  do
	# 	region = Region.new
	# 	regions = region.get_all_regions()
	# 	puts regions.inspect
	# end

	get '/countries' do
		puts params.inspect
		country = Country.new
		
		@result_list = country.get_information(:action => Country.provide_region_link, :action_code => params["region_code"]) if params.has_key?("region_code") 
		
		@result_list = country.get_information(:action => Country.provide_currency_link, :action_code => params["currency"]) if params.has_key?("currency") 
		
		@result_list = country.get_information(:action => Country.provide_language_link, :action_code => params["language"]) if params.has_key?("language") 
		
		@specific_result = "region specific result"
		erb :category_pannel do
			erb :country_list_block, :layout => false  
		end
	end

	get '/regions' do
		region = Region.new
		@category_name = "Regions"
		@result_list = region.get_all_regions
		@set_pannel_name = Region.provide_link
		erb :category_pannel do
			erb :region_block, :layout => false  
		end
	end

	post '/search' do 
		country = Country.new
		@result_list = country.get_information(:action => Country.provide_search_link, :action_code => params["query"])
		@result_list
		content_type 'text/html'
		erb :country_list_block, :layout => false
	end
end