require 'spec_helper'

describe "stores/show" do
  before(:each) do
    @store = assign(:store, stub_model(Store,
      :name => "Name",
      :address => "MyText",
      :lock_version => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
