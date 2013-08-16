require 'spec_helper'

describe "Articles" do
  describe "GET /articles" do
    let(:store){ FactoryGirl.create(:store) }
    it "should return a 200 status code" do
      get store_articles_path(store)
      response.status.should be(200)
    end
  end
end
