require 'rubygems'
require 'bundler'

Bundler.require :default, :test

ENV['RACK_ENV'] = 'test'

require File.dirname(__FILE__)+'/../app'
require File.dirname(__FILE__)+'/../lib/google_oauth'
require File.dirname(__FILE__)+'/../collections/my_routes'

RSpec.configure do |config|
  include Rack::Test::Methods

  def app
    SinatraSkeleton::Application
  end
end