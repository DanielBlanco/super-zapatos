require 'spec_helper'

describe "articles/index" do
  before(:each) do
    @article = FactoryGirl.create(:article)
    @store = @article.store
    assign(:articles, [ 
      stub_model(Article,
        :name => "Name",
        :description => "MyText",
        :price => "99.99",
        :total_in_shelf => "2",
        :total_in_vault => "100",
        :store_id => @store.to_param
      ),
      stub_model(Article,
        :name => "Name",
        :description => "MyText",
        :price => "99.99",
        :total_in_shelf => "2",
        :total_in_vault => "100",
        :store_id => @store.to_param
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "99.99".to_s, :count => 2
    assert_select "tr>td", :text => "2".to_s, :count => 2
    assert_select "tr>td", :text => "100".to_s, :count => 2
  end
end
