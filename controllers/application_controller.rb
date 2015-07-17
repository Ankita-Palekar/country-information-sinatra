class ApplicationController < Sinatra::Base
	
	enable :static
	enable :sessions, :method_override
	set	:views, Proc.new	{File.join(root, "../views/")}
	set :public_folder , Proc.new {File.join(root,"../public")}
	register Sinatra::Twitter::Bootstrap::Assets

	get '/' do 
		erb :index
	end


	# get '/404' do 
	# 	erb :404
	# end

	#to call regions accordian and all other information 

	get '/test'  do
		country = Country.new
		country.get_all_information
	end

	get '/regions' do
		country = Country.new
		# @country.get_all_information if  !@country.data_initialisation
		@category_name = "Regions"
		@result_list = country.region_names_set
		@set_pannel_name ="/regions/"
		erb :category_pannel
	end


	get '/subregions' do
		country = Country.new
		# @country.get_all_information if  !@country.data_initialisation
		@category_name = "Sub Regions"
		@set_pannel_name ="/subregions/"
		@result_list = country.sub_region_names_set
		erb :category_pannel
	end


	get '/currencies' do
		country = Country.new
		# @country.get_all_information if  !@country.data_initialisation
		@category_name = "Currencies"
		@set_pannel_name ="/currencies/"
		@result_list = country.cuurencies_set
		erb :category_pannel
	end

	get '/languages' do
		country = Country.new
		@category_name = "Languages"
		@set_pannel_name ="/languages/"
		@result_list = country.language_codes_set
		erb :category_pannel
	end


	get '/country_codes' do
		country = Country.new
		@category_name = "Country Codes"
		@set_pannel_name ="/country_codes/"
		@result_list = country.country_code_set
		erb :category_pannel
	end

	get '/calling_codes' do
		country = Country.new
		@category_name = "Calling Codes"
		@set_pannel_name ="/calling_codes/"
		@result_list = country.calling_codes_set
		erb :category_pannel
	end

	#to call onload page methods
	# get '/region' do 
	# 	countries = Country.new
	# 	sub_request_call = countries.all_countries
	# 	@country_list = countries.call_api(sub_request_call)
	# 	@alpha = countries.country_code
	# 	erb :country_list
	# end

	# get '/country/:country_code' do 
	# 	country = Country.new
	# 	sub_request_call = country.country_code
	# 	@country_information = country.call_api(sub_request_call,params["country_code"])
	# 	@calling_code = country.calling_code
	# 	@currency = country.currency
	# 	@region = country.region
	# 	@sub_region = country.sub_region
	# 	@country_name = country.country_name
	# 	@country_code = country.country_code	
	# 	@lang = country.lang
	# 	@image_list = country.get_country_images(@country_information["name"])
	# 	# puts @get_images.inspect
	# 	erb :country
	# end

	get '/regions/:region' do
		country = Country.new
		sub_request_call = country.region
		@result_list = country.call_api(sub_request_call, params["region"])
		@alpha = country.country_code
		content_type 'text/html'
		erb :result, :layout => false
	end

	get '/subregions/:sub_region' do
		country = Country.new
		sub_request_call = country.sub_region
		@result_list = country.call_api(sub_request_call, params["sub_region"])
	 
		content_type 'text/html'
		erb :result, :layout => false
	end


	get '/calling_codes/:calling_code' do
		country = Country.new
		sub_request_call = country.calling_code
		@result_list = country.call_api(sub_request_call, params["calling_code"])	 
		content_type 'text/html'
		erb :result, :layout => false
	end

	get '/country_codes/:country_code' do
		country = Country.new
		sub_request_call = country.country_code
		@result_list = country.call_api(sub_request_call, params["country_code"])	 
		content_type 'text/html'
		erb :result, :layout => false
	end

	get '/currencies/:currency' do
		country = Country.new
		sub_request_call = country.currency
		@result_list = country.call_api(sub_request_call, params["currency"]) 
		content_type 'text/html'
		erb :result, :layout => false
	end

	get '/languages/:language_code' do
		country = Country.new
		sub_request_call = country.lang
		@result_list = country.call_api(sub_request_call,params["language_code"])
		content_type 'text/html'
		erb :result, :layout => false
	end

	post '/search' do 
		country = Country.new
		sub_request_call = country.country_name
		@result_list = country.call_api(sub_request_call, params["query"])
		@result_list
		content_type 'text/html'
		erb :result, :layout => false
	end




end