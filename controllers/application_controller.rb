class ApplicationController < Sinatra::Base

	set	:views, Proc.new	{File.join(root, "../views/")}
	set :public_folder , Proc.new {File.join(root,"../public")}
	enable :static
	register Sinatra::Twitter::Bootstrap::Assets
	not_found{redirect "/404"}
	
	get '/' do
		'India is my country I love my country and I am proud of it'
	end

end