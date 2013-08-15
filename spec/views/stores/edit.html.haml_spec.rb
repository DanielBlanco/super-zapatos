require 'spec_helper'

describe "stores/edit" do
  before(:each) do
    @store = assign(:store, stub_model(Store,
      :name => "MyString",
      :address => "MyText",
      :lock_version => 1
    ))
  end

  it "renders the edit store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", store_path(@store), "post" do
      assert_select "input#store_name[name=?]", "store[name]"
      assert_select "textarea#store_address[name=?]", "store[address]"
      assert_select "input#store_lock_version[name=?]", "store[lock_version]"
    end
  end
end
