require 'spec_helper'

describe "stores/new" do
  before(:each) do
    assign(:store, stub_model(Store,
      :name => "MyString",
      :address => "MyText",
      :lock_version => 1
    ).as_new_record)
  end

  it "renders new store form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", stores_path, "post" do
      assert_select "input#store_name[name=?]", "store[name]"
      assert_select "textarea#store_address[name=?]", "store[address]"
      assert_select "input#store_lock_version[name=?]", "store[lock_version]"
    end
  end
end
