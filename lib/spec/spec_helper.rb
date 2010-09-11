require File.join(File.dirname(__FILE__), '..', 'app.rb')

require 'rubygems'
require 'active_support'
require 'sinatra'
require 'spec'
require 'rack/test'
require 'spec/autorun'
require 'spec/interop/test'

#Spec::Runner.configure do |conf|
#  conf.include Rack::Test::Methods
#end

ENV['RACK_ENV'] = 'test'

Spec::Runner.configure do |conf|
  conf.include Rack::Test::Methods
end


# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

n_path = File.expand_path( '../' )
Dir.chdir(n_path) 


#Unwatched.run!
