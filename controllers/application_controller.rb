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
	
	# call_all = Proc.new do |sub_request_call, param| 
	# 	@country_list = country.call_api(sub_request_call, params["calling_code"])
	# 	@alpha = country.country_code
	# 	erb :country_list
	# end

	get '/' do 
		erb :index
	end

	# get '/404' do 
	# 	erb :404
	# end
	get '/test' do
		country = Country.new
	  country.get_all_information
	end

	get '/all' do 
		countries = Country.new
		sub_request_call = countries.all_countries
		@country_list = countries.call_api(sub_request_call)
		@alpha = countries.country_code
		erb :country_list
	end


	get '/country/:country_code' do 
		country = Country.new
		sub_request_call = country.country_code
		@country_information = country.call_api(sub_request_call,params["country_code"])
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
		sub_request_call = country.region
		@country_list = country.call_api(sub_request_call, params["region"])
		@alpha = country.country_code
		erb :country_list
	end

	get '/subregion/:sub_region' do
		country = Country.new
		puts params["sub_region"]
		sub_request_call = country.sub_region
		@country_list = country.call_api(sub_request_call, params["sub_region"])
		puts @country_list.inspect
		@alpha = country.country_code
		erb :country_list
	end

	get '/callingcode/:calling_code' do
		country = Country.new
		sub_request_call = country.calling_code
		@country_list = country.call_api(sub_request_call, params["calling_code"])
		@alpha = country.country_code
		erb :country_list
	end

	get '/currency/:currency' do
		country = Country.new
		sub_request_call = country.currency
		@country_list = country.call_api(sub_request_call, params["currency"])
		@alpha = country.country_code
		erb :country_list
	end

	get '/lang/:language_code' do
		country = Country.new
		sub_request_call = country.lang
		@country_list = country.call_api(sub_request_call,params["language_code"])
		@alpha = country.country_code
		erb :country_list
	end

	post '/search' do 
		country = Country.new
		sub_request_call = country.country_name
		@search_list = country.call_api(sub_request_call, params["query"])
		@search_list
		content_type 'text/html'
		erb :search, :layout => false
	end

end