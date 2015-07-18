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
		region = Region.new(params["region_name"])
		@result_list = region.country_list
		erb :category_panel do
			erb :country_list_block, :layout => false  
		end
	end

	get '/language/:language_code/countries' do
		language = Language.new(params["language_code"])
		@result_list = language.country_list
		erb :category_panel do
			erb :country_list_block, :layout => false  
		end
	end


	get '/currency/:currency_code/countries' do
		currency = Currency.new(params["currency_code"])
		@result_list = currency.country_list
		erb :category_panel do
			erb :country_list_block, :layout => false  
		end
	end


	get '/regions' do
		@category_name = "Regions"
		@set_region_link = Interface.provide_region_link
		@set_countries_link = Interface.provide_country_link
		@result_list = Interface.get_all_regions
		puts @result_list.inspect
		erb :category_panel do
			erb :region_block, :layout => false  
		end
	end

	post '/search' do 
		@result_list = Interface.search_countries(params["query"])
		puts @result_list.inspect
		content_type 'text/html'
		erb :country_list_block, :layout => false
	end
end