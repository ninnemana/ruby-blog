########Dependency and Load Path Setup
require 'rubygems'
require 'bundler'
Bundler.require :default

########Mongoid Setup
Mongoid.load!("./db/mongoid.yml")
$mongo_loaded = true

########Load App Specific files
require File.dirname(__FILE__) + '/lib/google_oauth'
require File.dirname(__FILE__) + '/lib/utilities'
require File.dirname(__FILE__) + '/app'
load './routes/main.rb'
Dir["models/*.rb"].each {|file| load "./#{file}"}


########Add Debugger for Development
if ENV['RACK_ENV'] == 'development'
  require 'pry'
  require 'pry-nav'
end

########Start The App
run Blog::Application