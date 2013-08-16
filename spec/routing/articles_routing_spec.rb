require "spec_helper"

describe ArticlesController do
  describe "routing" do

    it "routes to #index" do
      get("/stores/1/articles").should route_to(:controller => "articles", :action => "index", :store_id => '1')
    end

    it "routes to #new" do
      get("/stores/1/articles/new").should route_to(:controller => "articles", :action => "new", :store_id => '1')
    end

    it "routes to #show" do
      get("/stores/1/articles/1").should route_to(:controller => "articles", :action => "show", :store_id => '1', :id => '1')
    end

    it "routes to #edit" do
      get("/stores/1/articles/1/edit").should route_to(:controller => "articles", :action => "edit", :store_id => '1', :id => '1')
    end

    it "routes to #create" do
      post("/stores/1/articles").should route_to(:controller => "articles", :action => "create", :store_id => '1')
    end

    it "routes to #update" do
      put("/stores/1/articles/1").should route_to(:controller => "articles", :action => "update", :store_id => '1', :id => '1')
    end

    it "routes to #destroy" do
      delete("/stores/1/articles/1").should route_to(:controller => "articles", :action => "destroy", :store_id => '1', :id => '1')
    end

  end
end
