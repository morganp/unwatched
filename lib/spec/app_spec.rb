require File.dirname(__FILE__) + '/spec_helper'

describe "App" do
   include Rack::Test::Methods

   def app
      UnWatched::App
   end
    
   it "should respond to /" do
      get '/'
      last_response.should be_ok
      #last_response.body.should == "blah blah blah"
      last_response.headers["Content-Type"].should == "text/html"
   end

   it "should respond to /pref" do
      get '/pref'
      last_response.should be_ok
      #last_response.body.should == "blah blah blah"
      last_response.headers["Content-Type"].should == "text/html"
   end

   it "should respond to post /pref" do
      post '/pref'
      #puts last_response.methods.sort
      #puts last_response.body
      last_response.should be_ok
      last_response.headers["Content-Type"].should == "text/html"
      #assert last_response.body.include?('Simon')
      
   end
end

