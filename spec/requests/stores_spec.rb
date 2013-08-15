require 'spec_helper'

describe "Stores" do  
  describe "GET /stores" do    
    it "should return a 200 status code" do
      get stores_path
      response.status.should be(200)
    end
  end
end




