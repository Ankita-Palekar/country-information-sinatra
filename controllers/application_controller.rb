class ApplicationController < Sinatra::Base
	set	:views, Proc.new	{File.join(root, "../views/")}
	set :public_folder , Proc.new {File.join(root,"../public")}
	enable :static
	register Sinatra::Twitter::Bootstrap::Assets
	not_found{redirect "/404"}
	
	get '/' do
		country = Country.new
		country.get_all_countries
		erb :index
	end



end