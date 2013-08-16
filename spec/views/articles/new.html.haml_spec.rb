require 'spec_helper'

describe "articles/new" do
  before(:each) do
    @store = FactoryGirl.create(:store)
    @article = @store.articles.new
  end

  it "renders new article form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", store_articles_path(@store), "post" do
      assert_select "input#article_name[name=?]", "article[name]"
      assert_select "textarea#article_description[name=?]", "article[description]"
      assert_select "input#article_price[name=?]", "article[price]"
      assert_select "input#article_total_in_shelf[name=?]", "article[total_in_shelf]"
      assert_select "input#article_total_in_vault[name=?]", "article[total_in_vault]"
    end
  end
end
