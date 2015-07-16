class ApplicationController < Sinatra::Base
	
	enable :static
	enable :sessions, :method_override
	set	:views, Proc.new	{File.join(root, "../views/")}
	set :public_folder , Proc.new {File.join(root,"../public")}
	register Sinatra::Twitter::Bootstrap::Assets
	# register Mustache::Sinatra
	
	# set :mustache, {
	# 	:templates	=>	"../mustache-template",
	# 	:views	=>	"../mustache-view"
	# }

	# not_found{redirect "/404"}
	
	get '/' do 
		erb :index
	end

	# get '/404' do 
	# 	erb :404
	# end

	get '/all' do 
		countries = Country.new
		@country_list = countries.get_all_countries
		@alpha = countries.country_code
		erb :country_list
	end


	get '/country/:country_code' do 
		country = Country.new
		@country_information = country.get_country_information(params["country_code"])
		@calling_code = country.calling_code
		@currency = country.currency
		@region = country.region
		@sub_region = country.sub_region
		@country_name = country.country_name
		@country_code = country.country_code	
		@lang = country.lang

		@image_list = country.get_country_images(@country_information["name"])
		# puts @get_images.inspect

		erb :country
	end

	get '/region/:region' do
		country = Country.new
		@country_list = country.get_region_countries(params["region"])
		@alpha = country.country_code
		erb :country_list
	end

	get '/subregion/:sub_region' do
		country = Country.new
		@country_list = country.get_sub_region_countries(params["sub_region"])
		@alpha = country.country_code
		erb :country_list
	end

	get '/callingcode/:calling_code' do
		country = Country.new
		@country_list = country.get_country_on_calling_code(params["calling_code"])
		@alpha = country.country_code
		erb :country_list
	end

	get '/currency/:currency' do
		country = Country.new
		@country_list= country.get_same_currency_countries(params["currency"])
		@alpha = country.country_code
		erb :country_list
	end

	get '/lang/:language_code' do
		country = Country.new
		@country_list = country.get_same_language_countries(params["language_code"])
		@alpha = country.country_code
		erb :country_list
	end

	post '/search' do
		country = Country.new
		@search_list = country.get_search_result(params["query"])
		@search_list
		content_type 'text/html'
		erb :search, :layout => false
	end

end