require "rails_helper"

RSpec.describe StoryContentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/story_contents").to route_to("story_contents#index")
    end


    it "routes to #show" do
      expect(:get => "/story_contents/1").to route_to("story_contents#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/story_contents").to route_to("story_contents#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/story_contents/1").to route_to("story_contents#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/story_contents/1").to route_to("story_contents#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/story_contents/1").to route_to("story_contents#destroy", :id => "1")
    end

  end
end
