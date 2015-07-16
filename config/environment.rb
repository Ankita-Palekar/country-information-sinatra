# require 'bundler/setup'

# def require_directory(path)
# 	# require all *.rb files inside path
# end

require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/base'
require 'sinatra/twitter-bootstrap'
require 'json'
require 'mustache/sinatra'
require './controllers/application_controller.rb'
require 'open-uri'
require './models/country.rb'