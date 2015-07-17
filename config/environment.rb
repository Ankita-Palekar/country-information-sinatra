# require 'bundler/setup'

# def require_directory(path)
# 	# require all *.rb files inside path
# end

require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'
require 'sinatra/twitter-bootstrap'
require 'json'
# require 'mustache/sinatra'
require './controllers/application_controller.rb'
require 'open-uri'
require 'set'
require './models/country.rb'

# REVIEW -- figure out how to run code ONCE, when a Sinatra app starts up.
# Call a static method in your domain class to initialize all the data sets
# you require.
