require 'rails_helper'

RSpec.describe "StoryContents", type: :request do
  describe "GET /story_contents" do
    it "works! (now write some real specs)" do
      get story_contents_path
      expect(response).to have_http_status(200)
    end
  end
end
