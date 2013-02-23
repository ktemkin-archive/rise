#!/usr/bin/env ruby

#Ensure this app is run using our bundled envrionment.
require 'bundler/setup'

require 'compass'
require 'sinatra'
require 'barista'
require 'json'

require_relative 'helpers/adept'

#
# Main web application for rISE.
#
class RiseApp < Sinatra::Base

  #Allow adept helpers to be used directly.
  helpers Rise::Helpers::AdeptDevices

  #Allow coffeescripts to be included directly.
  register Barista::Integration::Sinatra

  get '/' do
    redirect '/project'
  end

  get '/project' do
    haml :project
  end

  get '/ajax/status' do
    JSON::generate({ connected_board: connected_adept_board }) 
  end

  get '/css/rise.css' do
    scss :'stylesheets/rise'
  end


  #If this file was executed directly, start the server.
  run! if app_file == $0

end


