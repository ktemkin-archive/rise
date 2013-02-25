#!/usr/bin/env ruby

#Ensure this app is run using our bundled envrionment.
require 'bundler/setup'

require 'compass'
require 'sinatra'
require 'barista'
require 'json'
require 'rise'

require_relative 'helpers'

#
# Main web application for rISE.
#
class RiseApp < Sinatra::Base

  #Allow adept helpers to be used directly.
  helpers Rise::Helpers::General
  helpers Rise::Helpers::AdeptDevices
  helpers Rise::Helpers::Navbar
  helpers Rise::Helpers::ISEHelpers

  #Allow coffeescripts to be included directly.
  register Barista::Integration::Sinatra

  #TODO: Disable Barista auto-compile on production?
  configure do
    Barista.verbose = false
  end

  get '/' do
    redirect '/project'
  end

  get '/project' do
    haml :project
  end

  get "/look_inside" do
    haml :look_inside 
  end

  get '/ajax/status' do
    JSON::generate({ connected_board: connected_adept_board }) 
  end

  get '/css/rise.css' do
    scss :'stylesheets/rise'
  end

  #
  # Returns true if the bitfile specified in the Path post-parameter exists.
  #
  post '/backend/validate_bitfile' do
    #Return true IFF the given file exits.
    JSON::generate({ valid: File::exists?(params[:path]) })
  end

  #
  # Programs the FPGA using the bitfile at the specified path.
  #
  post '/backend/program' do
   
    #If we've been passed an invalid file, return an error.
    unless File::exists?(params[:path])
      Response::failure("<b>The bitfile specified doesn't seem to exist.</b><br>Ensure you've generated project files, and try again.")
    end

    #Otherwise, use it to program the FPGA.
    Rise::Device::program(params[:path])

  end

  #If this file was executed directly, start the server.
  run! if app_file == $0

end


