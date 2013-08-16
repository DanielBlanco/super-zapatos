require 'spec_helper'

describe "articles/show" do
  before(:each) do
    @article = FactoryGirl.create(:article)
    @store = @article.store
  end

  it "renders attributes in <p>" do
    render
    rendered.should match(/Shoe/)
    rendered.should match(/nice shoe.../)
    rendered.should match(/100/)
    rendered.should match(//)
    rendered.should match(//)
  end
end
