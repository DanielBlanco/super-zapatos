require 'spec_helper'

feature "Stores" do
    
  scenario "View all the stores" do
    store1 = FactoryGirl.create(:store)
    store2 = FactoryGirl.create(:store)
    visit stores_path
    page.should have_content(store1.name)
    page.should have_content(store2.name)
  end
  
  scenario "Create a store" do
    visit new_store_path
    within("#page-content") do
      fill_in 'Name', :with => 'Tilaran Store'
      fill_in 'Address', :with => '100S from the Catedral'
    end
    click_button 'Save'
    page.should have_content 'Store was successfully created'
  end
  
  scenario "should not create a store with an empty name" do
    visit new_store_path
    click_button 'Save'
    page.should have_content "Name can't be blank"
  end
    
  scenario "shouuld not create a store with an existing name" do
    store = FactoryGirl.create(:store)
    visit new_store_path
    within("#page-content") do
      fill_in 'Name', :with => store.name
    end
    click_button 'Save'
    page.should have_content "Name has already been taken"
  end
  
end