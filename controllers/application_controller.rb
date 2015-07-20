class ApplicationController < Sinatra::Base
	
	enable :static
	enable :sessions, :method_override
	set	:views, Proc.new	{File.join(root, "../views/")}
	set :public_folder , Proc.new {File.join(root,"../public")}
	register Sinatra::Twitter::Bootstrap::Assets
 
	get '/' do 
		erb :index
	end

	get '/region/:region_name/countries' do
		@result_list = Interface.search_countries(params["region_name"])
		erb :category_panel do
			erb :country_list_block, :layout => false  
		end
	end

	get '/language/:language_code/countries' do
		@result_list = Interface.get_language_specific_countries(params["language_code"])
		erb :category_panel do
			erb :country_list_block, :layout => false  
		end
	end


	get '/currency/:currency_code/countries' do
		@result_list = Interface.get_currency_specific_countries(params["currency_code"])
		erb :category_panel do
			erb :country_list_block, :layout => false  
		end
	end


	get '/regions' do
		@category_name = "Regions"
		@set_region_link = Interface.provide_region_link
		@set_countries_link = Interface.provide_country_link
		@result_list = Interface.get_all_regions
		erb :category_panel do
			erb :region_block, :layout => false  
		end
	end

	post '/search' do 
		@result_list = Interface.search_countries(params["query"])
		content_type 'text/html'
		erb :country_list_block, :layout => false
	end
end