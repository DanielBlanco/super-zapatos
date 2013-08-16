require 'spec_helper'

describe "articles/edit" do
  
  before(:each) do
    @article = FactoryGirl.create(:article)
    @store = @article.store
  end

  it "renders the edit article form" do
    render

    assert_select "form[action=?][method=?]", store_article_path(@store, @article), "post" do
      assert_select "input#article_name[name=?]", "article[name]"
      assert_select "textarea#article_description[name=?]", "article[description]"
      assert_select "input#article_price[name=?]", "article[price]"
      assert_select "input#article_total_in_shelf[name=?]", "article[total_in_shelf]"
      assert_select "input#article_total_in_vault[name=?]", "article[total_in_vault]"
    end
  end
end
