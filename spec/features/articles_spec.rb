require 'spec_helper'

feature "Articles" do
  
  let(:store) { FactoryGirl.create(:store) }  
    
  scenario "View all the stores" do
    article1 = FactoryGirl.create(:article, :store_id => store.id)
    article2 = FactoryGirl.create(:article, :store_id => store.id)
    visit store_articles_path(article1.store)
    page.should have_content(article1.name)
    page.should have_content(article2.name)
  end
  
  scenario "Create an article" do
    visit new_store_article_path(store)
    within("#page-content") do
      fill_in 'Name', :with => 'Super Zapato'
      fill_in 'Description', :with => 'Hasta camina solo...'
      fill_in 'Price', :with => '99.99'
      fill_in 'Total in shelf', :with => '1'
      fill_in 'Total in vault', :with => '15'
    end
    click_button 'Save'
    page.should have_content 'Article was successfully created'
  end
  
  scenario "should not create an article with an empty name" do
    visit new_store_article_path(store)
    click_button 'Save'
    page.should have_content "Name can't be blank"
  end
    
  scenario "should not create a store with an existing name" do
    article = FactoryGirl.create(:article)
    visit new_store_article_path(store)
    within("#page-content") do
      fill_in 'Name', :with => article.name
    end
    click_button 'Save'
    page.should have_content "Name has already been taken"
  end
  
end