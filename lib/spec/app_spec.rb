require File.dirname(__FILE__) + '/spec_helper'

describe "App" do
   include Rack::Test::Methods

   def app
      UnWatched::App
   end
    
   it "should respond to /" do
      get '/'
      last_response.should be_ok
      last_response.headers["Content-Type"].should == "text/html"
   end

   it "should respond to /pref" do
      get '/pref'
      last_response.should be_ok
      last_response.headers["Content-Type"].should == "text/html"
   end

   it "should respond to post /pref" do
      post '/pref'
      last_response.should be_ok
      last_response.headers["Content-Type"].should == "text/html"
   end
end

