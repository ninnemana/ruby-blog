require 'spec_helper'

describe "App Routes" do
  context "'/'" do
    it "should return 200 status" do
      #ignore all Mongoid transactions
      Band = double("Sinatra::Application::Band")
      fake_class = Class.new
      Band.stub(:new).and_return(fake_class)
      Band.stub(:all).and_return({})
      fake_class.stub(:save).and_return(true)
      get('/').status.should == 200
    end
  end

  context "Not Found" do
    it "should return a 404" do
      request = get('/fakeroute1')
      request.status.should == 404
      request.body.should == 'not found'
    end
  end
end