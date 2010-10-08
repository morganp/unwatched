

require 'rubygems'
require 'active_support'
require 'sinatra'
require 'spec'
require 'rack/test'
require 'spec/autorun'
require 'spec/interop/test'

Spec::Runner.configure do |conf|
  conf.include Rack::Test::Methods
end


# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

#Put Sinatra into Test Mode
Sinatra::Base.set :environment, :test
require File.join(File.dirname(__FILE__), '..', 'app.rb')


n_path = File.expand_path( '../' )
Dir.chdir(n_path) 


#Unwatched.run!
