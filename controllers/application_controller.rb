class ApplicationController < Sinatra::Base
	set	:views, Proc.new	{File.join(root, "../views/")}
	set :public_folder , Proc.new {File.join(root,"../public")}
	enable :static
	register Sinatra::Twitter::Bootstrap::Assets
	not_found{redirect "/404"}
	
	get '/' do 
		countries = Country.new
		@all_countries = countries.get_all_countries
		@alpha = countries.alpha
		erb :index
	end

	get '/all' do 
		countries = Country.new
		@all_countries = countries.get_all_countries
		@alpha = countries.alpha
		erb :country_list
	end

	get '/country/:country_code' do 
		countries = Country.new
		erb :country
	end



end